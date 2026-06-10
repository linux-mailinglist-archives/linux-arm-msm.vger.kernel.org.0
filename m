Return-Path: <linux-arm-msm+bounces-112327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N/xqDVYVKWqAQAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:42:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D9A666B3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:42:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=XaOT+TjI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112327-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112327-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 649F7301A294
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D269939282B;
	Wed, 10 Jun 2026 07:41:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953ED38E8A3
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 07:41:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077313; cv=none; b=L1NYvla9ld6xEIgFAma7L7LF1lBgfYIE6njZpDGm3Ulqrv7oXrgY3joNsUt407Vt1ptfpI899RhMB4viEKI/C6oOKu7g6weKJOLi6baYGzAl6mIYL5U2qyNvATUr9mfU4jKlaOG7+5RWt3ITrbosaqZWHCXFG6VE/maNg9104rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077313; c=relaxed/simple;
	bh=5UzTyAoS6g0iFfj7YYMHPworEGWFMRG5Wo1KqnbC9BU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kBOqqne8PmwdGHcxhEzM1tCa2yxubGVTxhckcqM++z4iBr1jFc8DhqnJb8lVJEajo+6bzQAmGbOCLlnQ/g/ZWMV5nctHW/6Npqkabbo7JgtmM3xQ73f7Fetwb/0IJYJeE/o/6F4I9Ij/mnlf0tYHC+I3kkVfhSJqRmGIrIweMt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XaOT+TjI; arc=none smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so3118527f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 00:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781077310; x=1781682110; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=39bpH3WKD2L+6MVDhpbgj5YT1fELljkxU0ENL0/yWsE=;
        b=XaOT+TjIItdJ4k+dEc2jwudHKKddhMx0mZ10thweNkFfpV8rmPF0P2/V9856TGee3N
         TFt/KTTyR5U27ktazxsiPNadubBsQQg2UOM9W8Ea5rH26fZmF9TuAGKe1BKrbmWaUzZQ
         2/XBRx8dppyR9ZsTepus2/GdVGBdXvM+F2EV50srnmtubTJcV+wpbToi7IDzlkvIxJFS
         oITMgj8zKqmvQGmJC2qUjljByxb81jCsLCUk1PX9972Jsg3ZJn5KMuS5Tug//eBxDs9A
         jyby4lsxhKyqWWwDLgTpHiXfK7B6OJBV9t53bA/833o7bGpH2vpVWNcHIOBs0Ign7PDp
         T2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781077310; x=1781682110;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39bpH3WKD2L+6MVDhpbgj5YT1fELljkxU0ENL0/yWsE=;
        b=WF969CPavy5GbtAqvQk1QE7Vld+/aY1llNJr94LW77FnhPCEU3cN3xw1Z34VZ6QlR+
         kkxdOAUVfIquP17bCjLp+ZPMNez+f6GMIMPXzcMIW7QTR7GKNumXBSCVpPWlCgUAhPMK
         y9nUnplkA3mQWjvoD3LootIsMwZx/HwHp/oRNpi/00D1+RQmeLKkSV4hOnCL8azpQVzJ
         OII/9E8nQPa5lk+VKKlGKlh7rsozlsFf8YCXnxpkONJspvuGEZL4xOgCiyVYALPmdEvr
         uSkUgYjLIe9ZyMZX4l5ux6eW5gMjL3CzkC/ji26aKNwkLOVZoin/n8KHxzjLD4i52gjF
         BOrA==
X-Forwarded-Encrypted: i=1; AFNElJ8xU4ktqly+Jq7BOuI/cNjNXQGOBwKslB9yaSdVEnYuh3DvJUoNLTRpTYVKLJOhjZpsRDEd9qceosJOfYZr@vger.kernel.org
X-Gm-Message-State: AOJu0YwVLDK6UxHWte0+zr2rbeQr4VHlk2To08LvnGH176qN2o9Aj7UY
	KK1c+SHWYKMLseSXagGMM/2zxBX5v2Y4OpMLF9DheABJAZ/Cgmt//SpPY0rWV9KoJDI=
X-Gm-Gg: Acq92OHGUDy5PK0bE/mA9tdj02CMH8o/t6xgavCIPdWaGVLl1UIF2Oq0QacCXmYeJhX
	wg6W9I1cb5gWmct8fBxqM26n5GCRRLzYpSfs1iKcQ2LttAeDOAv4V5wHs1+DY3UWCyOL7cDIBjp
	usaEQ6ryfh6BniYpD8U9Q8TlGE1zTko0l1SHI+5MmvxNC0IaIAJ7zmPLEX+9MxY392viUMKPe6c
	j2NoFNmy/obJPVX69fSenqxsg+M2z3d1mWx1HuTFoNIPMdMGk7RK9YVE7v38Iyl8x/twMY0Edn2
	geDJXQABqsFd0B3ZOuGY9DinbJtyG5OBHs1eiJA1Fos8+tFt28MLUgg0Fb0JyLFskiI3sFpW1vN
	fd5ZEET+sbaF08CmmGa2dqAm+QeqEq5kqm7I5+E4QVN93SpB9tCtlmuwYXKoI20fUeeJsVqRDOe
	lc267ocUXWBGVRH7ZOmLXOvh9PxhlmPmZBtPoKY2Uiw37PY0y4KBbWFKQ=
X-Received: by 2002:a05:6000:2993:20b0:45d:3cb0:5ab1 with SMTP id ffacd0b85a97d-4603065272cmr28711653f8f.38.1781077309957;
        Wed, 10 Jun 2026 00:41:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm69161344f8f.20.2026.06.10.00.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 00:41:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/4] sound: qcom: audioreach: support WSA speakers only on
 WSA2
Date: Wed, 10 Jun 2026 09:41:44 +0200
Message-Id: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADgVKWoC/yXNSw7CMAxF0a1UHmMpREqgbAUxcFMXDCKJ4vCpq
 u6dAMPzBvctoFyEFQ7dAoWfopJiw3bTQbhQPDPK2AzWWG+86bGmLAH1vvfOIM0UOWFO4cYV1eJ
 LyeIkb+ShN87vJh/IQYvlwm3+HR1Pf+tjuHKo3zqs6wefo0psigAAAA==
X-Change-ID: 20260609-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-eb90567f6ca5
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3739;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=5UzTyAoS6g0iFfj7YYMHPworEGWFMRG5Wo1KqnbC9BU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqKRU6kldpjKA/sRGpREgWdGvgYZAr0Su/Su0bKbX6
 bwYHl5KJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaikVOgAKCRB33NvayMhJ0QMmD/
 4hDpCFbnKM6/Fu6IgSuHf7DgNb8yAfZEmK8N3qVQP8+a6aftatnO8J/7uH+A3cEsefKZ5xtNOjNKbo
 yRWCnrsH/grtUmd+01klKNxFNFp8T4DbKGA35eeSPcXsAssgCB7Rk9PZ0uoLafzyjkfcGDDroloEwN
 y5Vrnu8gEpLk4bMQCgeacs9o7maP43P1uJqPAtwbtLia3rt+eJZHucCkxB3/isFBi6cAeMta9Lheb6
 njT5SZz4izk2M+cXXtgsGIsiGWrUXEyf+Gd0D3ysC09cJ49grS/9tSsQlrGTk1Y5gHfGEUJQNzhGS7
 AuvuqsWHDUJ4OewLK3to/lJMxPhB3lN/cLxdppN1cavlNNTWVVFRAjOvgzO3Drex4eaUJiPnqJUT0j
 tYxs6yz+16Z7yqSzQQ5eq1oBAMs61qz93lmqeoJ4bH0SRCih6k1Lno7zzTd67jKNbj7JXg/yGrNSkZ
 umPge+QsaXPN4GfrnCaqhD7niapgMREkkx7e/SF1G1PmSG9fxzIRGF6i1nz9woWYzvHYjBItA6j64g
 yyGLqBqhjDi7+Kr26zzskDbES3YZ2NwhSzmM+gSk2F3FIK46rLZAhfCpGogFsjw30ocwmPQT8cShBq
 Ps0SngmgLOLGJe0zybzSZthhPo9W7YBiY0vK2oZIlPMHIFuSATgvdQ9pPkHA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112327-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kancy2333@outlook.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[outlook.com,vger.kernel.org,linaro.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 98D9A666B3E

The Qualcom SM8650 based Ayaneo Pocket S2 gaming device has a set
of 2 WSA speakers connected on the WSA2 lines.

But the Audioreach DSP only handles WSA2 in pair with the WSA
interface by using the upper bits of the active_channels_mask
for WSA2 and the lower bits for WSA:

 __________________________________________________
| Bits  |     3    |     2    |   1     |     0   |
---------------------------------------------------
| Line  | WSA2 Ch2 | WSA2 Ch1 | WSA Ch2 | WSA Ch1 |
---------------------------------------------------

Setting only the WSA2 upper bits is perfectly valid and
functional but the current Audioreach code builds the bitmask
from the channels count with:
	active_channels_mask = (1 << num_channels) - 1;

In order to enable the WSA2 bits the channel count should be 4,
but the lower WSA bits are then also enabled and the DSP errors
out when trying to play on the disabled WSA interface.

A solution would've been to add a fake WSA2 topology element which
would be translated into the top bits only, but it's not clean and
add some special exceptions in the generic Audioreach code.

The solution suggested by Srinivas is to use the channel mapping to
set this bitmask.

This works but makes all the other calls using the channel mapping fail
because the DSP requires the channel_mapping table to start from index 0
and using num_channel length in order to apply the mapping on the
active_channels_mask bits in order.

So if you have an active_channels_mask like:
 _______________________
| Bits  | 3 | 2 | 1 | 0 |
-------------------------
| Mask  | 1 | 1 | 0 | 0 |
------------------------

And the channel mapping:
 _________________________________
| Channel |  3 |  2 |   1  |   0  |
-----------------------------------
| Mapping | FR | FL | NULL | NULL |
-----------------------------------

Will need to be converted to:
 ____________________
| Channel |  1 |  0 |
---------------------
| Mapping | FR | FL |
---------------------

And the DSP will map FR on WSA2 Ch2 and FL on WSA2 Ch1 as:
 _________________________________
| Line    |  WSA2 Ch2 | WSA2 Ch1 |
----------------------------------
| Mapping |     FR    |     FL   |
----------------------------------

So we need to skip the empty channel mapping entries in all other
users of the channel_map to build valid channel_mapping tables.

This should not break any other usecases since the default channel
mapping always start from index 0, and will add flexibilty to allow
some special non linear mapping for other interfaces as well.

Finally we add a special prepare callback for the Ayaneo PS2 sound card
which sets the custom channel mapping for the WSA interface to make audio
work properly on the gaming device.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (4):
      ASoC: qcom: audioreach: compute active channel maps from channel_map
      ASoC: qcom: sc8280xp: add Ayaneo Pocket S2 card with special WSA channel mapping
      arm64: dts: qcom: sm8650-ayaneo-pocket-s2: switch sound card to ayaneo,pocket-s2-sndcard
      ASoC: dt-bindings: qcom,sm8250: Add Ayaneo Pocket S2 sound card

 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  1 +
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      |  2 +-
 sound/soc/qcom/qdsp6/audioreach.c                  | 47 ++++++++++++++----
 sound/soc/qcom/sc8280xp.c                          | 56 ++++++++++++++++++++++
 4 files changed, 95 insertions(+), 11 deletions(-)
---
base-commit: 1ed783a6906ab62a54d631ff3e8c5cba0f4f4b54
change-id: 20260609-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-eb90567f6ca5

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


