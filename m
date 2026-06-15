Return-Path: <linux-arm-msm+bounces-113120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s7+VC6e6L2r0FAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:41:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E280684A5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:41:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="AAyL/bzO";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RDwKELJN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113120-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113120-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D702830435A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 015513D1713;
	Mon, 15 Jun 2026 08:36:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E6D3D7D78
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:36:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512565; cv=none; b=IdSwyMHBZDcplXuPnK1+SElkH3/4K4l9wuiuLVeGSuTuvIme/0kJgw4nkzQr8iJklAgmsar0IIQtSKblmDBPAZ1YgWZCoLIp1Mi5PAADQxlunNJDGhr83Dt5FIlbhQyAdusZfOAFFHb75P1vDeTzXuVfUpLkWrOi6jwyNrRlgFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512565; c=relaxed/simple;
	bh=hBDK+t7sZBnTDtOjkj84KsZOBvFHMonhdCwtWPz4c5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XYN0xeHh/N08TumyvpMVn8yOBb2e6A+BKeB6a7ACj3ZK92XtY6MfNeznP3GSvHI7avSMrxWP3kDpX3mi+JCxrh7k/HMBMzgRseQdoyuFlBq35tQPJXJ4AYiXXXDdkDyB61l1WyI+aCBwSSR2yIhK+adY1U4j/tF9gOTcxE/P+Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AAyL/bzO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RDwKELJN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6LiPn3853173
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q+gZ8mY+aqE/4HNVT63SJJoWIum6T+x00lgzmR2pD3I=; b=AAyL/bzOMh+aA+RS
	Ho51Z4g3xDhJRfaVgx1y96drsYgH6F63x/QiIvWBv6tV4RpUlxDxEGFmD/L9KvP9
	DJLaCAKrQFZQXBllZML2fSxVfELKbMEFazsXnTrAlJZzuujWr3CwFteWVe0sOYNT
	beeMKT/LhGrE+lmrBieu6hOnjeVPi4GHN1Zq3IgxbVqUG7g+qx09vq1xHx/Mn6Ml
	bl4wxXulxs/uxKYpUiBRI0biqQSMWs1GK+CP43r3qZJ4XGzK5a2sYxMVmqCwjKDS
	YjbSso13dZSQMhWRFoCi6y05i8+KxTsT3pZPnG80zNQra0OMaMlGZuTzOqSMfJYG
	FuJTpA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7gxggm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:36:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d6389bbf4so3385704a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 01:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512560; x=1782117360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+gZ8mY+aqE/4HNVT63SJJoWIum6T+x00lgzmR2pD3I=;
        b=RDwKELJN7jIqYmh6NrxjyDvwSGo75W6Fx6AYBAw/vhhBgdPIuo6BkIFfe/WYLZXMGw
         9YMiINZrP/Azbncg7n4IM5tPFPI1BYmtbiHE/on1XUsLgSg7TOv3duWjebj9Xatjqlvl
         DawgMbqy8Tbr2WWNnQNX5aD5fG++TqHYcF85tzM+eRP3mBLAx6HzOWSVizNZ6XfneX8I
         wh9HiIWFrMJsXTiGSi04dGruSsQJqubVqRewDc/pixgpULR8sB2vdQmmj+2Yp/i1PpNE
         VqkyxzBN2Cz1GamfylLT3SaIIsVMzkiA99iF7ByH0g+Jg5izZ0UhMXtbw7zAKKNXKAay
         agMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512560; x=1782117360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q+gZ8mY+aqE/4HNVT63SJJoWIum6T+x00lgzmR2pD3I=;
        b=mFaUAqFZuZcJzfCMbjgUDlUCuaynYryH4cU383LIV+nEqcX5SgLMefU8yU6UZwSqdW
         G0TEpaTMlFivLQbenYSr+Ga5ln64GU4OmxUjO41q+izM0X0oeNM++gE0AskG2+o6PUpB
         ZBu7ywt//v0eqyfdjIEkRPg5pjNbJG+30oHbKkLPQ1ZbSyWLdTiWOSJg6DKgLc6MHI2J
         8JzW3oow69nOo8TTo9lvDRhdbg0zXKJFbpjUqgHAn2QtDCx/JbkavyJnfmSCnlnsfbC7
         Oq0oxfiD1+T+T1Hxt+Sp2QhN/3RCXh//hU0/rlnQmBfBV/DhdwOq9WD+wGSg/u7Vl6YF
         khZQ==
X-Gm-Message-State: AOJu0YyrnYx4qf4jTjnOyCOyD3Vs/ppB7R1KC2vWLEpCJSHOqC9COUtK
	kP37CmBI1+w0QPbXEtVrcm01hTI+ZMxi2qRMuRmyRaL2xCZq1+TncDj3FfSV8e1oYFlVj3N3Aed
	r4GC7+KFmbznXztyOtiWBeJBcTdyN0QaJqArI247nR89Vepym3C5g/ZxuL3PlxG0RkAlA
X-Gm-Gg: Acq92OHLLsIdxXbbJg1xRlxzKzcVKf5guMIUXakOcngDpidqh8wENpgDRk8LT8HytgL
	6TR8O1Fpu+5uq6lkAuhayqbBEP3xDyJKPn52JacLu51MZQZbJfrGepLkb55OvfMtVv1+C0YEa12
	OwtMgc1MbISd80elPWgeShA/rCs2KfHO/X8TTsuFUh5c6IaQk6VnYo3HasYl1YcUu7kuq/pc+F+
	PuX/ZMtLHh6WdELfDXbcHF0j084BsCKwM0nZICSkYCgh/PpabxXFYRIXzOsxjAvpVm/qr7UF9IK
	wSBkwO1jwGJTQJjvpX9G27mDqE/6uJwnhzMGUowNlHEgvu6xd7xrDaAkTURusi7vZxRY2KC1deV
	W8gpoFlITHoz7SujmK/CvbuGh1MRdQFRWDzMNP9jmFwYmEViI8IiezAEtq2TUEGYk9+gWu6Um6D
	uz2Yv3Pjqn31NHyhdNZqB3SfskHI/+v02whtDTlesmJuREdtFsvWKiKo9F
X-Received: by 2002:a17:90b:55c7:b0:36d:b680:3036 with SMTP id 98e67ed59e1d1-37c2bc42809mr9306041a91.4.1781512560478;
        Mon, 15 Jun 2026 01:36:00 -0700 (PDT)
X-Received: by 2002:a17:90b:55c7:b0:36d:b680:3036 with SMTP id 98e67ed59e1d1-37c2bc42809mr9306018a91.4.1781512560005;
        Mon, 15 Jun 2026 01:36:00 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a210ad64esm9558974a91.0.2026.06.15.01.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:35:59 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:05:47 +0530
Subject: [PATCH v3 1/3] regulator: qcom-refgen: correct the regulator type
 to CURRENT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-ipq9650_refgen-v3-1-5f611623629c@oss.qualcomm.com>
References: <20260615-ipq9650_refgen-v3-0-5f611623629c@oss.qualcomm.com>
In-Reply-To: <20260615-ipq9650_refgen-v3-0-5f611623629c@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX2oHubXnQlaSW
 xtkbBkHzKl5EVyrM/oN4AwXzbSHCeuGAhLBSUOukNnYeEvbBmB3RHGSJsGuYl81FsWds7sY5giJ
 GIvHRlMnCavteZH+WbrkPYSy0ij+HP0=
X-Authority-Analysis: v=2.4 cv=fLYJG5ae c=1 sm=1 tr=0 ts=6a2fb971 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VkQhxhI6jZxeKeB4iE0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX7PvItF3tLjYL
 A2xWoPqLzwRK+w+paHo6n9LLkKFvQ4psRp3CQ2yrrEuWeCBWBU9m/cJgaDxJbNunV+bS/yYdxp7
 /hy66yVpSJ3GDTeaIkl9wYOJwf3tlMll6nZSOge2/vfOBRbvuwKOb95SQCWUG7NpaJwd7fSNX3h
 Y7iXfLUauAdbSBSwFzK6QZtLRH5pedD24EmcW7QiMjBHtfl33q8L+HSI8GQ0V7IdlBPw6AqJ0Rs
 sNHpWhCkNe0ufXBqhJiUKFmlwyJSJR4RJoMq7LYy12la9GPFTQ+rvHonuyyIRkd+2ttRwczZmVg
 olHz0wjBudy2cAv1c2+GOhWHExa2g78XLwbfXZB+VRtlddrmvIT3B8DLs+MvJO9A0AAKllngIqJ
 9iaFsxqHlNurL056ifxgEaKG+/WiqghdZbMf2FpMD0N1hyxM/YzRssrt3jn/vSQzcatadfDKaDX
 U86RCPVmcuRburmqYPA==
X-Proofpoint-GUID: o6m3CEEPVq3Un8nzIY6I1A49qWO5gqzz
X-Proofpoint-ORIG-GUID: o6m3CEEPVq3Un8nzIY6I1A49qWO5gqzz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113120-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:stable@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E280684A5C

As per the REFGEN IP team, this block supplies the reference current to
the PHYs in the SoC. So, correct the regulator type to REGULATOR_CURRENT
to match with the HW behavior.

Fixes: 7cbfbe237960 ("regulator: Introduce Qualcomm REFGEN regulator driver")
Cc: stable@vger.kernel.org
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/regulator/qcom-refgen-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulator/qcom-refgen-regulator.c
index 299ac3c8c3bc..6a3795469927 100644
--- a/drivers/regulator/qcom-refgen-regulator.c
+++ b/drivers/regulator/qcom-refgen-regulator.c
@@ -66,7 +66,7 @@ static const struct regulator_desc sdm845_refgen_desc = {
 	.enable_time = 5,
 	.name = "refgen",
 	.owner = THIS_MODULE,
-	.type = REGULATOR_VOLTAGE,
+	.type = REGULATOR_CURRENT,
 	.ops = &(const struct regulator_ops) {
 		.enable		= qcom_sdm845_refgen_enable,
 		.disable	= qcom_sdm845_refgen_disable,
@@ -82,7 +82,7 @@ static const struct regulator_desc sm8250_refgen_desc = {
 	.enable_time = 5,
 	.name = "refgen",
 	.owner = THIS_MODULE,
-	.type = REGULATOR_VOLTAGE,
+	.type = REGULATOR_CURRENT,
 	.ops = &(const struct regulator_ops) {
 		.enable		= regulator_enable_regmap,
 		.disable	= regulator_disable_regmap,

-- 
2.34.1


