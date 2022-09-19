Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C69C5BCB12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Sep 2022 13:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbiISLxE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 07:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbiISLxD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 07:53:03 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 336692B266
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 04:53:00 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id 13so34828791ejn.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 04:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=nT165KwVdFzwm9eF9hv47+7oQR3xfKBQSGECoZbQrwQ=;
        b=yxgCOqzLUyZrbNS4xKX5orKTBMvizkj8LApdrsboHhv1LbRJsGmwXA8RGbPu3gBBuh
         FedWCjxfgxuqKWro5LoPnoe3uzhqQB/ZerkOoD9pRkTkAfS9FTvSU5tpyLNoeK32LfEx
         Ypyx8Wrwn9iVFWdoiWr0/wRotNyfEZ132Ie443HVgprSsl2dE2weO7eimWWW6CWzTCLj
         kib2TaC0B9G+aTGGOHtFDfg/3WEjtyxfzvur9/gSU8g8fugCT6EUxHgOVKcoYSHzkaJp
         tnc7CYpvrdFe73phEFjpXjxJlQxep7v13tdy/Me5WvgM7VsuuQHw1lBt+11ZMfNJ8AVU
         bO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=nT165KwVdFzwm9eF9hv47+7oQR3xfKBQSGECoZbQrwQ=;
        b=dCKPooAswoHu59Ntxus3H4RxIRwlJG9c8qrMkqpIAY50qVriRql7+YzmtD0Ro5yBkc
         mgH0EYd/HeipBmoVLvfuhATLSmwKGEWmKRm1PhXCSR7BxgCRPbxPlX+eiU7vGoq2nH7T
         N1kI0KTVgKpoO+C54+KoIQ7rRo6xl9Frbq/WDLHqFS02wDPQbN3df3Q/UMNr3VznnH4H
         8Gy56cJBun8iTBYMlt0fZ8BbPj/VAKMDnXtNtXul7d+qzJHzo95BmMQH0YODrDuwdo2O
         +yYMO6JC3PyH8Bo/rGcu7/7G0W6Rfph5DJS2xwxFDsV67yGdS/Qxo3PcwtYL7GM4HCjF
         x+rg==
X-Gm-Message-State: ACrzQf33S0uCj7yrAd6t5Kwa5sAzoC/mpyp6RNjxdTpAzqDkdlIlwmMS
        KC9pt6yT8CmtmxYrzB0sNo2ekqHSd7HYbGr668g7Iw==
X-Google-Smtp-Source: AMsMyM5ygi7n4k1vCY3ONaJjWG8v/roOjtXTbkg/tYw05LbaZacpnV8RloAcNYT8n3C/14MsyoxS3UvBxJzajdsfuqA=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr12779573ejs.190.1663588378814; Mon, 19
 Sep 2022 04:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220912210624.4527-1-quic_amelende@quicinc.com>
In-Reply-To: <20220912210624.4527-1-quic_amelende@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 19 Sep 2022 13:52:46 +0200
Message-ID: <CACRpkdYb+RRspmF_tDrD8ESQCNBBNaTDXbVuPhW-keWJ1owBtg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Add Support for Qualcomm SPMI GPIOs
To:     Anjelique Melendez <quic_amelende@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_collinsd@quicinc.com, quic_jprakash@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 12, 2022 at 11:06 PM Anjelique Melendez
<quic_amelende@quicinc.com> wrote:

> This series provides support and fixes for Qualcomm SPMI GPIOs.

Patches applied for next!

Yours,
Linus Walleij
