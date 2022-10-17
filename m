Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FFC86018E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 22:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbiJQUKp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 16:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbiJQUKL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 16:10:11 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C8B620982
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 13:09:37 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id l28so8458310qtv.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 13:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+z9iR1DoVyFzcCBSOfJWuhbv2To69/l+EtVzS7Bnntg=;
        b=bGGZlB79PkuHLiL/C+Ko9j1zVW3XVEALTbCCPa3ojEy30UYdJMGAOx8Dmj8NuMuiGu
         t90JKwsC1LMY0RMZdYPepAEbt26J0xFr96tI7SjzozqJpDH790QBEwn4nWlJOSw2oolM
         D9UOXNeLbbOS9nIp4lIarg+WLnpqE3rKBWUI5vjFnN126vC8d0MlnMr0cu1nyHj6m/c5
         61uOBb6rFpU6jXP6AhzkWRwfbcLSZ/BHtvKuGijPzU9fwxVTZp79kmVZ7ND8x/uYKXh7
         WxwOfwqvHf7JFHcqDdp/jbcundhBH3OELzFRBf1Xh/z2TSCqmLAfqPoeR7OVbLXa7fKD
         mSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+z9iR1DoVyFzcCBSOfJWuhbv2To69/l+EtVzS7Bnntg=;
        b=qfsmYhNdWfGzlp3GXqTZsHzPhgYfUSu7/3Ny8yaqQM99TKh25lfzcIhd0tb9iRNP+b
         GtnMrvtW4OOrfIyTrp+R+buIxO8hGE7USOM/iF4s4ivAFvHuKIEZkuUfKfgc22Blv8hG
         nGrFw5TEZvos8AAkqPyEUly8t3+fu/IgGVcM0gQ9zO41kZtGXKmHW9EBNZuggKRLVwCu
         38uML+Ro+BSx065qIHtbl5g4XJTU2n5jKrcimt+XloRUu51DsxB3NkV8aQ5HUSVO2hcz
         xHEpAZOd6qOu1mLSavmLAMke+AGz9dxvOYQLfkGzmHnzV+DF/OniYrScb//AhxmEfr8r
         TxkA==
X-Gm-Message-State: ACrzQf05vdAlsEUo3RAREWEXlblslLKYXzZnRJu7MHWVLmp3QD7BH7cG
        uyGgeYQuKZZxGSaRbZCB0ZlhJA==
X-Google-Smtp-Source: AMsMyM72UlVUzNKij4Wqhuv3Hm7UwfEmh4KBfFjA0POPrhuXLdd92Hx0xluOesk8MBKdiZb0g1CA8g==
X-Received: by 2002:a05:622a:18a:b0:39a:ffaf:6c9d with SMTP id s10-20020a05622a018a00b0039affaf6c9dmr10008805qtw.253.1666037348590;
        Mon, 17 Oct 2022 13:09:08 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:09:08 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v5 20/34] dt-bindings: pinctrl: qcom,msm8909-tlmm: fix indentation in example
Date:   Mon, 17 Oct 2022 16:08:01 -0400
Message-Id: <166603728602.4991.8091094399631285673.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-21-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org> <20221016170035.35014-21-krzysztof.kozlowski@linaro.org>
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

On Sun, 16 Oct 2022 13:00:21 -0400, Krzysztof Kozlowski wrote:
> Bindings example should be indented with 4-spaces.
> 
> 

Applied, thanks!

[20/34] dt-bindings: pinctrl: qcom,msm8909-tlmm: fix indentation in example
        https://git.kernel.org/krzk/linux-dt/c/6471d94807c33b9c2f0d806ee0d78b984626a819

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
