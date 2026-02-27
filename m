Return-Path: <linux-arm-msm+bounces-94431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +G/vNDV3oWmutQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 11:51:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1F21B633E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 11:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4203A3021D25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 10:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D78CE246766;
	Fri, 27 Feb 2026 10:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pL+8/s8L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D9pOK5r3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39763A0B2C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772189485; cv=none; b=NltIwiZt642O1h+izNrV+7kiIJFU6Z7UT+drCn/YAAACA7lpkvt38poyPZDdRev/LsKKqqPTUfiGfCEzDuKiXNICC1ywh9llrMdxIymNNWGuq3lK2J0VJv2cjyKVkALUXFy+xvRkPKR3J/2ncLziDavhQGnBXh1zXaTqvNbcljs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772189485; c=relaxed/simple;
	bh=NuQktRrQxerKBdlu7RUhFNtaU35xxW2kPiId913DKVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BQ3MllHoSwMQoU8qaTXxxXGLCk12f7bG1RNoU1KbEBWkM3vuqo6lUzSzWnfEIlcKkq1M1uUZyN2YPIGjv2QmSFl+49MExwh9s1c8UVLHBmygYiCRe4y64kGeJwVbwAvxEhtpgDOs4pxbb7/YqdLwOpsUkP10MGCrR7yKG/7m75M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pL+8/s8L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D9pOK5r3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R7fP2d2307392
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=U1S+/z2TCLM
	j7vIv4Lq8YmFqlEAakUMQgROUghqQyE8=; b=pL+8/s8LD/WdkUm7zdYsKuk96I7
	bJLOhaA/wdYLgRG+d/hloBVq9WIRY7JbY3bPgID/IDL/fyZDBdU8KtCZ4gSthq0R
	gR5dc0IqonV3Rqz/gOIU5BWEpObBedIJGqPycgSpLVmLwF9/Y/Ub8J4rJKYFM0V6
	ZA8BUl18kAGWO3t8OfJRe5odlzSbGLW5deIVJF4v9uqK50evIFu2YLeXTulXdYg8
	N7Oaj5kr8ZP+dqCdEOlKH4ADsSTFuwXVDnZLF0WWaLZ0AMS318JYcBJ0HKKjg2h6
	nsejibka5UJzAMcSTHx8JT+n0nQ36zTQFw3oisllgYc4neez7DdlgEy0eGQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck73q0k15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:51:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aad60525deso109484055ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 02:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772189483; x=1772794283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1S+/z2TCLMj7vIv4Lq8YmFqlEAakUMQgROUghqQyE8=;
        b=D9pOK5r3jZJvzzD6BfGLdErppllMe1jHcu9FFxHZ0uG/nwWqQOTEhjrfVdj2UTIsDv
         lTR/PGOjEXIO8hZhTHh4arfLxj03+ur75PU6n/UsT5lJm6lMLJQ5NN3R1hOElZ8KeLZw
         nwFcdNrVwvMpiU4T3d52sysn7r7AwC20knbLXnv11W83VEAG7bVoSokoof8LCjE8U8uw
         vBuT3MzEAnaFtG+tyLljEZ7Y9kkI5flEeFZEmc1xixfEzIC5gNJWm/eh74YNuDRdDaOa
         6PECsHqspJhDqJ1ZeGK+NkRb/5Msg5MrvicAZftDjLnbtvtnWLhS9okkCxE3te6g3Cos
         +5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772189483; x=1772794283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U1S+/z2TCLMj7vIv4Lq8YmFqlEAakUMQgROUghqQyE8=;
        b=AMy/SGl9m2LHETZbgq4BLULXhUWYx//H7YUV3O1dpoU1YJ6m/0JufKdxDUO40S/LST
         hrauPeOLO9dTsoZUC5JOZ+IoU+GVHp07OopBiE+tXa/XttJNIX6eDK1jrQS4ZK6Ah8O+
         r99/y2cZTa1Y/j/0Pb0gu8CLaibc3x9r7cYU4MThgwhedkOYL2ZM2SR2v9Cq/Okksj1w
         G3FvI7+6T0q0gRbfJXAu/01BSSiHtcRCzNZvRUn9U68pEAClaKcoIHhb/IIFV/qvd09K
         WDcNaVok9Kv5C7XWWedCzN5PzCRFxQbjBHXOEGylNeQ2YH/HKwCPEK973zpWZAhXHvx5
         xPpg==
X-Gm-Message-State: AOJu0YwBJycSOfCTc8HP4w3bLlElsz81xaEuo6T467q977rVrrD13S/H
	Rbd+H/lVWJCm/cXJAjPGS5mz2peqJAmO4+ShGw/r6xHtJxVbXX9+rwsVyZyY8QYOyrUwlnG0C8X
	YWmaEPj0Pg8ItqcqVVQYorTPfZQRFsEc9PR3j3ogjbMrKz8bpdfBARa3Xtz23HFGX44/8
X-Gm-Gg: ATEYQzyYash3YFvRmlfpflRvwbQlcuc3EXNO8quzrA/VMXHSgqKreFVQzikexVtyxFt
	62Y+0lJvyOen+PDT1KWa5r393sKAMjVcHponXRWSbTMtwzDlEvDwGbfCSHl02un+fIXWmS6acu1
	VRcvG0Ba50IL7D1gjetJd7fO1UCYVSz0RmytNhc/gMz/CGxjhYm2QiiEGL8Ds2/kRF+RsL4A+0T
	ogT33SZeAlQpRX5A6M5pAFxs6c79msQqAEsiTiFzmEfBubyS1RyeUvi87kyybNAyb2WRRTDopQA
	SZK/3MID22PK8RWD/ZyDYrcZjEnrjN4u5l8kthRg+CcjQ/nu7s55IRPmsAZbnZ1UF+nK1/BBQi8
	r3OWrR9kDm3Gw1x4hc3NYSVTGsDLn8w/Z9Q21tWZYSblW8GLB7jrUgyD9
X-Received: by 2002:a17:903:32c7:b0:2a0:cccf:9d24 with SMTP id d9443c01a7336-2ae2e40754emr20673735ad.16.1772189482727;
        Fri, 27 Feb 2026 02:51:22 -0800 (PST)
X-Received: by 2002:a17:903:32c7:b0:2a0:cccf:9d24 with SMTP id d9443c01a7336-2ae2e40754emr20673005ad.16.1772189481394;
        Fri, 27 Feb 2026 02:51:21 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb757a8dsm73721885ad.40.2026.02.27.02.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 02:51:21 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
Date: Fri, 27 Feb 2026 16:20:53 +0530
Message-Id: <20260227105055.2364348-2-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227105055.2364348-1-monish.chunara@oss.qualcomm.com>
References: <20260227105055.2364348-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA5NCBTYWx0ZWRfXxCPWwYkSUJF0
 YJJ4Zh3qL3klmPcSzTdzQiWfygHLHwM5xpFex4Q+seWYj5Luw6nM/DEiM8ybMQ/wFl+F3XGyi55
 dOqSTEpS69Flfe2HcqkM203WqMyjfLfUc1eatCxF12DKP1EtP6cip5zscT6vonT1woR7UG7jPJo
 AWNx3yfOPtRlih8yUJHLgLfTBSnA++XZDwYCn+rjcGh2BD2GHXCVx2WybD5sZ/gnfHYJxyQhxXS
 HFhYRd2cSkyehQzieLD+9W52JM5MiHY2mLADAnRSvRRhBpker9/lCQbSnZOIYxhlYuwmlbKC83V
 sRXNkglrdPD03MDL7of8jz5BWpQN8oISianvwhEBETiM+4O4Xdr2UilZMMz/7qEIJBBY74bk0zX
 lfaw3NF0epjXQkAr3iJCHKBffDWzLwSFXEBCjmrYU5r9NYqWYDWeOPlONi/lkhjXnfkEhnXSjAx
 vkJ29UljDtGIMH4d3QA==
X-Authority-Analysis: v=2.4 cv=KL9XzVFo c=1 sm=1 tr=0 ts=69a1772b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=c4nFiuB5qTS8t_IgZ2oA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: NpnxULkiVL8Z9xUjjNGSQN8neAUrheHb
X-Proofpoint-GUID: NpnxULkiVL8Z9xUjjNGSQN8neAUrheHb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270094
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94431-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5E1F21B633E
X-Rspamd-Action: no action

The Monaco SoC SDHC controller supports both eMMC and SD cards. However,
the 'supports-cqe' property (Command Queue Engine) is specific to eMMC
and conflicts with SD card operation.

Remove 'supports-cqe' from the SoC device tree to ensure compatibility
with SD cards. Simultaneously, add the property explicitly to the
qcs8300-ride board device tree, as this board uses the controller in
eMMC mode.

This ensures the SoC definition remains generic while enabling features
correctly at the board level.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi      | 1 -
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 5d2df4305d1c..680f0edf4356 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4742,7 +4742,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			qcom,dll-config = <0x000f64ee>;
 			qcom,ddr-config = <0x80040868>;
-			supports-cqe;
 			dma-coherent;
 
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index c04e0ad53eec..b0bec20eed34 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -428,6 +428,7 @@ &sdhc_1 {
 	vmmc-supply = <&vreg_l8a>;
 	vqmmc-supply = <&vreg_s4a>;
 
+	supports-cqe;
 	non-removable;
 	no-sd;
 	no-sdio;
-- 
2.34.1


