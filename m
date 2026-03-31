Return-Path: <linux-arm-msm+bounces-101150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4D1TEfEjzGllQQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:43:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFBD370B99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B567D3031667
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167733E1D09;
	Tue, 31 Mar 2026 19:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SrTytoZV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B067A3DFC66
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985997; cv=none; b=d/t+WZLrz517fGu/3kT6WLf/RvHacj9FUVoyyLEYrkWyJNm/dYeHhz9rmoXxkihrt7uNI0MB91MqyAmuuVyO8wnjIDLw+gWSLQU8fkdXYmuCiqCT7JSHKhYEWBtOa6rHxs50cfxVGQVk+vekmYkfbbSyeODGS2w5gcQw9Em6K7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985997; c=relaxed/simple;
	bh=0bo180biKBnfOCqsVunQ5Bnzei9AzNH07TMj8WXExjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jnWA2fTNq2LXKzIC2ru393CMNcb71+CPrwthv8pEf11F1fmlFXZ+gFnPENndVQs/3egHg2yQsht+N7xPj3zBbBHsB57cmQT4jnlp+Zc0UPX4ZaxnoBQFQjcCoAOoXXDYzHBZiBWpM0a1pIYRTKQQun5XT8oZJW/WSEuFBn4Idnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SrTytoZV; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cfc2d1fdbfso515310685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 12:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985995; x=1775590795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVNRywWQq5QAWWSzQU0VE+vfO8CACut7y7L2DEhMqBk=;
        b=SrTytoZV+OFKnkDTEnL7mxcl9ps/OyGS9YkeVlH7S5qItrsMp3GfuwTcfCA7TeV9mh
         9+kKqRVLLKZ2H+cZxO9ANxt5SeaIcfAsOX7qrNoEfz/dkZImm9XITLiNTtBi2UCWxpqV
         9r2WLXY0groU+MSWCocvxqXsaJ1OyMI9e1uWtR3kqiygmcUaXM6/EvmXvoCmrLhNgf4I
         xaLHiOKtPaQyoWXw1T2n8xLA7YXFWHzIFTuRaz89MF1m9+zj/3pBvMhGxMSm+V+ktYwl
         bZ6bkf1KtwMOOH1d+LfQ6dGU9shm2XdlFrm2ADddoe/YjizrMkV2Ee5rk5aYmnASj71n
         fBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985995; x=1775590795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hVNRywWQq5QAWWSzQU0VE+vfO8CACut7y7L2DEhMqBk=;
        b=dcHzH8ZQ2E1stNSOOzk8pN/pfG9q6tfkPslYJ1cRO9PdEKdu9i/TYCpvXhmM2BIwRe
         /U+VTU35YEk4whAuG7IwUNVQwDRhXHSPLqVXzrayiwZwEnxddu9v5oLwpNyf9zpFQ+nv
         UPKur67D/VUvvnBhcTO//ZYbvg7raFJBVWntzNBrNjUoaKAgQrhC8DFZJs1P8FltOQLV
         gxnZi4gPkP7dxvTVKkEDQXpWFxAjpzLUezmlri+onEV+H0hSHfeF2hDfc/SkwDGTf66D
         NoLpkrI2Aa4iTRnxYlotfeTphuYlMUASaw1hEZJAH8BNO36fi/udv7BfaI67sCBBfXK0
         GCrA==
X-Forwarded-Encrypted: i=1; AJvYcCUptPQ7DVKEBFeJlIfiEDh/8UZCkNhT51GDduGMoxarmOWur0t3NYSPjbpy3Zi8N7l6d62Vwlb7H6M4j7Bp@vger.kernel.org
X-Gm-Message-State: AOJu0YxDjpIV26swOlA9xbaNRqYJ/uzXfQT4A49BTotuduwlLOSatgYm
	WpImzslrSHZNSJQw/DuVo+B0hIRNYsXaV8hhXZkmfRcVzSp92QUgoBDz
X-Gm-Gg: ATEYQzx/lSpZjrWQ76lrzP5Yd8cCxKFYV7q1aNU1tITPxVEaQVYqE/jLeCE/Z3gD63I
	SlqDsdSgMZPttu0g6KNz1QwIEfH/Cjfyw6QnjcU2fG+POSekHS925DMzxCPjyQgfDVMycjxPQnv
	6b0fbRmwys4ZwR1dRLeHfsdamFEiJRltroizXvcIuqMsRPVpfTjKX+q9KouoePbRXqO+dmOIkeZ
	bbBkXdVAP2978jNHrNtmRWIEE2epF5CNn7psVKDD1AfS/crHkJjOqtyjXnD/dF9ra/MqFTvm5Rv
	/TSGZTJCsGfZJNFyAnV+2+7FhZ5WqpjzPtLSTj/U8dcQk51q55LJNG4I8LQ5p6ProCROh6rqWbw
	R4UVehS+CZAIb/eTde6IbAVrrIfTN745WDJIzbWyzs6V2Q+tdKF9FQMwh80vl0jd9GmigAQWeyW
	L1u+TazxMW+CEiQWN1vuwC+TOW
X-Received: by 2002:a05:620a:170c:b0:8cf:dd4b:8a53 with SMTP id af79cd13be357-8d1b5b2436dmr156991785a.30.1774985994711;
        Tue, 31 Mar 2026 12:39:54 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d028075135sm947442685a.38.2026.03.31.12.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:54 -0700 (PDT)
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
Subject: [PATCH v3 14/15] ASoC: msm8916-wcd-analog: add pm8953 codec
Date: Tue, 31 Mar 2026 15:39:38 -0400
Message-ID: <20260331193939.40636-15-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101150-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5EFBD370B99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
2.53.0


