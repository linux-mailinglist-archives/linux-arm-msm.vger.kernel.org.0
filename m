Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0359F689093
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 08:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232439AbjBCHRn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 02:17:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232411AbjBCHRk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 02:17:40 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 206EE8F27B
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 23:17:39 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id j25so261364wrc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 23:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQWCRxLUOGk9vWenSLb2l726OplxL6nch8G5bTtSg+Q=;
        b=DzKiBL6NKmHi6mA3hSDIkB1MGUxRmPRMXIHFWknODJUkX0IF4riqniqxMZXjK3pAmG
         HovJY3dMTqeiYA1gGad+P+P4vprvAX0baPplU4gGkjFg4ySFrFMwXQJKmEs6yMkCzHX9
         U9amhjhbPI4QzyKY025hVSvMFbWt1+RTHNkCCRmxnVRfPprrlI9bMkkhj3+eFPccU1mr
         dSijk/rvY/1GXmlMroPphOu99C/LmmmIAB53wv4gRXkTeHJg40v0/TmBPObAfVE+ydmS
         dlY9LoisS7dUFOA55Hv2IKCcJUCGzrluOwzeHIx2oEBezRlPm1T9Gl1h8Bwsi0ZmOD79
         SwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQWCRxLUOGk9vWenSLb2l726OplxL6nch8G5bTtSg+Q=;
        b=7pobJnk8WoPBxM3lOlPX3tyjYvfbtb0M/gUREGs7367GFtLDARAHDXnrfQurhx6//J
         6pvxgXRTx3/5Oldmpjk0L/d08Z6UnlGIGTbNWKmpS6MIP+dn3aQrNGbo3LQ4OSA+lmr2
         S8AcwDJD2cfEzocBcqb/u4XW3qj9KPrpzQeGRRg5v8QNhh2yyf5niBrjSQAyzbci9BsI
         V4DisvntnYY1uCbI8hzSW0jPLlrSyFtyVi6gCun6ud5oTn08PHPW4e9ysZU+kBhMO8AA
         P+FrL7D4LrTE/poq2spYjSgetEGha746dHWbe+wt/OD24kh4Gs/q/t+fERc6Aqca8sjS
         YW2A==
X-Gm-Message-State: AO0yUKUHxM5jNIl50pEZKuwOScNVfevYdexMgd9RHo+omomTgAoowqGw
        tDbduvRLYQMUPuELG2B+fD2TKw==
X-Google-Smtp-Source: AK7set/BKbO76i0+YuWwfSuHxUjriisrBq6dpicmAyWPDbxlMrr26EUMNGjtBl3gFxlzSTc9SvL4mw==
X-Received: by 2002:adf:d0c1:0:b0:2c3:bc2e:757d with SMTP id z1-20020adfd0c1000000b002c3bc2e757dmr5097553wrh.27.1675408658688;
        Thu, 02 Feb 2023 23:17:38 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q16-20020adff950000000b002bff574a250sm1291828wrr.2.2023.02.02.23.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 23:17:38 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Iskren Chernev <me@iskren.info>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Subject: Re: (subset) [PATCH v2 05/10] dt-bindings: pinctrl: qcom,sdx55: correct GPIO name pattern
Date:   Fri,  3 Feb 2023 08:17:25 +0100
Message-Id: <167540864401.6835.1277062511705374876.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202104452.299048-6-krzysztof.kozlowski@linaro.org>
References: <20230202104452.299048-1-krzysztof.kozlowski@linaro.org> <20230202104452.299048-6-krzysztof.kozlowski@linaro.org>
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

On Thu, 2 Feb 2023 11:44:47 +0100, Krzysztof Kozlowski wrote:
> The SDX55 TLMM pin controller has GPIOs 0-107, so narrow the pattern.
> 
> 

Applied, thanks!

[05/10] dt-bindings: pinctrl: qcom,sdx55: correct GPIO name pattern
        https://git.kernel.org/krzk/linux-dt/c/5c7069712c9be01d1bf9061a7ef5ce78df0af0a5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
