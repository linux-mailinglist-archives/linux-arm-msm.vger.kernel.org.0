Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1E315524C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 21:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245156AbiFTTmC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 15:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233184AbiFTTl4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 15:41:56 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE3E51C90A
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 12:41:51 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id fd6so13754359edb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 12:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zpj4cWBtZ4CWcmaFsxV6V6Tx9Al+iH3H9Tj56Z+TjxU=;
        b=q4MFwY8mYwSZnQ7C+MEGjm9mdt4siEfC/aM3RygAeF3y0f2yn79w3V5Ui7gVSVa4Ly
         Wi1WZcYkopeNNyHv29fQGb8trvSdtpDxIoUNp9b7ifObfhf5fp8LAIgn9ZUDHUJylI4A
         blu1aW79X//z28sylrUQxIGORAoubTQyscI2pRjeErHaK5iwcUVyYqNG8URCQohILH0I
         7VZM/tFX0ylMBEi900dyzASzmlyBrGp7RpdZwC06/JzMn/8GkMRk7VtGZPa0pV6KYX0k
         D+f9RA+A3Gx1Vh5nwZi7Ga8g7MAqGMNUcSrTQTGwiAa2bVj+5a71OKct1IPtGauuhzWb
         /PNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zpj4cWBtZ4CWcmaFsxV6V6Tx9Al+iH3H9Tj56Z+TjxU=;
        b=AzspvF1NCystB7I1FALRs416jHXrvuNPEHVyyOH9aQaGVTQr7qjDaxtaETkRIzAJfx
         o6DPx8LV7OlPGDvwByFw6FD4iZE4D7tCofuM5B8ym3xlzn05kpLUQQNmG3Qr27fU3RNq
         OS6SNvzucqi3lTuyByac9mI5ZXL6ri5NWGaIYmFJ/qMyRuuMY+MjyayLwunAPGmgGQVm
         auW1X+QopO5DaQg3Na/iZp3PzU5Yyp081gn7r7Q4hVC0uWMh0M5+GHIL7b+x0AZHG+Yq
         fiCb3DHJLermVtE46aFmtmMVJ0f1BH02Ojql429MCmI9wAazzMo6lox1Tuv301ygT7BN
         BNpg==
X-Gm-Message-State: AJIora+dri+HM842j/Gk15eZqtukPT/gpQ3qN4YA/XUP2ee+D4Ar1ze0
        ZhZGgGdDoa3ZRE7SH5ykHXq60Q==
X-Google-Smtp-Source: AGRyM1ufbflZtPXkaBdGcvYFGRw5vp9k0MCMr17zcEaGFG+1tuOuuqcvW55SJM5W8xsPUcJ00RXRRA==
X-Received: by 2002:aa7:d795:0:b0:435:7fc8:2d1b with SMTP id s21-20020aa7d795000000b004357fc82d1bmr9609331edq.201.1655754110613;
        Mon, 20 Jun 2022 12:41:50 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o18-20020a056402439200b0042fbc23bfcesm11448549edc.46.2022.06.20.12.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 12:41:50 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, bjorn.andersson@linaro.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mgautam@codeaurora.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org
Subject: Re: (subset) [PATCH 02/13] dt-bindings: soc: qcom: qcom,smd-rpm: add power-controller
Date:   Mon, 20 Jun 2022 21:41:43 +0200
Message-Id: <165575403865.144830.16842513084779745987.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220504131923.214367-3-krzysztof.kozlowski@linaro.org>
References: <20220504131923.214367-1-krzysztof.kozlowski@linaro.org> <20220504131923.214367-3-krzysztof.kozlowski@linaro.org>
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

On Wed, 4 May 2022 15:19:12 +0200, Krzysztof Kozlowski wrote:
> Document power-controller child of Qualcomm RPM over SMD to fix
> dtbs_check warnings like:
> 
>   msm8916-huawei-g7.dtb: rpm-requests: 'power-controller' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> 

Applied, thanks!

[02/13] dt-bindings: soc: qcom: qcom,smd-rpm: add power-controller
        https://git.kernel.org/krzk/linux-dt/c/5f85744976959a99a76b5c7acff093b65414a606

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
