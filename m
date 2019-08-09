Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C98087028
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2019 05:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404805AbfHID1o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 23:27:44 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38209 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733258AbfHID1o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 23:27:44 -0400
Received: by mail-pf1-f196.google.com with SMTP id y15so45267291pfn.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Aug 2019 20:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=v5m7Msw6nF9vdn6sxJ12YYLnKtWCnR8AC90/6IDMe8c=;
        b=WEir+432H/f7d295W8cxOvBj5Ne5OdMecu8yIUZ8ffg8mVDnPKdF7zr4fXKhU1n0DA
         Ps3iuLwfFIeka+oIiYMoDbhDEv5h8IIKGh6RWjxZTO1flxJ19GAtgIqMtb0jcpmeU0Wa
         e5TAGfXxHzrYfh22/43JydGwM8R2jK52gGMc2PIcKY9g16F5JvvjvfCjux50aM8bKtyc
         BvZdSOZW7huCpZz00oXmIm2QAL2lizKouCqh014aMFVfTz5LvQB2rjupUjss3fgCzIfQ
         MUyIwYaiOHwq06V984f+Y3NexhfuQOJmC24HH9AgewjH8yMmlG8Ql+xLfjv5BmcvVyk8
         5YDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=v5m7Msw6nF9vdn6sxJ12YYLnKtWCnR8AC90/6IDMe8c=;
        b=P8c08hXOWjoWljfzzetNJCUMgrq+RigtADhdgYjPIKlbsrE4msPwgc/f2tCAKrI479
         v9cbh3AysdALrtP8ojilxDaE0QRcfIHAu97y+dOuJszwwsBc3/sp0YT+7hvXZMVfmwfo
         gNleDUmkjjwJnPeI6YDROoYP4ImhoRsodap246SnYFcVZX/ErqLesZx5WOXSpW6so/Ix
         wQveHoY5zQQDk9GGRYZcEV5efanoH+/Pg7rPxw6Kw66JJ62A2mBlZnEckDmI+0OcMWVI
         knbKrmEAbthsoUpFJbZEnlRNoaWp8gCN7nlWxpxSLZeabigN7RYHHcadDfUZGcehctGv
         X0SA==
X-Gm-Message-State: APjAAAWirc0k/xankCTRnOCL8jDCQLJ439AEtbuC7QttFhWgU28665Ou
        9/Y3T1gnUBll0XEdR/ye+wx2Nw==
X-Google-Smtp-Source: APXvYqzNvZFJvhvFbH2thlotSUGSz9ktBlepD6RKn5dOv6s6nOnmPWoEm8xbcV+82utj/F9bml8lkg==
X-Received: by 2002:a17:90a:f98a:: with SMTP id cq10mr7303114pjb.43.1565321263372;
        Thu, 08 Aug 2019 20:27:43 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e9sm1040807pfh.155.2019.08.08.20.27.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 08 Aug 2019 20:27:42 -0700 (PDT)
Date:   Thu, 8 Aug 2019 20:29:15 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] regulator: dt-bindings: Add PM8150x compatibles
Message-ID: <20190809032915.GK26807@tuxbook-pro>
References: <20190808093343.5600-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808093343.5600-1-vkoul@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 08 Aug 02:33 PDT 2019, Vinod Koul wrote:

> Add PM8150, PM8150L and PM8009 compatibles for these PMICs found
> in some Qualcomm platforms.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../devicetree/bindings/regulator/qcom,rpmh-regulator.txt | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
> index 14d2eee96b3d..1a9cab50503a 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
> @@ -25,6 +25,9 @@ Supported regulator node names:
>  	PM8998:		smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
>  	PMI8998:	bob
>  	PM8005:		smps1 - smps4
> +	PM8150:		smps1 - smps10, ldo1 - ldo18
> +	PM8150L:	smps1 - smps8, ldo1 - ldo11, bob, flash, rgb
> +	PM8009:		smps1 - smps2, ld01 - ldo7

Please maintain the sort order.

Apart from that

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

>  
>  ========================
>  First Level Nodes - PMIC
> @@ -35,7 +38,10 @@ First Level Nodes - PMIC
>  	Value type: <string>
>  	Definition: Must be one of: "qcom,pm8998-rpmh-regulators",
>  		    "qcom,pmi8998-rpmh-regulators" or
> -		    "qcom,pm8005-rpmh-regulators".
> +		    "qcom,pm8005-rpmh-regulators" or
> +		    "qcom,pm8150-rpmh-regulators" or
> +		    "qcom,pm8150l-rpmh-regulators" or
> +		    "qcom,pm8009-rpmh-regulators".
>  
>  - qcom,pmic-id
>  	Usage:      required
> -- 
> 2.20.1
> 
