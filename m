Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF2D71B18E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 23:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbgDTVz4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 17:55:56 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41243 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgDTVzz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 17:55:55 -0400
Received: by mail-ot1-f67.google.com with SMTP id c3so9519559otp.8;
        Mon, 20 Apr 2020 14:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iCw71v93X288tPDb+ouK6ph9U/I5qrL2nm2iv5gfjUo=;
        b=hzkNzBfTKfooMECjldUR19GdOvrj9ws2yeEdoE3JcYUn5GPrGlV3ZCwbnV3zZ/g/sb
         WrC/+w9EGQMEy3ZL7P3YOLy5yhXVRlHYLPx15aY1jR0Qr3Z10u3pQgHbidzfmiZBsshB
         1eMZGs9pHesZL5wKPFnFPi2341euYsCblJ6o0u6Y0NKbyc+sbARlXitxJ9DjMaC3b5Sp
         qMOczzJgbQvx0HZx1Q1lPiZu9G9iurRRFvBBu+G+iF0cD6GVosbklK2jUHePzMZYGJ/f
         erkYR+2xsIH8KAVqPj3gdkE81WmiYpoU/S8B5aL2zar0tmqe9sNb81UD20MeN1lTFxgi
         wB4w==
X-Gm-Message-State: AGi0PubM2YyfpW5ip7BLLJsxQ3F6yp/gnR835/uZx5kiN4kN8uQz1ohU
        UkSChCRYrVSOmIvIU6pLEn4vo2U=
X-Google-Smtp-Source: APiQypJ2UbkICoX7+yXMjbxjcdQP7ntZI5u01giYlSzLCtyuo2QmFFLftwRDKn7Lr2RxloPjBms4KA==
X-Received: by 2002:a05:6830:2439:: with SMTP id k25mr1339863ots.76.1587419754478;
        Mon, 20 Apr 2020 14:55:54 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h64sm192630oia.11.2020.04.20.14.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 14:55:53 -0700 (PDT)
Received: (nullmailer pid 32546 invoked by uid 1000);
        Mon, 20 Apr 2020 21:55:52 -0000
Date:   Mon, 20 Apr 2020 16:55:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: soc: qcom: apr: Use generic node names
 for APR services
Message-ID: <20200420215552.GA32508@bogus>
References: <20200415081159.1098-1-stephan@gerhold.net>
 <20200415081159.1098-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415081159.1098-2-stephan@gerhold.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 15 Apr 2020 10:11:59 +0200, Stephan Gerhold wrote:
> Device nodes should be named according to the class of devices
> they belong to. Change the suggested names of the subnodes to
> apr-service@<id>, which is already in use in
> arch/arm64/boot/dts/qcom/sdm845.dtsi.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,apr.txt | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
