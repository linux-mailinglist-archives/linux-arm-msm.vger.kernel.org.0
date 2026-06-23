Return-Path: <linux-arm-msm+bounces-114147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TDBvC49aOmqC6wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:06:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ED96B610D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:06:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="acDN/84t";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DxVFnMFV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114147-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114147-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 28E10301DB17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91C137268A;
	Tue, 23 Jun 2026 10:05:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FF536E488
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:05:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209144; cv=none; b=PjVD32Q90zDsoA1IvV1C1q7zrOODfPej+H73a00xS317EIulxk+oKHNt6aVr32Zi07jEnrL26XQd93z//Bk2nvoIidEfiVA8KZMVCEQPbid5a7NIQgP0VZlOK3tYhfmbS4f5u1lyzg1BstkFXm69Pme1kABYIA60RnmGkzJvOak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209144; c=relaxed/simple;
	bh=rojkdL9HdJ8xwqHtrA8vSCQ/5DQ4D7fL/dKa23jycp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VZU3QDMxTSmwzUaI0sbETshO3Gt1ier0vyzHeC/ziE4ec+l3RISf96EnTPd19kWI9c+W1gomUAgNy1e+GTA7Ksmn/34VXdGUqfL331H8mEFwz4Vw4BaWVaBFBVZutVNS+thviCC/GCBIYs4DdLDYYNLwHfBIsEOYIUXaZw1TYD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=acDN/84t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DxVFnMFV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N9KVDv3919007
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lxdruZplTQcy47X9eQcAz6WzLI22oSqo7+jwO6S1zpI=; b=acDN/84tyMJDKCqf
	NpkvDkIu4Y1yiJDtNiflg21n5w1puD/MKVS8MhcUJdEP3/ewnH3IJtP9bl0LPkxy
	tNMOslvezK81/K4MFDVCfs7wp2bsTHEjQhSOdZ2cBTE0/8OVyf9qupYe5jSsp0vQ
	4lUJwOh81CPpuZxW40vvoruA2rcOIgSFjuEPZ3CkQ62GoPZqIu/cIFNZ7cN2MCgH
	ODMzenMiSA2GA8Fsolhxy9hm091D2KdBNciS1ZSedK7INsqypLESzSjM6aS4QJY0
	WsW8W+ck4es9vOn2QVpb8jSXX3Nm5+QjfbZBkIENwIi2YkGnvdV8wyMsZDRyuhl9
	id6PMA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe687xb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:05:41 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso8736619c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 03:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782209141; x=1782813941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxdruZplTQcy47X9eQcAz6WzLI22oSqo7+jwO6S1zpI=;
        b=DxVFnMFVl6JMR732LVQ/Yl7MFg7GtcIbs3rsh+PgrjxBkxKRi9eMK04U/CTjLC9URz
         GQKdE8nWOVBDg6D37SUzu4I2SSSfDCW9i0AHeMjxpLh+lJryJ1C7x7eSVokBCN0dlh+l
         HpFQihpq6UpKyLhgol71PUHHKtFkPiL54HctRbB49nUaKQVKRgxDxE2OwtGAE/x37euL
         Kql4bSiPkPfO/s/cgblHoTrnbwLDyrDCQAsxtbDGh/irxlkiZRB0ckyFmUWQaqkWNioU
         6OEA7fachtF1POgi6mtlaXKQIAGu4q3gH+8r+h+QwL+Pu1QLD9mA/0trnGA9p4i5azcv
         MRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209141; x=1782813941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lxdruZplTQcy47X9eQcAz6WzLI22oSqo7+jwO6S1zpI=;
        b=ADvHXZAXGU68OmEHbCv3yb1nSJ5QJ/AZXGCyl/xz89xckRu64ZIlPnGCaeTFwpPJPT
         OrEpNp30XWwhh0FLEoPOVe3DWAZTqglOoTVgXid/RANwAJm+oyJZTQ3q4GnQVkrUp2tv
         6RXM8g3nZsA+V1prErC7euPKKr5Yiis56VgST5mPlfOECZlT8QMKkwvCnLSUpz1Gdjtx
         HZKCsMWxnBO6zpnV0Ri5CwbC38W+Ir/gnJ/8H7DoxKxHoiLRtq/MI2BEsT3z64QRsWeP
         C4Yv00YflSS8tKASjM5GXJG1XPRLc8ol3ibbdR3LTrqstV3jzc4kOo/ZJRMVPkgvvjHB
         raSQ==
X-Forwarded-Encrypted: i=1; AFNElJ/foL6jyP33x2FdD7ttmlvypDtOkM7Xd8bT3WqHF389vS+1T5ciE/qKzPmU3HguZDgFhs6M7lYoJ26xcaqh@vger.kernel.org
X-Gm-Message-State: AOJu0YxfJV3KMi58KnyxNentDE+IJMu4GmshA0ikpnATIKdImoUk4pKr
	lD773Tyot039j1FNGSuwSiQ3OnE/f7Z+0vobCy6v9EoJdIgE+I+UIFoKmTBc/wBtfRT9mBCmRCS
	kGlqs3zjAHiXPysd33Ewytiu6Z8QwZtDEsVbZ0+iokUs8icoC6NLx7sTX4q9cIDBhToQC
X-Gm-Gg: AfdE7clHEeZrxbNFmIyKqP4hhSDxBqIzZ4Q7aLPBmce9WmaQAaqugtZauVRo911q+8W
	D9UgCiGvSw8nCA9dONLpnwpFque1h2auZY4M61UEASABfBcyvC8b11BUcCFtsY7OJd2RPZeZJk5
	zGRHWeG70FYzcEV2DWaWYAptDPn9lschJiG85fKfX6PLSts/AHksKO+akiGQeGG5t/yu/T2oXif
	qL6OERcvMv2+GpUFEGlaeDDWpjbn9HwTo2khHJncDJ5BOmQ/BqsNaZkkOnGsiOvoDiHK+NsCvQX
	MlWYqFOitiogCqyZEyNBqjB5U76Li2Ri+JDSKmhutlrqT9UmoSET8RMjo+UrtKfnWVgmrt/z8I6
	++T7gk/IWgAA4vS2wlbGIxQJfbnA1PczcygEBWBtS2kBaqZIdmvSeEhnkMmelGA==
X-Received: by 2002:a05:7022:609a:b0:138:51c:c5aa with SMTP id a92af1059eb24-139a367c994mr10792771c88.27.1782209140766;
        Tue, 23 Jun 2026 03:05:40 -0700 (PDT)
X-Received: by 2002:a05:7022:609a:b0:138:51c:c5aa with SMTP id a92af1059eb24-139a367c994mr10792750c88.27.1782209140242;
        Tue, 23 Jun 2026 03:05:40 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add5824csm11607495c88.10.2026.06.23.03.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:05:39 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 03:05:20 -0700
Subject: [PATCH v7 4/6] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Hawi and Maili SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-knp-soccp-v7-4-1ec7bb5c9fec@oss.qualcomm.com>
References: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
In-Reply-To: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782209135; l=1142;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=kVZW6MLZNlpei8K/F51SeFGWZUnYzxZeJH1Eb6nEyLY=;
 b=sJ+4ktaC4M6PlBcC3E/phsN9o/m79MIoi+upWAuG9RN/Bb5FHEfy0ywOUjLumMZTSIgMFVjtU
 jpwAFJqhHgfD0UweuaLuQcEwAJ21mNeDp5hNuTajXd20fcOcXOh6uHa
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: k_9h5e2BGn7dscM4kOi5iDS935sD_NMT
X-Proofpoint-ORIG-GUID: k_9h5e2BGn7dscM4kOi5iDS935sD_NMT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfX3oTKlhbQ2pSS
 7gaXl1Ju2ishFg026EdJswlWM0kgKhVv4+6MM7JE23OAyGWi00qlHK1cdRVu8cBgTwRIaoB6Vre
 5SdFTicNhTImS/vbImKezOnqGgp0hEo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MSBTYWx0ZWRfX1eWrTrBrgNsy
 mcbBtacong0Lil4Q50N9PZaEvmORA5RuH+Wp36nAsgo6q73kI215tJf4AyGVYN2s8HJQaMwHsiV
 zE+go1bBLPm3nQOkhnPpC0Pjwv4IIzlVLazBIJt7/axRccwi0rv3P9WliRd8CxpbK4e+88eR+66
 9zuwddmNlq/Kx5+bCPPqoySSHmLOh2BdBWHfl2dhU/b7Nph7ULyM8cxTqIrD76MV+CXZRd7KQrh
 oAhsu4iYHxko70DB0M+mr4RynzpMjAutWaKN4FXwQvoHvXLRZ11pZCifsoALRDkDz7O1QWBrPxn
 Dgswt/av0ymVghPuWUID1nTxOiLQWqvQwrk3290FDwrSmkuwCJEEPCm9/WpESOL3SpcxKk8XJR8
 WBix/PpsanlM+EYrmxL//zgqUE6Xor7K/Y0hIKM3vL/GBqBFjxMWL+c68F9JYELjWoevrTkEjYq
 qg85aGZvggM6TSjGovA==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3a5a75 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hVlIsfzSNREJ4Nl6LHYA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114147-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:luca.weiss@fairphone.com,m:brgl@kernel.org,m:bibek.patro@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:konradybcio@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 24ED96B610D

From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Document SoCCP remote processor used on Qualcomm Hawi and Maili SoC which
is fully compatible with Kaanapali.

Co-developed-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
index ce18460a949f..8fd6913e414d 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
@@ -21,6 +21,8 @@ properties:
       - items:
           - enum:
               - qcom,glymur-soccp-pas
+              - qcom,hawi-soccp-pas
+              - qcom,maili-soccp-pas
           - const: qcom,kaanapali-soccp-pas
       - enum:
           - qcom,kaanapali-soccp-pas

-- 
2.34.1


