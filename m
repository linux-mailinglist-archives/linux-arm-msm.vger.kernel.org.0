Return-Path: <linux-arm-msm+bounces-114606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id unaRNa4SPmoc/ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:48:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9624C6CA795
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:48:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="RCicYwq/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TfovpT32;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114606-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114606-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D7E8930607A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 05:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5553CC7F1;
	Fri, 26 Jun 2026 05:47:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CC33CBE8F
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:47:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782452856; cv=none; b=N2c+P7tdF8CtitowyQUkoITgo/BO9tX0E72j292slM4D2Th3hAjHJQ8xM8Nuvs/Ad20Ors98wtBgFX8fyNMl0a6J51iFrshuQZHVvk9wIFbm77ya0IHA1jW1HJqhBfkYzfUpCUnYxcyoT76IFBy++UUdx2J+0yY/GqLtJsTG5v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782452856; c=relaxed/simple;
	bh=8jf0DFVSJ7Je7k8jHlxGdjIirP4qJF2bbsX5rKrVwS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S9XraHAv/STp8Sy2qrdcjjvOkYNFWEWWDMgPKzlQTRvUvoMXltqZg/e2w+i2thoWB+q4a+bVL4xQYfMbHCjPUEbv78eW1P4IKaf+sRxnK48gg9Rf0zvWNBqxPc+JXs5bE2K4UQvUIe9gqZ9pJvCzolkpRay/KnZ6QtgZ8ae1SOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RCicYwq/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TfovpT32; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2ijUb003553
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iNvgU3VK9SqPEHmQXY856VlEiaTf1HoHscC7OnnRTyw=; b=RCicYwq/JmgTtjqu
	ZhWExwsMdBZT7Y8Av1MZVlD+p0Asw+fG6wuRJ39HTXrhz/qrQVwzPH0VjrAPT/eK
	bfxFlk4z3++F/EHR7SeeoLCNjohjVGLS/KTNiRRfIskzKEqoPAV1IJeuTaKBv3yB
	HxETV+18qsjaiaGW0V1km1QHILdZuRuDQwDK/RhOo+pKxpRX8G4O2wIdLsKWvUwa
	PY5Px87LtDvidpnl22Xy5NypP/bP2l9Wi2HhyvTmAi5gB8Dgzmx+sRr3j+ZcX8Vz
	mCYBUGCTQ4znmoqasViY93MseV1YnxtD1QJdnzPJrOPEEWY0Oeh4S0X3uJ6ZDHcm
	xrtI1Q==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1fct8xsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:47:33 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8003dfff682so13962887b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782452853; x=1783057653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNvgU3VK9SqPEHmQXY856VlEiaTf1HoHscC7OnnRTyw=;
        b=TfovpT32MMxwfFd16coSkVXZ2pDvJVVZiDDYXSlskF5NAHwU2v/MGyQEYSBPmTb4EQ
         1msceXAHG6rkxmiE/Ci9GdTeROvaZGEaQ9iPKLNW3UsKRCq64yfBv+M/ASkOsehhK8Xj
         9cfWiO+fypjjh/Ye0ueoPGFA/DkYvtrU1Raj9yXkA6eYTccNu9wvMwRkbvjyclvAgSN3
         7mKt3d/r3H5eTMX4zIiwYvG70BSlFhLbgmrNgkH/aSvPSj8fBxfr6fdgHn2b5i7PtKMj
         hsovravZr6MGmdT9aGQVrs94M4dOSUQm4PYDofdUdwyx+Ca7XYrgsqvg4P8Pj8xKaLJt
         4r7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782452853; x=1783057653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iNvgU3VK9SqPEHmQXY856VlEiaTf1HoHscC7OnnRTyw=;
        b=DeM9mO/F4sElYu/VJ9e7XFL+J91KQ+bwHDcMSIAlt54fbrIsg87vyK10MTNz4PjII2
         Ga0Ug9TR857gejK1wx9g1nyIKJ6ql6OrUmDzZp4BGvzZdLQTCW7ihWhRKSKN2UuutKP5
         cE0mJw8mDnJGVgmkh1905CwIT8JYaFUNeHywxV7hGS7tY0ztHKgHBtZrwSe2upoIwPZy
         m3Gq4bCkMAYEKunNKhCyObfOPu2ZHVZ6lfebyqy2NrvHyiib9qDCfcYWKEDApMqTMxtz
         5+4wH/sXCvT0a/9BUw+0KkYo5ImjPnkg/jE2MIecvY8g2rpkMKg+SA01zdDQe+r3tL5x
         QVmg==
X-Gm-Message-State: AOJu0YwWjgUQcXu/qVyFpmi1i2OAql6OS6D/eL7/uJXzZcb4m7majghp
	7BTrICBWx1HmuP6BlyhBi4VgqWvmtvqNf8cH1pX6k5338J5EsePYXXmSQpey64saG2OrJkK2h22
	KI2Q9IccCjtGunYXc6/GJQtHGS6FDeLdbU4Ki/kvOreAUrymUVhggQoMn+SqMjvqllFyA
X-Gm-Gg: AfdE7clE/Hv9q5rdaXYAlB5CHsu8hzY7D0/Y2Z11r1b7+WUigSp7l7YULRwePc0GaWh
	smcHWtGtyZKpEoOwTMiSbIPdtfndNPeBURLIcHoNAhb/L2EdANihSFChrjwXMXQI+FbXoOtxaQp
	mD/i8aj2w6qHiBMHscPenv2GjcmI319IsZjpfgKGMBCWtF875js3p1Lxv08rbUreLuPg1IGiQBm
	aQ37dLsQUcXV1UqsQGBikzMOlDe7+qemhapjVxAP3m6GbTpTDMUwjQ2EnuTvcbqJq5KLSJdSGd/
	dRAuh+GgUJ7ENbRFSvYjnZTvrHIQEsmi4xd7sCBCOeFTmmQsi5AV1vLEKdoJNGQjHStnucnmC4J
	2Ev8lXxpYXgGU/iyfSXAdR0zgDyL25aThKhrNHC5SgORjPkdpHCmXps30ZYUpIvsBaubW9xjyHz
	Dy1c827cqPu56rgEXFTKJv8Kn1v/OvmQ==
X-Received: by 2002:a05:690c:d09:b0:7f2:9d64:9943 with SMTP id 00721157ae682-80a6b1aa04cmr56094187b3.23.1782452853455;
        Thu, 25 Jun 2026 22:47:33 -0700 (PDT)
X-Received: by 2002:a05:690c:d09:b0:7f2:9d64:9943 with SMTP id 00721157ae682-80a6b1aa04cmr56093967b3.23.1782452853049;
        Thu, 25 Jun 2026 22:47:33 -0700 (PDT)
Received: from agents-Mac-mini.local (108-89-202-162.lightspeed.sndgca.sbcglobal.net. [108.89.202.162])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-80259d20d84sm80029787b3.0.2026.06.25.22.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 22:47:32 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 22:47:22 -0700
Subject: [PATCH v2 3/3] firmware: qcom: scm: Allow QSEECOM on HP EliteBook
 X G2q 14 AI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-glymur-send-v2-3-00905324ffbf@oss.qualcomm.com>
References: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
In-Reply-To: <20260625-glymur-send-v2-0-00905324ffbf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: rgL5zKu6ViuDGfo8NzPCVkmqOetIDL3I
X-Proofpoint-ORIG-GUID: rgL5zKu6ViuDGfo8NzPCVkmqOetIDL3I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA0MyBTYWx0ZWRfXw9OpdZPAli+i
 ua8xnL+yPei9Dma/xOnJ+gqWTtXa4BLzPg3Un0Q8r+dI0SXs5SynpdRWPCjoT4nbjsZA9oSu97D
 pk0PIio/kXpV4dUQEdrl/Ms/VYf2VZg28MRL6iCVlb2iZxpW2JvemW9NyVtMS5PZv5BQ4RQNuU7
 pukPTN5ashRedS6pYJbu4oezToTbqSgLDcrdmkwb2ls/FLwvxRfK9hv1UGSvSnhV8Xs4fYELLYP
 gm0hwd9U2186qS4AaMfZYH0BXjf+6iv50zAtkuumrV4aCCAfzWvBG8ABnFnvSc/KdIQP6ExFMeq
 bCvpdHwq54kgHxHDZwkBapEHSxf6axB/Kkx9R3dq7qex/N01wTIczrZM7zaFHoOd1qn4N+mStgx
 YuTQlH83nOSZ+rmMTEyihQtB/2jo7De4VEbeH88Ceg6WEhn87xY3aGo7t5jpwLJ5ThuuDUtoH6X
 qYPvmcKdxnu7/0cei8Q==
X-Authority-Analysis: v=2.4 cv=FPkrAeos c=1 sm=1 tr=0 ts=6a3e1275 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=AgdIAmbgiPN5lz+IpyuXaA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UXNKUhSJZRFg4A5DIqMA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA0MyBTYWx0ZWRfX2pHdSbZFY8Yh
 PUuvZzMs1EfbX0k0/B0IIPPxDwdqzFPtj+GADzZRXd1LxAfzay0vlxhHnX9Ra8Nunn3AdFrQMWo
 qcW8eSptggC9NNCyuYUNfCDkDCKAbjU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260043
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114606-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:mahadevan.p@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:ananthu.cv@oss.qualcomm.com,m:jason.pettit@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jason.pettit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.pettit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9624C6CA795

The HP EliteBook X G2q 14" Next Gen AI PC is a Snapdragon X2 Elite
(Glymur) laptop whose firmware exposes EFI variables through QSEECOM.
Add its board compatible to the QSEECOM allowlist so that EFI variable
access (efivarfs) works on this machine.

Without it the kernel reports "qseecom: untested machine, skipping" and
efivarfs is empty.

Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 6b601a4b89db..618437f5aac8 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2296,6 +2296,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "dell,xps13-9345" },
 	{ .compatible = "ecs,liva-qc710" },
 	{ .compatible = "hp,elitebook-ultra-g1q" },
+	{ .compatible = "hp,elitebook-x-g2q" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },

-- 
2.50.1


