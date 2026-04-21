Return-Path: <linux-arm-msm+bounces-103937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHKfI2dp52ke8AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 14:11:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 043F543A7A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 14:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CA9F302677B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A773451C8;
	Tue, 21 Apr 2026 12:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="Ez8ZKgCj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FD13A5E91
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 12:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776773304; cv=none; b=J3NduxNlAMq3t4jshgbSMVZm/y4th7mm67q/IAwHWCV2408+sLmGZZCEsTVEGZkoG+S4gGxe+bjhv95djR2yH8r1yj2OMgcMAfHamo6WUwNy0Be4zbfS/+KxLckz0bp5MHALEZZgqYBt2vTz/QDx3Tpsk97UknA2QUmfakPdqnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776773304; c=relaxed/simple;
	bh=CwoLwDLMBPfKyLaft+bymm+TkRKlmSB9AD65JRStfdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=twxUKiy9551R8jVQQ1eCGD9Ouvel0LfK+krwLpeY9f04/yQobtRXtrffKhog59sOj0oAcxVMe4c+3O0C1R4OVDojP85thnqmoLereJVcaWVoXdcYKGv/vb6hK3vc8eUyo3OEDJl0UsrNQO+B2IEUCNDoiPa0mVATB1309mdl25c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=Ez8ZKgCj; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 436663FEA1
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 12:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1776773299;
	bh=fsfTQiRtIm976+XbmKgLhWGDL/jFLHll8YOhFaza+e0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc;
	b=Ez8ZKgCjp+uVYgMTh0Tyu24v/h48QGmzGEVZnxiP7nbd4PIExnOoVzRXpiLrdagmz
	 iO/u2uy6vg4xp/Su6/tTnoE57FIy0LL8D9VPJPveFyJjySbybjhU//qIbw7y9177vB
	 0+qEzW/uBXJblLmvSI/gA9zbQNBJgLJLWPHOsvmaavDk28c/FS6c6t+i55dvZXxl4d
	 y/615k0E1CFKyz9DieAzG1uRXdIlBuhkM7zUlP/dEiE3RO0Ax1cE4w6WGeK3jqCdlQ
	 odwubjqS9dj7kaeXWMEgoUQFfVKdCIbWmmwYHmJHDXMH3JAzsg66wxU/xifhGz29iG
	 yDxLCFInWPqnFSo1hC7f+IOBm01xVn6voMKukhTTvsE2T9SNRyjRR7GQ231aJ/yL9R
	 kNSZ2cM4Io/39XPlhPPjCwmdOuYyBT86Z6GnHqSW2GqizMPwEIt7DYtMdSF+Cc2adq
	 Rqg+qauH0bUdLwM8iPZ+OUW2fMS7fWU8zvARLwTUq1F0yFA2U1DPRhNAgAgf0EEH0i
	 4BIq+Dzh2LNPSM9ZV3yYNWTKcl7IReOGlYsG6j8P3KmGEnsEENTcChVDYzs2vMzd6L
	 v3yQpi2Cb1qlB9Md4NbEwm1gsdven5+UBZSR44kpx9CLXH0Z8nJBGCQMhFUl3qfLAx
	 JU5e4mwMVp6ZSp6RO4Eskl34=
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-488ba2f4094so21761795e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 05:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776773299; x=1777378099;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsfTQiRtIm976+XbmKgLhWGDL/jFLHll8YOhFaza+e0=;
        b=rPUP72CMMgdsJ7KQZlfQXimudU69ESWUTTnMQFkfQ3mElLeZAxpZQiTvx7h4yxjQhG
         TUYkVf+l6zLUna+RfwGw8Fu/KgBCEBV9y0UGUUY6XkTIxWSPIakhopTxTZljIZWGzOVv
         l+ks4K3GfpKIBwjmw5WVGpu6/iUsoYuZiMBhAzlu1vohX4hZuU/qJgq741ss7DRgAo88
         Bv2utQztgj/CzJda42LKAwhBnt3qkqecwoCm8MpjVLCwgJlYCKn1Ah0kz9af4vFiKoBP
         3JME0On6y18RpVIKNuGIN1r/ZZfhNTyHvg8FcLJERJdR1qjqwHmzFRaQKwDIC7kKrBEb
         lu7A==
X-Forwarded-Encrypted: i=1; AFNElJ+EJgWHozzK3UMdX6kliXRU604nJyWWM1eSDzWs4KwI5y4Ol32puu/yKEEKlBuk3pQfPjTa9nQV9k+ImmMc@vger.kernel.org
X-Gm-Message-State: AOJu0YxFraDPfTF0yBm6QVj/3ejp1xyDDK/lGtTGjMDpCV60EzGu7p+h
	pdF3gtu0ACjSdThvP+5CInRClEem9LwsfdnipzoPi/yBUy002Wl1Ohs7EhmlBhlEo9E7nmRWasY
	lvJtltAcaWmNM3Lp4moF7LxEppCCHeaSU9xTqiOMSxtl9OqL6U8r80veg+Bh9Q2mEHeL7oUYyIs
	L6XEH/chA=
X-Gm-Gg: AeBDieuTm7kin47wlfROG6a94UANCU23v6BB0jZty7wuQtiznOiUbk3zHVBVtqOZU8r
	7m2Nr8Npd0nxogeisDmbY/YNrzjt300wvfCw1TpxhxWzE+jR5io5IomGyTAV3euUjc3RxTieeG6
	9pGDsFUwMyE489MsI6rd1RZiOkL1Xq0x8F7kJVdtkDR/Wwiovk+JgIsE2m/739gE4J36PFMkquv
	SHF5L3E5fdsI8rCFKXrFxkOjz1tpf8ETwwJqtCMkzlDNVIII79bAF2ZIyV5kixD3ewNhwubggPm
	VzOGHOl5WNdmXIBJwpFo8FNdtuGU57dyJ2JpGf+Me1HE+UckpUDl0cFIG4vrpE4oK8FmZI0jarw
	sDoRLsaCpEBHRqZvbDJPcXHFVjBUaNOmO0Cvr9zl/co6oHA==
X-Received: by 2002:a05:600c:3b97:b0:488:af7f:7707 with SMTP id 5b1f17b1804b1-488fb769dbfmr277691095e9.18.1776773298653;
        Tue, 21 Apr 2026 05:08:18 -0700 (PDT)
X-Received: by 2002:a05:600c:3b97:b0:488:af7f:7707 with SMTP id 5b1f17b1804b1-488fb769dbfmr277690535e9.18.1776773298187;
        Tue, 21 Apr 2026 05:08:18 -0700 (PDT)
Received: from [127.0.0.1] ([2001:a61:3426:4001:8efc:6f26:5d61:2375])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f82bbsm606795305e9.3.2026.04.21.05.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 05:08:17 -0700 (PDT)
From: Tobias Heider <tobias.heider@canonical.com>
Date: Tue, 21 Apr 2026 14:07:58 +0200
Subject: [PATCH] ASoC: qcom: x1e80100: limit speaker volumes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-x1e80100-audio-limit-v1-1-98bac8cee2ee@canonical.com>
X-B4-Tracking: v=1; b=H4sIAJ1o52kC/x3MSQqAMAxA0atI1gbSUAe8irgoNmrAiVZFEO9uc
 fkW/z8QJahEaLIHglwadVsTTJ5BP7l1FFSfDExckmWDt5GaDBG60+uGsy564FBKVQg5b5khpXu
 QQe9/23bv+wFoMbjiZgAAAA==
X-Change-ID: 20260421-x1e80100-audio-limit-f6e75e0ad422
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Tobias Heider <tobias.heider@canonical.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3333;
 i=tobias.heider@canonical.com; h=from:subject:message-id;
 bh=CwoLwDLMBPfKyLaft+bymm+TkRKlmSB9AD65JRStfdQ=;
 b=owEBbQKS/ZANAwAKARNJjwMsz+naAcsmYgBp52iwUcba0y38cU9vJREG+WxxGCjSKvwRmzeLv
 /KgNKwLPVyJAjMEAAEKAB0WIQSbaT10QIAuim/4A94TSY8DLM/p2gUCaedosAAKCRATSY8DLM/p
 2jD2D/sHaRKwGXN/x4yDL8ncNVMWh5b+KlbaVoD9lHS5pL2+f5QY8d2goXEuHlEhQGwMuZ3oFG8
 C2nunQFE2yGpwrhYdg6En2CRC/6c2qaQVdWzd+oMYHttU2Al7uZOAuN7yzFJV0twTMyBKG+wWBV
 Q5rgYAbqLDumvk2NQWMicG7KmdgHH8YlcXWjbveNttnfk/YTpMe/Q0hklfMu0+5pcc3HiFLP0io
 qnd6TpofTeoT+DhMv4cHN4JsyuKbqrtVappJVwwm3AsLJeHX1c0j0O70T2tCDCjv08ttE58Jwig
 slDVHYTPG3fSf+FKwM4EekaI8ZE0Gh9l4VCTWefa/NQIVO9B3G2GPfimk1ZxhczK1St8A16cC0J
 moNUjxG0h4Vgs1QGPP2LJ+ggamp0fHj0pYmCEV9ar1SNs5Etb5b3juJojZsIB3zQKHvOk+ISyHE
 g+qNM0OI1hIa3/aJLLjMpOJnIywzY5ZGKMYZkeEnTYrGwWoWXbM6XTbgfMX68N06hf3SwgxPAMB
 b7l7SPujr+3ft4pR00m1OxpahuJC0Ki7cBY9GpCq0jKaqZO2EPWaCbfzDHW28reCTVQK+/Ok2fs
 8jApUu6WkI6X/9hgB/nBYcXsNqced07ZAQD79OY0aSBHeNM3fZ8s9sLx0hcuhzkqww0MLuU1t51
 3RPCgVGZ1J6nyEA==
X-Developer-Key: i=tobias.heider@canonical.com; a=openpgp;
 fpr=9B693D7440802E8A6FF803DE13498F032CCFE9DA
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103937-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	DKIM_TRACE(0.00)[canonical.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tobias.heider@canonical.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,canonical.com:email,canonical.com:dkim,canonical.com:mid]
X-Rspamd-Queue-Id: 043F543A7A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Limit the digital gain and PA volumes to a combined -3 dB in the machine
driver to reduce the risk of speaker damage until we have active speaker
protection in place (or higher safe levels have been established).

Based on commit c481016bb4f8 ("ASoC: qcom: sc8280xp: limit speaker
volumes") which addressed the same issue on the sc8280x SoC with some
minor changes as explained below.

The Digital Volume behaves identical to sc8280x, both use the same
lpass-wsa-macro.
For PA x1e80100 machines use wsa884x amplifiers which expose a linear
scale from -9 dB to 9 dB with a 1.5 dB step size giving us
0 dB = -9 dB + 6 * 1.5 dB.

On x1e80100 there are two different speaker topologies we need to handle:
  2-Speakers: SpkrLeft, Spkr Right
  4-Speakers: WooferLeft, WooferRight, TweeterLeft, TweeterRight

Signed-off-by: Tobias Heider <tobias.heider@canonical.com>
---
On x1e80100 laptops like the Lenovo T14s Gen 6 most of the audio
enablement work has landed upstream at this point meaning it works
out of the box on any Linux system.
One unresolved problem is that there isn't a solution for active
speaker protection yet and the current default seems to be unsafe.

With the current defaults it is trivial to crank up the volume to
a point where the T14s will hit what I believe is a hardware
protection that shuts down the speakers entirely until the next
reboot. I am worried that this means there is also a risk cause
permanent hardware damage with the default settings.

This patch adopts the same limits we currently use for sc8280x to
x1e80100. With this applied I can't trigger the same shutoff I
described above.
---
 sound/soc/qcom/x1e80100.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index a3f4785c4bbe62e7e027deb6d810e0a0275d81c2..94ed3ade0dafb489adef3474b71d9d2487ee3890 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -27,10 +27,27 @@ static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_jack *dp_jack = NULL;
 	int dp_pcm_id = 0;
 
 	switch (cpu_dai->id) {
+	case WSA_CODEC_DMA_RX_0:
+	case WSA_CODEC_DMA_RX_1:
+		/*
+		 * Set limit of -3 dB on Digital Volume and 0 dB on PA Volume
+		 * to reduce the risk of speaker damage until we have active
+		 * speaker protection in place.
+		 */
+		snd_soc_limit_volume(card, "WSA_RX0 Digital Volume", 81);
+		snd_soc_limit_volume(card, "WSA_RX1 Digital Volume", 81);
+		snd_soc_limit_volume(card, "SpkrLeft PA Volume", 6);
+		snd_soc_limit_volume(card, "SpkrRight PA Volume", 6);
+		snd_soc_limit_volume(card, "WooferLeft PA Volume", 6);
+		snd_soc_limit_volume(card, "TweeterLeft PA Volume", 6);
+		snd_soc_limit_volume(card, "WooferRight PA Volume", 6);
+		snd_soc_limit_volume(card, "TweeterRight PA Volume", 6);
+		break;
 	case DISPLAY_PORT_RX_0:
 		dp_pcm_id = 0;
 		dp_jack = &data->dp_jack[dp_pcm_id];

---
base-commit: b4e07588e743c989499ca24d49e752c074924a9a
change-id: 20260421-x1e80100-audio-limit-f6e75e0ad422

Best regards,
-- 
Tobias Heider <tobias.heider@canonical.com>


