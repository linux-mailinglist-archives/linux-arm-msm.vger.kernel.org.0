Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D058E4F6709
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 19:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238829AbiDFRYm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 13:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238875AbiDFRYe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 13:24:34 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E694B4BAE
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Apr 2022 08:23:12 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-de3eda6b5dso3317048fac.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Apr 2022 08:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=hiSfOStXccjbf1AYzjiGRDT1g1SFjOKXyv+eLAAqR4I=;
        b=S8QZvZFAQKRsGAYTUOeGLbGgTqU9p6NgODt08xv+GJQH6OOxo3vbZVmfWMHv4CQsrv
         sreWgOA4uSXOeHZ5H4VFNs55oW3/EjipqQkJxdYnWoYkoxWoERMNuYKEBMxwI2KmYcWG
         PGRDKJx7La2RUWEju8pyKfnGl4dktn6Ha0V5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=hiSfOStXccjbf1AYzjiGRDT1g1SFjOKXyv+eLAAqR4I=;
        b=F9FHL+/KSoFPllG3D/O1jnUjDXM6tPAhbiusAAgj0x00lUX1pvzamQPJwOEbq5NIVW
         +7UpL8RrItw6vhIsnwcnvN65zqot+wvwPhyHz4lT1VrIpCA117CJRMY0MYSbMVHdD/E7
         aAAPbCkNqwSKrHCHbDfPCBgVenX583ha0gZ/tANAzP/XvdAZcIEMtwSOMQW/sQlfsoG3
         ukh2mL0FyYv+C5ZdC1kG5RnaG+/GW3/o9nto4SJDaSzoMierfb8WZVscYtKBgKvJp2XH
         gK7OQNsyHz1maPoZp9095RI+61NmdvKAOQMmVLteEC9FaKiBlfNxxML/xJe+QqV2Bxbs
         Ficw==
X-Gm-Message-State: AOAM533mbAf31poq+lH/EWmhIRszBfWLvKH8VvwzDV3JATzDnzQaF3tU
        mFVo8ptZdkFIc6HHjpeWbSw5iakllRabqBE6caT9Nw==
X-Google-Smtp-Source: ABdhPJyAXhv6StedGOtJuWf7fO5MgYIPzySA3+7UPCtieqRLefs7juSZxzHlMkcvHchGKDyCITgazKVuobCc5PuwwYA=
X-Received: by 2002:a05:6870:e314:b0:e1:e5f0:d777 with SMTP id
 z20-20020a056870e31400b000e1e5f0d777mr3969864oad.193.1649258591945; Wed, 06
 Apr 2022 08:23:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Apr 2022 08:23:11 -0700
MIME-Version: 1.0
In-Reply-To: <Yk1B4f51WMGIV9WB@sirena.org.uk>
References: <1649166633-25872-1-git-send-email-quic_c_skakit@quicinc.com>
 <1649166633-25872-5-git-send-email-quic_c_skakit@quicinc.com>
 <CAE-0n53G-atsuwqcgNvi3nvWyiO3P=pSj5zDUMYj0ELVYJE54Q@mail.gmail.com> <Yk1B4f51WMGIV9WB@sirena.org.uk>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 6 Apr 2022 08:23:11 -0700
Message-ID: <CAE-0n53Cv_bR92M64dhdnDge_=_jeOs4VZzDhUkksN90Y7rgog@mail.gmail.com>
Subject: Re: [PATCH V9 4/6] regulator: Add a regulator driver for the PM8008 PMIC
To:     Mark Brown <broonie@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_collinsd@quicinc.com,
        quic_subbaram@quicinc.com, quic_jprakash@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Mark Brown (2022-04-06 00:31:45)
> On Tue, Apr 05, 2022 at 02:09:06PM -0500, Stephen Boyd wrote:
> > Quoting Satya Priya (2022-04-05 06:50:31)
>
> > > +static struct platform_driver pm8008_regulator_driver = {
>
> > Why isn't this an i2c driver?
>
> It's a MFD function driver isn't it?

The DT binding shows a single i2c node at i2c address 0x9. The
compatible for it is "qcom,pm8008-regulators". It looks like an i2c
device that is dedicated to providing regulators. I'd only expect to see
an MFD if the device responding at i2c address 0x9 supported more than
just regulators.
