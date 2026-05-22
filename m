Return-Path: <linux-arm-msm+bounces-109317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBHsAOdXEGocWgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:19:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FAC5B4FFF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:19:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5D4AE30416DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B863976A9;
	Fri, 22 May 2026 13:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZXYQplg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T0LR/Ty3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6529E399CFC
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455106; cv=none; b=oxmz5gnRk0qFsyOfFMj6kgo5qDh2Sh13ipTlU2OIgRsWdBp5P2OMNc2Kz08I/QTSSXzkurltDPzK6Krk/2MPvmtUgW8yNVb7vZmwmYaVLVloKyn1pHfsZfmVwW6vbnjuXJXB4udcfMj+dWiKES4NDKhhtOYeSLhRhxQ7H5Ct+3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455106; c=relaxed/simple;
	bh=VeD4JQfS/1AoAw4aOWpjL1lrzeX2Zyzw2YCrKQxz4+o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fvJNLp89c6AUkdF0VgxgcXPk+G08eUQy7QCZEmoSyM5EO9rKiT4yHP+qhexH47LXYyIMngyJIxJHmcCSQ4bRbEQ5c8VEs4hYChf8alnmg/PrTS4HMYxxwp6VkfadC/2z8V8HfMHH+B2kw27nAQaW4hZmmdrr4YYT/kbwrLwFknE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NZXYQplg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T0LR/Ty3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8agH9399180
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rxPfhw2flID
	raVtqe9z97WATbtzk1olxuMwrasx75fQ=; b=NZXYQplg7RPN+KI9XOfskGfMRBh
	xde3dpqk7wfAiAc/wln0MgJMo/noZJaoPOguCRLjg1rL0NLD87Xyw1N/gSA5t7w2
	PFyK49xEQ6XqHhftBv0K3T1BEJqtR+EIJnuHbOVtgwZ+o7g5pm6mvYNc184m/dnj
	q+MtozIPqemAhU5/LfPnZAbEaofRKo1L94EZtOZGWeZ6j3WWxcgVPeca4wO1JfjS
	X/Bs4YvbLf61F3alLrydRxYRbsO86JSc35zKL1eZji60PZWtvL8Ab9GIAFn6TXOT
	Ik8ZiXEZr8NNA7bmkcDqcvQR8lK4ag+H90qlWqwHdh5kz/3NfAMTIPeEpTQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea5p9vcm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:05:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36629e48023so6982137a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779455104; x=1780059904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxPfhw2flIDraVtqe9z97WATbtzk1olxuMwrasx75fQ=;
        b=T0LR/Ty3j6N3mxEIjG9oRVZdmte7O3qGusDkg/QSJhzpYVh26R9gUlk3E48Skxqx7w
         RCQoQVtSPE5wpyF4eLQbqgvIQtm8HjGqgRWKXmjdpKI23yf44u4rvxkBb1W0oN/oyz06
         TaijCJXZjI3qCxyWcf0EOIQOAjixRlD6xlMfULGgUZQ9CKjVXGgMWgoNC6QnYfjM0cDg
         m2DNi7JkbuxtDq5FLAQs9OfKyrwp2RV0GAWArRQm3NeC6KbEorWNu1OB6Cjp0Jb4WrTm
         Es9nPDZeDUNvmekT9ML6DFTCtP2b+pYbM/6SCkR12RHmXWUdeWBk1nVtVXKONe7jMUpm
         E21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779455104; x=1780059904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rxPfhw2flIDraVtqe9z97WATbtzk1olxuMwrasx75fQ=;
        b=EyHIZmWj0grDTMU6YLtFHYX72W9WzCVqxjFtEo7TH7HJQleRyZxbuDJCHK8oGYRO6c
         TwPODp9qTcmbXXNdCmdt2hHEte3QsHi73j9MEGRbeX5iX2Et0Bqa9J9+sC3cMMteKzak
         n5Sckej0/yjHHkJ7x3/wFB4Ee76KmGXw+2puwlzakOnHsTCJNW/UUeo9G8iTUssy0p1f
         Qc7D7DbOMUw4v9OOmX26GYA/50VK/nEOhsEdET2snEl650voTG1mJqsrOVhAUrmpGoaj
         3yR7G2aSJdzb+L2GIAk0uhaHqB703UpHGgwHQ5sjljPNjmzSOoDAptCRi+FFQnQoRD2q
         Yrmg==
X-Forwarded-Encrypted: i=1; AFNElJ9ht0BYuKrK6n9Wt/f6bNjzNPVz9jjgeDY4zWXrAQ7ftpEV0wBPsObj5S3985SI6RxdfLk9SWY6BCluGnlB@vger.kernel.org
X-Gm-Message-State: AOJu0YxG5LNv9I7KdHj4OP5yoxxf9mzEB4GLAfSAd7wKPBAaAeGWzf1Q
	t6gWzaldXUrV+h5/kB2hLTIWxvVCb3xY0tJMSF8LJfNYZrFJKY3Wvqpq+i/FhrCcfN8/uYZacNd
	z86sUFw8mJtXXZZf3o3oa0lNKHGVwfQEjV6RsLjk2pST3rm6JXXCoqfLt864RdKWljE9QOfMkBl
	Rb
X-Gm-Gg: Acq92OFhJYAYlFCDbFCJ9Xh01ZQgJD5sgQ+Q9Vri6zjhaqHXbz7OJQT11d5IZxcaFsT
	rvvseuXu4akxx9Ab1M2PZPCU87OEJlvbq6Q+laTY/me0UT+qUW6+YaUDQsdlwax7iVUMnTYr1Up
	4ihfbxSp2v1BsrAUDooc+Y2iznMApd4rThKIMZ+iz7M74qYc9CTKlli1TOm8BdiFY9ii0cFquVz
	6F9A3L/X2XFBFN2EOBghvvbZOpxs30r5Vrd0Ygp7PXN5WRU2Fq+zvBVXriW+3FB1tfZELKKO60W
	a9S8xmEVUq48BtMVAT7Ajzzv8DiZGhiXb4rvwoVU2wcV8kE5DYv/u0ZZdzxcnOrurlMmxqBen2d
	gBOhFjmPJMC51ZJnNd55l6mdlsGYBD2I+5o6EdO+9qucEDzrlSw==
X-Received: by 2002:a17:90b:5845:b0:36a:5d1f:7c1 with SMTP id 98e67ed59e1d1-36a6741d7bamr3650639a91.3.1779455103683;
        Fri, 22 May 2026 06:05:03 -0700 (PDT)
X-Received: by 2002:a17:90b:5845:b0:36a:5d1f:7c1 with SMTP id 98e67ed59e1d1-36a6741d7bamr3650591a91.3.1779455103182;
        Fri, 22 May 2026 06:05:03 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c98b95sm2069980a91.16.2026.05.22.06.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:05:02 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v5 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock framework for runtime PM
Date: Fri, 22 May 2026 18:34:40 +0530
Message-Id: <20260522130459.3411038-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
References: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DKm/JSNb c=1 sm=1 tr=0 ts=6a105480 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pVYhVJ8p5r2umpfo35QA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: mQ7L989WE1QtKbf1Bu_9QDYUOcLLKi-A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzMCBTYWx0ZWRfX1yqSC+vagkPK
 TfJKipX8oUbLDkpVmGVehuWm+C1Rhx53d/C6ZkS41suhCwV6qgJYYs560ohOhHYKdrSQye3h3qe
 /CWllBIYko1uzVCJrTyeNWtEPRYZ4m/9n/5gSY3HgMOR8eaWbaNU64xtaGJhAZHYVe1cuq7i6ZQ
 WKbd6OBBt+gAWT+LA7CPq4xAeDApcRWY3w81z1eMTAw4PCVOkFtVRrHBVcMUU4SspoHMMZfKN6Z
 jikvUdCYGrJkFFv1OFjxhL7uI0st4SoSiK12Y1pDiAiqCVe61lCmlIQ6SD+Bs0p6QsLfdhy4s7h
 uAPwWIcrrJDFC+6HgP3xR1DZq71aFX7QcO71N//zFHnalM8PCVLdG3DHdRvqdnfLieb6TAocFwZ
 /PyDQyFFz9Cr8LpV2wFTl9rh3+fmspzclkd9lg0MV7z0XVSexbUvOITu9GCyvwpCrQoXoQ9kzOO
 MGmwHck9udq2plY4PcA==
X-Proofpoint-ORIG-GUID: mQ7L989WE1QtKbf1Bu_9QDYUOcLLKi-A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220130
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109317-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 98FAC5B4FFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the LPASS WSA macro codec driver to use the PM clock framework
for runtime power management.

The driver now relies on pm_clk helpers and runtime PM instead of
manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
clocks. Runtime suspend and resume handling is delegated to the PM
core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
PM callbacks continue to manage regcache state.

This ensures clocks are enabled only when the WSA macro is active,
improves power efficiency on LPASS platforms supporting LPI/island
modes, and aligns the driver with common ASoC runtime PM patterns used
across Qualcomm LPASS codec drivers.

Keep the SWR gate runtime-PM reference from SWR clock enable until
disable so autosuspend does not gate clocks while SWR is prepared.

Add a PM dependency for SND_SOC_LPASS_WSA_MACRO so PM clock helpers are
available when this driver is built.

Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/Kconfig           |   1 +
 sound/soc/codecs/lpass-wsa-macro.c | 119 ++++++++++++------------------
 2 files changed, 47 insertions(+), 73 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 6f587e39223b..4e17119f2f9e 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2861,7 +2861,8 @@ config SND_SOC_LPASS_MACRO_COMMON
 
 config SND_SOC_LPASS_WSA_MACRO
 	depends on COMMON_CLK
+	depends on PM
 	select REGMAP_MMIO
 	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm WSA Macro in LPASS(Low Power Audio SubSystem)"

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 5ad0448af649..598292fe3219 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -14,6 +14,7 @@
 #include <sound/soc-dapm.h>
 #include <linux/pm_runtime.h>
 #include <linux/of_platform.h>
+#include <linux/pm_clock.h>
 #include <sound/tlv.h>
 
 #include "lpass-macro-common.h"
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
-	if (ret)
-		goto err;
-
-	ret = clk_prepare_enable(wsa->dcodec);
+	ret = devm_pm_clk_create(dev);
 	if (ret)
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
@@ -2809,56 +2809,41 @@ static int wsa_macro_probe(struct platform_device *pdev)
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
 }
 
 static void wsa_macro_remove(struct platform_device *pdev)
 {
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
@@ -2868,35 +2853,27 @@ static int wsa_macro_runtime_resume(struct device *dev)
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
-- 
2.34.1

