Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A01531A22A6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 15:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729099AbgDHNK5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 09:10:57 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40800 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729089AbgDHNK5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 09:10:57 -0400
Received: by mail-wm1-f68.google.com with SMTP id a81so5368228wmf.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2020 06:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HSMVnMgP4upKQElf5JgAZWIAcGCpvndMYRb9Vat/nes=;
        b=jTY7ueTTsIQBFnXQvHWdLsvwO1hONi41sVbUlwZ/VUcwNdlqIdWBAQsD9nxJ0K+TVf
         8NMjHWmXWYNwSu8kCRyJpvnUsLhXUO2DIlmKGobnOokpOtR0uFywBeNceQIgOaPGAXeH
         9cVDwKsyAXOkmsnXkdztrirkb9eBgQU22nZSZ8EppmCaWbkz/qDrqZiAziZ2x3ocvfMM
         AfJDvQRSDknm+9YHWF9eqB21A/INWL61t2kxFlMoGrTZXHSvEqopW6jdo5eSPKD88Ie5
         lrqoNff86K8IgVHW+5cG5+GQGHD+pf9LJZ/iT+v6WsAsZ/iqS0gWDmJppXPleskAyveD
         w8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HSMVnMgP4upKQElf5JgAZWIAcGCpvndMYRb9Vat/nes=;
        b=q2kfxFoc5AEHNIhHau+JnNYvPgANRA2i3jkku11B6Bf1qCHPgDfPw6DGuB2KCo6kXI
         j4XmEtLXJsXQOtrsBXgbFTGUscikSlWkkTEzQYUBWYs8Hxww52p0uJJohUMwYSsO4OS7
         GarhgykNZdcxXphmGXr3vEa6Zn2YpPBtAm3jDtPEZQLXOqU56cwIJGI83Z9l54UXlX67
         r1jzIM7KTbWe5NL/a3fNghn0oYp4fiQHRsENA6Z4GG3zHR8BB8jcbpT/cdlT35Dlp/vh
         ++yhtdrreR4ajFukRzV2r9I0w/IVoklyauPj9e+Cpl6kSycWH3VFaYd4A3bBCGQEKMLg
         fzNQ==
X-Gm-Message-State: AGi0PuZUZy3dwbu+aieKnuW6G1qWZuO8uel2844lycYu1AOjBKzvCUqT
        YD+3nmD5DXx95i5w4Eaid4iF4Q==
X-Google-Smtp-Source: APiQypLR7c3obm73L6raxreYTOjlint94xmBRATqvnqD/s3kybG5fJuCWGpEqrfbhkYkl15QKdl+NA==
X-Received: by 2002:a7b:c445:: with SMTP id l5mr4760057wmi.61.1586351454571;
        Wed, 08 Apr 2020 06:10:54 -0700 (PDT)
Received: from localhost.localdomain ([37.120.50.78])
        by smtp.gmail.com with ESMTPSA id f4sm18428044wrp.80.2020.04.08.06.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 06:10:54 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, shawnguo@kernel.org,
        leoyang.li@nxp.com, Anson.Huang@nxp.com, olof@lixom.net,
        leonard.crestez@nxp.com, geert+renesas@glider.be,
        marcin.juszkiewicz@linaro.org, valentin.schneider@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v4 6/6] arm64: defconfig: Enable QCOM CAMCC, CAMSS and CCI drivers
Date:   Wed,  8 Apr 2020 15:09:59 +0200
Message-Id: <20200408130959.2717409-7-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200408130959.2717409-1-robert.foss@linaro.org>
References: <20200408130959.2717409-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Build camera clock, isp and controller drivers as modules.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
 - Removed duplicated CONFIG_SDM_CAMCC_845 defconfig

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 24e534d85045..46ee13b6df27 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -410,6 +410,7 @@ CONFIG_I2C_MESON=y
 CONFIG_I2C_MV64XXX=y
 CONFIG_I2C_OWL=y
 CONFIG_I2C_PXA=y
+CONFIG_I2C_QCOM_CCI=m
 CONFIG_I2C_QCOM_GENI=m
 CONFIG_I2C_QUP=y
 CONFIG_I2C_RK3X=y
@@ -582,6 +583,7 @@ CONFIG_VIDEO_RENESAS_FDP1=m
 CONFIG_VIDEO_RENESAS_FCP=m
 CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_SDR_PLATFORM_DRIVERS=y
+CONFIG_VIDEO_QCOM_CAMSS=m
 CONFIG_VIDEO_RCAR_DRIF=m
 CONFIG_DRM=m
 CONFIG_DRM_I2C_NXP_TDA998X=m
@@ -802,6 +804,7 @@ CONFIG_MSM_GCC_8994=y
 CONFIG_MSM_MMCC_8996=y
 CONFIG_MSM_GCC_8998=y
 CONFIG_QCS_GCC_404=y
+CONFIG_SDM_CAMCC_845=m
 CONFIG_SDM_GCC_845=y
 CONFIG_SDM_GPUCC_845=y
 CONFIG_SDM_DISPCC_845=y
-- 
2.25.1

