Return-Path: <linux-arm-msm+bounces-8741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB09083FB32
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 01:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 908C62828D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 00:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9648BF0;
	Mon, 29 Jan 2024 00:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ExQeCuOC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403914C91
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 00:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706487967; cv=none; b=oRZM8q2OkycRXp2BSDKD446KkBsBXQnSfziXdLR7OyC9UpjsX/+giVEXMqOtFN851vrt3jV+OXRU/FW/JhGIuVALeZ6Sp444JDHpO7+ACHHaijqL4YiLsZMc3V1kHl3psPbx6hP0/DAMHz40wZVg9IKgfvk63YHSjjEHXdVk07k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706487967; c=relaxed/simple;
	bh=UEn883fEvn74EKDrMBY5HRtTZ852wPrXNTB+0TMl9N8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jlkcuNYYWFA4zf1CQmbyfXMA4APbzIJmEce7JUzHxSh3jJTiwg+7j+3qExXe9VrrViUOXyGMSaOn9aeLrK8YXGeLX9tkr6NxykR4QebUU4R5pE9R7+A0ZWpHGp0+4g9Z7DaV/HuSSlkSsgUEG9jYnCFD/hn6Yil5UL70N393RWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ExQeCuOC; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50eabbc3dccso2502053e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jan 2024 16:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706487963; x=1707092763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXniBx4zGce2I+zUvQZeh9F9TJPf5+YSFwkB/zgLcpo=;
        b=ExQeCuOCw6xyz+5vYoeQRgkdchzMRH9g9Wlbpz6uoE+7MZJ09Frw1L+o8YBTfeHAXk
         phJ3QjpZqParHnSvneML524zbtxZbbx3UaNAK+7q6lnmHxtdKZepQzCEqFYOyFIkThQa
         LxlnAvCa5K4FnX6MSpCa1f+IfJnBin+iQx7BNmU48yBNjZuupWqsIjqMN0wO2mjPWMOV
         OB6jZ6tHRdcvzQPzoo6odm0TwM6Lg4QqK7uw6Sg9ao+8Rlm7K1mu0T0wgyPuPf0Ic8oK
         FNYMOSoFdwSm2Iy+lmzoeDoILVgBD6BxTu28OmMPAUOa1S/tpWHoRI/3Q5hXs59JAna2
         QTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706487963; x=1707092763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YXniBx4zGce2I+zUvQZeh9F9TJPf5+YSFwkB/zgLcpo=;
        b=lSsiHtYC/0Lu/omXG29VUjtOhWAdibEFFC1jW1C2CXmShRxVCtn/oSlxZzAL2T/h93
         NXHxQsF2qfrh8QA4tq4w9Nn4rKUVZSaqhIzfuyxyC037jTIvKiK7v8xQDEZJs4cEbRzR
         57/sxjKFfI6cPiekoCRmXD1KThOhJVVlAiFiBovFkDrQv0yOk+fIhJoOyMELN3WfNkgN
         /7EA+4E0783OLbPRSPrNUTBL62fS4V3We+oVf3jNyAB8C3e2LTlTKkl6wviFH96vtZrN
         KCAzLWlR5Z76BSdDacVClgN5SHKRQwoK0x+nXWn0poUYTtDIfXIEveYxVU6HjGKRpb6r
         r2NA==
X-Gm-Message-State: AOJu0YxlVZjlo3qpRsF/nt73LJ2JTc73tncNcTGJjBGBFYtOOCX59M9g
	+Wl+zfYGx21xG5mECgvMMXOb31pT4B0V8vILA02Fbo+s5QIqh1PsKtT5BajZYD4=
X-Google-Smtp-Source: AGHT+IFKiUBYLnInTq+oVg5fiUp9BFxIiVDPCRTaXeICaTOOX1dhQt8t5Z5qyar+jPWySD6PjNyDMA==
X-Received: by 2002:a2e:bcc4:0:b0:2d0:4158:bb4a with SMTP id z4-20020a2ebcc4000000b002d04158bb4amr2188639ljp.15.1706487962427;
        Sun, 28 Jan 2024 16:26:02 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id h29-20020a0564020e9d00b0055cfb3f948fsm3208193eda.76.2024.01.28.16.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jan 2024 16:26:02 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 29 Jan 2024 02:25:45 +0200
Subject: [PATCH v3 1/2] phy: Add Embedded DisplayPort and DisplayPort
 submodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240129-x1e80100-phy-edp-compatible-refactor-v3-1-e71f3359c535@linaro.org>
References: <20240129-x1e80100-phy-edp-compatible-refactor-v3-0-e71f3359c535@linaro.org>
In-Reply-To: <20240129-x1e80100-phy-edp-compatible-refactor-v3-0-e71f3359c535@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=715; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=UEn883fEvn74EKDrMBY5HRtTZ852wPrXNTB+0TMl9N8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBltvCVBACVcZrnMVBS+u5qZXFWmx75hCoRDiMe8
 4tB4whZiQuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbbwlQAKCRAbX0TJAJUV
 ViXqD/0Zq/xflYC4cjb8dLUvaPg2eVQbiY0yhO7NNn7RgChfT9xZdxuvknkqI6BbJWdB/xC6Sax
 W3zekXpByUJI7mY6rAk4+7WdxUDCILW1mt7GsTMA5691iRkoTIX2bhiIqdiQN1KjQN0dDzjHgpY
 bk2CplmmI+l9ONHNwhI6rqvavP4XCEouREjX4+Ej13lSJXz0nCPHBqyaWMMRsaNoJdtZo7W791Q
 cK7nC6rzBg+KGhbWf7CN9zJMLgBcMGGNpYkEyP6KtLbQODvDOyGnIoYpVeBZXgPg6pkmslQnuS+
 fdsFRpBFdNVoTIrimhYrvF1qGsgcq7zwgCkFSS1krrDQJv/dzwbZWkPbfsR7M4mKoBXAOcJb1TZ
 umyY9I4SPiMelFFYBKBPHdadIy4Dg6Kftg7YAgMHBjmOLjdIDtLkTj2T4gJO0yFjvd5RT1WMOrh
 kMHadP/o10ZuBjWtygPs/ytEUW3XpNCVaYapGN+uiEvAwrPE+45ZH3WqUTvp6YRaB8wbF28b8y+
 /41vVQJaZrIVrc+AHSl+Ds8buUYzZ7POYJy7Lg2+uBXMJTRF2hBFxY81o+z0/6Yfep7L/vW/d0a
 HL+AEtzeaS6rJD4G90rgeqlA5tarcHWF1A+AflurwCnWmeMjKAUoUW5QWu8yQSAZ1BNkdbtDgRl
 EaQned+k0SYex4g==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

In some cases, a DP PHY needs to be configured to work in eDP mode.
So add submodes for both DP and eDP so they can be used by the
controllers for specifying the mode the PHY should be configured in.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 include/linux/phy/phy-dp.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/phy/phy-dp.h b/include/linux/phy/phy-dp.h
index 18cad23642cd..9cce5766bc0b 100644
--- a/include/linux/phy/phy-dp.h
+++ b/include/linux/phy/phy-dp.h
@@ -8,6 +8,9 @@
 
 #include <linux/types.h>
 
+#define PHY_SUBMODE_DP	0
+#define PHY_SUBMODE_EDP	1
+
 /**
  * struct phy_configure_opts_dp - DisplayPort PHY configuration set
  *

-- 
2.34.1


