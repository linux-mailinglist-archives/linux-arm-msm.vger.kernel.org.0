Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2036568D9DD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 14:56:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231395AbjBGN4q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 08:56:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231818AbjBGN4l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 08:56:41 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B678438B60
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 05:56:14 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id k13so6226005wrh.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 05:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woyCLhhr9GNDZ+ZK9imdrAaOvVCw51EmSZRJm9R7J5w=;
        b=NtU54NwNW0ruK/8LURJT6C7S7FeX/i5HcbZpzVPSd8N4FDeryJMrp6kX0Ad05ncNEc
         g9vDeJ1/IVQLVx3XzIc+t86oT6mr60a2tMn0UqqxrOC8LSTRd3ycdIRBs7chpFuPc0X+
         qNqC4otwYGd4bjSgMGjhAh9e1OMmbbFXvFVFQk2fS0fSVcPbp2uq0k6KMaYkKSDnhysS
         88iL/fSSSKruvvOoLlrRofeuXgpaYWHUsuRSg+VS1V/wvSI6x2njwiqw/sSFXA8M80/r
         x/pD2M37xtEOV4yy03FSeC9nDx60cjzg8MdiBWM/e85wWIfOP82P5LNmh1KzLIACptYD
         Fomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=woyCLhhr9GNDZ+ZK9imdrAaOvVCw51EmSZRJm9R7J5w=;
        b=ug5zTrWX6L/09UB79QdH/2oloGo9NWT8D5GWgTGrVOoyZJKz+MnWCa9e7nd5P4543q
         /zLeM8B8E3t6cEwpV1mSSihkwCwmvrX22NX44ZlSRdqNodB4JESvWWPci00H72ZMW+lP
         XGfcVnuS+6HHDjK/PanHW4n2MgiBr6NNgmub6ieHZL2rp7W/avZnewl/27utmLNf3456
         vxq6hmljvP3hDxwN0daW0/YTKld48QihW5aQyLZfnm3iwP6sxMkdSb4+AyQxRKSOgYb7
         f4n23DjtOGBYqo8eWvt2unX0Ztw6xwIkzkZ0yxnJiVYpXMEOA+8LrB3vxlznd2lChWJn
         +Iog==
X-Gm-Message-State: AO0yUKX5JZLlkBkf9jAlqK+f7yuFRTLGoU3EwoVq8DWCLpSiyotS+1QZ
        ZmDUamupgUMuZuRpPjFcKg8Wcw==
X-Google-Smtp-Source: AK7set+310+2rkvwM3A7GBlhW9EtKuxs3n1k3TNZRXyXkrqITOpLCmAe3j3hq/Bam4I+ObeiHtxrgQ==
X-Received: by 2002:a05:6000:188d:b0:2c3:be89:7c36 with SMTP id a13-20020a056000188d00b002c3be897c36mr15394572wri.25.1675778157897;
        Tue, 07 Feb 2023 05:55:57 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id p10-20020a5d59aa000000b002be5401ef5fsm11611312wrr.39.2023.02.07.05.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 05:55:57 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 2/7] dt-bindings: mfd: qcom,spmi-pmic: Add pattern property for phy
Date:   Tue,  7 Feb 2023 15:55:46 +0200
Message-Id: <20230207135551.1418637-3-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207135551.1418637-1-abel.vesa@linaro.org>
References: <20230207135551.1418637-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The phy pattern property will be used for providing eUSB2 repeater
functionality. This will be modelled as a Qualcomm PHY driver.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

The v3 (rfc) is here:
https://lore.kernel.org/all/20230202133816.4026990-2-abel.vesa@linaro.org/

Changes since v3:
 * made this the second patch rather than the first in the series

 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index adf88245c409..1e6fadec1301 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -135,6 +135,10 @@ patternProperties:
     type: object
     $ref: /schemas/pinctrl/qcom,pmic-gpio.yaml#
 
+  "phy@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/phy/qcom,snps-eusb2-repeater.yaml#
+
   "pon@[0-9a-f]+$":
     type: object
     $ref: /schemas/power/reset/qcom,pon.yaml#
-- 
2.34.1

