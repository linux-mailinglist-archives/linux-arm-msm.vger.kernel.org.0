Return-Path: <linux-arm-msm+bounces-81740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D92C5ABF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 01:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CFDC94E9FB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 00:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30D2214204;
	Fri, 14 Nov 2025 00:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pc/DvTI/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F2720F079;
	Fri, 14 Nov 2025 00:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763079277; cv=none; b=kvYROABqPGrHfOeetYSgH57SoD1uslQzKrcTiYEUiESTHzGm9sBWvXVX4vV14spA5k4xSEADPMZGdXWreVjtBDhNAvh3cqYngjGQAryPO2fxV9SB1/AilQ38oh4DZcTEJoSBwuoHGUrrjEW+A1GCnkNrvIsKXH+gHkRbwC96tRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763079277; c=relaxed/simple;
	bh=MHwNLI/pLkI9zz0fyDQfEii43uTT524o9ApM6CwAYaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Pf8mRAILE+beKM6ICJRTGe2bAGmniRM6RZ5VlQLhQaQRW/tPFahAsTBhKXl2ohBm8KumjRJ/kojTKVRdlXYkYUX1r3GQJr04y0X7f9zhbwwjtK5PLt6J4MeR8XrtX8iGQD/eAg5el/4TlbB/x1VaH7Moo9qk0KvnXIWJe3dh3og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pc/DvTI/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13D49C4CEF5;
	Fri, 14 Nov 2025 00:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763079277;
	bh=MHwNLI/pLkI9zz0fyDQfEii43uTT524o9ApM6CwAYaY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Pc/DvTI/+vaeSjXs5FnRKb3g+DcfRh5gEpMgjsEgJaFq/Up1aYG+btnMkrMCgUr82
	 1KExUg/6D1u1G/gWeE5yNZKAa1mrc+Z5pZqOxk+olq8YhUvt3k4cSMJ2Df95wjccZl
	 cabD77tiSWFZS3yG8y8MRji9bTQZjMz9lUigLPpvyysnbeYiQtuhVzm7DO8iiayjBT
	 sqw2tD2HcldtMRuLoku9kxQiBKpM0IbzqjGqzm7V+OSQ21NWB0cXymQm9po8P06OLT
	 vmB98HrtFtkgtTusqYaeetAMkBdWvHWn4GYLRsDX7xwBDVbnKKv+4t9ZVL6foA68bw
	 drn3+lo9EwKTw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA80CD98C3;
	Fri, 14 Nov 2025 00:14:37 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 14 Nov 2025 01:14:34 +0100
Subject: [PATCH v2] ASoC: qcom: sdm845: set quaternary MI2S codec DAI to
 I2S format
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-sdm845-quaternary-v2-1-9d803bf5f7c9@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAGl0FmkC/z3MQQ7CIBBA0as0rJ0GEGxx5T2MCwrTlgRBh2psm
 t5d4sLlW/y/sYIUsLBzszHCdyghpwp5aJibbZoQgq9mkksthFBQ/L1XGp4vuyAlSyug8SfPBy2
 OzrDaPQjH8Pk9r7fqkfIdlpnQ/k9c8k5o2WnVKtObDgQ4G3FoXU4px7heYqjv3Gaa2L5/AdCv5
 G6mAAAA
X-Change-ID: 20251114-sdm845-quaternary-e9d6d0b513c9
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 "Dr. Git" <drgitx@gmail.com>, Casey Connolly <casey.connolly@linaro.org>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=ARxpTeY9kNYvN6EYXKNHS5nPtDvu8Qayi+gAEHyLru4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpFnRseuDCJsmzLI7IxIXZzk7++Dy8Mqn2plbaN
 3Nb4kuFfNWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRZ0bAAKCRBgAj/E00kg
 crilEACvkZu3ZgsuyqRA7SUxj5lMfVN9pu0+B8ucn1W91euBRLxMlqDmLhPILRJAeOZEwwpwaxm
 QLtms3kWoOfpJMBdYLUsvZP43Ke+sVIE7zSPv81i/WRlXSw0TNiHMsFkumBt4whyj011GKkZz18
 wCg8WVbgr1cQBrukb+STxfK83dxBRxsSdHLtYDMtDaNpSYIeVkiqmedSYXGal0BpaQgxLHhZ+cc
 tJqsM+Y1A7J5s3incrmDwXLtIbVH7aA9KteN+ExgZtg5ttBcE/T8O+CFJMMHey7EZgKH3fVNImE
 4Dz87fOPKWHmCRMw5FMfnUu6dZYa4/EzVh8fi7o6sSTjjSyVEBLSKf4y6CKieDvTpfzD5Fu13f3
 V0j9iu3hSElsc8QmBF5LhpSFdCnA5xc3FBYS/lNLI0SQjNRH9A2tAzP3K+VOpr0l3h0k6cixxIx
 5YNxv1aP9bWE4f95Qr9CgtdvpJpybuyEBsRSCjtZuQiEQ0O7hZERNazyFo0YUN4AWQRl7+SmhpB
 Z5n1VYX7wjSiMtRYJ0AQG7yetDQsoaDMvPFRwEkdTgdTY69p+p7qkGSWgWw+ezyZD8cBxvEsfrH
 8sFFsBU37JfeBLtU/xkRkxZffd05B8h/1K/5M3KvbwCYSsMkkd+u6yVGW+1tvSGPZEAENLegYdw
 rFaokJukicQI+Qg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: "Dr. Git" <drgitx@gmail.com>

We configure the codec DAI format for primary and secondary but not the
quaternery MI2S path. Add the missing configuration to enable speaker
codecs on the quaternary MI2S like the MAX9827 found on the OnePlus 6.

Signed-off-by: Dr. Git <drgitx@gmail.com>
Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v2:
 - Rebased on top of next-20251113
---
 sound/soc/qcom/sdm845.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index e18a8e44f2db5..0ce9dff4dc525 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -365,10 +365,12 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case QUATERNARY_MI2S_RX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
 		snd_soc_dai_set_sysclk(cpu_dai,
 			Q6AFE_LPASS_CLK_ID_QUAD_MI2S_IBIT,
 			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 
 	case QUATERNARY_TDM_RX_0:

---
base-commit: 6d7e7251d03f98f26f2ee0dfd21bb0a0480a2178
change-id: 20251114-sdm845-quaternary-e9d6d0b513c9

Best regards,
-- 
David Heidelberg <david@ixit.cz>



