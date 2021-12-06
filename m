Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D804F46A01A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Dec 2021 16:55:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343999AbhLFP5s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Dec 2021 10:57:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388094AbhLFPyv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Dec 2021 10:54:51 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F3CC07E5E5
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Dec 2021 07:40:08 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id n33-20020a05600c502100b0032fb900951eso10706353wmr.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Dec 2021 07:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tQXx7GnUnnrSCouIsJOJJqdsqKC/T8UFD1PrZ+Nst5U=;
        b=IuaMZSyQ+XFWmM3aQkBaM/vyuejE/mCo0s0ldZhwVJQfdZrFwnV/LW9wnvrMm1NWVM
         +gz5GFxnJUbj7kaKnnzdt9lARyJlkmSi7vpqH1lR5dGD8Z7FwIGJW4drbwMTN6XhoqFC
         74LTT6ajb8LK3pLQygvtY/J8YqDewfGhzCYQKHxq+8OFeU7JtpkFp+lSd8TnVVUXdxBo
         xP2dD/c35+5cKD4JtLh2/DD42FGrVN+6eAIkUExDTsO9JW5IE2A/k30op8e7tr5gD0Rv
         STfkdgDX7X3c64D7UMEYn9E3DfZTJ/ty2pj+EREM/AuQIgpkQwb1Tc3lZwQhM3/c5e9q
         D2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tQXx7GnUnnrSCouIsJOJJqdsqKC/T8UFD1PrZ+Nst5U=;
        b=YS8hPqeCp8b0XbwXo9cgb143P68gqvv7q0vWlGTVPF95O8i0/Uv7ViFce/aJ/HnRfz
         WMDOHTaUdr0PTFAkl3nAke9Wb9jKkkXWav+WUgNuY82z9hVAkIl8BdaYpzj02KVM4B1u
         JmHkhLxQKA2OUUpCf5cvvjpa6KSz0/YgAiPBxl31vGM4bbyvpbHeMX9nBjdJVp6TjXnM
         QLDuFoicBYFcKs6Mi23yHoJJi/uzLGL5Zcb2oo1nye0KD84i5PG2g3TJGoRtN51AP6ny
         3QDYsqqfnLpAUg4E5BIBzzWTWqjHTm8MQrqSU3x2BlhqGWcqeDpTg4ynl/kRhxR34mBn
         Ddeg==
X-Gm-Message-State: AOAM532MtWuOkiGx62PnZJe2/C7oI+/qt13HZgDctB5B4nxcTMLLC+41
        RWa8/MXTpGXpA3USUxbeTis+YA==
X-Google-Smtp-Source: ABdhPJxOHQO9mqqr0dXVOzuceTkm+GBE8UVOd04B0PnegF7w28h7QvZL6qZBwGY/2Tfr8iffu6aqiA==
X-Received: by 2002:a7b:ca54:: with SMTP id m20mr39723541wml.21.1638805206906;
        Mon, 06 Dec 2021 07:40:06 -0800 (PST)
Received: from xps7590.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id g13sm15818962wrd.57.2021.12.06.07.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 07:40:06 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Mauro Carvalho <mchehab@kernel.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v4 1/2] arm64: dts: qcom: apq8016-sbc: Remove clock-lanes property from &camss node
Date:   Mon,  6 Dec 2021 16:40:02 +0100
Message-Id: <20211206154003.39892-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206154003.39892-1-robert.foss@linaro.org>
References: <20211206154003.39892-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The clock-lanes property is no longer used as it is not programmable by
the CSIPHY hardware block of Qcom ISPs and should be removed.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index a5320d6d30e7..b7a578aafcbb 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -253,7 +253,6 @@ ports {
 		port@0 {
 			reg = <0>;
 			csiphy0_ep: endpoint {
-				clock-lanes = <1>;
 				data-lanes = <0 2>;
 				remote-endpoint = <&ov5640_ep>;
 				status = "okay";
@@ -289,7 +288,6 @@ camera_rear@3b {
 
 		port {
 			ov5640_ep: endpoint {
-				clock-lanes = <1>;
 				data-lanes = <0 2>;
 				remote-endpoint = <&csiphy0_ep>;
 			};
-- 
2.32.0

