Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2834A9EA3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 19:06:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242472AbiBDSGa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 13:06:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377360AbiBDSFd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 13:05:33 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2498C061401
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 10:05:32 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id r27so9433884oiw.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 10:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FjF+sGZpg2iaH76PumvDp14W7fNNxKuPMZR+Us0rVMQ=;
        b=WDWuvGT/OxA9GID0EgK9YDidQPh+HAa1en+YRr+jT4ZUb4X+eK3H8R6beO+FEvnyDG
         BZSlJT5PvdgA1sBVwVVVMTQFtMesxbeA9ZwEY//5gfvsSRzU4LZNMFcRnunjU7KSfjcZ
         okhZlE/GB/zmFuVhvn13M8n5tp8aIG4cwM6rTtTKLGfz+0zyQ3GmM814MUXEv9FgBUhD
         dWY+Fk4FpY3WU2Qi+JuDc2d2fC71MzEM5cXKgW7RapBc+IXMRjbtd+3uYN9ThXNgYvln
         HEeM7H/wbzGuKzDXOiKGAgXcNQ2U8NDGW/x6HhrTlnLNiQRLZj/hP+shOOrCFwDFj3L/
         j5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FjF+sGZpg2iaH76PumvDp14W7fNNxKuPMZR+Us0rVMQ=;
        b=64cmFCMIw0ilWoqNBnMIS5QRbqhL+wV3zv4Fblr+6Q9rg67qiBbGn5KO6sJM8ghoIx
         xuwAzjaPLNOd5IXbyXHBpHrsgr93GhinUWiHZvQi4imGrLHV73irSL2LNYKRpFuD5Y/m
         nlNOBtdqWDcEUtU2UZpA2JpDFKuXKDPJ45805xJw03P0PprFVeYxBv/9FSs4+DAmtmQu
         XoR56F/Yxs5Ab+15e1hcfXncu7upRtUG0qLqfdDVUgDCrBg2Oogm+9Bm2rzqKqOHYA4B
         bYr32Pe4SajoS+vKWDQJkYgZYLZO3nb7x5v+dVcEuSBxP4VrLOHf6W2Tq/0W07wPaUdN
         60MQ==
X-Gm-Message-State: AOAM5312fDC25nEobJNMZ5QdrC+7ubMvn2/xzZKvistK1YeNvPQ/tOw+
        XXIrj3bng7u4jTXenc5UYkxjUQ==
X-Google-Smtp-Source: ABdhPJylpcEz5omTCtvVVTdyfF1+oj/R9wH56W4rthEOGLG4g7VSkPI6Ojv1x35a8V+C7gXtZf9Ksw==
X-Received: by 2002:a05:6808:ecf:: with SMTP id q15mr1881768oiv.130.1643997932289;
        Fri, 04 Feb 2022 10:05:32 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id a15sm1114445oil.13.2022.02.04.10.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 10:05:31 -0800 (PST)
Date:   Fri, 4 Feb 2022 10:05:47 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linus.walleij@linaro.org, broonie@kernel.org
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: i2c: qcom-cci: add description of a
 vbus-supply property
Message-ID: <Yf1q+wlXo2LAeZX+@ripper>
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <20220203164629.1711958-3-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220203164629.1711958-3-vladimir.zapolskiy@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 03 Feb 08:46 PST 2022, Vladimir Zapolskiy wrote:

> Quite regularly I2C bus lines on QCOM CCI controller require an external
> pull-up to a regulator powered line, to be able to define all such
> cases an additional vbus-supply property of a bus subnode is wanted.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> index 924ad8c03464..9f5b321748f1 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
> @@ -60,6 +60,11 @@ PROPERTIES:
>  	Definition: Desired I2C bus clock frequency in Hz, defaults to 100
>  		    kHz if omitted.
>  
> +- vbus-supply:

I don't think "vbus" is an appropriate name for his. Perhaps "vddio" or
something like that would be better.

But there's a bigger question here, this is not a supply for the
i2c master, it's simply a supply for pulling up the bus. So it's not
entirely correct to specify it as a supply for the CCI node (which is
also the reason why the name isn't obvious).

Typically we don't don't mention the bus-supply because it happens to be
pulled up either by io-supply for the block, or by some always-on
regulator in the system.

Looping in Linus and Mark in hope they have seen this need elsewhere.

Regards,
Bjorn

> +	Usage: optional
> +	Value type: phandle
> +	Definition: Regulator that provides power to SCL/SDA lines
> +
>  Example:
>  
>  	cci@a0c000 {
> -- 
> 2.33.0
> 
