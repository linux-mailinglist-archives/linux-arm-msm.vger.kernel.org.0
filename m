Return-Path: <linux-arm-msm+bounces-105769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKjLM4nJ+Gls0wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 18:30:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B2F4C159B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 18:30:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48F3B3012BD5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 16:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CDDD3E3C4A;
	Mon,  4 May 2026 16:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tVx5DkmF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27253E3146
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 16:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777912199; cv=none; b=XZZzLauNPaH7dPnwsKHEvtUGCu8iM546ORG9ME4SW+fOzV3K6EQBmIcLPcNQgR4sKvdQRCGL8GDtlpk2RJ2RriKcrwBvQUwMOh0N8BGhf6H4uZDsLWtx2BBozyK6nkq0oS6b7rsA4iXVdnTSM1Z+fl08p7ypoPvKqosz0NoxuQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777912199; c=relaxed/simple;
	bh=N/w1uFHYZt1PLkaWQZseHCertmTa8aPXuLRhAgnU2M4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uBF2qnhHD7X3lkhUA7ikMVry1hfGnnt3WyihE+ZHoreS36qcv52SoRl/zz1hs3m6sthBcwM+eiD3eDUSrgVlaEdIyZ3EwyTYy/jEdQ/axOY1I+fzQ/Aa2z3yalkjTby+vzvZ+P4/3xz7nFaXlQ2nxe2dagezUMK0XXKL7hEAIv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tVx5DkmF; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891f625344so45611495e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 09:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777912196; x=1778516996; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k5pF50GtcmXJGYs4kvpe2nAmtHNKe2SntljuXTtOF6A=;
        b=tVx5DkmFzJKHMc22eB41ap3FzmkBiD0TtQYHVfV3pMh2g2Y1UKt0CgaH94yWt+aT6A
         oIPHz5RF+PTrCWYFe6Kiwv5P63SfFXxWIY+pDTF5ZJIQC4BgSENMDZAYofccyGJf0Nfl
         Dfggnn1D9gF4FAmbT4dJ0D9IdLWLr4VOkXxA6aWIacLBXltS5Dr/7BJ6fWpsK3xqbAnD
         d1fsgOYuTgXcvdF1w9yca4zaVQ7uxxVVOG2aZku01UWG2zoDkBnmX8IX6JkvO1nSQQVp
         52O6IBncT/RbdWjknvnvjbubcEA+/5a82jCaN8Eu398yKVuAntTPI0x0jrzkWkUkSeZW
         XBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777912196; x=1778516996;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5pF50GtcmXJGYs4kvpe2nAmtHNKe2SntljuXTtOF6A=;
        b=ovPBlWI7kKp+BU9YnTbEqfo83GlQ01SJ6G02k/HGBxly+rSoyfwJRg++Uwh4VsJTwG
         u43pz7l5owpZ8RhoopLamIP+otfSEzra8yJvBdUda02kbfqLfmY0SJFQwKc4JjBv9RpB
         ZkSSppkjH/J9dtC9Mou9AF0MkIemvttmj4LdFqfYjNXxq1KIgLgVtl8EFFNHTlAthdmt
         bFCORgFggzd33fUbvYzolRwN9MtfuUgnMrNDuPvpZz6QDD3I+DtHmjcjq8SHf8X+Kaan
         HUMHFMwSdPkKEE3M7jAe88iaq4A5OtF7f43OXRAlUKRzZcbWm0VJzmPhUwyRwZUCW2Wf
         ZDCA==
X-Gm-Message-State: AOJu0Yz4lUApbJP3ikg47BdJuk6HdXpXpH1PmJ30dSNNbJmR2BZ9LhJl
	v+x1HYZvPcYraQ9QKmH9pDqWW+pi7S5//Wun0+Wcghmt90yJuNJEn7EQ/nK7dwo5LLY=
X-Gm-Gg: AeBDietxugk6nT1YPMeF+M15m+hIzJRH7NIIBKwOfN5Rl6lqDusEw8qCUrwMqg8lFgN
	znyriUgc8qnXQWl6B0H1O0hc6xXFIcNlhFgP8wEvPrXh8xMmnPN2ZJUWHRjgTTEngGyuFGFa0DZ
	PmxVXQhUQgCjlGPhsMUGHyJc/ChRbS6CKX+019c/D93AXUrZTA0ZUG2MKq7WW+wQjIzucFy9p5F
	sRS3Sr48G7NGMAntsouV5KNMX0Av5r1gz5mb48h/8FlqJXIPeIF+N6wgI7HC5wrLRfMaw5cQsUN
	aO9tFPdfHDM1MgMUElVqJS2IQlQQTuPbNNQov3Cb8yV2LO1P7VaOPFbUlpjstomxrGIMeNBkIy4
	W6xs1Sq3o+jIRmp80HZ+U4fG0AWhABCBBsu9VDqL9FgRxchajk8oSgZs0SNze+jReedBvKNFTPP
	NaETslKDx1wctXWHmxihV3C1BEUG/MhHxdJoCB+NUEo6Zihq0oWZEQNWY=
X-Received: by 2002:a05:600c:528f:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48d14243e52mr4131275e9.7.1777912196063;
        Mon, 04 May 2026 09:29:56 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301b7bsm405071055e9.11.2026.05.04.09.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 09:29:55 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH RFC v2 0/6] arm64: dts: qcom: sm8[56]50: add PMIC5 Gen3 ADC
 channels
Date: Mon, 04 May 2026 18:29:48 +0200
Message-Id: <20260504-topic-sm8x50-adc5-gen3-v2-0-5cc04d6ecda0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHzJ+GkC/4WNTQ6CMBSEr0Le2ppaqAVXJiYewK1h0Z9XqNGWt
 EgwhLsLeACXM/nmmwkSRocJTtkEEQeXXPBLYLsMdCt9g8SZJQOj7EgLJkgfOqdJepUjp0QazUm
 DPidobFVYZfKcK1jGXUTrxk18h9v1AvWvTG/1QN2vyhVrXepD/Gz3w2GD/z0NB0JJKQW1QlVUC
 n5+Oi9j2IfYQD3P8xe6/gHR1AAAAA==
X-Change-ID: 20260427-topic-sm8x50-adc5-gen3-edf94fbd335b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2432;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=N/w1uFHYZt1PLkaWQZseHCertmTa8aPXuLRhAgnU2M4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp+Ml/cvc12e3FmhugnVJJohzy/hmwUGIapXCMXNMT
 UoJE4B+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCafjJfwAKCRB33NvayMhJ0X4lD/
 9BcK2Aicq6aiYN9fbVcG+64PtFkYfUzduvnyhVHvESo7K/oHXL77CS1eWUlQKEVJ6aw0aZIo2/U7xk
 9zdfDYVuvc2Ir1C/cxuqJ7luakaBSsTWzn/mP5NJNUYngaddp7IW6SlUbriLt5QHDrfnt4MAT/kMdq
 khMSHj6PMf6IyQRHXOojW5TZ0wLSJx3MPTvXPF/+M9O+GqHtqsO7a1A3E6WXrHeEwQoduTQVh+qHlx
 bynddkg2jYeNT8RzqmXWRV3+A8EwcZJPkMRMM0SuNNhAypdU7Z+wmA75rrMuL+5Ti0INGkJtIIsOVN
 QcZK8T8FWeBU4h21SVKb67iNjtxy2BSAD+KCF+I/qJMWLJVjvpyLVx6DqrGT9uqIF0XsUrtu5PHV8q
 aEtQyDtTxdFlO8lYcjdBY2dNtkSB2qtWgogIv7LNFdpyTWKhs4c5iwjRB4Ag/h0Wfi80Wxu0vZQcL+
 iknyhhrAROrqHi2SmU8n2G6ikTGqw1qNtt20utovKOaHrddXn87hUlkpYhqCSOKSL9mLxhbr3qohhF
 O3n8Ouk1loKLIZXIhTHAXzNOl9IeDwV01+GQwi++NouJZweVAvjaaa/geNPgTjuvGp7JM9HIcuyDRX
 6YrzYnzS3vKvNSEJpBHiMa/0UtqT5+H0WxlA3gzw0f4mKoeYLLDB+jR9rUvQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: 51B2F4C159B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105769-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid,msgid.link:url]

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
base-commit: b9303e6bff706758c167af686b5315ad00233bf8
change-id: 20260427-topic-sm8x50-adc5-gen3-edf94fbd335b

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


