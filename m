Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E01B55C1F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 14:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242402AbiF0WOV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 18:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242343AbiF0WOU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 18:14:20 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C07BA60D5
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 15:14:19 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-101ec2d6087so14741638fac.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 15:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Z6ww6juoCRIbq0+Y6gYs7fGnPeiVmyjMhEvtBazZscA=;
        b=VLg2e9n/ueeBcU2fxR9VinIwBdphy0I6lt0vM9EwP6SkwBaEAxgL0Xcn2ibhztQVOH
         ykyJlrrCcGM/bHaZnb+dfrgWvst8LXQghu6vGg3dUKpo38rKC67HOZ6+QBJTXW8eVyt0
         UZmzZToLeb2/RbwW5tEPrx/pXMdGMTYQeZLaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Z6ww6juoCRIbq0+Y6gYs7fGnPeiVmyjMhEvtBazZscA=;
        b=Hu80afKWe6xUkIfv8CdVzRpglA+beDoh5z2WMPITHdemktQJ/VEpQO4BPlxDL6ZAFl
         Y5syrD0Wj/lhD0WBVQdD3wEFralKf7LT2PL0CmUnLYPkiC99g+J8uTsp8xxEM3fGOhQU
         D38mmn10/fh7a514CtomY2We6evsrw83weahWdeE9XuXRl9NoL631LA7t5Ou4mXMH69w
         xwMm/PPdcXBKWLISHgl/ZlzURWh0s6S+6Z6LHgWUDdFVhL4WJsgK1NOYXBe8+cdwmVAm
         2KM7prnMbvaoI4ul/s6QNv53fXKWJTaxDJFOOqjOGEsLLLy82Wv7y0dcobGUDrKjH6e0
         ZR0w==
X-Gm-Message-State: AJIora9b9pLT7lPldcE64mV/5HOLobioIUfEx+Phbc2MyWXusa9j9dO2
        LEf4hUTw4O2J4bSuvpzc0waLn35+OHwrbzf8JeUg+Q==
X-Google-Smtp-Source: AGRyM1uvlI1kKQnAqsojLGszZzDWWLRpyRDvZU5IV0nMaJKmKmLRyH63v6PKs4oCrRwyIj1eyUJ3xKaPKVkvrjzvZ3U=
X-Received: by 2002:a05:6870:b627:b0:102:f25:a460 with SMTP id
 cm39-20020a056870b62700b001020f25a460mr9001035oab.193.1656368059192; Mon, 27
 Jun 2022 15:14:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Jun 2022 15:14:18 -0700
MIME-Version: 1.0
In-Reply-To: <20220625183538.v14.2.I0977b1a08830d0caa8bfb1bdedb4ecceac709a7f@changeid>
References: <20220626013906.885523-1-joebar@chromium.org> <20220625183538.v14.2.I0977b1a08830d0caa8bfb1bdedb4ecceac709a7f@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 27 Jun 2022 15:14:18 -0700
Message-ID: <CAE-0n539qHJ-7igqC7jVvHudd6j7zmrxGXbNch4DYkS3WWA-7g@mail.gmail.com>
Subject: Re: [PATCH v14 2/5] arm64: dts: qcom: sc7180: Add quackingstick dts files
To:     "Joseph S. Barrera III" <joebar@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Alexandru M Stan <amstan@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Joseph S. Barrera III (2022-06-25 18:39:03)
> Quackingstick is a trogdor-based board. These dts files are copies from
> the downstream Chrome OS 5.4 kernel, but with downstream bits removed.
>
> Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
>
> ---

Tested-by: Stephen Boyd <swboyd@chromium.org>
