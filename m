Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8499256A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 19:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728055AbfEUR0N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 13:26:13 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39106 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727969AbfEUR0N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 13:26:13 -0400
Received: by mail-pg1-f195.google.com with SMTP id w22so8916149pgi.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2019 10:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ji0VdzU5OHK1F6Sbp+YSXpK8rtBxFsIqpzSG7ymRqzo=;
        b=R8RGyzYX+KVy8m3zJtD+38A1CQR4ZeKD7IZ8knX4UBdcazCt+USKTWOEB5MTkdw/Fd
         f7WTG412wUr9M4tY1MwLdCYXU6mls6g0h6SjAl87o5Sbg45Q6T+ILmFXeg1SiNZF+J2+
         ms3TSb7ib9ND/W7bLRjuENhi8gH2ZooMHWYrdw2pkJMTOeCyXMNp4xWd+c+GCHg5LgO6
         odQztXqLSb63vlLYPkqUvg/k5+WXoxmJE0alaqzhkDfeCD4L5vvTLe49ZQGxICd2tXUL
         Tr7hW4wirXJwpclHYlkq2VP7GHXvJ5Y1PFcsWqwgS14g5h+A8XLIgwtj9Dw8OhyMQrIu
         mc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ji0VdzU5OHK1F6Sbp+YSXpK8rtBxFsIqpzSG7ymRqzo=;
        b=WVADLBz9h9ZYjgt+hgoWGyzWmXO9WXEZu/KWseuYTHX/5CyI+iFgP5qSG7XVgWGrmB
         MvWXK3A9lz97Uoynf+P0xnm/fj7CKqMM8tUxEmqsEoio9MXcXGc6uVW1Ea2aRq8RtofI
         3z5ZKFzH7b0qwgy/MhgG70QKzP6/MT2GSjYFDIDxed9JCXohEMFUA7a3BgOHARjwLn8A
         zoa7bNJ+kE47fGStzN9LOk4TtIspP1ywTd+9a4iZCzY3SZgVcdN2CVz87dLWKjBp2zqj
         eqnLLx9c1NLMiCErxS8O2qGCmRBJuH2SCNX/hDx9zBiq7DsPUWHF/ydq6FeXu8S/AqBn
         J1gw==
X-Gm-Message-State: APjAAAWeASwcAEPpWdaR/Tb4qt2BZ222XM1y7kW6YozJ8GUk+oUCbE/X
        QJkEE3zB2gmaAejolStysobWsQ==
X-Google-Smtp-Source: APXvYqxHPRhrUt8LyBPdVgl0BaXABlTIZ1JBG/HpULhXJEwb7w0zzAA5be0uaHu+Y/y1a/7Kx3iCuQ==
X-Received: by 2002:a63:ea42:: with SMTP id l2mr81880080pgk.19.1558459572511;
        Tue, 21 May 2019 10:26:12 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k192sm21751525pga.20.2019.05.21.10.26.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2019 10:26:11 -0700 (PDT)
Date:   Tue, 21 May 2019 10:26:39 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, agross@kernel.org, david.brown@linaro.org,
        jcrouse@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: qcom_spmi: Document PM8005 regulators
Message-ID: <20190521172639.GB2085@tuxbook-pro>
References: <20190521164932.14265-1-jeffrey.l.hugo@gmail.com>
 <20190521165244.14321-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521165244.14321-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 21 May 09:52 PDT 2019, Jeffrey Hugo wrote:

> Document the dt bindings for the PM8005 regulators which are usually used
> for VDD of standalone blocks on a SoC like the GPU.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  .../devicetree/bindings/regulator/qcom,spmi-regulator.txt     | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
> index 406f2e570c50..ba94bc2d407a 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
> @@ -4,6 +4,7 @@ Qualcomm SPMI Regulators
>  	Usage: required
>  	Value type: <string>
>  	Definition: must be one of:
> +			"qcom,pm8005-regulators"
>  			"qcom,pm8841-regulators"
>  			"qcom,pm8916-regulators"
>  			"qcom,pm8941-regulators"
> @@ -120,6 +121,9 @@ The regulator node houses sub-nodes for each regulator within the device. Each
>  sub-node is identified using the node's name, with valid values listed for each
>  of the PMICs below.
>  
> +pm8005:
> +	s1, s2, s3, s4
> +
>  pm8841:
>  	s1, s2, s3, s4, s5, s6, s7, s8
>  
> -- 
> 2.17.1
> 
