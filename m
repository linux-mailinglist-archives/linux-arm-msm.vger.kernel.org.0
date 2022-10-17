Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5796018AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 22:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbiJQUIu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 16:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbiJQUIl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 16:08:41 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E447A77E
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 13:08:39 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id l28so8457375qtv.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 13:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFZRIGC9vRpMVTXdazFDBg/q5LyrcVarqy96R1sc3Rc=;
        b=oLtIO2DA6kMK/rcwZPIE5dKRfJMdT8RQhk3fiJAB1uUbNfHX6E3WUAotyJpdyAeOTv
         w65c/iz5QmG+phMrSPtETLEuzaZuzf59+dKj4vqGIuIbkkPk57Qhz2Vho2FgfI7L76RS
         fCwgYaYKp1y0LFH/ytNNCzUAVG9htRQ1Rm6nxHs5QjPykSWCZPehfZePS/jNmTkq/6YR
         /MwXyo7ILP19tkfuqWfeSG9KREjRH00S+w6E2L5d0Ud/qgvuNlhZhnuz1r9C4b0YZrq7
         BQCb1A3D1g9T7HzFC2qqd1oUiQDafBiOeC9Z1Pvy8VKWY3tF0lWdqJlVwAADDXPQ0/eF
         4QsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFZRIGC9vRpMVTXdazFDBg/q5LyrcVarqy96R1sc3Rc=;
        b=PQWXWVLY5Ev6Q0+jXcA8HxnJJ6sq4pNfe1fx9Xj+kOLRTgkroOsGerw8TRe5MaoVbT
         6qcU/iM1DX3fNoafW8ljEUwXDgdpdH2S4ZGU+Gha2VRl2p3JX5Goc4Gp3d6ET7jeUMpt
         jFlm8eVeKQdTGVFT45TYSybEyDM5heTiSFdikpA/KHCjD3VsII+VWUEca2fqFNi8oZu4
         XmssJ44HscXzVQK2J21aFalJP4i+Pcbx1a6jP4CCwhg/bjreojEKxUq/cn9/UvmPK6n7
         w+iwb24Ag8M7zYczQ+zAhOrHGm8gld9LXjblTkAVFR1XvHrumVEmv55BBPU3Dodg5lw8
         pEPg==
X-Gm-Message-State: ACrzQf3zSy166LNvdJ8iT9cfNMkzROKQOjVNm8hsjD9vUB/Q32wkRfru
        xBzbPDjkgARgBkLFBEYkWU7HvA==
X-Google-Smtp-Source: AMsMyM63ltCQv1X93YgVBaWttmuHwBKW/nlkVANll4DQcE9C6zhFY8Y+9lMuZ2VJgnRIy33o6EdfBQ==
X-Received: by 2002:a05:622a:289:b0:39c:b9f0:cb5a with SMTP id z9-20020a05622a028900b0039cb9f0cb5amr10378615qtw.154.1666037318577;
        Mon, 17 Oct 2022 13:08:38 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id m13-20020a05620a24cd00b006ce76811a07sm536793qkn.75.2022.10.17.13.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:08:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, linux-gpio@vger.kernel.org,
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
Subject: Re: (subset) [PATCH v5 10/34] dt-bindings: pinctrl: qcom,ipq6018: increase number of pins in pinmux
Date:   Mon, 17 Oct 2022 16:07:51 -0400
Message-Id: <166603728601.4991.6128094780690798128.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-11-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org> <20221016170035.35014-11-krzysztof.kozlowski@linaro.org>
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

On Sun, 16 Oct 2022 13:00:11 -0400, Krzysztof Kozlowski wrote:
> One pinxmux node can have more than 4 pins to configure:
> 
>   ['gpio1', 'gpio3', 'gpio4', 'gpio5', 'gpio6', 'gpio7', 'gpio8', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio14', 'gpio15', 'gpio17'] is too long
> 
> 

Applied, thanks!

[10/34] dt-bindings: pinctrl: qcom,ipq6018: increase number of pins in pinmux
        https://git.kernel.org/krzk/linux-dt/c/5cf95fcd6d75375195d15cabfaed835e76eec4c1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
