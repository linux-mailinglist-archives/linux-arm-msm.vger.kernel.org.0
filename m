Return-Path: <linux-arm-msm+bounces-116592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OGf2Bhm6SmpdGwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 22:10:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DF970B45F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 22:10:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="F/eYTamo";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116592-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116592-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B946301DAE2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 20:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F413A59A3;
	Sun,  5 Jul 2026 20:07:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A8D35E1B8;
	Sun,  5 Jul 2026 20:07:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783282063; cv=none; b=fFO6d2Y/jvaTVrVTFQGPdsV7wQkU6IV9x8PU8JCZV3w+nqOY4DOwrifd6ojdPOG5/AVMELbyfBliaC3aKkv6Wp3/MICsxQzcdJ5eBWEmAFDxw8ESayh4cwZqduuZnsMD+6xE5VADaecOpasm2R9V9qBMfG8/AQZcq9cunjymRaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783282063; c=relaxed/simple;
	bh=F9EWbaH4SlJVWzjQv7+vyFfWqXnVpGK4jskmDTmzhyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uvyPwW+PER3Wa4+HnYAYondfFZdbPnO30o5n8m16DslrnTQYC74kW9DrU1HFG8TGUwHB/aLMyn31EybSvftr6uMZfM+RuU4GFo16Nk8RfmYKhmtCJUNPeKE6dWgvf4G2vu38ACQrcapmbKdoQwDydKHpkU+7nH7l2C4gNOV2+W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/eYTamo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 785D1C2BCFC;
	Sun,  5 Jul 2026 20:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783282063;
	bh=F9EWbaH4SlJVWzjQv7+vyFfWqXnVpGK4jskmDTmzhyY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=F/eYTamoSQuOCOEjXPH2kiDH+CDJfSdFjbdWxZU301H/U0ll/99G+lYU7PLFeKuKr
	 JN5a4TfRFcGBE3qv2a/UdJdgk0m2I8Q4daY3Lc7inLnK3AWXsehWmFjVFNHi0Sy2fA
	 TerctjejyRj1BzfMTbtXwsirFO8vTgRY8bLI2ijdDnOP3VuZAGC9+QkK5soV46qPew
	 nnKmheI3VJWdqqkQ7EgJKQFahjrBZjQftNXNpaQKMM9qktXRljjJlTjsOt8gUOiWrD
	 57K9Vm2DBYRsM521FAO9vZ9Xwkvg2+d3cuZyORs0007g4OmLr91mD3xDJUS6bIeDx4
	 IbvZ4XdUU1GiA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A30C43602;
	Sun,  5 Jul 2026 20:07:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 05 Jul 2026 22:06:53 +0200
Subject: [PATCH RFC 3/6] ASoC: qcom: sdm845: Use per-speaker RX masks for
 TDM slot assignment
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-pixel3-audio-v1-3-3b66f33859f1@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1658; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=TMUrTbPrHE+xNnL2Ezz+7c9lEmNQyl45Nx0PNNPOshE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqSrmMbD27JS8uy65De/uJL29mvkTBDiClKBsj6
 bd3h3qSExyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCakq5jAAKCRBgAj/E00kg
 cm3+EACIB+2F5Pm1eF2JmiEFiB2CHSvQDhE4+1idmNSimWUdpxrQIMFP9qAdttCmS7XJE9FHk3q
 H8VXD56rW9LX1guz8mRFyBcKSz2rqguW4Jg5eBPvciHY8brU7L2lnHmM244UjRgXwfRzQDtvUlQ
 MmPOe+nURMtTZWft1vci9uzGoQiPNXG92vF1MO+KmiFlrA1eT1c6w7FYVQ1/15ht38GCMzu6wMY
 9pZsxdiQREdpCMw6lfdfqyZ/61ZL8I0FbA1yM2d8+4OXHAckAq+uKZj9hKLN3Hz9lm9dyQTu6qd
 9mxAGzoN/DB4GnJqlT+4Q0sgK3z6BBO6p9ZK8f5X6l6oCoR++5J9eMel5J7X4dgj2+ETf7CW4vC
 YfiIYeJRiPTmZiaFeJVgZbV0mohWgrAdXA+4Zcd/6l8Gd7kUgHNNat4AINkiJrhnebhYkWKCMlS
 ih+gpeROoit7aqnxRjeETkZb+5c5VIh8boXfJZg7n+yvlY23MJuYjUedWk8BDXqPJr8LE/N/giV
 M4hZvKAj9b5OL6srXOuBdgwR0Bmu63BT02Jy2M0yBVvwpqIH9dKNaMZyph7TbFzf+fBsIV/wNko
 lRRXCJMYaHupDO4UFlb0eZbbTFCNxwE3/lKYIchinBmfXzonwZDPinnonPfbZRKkKklBCTGda/m
 6tyLGHkdCicqQ+A==
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
	TAGGED_FROM(0.00)[bounces-116592-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
X-Rspamd-Queue-Id: A5DF970B45F

From: David Heidelberg <david@ixit.cz>

Both Left and Right codec DAIs were passing the same SPK_TDM_RX_MASK,
both speakers ended up on slot 0, breaking the one speaker in
configuration such as on Pixel 3.

Split SPK_TDM_RX_MASK into per-speaker masks so that the Left codec
gets slot 0 (rx_mask=0x01) and the Right codec gets slot 1
(rx_mask=0x02).

This commit is here, so later CS35L36 receives correct slot for right
and left speakers.

Assisted-by: Claude:claude-4.6-opus
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 sound/soc/qcom/sdm845.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 9de3282bda4be..8b65aa3982d47 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -150,29 +150,29 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
 	for_each_rtd_codec_dais(rtd, j, codec_dai) {
 
 		if (!strcmp(codec_dai->component->name_prefix, "Left")) {
 			ret = snd_soc_dai_set_tdm_slot(
 					codec_dai, LEFT_SPK_TDM_TX_MASK,
-					SPK_TDM_RX_MASK, NUM_TDM_SLOTS,
+					LEFT_SPK_TDM_RX_MASK, NUM_TDM_SLOTS,
 					slot_width);
 			if (ret < 0) {
 				dev_err(rtd->dev,
 					"DEV0 TDM slot err:%d\n", ret);
 				return ret;
 			}
 		}
 
 		if (!strcmp(codec_dai->component->name_prefix, "Right")) {
 			ret = snd_soc_dai_set_tdm_slot(
 					codec_dai, RIGHT_SPK_TDM_TX_MASK,
-					SPK_TDM_RX_MASK, NUM_TDM_SLOTS,
+					RIGHT_SPK_TDM_RX_MASK, NUM_TDM_SLOTS,
 					slot_width);
 			if (ret < 0) {
 				dev_err(rtd->dev,
 					"DEV1 TDM slot err:%d\n", ret);
 				return ret;
 			}
 		}
 	}

-- 
2.53.0



