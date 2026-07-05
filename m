Return-Path: <linux-arm-msm+bounces-116595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DBIOKUu6SmpqGwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 22:10:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC3270B475
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 22:10:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=d4Evym9u;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116595-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116595-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DB63303ADF3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 20:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7506C3A872B;
	Sun,  5 Jul 2026 20:07:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D711A38AC9C;
	Sun,  5 Jul 2026 20:07:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783282063; cv=none; b=HEvxLa2jUxrlOUK4yyhHmbjMRQQE9CzkvGpMCHsZrfiv1NVy9mc10ejEiXVgJtQjSO7PSnH/muYw1QoV1i021IBLdFWzDi3jwvK2Bgg9BJrZsbTVg9bBx2XGqrmYQz86qGpzl/C0X0atlNd97OC0dhywBooKkFd/YM5vG7O7KmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783282063; c=relaxed/simple;
	bh=UCp+v1L58SBezxTtqV5cFfyTfqLwynXCZx59HUwzg9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kY32Z98WF6FU/aA4/dbERx3G0SqCDwbTabTT8bxvN91TS7ChY0yR4AiDTfTQiIHXg9a4qClumHqMmRZONLmxxSg4yBDRMEkLY8GTr+JLa5/BGJzBOMl8Bqx8bBMyMrQ4iK4U4w8jxod4p9AlsrmDTY7xkVymWiPF9+Qe1Xzghd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d4Evym9u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F096C2BD01;
	Sun,  5 Jul 2026 20:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783282063;
	bh=UCp+v1L58SBezxTtqV5cFfyTfqLwynXCZx59HUwzg9M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=d4Evym9uf2gfEWGSorCce11MNOCuCJqLi7EacGEMWWXFJ05O/TdSj4t/2c6ROETAT
	 zZAO/8263c2MoiDrzVisuNkaNL/HProIJfKk8gloBu+fbrnsguF2fHzufpu/eP/3eT
	 AIXKZPBn7GhW4iF7hUSMJU9XOhzaNKoWJ1SR6yNAplbMbVoNdJuuMhHXagKZdrt0mK
	 ZnRliHTgGg9iq2V32i1QvbcuooqqxkA1zggqLwDa17/mGUSdRAu0ASKkLkGmeeXXhB
	 NGQRjPJOolEqDrQQIktKRtP2fnU8GRASOTAADrVbupi17G+xhk5P82gCBq0u/FsW9M
	 uPAx9SwIeJw4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7860FC43458;
	Sun,  5 Jul 2026 20:07:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 05 Jul 2026 22:06:55 +0200
Subject: [PATCH RFC 5/6] ASoC: cs35l36: Implement set_tdm_slot to program
 RX slot register
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-pixel3-audio-v1-5-3b66f33859f1@ixit.cz>
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
In-Reply-To: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 David Rhodes <drhodes@opensource.cirrus.com>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1599; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Y1j5N1bsyvti4tApXHFOSmQqrynSPavAfsDRdarjbcg=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqSrmNvtTDzkkUez/EZkvPO+DARcRMgCrhrAtOH
 zTVlGJDp0KJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCakq5jQAKCRBgAj/E00kg
 cqv4D/9wBNnggajHJdc6377I+XzjGoSnLbVnz/hix5OpkOgS9eN7/TtyqNQpKhJDW6pYIw5P+/H
 Fb4C6tCRNEZtgGMBKZYDBir4Yix2JOgRQQKmzauJjjr8/NQZQyJA4YJ603E8NkhdKcc80MQfJlq
 TeuoJwv6xfpP5EZUpDPvi6J/dwC/hdbrf57nsNEaWpqHEVqcqLrupuOyM9iNVEJ3BhbpaIZy644
 jsHmyRyIYIVPjfWtl7myLl6VbleCuT4kNIYJJ2aFBQ5+kvg0rsBjlZYcikZAK08OTgImhJM+k3W
 PIwuj0Kp1zT+iL2vOh0YxtMWScBpWlMhns15VQjOW7xMXve+xFe80TkX21aidIN3U9VD5OZlsgc
 H5BjPMfFU4LMflqcCQGeB6fU5U/E5nTjDsZXVgY/vzIjRHpM5QPcTXV14eyGIGiZPHscdnQBZlv
 j5W2k89PiVgwlp8tkGQhFVooM/DP1R78mAscVEwaPKPHJBRU9wNyCWhkmcdnjxENf8SN1ASnDVm
 MJhyJ6C/FHjtvK35tMsOYODnMUAWsYRacF8M7MCw7jRQPUlr2FLphwf0e1GyJbSv0HkJkjxLB8T
 tIojJOnXz907qsU6wIED0qApTyJWmAApg1x0K6RkOpW7Sg7cX8nxb51GfJ1+DtfL9MatP4GBklL
 /sNvq7OZq3XOONg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116595-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:drhodes@opensource.cirrus.com,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,m:devicetree@vger.kernel.org,m:phone-devel@vger.kernel.org,m:david@ixit.cz,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,cirrus.com,opensource.cirrus.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:replyto,ixit.cz:mid,ixit.cz:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EAC3270B475

From: David Heidelberg <david@ixit.cz>

Program ASP_RX1_SLOT with the first set bit of rx_mask so the
amplifier listens on the correct TDM slot when configured by
machine drivers.

Assisted-by: Claude:claude-4.6-opus
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 sound/soc/codecs/cs35l36.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index 89645327945f1..944f4cb5763e4 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -942,20 +942,36 @@ static const struct cs35l36_pll_config *cs35l36_get_clk_config(
 	for (i = 0; i < ARRAY_SIZE(cs35l36_pll_sysclk); i++) {
 		if (cs35l36_pll_sysclk[i].freq == freq)
 			return &cs35l36_pll_sysclk[i];
 	}
 
 	return NULL;
 }
 
+static int cs35l36_set_tdm_slot(struct snd_soc_dai *dai,
+				    unsigned int tx_mask, unsigned int rx_mask,
+				    int slots, int slot_width)
+{
+	struct cs35l36_private *cs35l36 =
+			snd_soc_component_get_drvdata(dai->component);
+
+	if (rx_mask)
+		regmap_update_bits(cs35l36->regmap, CS35L36_ASP_RX1_SLOT,
+				   CS35L36_ASP_RX1_SLOT_MASK,
+				   ffs(rx_mask) - 1);
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops cs35l36_ops = {
 	.set_fmt = cs35l36_set_dai_fmt,
 	.hw_params = cs35l36_pcm_hw_params,
 	.set_sysclk = cs35l36_dai_set_sysclk,
+	.set_tdm_slot = cs35l36_set_tdm_slot,
 };
 
 #define CS35L36_RATES (		    \
 	SNDRV_PCM_RATE_8000_48000 | \
 	SNDRV_PCM_RATE_12000 |	    \
 	SNDRV_PCM_RATE_24000 |	    \
 	SNDRV_PCM_RATE_88200 |	    \
 	SNDRV_PCM_RATE_96000 |	    \

-- 
2.53.0



