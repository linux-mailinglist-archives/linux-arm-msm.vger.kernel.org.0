Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7A655E3DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345997AbiF1Mzf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 08:55:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345976AbiF1Mzd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 08:55:33 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C83E42F3B5
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 05:55:31 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id v38so11340421ybi.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 05:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zmWEZn/MDT8BVlOf2j/0dbSY8mXMBqqiVxeYK+9B6lQ=;
        b=JhUf9b2e4wqWDqQ8nebU+X8F21tnUWwiBkQ3caAT8ggv5nqGzZBBSIs1fyVqGmgTSz
         P0bx2uU/Um+sT7/JMfPoyd+TMY/C0h/HDqX3iWSan4x+3gVgOFqQqxl7uMlO4YALgj1P
         axnMd8R2aq8xen9gsHvKZXoB+QewakVfuJ8MoMEhQLsS7rq+b6tDv+KHy0ssO7jdghqo
         YO21b4nExNXO9RgjmR71guAnd6SFsChnxgBNFeKm96PNLhb4OobEGJJroUD1rrau/T8h
         1IW/3R1VEMOEupRLy+W8KoRPDUYOoNLb+cC2bED7huckB8a5gxeW6VgpiKBa8TJCGma3
         hCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zmWEZn/MDT8BVlOf2j/0dbSY8mXMBqqiVxeYK+9B6lQ=;
        b=fkbKRvV5L2nnM5tENxYoH3dXEsLZ7E3UkPSSr3DvgfIkTxh8/vyr+FogY6eEmfbdbw
         ODy6usmPi/3apM3Ie+41cvvUxEELOCJ99XUwqMUeFbpuxzBEPseawSp3bpYaewiWe8he
         hblvuJLa3CaloUBpyL6P9xwjB0I8M9wry2z5ctOcUd07X+kUkSRo8q6f/k7nljGlNW9E
         wiMRWr5adMQ0AMgbs4JPpH3G9QEtE5zYfzgCFkzeC3ktOO9nmmma5hvNKSrOHsNyRauA
         aC+zzqJWUPa6sq6zG9l0AZVqMC8BASQpYrevkmNbeX8U5IYp4LJhKXXupCX5Cxniy8D9
         qOzA==
X-Gm-Message-State: AJIora8hLBQ3y+EcFz8GUTdExNWMIfwjz8eWnzgiEPUnnTrsmQExUgTz
        qsY75W38G5XGZfYJh4vTUlMiW6u5t2oohx+phRuSeg==
X-Google-Smtp-Source: AGRyM1tsaB9tgNaMSUle5S5+neod2eZjuTku0yKoAV6tHrXr5lM2cYOKc71QeSQjdMvN2lSTcPjYvD5JGxKdrp2cnJY=
X-Received: by 2002:a25:cac5:0:b0:66d:2c32:8593 with SMTP id
 a188-20020a25cac5000000b0066d2c328593mr2819682ybg.626.1656420931032; Tue, 28
 Jun 2022 05:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220621161126.15883-1-quic_srichara@quicinc.com>
In-Reply-To: <20220621161126.15883-1-quic_srichara@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Jun 2022 14:55:19 +0200
Message-ID: <CACRpkdZs=kwFciZaNGWR3t=Q4Vy08qg6UNH6obcyubC=6jkYuw@mail.gmail.com>
Subject: Re: [PATCH V2 0/8] Add minimal boot support for IPQ5018
To:     Sricharan R <quic_srichara@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, catalin.marinas@arm.com, p.zabel@pengutronix.de,
        quic_varada@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 21, 2022 at 6:11 PM Sricharan R <quic_srichara@quicinc.com> wrote:

> The IPQ5018 is Qualcomm's 802.11ax SoC for Routers,
> Gateways and Access Points.
>
> This series adds minimal board boot support for ipq5018-mp03.1-c2 board.

Pretty cool!

>   dt-bindings: pinctrl: qcom: Add ipq5018 pinctrl bindings
>   pinctrl: qcom: Add IPQ5018 pinctrl driver

I'm happy to merge the two pinctrl patches separately to the pinctrl
tree if I can get a review from Bjorn or Krzysztof.

Yours,
Linus Walleij
