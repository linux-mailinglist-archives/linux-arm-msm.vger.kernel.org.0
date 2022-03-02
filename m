Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C49F4CA4A1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Mar 2022 13:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237398AbiCBMSF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Mar 2022 07:18:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234033AbiCBMSF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Mar 2022 07:18:05 -0500
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12D2939688
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Mar 2022 04:17:21 -0800 (PST)
Received: by mail-oo1-xc36.google.com with SMTP id k13-20020a4a948d000000b003172f2f6bdfso1674521ooi.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Mar 2022 04:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yp9yCzmbZQ001Z5slUUJI+2pkFZXbIsPEspBp/H/XTE=;
        b=bHw54Eajeml+XK3atjqpzYD6DUplWxnM/nBvXNkwYojQk2l/LNOVbthO8D0zQ+P3kg
         MoQV/7Thmv/EC9ibRvxtHvweoq04ekpNuL3++goDbZ8A8ABA91M+Sas1aBLN1LPrxjjV
         1eCIfB2d9VfVxqJpNPQIKaz8ZqVo7bq3FAO9IoOGwir4qH1IeJyxFVesd6zWb3TSorSt
         sZvz9WnD4pu3rQWUp3iWDT3tD7x11k92yAWwFvacNw9wRDOQc1IBcj6P4EaUHTPdKati
         J5p+Mdl6QFhKR4N1Tq5Bjyv7BuPYT4ohXAp87ABYquCOkVhEc9R1OdQibrFdGPfWKowx
         K/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yp9yCzmbZQ001Z5slUUJI+2pkFZXbIsPEspBp/H/XTE=;
        b=LFxM0RTurFy07eMDhkd5Fc18FwGefZJOLbNrYCfvAnFFSdFjC8EcZjViy/5K8blIP9
         d5SSTz69ICwgAW7wE/kU2KPtieeLF8xH4lh1hMLu3ABUotLdUw/R5ywWJkXqDaZx8/pc
         /eQEcgTNkwq1UlDke6VpVcrg9I8RoCl7UZG4ytEXkiYgZff3kx0ROWpT8cyY7+3QyYV7
         lSv2K8NUDetLC7NLJHYw/UXCdxhPxPmCYTlEdc07q5ip0z5Oww/VWBYrA5MueRUXwIxv
         iSmdVmu6KYNppNL3J9JA2Tz7/bhS417Cz2K/yZmYZ+085hhfuzzHYbHbrXkqVtauev06
         6Dtw==
X-Gm-Message-State: AOAM533PCqgWUOGOhqBy0r9Fnbx8Hmg6fEuoT0s7fzUQa7KvQfUppQYm
        jUS27OukJUrFRxw0rHmU7T/9rF9ZtLyRV0NHsc84LQ==
X-Google-Smtp-Source: ABdhPJwjUD1s+Bkkx1ug739gRgv+fN6MVqgiCXuHQsLxV4y2DEPsh9HDQi63/Vp4pPbHWmJDw8O2yX+qV31FHEXblsA=
X-Received: by 2002:a4a:301c:0:b0:2dc:dcf1:8a62 with SMTP id
 q28-20020a4a301c000000b002dcdcf18a62mr15006245oof.7.1646223440380; Wed, 02
 Mar 2022 04:17:20 -0800 (PST)
MIME-Version: 1.0
References: <20220301072511.117818-7-bhupesh.sharma@linaro.org> <20220302000734.GA676465@bhelgaas>
In-Reply-To: <20220302000734.GA676465@bhelgaas>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Wed, 2 Mar 2022 17:47:09 +0530
Message-ID: <CAH=2NtwOT9K9ONZLG0G9LUvYi4h-0feJk5HuLNE0DWVg06ovCg@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: sm8150: Add pcie nodes for SM8150
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, bhupesh.linux@gmail.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, svarbanov@mm-sol.com,
        bhelgaas@google.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Wed, 2 Mar 2022 at 05:37, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> In subject, s/pcie/PCIe/
>
> Since the subject already mentions "sm8150:", maybe the "for SM8150"
> is superfluous?
>
> On Tue, Mar 01, 2022 at 12:55:10PM +0530, Bhupesh Sharma wrote:
> > Add nodes for the two PCIe controllers founds on the
> > SM8150 SoC.
>
> s/founds/found/
>
> Rewrap to fill 75 columns.

Sure, I will fix these in v3.

> > +                     interrupt-map = <0 0 0 1 &intc 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
> > +                                     <0 0 0 2 &intc 0 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
> > +                                     <0 0 0 3 &intc 0 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
> > +                                     <0 0 0 4 &intc 0 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
>
> Personally I would use INTA, INTB, etc in the comments to match the
> PCI spec usage, but grep says that's a minority view.

Right, I see that most dts (especially the qcom ones) use this
nomenclature (although I have no strong personal opinion about this).

Regards,
Bhupesh
