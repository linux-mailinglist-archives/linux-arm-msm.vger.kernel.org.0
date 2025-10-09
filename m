Return-Path: <linux-arm-msm+bounces-76519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBD6BC72F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 04:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E981B19E2D2C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 02:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE661A23A4;
	Thu,  9 Oct 2025 02:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vFGy9XGR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D268615A
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 02:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759976116; cv=none; b=AWFvEx+JjJ2TZyTLfAO/N+DQVXHr+eEhR9j31LYfol1bRbIY1kPDahpXzMJIuADacpnxT+829KVQweI7sgvXZTwpNnNS8B1MwMKqUPh2+7ijXZCSA1NYyrThdSDd5lQNEPYM4kcO++6U+omGXi8OvCZTefWTYCdvHcuPXUT5jYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759976116; c=relaxed/simple;
	bh=ekgEJmb54FZNZrD9BT//BnKOt7CsT/rwgOhCwKQUjdE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gv0VDez2HtFTxkxQc0r+5VV4pFU16NqUkIG+onQzaIHVJPEqWgwa2hPRXoFQztXJKVwXtIWqj6+AGp0VkTOuyrAScHKIeYFsHXb4E6hShAJ8Bm2xzc+hhZL4TCfUrMcrtmJt0TRgC0htE/YcKCAyVTzmTdL7L5gw/4KiRbUTIvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vFGy9XGR; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-280fc0e9f50so772985ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 19:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759976114; x=1760580914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kd9gVakjyd2VNEiqLrfFbQtpaxcXRer5ni3ThNciULk=;
        b=vFGy9XGRnaqZXCuoIeW0NsOClsUtbCiQLazqI+TLwuljrb3C1n4W5ZfimzpZ4tM9Oa
         rEQbcx+C6m7xCLxvk7rVFEtMx8OgPzthU1z+hnqSsuEovQ82fltlsqt01JkG3gGt8l7P
         EK1lv43rVH63nIHZBr8Z8g6a40+nVJqMkQITXub15ydOM7LjU8XHEpdIhHH2c0UB9c6H
         CyctQdbSXYKKXdzYhBKdZYflArzJ9n50ursV5SFE8NwQpM3v3f+/3z8WwNR71OkkCAOq
         Uf4Dlopm36o3XxwbQVR4ol4HqtH7gArsmCz8wu2gxoRxIlJKOZJ8S2waTe1n5dr1n84k
         N0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759976114; x=1760580914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kd9gVakjyd2VNEiqLrfFbQtpaxcXRer5ni3ThNciULk=;
        b=xHQP+s6p8iMXWFqJ/ak95SKsLStJAnYg4wpiE2UW+xxduIeSrHT2aqHcobN9gUVYr6
         zLkzQ++h0ZYdn9xvH8g9yG9pJSWNGQ8IOwXt8JfbAW5chE8A45LWltWPbNzcGhBqgZNQ
         Yq4GLP6aBRVTsxtrFnVymm6axm+qYGyTkNkGzhXQZIzShvt7LskSMCY2DkYJI/gunr0Z
         LyM8PBP167we0DvME2/LPupYRb/sshzBbdmUtLL62PlLV1A9oZ2sGsWBGLC8/7tmGSEH
         2KQFQLwkiisDx7AmJV6B/Aa/Hk0M4Mz72h/SnZFd7PSe6js8XlrBXPzpbbWt3PRmJd0v
         TG7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUb8i8XUXeZRiUhErPAooVf30quZU1XHO8WrlmrtKbu/H7bf6tbIeh3wSRrJvU0mbNLcJzsUNG+sNq8+YEU@vger.kernel.org
X-Gm-Message-State: AOJu0YyyUWA38Fj5mpZpiK6jOrMXqF9mrmYPN+UihhW5325LveVohlKM
	yVz85vRy0EuTaKeWmPP3CjT/OUedxMbbIBiiQ+jn60JZUtCCcIfFVvy4VOSSsiNtTAc=
X-Gm-Gg: ASbGncuzi6Gc9z3VtWx9Z/mga16NroYRTTJZlyxtQaFWgc3I+X0Wr7j3QlyFkaGhJzx
	59tXdJl917W1aL58cdjSbhQJw200ImM9Zs3r9jpns03PEjNteCcK5/tTvaWlpW5ZRj9J5qNoMo3
	rEzD7yTkKBJpyPoObO56KQd3RhUxgFWNkGJZo4Ni2+UCE5VN+m0xkJv9CN9sOsoZLYq8/8RGkDI
	rIYyxbuN+/o4Va0/fVGpx8Q0UFzMKw6vPFTFhXuveecQwTlJSGLOTTjLyepZyfw+RRFv9PKiUdk
	WW/cyRKZYgyEOil0+kSz7zwS6Mluc6bSYtO1hXZOHAkZ3f2juy6ZUuFNinBEVTQ6FW9FOYKn345
	YclWtiQY+si1Is2Yl+ksG8FX2W5vCf4JkhQbrAC7hk7XWFNJTK3SAggIRFzgzUHclBpnLl6w=
X-Google-Smtp-Source: AGHT+IGPWFA3IoAZeXqDh1/NlFw1Xmfh1DSVTiiVoh12bpNLo1QaMR7jLGjSGUz6+FGOK1+mP9Qflg==
X-Received: by 2002:a17:902:c40b:b0:267:b312:9cd8 with SMTP id d9443c01a7336-290273038efmr35922935ad.8.1759976114144;
        Wed, 08 Oct 2025 19:15:14 -0700 (PDT)
Received: from kuoka.. ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e1cb83sm11285855ad.44.2025.10.08.19.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 19:15:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: defconfig: Enable two Novatek display panels for MTP8750 and Tianma
Date: Thu,  9 Oct 2025 11:15:08 +0900
Message-ID: <20251009021507.175290-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable drivers for Novatek NT36672A panel (used on Xiaomi Pocophone F1
Tianma, Qualcomm SDM845 SoC) and Novatek NT37801 panel (used on Qualcomm
MTP8750 development board).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Patch for qcom soc
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 24b1c943a7e1..adfc21d1ddff 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -937,7 +937,9 @@ CONFIG_DRM_PANEL_HIMAX_HX8279=m
 CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
 CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
+CONFIG_DRM_PANEL_NOVATEK_NT36672A=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
+CONFIG_DRM_PANEL_NOVATEK_NT37801=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
-- 
2.48.1


