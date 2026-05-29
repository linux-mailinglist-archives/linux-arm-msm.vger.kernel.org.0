Return-Path: <linux-arm-msm+bounces-110296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YI/+L0OnGWoDyQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:48:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C16D603EDA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCA7732A3B8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 14:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85FED3DB32F;
	Fri, 29 May 2026 14:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XumbYvfp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hj5n04Kx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595343DB306
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065489; cv=none; b=X6KgVJR0XqAxH879gXjh89sqO2lQtsscfCHWVuC9N2FGt3dhRTx1XDrQkxR+8qNPWgHVpiS1Tc+325jafyZV2zPqo0rnTNpUzuNT6+K5sRWCRzfeSmvJaqsqgkowIucz/2pH7Ez+beWj6JJLgPLExEdc+9g3fZuquxt/sq7Iqi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065489; c=relaxed/simple;
	bh=AFnhWWqFU62BMrFxqMWtSMxf95nuM8PRRSdLIYVhz38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D4ieHqCWN7h7Ex1kngvZAGvSZaPduDuohg5rA5OgSMQDXGsVfIb+agRuZrFEgW8PQ81vQQk9WvT0BPLJ+569rZn7CidK3Sf1ZWI8jFe522OM7d+RI/CP0nXX+Nrl+paryBBjhMZIETdv0pjBAdgLjEoTMMGtVMZfRZhh9DId9NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XumbYvfp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hj5n04Kx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDLFEO154847
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t6MTAoIK6EWQqac2dZPiVOhhInBKbVH5U0kklLKF+5k=; b=XumbYvfpPla5pIQG
	/pyPqGtp03CvFFyUAfFl9kv2t+4xNpdSyTC2H3JSnhL3N//qtoWIQ1fLpvWsbr3A
	kRcRAEDqUPNaDe+gKOjTArBfGQSpUdgDn7b9KTe46UsHQghtW6+7pInrF8OvyHe5
	tWsqz+Acu5TefHHVyk2RfYNg7UQ5tgs+BW45dCTDtryGKLYPuVmsAd8sSbCBrC66
	coldsoejxnaMBvDcHt63LezsqzS8vFYOyqu2LR9awpJPaOxlE+RnqzOFK504qs2r
	eNLGo+0LQhvSsX2yulVm1mdlZx8cROBGRiYDjGoGx5qHwLuBtYSBmFy3UWoAQnMJ
	qnFLkQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eeuy5c7d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:38:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf08c2a24bso22470325ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780065487; x=1780670287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6MTAoIK6EWQqac2dZPiVOhhInBKbVH5U0kklLKF+5k=;
        b=hj5n04KxwqhEQbXefTS++nIvuEmtgkRsOtHrjPu1UAGBzHwaBMlHr1ONvgeU67URPO
         z2Vrf9zS4ms/smdoFnaxzP3d5xDta5tIrigyqCkIuEqreBhL4/WGApIY3SewnzTaJAOR
         NGMsC3v4pdNq147LFz6E9s9S3ezbD8BPmKcdp2ovWwJMhmt2E+Bo3IjgJlB2OgJsvrNH
         vMhbVRz0vKl0ykK8/ER/9+nEl6s/Y6WE7i70WBemaAh6qiohCWum/vISpUcF7edY0X4F
         +G7MJjBT8QcKCf3bQHChoLEAKc/F2ZWWQhO6lWqdu6R3SR320mOKOq/gCsFWnVlJZtkt
         U7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065487; x=1780670287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t6MTAoIK6EWQqac2dZPiVOhhInBKbVH5U0kklLKF+5k=;
        b=qS8Q3bC0XbnCP2iPEKUrP4riaAev6rn7gpvnrDKpPJSVAgBEcAvTj7/qJ9AKKTBFXT
         eoXRFmPgPwgFt0S6xfWja4A1/YPWDwO5mGLtWJ650tWUtA0smu+RYxyfBq0kTjRBmM55
         mKed289kf5SYRXDuXbkgvs8vmilrqBgLHZ3y2DQTG9absewmrzYABXz30xvNQb19Hw+j
         POsxq2QrrLA0Vh139dXAmfycHrGgFdhN5gLm0QtFYXBcmP22NzmxNVlbhFNN0jPFKPUt
         fpUMfJAsGk436PWUW5xi/G87hyVVHutBXm6gJ5+s+QuG46JaMQ6ikXm1rcBv/ECxwdtY
         eyJA==
X-Gm-Message-State: AOJu0YzIyygpoJHyFuAPJGM9QNtF/QZdzFLWvTGq5Qsb0oUghVYC/Imj
	pybL1Z15da/U2cwp7ov2cMpty/STAdHj5i+Vyvq12ogj9dM+R/+w/A1sC58s21AHmcSeds3hy1E
	GMiKHi6LagGAYmZP4tqMgpXTHr8NlCHMBeAPxdZlYdbuDR9oO4F4nR5wEICWSfW/hHH4f
X-Gm-Gg: Acq92OFhrrrD/Tu44vquQ1UtW4YK6j5lKIou2DEVdwsNcEBWdcbizjiy3TD8yI0Srwh
	HUmou0WXWVhaggTsbTraHIIo1XI+z2aR+exqEPHAEwDG05zcgY4h9yEc+BAt2sF9hjyLsKo3cyx
	TVvlk83u8GcHggtQDxxQGxBzr9c/wbhiJyI4bQTpEtw+9Tur8uCWrR2sXPJgVpg53MUJHqDQ2j8
	ghdO29cYV0WBTw8B7uEdoxF5QIfJuzTuusEAr8A6l61Qtw4QI4oXQLb1M4MV8jHBYIXIws7CMlU
	710vhrgbLsWwvq9EL7kve/xft2mZnRxCAarWKBYQkb6G5dj6dhsrsbAHe05xORL4s7ecQ/yLQ59
	vZBc9IHjrMhsEbIDkT1766XkroVfYa5f072yPJ2Eixyp9vSjCdpTEQqJYDsq5CfhH7g==
X-Received: by 2002:a17:903:1207:b0:2bd:3bfd:7512 with SMTP id d9443c01a7336-2bf368468ddmr666465ad.29.1780065486925;
        Fri, 29 May 2026 07:38:06 -0700 (PDT)
X-Received: by 2002:a17:903:1207:b0:2bd:3bfd:7512 with SMTP id d9443c01a7336-2bf368468ddmr666105ad.29.1780065486483;
        Fri, 29 May 2026 07:38:06 -0700 (PDT)
Received: from hu-vikramsa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85772993c9sm2469394a12.15.2026.05.29.07.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:38:06 -0700 (PDT)
From: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Date: Fri, 29 May 2026 20:07:23 +0530
Subject: [PATCH 3/6] media: qcom: camss: Add Glymur compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-glymur_camss-v1-3-bee535396d22@oss.qualcomm.com>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
In-Reply-To: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780065463; l=1895;
 i=vikram.sharma@oss.qualcomm.com; s=20240628; h=from:subject:message-id;
 bh=SoZWS8qy+52nFSLk3zZ3aHhqlfTn3tm4mIZq+rTGyxA=;
 b=+H2oSfyzxTsPsAB7SoX+NRPkCfOerarMe0b4VXUr7H8o4ujMJKrcO8kZcG/TcpwLxsNJbKbW9
 BFJIhuPHW0+CDMNLf5KMqbaZLGUvTwb3UcYKsayjEorHNh87hJxiqXQ
X-Developer-Key: i=vikram.sharma@oss.qualcomm.com; a=ed25519;
 pk=vQBkwZr1Hv+VXogAyTAu7AEx8/6bvkOmgrzYFbNGCDI=
X-Authority-Analysis: v=2.4 cv=SPtykuvH c=1 sm=1 tr=0 ts=6a19a4cf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=tcYBWJ0pf51xna4_flAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: vmpwqenPabQVM1Ci74r6sJP3fmk971oX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NCBTYWx0ZWRfXxoNrU0F2dtEF
 BaWr8iEKSiwz9WyaJgu6EKoDyZ+IrJv/Kjr4OH/3MQajWTxd488Uqjt6JHzk2tKPJ6B+dQN1wJe
 ueacOIU2Xu78E4nAS6FoJU+O4L46CPU6rrCFqDEPoZsbEy/nKazTD0zT+ecIoh5piFiD6dpvsu1
 qJ2tH8elCqZzEEwKF5yugFmVpod/yQ98iNDDK6mkwGNpw7g66eBok/FK+eTAtBBtOHdw9bejWTZ
 G8GAxkN8E4XDV3AxqKmDOq8zzMVszL/JS1BZtS+0XjMwzwyONuaD3TNwqDdsXr6sha8bY17lZEy
 xzy2VI6NfUnw2/y8OA89ZXZ4T0jqQXFn+qjYKrSDXwFM1t7eI0G3nl3bYdC1G+Zp+yLh9mcu62T
 bwRlVQNRaIT9exVnF/hG4IiPjhV0J5vWp0+7ZoPQafDCb+Bkvd/QtggqPJ4tNgATbeVk1YBEhyy
 1q9LNm5jwfBQNE/lKcQ==
X-Proofpoint-ORIG-GUID: vmpwqenPabQVM1Ci74r6sJP3fmk971oX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290144
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-110296-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikram.sharma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1C16D603EDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Prashant Shrotriya <pshrotri@qti.qualcomm.com>

Add CAMSS_GLYMUR enum, Glymur compatible and Glymur camss driver
private data, the private data just include some basic information
for now, later changes will enumerate with csiphy, tpg, csid and
vfe resources.

Signed-off-by: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 6 ++++++
 drivers/media/platform/qcom/camss/camss.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d..c6276d746352 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5507,6 +5507,11 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources glymur_resources = {
+	.version = CAMSS_GLYMUR,
+	.pd_name = "top",
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5740,6 +5745,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,glymur-camss", .data = &glymur_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 93d691c8ac63..31085b3526c5 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_GLYMUR,
 	CAMSS_X1E80100,
 };
 

-- 
2.43.0


