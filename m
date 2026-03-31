Return-Path: <linux-arm-msm+bounces-101149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADVXMiAkzGllQQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:44:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BBB370C1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 105C130F9DAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6573A8725;
	Tue, 31 Mar 2026 19:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5eSW6D9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CFD3A0E84
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985992; cv=none; b=WkY6Hci2wFRS1v4ZfVvwjFLuAf6WIlyuJNQfpm1q2asdwFjbQzDhbfyT5+mfzilYjXTAQXlNmdWhnMqGpi6Y+w6ABTBxgoHrc/srZk2Xt1KYe6LQEwIyz7x5qPnORJtKG1W7O9HghW5TpQ9feCPgAFLSxOt1PWFTjlTXlITHQ+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985992; c=relaxed/simple;
	bh=25Ssm1pTyidSK4bu+YPT+VBaZ1s9qfx89ekS0dcj71o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dk5rAjDN/I1KTENnAHOxR+O0ix1hWxsAK+DPklAQrnIoDEVH94y8xFddWif8iPxjGR/effqox9G9EJww5WAJ+Q6YdNyIBiP/+GJ50/XDvjrbzIKsWluMHOpssrMjJ1CXPLT6fZQ1fkv6rqRNIy6DKF0XfcKKDc41ZQCPdhQ3Ols=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5eSW6D9; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-89cc84c7768so74279716d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 12:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985991; x=1775590791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NC8Qawz+0o+FcIT9klPgiT8igTs96WXnjC3pfBB1Sk8=;
        b=D5eSW6D9PM7Tf8/z86XfZ6x5HSODeBXrK3Q2eIQiKCjW3y8YbTblw0VbKrOg3WO7oL
         1FUd/F4EDErOQAjcr2LrFyiDQRPVEfCz71eJO0vE3Hm+ulGcJ4j5kv95tXae80xxDfCo
         kUMV/K5nvpo52sAJ7SJepWy1mr2fpTSj35ivPjAtOpKThjsZQRJJictrLRPSdBFErUlf
         wcMWaSX7zPpZLYkH88cW+ODiOD+7vEd4wbcpm4/jImjX1dwQiD/1i3Y83GHxn7Na8Z4m
         9tb7zKrxbbJWINigbSCa0Fys7fEE5ox7gfhDjz9dmkpxud+LGI1QytFcO0g/uI3G7B6O
         FcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985991; x=1775590791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NC8Qawz+0o+FcIT9klPgiT8igTs96WXnjC3pfBB1Sk8=;
        b=gS3rwRyJchKsykDqUrL51OpwDytdq4hcS0J2spyIYSnZXJ96vZKM/g/c9HCx14ckU1
         XlEB+Ovi1c45I+8tL46U5FDd8wIsJGIgDx0781W6RPxCNSY9rJD7NCdHHIyWZ8NdcD+L
         mYfRMUwXdj4tG2/7FZGbLW5OGgcDquomBiThSYNfm/2Q9534s0930khOcGcPxOeNnYye
         nk1DTraBMDU302CYjIZUAfb1rQmuTd0+mbAD4ht9kknphgkoSxVzY9UHghdVMx5yHmpi
         UNpEf66+0BaxS18Sf5UU+ETNf5arZBKGZr25W37GbTVmO6tIyUQLbTpTtHjmY3PJ+80w
         0UDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrRkDAk6P/mpUjU9Ymdox5EpUDED9EYtwz29d5KbOrlNcxN8k7aYC9xED9yZbJnZEjGg2N/dTu3WFG1EQY@vger.kernel.org
X-Gm-Message-State: AOJu0YwUSSX6Ne0QYfd4cl5yxlxGVRGhlndfVYDJhG4Nc6tJVbbPAXWs
	Z2mYhHddE3ulurc5lzNNOyW39NnviPy83xIi8THEpYBDAv2s9ah4Ay00
X-Gm-Gg: ATEYQzyBD0mAyCKOoktduf1Hh6LVzrT4sX4DmnBXLRbfHECOa+ilGpNrZ9NJPNXvWME
	xZLYflZoH76wMeCuANPPzi1X0UuQQBOgs0awB7Q/nwA6y0aTvOi7c5uDyS1E+JnmOwExBk/+Nzg
	Ks7FYWAIeaqpJQwP90WKJ+6+jmG222GUP8nepb6ODaUWH5Yz9lBmBEMvzRV5TotVVzfAPNgeCGb
	YPm3w7kYEkf8jju4g7DAhHWD4npufJc5X9i1CQZeGNCWaZ/4AXqPQHD7oj2AuJvxhWv5ieHffRx
	I9/Ziil9dR9OPdO42md7+pBn3UdNMYUNshoZQdm3S7l38VlQuG/gpLHWtTWho/keFa2MJgDNeYJ
	hoHVPoy8ivPwWi+zUeGxDbd9pBFv37W3bjP4eMD/XzPU7tXo4pJJ/n74oRP0eiVDOT5yiGa/hsA
	/Nd8zK4XHt+UCSO5qWAozkLwYd
X-Received: by 2002:ad4:5c88:0:b0:899:ecd8:d266 with SMTP id 6a1803df08f44-8a438209077mr14177946d6.20.1774985990620;
        Tue, 31 Mar 2026 12:39:50 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecc091f14sm100356486d6.16.2026.03.31.12.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:50 -0700 (PDT)
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
Subject: [PATCH v3 13/15] ASoC: msm8916-wcd-analog: add pm8950 codec
Date: Tue, 31 Mar 2026 15:39:37 -0400
Message-ID: <20260331193939.40636-14-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331193939.40636-1-mailingradian@gmail.com>
References: <20260331193939.40636-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101149-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 64BBB370C1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Adam Skladowski <a39.skl@gmail.com>

Add regs overrides for PM8950 codec and implement matching reg overrides
via compatible.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/codecs/msm8916-wcd-analog.c | 52 ++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 9ca381812975..13df60409857 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -232,6 +232,8 @@
 #define RX_EAR_CTL_PA_SEL_MASK			BIT(7)
 #define RX_EAR_CTL_PA_SEL			BIT(7)
 
+#define CDC_A_RX_EAR_STATUS		(0xf1A1)
+
 #define CDC_A_SPKR_DAC_CTL		(0xf1B0)
 #define SPKR_DAC_CTL_DAC_RESET_MASK	BIT(4)
 #define SPKR_DAC_CTL_DAC_RESET_NORMAL	0
@@ -250,6 +252,7 @@
 		SPKR_DRV_CAL_EN | SPKR_DRV_SETTLE_EN | \
 		SPKR_DRV_FW_EN | SPKR_DRV_BOOST_SET | \
 		SPKR_DRV_CMFB_SET | SPKR_DRV_GAIN_SET)
+#define CDC_A_SPKR_ANA_BIAS_SET		(0xf1B3)
 #define CDC_A_SPKR_OCP_CTL		(0xf1B4)
 #define CDC_A_SPKR_PWRSTG_CTL		(0xf1B5)
 #define SPKR_PWRSTG_CTL_DAC_EN_MASK	BIT(0)
@@ -264,6 +267,7 @@
 
 #define CDC_A_SPKR_DRV_DBG		(0xf1B7)
 #define CDC_A_CURRENT_LIMIT		(0xf1C0)
+#define CDC_A_BYPASS_MODE		(0xf1C2)
 #define CDC_A_BOOST_EN_CTL		(0xf1C3)
 #define CDC_A_SLOPE_COMP_IP_ZERO	(0xf1C4)
 #define CDC_A_SEC_ACCESS		(0xf1D0)
@@ -286,6 +290,11 @@ static const char * const supply_names[] = {
 
 #define MBHC_MAX_BUTTONS	(5)
 
+struct wcd_reg_seq {
+	const struct reg_default *seq;
+	int seq_size;
+};
+
 struct pm8916_wcd_analog_priv {
 	u16 pmic_rev;
 	u16 codec_version;
@@ -715,9 +724,41 @@ static const struct reg_default wcd_reg_defaults_2_0[] = {
 	{CDC_A_MASTER_BIAS_CTL, 0x30},
 };
 
+static const struct wcd_reg_seq pm8916_data = {
+	.seq = wcd_reg_defaults_2_0,
+	.seq_size = ARRAY_SIZE(wcd_reg_defaults_2_0),
+};
+
+static const struct reg_default wcd_reg_defaults_pm8950[] = {
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
+	{CDC_A_CURRENT_LIMIT, 0x82},
+	{CDC_A_SPKR_ANA_BIAS_SET, 0x41},
+	{CDC_A_SPKR_DAC_CTL, 0x03},
+	{CDC_A_SPKR_OCP_CTL, 0xe1},
+	{CDC_A_RX_HPH_BIAS_PA, 0xfa},
+	{CDC_A_MASTER_BIAS_CTL, 0x30},
+	{CDC_A_MICB_1_INT_RBIAS, 0x00},
+};
+
+static const struct wcd_reg_seq pm8950_data = {
+	.seq = wcd_reg_defaults_pm8950,
+	.seq_size = ARRAY_SIZE(wcd_reg_defaults_pm8950),
+};
+
 static int pm8916_wcd_analog_probe(struct snd_soc_component *component)
 {
 	struct pm8916_wcd_analog_priv *priv = dev_get_drvdata(component->dev);
+	const struct wcd_reg_seq *wcd_reg_init_data;
 	int err, reg;
 
 	err = regulator_bulk_enable(ARRAY_SIZE(priv->supplies), priv->supplies);
@@ -738,9 +779,11 @@ static int pm8916_wcd_analog_probe(struct snd_soc_component *component)
 	snd_soc_component_write(component, CDC_D_PERPH_RESET_CTL4, 0x01);
 	snd_soc_component_write(component, CDC_A_PERPH_RESET_CTL4, 0x01);
 
-	for (reg = 0; reg < ARRAY_SIZE(wcd_reg_defaults_2_0); reg++)
-		snd_soc_component_write(component, wcd_reg_defaults_2_0[reg].reg,
-			      wcd_reg_defaults_2_0[reg].def);
+	wcd_reg_init_data = of_device_get_match_data(component->dev);
+
+	for (reg = 0; reg < wcd_reg_init_data->seq_size; reg++)
+		snd_soc_component_write(component, wcd_reg_init_data->seq[reg].reg,
+					wcd_reg_init_data->seq[reg].def);
 
 	priv->component = component;
 
@@ -1259,7 +1302,8 @@ static int pm8916_wcd_analog_spmi_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id pm8916_wcd_analog_spmi_match_table[] = {
-	{ .compatible = "qcom,pm8916-wcd-analog-codec", },
+	{ .compatible = "qcom,pm8916-wcd-analog-codec", .data = &pm8916_data },
+	{ .compatible = "qcom,pm8950-wcd-analog-codec", .data = &pm8950_data },
 	{ }
 };
 
-- 
2.53.0


