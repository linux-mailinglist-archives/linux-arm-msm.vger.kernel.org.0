Return-Path: <linux-arm-msm+bounces-23957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8019A914EC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 15:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B0942838B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 13:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922C513E02F;
	Mon, 24 Jun 2024 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u7rTFSjB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABCC13DB88
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 13:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719235963; cv=none; b=mTa72GjPxAtP/kfhxgh08myAmGzP5+TPZdaMOmPwMEBH1ErIMifBt1Pg2bnroepm5kGhOujHJx3u1mSIjKdpYMjrw4h2yxM7vkms6o4efzUXpeSTGcoUXPtrB157l3yN1DuXwZuz4JnDLNRqdPpCEs9ykmxp0hUiiXFkHH6CpM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719235963; c=relaxed/simple;
	bh=7KHXkSiw3G2cL0hHR90JF2g8MSUEbE7fJYE8XhmJ2hA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Lc66m35HRN5bKfUIERlu6FMA9i/gjv5tFcss/Qw8DmHJj717w6zue4KCUvH0UyDVKyJeYiiiSUeO9CKtdR4v6Yx2InUHNztxUOO+9xFW+OsXF4y9fVrvHLIgqpMVKYva1TpEm6Lc2X5RSetPGRwjlopI1OJW+5DBKkbZvBXc33Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u7rTFSjB; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-362f62ae4c5so2506276f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 06:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719235960; x=1719840760; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i63v09sV0tTGN/3CN/lUxe+ocEmeawwsZ2O+wqtiMdY=;
        b=u7rTFSjBRQOdJb/2ttfvtvUdTHxLJGwkxGdBRv2zt2ddEvaV9yV8CuZU5k8W2n+1Xw
         L21P8bETdjwNZwuZc9Q/1E7rVLHzIYBNIgdhAsj4A1ftaq0ScLWqiiCpvGRykBc25u9o
         FNx+OJTY4HQVjfgTob18S07F/WaKvseY3ap+tdZSSLpak2yKRpWTDRmJU3NIDw+ZLaqx
         txTQS9Kar8whOVUTq1hOKt3mJmLgQwU0A9S4BIRMpIKQVoeFUj/T2LzlxA+EkzJ20Dmf
         YiwVKovoXwx5nwcTg/MSmIbDWGK4WxeFQc9dzXHq8afb5NmOkKU1+kaf+QbRARbYetNQ
         cdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719235960; x=1719840760;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i63v09sV0tTGN/3CN/lUxe+ocEmeawwsZ2O+wqtiMdY=;
        b=jmxu0Us3OZKSWA0pVhqxbk6azs2Es6Yp2MtnGvd2ZVAFItZx4rGXEqpu3KknECR1/X
         bfaGyMZaYkMBrts7sKVlpsRdIiGyXUVAMEF8Q6UilHGklwlL3QZ5MaTqAHS7iyM8LD7n
         hrnqnoeL8WgJSKiYSXAG71zt1juvUJ0tOdds6K+q2GYewfZsuijt2/5GNR6Ia7o9GSia
         j5QVO6Ynasqi7GIhJeTj4C3HgSAzOytDNGuaQ5SX+0O1qc0SGnZxFW1h4Fx1HbOHIb+2
         GdKE0n+KSlp1GzdAPRGs5gF0TEqBAArooZ0YYcjkoNHgRLoITilZueL3OcCPrEdZ633a
         04EA==
X-Gm-Message-State: AOJu0Yy40PlBg7FADPxUZ/IF4hTe1bbdzw2uwSDQfi8Rw+AHZV/DBOmZ
	Ez1JfkebI2FU01p3/eF20Pm1KyQfkofeXYrWt/eVeocDHrtbnr/qT3BYP1c4GqU=
X-Google-Smtp-Source: AGHT+IE4SN9gQRJbIu0u6FodUMhsPJCIqcZC7gf1k65l9XMDPiGEOXnzYwwzkZQjwtfhzTam4uGILA==
X-Received: by 2002:adf:f990:0:b0:361:e909:60c3 with SMTP id ffacd0b85a97d-366e3267fb9mr4464756f8f.9.1719235960019;
        Mon, 24 Jun 2024 06:32:40 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366f7406f4dsm1888274f8f.114.2024.06.24.06.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 06:32:39 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 0/3] arm64: dts: qcom: x1e80100: Add soundwire
 controller resets
Date: Mon, 24 Jun 2024 14:32:35 +0100
Message-Id: <20240624-x1e-swr-reset-v2-0-8bc677fcfa64@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHN1eWYC/3WNQQ6CMBBFr0K6dkxbCIgr72FYtHQKk2irU4IYw
 t0t7F2+//PyVpGQCZO4FqtgnClRDBn0qRD9aMKAQC6z0FJXstYVLAohfRgYE04gVVt76xt78a3
 IjjUJwbIJ/bhb7z4+wUeGgMu0/y9GT8vRu3eZR0pT5O+Rn9W+/ivNCiQ4U+rayaYsXXV7UDAcz
 5EH0W3b9gPScq9jywAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=966;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=7KHXkSiw3G2cL0hHR90JF2g8MSUEbE7fJYE8XhmJ2hA=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmeXV2FihPkTNyQFaxVnVV8Ez3xGG+fon5oAYL+
 0Nf+l5Y0ZWJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZnl1dgAKCRB6of1ZxzRV
 N80VCACmXKLC+CFKab5XrBN3rQA9JR1VEZIkPu2OWm9+AXi30FzKhuuSjsxgkXj3tbWhJzvAIgt
 y6ldwqxwuy5YPlnNKdALkICl9wshQz23JtQqaGSTikgrxRjSAwrzYXSWWGA1v+4+MmtibDgOPfj
 CDUSDoL6+3n3JiS7X37tch7wN26SdZSbhhgXH1A2jgQKBwZihRN9PHsaYJ17XbI/64KWKpDMSTU
 wtCLmGSGbItEe4ZVUwg/yqlnkLcq9XZ8i89we3DhRnjP7f/l8Sfc0dLZMxS1/jNpCRxPodsHAHJ
 gRADD17sgjKyFDVCDC8MyJaaNLMDevQ/Hya95I7evNf2CLi1
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

Soundwire resets are missing in the existing dts, add resets for all the 4
instances of Soundwire controllers (WSA, WSA2, RX, TX).

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes in v2:
- fixed dt bindings.
- Link to v1: https://lore.kernel.org/r/20240624-x1e-swr-reset-v1-0-da326d0733d4@linaro.org

---
Srinivas Kandagatla (3):
      dt-bindings: clock: Add x1e80100 LPASS AUDIOCC reset controller
      dt-bindings: clock: Add x1e80100 LPASSCC reset controller
      arm64: dts: qcom: x1e80100: add soundwire controller resets

 .../bindings/clock/qcom,sc8280xp-lpasscc.yaml      | 13 +++++++++---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 23 ++++++++++++++++++++++
 2 files changed, 33 insertions(+), 3 deletions(-)
---
base-commit: 781025f172e19ca5682d7bfc5243e7aa74c4977f
change-id: 20240624-x1e-swr-reset-0196fbf7b8f9

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


