Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D71F3584543
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jul 2022 20:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbiG1Rvs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jul 2022 13:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232924AbiG1Rvo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jul 2022 13:51:44 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E4F074CC5
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 10:51:43 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id bh13so2097117pgb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 10:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QRPeWa+D/9YFuXXP1Wo3iP9ouDPjlDA43crG7LuYS3c=;
        b=XnK6Ahd5Neh+1+Tmw/DVISXnCN62TDDOOeYQ6deBdNYm1mvKmlTRpwEPyESo8bE+wH
         6KDgzgNDzMZyzCpXLxnYu/hfyZyzRO4MRcuN6b+C5gdGf8u9UP+PJ8k/ZuD7cmiTEIfw
         lZP341vQUf1vS02Is+5tGXF25QRv5NHrWtqe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QRPeWa+D/9YFuXXP1Wo3iP9ouDPjlDA43crG7LuYS3c=;
        b=5fBcWyIfuMnBQxWfFhbDqSKNYN6PXJDv/v+BuyA7KIPaXFRf5bdBXfRL4djfu+ekZh
         dYv5Tzq08GvbwKE16GOrSY6OUQFayrm0JxS3OZH4ZKOWUV7QtI8hH8M3IYRUcdebbf8k
         36f57yOT8cD8TZwM2h3y95KFTfNx1mtJdVJvMn8rrqqunuO6KeSY4oxsOKPOrTwU+Yq/
         9+ooOKGu89Xuc0nPS0+VdmwTqAS9cacbsgvglbWvObML8ttK1wWBdT5memoy9uHmCq/T
         E3dVyGFIm0vlto33VrsJ8MdbRcURCQbTa3CUlcANswFwiU/9+QyRmXXCOFahMPL2lIo4
         MegA==
X-Gm-Message-State: AJIora/q8GCrlcDALVB55m8EI+UsQNbuH6tS2Y6F4sdILc2HeWrYYe2N
        GYk2wHKwLfiAPq090uLpfjBv2Q==
X-Google-Smtp-Source: AGRyM1vwZSiGXf4A2+/27mfoJxejt3u3qqPSDpCDsxRT+xM9wyDg+E9KCFmYEuCbY58r3HHhARl5sQ==
X-Received: by 2002:a65:6e96:0:b0:415:5973:b4f4 with SMTP id bm22-20020a656e96000000b004155973b4f4mr23188866pgb.568.1659030702919;
        Thu, 28 Jul 2022 10:51:42 -0700 (PDT)
Received: from moragues-cloud.c.googlers.com.com (252.157.168.34.bc.googleusercontent.com. [34.168.157.252])
        by smtp.gmail.com with ESMTPSA id t14-20020a17090a3e4e00b001f315f73ef1sm2696136pjm.0.2022.07.28.10.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 10:51:42 -0700 (PDT)
From:   Bob Moragues <moragues@chromium.org>
X-Google-Original-From: Bob Moragues <moragues@google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org, swboyd@chromium.org, mka@chromium.org,
        Bob Moragues <moragues@chromium.org>,
        Rob Herring <robh@kernel.org>,
        Bob Moragues <moragues@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: document zoglin board
Date:   Thu, 28 Jul 2022 10:51:10 -0700
Message-Id: <20220728105005.v2.1.I5b9006878bdabd6493b866b46dbd6149968d545b@changeid>
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bob Moragues <moragues@chromium.org>

Zoglin is a Hoglin Chromebook with SPI Flash reduced from 64MB to 8MB.
Zoglin is identical to Hoglin except for the SPI Flash.
The actual SPI Flash is dynamically probed at and not specified in DTS.

Signed-off-by: Bob Moragues <moragues@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bob Moragues <moragues@google.com>
---

Changes in v2:
- Fixed Signed-off-by
- Added reviews / acks

 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 581485392404..63091df3cbb3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -475,6 +475,7 @@ properties:
 
       - description: Qualcomm Technologies, Inc. sc7280 CRD platform (newest rev)
         items:
+          - const: google,zoglin
           - const: google,hoglin
           - const: qcom,sc7280
 
-- 
2.37.1.455.g008518b4e5-goog

