Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B51056018DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 22:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbiJQUK2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 16:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbiJQUJy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 16:09:54 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF52A1ED
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 13:09:19 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id g11so8471102qts.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 13:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWsuselkkTQS3JHAybj6XVKE0eCJVmiTsTfRwbK0YvE=;
        b=S6wTTKSdrQO46SI+xTMuCluRgqE+qNf2iwKXyuID/bkBW2K3Mw6NIiSy4vF6Mpf5Nj
         DG9PBVA+Z/N+3SpibbdmBisW/+ox9UMRbhMpqX15nbx0bIWjra0GF/UhGwL/j2LRzZg3
         siTqozYXePJAF196mo30awuKFwdpqPyqlSvFH54GU7AEy6h9rm8XSdMxjt0lx3NmGxYb
         M3ZFEVi/SDJAtBrf/7x/s2w08Iv9rtNME383OMPoWfePEL/+iF68XDRFQUO01FPm3cvT
         oP8mC3uYz//9sShEi7di5bqsWVE1qXxjZj49x1h1SvnnYvBrb4i6ZXaFRvnT2kz3exLc
         xT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWsuselkkTQS3JHAybj6XVKE0eCJVmiTsTfRwbK0YvE=;
        b=WwvXsiqHkyEatPXwlXaXdRVUhIljqew0GA5UNx1IslMAGqWcPyXbtUCOW4YxIRccpL
         tKNiqxk8JHLoOHE/25KhBdIkFgmrPRSYcT/cdj3TGkMppoTCxvosWg8VQ+teK9Xc80a9
         PwBkiX5UabwmLsIDVKdTpWhsp9I8RAQ7lqctmgv+NN59gX/D8/1aZYznrAwG17M+4ZzD
         Sq2jiEWBlbaWFBgOZhoJpmzEdY9Ndf3A4gFJUdo8bnV0d61ZhkHJIglCjK0/bOQ7Onxs
         EO9GqhuF+MthdHxeUEyG2rlGNnILDIhndGIrjnyXJVH3jX31lfJanag/gHi/ahaoUHbn
         XVuA==
X-Gm-Message-State: ACrzQf1dRz4C3/rKllSQC1H+B27Oqjhc3mR0wSaL/NwA438oUVqbXvDw
        BH+kF+fk4XBfsj2FRKoVxbEj/A==
X-Google-Smtp-Source: AMsMyM49ZN/hlVWE+A3HqnvNqsYx4Dhc8t3EmLZXd0yJMnTBx/hn4PUAsvZhErIPTKVFYVKQkbVP0g==
X-Received: by 2002:a05:622a:114:b0:39c:b7ec:345a with SMTP id u20-20020a05622a011400b0039cb7ec345amr10118083qtw.677.1666037343084;
        Mon, 17 Oct 2022 13:09:03 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:09:02 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
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
Subject: Re: (subset) [PATCH v5 17/34] dt-bindings: pinctrl: qcom,msm8226: fix indentation in example
Date:   Mon, 17 Oct 2022 16:07:58 -0400
Message-Id: <166603728602.4991.7955884448708040070.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-18-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org> <20221016170035.35014-18-krzysztof.kozlowski@linaro.org>
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

On Sun, 16 Oct 2022 13:00:18 -0400, Krzysztof Kozlowski wrote:
> Bindings example should be indented with 4-spaces.
> 
> 

Applied, thanks!

[17/34] dt-bindings: pinctrl: qcom,msm8226: fix indentation in example
        https://git.kernel.org/krzk/linux-dt/c/1780bac7c11c341f99ab10a83ede9e96464c5f91

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
