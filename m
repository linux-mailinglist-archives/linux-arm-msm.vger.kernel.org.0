Return-Path: <linux-arm-msm+bounces-109878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SK4COS+8FWrKYQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:28:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6E85D8B8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9474030CB914
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187D9409E0A;
	Tue, 26 May 2026 15:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="F9c6yTQp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465B440960B
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 15:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807795; cv=none; b=R/g5lLx+RneSE+14k6WiLT/jAptQPsclfd9lzN3v7vFuzKp0+2RCfCwAPmRO0mbsezPJsg8PmZJdb/NXzhxnja3zD88elpAc/K7lQ4GGSSImCNBv14Scbr1yhIg4Zt9qIVet+mZT6Eo7Pi7/knSBx5VsfTu7BST3jYuUJaPKfl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807795; c=relaxed/simple;
	bh=MdzDJMQisHkSOiLYvopwwr1v98FNTtU6w7SCFX6+GsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gKPMev4LTAMDbspXpiDv2hwTwRV6brV2W2iPu6N904ain/WAKHbF9G1SF5zjhdYuosqapGXeQDDqsPKodbldbi66zLQrsm7PrTb7v0Memez7fa6SOJSY8JaXviDyfsrohxlkzBYkHlz0yQdqag4/OvdGjJLaOdBIGTcDHj8x0us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=F9c6yTQp; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aa0cf8bca3so9755490e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 08:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1779807791; x=1780412591; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MDbuAa08BqGLwPFVUvrCU0ivDFLjKQA1mJKnc79aZhw=;
        b=F9c6yTQp9UzQ/DAIpeEYTPwgT+IjVgoR/EiYo/n71jNBXx9e3aZPSaaX4pkL9ErUSZ
         L2hLH/a/l9S3EoS558bL0pM2kxDOKFE+7WCTjfXEGn6hUWrJe+MmC5E9M8MfvAt4Ypgj
         m6rd2lUJQP8F0in/zdP8A9E54lO3ehsENVAxZ0KJ0r8OXApPI7BfNLA9HaY2ecaVaO/3
         1fAFtrwTIkGPV78Xe1/i0IUjbNBHPOun1HXnJSIJMDglbpgKB14taXFOqM1Zrl42EHvl
         IGNIXpiUfMDd9He5bh/N2efHAM4qdFpBVyBb3bwbCFGYCnioUiDCyNzDvlUygj3sgAdi
         wc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779807791; x=1780412591;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDbuAa08BqGLwPFVUvrCU0ivDFLjKQA1mJKnc79aZhw=;
        b=KzdNWH0Hvz09bt+vxXeGjpvlXbnjZuBXn3+HCOIWbJ4RCWi945d4TnWWhq/69pUNbV
         augjRDtLhlxaUhHmqPo2PD3vsMF7ASQ2cHcoPD3WiqBT1D3cEFQw7Q2SWCWobhjObbgi
         1y7uZY5cTwRFeI+HWIeqweTTGLAxaMGcrwMf65yt6UOt3GtT2IqBDxfdE5kXA132rTrQ
         ErFpX1xIIzHFHRvE/qrSlsAA6VDoLmTTVVmKAu84bVHh5hmK4nuH83jG5G6A1KRahUWd
         RzB9fKG7sq6R2b9t/vlMz2ZWIxz5fPbqoJZnDac+KLU9LTwJ3vhDliqW28eNRnEEV+4u
         CL7g==
X-Forwarded-Encrypted: i=1; AFNElJ+ZD8hk3XvYOJUbyZq5pLNssMvIsLw6bnnWolwIO/Nb6YhmkHzrevtGIAAjetey03TVjZiHZKMgRH8XUfWH@vger.kernel.org
X-Gm-Message-State: AOJu0YwK+lGdETFd8X20RqhZ9vTNHIc6tjSGM20CVxMVzLadA1d/5xyO
	2dUsHWw8ls3DdeW5Idw52S6ZcjItysxNXGr/qFI3Vqlh5kKR4LX35NIpS2lngBEODFA=
X-Gm-Gg: Acq92OEcvOhmmlTwSTfHfXWTTagycVROKGrfi+0bXUVL/4XTTXMnqxV9WhQKztMcfoC
	DyvZ7ujzKcMIsSMM/XwUvf96F9KkAZRQ0DB71cLHuIK3ZAtld3PoRWRsHCiFHe7gYL9fi6CL+7E
	ImpRUcn9YwFP1MfPSsDI5Dn3s7Kx1QW4TgoYVgkoUVSoOyHOi7xMIx6s8W79b6EhcCC5Q4NpHwd
	r4ycGEkj+MmsIZxTmPuvlhYa+AB70Rsh5qnrUIaPPeiaiJKlPCiTIx9IH7CJmIa0QM7Wvcp7D0Y
	xvYQ7VAtjtQhVGhnZM6BS/B3YYXCWq9yrBUGLz9iE9qyWLPgULtBXGRr6LRzzsDsj/PsnwEBsUz
	Ke0eaWA+76MI1spYgHM6x3W9hXKoGKNkuq2h8Am8WkYyneENOlJ4QXcooI0aWJOulEn/QPmkUyD
	GkbSU0+cB38qDAmlsaWcp1bsQMXcpCYlKw
X-Received: by 2002:a19:5209:0:b0:5a8:6e50:b16a with SMTP id 2adb3069b0e04-5aa323c8140mr4045337e87.34.1779807791133;
        Tue, 26 May 2026 08:03:11 -0700 (PDT)
Received: from [10.107.1.102] ([212.133.41.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ec7fcd7f9sm22652026f8f.37.2026.05.26.08.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 08:03:10 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 26 May 2026 17:03:05 +0200
Subject: [PATCH] ASoC: codecs: lpass-va-macro: Fix LPASS Codec Version for
 SC7280
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-sc7280-va-macro-2-0-v1-1-2c1b572fa388@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CQAxA4auQrm3SaWQQrmJcDEOBmvCTqRITw
 t0dZfkt3tvBJKkYNMUOSTY1XeYMdykgjmEeBLXLBib2VLJHixXfCLeAU4hpQUbCnrprWbvgnWs
 hl2uSXj//6/1x2t7tU+Lrt4Lj+ALBIQLwdwAAAA==
X-Change-ID: 20260526-sc7280-va-macro-2-0-f0d4591a611b
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779807788; l=2090;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=MdzDJMQisHkSOiLYvopwwr1v98FNTtU6w7SCFX6+GsU=;
 b=klKyWck4OZBbzCMoyUDCxam5sjFW3KC80yR+prYicLm/iE1cPSctV+zhwZ4rs8aJa3bprNTa4
 fxviKyHu+zsA2WzHYi5LI1SkxwRBbanEyBLa6N7nmDgDYJr67B3ya3M
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109878-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,fairphone.com:mid,fairphone.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7B6E85D8B8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

According to both the static definition in downstream...

  yupik-audio-overlay.dtsi: qcom,bolero-version = <4>;
  #define BOLERO_VERSION_2_0 0x0004)

and the runtime detection:

  CDC_VA_TOP_CSR_CORE_ID_0=0x1
  CDC_VA_TOP_CSR_CORE_ID_1=0xf

SC7280 has LPASS Codec Version 2.0 and not, as declared with
sm8250_va_data LPASS_CODEC_VERSION_1_0.

Create new va_macro_data with .version not set to use the runtime
detection and correctly get .version = LPASS_CODEC_VERSION_2_0.

Fixes: 77212f300bfd ("ASoC: codecs: lpass-va-macro: set the default codec version for sm8250")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
I'm fairly confident this is correct, but please someone double check
this if they can.
---
 sound/soc/codecs/lpass-va-macro.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 528d5b167ecf..58a5798823d7 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -244,6 +244,11 @@ static const struct va_macro_data sm8250_va_data = {
 	.version = LPASS_CODEC_VERSION_1_0,
 };
 
+static const struct va_macro_data sc7280_va_data = {
+	.has_swr_master = false,
+	.has_npl_clk = false,
+};
+
 static const struct va_macro_data sm8450_va_data = {
 	.has_swr_master = true,
 	.has_npl_clk = true,
@@ -1755,7 +1760,7 @@ static const struct dev_pm_ops va_macro_pm_ops = {
 };
 
 static const struct of_device_id va_macro_dt_match[] = {
-	{ .compatible = "qcom,sc7280-lpass-va-macro", .data = &sm8250_va_data },
+	{ .compatible = "qcom,sc7280-lpass-va-macro", .data = &sc7280_va_data },
 	{ .compatible = "qcom,sm6115-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,sm8250-lpass-va-macro", .data = &sm8250_va_data },
 	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },

---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260526-sc7280-va-macro-2-0-f0d4591a611b

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>


