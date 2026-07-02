Return-Path: <linux-arm-msm+bounces-115874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TrzLM3MxRmoMLgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:37:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6994E6F55A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:37:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="cYvxx/8e";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115874-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115874-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 10D573004D0A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39BA47B434;
	Thu,  2 Jul 2026 09:31:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E661947CC70
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:31:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984712; cv=none; b=GP5PuS8Vw/ZMEAZW1/XaCGFsF6f+arLrPUP1jABTYxBA2xrxnkevczgRnpUOprVXFj3HYtx8IhVbE3u1RCt7WlIN5mb+eT1+nMYB4Vmf27yex4vCYp/XDvWkSn2zfQVtg+RI2oUcuIxjlap0VUKJZZHvR7UCQraSEfkyYaQeNVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984712; c=relaxed/simple;
	bh=VLV6wU8QRGGOnGFH2E3sthlWCqQKEf1XkIhY/2Ftu4o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MhlRG7Qt0EayY7Y9aR8AyosFTxufo3jGv7bVNAyNZfnlFMWYvWQqDicGdR1MaKvus1BkKlVLyoKEZzgZBBQ/ASgso9addmzCwEdLVgITHE3p4Nv8U+MSAJwviyM0lAxYA9vuBRrcfEXBgKZ5Vl2wUuvZL1xltMGNbsEFZ636ago=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cYvxx/8e; arc=none smtp.client-ip=209.85.221.44
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4720d22c94aso1431822f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782984709; x=1783589509; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EpWN5prfDcpDg4wTEr+SUZl03GRcoGKno1bsz3weOCk=;
        b=cYvxx/8e/SE4KRatonyM3uwuNABvdqRR62Kbsa8SIkNBOiC02BRFd6OYiSv0ha92Ik
         2xMlUQiRnMQYIN5WLhTpQOhkLwumck3+7ExuUP9WjzJDt9/ysd1DORgXEFA6ujSz91Ug
         ZXkcPROs5cVp9qgPDQDa5UVZivkBRZxxTrqntiRovxTnLAHDkpSWVK6f0lGFeDG9nVcx
         XphQtlYoh24lc7PZjumwicVH/Jmtn2sNX1qOdLz6PvBuXK70HsYVxBB8pOLqcSZNHeRZ
         MtjW92kOwN3Au5ZHATng1z4ebiJHRIEu7GzAZ1Lox4d0rTGfw965ZOGLKmbVElIrh8Mp
         HHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984709; x=1783589509;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpWN5prfDcpDg4wTEr+SUZl03GRcoGKno1bsz3weOCk=;
        b=jc9hbhWTa830p3B0C56PRDDsTqK984ALPFqNOMHdiq3bOlETQdPwLBCEo+xbnnOi/b
         f62XLzBfxNpkPbEOLvMyUdmbY5XSSBQsxyWka2sbABMTxl16JiE0CTkwp172hL7nccbS
         2wQ4PaH7/j2FWOr/5CcBo7RDwwjBfW+3MOR6w/IfbjXQU2svIG4osiNrK8EOQem/HoO2
         uaIrM0MMz507aNqUfJfsUqY8VMR+VMiUuvk5VKkbzVwQDlYCKHh8HO5oB8Cxn2ZXK1s1
         E9DNroz9RD/gDAxsO8+U+gg6bn77r85rO+0IsAkRzKrwy1RAl7SSvdhfFvpbbE2IQ4gL
         SiNw==
X-Forwarded-Encrypted: i=1; AHgh+Roh28Awl3cVfTZRtJ4EvcxmrSb1naHuTr8DQPzlx+g6AqEUnGPnHXWbiWNG7LiRqi/JJXfEwCO+JOeoZM+X@vger.kernel.org
X-Gm-Message-State: AOJu0YwkDmBYTzCG0HlCERtIAte7P7FydGKVnXJvMMyqDYNKubwWLUhG
	jwOStn2zy+ZG+5fax583754FI0ddFehbvLhaPfpxLJ2bWbR4EH//FKQIrYf7mJZuceI=
X-Gm-Gg: AfdE7cmzsGfzwniZC0PvpnVOBwuVouLa7jw1HTKFpVGmV03kfr4LvO9Xld+7sS7RuYk
	PThXlvtEeEpNi1gXKaS4RZbs4UaFUdIFVeh+FW2pgt/sIBhdwRdXSe6z7BktXe9oBGFFAmt5YOu
	Zl1IdtJCZ78wVNpje6nSTsDJ6KjlStEZ5Npa/ZfMoOzuzf1Fa1oZ7bilXPQpDr6sDwTzTCKyibj
	pIfQj5cTZkkgYXjhl+TRGWc8BAVYF/p7joukegQsh08aLrvfMRyCzjC7YG/BRem8E+Rgjx3EKNF
	8DforhE8G8+jiZluPhVjyJFM4T43cnozr5J9pqIKi8xReHPtKLjakbiwY0FJhtwpM5KFxnCmsId
	spYqMeFUbToWPB5Crux88ZPA4juEad1F5zYyiefM/nw5WLBbZs1BHadtX9GnaXlTfth6moG1V48
	zLxIOB1PEa+ey6Ts8PiFZ61v0XtD8hMEoHSA==
X-Received: by 2002:a05:6000:27c3:b0:472:55a:ef9c with SMTP id ffacd0b85a97d-477aeb5c6a4mr4678918f8f.9.1782984709236;
        Thu, 02 Jul 2026 02:31:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477de3dd53fsm7102571f8f.37.2026.07.02.02.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:31:48 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/4] sound: qcom: audioreach: support WSA speakers only
 on WSA2
Date: Thu, 02 Jul 2026 11:31:44 +0200
Message-Id: <20260702-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v2-0-1ef8ceb8c9ec@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAwRmoC/42PUW6DMBBEr4L83bVstxBAUZV7VPlYnCW4iTHxA
 m0U5e41kAP0Z6VZjebNPARTdMSizh4i0uzYhT4J85YJ22F/JnCnpIVRplCFqmAMg7PAvixyBXj
 HngIMwV5oBDbww2igdb9ATaXyYtcWFnORwoZI6b2Cvo6b5qn5Jjsu6YujczyGeF+bzHrxvaBa/
 Rc6a1Cgy6bRlc0tGnO4uh5jkCGexfG5YSPdpjRz3LqIBpnABu/dWGfzTuqliydmXLfX2f41vVT
 mXWktqw9jTAkafOjQezzJiK2T3KG7HAKzvE14XQJlOp8J+/wDb4OTN2UBAAA=
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
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4384;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=VLV6wU8QRGGOnGFH2E3sthlWCqQKEf1XkIhY/2Ftu4o=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqRjACSRG0TFFDZKenmQTCQKoNjghpCtOXTh/uQEZF
 QVHlGVCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCakYwAgAKCRB33NvayMhJ0f54EA
 DG+4LM+Env4Hh+v74dbsuIVNi+hY62NSxgSFpjtnqURtu2FIlR/B7XMOmedQ0Ucy7bhNd41zwMySTi
 +B2zN/dsmYIsDq9UugKRFAfvVYOyTWY8JuXk9L/TNEqPmLfqfI7v6l6RRayvLcILybOI6+6ZjDx9C2
 AbmdtsWutum5fpJmQ/raSs3IsYfPEnJRPIcfu8s22J3tIAL4C7l13DzqTk2IyjATIKo0xHsjzB4i+S
 eeGP/PCsT5kEVqERRERZbfKhQq6fN5hXdDy/i5iVLHL28aQJyeYgfSw6Y2qSx33NfJl3O8EgoMlX5D
 uhleBDoqQYTuEThtTGrf+v12egjD3egFZgbAT5q5aAEqfM/3uDrqj9bSV1BWHdNSG3wGRgb8Xj7lhR
 mT/e8RgYr9+HF7srZxOYWGY2WOjRsl+OGg4Oln+uNVIsrVje/VT9mPHyJzTrjyHbDCc2ow0IiOS176
 Dm1hRhW621qyxcaKtolPUeU66sDDZQdLVVx065myo29KNRzHiF9HDwbMnSLkWoTt2Uxg7RUaRNzCPK
 TjMWgT36zBUKeetp5B+n4kr4Uo/uTVzelIpGeexFa2FPN1EcPrehl2g7GE4v8j4QJ28JUdUDv/GkIz
 dV9SOgOJhPg/SQY/DSqmzQHMpquG85knTD0nelRB2naUkCUHOxn/T+SPXU0Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115874-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kancy2333@outlook.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,msgid.link:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6994E6F55A4

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

Depends on:
- https://lore.kernel.org/all/20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Collected review tags
- Reordered bindings patch before card and DT changes
- Fixed DT patch commit message
- Link to v1: https://patch.msgid.link/20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org

---
Neil Armstrong (4):
      ASoC: qcom: audioreach: compute active channel maps from channel_map
      ASoC: dt-bindings: qcom,sm8250: Add Ayaneo Pocket S2 sound card
      ASoC: qcom: sc8280xp: add Ayaneo Pocket S2 card with special WSA channel mapping
      arm64: dts: qcom: sm8650-ayaneo-pocket-s2: switch sound card to ayaneo,pocket-s2-sndcard

 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  1 +
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      |  2 +-
 sound/soc/qcom/qdsp6/audioreach.c                  | 47 ++++++++++++++----
 sound/soc/qcom/sc8280xp.c                          | 56 ++++++++++++++++++++++
 4 files changed, 95 insertions(+), 11 deletions(-)
---
base-commit: b3f94b2b3f3e51ab880a51fc6510e1dafba654ed
change-id: 20260609-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-eb90567f6ca5
prerequisite-message-id: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
prerequisite-patch-id: 047b4fb1894b92109aa7afcebd7d5c7988ec5379
prerequisite-patch-id: 222630a15afc952683d954a3c66617a223546de0
prerequisite-patch-id: 3c55edb41f1e25920a350ce1c6f31fde67fee45a

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


