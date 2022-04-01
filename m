Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89E184EFA1C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Apr 2022 20:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348721AbiDASuH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Apr 2022 14:50:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235174AbiDASuG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Apr 2022 14:50:06 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCEDC220B30
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Apr 2022 11:48:16 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id t21so3666011oie.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Apr 2022 11:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=D9fxps+Ewc6UANsIutZd0wuOMYK+iuzQT7EbeWRMeUQ=;
        b=X0Y+wDvLjYzdPycS2xcK3xyquS/nSm8FFz4SNtheTeLLhWUQbT4tpNhTzwHlQA1Ml1
         kaDwoXUElWpe1nM4Dv4ZTCscEz/t9WFLfqQWwyV2um+pxmIqUgEIEv8oY+osc6jAjqgc
         0HcnQRw5UDzHwiPbArFgO/cMHH6+aMrT1IGpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=D9fxps+Ewc6UANsIutZd0wuOMYK+iuzQT7EbeWRMeUQ=;
        b=ljvO4vQlgIrKpS0XiKdCrOiGpmvqjD2TaMyb2XmO02e+6N67DGnmyoUoSugujQT1ZT
         wvQE8iW6anYgVS99m1OqayLvPYhDnxkfK0bFJ1TPYyA8AYN4EHLfCcZRn8iZyhK5M6rC
         1BnclKKiuLqj1xmtddkUfWh7my5llhoPN9CCpa4VMl/VZ3iMWbSu1WL/f4vwfe9shouM
         bnOkbi3n6OxetNw/y4SzWYzBR8/17tRRfKWmt1QwAQzWCdJRl0hpdnWLpo8rLLqacaAI
         tqlN8F93Pti6AyjP8MoLFhWN0qCyZnmql2XIwzuRKS2I9bUBMgUz0CGE0MJoAB9ImAuy
         scwQ==
X-Gm-Message-State: AOAM531OfbgrK2IqYQ0gJTVy9wdQKzHOEbvn6i25d+OUOttSD/qMZ0ul
        A9dFavuSP/sWy9J5MYebZKE7F7pN2Ll45HpwgUWs07pPtp0=
X-Google-Smtp-Source: ABdhPJz1TQRc5Yb6vyKTkezkbj85ZwfeXqoZaXKRnSn4CcsOsS2zY8ZrRcoyLi5/lOZh2VukBMnldkdiQH4XSVzbjFI=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr5109437oie.193.1648838896186; Fri, 01
 Apr 2022 11:48:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 1 Apr 2022 13:48:15 -0500
MIME-Version: 1.0
In-Reply-To: <3b4dcf83-bb13-2159-d7c1-f0aadfc53566@quicinc.com>
References: <1648209491-30165-1-git-send-email-quic_c_skakit@quicinc.com>
 <1648209491-30165-8-git-send-email-quic_c_skakit@quicinc.com>
 <CAE-0n511eQTnJHqt0B=uiiSjigy-RHZ52YuYz4kfEpX1x6CMfw@mail.gmail.com>
 <094d8faa-c42b-be1b-cf92-04232d618a3e@quicinc.com> <CAE-0n52CVuc_kQbpwEnHEEODS8jPt52v6P=gAdVxqenPu4ehkw@mail.gmail.com>
 <3b4dcf83-bb13-2159-d7c1-f0aadfc53566@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 1 Apr 2022 13:48:15 -0500
Message-ID: <CAE-0n5282FJ01We_mRfN69mYJk4NKwjAZvnTG9RVOyt__6xVfg@mail.gmail.com>
Subject: Re: [PATCH V8 7/7] arm64: dts: qcom: sc7280: Add pm8008 support for sc7280-idp
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya Kakitapalli <quic_c_skakit@quicinc.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_collinsd@quicinc.com,
        quic_subbaram@quicinc.com, quic_jprakash@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya Kakitapalli (Temp) (2022-04-01 03:48:46)
>
> On 4/1/2022 2:48 AM, Stephen Boyd wrote:
>
>
> >         &pm8008_bus: &i2c1 {
>
>
> but this still needs to be "pm8008_bus: &i2c {" right.. no '&' before
> pm8008_bus.

Correct. Thanks for spotting my typo.
