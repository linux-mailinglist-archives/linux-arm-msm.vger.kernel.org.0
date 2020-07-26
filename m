Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9043922DE33
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jul 2020 13:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728010AbgGZLNY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Jul 2020 07:13:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbgGZLNY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Jul 2020 07:13:24 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ABF6C0619D2;
        Sun, 26 Jul 2020 04:13:24 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id dk23so2350072ejb.11;
        Sun, 26 Jul 2020 04:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BUGL4K4heQV6cmWFDUkEFsQC/BUMFqKxR1twxpkuadg=;
        b=taV75JWQaoJ7pMv1TUWW7Vq74WconS+Ccozkcy/34AEDVBpwGVTg8p2NAzDc4G9l7l
         rt3Z5OHHnc0L3ECrMybxSfVyk2PJcIfGw9Ok0PI6ysV/L1s7btZjwIRNC58H1mCr7WzL
         WtzqFCKdH5DyauKsm+9TZhnXK53UbEd824ElAJOrP4Bpk+DQFkdY4QOJLIwhfImAEQuf
         Un5tBaV9x/rASEaAC0ue4O7lrYlJQyvtudYClaH/LaX5m2mzNU7Dz76WCZQ8cteyuDIv
         YYrVTSZIPJHlWQrYMPCzOFQa7+mDsrWgN1BuNeKYpaqF4i9Q3AtUbRyMuwbWSXk5ZrxK
         lrug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BUGL4K4heQV6cmWFDUkEFsQC/BUMFqKxR1twxpkuadg=;
        b=V5Q8erY3gbu4x4y8rianC7ebFQZ+ryzw4h1D8+tXcVPxRgvo+Rlxl1xKzt3N1u+wL4
         UUEacYH4zDdon02O1VculIjwp9Pw9W9ihRI0Xte9nn0F7GaPM8ZA3cm9ibOi6yYL6HZW
         R2jWO757AFAyMw7BNjvMZID/ddSf3F/5olDZRZprh1Vex+nnZlFC71nWWnGPrXofA4su
         GsR8Dk1OZQI7iRdvmlKhQlbkCVxxHsJP0bf+3AqjTWB4I3fIG4dWH8xkRgpOAUehSw8k
         1+Mzae84WRbbRNRQ4BOup5UgNSujPzX1Jo6IZ5uLNoUcRT+gOk9cIjqfUAGuB1240U/3
         ms2Q==
X-Gm-Message-State: AOAM530sMyu+/vGmE4vJpjAKWdaNjE8+E6UYTFA3AMyMZohrGkD/F8LH
        u29gf1dvDz28rghC63RruRY=
X-Google-Smtp-Source: ABdhPJywAuHNjAKzXrb3d7aNlvcztBkTAT7o7wcs6YXMsHMu+ieSvIK/OoAGboYJyc9rP1jU1Caz6g==
X-Received: by 2002:a17:906:7a16:: with SMTP id d22mr2892892ejo.478.1595762002780;
        Sun, 26 Jul 2020 04:13:22 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl. [83.6.167.207])
        by smtp.googlemail.com with ESMTPSA id d23sm4696253ejj.74.2020.07.26.04.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 04:13:22 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     martin.botka1@gmail.com, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        zhengbin <zhengbin13@huawei.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Krzysztof Wilczynski <kw@linux.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Xiaozhe Shi <xiaozhes@codeaurora.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-clk@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 1/9] clk: qcom: gcc-sdm660: Add missing modem reset
Date:   Sun, 26 Jul 2020 13:11:58 +0200
Message-Id: <20200726111215.22361-2-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200726111215.22361-1-konradybcio@gmail.com>
References: <20200726111215.22361-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This will be required in order to support the
modem upstream.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 drivers/clk/qcom/gcc-sdm660.c               | 1 +
 include/dt-bindings/clock/qcom,gcc-sdm660.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index bf5730832ef3..a85283786278 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -2402,6 +2402,7 @@ static const struct qcom_reset_map gcc_sdm660_resets[] = {
 	[GCC_USB_20_BCR] = { 0x2f000 },
 	[GCC_USB_30_BCR] = { 0xf000 },
 	[GCC_USB_PHY_CFG_AHB2PHY_BCR] = { 0x6a000 },
+	[GCC_MSS_RESTART] = { 0x79000 },
 };
 
 static const struct regmap_config gcc_sdm660_regmap_config = {
diff --git a/include/dt-bindings/clock/qcom,gcc-sdm660.h b/include/dt-bindings/clock/qcom,gcc-sdm660.h
index 468302282913..df8a6f3d367e 100644
--- a/include/dt-bindings/clock/qcom,gcc-sdm660.h
+++ b/include/dt-bindings/clock/qcom,gcc-sdm660.h
@@ -152,5 +152,6 @@
 #define GCC_USB_20_BCR                  6
 #define GCC_USB_30_BCR			7
 #define GCC_USB_PHY_CFG_AHB2PHY_BCR	8
+#define GCC_MSS_RESTART			9
 
 #endif
-- 
2.27.0

