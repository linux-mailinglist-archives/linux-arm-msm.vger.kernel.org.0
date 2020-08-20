Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15D7624B28C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Aug 2020 11:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728212AbgHTJbQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Aug 2020 05:31:16 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33543 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727034AbgHTJa6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Aug 2020 05:30:58 -0400
Received: by mail-wm1-f66.google.com with SMTP id f18so3370707wmc.0;
        Thu, 20 Aug 2020 02:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Hma56AddZUeGIsGjGqDeo/64eZyNigdifLybdInzONE=;
        b=aXG8m8gjj/HQ7d5ZXshy23qFDkdPBCx0tb1dI6169BpbZdl5cSU0yy4ycEQgK/ZpEq
         NkJwIg+GIlJTC22rYoEHoAHqzwWhNrZ8t8LFoXgusyaxBASEJHp6L742USCRYu7S8UGY
         fVYFjdbhPML2eq8aYF4cYBSPpgb8qUM6oOQKs/wRmlpSQdVFZicpw5E2FzcWB1LdBG5d
         ckEyEwro8MkuqkbyMOetahTHjFoaewHPDsh42+rXQPuOCKqYEQF/Oj43SYN1PhlPL4lM
         pjvyEZxvxDe3Y7TZlJ22SeiRZlaaC78fIUbagdLAsojHb9jqQhDg8XD6WvBU7fc1a7wJ
         tjTg==
X-Gm-Message-State: AOAM533CbU/uuw3EI7tJeCnhHELKuFx/cQZ5fGjdp5EUNbDWIRbFizue
        7mzvg5d2OuRR/+fTDuUhNik=
X-Google-Smtp-Source: ABdhPJyiElaHdN2+8uTn/ho88gakS51vNHVG2yKIz9lnSP1m0ZXbYQwctmo3vc2ZlQAAm6cuIn5Lnw==
X-Received: by 2002:a7b:c35a:: with SMTP id l26mr2680443wmj.42.1597915856718;
        Thu, 20 Aug 2020 02:30:56 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id g145sm4136444wmg.23.2020.08.20.02.30.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Aug 2020 02:30:56 -0700 (PDT)
Date:   Thu, 20 Aug 2020 11:30:53 +0200
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
Message-ID: <20200820093053.GB15884@kozik-lap>
References: <20200819175853.21492-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200819175853.21492-1-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 19, 2020 at 07:58:49PM +0200, Krzysztof Kozlowski wrote:
> Fix dtschema validator warnings like:
>     l2-cache-controller@80040000: $nodename:0:
>         'l2-cache-controller@80040000' does not match '^(cache-controller|cpu)(@[0-9a-f,]+)*$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/prima2.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

I forgot to add the tag provided on previous submission:
Acked-by: Barry Song <baohua@kernel.org>

Best regards,
Krzysztof
