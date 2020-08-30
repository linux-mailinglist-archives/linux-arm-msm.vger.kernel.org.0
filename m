Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ACB1256ED6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Aug 2020 17:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbgH3O7v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Aug 2020 10:59:51 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:34578 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbgH3O7t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Aug 2020 10:59:49 -0400
Received: by mail-ej1-f65.google.com with SMTP id d26so5244819ejr.1;
        Sun, 30 Aug 2020 07:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4JH9/SOJLk4C8B9KMWxnR41Bpxghy1z2d/Z0vKdhKiA=;
        b=g+C/IjSKPL0ftloAi3JopkGhhwW/ZofC4MypIqQxJfgETq6YOG5zDF62eopfi2ZPm3
         HtaJgcMFTVQFgNx7aFGyNy0Enw4wmCl6gBwmzXUaAHvRLOLQfKYCVj9pupgVnbhaTdeJ
         2XC7FxKy0VC/jrgI98jjA7AaqP0KNflWGi6st0YHiBQh+MK37RckMukeSBz4zmS/QRKu
         8fqPd1xrLh96Y3Q/lc14OhrbOsjBYbW0vvQj3ePnGvSNlMMVXNIAMoot10/pUIHizYnT
         IuDozhxi7/+JaxASZAml1E58ETcKM2aVq4QidDoUqUY4wNmFT2Jv304fd4C7+MvG3Bu9
         LhuA==
X-Gm-Message-State: AOAM531vOmcGZC2tFEm+1He8C6qGg3MXiyFrLO0C3V2KL9mQSOAaQOaq
        y1x7JIelC7Nl2qyO8CzNP1P1VIfzQbE=
X-Google-Smtp-Source: ABdhPJy0SE8dsxT7p3E2zGARXI1/EciroZ+sp+CGIr9ly9DGw7DB1BHOOI+oKccl8VMT9zVA02hYbw==
X-Received: by 2002:a17:906:5681:: with SMTP id am1mr7823925ejc.337.1598799587199;
        Sun, 30 Aug 2020 07:59:47 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id h19sm5350686ejy.79.2020.08.30.07.59.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Aug 2020 07:59:46 -0700 (PDT)
Date:   Sun, 30 Aug 2020 16:59:43 +0200
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
Subject: Re: [RESEND PATCH 1/5] ARM: dts: prima: Align L2 cache-controller
 nodename with dtschema
Message-ID: <20200830145943.GD31461@kozik-lap>
References: <20200819175853.21492-1-krzk@kernel.org>
 <20200820093053.GB15884@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200820093053.GB15884@kozik-lap>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 20, 2020 at 11:30:53AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Aug 19, 2020 at 07:58:49PM +0200, Krzysztof Kozlowski wrote:
> > Fix dtschema validator warnings like:
> >     l2-cache-controller@80040000: $nodename:0:
> >         'l2-cache-controller@80040000' does not match '^(cache-controller|cpu)(@[0-9a-f,]+)*$'
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  arch/arm/boot/dts/prima2.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> 
> I forgot to add the tag provided on previous submission:
> Acked-by: Barry Song <baohua@kernel.org>
> 
> Best regards,
> Krzysztof

Hi,

Ping, any comments here?

Best regards,
Krzysztof

