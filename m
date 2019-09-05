Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C79CA9CF2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 10:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732587AbfIEI2s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 04:28:48 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45201 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732612AbfIEI2r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 04:28:47 -0400
Received: by mail-wr1-f66.google.com with SMTP id l16so1598222wrv.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2019 01:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=BnCSpMfIGHQOtqoPPENSGImgRzrsNUGfiJvvR+LSCtU=;
        b=uUbzA5G+raebaq6/6elAYcUoNdWp7S7wUhe7DOZleBf/a13itcyQbGBwcGFTOYAz4+
         +rIZMooCuQm0SHURu1zLys+aVYC30KDjiw3DmQXmwVHuqPejwqWbkZpUyG+g2f5gbR1U
         PEfyZ/VtvrvD/yaLOP3VMfLHp40QfxbIvmVqTKAX2GfpNUym/gzcO2YJbr2PEdS4X/n3
         NWX3eShnZerBe6L9nUr9WkWhlywIISSDj1QuanTuFFin7gp/6DzL8TMgMyFj330WyABf
         RJe1JhRBr7bM/xVNxoZRkqKRyKoUSV8ABQxXCAirFbpmykBx8LUb9TR+pJ+7fNwWtsPu
         nS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=BnCSpMfIGHQOtqoPPENSGImgRzrsNUGfiJvvR+LSCtU=;
        b=GblnA7qfOYsMrft5RoVhYnxq+qo+1XouFLTz0oSQLLDvNQd5xiVAqL9pHZ6hE7bGiz
         k/kKPlwD6L87v7nhx1voUGef/g5fLBsZLzT6SXHx2bmOeVA8s7EPimqEbAFUkV4SvFeu
         JY90X3BnGKb+At+vTKaphMRcgq2l5L/y48Znc2daGnbGadpyg3f8filoUX1inIPB8Y9M
         T84hyWegDNysi/U9zle2Aur5IqxBPDRLFChO/kfNkb6RbZIhQ6cu+uOtYPZfvTBhQdiM
         Fjsv/PdHHwnpp91gyfzsdImQWgsMOccQRFNmA3WVvjEsObS3nT54cosb+1cLR6wX52iY
         nntA==
X-Gm-Message-State: APjAAAUs1+vI7GyZO5PYto1cbq0XCTd/KDujmS767uBIg734uDpe/vSN
        BWMebmJqad2KQK5QT+/8X1EWbA==
X-Google-Smtp-Source: APXvYqynALciburMLPvs8ix/HKS4bWOp5tOLFwfln4G1EKGc4EO+lZqj/mWKaKSydxu/4GA5ZtLtWw==
X-Received: by 2002:a5d:6185:: with SMTP id j5mr1395397wru.99.1567672125407;
        Thu, 05 Sep 2019 01:28:45 -0700 (PDT)
Received: from dell ([95.147.198.36])
        by smtp.gmail.com with ESMTPSA id p19sm1331650wmg.31.2019.09.05.01.28.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Sep 2019 01:28:44 -0700 (PDT)
Date:   Thu, 5 Sep 2019 09:28:43 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, agross@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: Add Lenovo Yoga C630
Message-ID: <20190905082843.GA26880@dell>
References: <20190904113917.15223-1-lee.jones@linaro.org>
 <20190904115234.GV2672@vkoul-mobl>
 <20190904204302.GD580@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190904204302.GD580@tuxbook-pro>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 04 Sep 2019, Bjorn Andersson wrote:

> On Wed 04 Sep 04:52 PDT 2019, Vinod Koul wrote:
> 
> > On 04-09-19, 12:39, Lee Jones wrote:
> > > --- a/arch/arm64/boot/dts/qcom/Makefile
> > > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > @@ -12,5 +12,6 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
> > > +dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
> > 
> > Can we keep this sorted, so before mtp.
> > 
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
> > >  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
> > > diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > > new file mode 100644
> > > index 000000000000..ad160c718b33
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > > @@ -0,0 +1,454 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > 
> > Are we going to make this dual? or BSD..
> 
> Sounds good, Rob wants dual license so lets flag it as such.

Done and reposted.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
