Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA31554863
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 14:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355021AbiFVIgP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 04:36:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354305AbiFVIf7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 04:35:59 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8930A38BE7
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 01:35:49 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id eq6so15503907edb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 01:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=i4bRTG4lVkNF7ntn262LTb80cj+Ip9xH77tT8HcEEqg=;
        b=y/FpOc4YHeB4CimlgD+zcxj+AuCEspCpU8ZC6BomTZK5jkSd1XfD5GZGD0Od5o9WzG
         JC3hDYcmt1nRPRGR7lCTTKOcv1y++oVT1DWgfbN8Y9qetNXG6kYeml4JRE9jWUcFybm9
         Ge8ZFtrN6UFV32+oyP5DHnQuK4VQvkl6dW4bGpmV9ifGHB4XSBS3FGHtr7pdehkWxHXT
         MVpOzrX0MZ3n0Ql6QbhBPDb7LgH55wW3zxJaFSQoxyloiqBN1X4WMVuX5W3PBz5doFdi
         eXALsuB4WQlJYDbzrxO4KCzKBiSslPNuw871IXlOMzY5GQqIDvkTOx5BlXn7DtLxgxY4
         7cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i4bRTG4lVkNF7ntn262LTb80cj+Ip9xH77tT8HcEEqg=;
        b=F29yq8GOj74DxkRtY9q3F+1v6F9r4OWJLBIFoyBp3dcUE5Tg3y6k/oXG47+7jwArZe
         IJ5I5QngvByWMjMA4gCdLLJ4cItK8lZT/GJdYnJ4lt19+GkFgRQ8Zq8yMm427oNJbY89
         ZG3C3PKh69dyp9ULEK4Y1eMfmRNku7BfVC6/wTYW1+yHDXOJbZJbE6WRTcV/Ejy0T25O
         Gv/qMtefcAK5t+t/oro1b7jKoBMXxgpHZHesbRncv4jFUEKu4mDe8JUMmyYgm2oIfghI
         6y4gvgiPZoCw5X7ewk3SaPtHVcPxMBCDwG7B/CkLsikXMFba0bAHrK4sBTL2P1i+TJl/
         oYXg==
X-Gm-Message-State: AJIora/r+uzdRcV4np9KIHrNW9DqKy6Aem1WxHggqsXIhglU5J36xIGV
        aVTEWyLmh9YBri4s3ktU3f61iQ==
X-Google-Smtp-Source: AGRyM1th5YFje120BVD3g9dTQuOlYu2KzHSQhj0WdB/vYKLGcfDT7C3zKJWLyTHt6rhgnIiwmDn3dg==
X-Received: by 2002:aa7:cb13:0:b0:433:4985:1b54 with SMTP id s19-20020aa7cb13000000b0043349851b54mr2751651edt.182.1655886948123;
        Wed, 22 Jun 2022 01:35:48 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ku10-20020a170907788a00b00722e603c39asm1979733ejc.31.2022.06.22.01.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 01:35:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        krzysztof.kozlowski@linaro.org, agross@kernel.org
Subject: Re: (subset) [PATCH 12/12] arm64: dts: qcom: msm8998-mtp: correct board compatible
Date:   Wed, 22 Jun 2022 10:35:34 +0200
Message-Id: <165588692598.15720.11468561846292254961.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521164550.91115-12-krzysztof.kozlowski@linaro.org>
References: <20220521164550.91115-1-krzysztof.kozlowski@linaro.org> <20220521164550.91115-12-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 21 May 2022 18:45:50 +0200, Krzysztof Kozlowski wrote:
> Add qcom,msm8998 SoC fallback to the board compatible.
> 
> 

Applied, thanks!

[12/12] arm64: dts: qcom: msm8998-mtp: correct board compatible
        https://git.kernel.org/krzk/linux/c/4fb4a39fdbc8bd0aa35de0970d26cbc6c5abf946

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
