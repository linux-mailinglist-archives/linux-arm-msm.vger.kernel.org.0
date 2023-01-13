Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D0346694C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 11:53:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241376AbjAMKxV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 05:53:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241214AbjAMKwX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 05:52:23 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C337A22C
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 02:50:46 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id u9so51446828ejo.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 02:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=daaBWYOrBnQYg9q+B6TyN/KTfAbz0oudZSuF4xUKLrc=;
        b=Y18IEjARhqhfnloO7RsBe9BxtQKpLTPYmklXYOVOahBQKfhtqdslQ2UHWNDMMqZN8L
         ec/UYQirwtVyNfee5573eY5xBQfytVQJpqjbmV2ByNkeIm+fMn6OsXCjZH/7itmSFJWI
         XeRj1U8EVfkKQLf93K72dEWbwRWd1g0Q5H08W/SZKrLR+Cy/lkfswGbst1oiO5IoJ/C1
         SPKOI8do6s3LBOKchp3E7mn6r5Auv+AtCoy+SAAgVT+/9XopWJg1NWhRJIMhx7+ODHAM
         fst0oOpu/pvgpdSnqZ81dkKifcX2zmXVHm8u/xAg/GODPzCJUpla8S0GtJ33Va316WSZ
         wVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=daaBWYOrBnQYg9q+B6TyN/KTfAbz0oudZSuF4xUKLrc=;
        b=6+ClUfAC/k7ZioPeUj4MYwyBwuW/wuFtog9zX465HTDYN9wVm83UMYzKn8yT8F/bRE
         CHDtKXSdXWNI1r2vzDZISFnnt9liCJrmGxWkOm17BIqrycIuToIPKRc++ApMGKmSLTQM
         bCnAAxBijrEGi4mrPy11G74R5IV0Bs3OCJYRtGcAZ5Klaprf94Ix2aTbS1dltETMoYnA
         lef6uFUnO+w2RLH0AnV852RHrBZmwW50YHGK2O8ZsroyuuMwjBwOIjA+viPphq8XhQ5Y
         e/3BTePx0YLry+hjGdcANvjXqUn4qyqiTwvekibc0Uj0S7dUyD9g409QT+FWkbRiDPeD
         kwNg==
X-Gm-Message-State: AFqh2kr3MdonnHB1rDGKypIu8ywNozItP0rU4iiw2nuRjJoSzDA7K3SQ
        Y/O0R3tjRTsX8AaBdG5HmCgLMw==
X-Google-Smtp-Source: AMrXdXthL7IXJbIWxDM10g63/s7u5J1+6e3R1l3oE+fxB7tyKaUacaUZP6InOPWMjAKOnTgVS4AUhg==
X-Received: by 2002:a17:907:d50e:b0:7b1:316c:38f5 with SMTP id wb14-20020a170907d50e00b007b1316c38f5mr73162178ejc.30.1673607045700;
        Fri, 13 Jan 2023 02:50:45 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c2-20020a17090618a200b0077a8fa8ba55sm8348581ejf.210.2023.01.13.02.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 02:50:45 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Andy Gross <agross@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Iskren Chernev <me@iskren.info>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: (subset) [PATCH 7/9] dt-bindings: pinctrl: qcom: allow nine interrupts on SM6350
Date:   Fri, 13 Jan 2023 11:50:18 +0100
Message-Id: <167360698783.32701.4054979271222055686.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230135645.56401-7-krzysztof.kozlowski@linaro.org>
References: <20221230135645.56401-1-krzysztof.kozlowski@linaro.org> <20221230135645.56401-7-krzysztof.kozlowski@linaro.org>
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

On Fri, 30 Dec 2022 14:56:43 +0100, Krzysztof Kozlowski wrote:
> Almost all Qualcomm SoC Top Level Mode Multiplexers come with only
> summary interrupt.  SM6350 is different because downstream and upstream
> DTS have nine of the interrupts.  Allow such variation.
> 
> 

Applied, thanks!

[7/9] dt-bindings: pinctrl: qcom: allow nine interrupts on SM6350
      https://git.kernel.org/krzk/linux-dt/c/12a18bb74f7500693bdfb6af2f99c05d2d43f9c6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
