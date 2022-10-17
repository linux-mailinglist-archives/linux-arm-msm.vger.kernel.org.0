Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 675D96018C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 22:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbiJQUJt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 16:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230490AbiJQUJX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 16:09:23 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E30807AC11
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 13:08:41 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id z8so8464710qtv.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 13:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Afbcq17HqDYBd4S3+PAL6CXrcBTfuo1giJr9BJq2zLE=;
        b=sRpp+WYjwYGDe0thj3beH9ZTf6cm2gg1mUZ1WAIeM380K0ouW8qJ0PjSbkLfoTcZOZ
         mUt88IURUr5L2RJb/DRnNn8Yv7i8mNTcOcC/iCtarBhyuxsHQU5OeZIr59piR8e0Epnc
         bhZYtp1z8d0n7plPmc8ZguFjv1sgo9cjIe4qENlfT2BSbQfe2K0ovM/NwnCyWtejYP7y
         pTPnu2J9WuhvZWrgfzWFqCMBptjGg160YIorKr6VeJHQsID4u8BktHTFmHZ8Qys67+x2
         Iu2DZAcYSFEgpCP0qo+ViulqnkLM/HQloNEXEj/jKZg+7FdPO5qdHP5KKcfCCIDVx3nq
         v/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Afbcq17HqDYBd4S3+PAL6CXrcBTfuo1giJr9BJq2zLE=;
        b=wZ9x9ZWiOtWLdj0jANasav6X8mc3rkf9sMFHubCZLibv8wrD/ccJcpDVN9CiQxb1+n
         L+vnxPOZ7Dfhx3gKTfejlF2SsjtyPhSoNqAFHLao6woIXPPofK63S0vY/eSKqWHo0ZA+
         QkT/QkwzL8ineldYQtJdL1MaSyIPpT8mdfme9fjYxfQfwprwkskXJuOTR//Hp4JM46OT
         F954AoHcXB+8kOi2cPVWkjKb7uDz1Swp0ME55ak+SdLaUFXM9pAFwaf3hGkXjc//HDxt
         wXaV3P7MBLIll3nkzZjF4D/GDjOmtkbVjKVzVG+1izRUxTpAT+au6W6oBNoVHkk7mHw/
         Vvqg==
X-Gm-Message-State: ACrzQf3BUOk3HRRfRW7DTHHiFxAm+pw51ECPHNrG+cGXGaU4a+AyxGcb
        BdD/GRyMRjMMadSutkkxtjAtsQ==
X-Google-Smtp-Source: AMsMyM5EgYPMdxgtFLrDt2sx/UnyVXwEciT0ZEnEBk7n4Z2lQm7ZJduvccERxZNwUHw/KihxWZeCHQ==
X-Received: by 2002:ac8:7d01:0:b0:39c:ebdf:490c with SMTP id g1-20020ac87d01000000b0039cebdf490cmr4559849qtb.179.1666037320264;
        Mon, 17 Oct 2022 13:08:40 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:08:39 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v5 11/34] dt-bindings: pinctrl: qcom,ipq6018: fix matching pin config
Date:   Mon, 17 Oct 2022 16:07:52 -0400
Message-Id: <166603728601.4991.34439532507416875.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-12-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org> <20221016170035.35014-12-krzysztof.kozlowski@linaro.org>
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

On Sun, 16 Oct 2022 13:00:12 -0400, Krzysztof Kozlowski wrote:
> The TLMM pin controller follows generic pin-controller bindings, so
> should have subnodes with '-state' and '-pins'.  Otherwise the subnodes
> (level one and two) are not properly matched.  This method also unifies
> the bindings with other Qualcomm TLMM and LPASS pinctrl bindings.
> 
> 

Applied, thanks!

[11/34] dt-bindings: pinctrl: qcom,ipq6018: fix matching pin config
        https://git.kernel.org/krzk/linux-dt/c/1379f6750e207b091f4425b53d7b81a902e9620d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
