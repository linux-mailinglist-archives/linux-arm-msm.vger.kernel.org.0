Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 565D66694AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 11:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241149AbjAMKwW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 05:52:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbjAMKvk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 05:51:40 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CD481AA0B
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 02:50:24 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id mp20so4781623ejc.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 02:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EgWST+bwv5L5giN822jBmcvfyL+5kJcquAhQUbMjB7Y=;
        b=j2toRYjNGcst667IqisPfGaT8IDgXp6RU67lFR6kEKBVJHQ5Lp0jQmbZvHbKEdiqYc
         sqB+FNGjj5VQ/+djIw6wfRm6DmHayhbUIeAKqpR/9CfUZAHezjB7XRyhU8BSStArKs9t
         k9LR+T391vRYlcJ8OfDi86eoGVKB+Y5bYThvQ9eau1Pn0yyVeZC3dKuriKDlWCHdSVY1
         VioMNBbhmUVaAH9oWPsdJIa07nlbaqkJPqj1c+wVe6eWv9iOT7+LEeraa7XiA4HA1Ksh
         r45oYleOFWLbQ3hS8nOme/Dnw+Wk8lEEsflPrqSxVE+RvYZAbzi6dDWJyY/WxgDI78It
         GMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EgWST+bwv5L5giN822jBmcvfyL+5kJcquAhQUbMjB7Y=;
        b=ltr4N0BbQUqAlN1aSMYrVMel1XmLyNNPgCRvzJBG3ulVBaRjEWvXxrOZW3pllbBYsg
         TDjUDmgLAC83nNwkofWgPZ3yRIFaWQWFEbynzpUtb7JUX9TVw+nhKyhqYGkGnkpVyRFn
         qMxVo8RquPcS2Ntejm5BZ14bhd2Pr8bBpkH85o0PJqPEkwnuJufuZlTLTWWPGbWewavW
         ITEJTFuvWhjN1u/DHyq9r7rncmheRfRGNmwjYvHkGulFHsv6eTA9Ki0dfv5SMCygRWQH
         w+NAfz3i9dSrGGJfvdwDc6iRcNCiebXVLiyN9xswVWz41i3HzXp7esLIHzSvGZCTc2gY
         Qt9g==
X-Gm-Message-State: AFqh2ko5Oo5WZ/lLUUO+jkIpECfDt8MiNsQx0NjLkxbyVm+iU+xy3Ohp
        qL1ULe7pWVu9SIVOnh6Ub+ogfA==
X-Google-Smtp-Source: AMrXdXvcm+ayFgHwwqO680wksafu1nympGj2N8nXWmvj+8APoTQ2w3f+ZZBoJV2z16w75FgnlXFDKQ==
X-Received: by 2002:a17:907:d389:b0:7c1:5a37:825 with SMTP id vh9-20020a170907d38900b007c15a370825mr85839001ejc.34.1673607022726;
        Fri, 13 Jan 2023 02:50:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c2-20020a17090618a200b0077a8fa8ba55sm8348581ejf.210.2023.01.13.02.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 02:50:22 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Richard Acayan <mailingradian@gmail.com>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        devicetree@vger.kernel.org, Iskren Chernev <me@iskren.info>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: (subset) [PATCH 1/9] dt-bindings: pinctrl: qcom,sc8280xp-lpass-lpi: correct pins pattern
Date:   Fri, 13 Jan 2023 11:50:12 +0100
Message-Id: <167360698782.32701.3957478926329730241.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230135645.56401-1-krzysztof.kozlowski@linaro.org>
References: <20221230135645.56401-1-krzysztof.kozlowski@linaro.org>
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

On Fri, 30 Dec 2022 14:56:37 +0100, Krzysztof Kozlowski wrote:
> SC8280XP LPASS LPI pin controller has GPIO 0-18:
> 
>   sa8540p-ride.dtb: pinctrl@33c0000: tx-swr-default-state: 'oneOf' conditional failed, one must be fixed:
>     'pins' is a required property
>     'function' is a required property
>     'clk-pins', 'data-pins' do not match any of the regexes: 'pinctrl-[0-9]+'
>     'bias-bus-hold' does not match any of the regexes: 'pinctrl-[0-9]+'
>     'gpio2' does not match '^gpio([0-1]|1[0-8])$'
> 
> [...]

Applied, thanks!

[1/9] dt-bindings: pinctrl: qcom,sc8280xp-lpass-lpi: correct pins pattern
      https://git.kernel.org/krzk/linux-dt/c/3c90b1ba8cc49b3c485e4477b9977e52a16509d3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
