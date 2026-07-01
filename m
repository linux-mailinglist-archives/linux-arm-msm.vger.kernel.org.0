Return-Path: <linux-arm-msm+bounces-115775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5BBvB3JgRWqO/AoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 20:46:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 680ED6F0AFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 20:46:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=L3KXGGzQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=i6lQomyV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115775-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115775-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE81D305932A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 18:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AADE13546FA;
	Wed,  1 Jul 2026 18:45:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2773921EC
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 18:45:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782931547; cv=none; b=e2hKn6+DLgUioNjXbJjP++lBRBZP7BvPQDj4O+HideOK2mJXz7qFOxJGb4Ux9Zj4ETuiBBsNdiiZ1lb4vgfYYKikcbps9B3QffXeLlK6eLLqyQ1xGXBEpyY0OJQrbnC93BgZ2i6E/1YvIVQsZe6/zzwa9ENafuMQvffNRU5fQn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782931547; c=relaxed/simple;
	bh=BJWn646ReG/Zhog3+YV18NW8zzIb5JBXv7+oxMebjNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uI0YKgBs+yVXioonmWjZkT4vlnDS1GWjDAWM/rj8Gsm1eXFI4CX1I8Vf95dAPfbI9x1pDkuiWD6P4Jy9rMAfZYw5+SdUIW7Yf++TVYGZMMuoKEShuA3J2aPMj/E5bLuQt1jO2Mhq5QV9uGAGHFdayJag4BW2xwGnuO2OWdhGCgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L3KXGGzQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i6lQomyV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmieH1618460
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 18:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cLYsJ2RyfAAEuls6MuOpX4Na3+hzb3k3HRjT21yP3Ns=; b=L3KXGGzQTNQUEKVs
	F1ms336oaxy4VmXq/+FLfujJMWSTERLQW9g3N24XKBC35Kp7TUX3qYbxTwHEN84x
	05bA9zY0LQu0alB33HiisenATYqcMKgwZM9IRaKkTyhEHiFT54Az95FCU0hMjw2y
	f21yu6jjj9mQPWM3VpgxKO4exY/hlpI1jWoq5I0gNwFVl6A5kcHDX/BP+4vhlbG1
	7+4nM71DA7/GiaIbkKf4enGkmp3x0RDgS4XFmK8TS5gmZbhdCwvcP2zDPpJwRNBc
	0w3QZYQ02q79jsGbBzt5rqRnPPfeYCxwpPuB3XkXH1nqTHwTUzxFXdwkzBB1hkZj
	MO0hgg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f502utg9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 18:45:44 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37e16f658abso776065a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 11:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782931544; x=1783536344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLYsJ2RyfAAEuls6MuOpX4Na3+hzb3k3HRjT21yP3Ns=;
        b=i6lQomyVXyAVqwGpt3oPxiDrip/AbpnRbidrGT20kUGXQxHFNA0rbWpA/st3SfRKQ5
         qcsx0r3ckTuEgpyO7GRS4r1+pCZPHn7089uBVXSWd0ePDrvMOm0/NWNIIDGQB/jDcFUs
         I+kkRzHZPoxHH8W5CTgjGR+ZaQJ1M9nwoc/2m1Hln7ADCkbc/pghmt2OZCjYLXjYPylu
         LE/CQJ2LMefi4qz6sxXvlgpu/6p5puj38QQrA+ZIkdNkA/OEqLw8c3cpiW5VLOJxvw1C
         GUncfkyw7TQfl9qsMS5zPQXujfqGtlKR8dIK0JGHUx6X7EIRft8FgSji853Iy++SDlZC
         nyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782931544; x=1783536344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cLYsJ2RyfAAEuls6MuOpX4Na3+hzb3k3HRjT21yP3Ns=;
        b=jhrsIK2jqDgcRy0Pofbfz0ME3TmeEllh7FLDYmMkXExztVENlDOvlqlODYc1N+Matr
         tVRx+8LAcmiKQ0lBSquWFvzQahnyvgx4FV5Eon1hgoe2eUiA9jpropRiga7OQhKxGM/0
         u7+dxUiKlbsApXDNWJ/LlauX9m018dlc4YUetQNbkHTGZTxIGfYLpUdIj3kraqsX9uVd
         ImWT+hRDK/WwLV1kKMx/AgoSn3jp89zcAK/zirJQ5C5kUR9BF/XBO7V2GtmS/TxvEcrF
         jKJBTwgm82yPeOriykwuq8gIb8Y4tdXNXZKyqcSZkxOE1ajB6Ty1128qUzmlSlhVzsd+
         lVNA==
X-Forwarded-Encrypted: i=1; AHgh+RptqQAfla3dgokwhYxmCVWfZHU8bilVroc5wS/bpd/g/mdgv6d7XuBtxGSWQdHUu51t4cGKpXX77CzmtAfC@vger.kernel.org
X-Gm-Message-State: AOJu0YxW0/dcHtumzZhhdxHRcrys+Mn1LxeOLTTyIhz4ue6CoQei5mvH
	SYwH0Sp0MbeoKnjBSKXZ2WeydKe7ErA7TJu2OQdZ44zCJx4rZHwjkk1FEZd7gEk/rubJV/vdIWL
	fQecS24uasl09dTiEEyw8ReCQ5KV6HZM0sqoNpeO2mK84FIzg0J9PFuePGeZJ36MYnqmo
X-Gm-Gg: AfdE7ckSie/Z+LGTGGoDDA5xziUNEErJAct7EoxXueXQ1Mr+MGU9kyvThFnXxl7lIe/
	DOYhPHANoY0GuVHolw+CPQkO0iqeWUTg3XtvYwLUvbyK1/zFLfKO+dLvmUujmdSnfRvEluRLQVJ
	kkNcXFVXCtv7c4UehcH/GxNRPPtgE57zxfhkfaUF6G1FuW334Q3DiyoyQ9dUvk747GbClXfRwHx
	uXhYwSHUjy16BwlS7M/hRykkog5RduBdsRILyGm55HG6DRp+Bg42TlyWZ3sf9sdJgqc5Cjo35k+
	ygOFjMCFCdmStZ8xaJ4+0IKQmgURDkDPNzJ0sYyaimLrAVfoXkvZCBgzuWswQqLWSbyndob1kj0
	gNlN/nQ9npdiUxkIMS5HWgWvSrthPH00aoeoPVlw=
X-Received: by 2002:a17:90a:e7cd:b0:37f:464d:ea38 with SMTP id 98e67ed59e1d1-380ba70e00cmr1812535a91.0.1782931543834;
        Wed, 01 Jul 2026 11:45:43 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cd:b0:37f:464d:ea38 with SMTP id 98e67ed59e1d1-380ba70e00cmr1812502a91.0.1782931543344;
        Wed, 01 Jul 2026 11:45:43 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38097dba406sm1023489a91.2.2026.07.01.11.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 11:45:42 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 00:14:57 +0530
Subject: [PATCH v8 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-xo-sd-codec-v7-b4-v8-1-d39d0fdb7859@oss.qualcomm.com>
References: <20260702-xo-sd-codec-v7-b4-v8-0-d39d0fdb7859@oss.qualcomm.com>
In-Reply-To: <20260702-xo-sd-codec-v7-b4-v8-0-d39d0fdb7859@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIwMCBTYWx0ZWRfX4BX3nVY2hFEB
 LsKYpvEVQvjwho/iYPt9xoHAgT7Mca8X7RtKNAEnEn1NGPmiCcq8sEfL348HEykaRXbT8etfeRS
 H2YHGZr7lj2iDhA4541JZDIgubroe1Q=
X-Proofpoint-GUID: YOZYE7KhAB6Bm9CBAKTDam4fkIeSBQfk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIwMCBTYWx0ZWRfX9DYbJlm/PNJF
 b5v5imETUqBLqhOdm9giAgcUGabdfOitqEp8O6EZB32SIoX7gzAS/sYaxIVZ3cfC0Dl8qhLAypG
 gnKWbixuHpXgrsnGZUCVnrM8ELnnDtySD6NR+Z4q9lpqGPBS4VVWBgCnE+cvLSbmNkWWGb6CE0V
 andPcAyudOwaV/V7e40sS1e2MVBNF7TkwfRc7T9g3uRJSz+OvPY4hEehnOOzl1oygyFYFUytMvU
 6g0TbDKs2GFwYRgFhOm+RpMZ/8gZRl45P8XjPgkjUq53J2QYMUEhwRAQPntY87hQWy02NvPVVP3
 vD46ZlBM3A6n8D2KKd9zQt+N75Db3zMqlZezcX2EFVAOYTWRXJdro+04bjzHsnRusZgYKtWdbd+
 0P2YAgWZaGkD695BEzqrvbqSXxFaa0hSLhybcliUSITMfhG88lTBG3DmhI7HNZM3R09u/DYm49l
 etgHYwbh9xKqn5+MH7g==
X-Proofpoint-ORIG-GUID: YOZYE7KhAB6Bm9CBAKTDam4fkIeSBQfk
X-Authority-Analysis: v=2.4 cv=PbLPQChd c=1 sm=1 tr=0 ts=6a456058 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=akXh_AD3SVDOJReeMSQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010200
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115775-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:ajay.nandam@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 680ED6F0AFF

Convert the LPASS WSA macro codec driver to runtime PM clock management by
using the PM clock framework.

Replace manual macro/dcodec/mclk/npl/fsgen clock toggling with PM clock
helpers and runtime PM callbacks. Keep the SWR gate runtime PM reference
from SWR clock enable until disable so autosuspend does not gate clocks
while SWR is still prepared.

Set autosuspend delay to 100 ms so PM-clock-managed votes are dropped soon
after idle while still avoiding suspend/resume churn on short gaps.

Add a PM_CLK dependency to SND_SOC_LPASS_WSA_MACRO since this patch
introduces PM clock APIs.

Tighten error unwind by checking pm_runtime_put_sync_suspend() in probe and
by restoring regcache state if pm_clk_resume()/regcache_sync() fails.

Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/Kconfig           |   1 +
 sound/soc/codecs/lpass-wsa-macro.c | 131 +++++++++++++++----------------------
 2 files changed, 53 insertions(+), 79 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 252f683be3c1..92cfa623782c 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2897,6 +2897,7 @@ config SND_SOC_LPASS_MACRO_COMMON
 
 config SND_SOC_LPASS_WSA_MACRO
 	depends on COMMON_CLK
+	depends on PM_CLK
 	select REGMAP_MMIO
 	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm WSA Macro in LPASS(Low Power Audio SubSystem)"
diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 5ad0448af649..718564ee381e 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -12,6 +12,7 @@
 #include <linux/clk-provider.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
+#include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 #include <linux/of_platform.h>
 #include <sound/tlv.h>
@@ -2529,15 +2530,13 @@ static const struct snd_soc_dapm_route wsa_audio_map[] = {
 static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
 {
 	struct regmap *regmap = wsa->regmap;
+	int ret;
 
 	if (enable) {
-		int ret;
-
-		ret = clk_prepare_enable(wsa->mclk);
-		if (ret) {
-			dev_err(wsa->dev, "failed to enable mclk\n");
+		ret = pm_runtime_resume_and_get(wsa->dev);
+		if (ret < 0)
 			return ret;
-		}
+
 		wsa_macro_mclk_enable(wsa, true);
 
 		regmap_update_bits(regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
@@ -2548,7 +2547,10 @@ static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
 		regmap_update_bits(regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
 				   CDC_WSA_SWR_CLK_EN_MASK, 0);
 		wsa_macro_mclk_enable(wsa, false);
-		clk_disable_unprepare(wsa->mclk);
+
+		ret = pm_runtime_put_autosuspend(wsa->dev);
+		if (ret < 0)
+			dev_warn(wsa->dev, "runtime PM put failed: %d\n", ret);
 	}
 
 	return 0;
@@ -2774,25 +2776,23 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	clk_set_rate(wsa->mclk, WSA_MACRO_MCLK_FREQ);
 	clk_set_rate(wsa->npl, WSA_MACRO_MCLK_FREQ);
 
-	ret = clk_prepare_enable(wsa->macro);
+	ret = devm_pm_clk_create(dev);
 	if (ret)
-		goto err;
-
-	ret = clk_prepare_enable(wsa->dcodec);
-	if (ret)
-		goto err_dcodec;
+		return ret;
 
-	ret = clk_prepare_enable(wsa->mclk);
-	if (ret)
-		goto err_mclk;
+	ret = of_pm_clk_add_clks(dev);
+	if (ret < 0)
+		return ret;
 
-	ret = clk_prepare_enable(wsa->npl);
+	pm_runtime_set_autosuspend_delay(dev, 100);
+	pm_runtime_use_autosuspend(dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
-		goto err_npl;
+		return ret;
 
-	ret = clk_prepare_enable(wsa->fsgen);
-	if (ret)
-		goto err_fsgen;
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		return ret;
 
 	/* reset swr ip */
 	regmap_update_bits(wsa->regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
@@ -2809,56 +2809,37 @@ static int wsa_macro_probe(struct platform_device *pdev)
 					      wsa_macro_dai,
 					      ARRAY_SIZE(wsa_macro_dai));
 	if (ret)
-		goto err_clkout;
-
-	pm_runtime_set_autosuspend_delay(dev, 3000);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+		goto err_rpm_put;
 
 	ret = wsa_macro_register_mclk_output(wsa);
 	if (ret)
-		goto err_clkout;
+		goto err_rpm_put;
 
-	return 0;
+	ret = pm_runtime_put_autosuspend(dev);
+	if (ret < 0)
+		dev_warn(dev, "runtime PM put failed after probe: %d\n", ret);
 
-err_clkout:
-	clk_disable_unprepare(wsa->fsgen);
-err_fsgen:
-	clk_disable_unprepare(wsa->npl);
-err_npl:
-	clk_disable_unprepare(wsa->mclk);
-err_mclk:
-	clk_disable_unprepare(wsa->dcodec);
-err_dcodec:
-	clk_disable_unprepare(wsa->macro);
-err:
+	return 0;
+err_rpm_put:
+	if (pm_runtime_put_sync_suspend(dev) < 0)
+		dev_warn(dev, "runtime PM sync suspend failed in probe unwind\n");
 	return ret;
-
-}
-
-static void wsa_macro_remove(struct platform_device *pdev)
-{
-	struct wsa_macro *wsa = dev_get_drvdata(&pdev->dev);
-
-	clk_disable_unprepare(wsa->macro);
-	clk_disable_unprepare(wsa->dcodec);
-	clk_disable_unprepare(wsa->mclk);
-	clk_disable_unprepare(wsa->npl);
-	clk_disable_unprepare(wsa->fsgen);
 }
 
 static int wsa_macro_runtime_suspend(struct device *dev)
 {
 	struct wsa_macro *wsa = dev_get_drvdata(dev);
+	int ret;
 
 	regcache_cache_only(wsa->regmap, true);
-	regcache_mark_dirty(wsa->regmap);
 
-	clk_disable_unprepare(wsa->fsgen);
-	clk_disable_unprepare(wsa->npl);
-	clk_disable_unprepare(wsa->mclk);
+	ret = pm_clk_suspend(dev);
+	if (ret) {
+		regcache_cache_only(wsa->regmap, false);
+		return ret;
+	}
+
+	regcache_mark_dirty(wsa->regmap);
 
 	return 0;
 }
@@ -2866,36 +2847,29 @@ static int wsa_macro_runtime_suspend(struct device *dev)
 static int wsa_macro_runtime_resume(struct device *dev)
 {
 	struct wsa_macro *wsa = dev_get_drvdata(dev);
-	int ret;
+	int ret, sret;
 
-	ret = clk_prepare_enable(wsa->mclk);
+	ret = pm_clk_resume(dev);
 	if (ret) {
-		dev_err(dev, "unable to prepare mclk\n");
+		regcache_cache_only(wsa->regmap, true);
+		regcache_mark_dirty(wsa->regmap);
 		return ret;
 	}
+	regcache_cache_only(wsa->regmap, false);
 
-	ret = clk_prepare_enable(wsa->npl);
-	if (ret) {
-		dev_err(dev, "unable to prepare mclkx2\n");
-		goto err_npl;
-	}
-
-	ret = clk_prepare_enable(wsa->fsgen);
+	ret = regcache_sync(wsa->regmap);
 	if (ret) {
-		dev_err(dev, "unable to prepare fsgen\n");
-		goto err_fsgen;
+		regcache_cache_only(wsa->regmap, true);
+		regcache_mark_dirty(wsa->regmap);
+		sret = pm_clk_suspend(dev);
+		if (sret)
+			dev_err(dev,
+				"failed to suspend clocks after regcache sync failure: %d\n",
+				sret);
+		return ret;
 	}
 
-	regcache_cache_only(wsa->regmap, false);
-	regcache_sync(wsa->regmap);
-
 	return 0;
-err_fsgen:
-	clk_disable_unprepare(wsa->npl);
-err_npl:
-	clk_disable_unprepare(wsa->mclk);
-
-	return ret;
 }
 
 static const struct dev_pm_ops wsa_macro_pm_ops = {
@@ -2929,7 +2903,6 @@ static struct platform_driver wsa_macro_driver = {
 		.pm = pm_ptr(&wsa_macro_pm_ops),
 	},
 	.probe = wsa_macro_probe,
-	.remove = wsa_macro_remove,
 };
 
 module_platform_driver(wsa_macro_driver);

-- 
2.34.1


