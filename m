Return-Path: <linux-arm-msm+bounces-70176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C1AB2FB35
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 15:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4176AAA292B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 13:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D82345752;
	Thu, 21 Aug 2025 13:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n/QJQjcF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04C83451B9
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 13:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783457; cv=none; b=p4lzPPS/V1FpQ9XHo8KvKYdKqwLLEiDXSXn2DWNCS/brAc7Oheb9qSQUekDtK/1f97/AhhBI5yGBPEMj34oia4mGhrTuEp/hzS8KtzaAGiUA0E0eLVHvt6kI1CZO6EsceS9Gvcv3Kk3wx/0vTAg8XVRxJWIAbHzSH5gD4Mp6hvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783457; c=relaxed/simple;
	bh=vz0Pb/W66QBQ9wQPylYtekNJpoGxq9q5ENvtBgP8PRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bDWwp/iT2yuPxi1fXATgzKqUaGEi8p/4nyW0HZC0IEqFH7hJp5Z0mHkwA8hbv2+jno3WOab3BZBMyPSg2pDYFXSqJIqgJc7DzI9C6deLiuPd0zoq50TYico128kZQJXqpLuy5JF1ehA8FfO33JBRDuT+OcdnNjtNSaHTJym2FIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n/QJQjcF; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b9d41baedeso578386f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 06:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755783454; x=1756388254; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsA/CLw9FJUPvXsg3qlFrQnURFnDrWqBqbRAFJut4KQ=;
        b=n/QJQjcFQDUbw/3b0Dc2K6z9icT/9LczPu2ajmLdfppjdKk4F/VQ1qUFIA2l1kAiq4
         C8QXP7vbB54T+5cc3fopuHmEkuP+sf7Exgr8c0Uxnl1136/IK7PuyzimsJhGTcytmtct
         T7B9NXqkWt8ZK9gHqHnp8vlM1RUV1C0D9XOUq/mYz3GzZ7n+IgjxPQSdw6MfzD7nR2qi
         g92ewDhRHEiE2zHxTFI+wAYDa9zUFOL92hyrVIUiyfeHnN0a3lJdQnWzY/uGIHboex9U
         SnJ9P5sNEabLFb1IaebXZSQGmiY6lLo5Vmeup6Ar3IcNQv2GM8SMTGkwU5MK60Jx6aaX
         ZUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755783454; x=1756388254;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MsA/CLw9FJUPvXsg3qlFrQnURFnDrWqBqbRAFJut4KQ=;
        b=SopHRgJ+PZ+ByMmg60oXXfs5QBVR3QbxDF+1tNniFxKP1sxmi9j3pknQ8OyaGh4zON
         nuDffaxK6a4KRy34HUO12sHg+ioi48HUAi6r1pb2faRv99s4H4YWEht60JvyJ/iJk0z+
         fER10slEJGSyB5DuFY91sCJtcrpcSGHthfpz+BzrssMmzsRZ64yl6xRKEYcVyLZD+GhO
         G4JoHKpcnLfOUIGQd+xcA1ZuMqTuzTurX61RVb+7XL+CoHzRbzYYTsqJLfHyRAFORgT0
         0cqX1PeJUhnm3m+fcWCgxErELpeLy+J3dIY6qSRRIz/rAzbKrW/v7IKhNpiimMOmGvMZ
         tmnw==
X-Gm-Message-State: AOJu0YzWAZvaFCoVsrIrWkv5SFZjwTeWiS97ptlvGe/l726fTVQ0sFoH
	La3J0VZR7IqzW+E547oKQ1QibaN9L1Xndqz9RuCz7ok0zg5aofGtzFvEYwjgrv0NkWQ=
X-Gm-Gg: ASbGnctHDz95B10+ctVxTI2UlAheEpWvboKMaPXJhliYkvp8OWfyEkuDvdrWWfOmcZK
	XUEOXUPT4RT9NYC5x/Gh4IURPaCrxjUATGu7NquD2ygYNNfpedoajQmeKcjRdDx0muNxZs9ZcKi
	n22zp3qWDaUAcrxaX3UiohO2H1XkKEtAbQXtiBz8FXacxHMfGndL4kgBnj9SeEFX+JAB9gT8ulA
	iqcRKCR9AzwiaZ+dWO4b1IUHyG9M5uJZdssCXJhfHNR+V8cKCyddzrrELoLAb5h+EC5Yzlm/PEu
	8vwUwELjC4bUS6NWwl0argTRwrEqEBXqAwUc0RJinlMVh0zsEPkQrQqaI3FXGtadk43CW68sMUR
	0eNTmko2vIBAcTUxJ96AMZvKPJ63C8R0u/lSMdD7Qfr0=
X-Google-Smtp-Source: AGHT+IEhlFKGForf0SrLlCdnlcX3WTaAYhCdOrA5LK24tMlNz7SHKyWWm9vjHlQmkgdjWssf+9JAIw==
X-Received: by 2002:a05:6000:22ca:b0:3b9:5001:b300 with SMTP id ffacd0b85a97d-3c4965fb2demr2105985f8f.46.1755783454242;
        Thu, 21 Aug 2025 06:37:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4db2ab4asm28937605e9.8.2025.08.21.06.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 06:37:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 21 Aug 2025 15:37:21 +0200
Subject: [PATCH 02/14] arm64: dts: qcom: sm8650: allow mode-switch events
 to reach the QMP Combo PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-topic-x1e80100-4lanes-v1-2-0b1a0d093cd5@linaro.org>
References: <20250821-topic-x1e80100-4lanes-v1-0-0b1a0d093cd5@linaro.org>
In-Reply-To: <20250821-topic-x1e80100-4lanes-v1-0-0b1a0d093cd5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=724;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=vz0Pb/W66QBQ9wQPylYtekNJpoGxq9q5ENvtBgP8PRw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBopyEWRqX02nE51o8sgcpgSNOtSdNGUHolV4YK5ygG
 L+rPooWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKchFgAKCRB33NvayMhJ0T9rD/
 kBAj69mBHXpiaSbRRUv45FMvqbgcksz127B7RrL6UeUU5aI0POVcV6pdDpanaGUXFIHjbATZGC14oa
 FcCACNy1uRQrXl0k0TPH4OJYO2uUV/weXNariUKM5b9nUubc6XnvSpFyTKJqQOYx36XoMspcb0/DGK
 UZkoHcglvP853Lxd24tO4ypI7WYxBhMxNdmFnO4+GNYVKUGs/RHkX1KNMOaaEbFcOX7pLHWtchzjwl
 32FlzrTrIaY40bV3jlGogOXaOefNap9YnuBfMxKOelPwbuRxbSNQPgXH8tt/5dEbA4BPR/ndfFbUCP
 e9249jVLKCuIk3Ia73XQihGsdVyHl3p3L9ku24tN+zocbEwq5h5ii7zwxESb13OvwOjYUhXYuPR1Oz
 3TFtdsvIlH9pGxcjiNo9GzTH60eFhzm2ZUPi5Bl9rC09zmgNZcWAzBzV32g6NHpAxz/DTKdsHKsmmE
 KLEgn/+JqWDs2V1Lmmh3H5mi5s0KMZl6SzuLsfjHmWd+z9MQ9FJ34LgQ29eJPyWxwu/CFYgazQmm0I
 2rc5gPHlYjQn8yzeyqQJk7SdXrH9QoAkLlOIRcgcrinE65oGGIrxRd03wS2r8sIh4ebfRnbE8EwYGS
 33CEgYB93rJTlKnF/lKp/7e3R5BKG0EXvcbzBb5ekRNkS0EbZycJGV38king==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Allow mode-switch events to reach the QMP Combo PHY to support
setting the QMP Combo PHY in DP 4Lanes Altmode.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index d6794901f06b50e8629afd081cb7d229ea342f84..1a750ae39232419d3b496f5a009f16ac8de40fa0 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5012,6 +5012,7 @@ usb_dp_qmpphy: phy@88e8000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			mode-switch;
 			orientation-switch;
 
 			status = "disabled";

-- 
2.34.1


