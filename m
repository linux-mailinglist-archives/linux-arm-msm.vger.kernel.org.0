Return-Path: <linux-arm-msm+bounces-105502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFAGE/rH9GmMEgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:34:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD7F4AD9D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7584303E4DD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 15:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 612EB3D16E0;
	Fri,  1 May 2026 15:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5dXpGMA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE303D093A
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 15:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649580; cv=none; b=X6suNeuMh8t6V266bfnHWITixaJdO23BM00HdbWyy9DC5gkcLbQFcD0FCrA7CKK1Gt9F5jvX/hng88kYreuOJi5EvvjOLtHe/ByuOYv2qATgtvcZKS9Z0o0t2yHbx3uMfoJI5exeymFtjacjwilhjP15EStktZXHkVQbC7A0k90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649580; c=relaxed/simple;
	bh=uNst4wFXLs+ypVn4MIocWwRHY+8OwRVsZ3rpweDmCq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GGE7rc6vQDz64Q5lrN4136WM4SlALmXO20V6bfY3cDt/bDZWFvCyE3oufJKfNne2mINWdmOswBPtnPR/7fB9hAFSpSM/bLsVdL5nARTEVmYKtso1rQgrVoLbTTResiXzdrMwrD8Dlq3IytL5UyLkcJNzGGeQr5LEBnSFLtORp7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5dXpGMA; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8ef5776530bso228287585a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 08:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649577; x=1778254377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hd5q2/ML7LI707TCF3uo8+/EE69k9ucmyKQKjySdhtI=;
        b=G5dXpGMAKvBaH75ThiprhSLIAMpnbaK3hGr+P4SUaycP8zW3JNgI8jGxPFHv6SSlSU
         P2IeQjuvYKECLOSc0taYPqwPGVfU6iT2LISm2v3vGlI668UoH5mBE4VaNsBnstUB1Noc
         vWVr9N8R8IYyx2Jeh6XSZJi3NNOItLr2T/PjMJWzFDXBT4O9umkCx3I4avWShyyjGbQg
         hviLKzR4Fv/BXrZJTLHiyegdA4uhmCtOoG4MytbD02hsKreI6c9V1zKd8i2NAwFIOL6A
         od6uNQ2ONzcB75OoWQT4Pk2j5QYXLfxDyq1cI7GjK0Eetcux+k+OjWX6UpmwWCuL9KnK
         b1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649577; x=1778254377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hd5q2/ML7LI707TCF3uo8+/EE69k9ucmyKQKjySdhtI=;
        b=eqcMSZlfjDQvnZ6eM08XGYOFTI4Cr6Wwgk88Ym2Jn1DuF9DRgIOqLqXNqjKX+vhqSa
         OEBPn1GKd6bv6mXGY8GufDDkdq5EyL2OEhkuqkRsEnLG2ZY72MldGuGji1ZE6Fzr0lJ5
         toc1EgvM678JqZbQWnXmlY89RPVqtwygbIO04Oel3S6gjuC7iHefzS0HI75a9N6Rkre0
         umzSQlg2pcnCxhgX9uskTLcEyasLmV7Ed8TcGJ3WJ+PrVfBZVFNagSuYFADYvxYMA/Xn
         NbCSAoqBjZxE/aAz+V1b2EhPCRLDYe23kdOuWus7tfcJDFLQdYXbFGIr+HyJtpyy+t7h
         0o2A==
X-Forwarded-Encrypted: i=1; AFNElJ+m3YDloJnv2H3rMJ7ncfiJVJr7E/pdxRXQXwglSpViXP313xpTBCL1tIl4GAzKYtFwrF8AgKzo0wNSFVeV@vger.kernel.org
X-Gm-Message-State: AOJu0YyPANqof8Ct5ERmZSGsbkxXpSuYjnwLRSgAj7/877wSwAe3Do21
	yml7jogBusbYdb+Vz8JsV77PFD6KYBcR15dxJ3OJ3w/xoTu5iPB1GyXt
X-Gm-Gg: AeBDiesT39P0/wi4Rtzo8KgSy/IalWHH0O2FGmMeOj3a3brzd5+M5NbSC5fZhJ/5e8q
	+aYAY9xDU2V+s9/Qz51CXeYliIYTwHtuwv/QrE4PiJNw9fl1Dbgvzi43724a0LfRTKQZxNQswfs
	pMxQ4TKoGM1HJiPDT0eKOd/gvpFIPMhojH2qrWU8yh8L8Y9NtQPm47Z53h0OWnJzspJjEwr4Vuh
	EpKREL3zOw4A6OABezeltrqdCJwo1WtHlAHDpK8bL48940Uq35Z/AzdpTC3c/HrHG2KYvCR2EzR
	B87hx8l25UP1cSk1lZyJWA1xKa3PuUGS3/qdAkMgiLqMyWMOs6YHzQ8m2KieMcjZa96Ugf+yRjq
	DHHkVWuFz6wfgH205Grw3006aGV0mmKTXvsziIFOZ3IVeWZ2itvLuHD/gOYg6xBXPxqHhU7L2VS
	W5/xKr3TgY/MP/0RULQ4yE+6pypgNSq87LByNSfSkYhRrd5Rr8l5zZe483YMjJoPHKSfHy0evZ+
	6Jfx3CaQiFfQGnRWKgyZw6YAzGWG/GlIkqb
X-Received: by 2002:a05:620a:2982:b0:8d0:3add:30d8 with SMTP id af79cd13be357-8fbf3c332efmr494881485a.52.1777649576778;
        Fri, 01 May 2026 08:32:56 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c9229c8sm201804785a.36.2026.05.01.08.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:32:56 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 14/15] ASoC: msm8916-wcd-analog: add pm8953 codec
Date: Fri,  1 May 2026 11:31:27 -0400
Message-ID: <20260501153128.8152-15-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501153128.8152-1-mailingradian@gmail.com>
References: <20260501153128.8152-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BBD7F4AD9D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105502-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mainlining.org,gmail.com,oss.qualcomm.com,quicinc.com,linuxfoundation.org,kernel.org,opensource.cirrus.com,renesas.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email]

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add regs overrides for PM8953 codec.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
[Adam: rename codec]
Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 29 +++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 13df60409857..b9325290c28d 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -755,6 +755,34 @@ static const struct wcd_reg_seq pm8950_data = {
 	.seq_size = ARRAY_SIZE(wcd_reg_defaults_pm8950),
 };
 
+static const struct reg_default wcd_reg_defaults_pm8953[] = {
+	{CDC_A_RX_COM_OCP_CTL, 0xd1},
+	{CDC_A_RX_COM_OCP_COUNT, 0xff},
+	{CDC_D_SEC_ACCESS, 0xa5},
+	{CDC_D_PERPH_RESET_CTL3, 0x0f},
+	{CDC_A_TX_1_2_OPAMP_BIAS, 0x4c},
+	{CDC_A_NCP_FBCTRL, 0xa8},
+	{CDC_A_NCP_VCTRL, 0xa4},
+	{CDC_A_SPKR_DRV_CTL, 0x69},
+	{CDC_A_SPKR_DRV_DBG, 0x01},
+	{CDC_A_SEC_ACCESS, 0xa5},
+	{CDC_A_PERPH_RESET_CTL3, 0x0f},
+	{CDC_A_CURRENT_LIMIT, 0xa2},
+	{CDC_A_BYPASS_MODE, 0x18},
+	{CDC_A_SPKR_ANA_BIAS_SET, 0x41},
+	{CDC_A_SPKR_DAC_CTL, 0x03},
+	{CDC_A_SPKR_OCP_CTL, 0xe1},
+	{CDC_A_RX_HPH_BIAS_PA, 0xfa},
+	{CDC_A_RX_EAR_STATUS, 0x10},
+	{CDC_A_MASTER_BIAS_CTL, 0x30},
+	{CDC_A_MICB_1_INT_RBIAS, 0x00},
+};
+
+static const struct wcd_reg_seq pm8953_data = {
+	.seq = wcd_reg_defaults_pm8953,
+	.seq_size = ARRAY_SIZE(wcd_reg_defaults_pm8953),
+};
+
 static int pm8916_wcd_analog_probe(struct snd_soc_component *component)
 {
 	struct pm8916_wcd_analog_priv *priv = dev_get_drvdata(component->dev);
@@ -1304,6 +1332,7 @@ static int pm8916_wcd_analog_spmi_probe(struct platform_device *pdev)
 static const struct of_device_id pm8916_wcd_analog_spmi_match_table[] = {
 	{ .compatible = "qcom,pm8916-wcd-analog-codec", .data = &pm8916_data },
 	{ .compatible = "qcom,pm8950-wcd-analog-codec", .data = &pm8950_data },
+	{ .compatible = "qcom,pm8953-wcd-analog-codec", .data = &pm8953_data },
 	{ }
 };
 
-- 
2.54.0


