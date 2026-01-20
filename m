Return-Path: <linux-arm-msm+bounces-89842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8F3CF81acGm8XgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 05:49:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE2451317
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 05:49:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 144D8906F4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 13:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F7E43C07C;
	Tue, 20 Jan 2026 13:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Keb6RnWV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q+49glnK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8B643C061
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 13:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768916300; cv=none; b=aRs2i8RX8KcpoZwL7mqK3CoOR2DDw1lYX/iuC1O0yM5ycn9QEGtxweIfW6TZ4q79LtxL5Z/MAqsb3mSMm/Vw8bFBZSh+2sotBIwg9daX1nevHoSIGCwI/VoZpZRVge0MzjxJl1Qbl8XKPUxr0Jyuqjp1fTxKYZO22Cejfncgctw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768916300; c=relaxed/simple;
	bh=qsHYpCRnHkR9B4hsaDF2UxeZUZc9qiyn2qq13er/Eo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bUMQWOgA83CIPyDvoO018oUDAMxob3J54zrgc0XrpvFz8OUrdvnNZ29a6gM730TYm11bBi18/nNJEyohTnoC+Y159Kmk0aXNMVEFEkNdNPW/+Dz0Qmzq1ycU7xk8itQmNwe/2ViO0ntj1nhYovBazW6t8MBDc7Fzw9jZXizYbwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Keb6RnWV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q+49glnK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K9A2dS3257508
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 13:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=267stE2GFuXel8U/+66Flp
	SLqJa+/S4BZouInklqODc=; b=Keb6RnWVf5omLaHbSodX96ZoHrYUs0Trpls0yB
	Gyz0EkmLp/bipEmk/cFMFGXkfarp5s/foRVA7UTXiGPmD0x23Sur0s6DIiEjIiKD
	slfCoZkKrvRB1orj144bjwz16MXziKUnMtEz2FP+hMhFXAOSd3PnghldXrAymoC1
	sK51s2ctpze2jiY83ywHkWHVOp6EbwUDtpHdNgSCDlrzzOWmWN5A1/1MmJ7bL6Xt
	lO8fHne+giMUxjwmM61/NY/SdKG5yb/ZmofIpQA54Qica3BHOxM3f/CzZ3LANtDM
	n08g1sZzwzPvMYY3IPZg1akWJBr0E1C+j3rWjsQQl8REEiQg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt6u7rqyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 13:38:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0bae9acd4so38312635ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 05:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768916296; x=1769521096; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=267stE2GFuXel8U/+66FlpSLqJa+/S4BZouInklqODc=;
        b=Q+49glnKRNDhAODOeogIsq1UInd3/rFjHfzUud7+HwdFDl7OT8Efnw8akDhEN3iuts
         CfffQQAvobHOHSmrOkPzU+1eriKxofrmWP4VekwhqIFZ3oEY/BoJVEDFrPDw0DasGVe1
         pk3XaaAbg1t2T2Hg7X0iOPlLL/hmpcxUeEjlLAwiGzv1gzQ6xs1f17XPa1XKI6lvVE/M
         BO1RG8qQ7fX4iG+GG1maRrVuYNmNHiu8Z5wUgE6NWa7n5UPVrQBYkMuZ9vOGTMx6L/ZE
         DiLh2IfIUTuW0PlgD5Xff9e6jNM0GntoFmCEP26QJDqLMZSg/aqYuVG2Wevn51XgY9qi
         MNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916296; x=1769521096;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=267stE2GFuXel8U/+66FlpSLqJa+/S4BZouInklqODc=;
        b=RwEXbmQRdHnRXNwIDOmnuibF27QHK5XYk9X2WoYImbA2zfg1HDhcY+FN7JuetdmwYm
         TFsGvzCbRlpm8pvNe8gbV0106YX1QuKOgaZJRmbwzeKy7luD68vjJHkBIV88bT/qwoT1
         O9jooma7TzWAaNnl3DTKOUa+54uYA7Lb0CbWdVxeCWjaycJaS7Sr79OFlI0yDKxGpxCW
         b2/qeeCa5pGU43/TaUCqAFINqENagSv/V9xm+zJaE8//y9SyAB4T1NFXVCpHLOrBvRgz
         iDavtpQeCOfGUQy1eG3Vp6H8egY4TZrI7n/6lhp9PJ4AexCmxGzGxfsC3KxZoAxT3Iax
         YZtA==
X-Gm-Message-State: AOJu0Yz7RIRgN32O5buEAlJB5KMirPx39s2cFJlflibZd+r1D1UyZULT
	ni0Ico3MLDr6yNUUcHKAp1ERhh8QtEiXJhJt2fSnlgodM2IjJnuAuec0CqNF4/LRePCtyPol8Au
	v/o42h5sjvhvEb3hHqRgHMxjNv51nhd1PQeDucHdPywSTwSA/SG1+Om7NGVfXtVXZvoFh
X-Gm-Gg: AZuq6aLAnxFp0F5nmKhPTkeKJSctv4023Txw6bdFTi8zNhPHlX0jo3Epwo8C7bMzjKp
	oIjhbhBuxGKHm79nynlHQ4pAVNHxTJoa3PwxV7hN6AeEf0aD+NGxtwKSLxWiVAUFUjLHsprIYu5
	ncAtU8O6Q0JUba+Dm471GIoI0oFYn4UOp9QdrhXcnHyBBie6mpYDQCwIw2Taef1qdqOyHH9LjFK
	gwtdUM9Qw+Wmpf6xTQHHHxyfAluAiXwyTdwrYAY3hbzmvaO6nqvEjPdwWvHQIwjOiZQIkzCtfPC
	AfXpwRSL/tp6ciec6i9yUW2YczzCgSXGbB467yYCjc0IacdFlUavgD8HWRJkJCbnm081GB1qVwm
	FGzu1hsz7D1gEpDd9Qy0InngTLWFFbNcdL/gvu+ENMW/dQBW730O8CylEB+ZVzeyjt8P5ytQeLZ
	lYXnd+LeIAsygLnuDRz+7cu8e8UzPoMG+C9BHU
X-Received: by 2002:a17:903:19c8:b0:2a0:8f6f:1a12 with SMTP id d9443c01a7336-2a7698fb4a5mr17389605ad.17.1768916296180;
        Tue, 20 Jan 2026 05:38:16 -0800 (PST)
X-Received: by 2002:a17:903:19c8:b0:2a0:8f6f:1a12 with SMTP id d9443c01a7336-2a7698fb4a5mr17389275ad.17.1768916295592;
        Tue, 20 Jan 2026 05:38:15 -0800 (PST)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf37b380sm12036532a12.34.2026.01.20.05.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:38:15 -0800 (PST)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 19:07:35 +0530
Subject: [PATCH] dt-bindings: interconnect: qcom-bwmon: Document Glymur
 BWMONs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-glymur_bwmon_binding-v1-1-57848445eccf@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAB6Fb2kC/x3MSwqAMAwA0atI1hbaLlS8iogYG2tAo7T4Q7y7x
 eVbzDwQKTBFqLMHAh0ceZUEk2cwTL14UuySwWpbaGO18vO97KHDc1mlQxbH4pUrqqpEi+hGAyn
 dAo18/dumfd8PUOZDz2YAAAA=
X-Change-ID: 20260120-glymur_bwmon_binding-d6887b2bbdf1
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        rajendra.nayak@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        pankaj.patil@oss.qualcomm.com,
        Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768916292; l=1131;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=qsHYpCRnHkR9B4hsaDF2UxeZUZc9qiyn2qq13er/Eo0=;
 b=GOehMMGTepIPP9nBawCSmRE58R095vP8GAXG3TBLjmkUoJwOyw8qOrQ7tgJ6+Orm+KOnER05Z
 ihk4GY7dMtNDpduzS2iLZ+HiXyRvd5cX1YRXMc1ZUxJjIkETyT2UdQM
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Authority-Analysis: v=2.4 cv=P/w3RyAu c=1 sm=1 tr=0 ts=696f8549 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yciQ9CAyKdn08I1YtksA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDExMiBTYWx0ZWRfX8T5WPcPm3Cho
 fE7dtnDXbX6w1/2dtx9CUG5qYbwfcwNZDNRUJ7/tcy+uQo6PrFIq3fq/gYyIjbx0HnAqAaitVTH
 4MBirL1gRQ3DsDPiZirkQKkMwBHwov4Bv/jEyFe0XO03Lqnbb9PYr3FZb9Zd1M90D+BS3rgjQK1
 mAVHIm29bCEX+tpcV6arFf0txBcEj3r2nBHtXMgifisLBnnzMfw8KMdmR5KVpc2VcgU6cg0us5u
 IFwv2NBbJhdCwMrWofdiYJoh7SJ0/MOdFFbV8Bm2xBaLls9uuSdjb3qb/gwyKaR5ukvCfjHfShn
 aRVx0KEN9L0hvYGb12ub3D/8+B+1p74TLE5rz4nQO9IjipSHgIcdxtRuiUwRfVWui2SW1g2rTAE
 lodm+KUDrRqo/YBcDbEy0Jvu6f301b98lAUP4+F30dRYOLI86cCSes6tdHZbQdsjwCw1U+bvEq4
 4cdwhnh9gSzx8q7bKMA==
X-Proofpoint-ORIG-GUID: 4OcoswNwSWrY28uPEnaHnMKM5AnSlGpB
X-Proofpoint-GUID: 4OcoswNwSWrY28uPEnaHnMKM5AnSlGpB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1011 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200112
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-89842-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CCE2451317
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document Glymur BWMONs, which has multiple (one per cluster) BWMONv4
instances for the CPU->DDR path.

Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index 17b09292000e..ce79521bb1ef 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -25,6 +25,7 @@ properties:
       - const: qcom,msm8998-bwmon       # BWMON v4
       - items:
           - enum:
+              - qcom,glymur-cpu-bwmon
               - qcom,kaanapali-cpu-bwmon
               - qcom,qcm2290-cpu-bwmon
               - qcom,qcs615-cpu-bwmon

---
base-commit: d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
change-id: 20260120-glymur_bwmon_binding-d6887b2bbdf1

Best regards,
-- 
Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>


