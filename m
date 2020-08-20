Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3AF24B282
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Aug 2020 11:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728251AbgHTJbo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 05:31:44 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38410 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728227AbgHTJbX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 05:31:23 -0400
Received: by mail-wr1-f68.google.com with SMTP id a14so1358797wra.5;
        Thu, 20 Aug 2020 02:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=b1bNFiZgiP0kbWWwCg17EvjL33DK3FeILPEpJ0Dhl/Q=;
        b=uA9edRSq25TmKCGVnHYoP5cHkYNbN41oRl3S0afOBoDXd5TLtLaExA7B33xt2MhSiJ
         tynMT5tmW36TyXYGDl7xffBHurmHwGax/+S6tjoTX/P9gN3jD8iF+krSUTP/Hc+Kk6mR
         lcKyg3SujxHl29mGtm1vGl/ZEgup7NFXxpjA0xaB6pJafcQjQQAJvaV3jgzhtVrZOa6+
         zcPq0Y85hXtTTnLPVNIdJ4nG5+hiTBS/wHrHZ94ysK23SZi4Nft5nGZAJWpLaIAtFgcQ
         dbX8ewA8PZpR9odN9OP6q2a6jOLHFnfcoC3tq0tn2S7siySvVqziRATeKZE1PBkjbWfy
         3GHg==
X-Gm-Message-State: AOAM533ZBSqaMRM6oNuol5vyFNIOeR0XYYluJov1DSv2EPYXr9WhnORU
        3b1vtAvJ5tRtVBDlqXWTY6Y=
X-Google-Smtp-Source: ABdhPJyp9/7bHjGRhaR63apXcQFn01iJGOXs1Poxb/moYU7gYPKQXpIuQVliKswmp5fn+tzr2fBnTw==
X-Received: by 2002:a5d:4c45:: with SMTP id n5mr2319721wrt.68.1597915881386;
        Thu, 20 Aug 2020 02:31:21 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id z7sm3102928wmk.6.2020.08.20.02.31.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Aug 2020 02:31:20 -0700 (PDT)
Date:   Thu, 20 Aug 2020 11:31:18 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Barry Song <baohua@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Mans Rullgard <mans@mansr.com>, Jun Nie <jun.nie@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [RESEND PATCH 4/5] ARM: dts: tango: Align L2 cache-controller
 nodename with dtschema
Message-ID: <20200820093118.GC15884@kozik-lap>
References: <20200819175853.21492-1-krzk@kernel.org>
 <20200819175853.21492-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200819175853.21492-4-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 19, 2020 at 07:58:52PM +0200, Krzysztof Kozlowski wrote:
> Fix dtschema validator warnings like:
>     l2-cache-controller@20100000: $nodename:0:
>         'l2-cache-controller@20100000' does not match '^(cache-controller|cpu)(@[0-9a-f,]+)*$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/tango4-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I forgot to add the tag provided on previous submission:
Acked-by: Mans Rullgard <mans@mansr.com>

Best regards,
Krzysztof
