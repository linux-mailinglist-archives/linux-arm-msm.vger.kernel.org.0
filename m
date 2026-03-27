Return-Path: <linux-arm-msm+bounces-100371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJHZMOqtxmmiNgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:18:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BB0347537
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:18:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E20530C2154
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533F334E74F;
	Fri, 27 Mar 2026 16:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="TD6Y+/Dn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28E6349B06
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627961; cv=none; b=HQ6QZBTwvHKBA4OaGggerupiIOA92QviM+xv0RfW4j83PsoCeg2kSd2deP+p2CgJPDydRqFbDkuvxGiPpnvt3q5xf27i7Uso4roC8F4nNqq4CUpBMR9Q9bPt9wFYp3XkNJmH+KoyCzTB1yeUvp9Ao5PvoEZLhss1oSbGAjGPI1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627961; c=relaxed/simple;
	bh=5cRqSrO9TWRQUaD7bTpD1ZxLquZmqnEMTYi63NVSawg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PKQTmVcQH/s40Mxghv1lZc4jfQ+QNj6ea2ZWjSDd8tpKNS8RhRfk4OAEzeG+M5/KG2Q8e8ITCBTgwo/73Ogg+DEPK4439GmSFvP/uyOrO/t+qlY4OJIQFBHw0u7USPZc+7xoYwXvdu96ir/2ZvYtC8x+Is8/YewTwJbrT2tsU1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=TD6Y+/Dn; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-66b582b72aaso412040a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774627956; x=1775232756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jDY2PYGbaZfyJpszHkpHZ5M00y7JZRiJojTTA2GybA=;
        b=TD6Y+/DnMebuVJMFs6ASMGZIC9H8GNw5FEEUp7aIBurPXYMaxK24GHd62pgKKSVYVe
         7G0sUpR0A2rC3livq9C4xhj/fKdh9/Z5NG/vrAYixu1I3IiTx+BZQ1UgCmBIRynZdc9M
         C/TyR5do0KPuBY20/7JmQ8qomqkaiMXBYy+DuyLUbsXbOfbBUhzeqIvdF3LEbFsK9KKv
         Fuhj9wXK6GobTdTwMCpHp8VCCyWuVy4P0/3qOgM9ZAqaHEmWnCWTP7CQ+ACd9VYvTnAV
         mNGcaO04Zh9WDyfhhh1BLE5w7ue90FIIVOsmaAh2cIiiDMTY7nXtdnhG2fEnJ92rZ3XD
         K34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627956; x=1775232756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9jDY2PYGbaZfyJpszHkpHZ5M00y7JZRiJojTTA2GybA=;
        b=gOUlrKEEn163jtzeHtxvb+zkLQmo1roqzltAC8iqPjPfygIubDY6kJc0awGcwrhn5Q
         2dMoPxaXBfycuWmODBEzlbOmvB3KdQeIiXbSleIsH9YrtS+eMxaLx9ZgoaAvgL/tb1lx
         sL+MW7zjn9udzG16NMUUaO6uFGWJOUZNSFk41OlN61+a/vrOjoaICEUYad6Bx9/fWRK4
         utA+7dt/YILPNuT22sAIVd4h+zN0GzbZgvT7VHbp3j9NY/BoqlH5aw6ZixBtmBwoPYH+
         E7KgiQ24AL7H9wHEfvudjVdTbiBcKRWF2ANtyas5ZQuF1ROqm1yii2vNjl/3rg2L4jFz
         SUuA==
X-Forwarded-Encrypted: i=1; AJvYcCVI1LP2+VZZg85ABHF14vkq1jBEgJssmbzn534WWjG2/jPS0aQcQFrqhFqoft/xI19Q1O9ttkf5MCMKtW+Y@vger.kernel.org
X-Gm-Message-State: AOJu0YxPF3yXGRnQHuNrYVw4kN1aYHhZSba4ihPo2vsHoKVZ4ixUE8i2
	MKa25OhIiSRd19XasG6IPJG5bKdiD3z/P99ShV5mbbuojckMw2UT0yYoBSVDEbLaSdg=
X-Gm-Gg: ATEYQzxgeWqFb6szKIE30dotpDVx7zRtTwpvy/8bwlunUShBvxjeZaFqeiMlxBY0pNp
	na/UwFxCCdL8jKZ8J65p/LthxcbQjlukXMJ5LAjmD2cDCGHKQPTNCMaVNaGAjpRq37MQlMM251a
	MWMcnlCihpqOM8PBdI4YVX7B1vaW7K9L75IcQ1MIprs3YuVtTeqg6f8W6Se6rfakOhtg4xit9+5
	FWp3iFdlPUlyfQD90eeyVxIEjfy1WzEV2BZYwIqDTHoQ91z0bz6xHnhICaiOQ9SgNGY977NczEE
	5s/5tEGsYI6Ny+qMjfkxoymH/CUTBOkKC47Q9lOTLZvRA1V5NtjOte/6t0SKm1fwlsI512/y9tb
	40KXNvEQ/29MCP55CKZhqJ6OZWKckoksFl5WquwvHV5jAzPCVE9/uzW4brYo3GdPOcoxLI6B+bC
	tDkbUleJ6e73NCnEgsRwejE+oFukpKwWHKZPbiwxriTbCCNCftSvAJKUGO1WVaIegWkWeRtf7Gh
	pRH3Q==
X-Received: by 2002:a17:907:9306:b0:b98:4abb:cc49 with SMTP id a640c23a62f3a-b9b502bfd00mr209569466b.5.1774627956162;
        Fri, 27 Mar 2026 09:12:36 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265cc0sm273518366b.15.2026.03.27.09.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:12:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Mar 2026 17:12:24 +0100
Subject: [PATCH v2 5/9] soc: qcom: ubwc: Add config for Milos
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-milos-mdss-v2-5-bc586683f5ca@fairphone.com>
References: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
In-Reply-To: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774627949; l=1658;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=5cRqSrO9TWRQUaD7bTpD1ZxLquZmqnEMTYi63NVSawg=;
 b=aIVcCFwLleXDR6BbWbAVLdZGSgSQE3T0zkh07vYu6x6K/HU3SUHpaustvo0IrxX3T00BKLHOA
 f+oyhjM/FIkCWLIqvrDlNpWYSCHXcofk+OrlUQkx6J2XtUJlVtSdlnu
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,marek.ca,quicinc.com,linaro.org,pm.me];
	TAGGED_FROM(0.00)[bounces-100371-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 72BB0347537
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Describe the Universal Bandwidth Compression (UBWC) configuration
for the Milos SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 3fe47d8f0f63..1551f270afce 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -37,6 +37,17 @@ static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.macrotile_mode = true,
 };
 
+static const struct qcom_ubwc_cfg_data milos_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 14 for LP_DDR4 */
+	.highest_bank_bit = 15,
+	.macrotile_mode = true,
+};
+
 static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
@@ -247,6 +258,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,kaanapali", .data = &kaanapali_data, },
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,mahua", .data = &glymur_data },
+	{ .compatible = "qcom,milos", .data = &milos_data },
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },

-- 
2.53.0


