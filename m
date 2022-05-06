Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25FE451DACE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 May 2022 16:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239216AbiEFOoI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 May 2022 10:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442406AbiEFOnz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 May 2022 10:43:55 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29B296B09F
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 May 2022 07:40:12 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id h10-20020a056830400a00b00605e92cc450so5025730ots.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 May 2022 07:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=SLJr29oQD9V0WDGNTqC8OFYwveCa71WIaF791YmICNE=;
        b=Z+x1+pmwmAq2ER/uo1qPjQwVNRhd9otevgNT1BRmkpXu3MV6spGN3ZTWTHSNF5FupU
         CEZBN5MyXkL5906WArWu0aAAcnMolw2q3wSxxk4Hl4R++U4G0OSK6Flv0mR0bj487M+v
         cWbmT2boWjdgWtIfll5ZHZ62gChjt/v18pOCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=SLJr29oQD9V0WDGNTqC8OFYwveCa71WIaF791YmICNE=;
        b=TswsP95l5tyR1JJXdddzNPzugUweP8BmHeOE7Rde/HDzl8X0Cv99gYycVnDu1k2qIn
         NCfCZ5S1nnrbI0C3Se32ZXnLAJqVka+CT+ZreEqjCs0oCDsTD+jX+Fu35mvMx04rmBzP
         sjWutvsDhhKqj/XOK0IQXwgFKo/bU7dRBZB1UOrJETL4lkuXvA4tRwcLMbH7YzM49dcl
         gfQaQzUYyebxJQHqHPM3FZPgTKK+eWfyb5Ai1qKqJTxV17Ma3mDdq1qBE/EAaOVX9wUg
         7j31EEr8t6ndWuf6/5U7PgzHfHOeBhTnUvYASehfwxcmb/mGOKrkEbajpz6QAJE7T6FF
         vZIw==
X-Gm-Message-State: AOAM531csiLKN+dj5gRuXgToxr/wZKxtB/8S6kSOYZ6dUm5Fak5GYD8X
        DFoleCSc8yRFT4/28IkzrPsLHkTgNCQ88l87g5X+kQ==
X-Google-Smtp-Source: ABdhPJzzZz5Um/8253ru7CErtnadZ6C1BnNP75RW0WRnOXr7CLee8/DicRB9jYSiN00xvuuCutvS/1yR96l5bjBW/RA=
X-Received: by 2002:a9d:20a1:0:b0:5e8:d2b6:f63f with SMTP id
 x30-20020a9d20a1000000b005e8d2b6f63fmr1081324ota.159.1651848011178; Fri, 06
 May 2022 07:40:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 6 May 2022 10:40:10 -0400
MIME-Version: 1.0
In-Reply-To: <1651742739-12338-4-git-send-email-quic_c_skakit@quicinc.com>
References: <1651742739-12338-1-git-send-email-quic_c_skakit@quicinc.com> <1651742739-12338-4-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 6 May 2022 10:40:10 -0400
Message-ID: <CAE-0n51MTR36bk=77iwo4umkaj4xjb-HjQ0XkrKvaeLj08ux3g@mail.gmail.com>
Subject: Re: [PATCH V11 3/9] dt-bindings: mfd: pm8008: Add regulators for pm8008
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_collinsd@quicinc.com, quic_subbaram@quicinc.com,
        quic_jprakash@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2022-05-05 02:25:33)
> Add regulators and their parent supplies along with example.
>
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
