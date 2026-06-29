Return-Path: <linux-arm-msm+bounces-114964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cEAJJSBGQmro3QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:17:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6526D8C93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:17:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=i0zvWpc9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="WIhoX/ij";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114964-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114964-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 661F8301514E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118C73FC5C9;
	Mon, 29 Jun 2026 10:06:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C833FBB5A
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:06:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727576; cv=none; b=Bt195QgYR5LUtbO0MZojQoDHBnvOFK271revH4yVZ9r3Tww2aTXQI5yRaJx0MvsewMFOtLkcgfOAqPqT4+ag6iRMBPy5Bmw6+IjCpnDY11DmPTB5nc+8a6aMv+TH4xINFg7uvizQp0hA9AzlQrK8blvdakcaW8e/WZXo2VzPl0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727576; c=relaxed/simple;
	bh=vm7dfdCx5eEKKAkbg3pHCxHhdSCJnSGMdrO3c9tr4uU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DcO44ZgpkRnDY1Rnn1i+b9xKeHr1ZeerwC4l5108KwOWCuFJu1m2sJ0eJ8xBZ4ZSXOx2fJEt7qEWT7bb7391H9FQsnZItMWIQ8/6Q7uZ5JHQGeq2CmRNWYvaZHar58v21yzvE46sW69vAVgYe4N7BsU1+JkLb0l2rpP0HxB5dL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i0zvWpc9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WIhoX/ij; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T9n6Dr2529391
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v2MdIEPc3guzfuzHvuyFydm6CTIvNmh3K66GGevE20w=; b=i0zvWpc9Y7izMkG7
	RzAeOtGSjWbW3mBD5muI1gHtLmI1XdHoXCCDUYN138XbMe9ab5ukBj9LLqeUa73x
	k+cUD2B/USuxN08WZ5jHzu+Jmmyk+TtSisp/V3UGsNUlUVbQEOc1RIQOzBgC449B
	nRFEMUJdXVFbDgziQs1gCz11WcKxa2zTy25yv4EOWxDFvtYq/SgFw2f/T/HHG5Mn
	RK+tfsluxexZLuui0VQrgJkz2wK/1+tr2SMEzzu7mvyf7ftdr6ftccZMNX810FVJ
	4MyenYnVecSUeX/hByBOZMT1mObuMngEKOYZXw5s1JATdS6rXFNrNxC4O3PBhAHM
	ns5Ekg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3pdkr27d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:06:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c97c161d0bso22588265ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727572; x=1783332372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v2MdIEPc3guzfuzHvuyFydm6CTIvNmh3K66GGevE20w=;
        b=WIhoX/ijhLgTXHpxpNojlkGq94qwfmcmCZUduJyjKk03h1l2Aw8gt9Evv523pmUbFp
         GxK2Q9YnX026prK1g/TNgYwVb51+Clig4mx7hh8oC+hNtIpbTo9PxSDBhIPknI/axdLj
         DY73M8k/Nb8f/FhoozQ6YUC4rUa2EluQ1piogoTJWUu7xCE65bNel49wvV9UIyRxBtXU
         8yy3/Az3D3E+lcZbaiLVRphIyCZ0OU2WH3ApQGx6fVKWApojKbu/kXtP108/xKYJ2s4A
         Cj5JH8nSzgykqpSgjIQLt+9zEGl6oWdFz78Gr1Em/TFdbPj82/tRN+/4bzJDXhhbfCsv
         MKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727572; x=1783332372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v2MdIEPc3guzfuzHvuyFydm6CTIvNmh3K66GGevE20w=;
        b=e8JeViB4cqgTS9ugxY0g5K8MIVFDOsryBbOqxD3iNNFBHepIIBv8zSlLe+RRkhPt0s
         YPenGOFM93B1/WlLay3Dga2lVBPoPsl3zF0WyYZC7VScSWnoZKc1/WhB+OW0SAUBZdMf
         1naQFBWjhNRjS+QhdW7U8xBI7YBRQMn4mTp9ZAIbuBAnumo313DbLA78DaiNupHnzDeI
         YA8XwitJEYsHhthoX/miFEvlScnxkRO/lGb59eZPzcTr/FWWPLUr3NX4pwJmGGyhZQcG
         f9/nKxtH8EYNTuKDv4DOK0MciD/kRDoBSrCe8g3zozRcYClwc3EAsVbEZo1IfWRMTEM1
         HfBw==
X-Forwarded-Encrypted: i=1; AHgh+RpUlvjLZAJZG0w+iDuMkgMjaxMAkvQwDjmb3+VyyCOC/rRFfSCa96xQMRRo++azEq3DV5PIbWRSm+cBs4UE@vger.kernel.org
X-Gm-Message-State: AOJu0YyzHY3w92sVgP5KkSF8cxm+e27XAB46qNCszTEoLpZQs7SBjbzf
	lu7bKt5HDmq2aQkWapyU77DZFo6B74gfEcbkHs5EevewNzPMoAan7r3kweTLjcni5FLPf+InqdQ
	mgM3rKgDKJrG5seWorra52cvdnxkq89Q/3E4MnRNqkjWODTEcNQYx2/KvYH61kyapTUXm
X-Gm-Gg: AfdE7clxNnBHBVN6MU0NMpLmirM/7wZX7kZThRuza2CwH5epMGWrq4RmaaCO3ZDUtTv
	3840aBJaO1k9rqM+7HEPU768xpA6xqEhCwHVsvV/BD4GcYJJko+iFWvCdcQXVYtHjo2MU//xx/h
	V1TpXFESHUuDmdlWOqMKlu7WwWGd5y6kdMD7QWkpXr8YaOHM/FcJtktvDPD2apEvrXiB7e45K6v
	0wU+wOnKLiYdyKWMSbk+fvTkT0IRdRplmY2lY4J98ya2gYdiRw7O2m9N8WSqnxNqtCA1RKN0oTl
	rHoyFS4EeHr0qRw+iq4VL1I++y0pFemZKYmiNXClLEZa4blkPRkAz4l5Fhfmr4lTCQqTdGuPdz0
	qyr6CUsbm1qhu9stu6OdjVUJ1w6oSsMJ38YIdjxQ=
X-Received: by 2002:a17:902:e742:b0:2c9:b916:2eae with SMTP id d9443c01a7336-2c9b91647a1mr54715855ad.23.1782727572378;
        Mon, 29 Jun 2026 03:06:12 -0700 (PDT)
X-Received: by 2002:a17:902:e742:b0:2c9:b916:2eae with SMTP id d9443c01a7336-2c9b91647a1mr54715625ad.23.1782727571924;
        Mon, 29 Jun 2026 03:06:11 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63cfe81sm88924305ad.55.2026.06.29.03.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:06:11 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 15:35:39 +0530
Subject: [PATCH v7 2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock
 framework for runtime PM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-xo-sd-codec-v7-b4-v7-2-fb37ce457c42@oss.qualcomm.com>
References: <20260629-xo-sd-codec-v7-b4-v7-0-fb37ce457c42@oss.qualcomm.com>
In-Reply-To: <20260629-xo-sd-codec-v7-b4-v7-0-fb37ce457c42@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a424395 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tLfOVjUU_VM9_-uA5fIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: TaQZlQ2wIdl0EfhaDifoRCvCvEB2pwil
X-Proofpoint-ORIG-GUID: TaQZlQ2wIdl0EfhaDifoRCvCvEB2pwil
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfX238HldR9j93a
 WRL8PcwhNWMJwgpBxkmsaLmbyt2gaTqXrAb7yXIXQAwVNDQvNVG3XA1VijycbmbzATE5XE5jeiM
 vOeZptRyeZDymYG51puSdIs5PIY1pWX+vhOFd0vtZkzLw9tCfNmBm+oHqHhDqPfrVoxQUTsHv/i
 eldZSAcy5jkF6IJUcQqhS4WfcyOws94Uy4WPoWIVBPGwYyLGV//z70PtIM/M9jqdL6gyAE+1wYy
 Mzc/OfSysi/0WH+jZyXMsAJ9VIGV9tmIQRp+hSwNMmPQLBg+fWz5fDrBhNp0lZ/gYKBHei8M/Vu
 SndbAnKB7FcOA14riOjK0NVNJ/n7MYswaFb63S4G3foiEcrx+VIU61rxfdH8Bv8Ya6kfMptwHmd
 WX3Ahq18aN2tOB8IWx5FNx9hcDUbGZGxWVKLxLLdKKRxe5tFxKBvJ78+DTw4RXGqHehqspNWsJ4
 7ThsIvIQYhvCiMm9ZMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfX5ITHUZeui4Ar
 siRhz2gJXXRTnuswFI3b0pMp0targwYBRtNtx11vn/lMbhK5YAXnm+s1zLLo+R51c0Q2ioeIXLF
 QWidartGT3NV8sfFqs+OqETWJmzBHRM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114964-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:ajay.nandam@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 8B6526D8C93

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

Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/Kconfig          |   1 +
 sound/soc/codecs/lpass-va-macro.c | 142 +++++++++++++++++++++-----------------
 2 files changed, 80 insertions(+), 63 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 92cfa623782c..030bb902fdef 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2904,6 +2904,7 @@ config SND_SOC_LPASS_WSA_MACRO
 
 config SND_SOC_LPASS_VA_MACRO
 	depends on COMMON_CLK
+	depends on PM_CLK
 	select REGMAP_MMIO
 	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm VA Macro in LPASS(Low Power Audio SubSystem)"
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 528d5b167ecf..13139f60f604 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -10,6 +10,7 @@
 #include <linux/of_clk.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
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


