Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90FE8603011
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 17:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbiJRPtt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Oct 2022 11:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231252AbiJRPt3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Oct 2022 11:49:29 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC8E271C
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Oct 2022 08:49:25 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id t25so8906319qkm.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Oct 2022 08:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyEe/NvdoGYWw+mqfgTgWxZ5mMTSKsbW1oY9BVm7AsI=;
        b=AwpYl5bGzYCnVo30EHanAQaV4/lfRn9OLWwD/ry7POOwAhgmqmUkYOLlNv/oJUzaSp
         XnzhdzhxdjRhn3ZeTov/P/uq1v8KvZBr7Glj8oSJhf4heUQKJD5aAJhWgF6p02fsDv/t
         coPJnRaWQ1zYNdBvbzG2xCk+S9i6cGcEtJwfqVABQgxoTnaxQX59KbnN4CtbzP+o9XkK
         /3pk7tWt8X+8tGDhtdnEYB9poFq10t/S5L/XudZQdRsD9epj8ankBq4KKx/iIWEvswgn
         VeNgyczX/N48Lq+BDqzc0JugUSudtbhNx5+hm/J/FOz2/eYYTSyXnmpDxbPdFRmMGvLE
         DEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyEe/NvdoGYWw+mqfgTgWxZ5mMTSKsbW1oY9BVm7AsI=;
        b=dQJJrhCUSH5H8DpMzJY2EMa9Fju1Bp2HLIat8DxT67/8sp/J64YAHEnZ81srokght5
         qumf0xw+LyUiVvzYP1LF1+YA5fpA9ehAaaOsvG+4Nj9FfxYr6ep3DmIAoQUUAPj6m1/J
         CoQxnIygkkJTF2XHB4i6Y+8ZqaIOnSKmw08Gqya8kOCQBcdwK1GkZxlCgl5KW5cMIgNI
         pE/ker/TcKzXVXJcz8EhRpsSBmDF/x8GrTYoS1q7k0NtvTHj05tUye9Bi6uDKONOiKqj
         Soo2XT+gRUNLwxhL92Ed0vtRM7cKFcOVRNVTkzQeA2chE/VSmpaOg4PhltKym7H7ON6c
         /2Ow==
X-Gm-Message-State: ACrzQf0o7pemSqBmvoQOVyi5X7RdHT4eE8dyi9fGlcSpmO1+6nKyJ4lD
        uIxp+HnjbCNBjsroGgrQvWVRfg==
X-Google-Smtp-Source: AMsMyM6NWUs2u20uUKIddTk70xVMcz18RZNsfm8XEnQgaMOWa3xMZY8g/4ZbtD9YoAM+7owN/p9GjQ==
X-Received: by 2002:a05:620a:1b96:b0:6ee:830d:9a04 with SMTP id dv22-20020a05620a1b9600b006ee830d9a04mr2305561qkb.48.1666108165638;
        Tue, 18 Oct 2022 08:49:25 -0700 (PDT)
Received: from krzk-bin.MSRM (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id c25-20020ac86619000000b0039543f89109sm2029202qtp.96.2022.10.18.08.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 08:49:25 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v3 14/17] dt-bindings: pinctrl: qcom,sm8250: add input-enable
Date:   Tue, 18 Oct 2022 11:49:06 -0400
Message-Id: <166610814671.37912.12434662673430232228.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016172212.49105-15-krzysztof.kozlowski@linaro.org>
References: <20221016172212.49105-1-krzysztof.kozlowski@linaro.org> <20221016172212.49105-15-krzysztof.kozlowski@linaro.org>
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

On Sun, 16 Oct 2022 13:22:09 -0400, Krzysztof Kozlowski wrote:
> The SM8250 pinctrl driver supports input-enable and DTS already use it
> (sm8250-sony-xperia-edo-pdx203).
> 
> 

Applied, thanks!

[14/17] dt-bindings: pinctrl: qcom,sm8250: add input-enable
        https://git.kernel.org/krzk/linux-dt/c/23e14d262451e050c146eb94d5aff4b72538ed79

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
