Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 942B46A3E15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Feb 2023 10:17:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbjB0JR3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Feb 2023 04:17:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbjB0JRM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Feb 2023 04:17:12 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AFCE1E285
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 01:11:52 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id i10so5990148plr.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 01:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WAPbpGQmkYePcLGSveUOcE3E3YzvmMSxBjOApNMSSAI=;
        b=aMKRdQuk5Hc0KFTyTW/VUmwz17bhX/wl1Gt4ZBYvtOFKrh1ZBMtgomOwb7xAonImK4
         50JibakLFucZ6bYK/COJ8qcsS9/fd1ZjDq0pBOVG6IWjxFF5q0CDsc8nmz5itBcY2nBp
         nTtnDT396lqVTPgr8akqb56F6yHGo1vOhJB1ozZ1oHsT9fLfWjmOyjR1IQuRJveZa5Fx
         5iFt3A0HJe4l4jj/5+Na0+Mf4OD6NQ8QalNUol+L831SosGPtH2fbULRv1Dq8HpoWuHT
         99nuLA60TEDUgDYcVmDyRBpU9oMDb0K701Ms0dYCZ9qdrq+3t7R8x4NenmzPiBNvmJnj
         kTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WAPbpGQmkYePcLGSveUOcE3E3YzvmMSxBjOApNMSSAI=;
        b=C3GNiFpZNR9iHQKrmg3GeVQJBhm+Gy3yJR5UHbd4+2gxaQl+Y7QWhs0cKXr3Cm0z4B
         3nt0cn0gnlmSbuFIbHAcdheYmZhoZf86B1V1kQHVnHQGeVil5Tu9Pt66XVx4R1ScsO9y
         P3OVzbfVzHcfIsCMw7w2AmB/GalKhMn9SUMtwMfeoG3DxiR+BOL+qCGKrfpzQDJxANQE
         pfQp44sDp5zQ/GM9I0WwcnCAFnBIlVwCNEbiu6UNPS1Ze4ZgMTfrtq5sazgDEjKwJVCx
         BM05v3NdDlga6Ek5oAwM05R/oLoT4ykR7jtj5BW5dWWP2MDoi2RiB2fRjPepY0YYuHEe
         aROA==
X-Gm-Message-State: AO0yUKXxDB6k+W6WGoqQH0JsJqUk4E4YVr7/uULKyVT4Nm6TH526Gt+h
        jh+Z63jur3Ju8HAsmxU0tW7tI93edyO3Dnj3Hi7C2W0MKX8TjUL5
X-Google-Smtp-Source: AK7set9ZHtR3O7FIl0OXufx3VOUJRsLg+eycr1BJ3ljSwdZpvC7vJcxPi4oQRsjtShW/BkBuG7V3lYRmrSWHthvDU4c=
X-Received: by 2002:a17:90a:c7d6:b0:233:d64d:4c29 with SMTP id
 gf22-20020a17090ac7d600b00233d64d4c29mr4481202pjb.4.1677489111634; Mon, 27
 Feb 2023 01:11:51 -0800 (PST)
MIME-Version: 1.0
References: <20230106164618.1845281-1-vincent.guittot@linaro.org>
 <20230106182849.kr47mdgokd4qa6zw@builder.lan> <CAKfTPtBJHWfhXCGojZSvS_DM4+bJnQ9j1GwtE5_YYJFHq9cpRA@mail.gmail.com>
 <20230118232640.qfyuy5n4x33yttup@builder.lan>
In-Reply-To: <20230118232640.qfyuy5n4x33yttup@builder.lan>
From:   Vincent Guittot <vincent.guittot@linaro.org>
Date:   Mon, 27 Feb 2023 10:11:40 +0100
Message-ID: <CAKfTPtDsbtrY1HAmBk+Od4-CbckkmxPgjsEQ_e95+CDh3XmCuw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: correct dynamic power coefficients
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     dmitry.baryshkov@linaro.org, agross@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, danny@kdrag0n.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Thu, 19 Jan 2023 at 00:26, Bjorn Andersson <andersson@kernel.org> wrote:
>
[...]

> > > > According to [1], LITTLE consumes 10% less than big core for Coremark
> > > > benchmark at those OPPs. If we consider that everything else stays
> > > > unchanged, the dynamic-power-coefficient of LITTLE core should be
> > > > only 53% of the current value: 290 * 53% = 154
> > > >
> > > > Set the dynamic-power-coefficient of CPU0-3 to 154 to fix the energy model.
> > > >
> > >
> > > This is sounds reasonable.
> > >
>
> Dmitry, what do you think about this?

What is the status for this patch ?
The problem is still present AFAICT

Regards,
Vincent
>

[...]

> > > >
>
>
