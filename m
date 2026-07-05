Return-Path: <linux-arm-msm+bounces-116593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ELTnNBy6SmpeGwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 22:10:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 342EE70B462
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 22:10:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=XLSxviUn;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116593-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116593-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D959301E963
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 20:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0951D3A641D;
	Sun,  5 Jul 2026 20:07:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B18364024;
	Sun,  5 Jul 2026 20:07:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783282063; cv=none; b=X2+biw4HWIVyvJnfQseGg9/gtP7xEQnLRJuvR2hgL7PvNhOnBmcO6jJ/wL7D60LGnq6xJ5ygwvAj+xlh6D3R1aAoCI3i6Luzx+k6SImiSnjB3xlZ9N+rMnFVGOjV4zbJX4b39nKtFonSgqHyFvBDbvunPZXSGroXLL40wC/NZsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783282063; c=relaxed/simple;
	bh=VvwR34GrkuePkLyuBpKHAsX8O4xSWMz5vMuSgogJny8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B2DKZ2DfqDObqpDzdj1kihFxTC+/C+6rEc3ECwyc5NP8SnKXOJVF2pLC9oe1EZTNqa/isDvsvfSCKB6gCEhKJMV3409djIIkR+Oq453tZN/lwoPbcK9Iu2/VtcLpeprtr1Vhah/qk9fNT0/Or4o9JydRJy7vNyXdUp/yiORBA0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLSxviUn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80794C2BCFD;
	Sun,  5 Jul 2026 20:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783282063;
	bh=VvwR34GrkuePkLyuBpKHAsX8O4xSWMz5vMuSgogJny8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XLSxviUn4us0ragof6KYg+D8+KaZASQcew5y+07UVSmw5o65EGS7hIbuxi7jR1Vu3
	 +VXI9NiBRGWqSMldRasNSktDs1bvJI0RBckGOM9/opMJ75wNhF4Luqc7cJ0GZaZcXG
	 XMdjlfzHL9CMrkAE0uaBcuVMV5lKy1UfSXJTxE1nJP6BnU7c3H02KHCwI4j5UfrX/u
	 atlnZHTESVwf/MMROrDvShox5d/fQ9IWN0tdSnoL2yrCNRyi5uSRM1RCJu9Z49Fm7P
	 JZ++NuCjLWbJKO47kc5SY/pewrPaf2WUdUTIh5TydDcwsjQSCkVknDV6VJwJceVF+U
	 xTUasdmy+pgTw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69187C44503;
	Sun,  5 Jul 2026 20:07:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 05 Jul 2026 22:06:54 +0200
Subject: [PATCH RFC 4/6] ASoC: qcom: sdm845: Set codec dai and component
 sysclk during startup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-pixel3-audio-v1-4-3b66f33859f1@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=n0PeFm63dnLy+X+LVgbtdOBKLaGfaMF2ztTB1COcsjk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqSrmMR4XPVxQio6cQDFEW8o1Exzr5qz0l3N4Kr
 2AsCbMI+5aJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCakq5jAAKCRBgAj/E00kg
 cpkhD/9SGmyX53buIajBlu1QAMJQjK6dp++8jlZpT1uVr/zpG/0swg3GoZaihX/GLINFDRdhESE
 f2zCg2Irdjj4ey4twlT8XNaaw1mXX+mRu7Kx0AJ5wfSe1TS57oIcpdIv89xpij2c6TQlVd6ca/k
 9vJmGierJ8k5jqdUMme38EHxCpnWVoGeW2wRYGHX+kvM9IUuUdekK8nnvpF7ks5j56jmzJAk+j7
 3jhKtnXLEqAJY74d45tlV9Px/duegCs3R6+j/eA9KTwSvfc3+HcabHW9nDStfHZJP29Lxhb0J8v
 K/3DW0ObxQ0+MndNSXjql3x7q8SzLrzLr4Ld99TFvA7xYa+RUgDc4SRJ22YW0UxC9rHFrGfUTGG
 3YDDMT9KnwS+j0USNfUljJrDECbSahFmWkpOhtjsxb4pOAe7ebBHyXH3DKbw4BEhhfAdLv3Fr9u
 Swq+bbWdSTSHXNtNtjP63Q021Gx/e6RTLXr6xh7GPOVmYiIyf/ElhwknTbfLIYa2AJJEwdlmdGP
 f51YkMXEowrxQ/lmuaorrbGXKFdQbCJX0gPwbSNUXnUqEgHGwDKUk3akkGps2i7+tCM4HnFjWIO
 hfIbl2J0fliDUja81URL7YEAbjzievSK/NfLDH2V8oG6tL1/gnesLQKaqyr0ifi+7a1rEdDPIL3
 kPV5wwzYYcehFjw==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116593-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:replyto,ixit.cz:mid,ixit.cz:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 342EE70B462

From: David Heidelberg <david@ixit.cz>

The cs35l36 codec needs the codec dai and component sysclk to be set
during TDM startup. Set these for all codec DAIs on the QUATERNARY_TDM
path, gracefully handling codecs that don't support sysclk by ignoring
-ENOTSUPP returns.

Based on work of Joel Selvaraj.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 sound/soc/qcom/sdm845.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 8b65aa3982d47..b2d51e472bc26 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -405,16 +405,38 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
 				ret = snd_soc_dai_set_fmt(
 						codec_dai, codec_dai_fmt);
 				if (ret < 0) {
 					dev_err(rtd->dev,
 						"Right TDM slot err:%d\n", ret);
 					return ret;
 				}
 			}
+
+			/* Set codec sysclk needed by codecs like cs35l36. */
+			ret = snd_soc_dai_set_sysclk(codec_dai, 0,
+						     TDM_BCLK_RATE,
+						     SND_SOC_CLOCK_IN);
+			if (ret < 0 && ret != -ENOTSUPP) {
+				dev_err(codec_dai->dev,
+					"Failed to set codec dai sysclk: %d\n",
+					ret);
+				return ret;
+			}
+
+			ret = snd_soc_component_set_sysclk(codec_dai->component,
+							   0, 0,
+							   TDM_BCLK_RATE,
+							   SND_SOC_CLOCK_IN);
+			if (ret < 0 && ret != -ENOTSUPP) {
+				dev_err(codec_dai->dev,
+					"Failed to set codec component sysclk: %d\n",
+					ret);
+				return ret;
+			}
 		}
 		break;
 	case SLIMBUS_0_RX...SLIMBUS_6_TX:
 		break;
 
 	default:
 		pr_err("%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
 		break;

-- 
2.53.0



