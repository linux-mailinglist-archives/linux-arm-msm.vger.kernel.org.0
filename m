Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4917B2681EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 01:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725978AbgIMXvY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Sep 2020 19:51:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgIMXvW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Sep 2020 19:51:22 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80CDBC061788
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2020 16:51:22 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id t138so1239235qka.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2020 16:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XLWo34hVmrRnf5YKo6+XZqj/MmF2UL5Q5POaUTSSFD4=;
        b=Oxb/XftV9EJLx2usmOAADNyqYCAUr9ixeBY4PxTr9dbotHOeaxq7pDy6oMZhPlPqvS
         JpF7WsxeZ2vlWZsk9CRndihWd0BD6+Xz33ANgiZEfT/0Z4a641vatesd4TM3XcvdbF+U
         uCVzQY/MYDik5l1IVpOd+wvmUcrM4aVmGcBaVYu6ynXh/Ln4o2ZXMq4Y4HG/2TgiSGqg
         e7W0xODdKoBsAvbJ+cQmvAOIIs8tm4Io2o3TtfO6EHaKFK6iaXzIpp5hIJ6hhGspBX01
         WOa4vPHS8jGQRSyGfKaPIUSYvYBlfV5YQ4J+vquXArURpkFQeeiUYOQRh0PnEiYo2sJ+
         kfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XLWo34hVmrRnf5YKo6+XZqj/MmF2UL5Q5POaUTSSFD4=;
        b=AQ1JFYQRw7XWt5yTmAHD5iKcC8LE5k5/WtXdgplpTJ6PfyZsN1dc9MGcV85K4bFe+2
         l5fGKYhoGO0f7C3u/BWObpwTOEjOcqzlIiIXQh5AhamjtTd3xUtXTdPiP+gX/al+96O0
         SO4it0DtC9XEOutKmLb7cm2TedfRGeehe1vguYAiywqHUuo4Nx28JwD2tsrFoFUBk1i5
         BluWwlQhxDItZIPVbqkXlFGioWm5899nuXNPEjzoiITOv8JyHNPZUh/c0brgcpT0Myfe
         LqXIl2bK3e8O/B/VEFS5Z2b7fz8uVyvC4vSPAPQ6b6j+dWazob/mp5Pb7MHFYs6NhcAh
         SZLQ==
X-Gm-Message-State: AOAM532vUzn0qA9Cg+spCB76R8S2POhcjg3AkzITX46oDG1n10EcCKYv
        mStlsjps7icCiL8CVw/1IgA5O5U31MmXCg==
X-Google-Smtp-Source: ABdhPJwyMYMBmANq3AG/NorWJ3U6hjr9n5RXkcGdotOIi3gXPMKLWDHHS8TA2LSD1U+xVfHdpE0UvQ==
X-Received: by 2002:a05:620a:958:: with SMTP id w24mr10923317qkw.65.1600041080727;
        Sun, 13 Sep 2020 16:51:20 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id u13sm12022354qtv.57.2020.09.13.16.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 16:51:20 -0700 (PDT)
Date:   Sun, 13 Sep 2020 23:51:18 +0000
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        Johan Hedberg <johan.hedberg@gmail.com>, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, rjliao@codeaurora.org,
        hbandi@codeaurora.org, abhishekpandit@chromium.org
Subject: Re: [RESEND v1] arm64: dts: qcom: sc7180: Remove clock for bluetooth
 on SC7180 IDP board
Message-ID: <20200913235118.GD472@uller>
References: <1599734980-22580-1-git-send-email-gubbaven@codeaurora.org>
 <C8D04890-4F62-4EEB-9113-BAFFF46E32BD@holtmann.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C8D04890-4F62-4EEB-9113-BAFFF46E32BD@holtmann.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 11 Sep 07:11 UTC 2020, Marcel Holtmann wrote:

> Hi,
> 

Hi Marcel,

> > Removed voting for RPMH_RF_CLK2 which is not required as it is
> > getting managed by BT SoC through SW_CTRL line.
> > 
> > Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> > ---
> > arch/arm64/boot/dts/qcom/sc7180-idp.dts | 1 -
> > 1 file changed, 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > index 4e9149d..b295d01 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > @@ -348,7 +348,6 @@
> > 		vddrf-supply = <&vreg_l2c_1p3>;
> > 		vddch0-supply = <&vreg_l10c_3p3>;
> > 		max-speed = <3200000>;
> > -		clocks = <&rpmhcc RPMH_RF_CLK2>;
> > 	};
> > };
> 
> is anybody picking up this patch or should I take it through the bluetooth-next tree?
> 

I've now picked it through the qcom tree.

Thanks,
Bjorn
