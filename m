Return-Path: <linux-arm-msm+bounces-113241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ob+kALwvMGqbPgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 19:00:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 869E96889F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 19:00:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="FKHE/9Al";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113241-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113241-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1C7C83036723
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 17:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA60A413622;
	Mon, 15 Jun 2026 17:00:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D73410D3E
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:00:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781542821; cv=none; b=i5yidpsWMGg9bFp5MvFKcmHBLdc8iMb3uMKlBwk+z55J+Gazi0m+ts7UyVJzH+0Fm4viawvTdt45+LyZtLWHNjaevEsi9vPu5yfWw6FRSzcBtWCStNebLVKNv8AVJ4ByOJ1jOya+edjZ6fcdGEebS/WWUaiM98fySqXUb47FKwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781542821; c=relaxed/simple;
	bh=YxNDpw9xuK3rygMohXzgPJDlAzMxnfekYv4lW9z3syw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EqhWfo97Biplfc5J40gCUmEQMpsCZJIvXgPcGVy/ngeBEtPYqEfCwn2UI5HgCJUEaH9HEwDWA3CO05ioTWcQzWsWXodpT6oDpSwc6EZiglIHULziSFkcTbcpQEhWA5g+qX9+JrWbvYa10cqnpoH2uKmpKJBpeFeX0/jn0I8ejMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FKHE/9Al; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4905529b933so36202885e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 10:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781542818; x=1782147618; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jq/aabxoXCdxhHTjLQmnQMl4f/hEoUj9vBeaPo8NSGA=;
        b=FKHE/9AlhTUMp3ZygCFWCTMHqJwtYSa6sSahiHFFN6XXvyGtZqFsYOyNkqbdQ0ASAc
         JfCeT31QHNAFTX+EIgqHoSO8Vm4eC3oeuUWcWyZXE+pRU1UlxZZUqf14piO+GXJeD7aA
         SyhYtkJGzjcgi0efGOXheLQY4KzWi+nJmrTMbbTxw5vYGEbIzURFGf6aJdtf5ibJt311
         ZF+YZDbAyHJom8NQtxFgNfzq2KA+IC+Dd6onN62URsII5Z8ZdkJ/pSaYUpCJzuwELy+5
         8OQ4Rmt0abnAQ0+06E073rQD9O/Lbh5K7+KboiEbGpNsEOTLdY72Mj/51ubOMImQyO/n
         /Leg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781542818; x=1782147618;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jq/aabxoXCdxhHTjLQmnQMl4f/hEoUj9vBeaPo8NSGA=;
        b=WhzaW30lyeOi/smbyA+zb7Fp5N+HCQOpybTaT1z1OXalHLE1QSJbxo7bKQHml1RM57
         BKD6KHcZ3aK8v42SlYQdMPyiors0ITblD7ZimV7mHZzfni8o2VNz1HNEIg/jo/wnIQZv
         Ftuh525/mxkObICFZDThXtHncDk+0X0CEaUDmNXODb1vegZeGI/hDxvOsij2G/OOGykW
         NsAsQlm1gy7KJVQ85XurviOcJN/LeE5kjhs+FuHo82nvgCPEIrSJ0qGh5rt5IWiUeXSp
         CxXHIXUbfkutawji2fTCT+u+Eyd2tU4Yqj2ReyI/BHJlEnsF72jKtERtVoqgAmDRX5Sa
         xJcA==
X-Gm-Message-State: AOJu0Yz5WFmqRigac5mHsV4AKIzjmNgieIY+VytuVbGD/eda52gFUkqT
	huCCd1s8lt7kTkaP9s2zuGts76yUpkJUOtRiCzdfyK97ASeDqZtQHRKV0SS7pSP7pxc=
X-Gm-Gg: Acq92OF/wGjd+hnMvL2+FfG4Un83uoSuKuJJIOveZwwnkLihkNDpICze4dZXbt+vo2b
	Czj2xwkvXYCTa5mm+YbirvX1lQAIxXy8va6C1YYYMWiPHS39t44l96gxOJEDbNgTtMpnA3igOe6
	GaHvTObdGGShk6Dk4R2kZ4F8ts+oK/aZn75fqkEiN7O2RxFreEOCgrUmVhKm9XVJG6/OBTXrHnu
	IH8eHJ2qN8FbkOm0l79O8XWxwlrOrI/guGuaJuM8xCFh2pR4Qi+wiJmGDbVHEhiIlFGcYqjdkcC
	puHEqAT4bV/54F8TCkW16l8tiIeVL/mS1Jn7cu5lzwKAf5AqeD12Ta/qX1KYhTWlIy/Nk7jAGNR
	QnN6fthQmhLGSJdnP7/TpxG4AJL7P7ZFMsi5ZjtNjQPpeUZZKcj1AB/m++7XYRoGSyguacvhzaK
	YYUmnR/JpcRsZVFNNJ55m0bPv1rn0oAwEbuqk1nCfqYyI+
X-Received: by 2002:a7b:c8c4:0:b0:492:2fa4:2563 with SMTP id 5b1f17b1804b1-4922ff9b0d6mr252455e9.25.1781542818301;
        Mon, 15 Jun 2026 10:00:18 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47d1csm5716425e9.4.2026.06.15.10.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:00:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH RFC v3 0/6] arm64: dts: qcom: sm8[56]50: add PMIC5 Gen3 ADC
 channels
Date: Mon, 15 Jun 2026 19:00:06 +0200
Message-Id: <20260615-topic-sm8x50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJYvMGoC/4XNTQ6CMBAF4KuQrq0ZSsuPKxMTD+DWuCjtADVKS
 YsNhnB3ARfGhXH5Jm++NxKPzqAnu2gkDoPxxrZzSDYRUY1sa6RGz5kwYClwltHedkZRf88HAVR
 qJWiNbUJRVwWvSp0koiTzc+ewMsMKn8npeCCX99E/yiuqfiGXWmN8b91znQ/xWv63FGIKNJcZV
 FlZgMzE/mZa6ezWunpdCezjCOA/HTY7QingOkWlJXw50zS9AOLirm0cAQAA
X-Change-ID: 20260427-topic-sm8x50-adc5-gen3-edf94fbd335b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2623;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=YxNDpw9xuK3rygMohXzgPJDlAzMxnfekYv4lW9z3syw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMC+d4YFOyD1U60xXqCO9gD8i45wOrsN2VrFVY1/W
 Jjw8OnmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajAvnQAKCRB33NvayMhJ0ZPcD/
 wP8jXCxdB7NCspgrTbrfdenAyduKllEea9g6FrIFPD/P+ZfrM9SWU9m6nHt0AAZCqbSlB+wmnsnPv4
 U+afLy8Ys8P3uUBAaesBFg1rX8faEJ52k+eVP4r2iLgndlAhX44wRrhrybIulZvsb7Pe/7zxadg07h
 5C7uRAWccbruHifeBhgaYygHI+PC+qjTfx8dEfUOIzaN2/sDSxvP7kny15cdJuqhlYSXl34DziQhZW
 zlgVufjs4bmGPd3wil4/4+4ZgiBpSSNz/HjJInadezcwGoqJZAiCqgeDMGbVkg0KxpmebBR24kQ+aD
 5tleKizUBvP0yKChPc2dd8C8VC7p4syITgQCKzi8LmFUgtVyk7RVAxfcD4XJlypHCdGfx2kCblYPyo
 voK0FE39lTXHOz6ofGMdihNx9VLmLiaUWi41taQdesN8LjPnEWNPbBCK20H/HvBrKyra95e9fbgPLr
 ccEKDTSa7Ol94p8PU5t3exigPqY/nU8/mtEjKpSzBBuwhdR7xqvVnylo9vDJxWCmLpd6RMe6ZF6P3p
 G7laskIZbDoAYVjYvCbctGh1PfqBCHWU8V2nIIEd3v/0J+C61nE2f8YXlXYp6Fehf1iL7jx0HNUDam
 HhSf6m+gnAy/1I5X2qOX8UvZR9lPtaBdXUtdys5E+5Q5OtTftUlNC12mWJnQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113241-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 869E96889F6

Now the bindings and driver was merged for the SPMI PMIC5 Gen3 ADC
found on the PMK8550 which allow reading ADC data on the PMK8550
and other PMICs on the system.

First, add the PMIC5 Gen3 macros to calculate the channel numbers which
is a combination of SPMI bus number and a constant for the sensor
type and configuration.

The macros definitions were taken out of [1] where it was initially
in the dt-bindings include directory but since those are not hardware
bindings but logical numbers, they can be moved to local includes
instead to make the DT source more readable.

[1] https://lore.kernel.org/all/20250826083657.4005727-4-jishnu.prakash@oss.qualcomm.com/

Finally add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- Added note about nodes ordering in commit message
- Rebased on next
- Link to v2: https://patch.msgid.link/20260504-topic-sm8x50-adc5-gen3-v2-0-5cc04d6ecda0@linaro.org

Changes in v2:
- Removed stray line from patch 2, added review tag
- Added missing header file
- Link to v1: https://patch.msgid.link/20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org

---
Neil Armstrong (6):
      arm64: dts: qcom: add PMIC5 Gen3 macros for channel numbers
      arm64: dts: qcom: pmk8550: add VADC node
      arm64: dts: qcom: sm8550-qrd: add SPMI ADC channels and thermal nodes
      arm64: dts: qcom: sm8550-hdk: add SPMI ADC channels and thermal nodes
      arm64: dts: qcom: sm8650-qrd: add SPMI ADC channels and thermal nodes
      arm64: dts: qcom: sm8650-hdk: add SPMI ADC channels and thermal nodes

 arch/arm64/boot/dts/qcom/pmk8550.dtsi              |  30 +++
 arch/arm64/boot/dts/qcom/qcom,adc5-gen3-channels.h |  88 +++++++
 arch/arm64/boot/dts/qcom/qcom,pm8550-adc5-gen3.h   |  46 ++++
 arch/arm64/boot/dts/qcom/qcom,pm8550b-adc5-gen3.h  |  85 +++++++
 arch/arm64/boot/dts/qcom/qcom,pm8550vx-adc5-gen3.h |  22 ++
 arch/arm64/boot/dts/qcom/qcom,pmk8550-adc5-gen3.h  |  52 ++++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            | 279 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            | 279 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            | 279 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            | 279 +++++++++++++++++++++
 10 files changed, 1439 insertions(+)
---
base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac
change-id: 20260427-topic-sm8x50-adc5-gen3-edf94fbd335b

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


