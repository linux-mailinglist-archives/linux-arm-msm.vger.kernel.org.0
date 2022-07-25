Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A12DA57FAE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jul 2022 10:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbiGYIHS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jul 2022 04:07:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233490AbiGYIHR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jul 2022 04:07:17 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C78412D17
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 01:07:15 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id w8-20020a05600c014800b003a32e89bc4eso5847497wmm.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 01:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ei4IN3pWJL6S529jqu4plqHvs9/ZXqYQOtcCcP+gfrs=;
        b=j+14HQJX0q7D+pKdSwau+5pYW5v5wZKRmqmqP/P0viNQACC00Et588jaRNBzEM3rSo
         ftmFvEsodads2w3JfcQsKGv2jljs2pa4cgypbnHqVmDps4+0/Y9vqFywhXwDsKXL3Yy8
         HOc2R5V4Aafk3qQojTzcEfMsEsc66fBXPz8jnL0UObVlkVfz98DBAPcdZuOwC+GDiOCi
         tzkvZvRuJNMWsiuaaSm71CFhuuJVR20l9xUF/l0ahc3TbjGNNUMsWwFnSQJc/AmRXGlk
         DOOHqzOGSaOWPxuV5CCB2OlVmpMsu8eNdfBSTacvDC9P9ZqD1hkQfdp3AtgL2dBIqdSb
         ysLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ei4IN3pWJL6S529jqu4plqHvs9/ZXqYQOtcCcP+gfrs=;
        b=h1AfdGuHKhXkNNfhFgoHTtguLoFII3tf1xj1KHgg9ZbH9RLIcakxI8mY9S7eHhL7TZ
         /2fq+kOB+C9Ybral85N3IqCiJmNc5zV6RqyOLWfINpHtxAGkumNha3/eFauPndf1GedO
         1ZAA3UCYDvOKRFS1yPPhi1QkFSrqhVHH+IEwgZNDJ7Ia2BC1KVU6nvNOyK8QJ284AXWa
         SLUZOFGSGHLRFPZ07qmU0nLWVJYcaSR76ETCSSxR5dmSPfqxb5oF+wZhh+x3Xf0VB4vg
         3nnrnkKUuvUZ3uq/Hn8BnmIP84V1OB3/DX1uRKHXDLP23rrj2Q56rzKNn/8eafXoDehF
         hXUg==
X-Gm-Message-State: AJIora8A9Wkakl7SJrV9A3wHERa0pSY0b+ElXV0ptz4k+s7uezBgY5pl
        I3vPY/4+wdo472t2TRhZi58+gv8dJPh6dw==
X-Google-Smtp-Source: AGRyM1uwvxERygcq72GBlIGQLczjSq8FsItgsb9MgxuFoM5enPP+J71UUB4mqOmEoQobjWDkIUrjJQ==
X-Received: by 2002:a05:600c:892:b0:3a2:fb4c:2381 with SMTP id l18-20020a05600c089200b003a2fb4c2381mr20868720wmp.89.1658736434134;
        Mon, 25 Jul 2022 01:07:14 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id b12-20020a05600c4e0c00b003a2fde6ef62sm13676692wmq.7.2022.07.25.01.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 01:07:13 -0700 (PDT)
Date:   Mon, 25 Jul 2022 11:07:12 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: Increasing the maximum message size
Message-ID: <Yt5PMPn1dxKibqAK@linaro.org>
References: <833fa178-22fc-c47c-a7b8-2444de3bf9cc@somainline.org>
 <20220724064311.D04BBC3411E@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220724064311.D04BBC3411E@smtp.kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-07-23 23:43:09, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2022-07-23 04:44:32)
> > Hi,
> >
> > when sending new clock drivers for Qualcomm SoCs I've been repeatedly
> > getting a bounce with a reason of "too long (>100000 characters)". The
> > drivers are pretty big for one email, for example gcc-sc8280xp.c has
> > 201071 chars, but it only makes sense to add them big-as-they-are,
> > because there are simply so many clocks, each of which needs to be
> > defined as a struct with its properties set correctly.
>
> Maybe it's time to collapse the structs into macro definitions.
> Probably a decade ago I expanded the macros that we had because we kept
> modifying the struct members while settling on something that described
> the clks. Now it doesn't seem very useful to do that because the structs
> almost never change. Certainly the struct members aren't changing
> rapidly. I'd start with a macro for branches, rcgs, and plls and see how
> small it can become. Hopefully there aren't many parameters to the macro
> so that it is still somewhat readable.

Actually, I was working on this and have something ready to be sent. I
started with sdm845 couple of weeks ago. I'll send it today as RFC. We
can continue with other platforms once that has been accepted, if that
is OK for everyone.
