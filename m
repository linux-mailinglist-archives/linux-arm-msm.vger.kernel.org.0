Return-Path: <linux-arm-msm+bounces-111206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jzFZBmZ1IWofGwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:53:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8292264013B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 14:53:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NisBJmnx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A8Xs14AF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111206-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111206-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0296530A4B3C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 12:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526D847CC70;
	Thu,  4 Jun 2026 12:48:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9656547CC94
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 12:48:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577335; cv=none; b=CwJu/5HnjnwEski55WJZ/OzkGDRJserTJZmzP3NSX+qLUFiR/EQQNsFPG4Md56ojmzrT4bjAOGKRFbFKnuXefd2KYL2N/J//Ei3hGI32odj9431hHW2PBM/pms6l0mcottxaxOe6gvmqGzFeFPnHvJb0H/x/Lj3YUHv5SljaTlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577335; c=relaxed/simple;
	bh=iyY+y5TN9IyHjJokwttza0905vWxKzcVubpcRLTFUdE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iXsRbVdddlfrJ+KLZ9MIeDzvfhj2hpDTfLlF32cP/DcoVKJNjRem/s9rKGsGFFdDyJKhD9ADNq0msjeSWFKHnoQCNsV6z6ULQDukprP8Lnp6W+dFM445YAhcVsNxMlNtBO6/vuJd5Q7HG2SvXBN76+nK9fS4uF3wgIdmDDFPXy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NisBJmnx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A8Xs14AF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654BKn5r012181
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 12:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ROJ6IfZLONl
	Qgvg7ILGZbruv22ROJsbV5xSXg8JtFPo=; b=NisBJmnxU7Ta2KBNqRHoueFgzZd
	e5G4PLRBGFDrrrHbZl4Fniv5HS9MSK0VihBRsUlBuOzgtjB7mJ85ZaUq5O74N/DN
	BeXIMO16SGu1XNGl75T9vDKttaVTCWvEjmDhmsNtlLh2PyMyW9UUQOd9VSQy2EVY
	EsxS+7NPCazA2NMK2CIgvvFKAOmqJBWoRnl/3VzQEIbeSZxBsF++68J6TdCYJxob
	rmOasfnSblC2iFq5FBf+3iG6Q7IXet+SJNnHn73YGBWE5a64vf8C0Hr0aGhJwuHb
	NvEq9n6lITphXuayDwLjGBMCRv4hW9UWMY54E/5wSt06niwKR1UFEz8H+4w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek8dc0ax6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 12:48:48 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8596daabdeso808302a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780577328; x=1781182128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROJ6IfZLONlQgvg7ILGZbruv22ROJsbV5xSXg8JtFPo=;
        b=A8Xs14AFU6sRuJ+9iKwepFMZMSSoMEdWlyQE8DmQZ1kAM1iYhyxLBLNz6DX232/l8P
         sPK34JvNQS+ig/HN07imzav+EP06uqK7Iohovogjacc+G0FQZG2HmvflfMa7Te6eiBP9
         M2/TZQk5YjcthNLorsjbJDz7XjYe4xTGF55QcALFSyD8aMlqzXyLJx/wKBolwE/3r1Ug
         bcW90cDTNC9yke3X+B7pjVRwkqpsetFHx2ajNENZB2DsPwK1dl20cWVp74rO0e14nTvZ
         kqg5XA1pxJ60B22Sde9GLs+A+FwBGN+/5pCX7Ceue9GU04DJhp2BI8kVhtYdrCHnR8Rm
         GANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780577328; x=1781182128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ROJ6IfZLONlQgvg7ILGZbruv22ROJsbV5xSXg8JtFPo=;
        b=qeMny5zCjrHFkg7wUWhTyeLObENPRkZy5QPG7vtAPBkA9e+sGyJNP4Xld7EA/YSJ80
         rZvtU1qPSWYapU1xc7Z/SFepNlJBetNStSuOUyS0g20e74no+iwSYmByDXlJdvNn366o
         C7uCoW7HaBMbq5Rd7FqbSNrnXMF0D4O0KvVyfZHvDbZIo7318HWhsDAF5KST8jfv5vGR
         yxZ6blWKjABPqJfpXVdEY2Bbmu8ZAyFu83uLXNTEN1Gzg4Ooe1pVq/N0BEyRZ2ijqRws
         eHFTwOnoArJliIHvHQwjYI+GzJY3AhAs3ciq1/rtuyYVfMIhIgaD68h/BgjlwS45LeLX
         wYXg==
X-Forwarded-Encrypted: i=1; AFNElJ+ghGzZDxINwTGkk/7/Wb0Gl3tx84ptulmPTLzdbaHNmKZh/zBUhhWRBynsoxQSnHlJTJuu1JEHs6JkNb5m@vger.kernel.org
X-Gm-Message-State: AOJu0YyCF/vmVQNPDvqJZEAUpZ4SiQOOyQw1/SYCTAh0MLPXWon/701V
	imDdT4PfefeAU4MfORKr8BbutjUgGuY+CKfqys65m/ITPx9Engcy5zI7OvRI8kA+C2t3Xr5GdB+
	dqx/b9WHa4QjEwB1GXZDzjirRdGAfv4QIS9YaNXgIBDxOuoo5KtQ+XlCfev42sJVlwak+
X-Gm-Gg: Acq92OH7CSf2vRd8AWKChQkLQGunxKceKYomxYt0vpFCB3cJgW1Qy+tkrqdCwaXiIl4
	jorLH43jbEKUCzTFtkFUBcO2sc/GKMGOrEC/T8f4wVnj8oUize3Prrha+Mvl4RF59jvqjMozf8N
	mo4yRuc3IFnYavCFj3nECR73OLOhL4d1HZKdNdIGq59NfwD3+Q+zVxahTvAigHol4HtQN+ThvhL
	qvUa9/AUyNkBoPXlIlp2GUtJcItVGLOwx8i0pjThQLHpig+g9Td+zBieXxGmcGr3+0gdVSIu1/n
	Nf4338vOVCxfITHMa3dNaX3wL6YCIQP+yW/RUTcESr0I45c9/C8HNI5au+K2EkcMxCy9iub+5O+
	0jNjwj8ZUEH9jX+MMM5L7dgRifW/GvjMt/RqLvqro0uoGz2KJ/Fhcno4dTNK5
X-Received: by 2002:a05:6a21:3b89:b0:3b3:1b38:d9cd with SMTP id adf61e73a8af0-3b49769d5c6mr8863899637.28.1780577327840;
        Thu, 04 Jun 2026 05:48:47 -0700 (PDT)
X-Received: by 2002:a05:6a21:3b89:b0:3b3:1b38:d9cd with SMTP id adf61e73a8af0-3b49769d5c6mr8863852637.28.1780577327300;
        Thu, 04 Jun 2026 05:48:47 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04311bsm4911811a12.9.2026.06.04.05.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:48:46 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v6 2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock framework for runtime PM
Date: Thu,  4 Jun 2026 18:18:22 +0530
Message-Id: <20260604124823.3467457-3-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260604124823.3467457-1-ajay.nandam@oss.qualcomm.com>
References: <20260604124823.3467457-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: I0ozmlBbOdQbgmFhxEx7aQW8tOp4lQzj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyNCBTYWx0ZWRfX9RW1Ror1kCi1
 eMkh2HlEPlizv7Q6N3PKixXVZq2yIKV1ydi0KZRVcArcwocP0rMtzQtyFNQvZwOTBQ3CKUTRPCG
 uQj8h6T42JCrikJYs/HTLfY0zfSA4gU/FEUQUTp14gJD+w3fiVzjk90VvfTiuBjCWKsTsiGPYC+
 2pa4DXZQUKdnG3UWqwpJKLKtXLIFndBdYVQq62Fl/TAj81Jub0z6fj1VgCe9t1Nn/cDx4mCc87e
 MMyiOcnyxCPv7SI2wuy+q58oIDUYggzFtX7l6f20eVdjTAyP651oO/XwLYO6Hq/U+WF5aT+xv8P
 2heWUl5bkYeogOlK/szI4EXYG9nc9AS7xIU1UTfnleeRHQoPhZgRByJ5bmOOJ8Q6Y9Uxh3gJvqD
 q+RTwFyiguqlWze5i2lUAOrUG061xrA/yGxxXP07bfon59WPlffv4O4o2zIu92r1EfutVgTeq3a
 lEJiELSLXTfTYh/MZUw==
X-Authority-Analysis: v=2.4 cv=eJwjSnp1 c=1 sm=1 tr=0 ts=6a217430 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=tLfOVjUU_VM9_-uA5fIA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: I0ozmlBbOdQbgmFhxEx7aQW8tOp4lQzj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040124
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-111206-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8292264013B

Convert the LPASS VA macro codec driver to runtime PM clock management by
using the PM clock framework.

Replace manual macro/dcodec/mclk/npl clock handling with PM clock helpers
and runtime PM callbacks, and keep runtime PM references around fsgen clock
gating so PM-clock-managed clocks remain active while fsgen is enabled.

Set autosuspend delay to 100 ms so PM-clock-managed votes are dropped soon
after idle while still avoiding suspend/resume churn on short gaps.

Add a PM_CLK dependency to SND_SOC_LPASS_VA_MACRO since this patch
introduces PM clock APIs.

Improve failure unwind paths: handle runtime PM put errors in probe/fsgen
paths and restore regcache state correctly on resume failure.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/Kconfig          |   1 +
 sound/soc/codecs/lpass-va-macro.c | 142 +++++++++++++++++-------------
 2 files changed, 80 insertions(+), 63 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 458ea62ad983..72a973dab84d 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2896,6 +2896,7 @@ config SND_SOC_LPASS_WSA_MACRO
 
 config SND_SOC_LPASS_VA_MACRO
 	depends on COMMON_CLK
+	depends on PM_CLK
 	select REGMAP_MMIO
 	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm VA Macro in LPASS(Low Power Audio SubSystem)"
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 528d5b167ecf..6e822e47c863 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -11,6 +11,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_clock.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <sound/soc.h>
@@ -1346,34 +1347,58 @@ static int fsgen_gate_enable(struct clk_hw *hw)
 {
 	struct va_macro *va = to_va_macro(hw);
 	struct regmap *regmap = va->regmap;
-	int ret;
+	int ret, rpm_ret;
 
-	if (va->has_swr_master) {
-		ret = clk_prepare_enable(va->mclk);
-		if (ret)
-			return ret;
-	}
+	ret = pm_runtime_resume_and_get(va->dev);
+	if (ret < 0)
+		return ret;
 
 	ret = va_macro_mclk_enable(va, true);
+	if (ret) {
+		rpm_ret = pm_runtime_put_autosuspend(va->dev);
+		if (rpm_ret < 0)
+			dev_warn(va->dev,
+				 "runtime PM put failed in fsgen enable unwind: %d\n",
+				 rpm_ret);
+		return ret;
+	}
 	if (va->has_swr_master)
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
 				   CDC_VA_SWR_CLK_EN_MASK, CDC_VA_SWR_CLK_ENABLE);
 
-	return ret;
+	return 0;
 }
 
 static void fsgen_gate_disable(struct clk_hw *hw)
 {
 	struct va_macro *va = to_va_macro(hw);
 	struct regmap *regmap = va->regmap;
+	int ret;
 
 	if (va->has_swr_master)
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
 			   CDC_VA_SWR_CLK_EN_MASK, 0x0);
 
 	va_macro_mclk_enable(va, false);
-	if (va->has_swr_master)
-		clk_disable_unprepare(va->mclk);
+
+	ret = pm_runtime_put_autosuspend(va->dev);
+	if (ret < 0)
+		dev_warn(va->dev, "runtime PM put failed in fsgen disable: %d\n", ret);
+}
+
+static int va_macro_setup_pm_clocks(struct device *dev)
+{
+	int ret;
+
+	ret = devm_pm_clk_create(dev);
+	if (ret)
+		return ret;
+
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int fsgen_gate_is_enabled(struct clk_hw *hw)
@@ -1534,6 +1559,7 @@ static int va_macro_probe(struct platform_device *pdev)
 	void __iomem *base;
 	u32 sample_rate = 0;
 	int ret;
+	int rpm_ret;
 
 	va = devm_kzalloc(dev, sizeof(*va), GFP_KERNEL);
 	if (!va)
@@ -1601,22 +1627,20 @@ static int va_macro_probe(struct platform_device *pdev)
 		clk_set_rate(va->npl, 2 * VA_MACRO_MCLK_FREQ);
 	}
 
-	ret = clk_prepare_enable(va->macro);
+	ret = va_macro_setup_pm_clocks(dev);
 	if (ret)
 		goto err;
 
-	ret = clk_prepare_enable(va->dcodec);
-	if (ret)
-		goto err_dcodec;
-
-	ret = clk_prepare_enable(va->mclk);
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
-		goto err_mclk;
+		goto err;
 
-	if (va->has_npl_clk) {
-		ret = clk_prepare_enable(va->npl);
-		if (ret)
-			goto err_npl;
+	rpm_ret = pm_runtime_resume_and_get(dev);
+	if (rpm_ret < 0) {
+		ret = rpm_ret;
+		goto err;
 	}
 
 	/**
@@ -1629,7 +1653,7 @@ static int va_macro_probe(struct platform_device *pdev)
 		/* read version from register */
 		ret = va_macro_set_lpass_codec_version(va);
 		if (ret)
-			goto err_clkout;
+			goto err_rpm_put;
 	}
 
 	if (va->has_swr_master) {
@@ -1659,35 +1683,28 @@ static int va_macro_probe(struct platform_device *pdev)
 					      va_macro_dais,
 					      ARRAY_SIZE(va_macro_dais));
 	if (ret)
-		goto err_clkout;
-
-	pm_runtime_set_autosuspend_delay(dev, 3000);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+		goto err_rpm_put;
 
 	ret = va_macro_register_fsgen_output(va);
 	if (ret)
-		goto err_clkout;
+		goto err_rpm_put;
 
 	va->fsgen = devm_clk_hw_get_clk(dev, &va->hw, "fsgen");
 	if (IS_ERR(va->fsgen)) {
 		ret = PTR_ERR(va->fsgen);
-		goto err_clkout;
+		goto err_rpm_put;
 	}
 
+	rpm_ret = pm_runtime_put_autosuspend(dev);
+	if (rpm_ret < 0)
+		dev_warn(dev, "runtime PM put failed after probe: %d\n", rpm_ret);
+
 	return 0;
 
-err_clkout:
-	if (va->has_npl_clk)
-		clk_disable_unprepare(va->npl);
-err_npl:
-	clk_disable_unprepare(va->mclk);
-err_mclk:
-	clk_disable_unprepare(va->dcodec);
-err_dcodec:
-	clk_disable_unprepare(va->macro);
+err_rpm_put:
+	rpm_ret = pm_runtime_put_sync_suspend(dev);
+	if (rpm_ret < 0)
+		dev_warn(dev, "runtime PM sync suspend failed in probe unwind: %d\n", rpm_ret);
 err:
 	lpass_macro_pds_exit(va->pds);
 
@@ -1698,27 +1715,23 @@ static void va_macro_remove(struct platform_device *pdev)
 {
 	struct va_macro *va = dev_get_drvdata(&pdev->dev);
 
-	if (va->has_npl_clk)
-		clk_disable_unprepare(va->npl);
-
-	clk_disable_unprepare(va->mclk);
-	clk_disable_unprepare(va->dcodec);
-	clk_disable_unprepare(va->macro);
-
 	lpass_macro_pds_exit(va->pds);
 }
 
 static int va_macro_runtime_suspend(struct device *dev)
 {
 	struct va_macro *va = dev_get_drvdata(dev);
+	int ret;
 
 	regcache_cache_only(va->regmap, true);
-	regcache_mark_dirty(va->regmap);
 
-	if (va->has_npl_clk)
-		clk_disable_unprepare(va->npl);
+	ret = pm_clk_suspend(dev);
+	if (ret) {
+		regcache_cache_only(va->regmap, false);
+		return ret;
+	}
 
-	clk_disable_unprepare(va->mclk);
+	regcache_mark_dirty(va->regmap);
 
 	return 0;
 }
@@ -1726,25 +1739,28 @@ static int va_macro_runtime_suspend(struct device *dev)
 static int va_macro_runtime_resume(struct device *dev)
 {
 	struct va_macro *va = dev_get_drvdata(dev);
-	int ret;
+	int ret, sret;
 
-	ret = clk_prepare_enable(va->mclk);
+	ret = pm_clk_resume(dev);
 	if (ret) {
-		dev_err(va->dev, "unable to prepare mclk\n");
+		regcache_cache_only(va->regmap, true);
+		regcache_mark_dirty(va->regmap);
 		return ret;
 	}
 
-	if (va->has_npl_clk) {
-		ret = clk_prepare_enable(va->npl);
-		if (ret) {
-			clk_disable_unprepare(va->mclk);
-			dev_err(va->dev, "unable to prepare npl\n");
-			return ret;
-		}
-	}
-
 	regcache_cache_only(va->regmap, false);
-	regcache_sync(va->regmap);
+
+	ret = regcache_sync(va->regmap);
+	if (ret) {
+		regcache_cache_only(va->regmap, true);
+		regcache_mark_dirty(va->regmap);
+		sret = pm_clk_suspend(dev);
+		if (sret)
+			dev_err(va->dev,
+				"failed to suspend clocks after regcache sync failure: %d\n",
+				sret);
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.34.1


