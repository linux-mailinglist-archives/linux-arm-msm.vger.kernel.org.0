Return-Path: <linux-arm-msm+bounces-92243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFdaK8+siWndAgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 10:45:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D0010DB4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 10:45:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67764300A62E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 09:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47BB365A0B;
	Mon,  9 Feb 2026 09:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HHrbrj97";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f7Hb7Faa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5CC3659F5
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 09:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770630332; cv=none; b=twDIF1aq9cuC0J0FKYyS++QPdmvzzO5Z7usyO1NUwjBijIS4j1dguid/AFK2tFq5FDPNsqxqlNUoV4sNS9EfqOiehyTIqPGevOGHYGZf0F93oPQhTQhnlO0xtoRX1vA+Pghu4IXh+3xuhYOYUtFAqfbOGPNulVAbuH6RzHMm1eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770630332; c=relaxed/simple;
	bh=o8/PIwBkeR9gGZN9AzJuVfl1qjlAeL97uXZ3IGiXXWw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BIaJ5MNMDWLneizs1mizlDXFKmi1IVeGzuf8wHjhWx97IsPH0Ajc03i6+3DjpVruzPEbubsH9C2HRxNW5cIwRlGeaAmvD4BI0VbiWnXY41pinD8qzC9/QgTAuvQwjSnGC6tB/mMNXwR/me9HUd9dPrvW97zZyMRflQBN99fH/DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HHrbrj97; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f7Hb7Faa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6196CLEu1843511
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 09:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qYzEtKoNBuZqtmsV3pmFFT
	0RXM9nU8ROe0dGkQ4Koww=; b=HHrbrj97JdzKc3XoqD4dhVOmanN2YlEqfauHZI
	RoXsHxIOutF3BCpX1zU58nKg9EcT5F3LSYdobLCT76quML4LHCgtVqL/88KbIDRZ
	UKvF7K4lBUWSrOSs8S+diKLpl+WoKXgpidkUi0dfQ3sGbSy4Bd+zk2PuvSC9xHIx
	6F2AVSuejSANx0i/BPTdCuA5jK8L1pGVfxlVGiz7bQohe35iUFRJolqZNVOJtAG5
	WfK84kGct4QmzRmCrPH2my0ppOb78UCgLdbwuMAiL3jeB5P5yXw+LJMErSEAJ+oM
	dETX5B1HSF+IDREB67Swm2Kp4q3ablFnoLrroUfsM4r2nweg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c6g65ayuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 09:45:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8243a06b397so1970441b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 01:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770630330; x=1771235130; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qYzEtKoNBuZqtmsV3pmFFT0RXM9nU8ROe0dGkQ4Koww=;
        b=f7Hb7Faa8RjjQKPTzey/9izP6l4APDA7IQYryvMBckGdVELE6rIon6jpelqQUJNcje
         RWh5qMQZgaEZWPiA5JXGylPBS6OQKLuvFfFB5LFxLr5gktead7Esp4nAM63hZPt/snH7
         fEhl4Af0TRCXnTOgQVMSM2dZFQbRday4KYrsR7nw5ZEFVyiEgJvMZ6LC0oHJV90DB7OU
         qPYOFH4h3kfY3wctiRCGIjuur/6RxSeK3YOVxhvVNpqSOH6wLNqo1bdD+hAd6B9X9HpW
         8nH/3qQbq0zRYJqUwCPXoXJtYYb/mnDpaZ/j3qkwUYPS0T4Jw6jAPzb/AMQFYkr9bs00
         /I+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770630330; x=1771235130;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYzEtKoNBuZqtmsV3pmFFT0RXM9nU8ROe0dGkQ4Koww=;
        b=uTaqXi6GxnsqC+0mp6n2WCtIdxdCXUL488W+byD+0IDRkTWDW3F/GpX2paKUF1SYkl
         cyGpRsEnK/Cks0gNH4k3HYGWewoM1+9ljuIH8zu5/i5Db3rQPK/02zheVHu5gqsqFn5U
         JF2Q0PwJ5/TQJRT7BUSbR5IP/+UapATz8VI9StZboSBOmuNvHXv3srC+HPLlo0JasOCE
         y19Gpp0C2MRtA1OO424yB+LvsZdZGkjtgVm5ockBkSeTg5RKn+CnqDJ0V9IF43uw/uMJ
         ePLnvWOMUtxM1lfQvaHOnPORVGby2Eac2eSvM4inFOapmQ/zW6U2q5f5h4FDlKWShbpg
         X9zw==
X-Gm-Message-State: AOJu0Yyk2XvbPzTLIVF5DjPh77bUrgvXBujyU0FtIZ66WsCbqBOSAu9u
	03RpqVlci+KVuinRvuLIwp+IwHspRp+2LM5yyxtrCuFHVH5a8Ppwo3A9INI3BaTGgp7BG47BOqC
	Nt1RjZxzCW8RqgtYbP56PYIXxLTSn3qYzKIWFJ0tg6YElQ7k+PQXpdQo4GbZCEWTCGLJk
X-Gm-Gg: AZuq6aKaCzG1ZDLi0OzQnXZUui/iFh+JPQpwTa/w5O0YTDQi9T3xtdUEnjO8LXxe8bs
	W6vrGQGSWkhhHvxNH7CpAj/xZjW/dS1vG2RxAS1o870E7mjyfGZ9ZEDkVja1dJXLreSPTYuI21u
	fqT9PezXnGSVLtC4Lnfedx5NIPhYdJ6bQGnmQGYI9sKy9oMClR95MGhkTxcHreOgOfWGmNejAQK
	NPT4SStlt1PGYAWBudi7gTu87K8Gg1xxmld+mxdA4PVoyE/F83zulPqPFICN31AGAkTS7izlW1I
	dMtr+2TUTEi4ae4/QhZnteerkhciLDojJcdRoCL89V4nleniQ/GCG7NzGUMMuHI/x0Suy/+Th2q
	pYjVikuRoiHX5tMr3kmYR90fpy8uOawBs
X-Received: by 2002:a05:6a00:3e10:b0:7f7:6229:fbb5 with SMTP id d2e1a72fcca58-8244163d0dcmr10777015b3a.25.1770630330277;
        Mon, 09 Feb 2026 01:45:30 -0800 (PST)
X-Received: by 2002:a05:6a00:3e10:b0:7f7:6229:fbb5 with SMTP id d2e1a72fcca58-8244163d0dcmr10777005b3a.25.1770630329807;
        Mon, 09 Feb 2026 01:45:29 -0800 (PST)
Received: from [169.254.0.6] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82441884b75sm10748666b3a.39.2026.02.09.01.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:45:29 -0800 (PST)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add interconnect support for Qualcomm Mahua SoC
Date: Mon, 09 Feb 2026 09:44:27 +0000
Message-Id: <20260209-mahua_icc-v3-0-c65f3dfd72c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHusiWkC/23M0QqCMBTG8VeRXTfZZpvTq94jIuZx5oF0teUox
 HdvCoEX3Rz4Hz5+MwnWow2kzmbibcSAbkxRHDICvRlvlmKbmggmFOOC0cH0k7kiAC0Vk8dKKa1
 ZQ9L+4W2H7806X1L3GF7OfzY6ivX7U/hOiYIyapRswUgjodInF0L+nMwd3DDk6ZAVi3wPFHuAJ
 6ABLaBhuuy4/QMsy/IF4ijpbOoAAAA=
X-Change-ID: 20260120-mahua_icc-76054966880b
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=GqNPO01C c=1 sm=1 tr=0 ts=6989acbb cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Arc9D6tUohrwRZOLOYkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: HzcoQUZumVbR0aFnIilI8KxpGcwuhBFV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA4MCBTYWx0ZWRfX68Pe8g5ISvT0
 TdY8fruWExTsh0Z60Wcpsio3VnP4uzu5v4qog2ai1npjQMMyCujvuIhNMvjGFKcKzwEAqlOUnsN
 yA9P0f4HsHijvDLPBs4IMEgqJBW+vaHgP+n0g23/ll5PB/A/vVROl591JV3Q2IxnI7H72VXOOiT
 usUPxsnrKc1EKGa4iyZ/HeT5/UvfrKOiuflODAJKPHpHtXA4B8P5JOoCYZ0dE3vgJ8kPI85JnC6
 tzh+PFREEjto4dDVwHVfbSRxfFHkpugIoNV9Uupz3k2qDprTGz9Df3x1MV2Aqymn/xdRdgVTy7q
 EX+BM6e1QdDCQunqC9SD9T3mzIn3fn32wDwFUBLlGOXlJ5IdVjs/SkXuZ2OkXeSAUG1GgNu8jd6
 Otloban1Xe8iRDditl0OGsJQgmbuaqGqrHfkMh0uZs0QT/ttmCvpzDuGkkCli+WpJoJO6L6nyct
 ju/qkxFqGx/1nmUew5g==
X-Proofpoint-GUID: HzcoQUZumVbR0aFnIilI8KxpGcwuhBFV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090080
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-92243-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 55D0010DB4E
X-Rspamd-Action: no action

Mahua is a derivative of the Glymur SoC and shares a significant
portion of its interconnect topology with Glymur. As such, this
series extends the existing Glymur interconnect driver to support
Mahua, reusing common definitions where possible and adding
SoC-specific configurations where necessary.

Device tree changes aren't part of this series and will be posted
separately.

---
Changes in v3: 
- Sorted oneOf/items blocks by the fallback compatible values
  in the binding schema [Krzysztof]
- Link to v2: https://lore.kernel.org/r/20260127-mahua_icc-v2-0-f0d8ddf7afca@oss.qualcomm.com

Changes in v2:
- Reuse the Glymur device data for Mahua and override with Mahua
  specific values [Dmitry]
- Update the commit text to be imperative [Dmitry]
- Link to v1: https://lore.kernel.org/r/20260123-mahua_icc-v1-0-bc82cb087f1e@oss.qualcomm.com

---
Raviteja Laggyshetty (2):
      dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Mahua SoC
      interconnect: qcom: glymur: Add Mahua SoC support

 .../bindings/interconnect/qcom,glymur-rpmh.yaml    | 136 +++++++++++++++++----
 drivers/interconnect/qcom/glymur.c                 |  38 +++++-
 2 files changed, 144 insertions(+), 30 deletions(-)
---
base-commit: 6cd6c12031130a349a098dbeb19d8c3070d2dfbe
change-id: 20260120-mahua_icc-76054966880b

Best regards,
-- 
Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>


