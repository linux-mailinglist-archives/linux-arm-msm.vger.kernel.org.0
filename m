Return-Path: <linux-arm-msm+bounces-116591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d8nmFhS6SmpbGwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 22:09:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E397970B457
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 22:09:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=qnSnklhY;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116591-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116591-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A96C5301C3C6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 20:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F289C3A380F;
	Sun,  5 Jul 2026 20:07:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7D335E1B7;
	Sun,  5 Jul 2026 20:07:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783282063; cv=none; b=pPNcdgPS9Q7CmwK0EfOPOwI6ZiPX01WWWHuybyxz3dzS0LhRNh70r6tlb+SxVlnnb6dnMrN5eVN65yv7uPi3SAQ0ybebeeAe2bsNiS/1kkI0PmcecqE9zHmiIwiQSJG6rHv7pQD8B7tV44CQAItF4fe0Sm/0wx73VXv8df/gSiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783282063; c=relaxed/simple;
	bh=S7zp59IV+EIooHSDmPyNRcnYaYzO7GZlM/V3CjNAfoQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lwI8LNv2+R9Km9pLKZp4sCOuxhlZNNUTsKfNNtmSHSufzn1ZMwWw8Ml3jcPYkOkNDdvwKU2gBi2Cvwl4W1ziyplaE6WL+4LB3uNHSC+5Pg8dRwPnu8t7hFMXpyQgPwYGMHyQWNvfcqFbbBwf35tcIa6IV1cACj8uuC6SPR8PJf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qnSnklhY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E685C2BCB8;
	Sun,  5 Jul 2026 20:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783282063;
	bh=S7zp59IV+EIooHSDmPyNRcnYaYzO7GZlM/V3CjNAfoQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=qnSnklhYtn5J7inG0Ka1aJM6NSNND3KbW1Pm443xvKnTVqaNsly6rjRpofneaolgi
	 xLFNhViuaOH/1C/nf9lOOcfXn+rXmbJjby+LVZOwIE9bMhxXWu0yk7YBYRilDMIzBa
	 IgyIR4O5NEF1/31yCJPXE2Mwdo8SvAu9r+SNzJN6JpGVrKYvv0J1aKl75WVBDxgQIO
	 lFujaGxcyrChJKWI+n5NBzcKQMFj0C7b595EvLumdKEo4AU77pjeaF96Neu1MFaqjJ
	 KaVE6wxjrlslmCQWmJ9k6VXMQDjckj+puTXbkCg/JbeAFBBt9XUBl2z5eBM19ZJfeU
	 lVEv9YtpXwWrw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25725C43458;
	Sun,  5 Jul 2026 20:07:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH RFC 0/6] Speakers for Pixel 3 / 3 XL
Date: Sun, 05 Jul 2026 22:06:50 +0200
Message-Id: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFq5SmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDM0Nj3YLMitQcY93E0pTMfN2klKS0JBPLVAsDY3MloJaCotQ0oDzIuGi
 lIDdnpViIYFFqYSnQ6BKITGxtLQBUxJrleAAAAA==
X-Change-ID: 20260613-pixel3-audio-bdbfb49e8037
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1608; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=S7zp59IV+EIooHSDmPyNRcnYaYzO7GZlM/V3CjNAfoQ=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqSrmMg/DrCOau8GMC+VQV0U2DfFXLz7KVPQk1/
 doa+FRM7piJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCakq5jAAKCRBgAj/E00kg
 ciGHEACP1Dg0KxLbYm20Ol6Bqx7HYPq3Evdjm9H4EdsvrD7/HUH1DHmlc8C2+g7xWtAFOJSwYv8
 CV0YayVLm9aOz0FW/dPE3gFX4m38tP1xCCcZj+c7dXfNbrtikqblCHCpppLBPIuyoEhuYFHZDBS
 HwmEnJdgGesuSlf65TYZzlTZ574ud8Kp3G7DNd9bnEyr3Ef4uCFN+OShWQgeK5+c4Us1sdYLfZA
 Ng+S5HF9JbFb1+9c3Uhs8WIrII6QCbcqQeeWTUWCFiYixLlCE8F87iS9EIgztD6UWAmb+WgJSYO
 Mk4xrIZht0+CXOIsBLqZItoUVQRzTVaSn1XONRVcXsw47CW4t/rRyEPqPoEHEHpOesFEszQ77m2
 4GCfkolQytcOa7RVHo6w2Gdm5W7/DmcQcyOH9CWuzfFI7Ns4hGjQuWHVJKtQy3S/4nMQ3nIOkic
 IqfPOa1CKSMPnra7g3xzuHUpTI4/ocbYBc7ko/L/VBjeeXCkfJanUFI3W+qI3gqlARlBLEBh1IC
 VV5EK0a4xFjL3qkjNjk98zNBztrPVCf2uSSlLKjy5lT7Lpl7knjdhWmklEZrOf8fYV/L7fDn4/p
 vBnUaUz0/tEDxIuUi2tR3q0zSq17citte4RNkXq0o6PjzppOMF2vp803Y4OvWo7kw4BnvF64/v9
 BRU1zBzG0wNAOfw==
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
	TAGGED_FROM(0.00)[bounces-116591-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
X-Rspamd-Queue-Id: E397970B457

This series address:

0. demistify the hex to BIT() macro and add left/right rx spk
1. most likely wrongly set DSP_B in sdm845.c
   my guess this is because TDM was never used in the mainline with
   sdm845
2. applying correct mask to left/right speaker for the TDM in sdm845.c,
   so both speakers can work simultaneusly
3. setting sysclk at startups, which some codecs need (such as cs35l36)
4. setting proper tdm slot in the cs35l36 driver
5. device-tree wiring for Pixel 3 / 3 XL

Consider my knowledge here limited, thus sending RFC. Some parts we're
heavily assisted by LLM - I believe I understand what I'm doing, but
my knowledge within audio realm is limited.

David

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (6):
      ASoC: qcom: sdm845: Demystify TDM masks a bit
      ASoC: qcom: sdm845: use DSP_A format for TDM codec DAIs
      ASoC: qcom: sdm845: Use per-speaker RX masks for TDM slot assignment
      ASoC: qcom: sdm845: Set codec dai and component sysclk during startup
      ASoC: cs35l36: Implement set_tdm_slot to program RX slot register
      arm64: dts: qcom: sdm845-google: Add basic audio support

 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 133 ++++++++++++++++++++-
 sound/soc/codecs/cs35l36.c                         |  16 +++
 sound/soc/qcom/sdm845.c                            |  46 +++++--
 3 files changed, 183 insertions(+), 12 deletions(-)
---
base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
change-id: 20260613-pixel3-audio-bdbfb49e8037

Best regards,
-- 
David Heidelberg <david@ixit.cz>



