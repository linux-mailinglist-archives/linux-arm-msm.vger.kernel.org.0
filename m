Return-Path: <linux-arm-msm+bounces-26159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B79E79313E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 14:16:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75BEE282A79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 12:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD28718D4A8;
	Mon, 15 Jul 2024 12:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wfoDu2s4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2301862AC
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 12:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721045771; cv=none; b=UsqE1NIDS9Sx1GMoKBbf/bJasqnK2ljIokTul3F03SK6fivX+VwthP16P8fD2C1FygDnUrjsWYaJwx503zqgyVYU3HaAXuJRyxDSsxbqdlDMLdn0iT1Q/3BctyPgjniN2z1N+zSLlRgM7T7Vb30AWklzDpZ5sSwSVXg8PgVHHx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721045771; c=relaxed/simple;
	bh=ensaB3Sd9xExyqosO4x4Zulfh8zxqrHJ2g7V01Sv1AA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zsmm2I7fbW21y001GUo8GMpWjbk4GrBWKxDSGsOQPOiYVzH0pmhxixk62jYYm0PxCT50SpiaSKPZkjX/P1vn/FawAUE+4wFvpPS57Cht9aWaD441T7xJRweRUCIU4IcPN6CJkv9mkoI+5EQaOHYF/11VdRJqJT9P43hjEYKvj3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wfoDu2s4; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-367b6e5ffbfso2354106f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 05:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721045768; x=1721650568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kTq2r+cTBBf6PJ97371cfxGvOYB5A8cmvVmwB9VmmPg=;
        b=wfoDu2s4Hi+kMtiB4X5oD6fBKi62FoHAU6/B/6ZSXxoXvgtA2IQstHH0VYFU26VMh5
         /T6RdWHd4Il0t3FTX4ItgatvMogsni+hF0+QGaDUWuCUkNgSFSQvBH3msxJEFrK/GlyN
         MiReNX6uSFsE4erBLEajrdZLW+XhqLfggLwOg1H/2BmZzd9QUexzpEr2BKXIn2VZqIWd
         pNSgI6lpP5rItElsrttHCzFEiyWFAiJYLcOkEnLBSPm8B5PAl8banRh4NVjB9+o6hUWe
         us3pUAKRUXoo2BVPySQtwIhV3+ea295DLFp81C82SHvfjBYCFgon9cqdgy+HdIHygkLN
         ufmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721045768; x=1721650568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTq2r+cTBBf6PJ97371cfxGvOYB5A8cmvVmwB9VmmPg=;
        b=Sm4R28OF3oi/5VbuDwVx8++yJ2KCQ2CaedbyWTxVDi/Nb2klq6YYIJBtIgFik511ma
         UN+hpW5zoEug0LuaoZCG9I5TIs/YBnR9ubZzd+IprVE/8vaDUTWh0Oh46bvRE+CjFwCT
         0VSb7YyOC1P4v+HmAoJD4CJaC5Sq/25ZzZ1a2NEdQ1vCF7aN/j4oO7qWWS8m1/hNMo1C
         Tb/Sbun5qgRECFKKglfMIOHOqe7n4G8vEOFDaZwCBOcQ0dMhXZWPka6d0pz7YjoX8ruX
         q7B358A/heDQoTM0tymzlQOTCn+qoHuzC5iP0/PeVDJPNl4ZHPnwceTfu59fiY/xa5/+
         qIaA==
X-Forwarded-Encrypted: i=1; AJvYcCWsGRGjk5Ii/gWeePPagXVdbf21oBtBSaScu3cMPCPSnG0WSe+7nRsmey7zvSxsSL0kIV1zg6Wvw4h/DXdL5emoGC+Ygc/xOqBpacGiQw==
X-Gm-Message-State: AOJu0YzJa51R4KYvBqgwKaOEB7Z0NAJVcOH6P2766N2RKOSSQ2BaoOYU
	4rT75XBOc8/qQpcx/1bpl7ZTp/X0hOpCMr7U9ZmpgzTfWdr7sElaGN8k8jWFihk=
X-Google-Smtp-Source: AGHT+IFs1erFYCijcBGp0SVQyMBvfH9pHBYbLhKOfck+AMcQPdS3cmXHK20l4yRwr/hKh+tKqHhBsQ==
X-Received: by 2002:a5d:480c:0:b0:364:6c08:b9b2 with SMTP id ffacd0b85a97d-367cead1d1amr10964785f8f.45.1721045767976;
        Mon, 15 Jul 2024 05:16:07 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff1f:b240:886b:1a3a:7569:3d95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680d9771aasm6369201f8f.0.2024.07.15.05.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 05:16:07 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 15 Jul 2024 14:15:40 +0200
Subject: [PATCH v2 4/4] arm64: defconfig: Add
 CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240715-x1e80100-crd-backlight-v2-4-31b7f2f658a3@linaro.org>
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
In-Reply-To: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.13.0

This is needed for the display panel to work on the Qualcomm
sc7180-trogdor-homestar and x1e80100-crd.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7d32fca64996..362df9390263 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -887,6 +887,7 @@ CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
+CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m

-- 
2.44.1


