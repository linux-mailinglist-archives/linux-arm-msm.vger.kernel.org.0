Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE2868909E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 08:19:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232474AbjBCHRt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 02:17:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232434AbjBCHRn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 02:17:43 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2510F91894
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 23:17:42 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id r2so3788342wrv.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 23:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4BMtzaozmXt+5yPpPNwwCTVqerNIKRgIEs2mq77+z6M=;
        b=GmgQyd8HaqDUdJ0UjPoe7cQRwxeeomKyHzIn3/bhfKRZ5wk0I5NgW8I+BdDte4sXdL
         0GmS4IAzg2I4BL21h3VaI5zRiLXCj7eABSziUN6TevfaRdHazcmgGG4N23b35JQaHgEZ
         93oXwJ7Kuny291ygrk1SSqFi1i/jfmu6sacPVE53zPFZXzMqH4OUJ3ZAzDFVqEUI7T3T
         8vmjmRC+2vq6ahZqH0dYEq137yaT+2ifIQmqKz5rN4epUrUc+TG0dFW+ZoL4fCpv8PFI
         RC2abL3utG5wM9HyuG8Xo/f4wiow588XaoM9OUzU1mYw0z+YLmyoOuxW60VKW737xSHa
         nG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BMtzaozmXt+5yPpPNwwCTVqerNIKRgIEs2mq77+z6M=;
        b=lLKXMV6oEvP0I0KCjWDWyEoH76HC41nNlkpQyR46zVEDk/02a97fXQ3b4LQU3d3a5V
         s3YHhy6GM4IDwHEkYYL9z74ddrWtutU1SAuPX2hdM3rSfz84pllt818L+nNmMBf3DBLm
         OexWPRePVnMNe+VpV1R9Isl7pjVZfZlwja47vGzK5fgBTzoAcNgVeFGyC+NXdJKe09XW
         CWhXBAswxn7Yg+VGBaTTpVm4hZlfWvkOzfFIwLHc1rXL5VrPKVcK6MkwyCSTOtjnQmjy
         vOL7w8cNCXQ3x/wOnm9xQCy6jAWRdxVTMw+0zx1G1KZ+k/B8yjlztED6NCCReuv2sRKt
         xMcg==
X-Gm-Message-State: AO0yUKW/dswFMKldcJlYcv+EHdQ+sl5NSlXk2nE/OnXNq7o1XllktN1V
        OyR7RpL1nGWrmQLcB9K92hLEfg==
X-Google-Smtp-Source: AK7set/3Cvym8fZwnBWcSqBvB1A51b6geC40HsFh2GYWR+FU6sHAPuin1UrPeHGkGUEszwI3uu9DgQ==
X-Received: by 2002:a5d:5c09:0:b0:2be:5c4a:de6b with SMTP id cc9-20020a5d5c09000000b002be5c4ade6bmr8297523wrb.3.1675408660693;
        Thu, 02 Feb 2023 23:17:40 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q16-20020adff950000000b002bff574a250sm1291828wrr.2.2023.02.02.23.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 23:17:40 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Iskren Chernev <me@iskren.info>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Subject: Re: (subset) [PATCH v2 06/10] dt-bindings: pinctrl: qcom,msm8994: correct number of GPIOs
Date:   Fri,  3 Feb 2023 08:17:26 +0100
Message-Id: <167540864401.6835.6506221387468101265.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202104452.299048-7-krzysztof.kozlowski@linaro.org>
References: <20230202104452.299048-1-krzysztof.kozlowski@linaro.org> <20230202104452.299048-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 2 Feb 2023 11:44:48 +0100, Krzysztof Kozlowski wrote:
> The MSM8994 TLMM pin controller has GPIOs 0-145, so narrow the pattern
> and reduce sizes of arrays with pins.
> 
> 

Applied, thanks!

[06/10] dt-bindings: pinctrl: qcom,msm8994: correct number of GPIOs
        https://git.kernel.org/krzk/linux-dt/c/174668bf5f6c2dd03441a4660e249cc5e2c78b95

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
