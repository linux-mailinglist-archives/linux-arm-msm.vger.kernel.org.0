Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA0F560189B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 22:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbiJQUIq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 16:08:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbiJQUIf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 16:08:35 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF3D179ED8
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 13:08:29 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id s3so8450231qtn.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 13:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qN25GM0TBeCVFnzZRgydZ5zwi6/FQNaEEHCGaz2wVhQ=;
        b=H4ouNzyds9T0uYnz1FBePSTkD9TA5cG0w/cUX1ZIhI9NgO4B0q5lsTsU0L/GXJ/DU6
         sosVny07WgixuOiHGf5ud32PIm2P07pB70aQxqbP7v9f/Cy4TAOx9JnlTneqMzLVjtRl
         CnzkFJ+Ts3sY5L/haTHyukOEF1wW0Vr6hmgtRnHdjNRMeyYI5YcC0/efiOO7ogDiCM4w
         tfmiHWhuCGbC3cfgQrcCEjbMY0PhRtwhYB5fb9jqk1BABeJOwJXmW1BO/gtmg9WO3ovO
         5kGXueF8gWcn1MRvtxKcli8No6HPhbPAkNDJj04kxTPUMNTa9F1vdYGQ/IKwchILYTxx
         XePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qN25GM0TBeCVFnzZRgydZ5zwi6/FQNaEEHCGaz2wVhQ=;
        b=CJer+Bh6882kLBFyhuBi/6TsG6iSg1jwgF2Uv1Pz3gWLy4e+GJ6qt6pzlq7LzSYoDn
         g/j97iGNeoa5Z6RGCffVSYQZgy3i4GDFAXmmf/5YDSxBRyhNcr7vQMpDcZOtElMQu7ra
         qEQ7W4la+Hg3dYLdcFmBEqqVFXyAQFCRUMfk7Y+FzSPaXiKgyQBfwH35xLnFqnYcKPBb
         pp6JG7KPdS7DHu6CRwiG1GiuBEUMyoxQ8rt2WRCUuQTyDitO4lky6uQUgRobFd5Tvde3
         lGQ21SejZcZ+uVLZXRta7vNo2sLq7IBYuWIqo8gHf7RsffqwVShasvvQriAQPUtBh/rh
         TXoQ==
X-Gm-Message-State: ACrzQf2V+/0LVPgwEEKJKTSzLtt9bIHKxTdn6Fcd7hYmIZE1FCcDt5tK
        4m5z8sVUEBRcvF10AwdIOhhSeg==
X-Google-Smtp-Source: AMsMyM7QNurNvbYMJ2z9wtRCo9BGIlP2dUWqf/dASqS544IYmYX2PCHZ9NGfpXFtlPNYhRJD4FH1Lg==
X-Received: by 2002:a05:622a:141:b0:38b:f43:60bf with SMTP id v1-20020a05622a014100b0038b0f4360bfmr10080091qtw.137.1666037308791;
        Mon, 17 Oct 2022 13:08:28 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:08:28 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v2 10/12] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi: fix matching pin config
Date:   Mon, 17 Oct 2022 16:07:45 -0400
Message-Id: <166603728600.4991.16944000712826808286.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927153429.55365-11-krzysztof.kozlowski@linaro.org>
References: <20220927153429.55365-1-krzysztof.kozlowski@linaro.org> <20220927153429.55365-11-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 27 Sep 2022 17:34:27 +0200, Krzysztof Kozlowski wrote:
> The LPASS pin controller follows generic pin-controller bindings, so
> just like TLMM, should have subnodes with '-state' and '-pins'.
> 
> 

Applied, thanks!

[10/12] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi: fix matching pin config
        https://git.kernel.org/krzk/linux-dt/c/a849cbd18aa2da5db84502111742431dcd57555b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
