Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB55880AB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2019 19:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436754AbfHIRAB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Aug 2019 13:00:01 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36081 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436739AbfHIRAB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Aug 2019 13:00:01 -0400
Received: by mail-pl1-f196.google.com with SMTP id k8so45210571plt.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Aug 2019 10:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HzTYQAsTwaeVmkPpyYA1+naQMbibccJuAVbeLptpfdo=;
        b=jLURGumwZc6E/p0KiMVcYkNhD2BqzUR63Qb5/zAULhocRqcCYmkB3afGtGBPibGK8g
         kE9JHSlMRB/Dv6m6pfftnIfCMzVc7OsepxQRXmXOeC9MqYcZB9lNEKVXGBrSiGHv4CWi
         Mt2hQMxvMS8k5RAg5MRZDajoCjGOVCxONDVAyo7HssYFEUF6miW/Ph9ojHWuz4Wwnrwb
         INWAX2BJIs8RhNAAqZbBG0BHV92QTFpkXtUFFNOlfm7rWNa5Mg7caNoonzIH7PYhKqx/
         jAmstmGYBm9Q4d+XKNpjbylQCgtRL8fVbGjcCMT6b5m8wHwvqzhrjmXMddlQFa7+zlFy
         dq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HzTYQAsTwaeVmkPpyYA1+naQMbibccJuAVbeLptpfdo=;
        b=Azz4R5Q7erBgGJvx09l5FHSmt80YO5qVnrWToTmWC5lqkJMdp3eGnka2YtU59aL8W/
         3YiuHZPxIdzqAwVKKnW6olyEmPWv2fpvm9rFXCwPh5w1n1Fb21egLbymhp7/UYTXXebR
         SGNHihwgPb64VXFpMxKY4IlN6BgDdBflWI+kKdvcWWCYUg+SK0NtB3DpY/iajOrshv5z
         PIpjC3SX1a4T3aPf5Mpq5USRe8NvsxNvIOb91nJYDgay2RUSJAM9sFln7GbI1n/OWLng
         vuidkBHIG921dU0YyQ1Iqv4YfpT+GfzD36vZfeJpbOE9xn/loYiGS0zGQ9iPUkERtxBr
         s90w==
X-Gm-Message-State: APjAAAU/ZfRhB7ZuYf96Tn0E0UdND3uPfs5HAn4la8fyk5YXIqbOSTB3
        NZMjtbUtrZMCPoaveRmBOBFu/w==
X-Google-Smtp-Source: APXvYqxIvh8RXaUTDHMAAPall519zovv23HzUG1DHQ2lDtsV6hbQ9nI3rJVwqZmuAYs+AgsL8D8x4Q==
X-Received: by 2002:a17:902:a40c:: with SMTP id p12mr20027983plq.146.1565370000206;
        Fri, 09 Aug 2019 10:00:00 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 185sm98899540pfd.125.2019.08.09.09.59.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 09:59:59 -0700 (PDT)
Date:   Fri, 9 Aug 2019 10:01:34 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] regulator: dt-bindings: Sort the compatibles and
 nodes
Message-ID: <20190809170134.GM26807@tuxbook-pro>
References: <20190809073616.1235-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809073616.1235-1-vkoul@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 09 Aug 00:36 PDT 2019, Vinod Koul wrote:

> It helps to keep sorted order for compatibles and nodes, so sort them
> 
> Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../regulator/qcom,rpmh-regulator.txt         | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
> index 1a9cab50503a..bab9f71140b8 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
> @@ -22,12 +22,12 @@ RPMh resource.
>  
>  The names used for regulator nodes must match those supported by a given PMIC.
>  Supported regulator node names:
> -	PM8998:		smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
> -	PMI8998:	bob
>  	PM8005:		smps1 - smps4
> +	PM8009:		smps1 - smps2, ldo1 - ldo7
>  	PM8150:		smps1 - smps10, ldo1 - ldo18
>  	PM8150L:	smps1 - smps8, ldo1 - ldo11, bob, flash, rgb
> -	PM8009:		smps1 - smps2, ld01 - ldo7
> +	PM8998:		smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
> +	PMI8998:	bob
>  
>  ========================
>  First Level Nodes - PMIC
> @@ -36,12 +36,13 @@ First Level Nodes - PMIC
>  - compatible
>  	Usage:      required
>  	Value type: <string>
> -	Definition: Must be one of: "qcom,pm8998-rpmh-regulators",
> -		    "qcom,pmi8998-rpmh-regulators" or
> -		    "qcom,pm8005-rpmh-regulators" or
> -		    "qcom,pm8150-rpmh-regulators" or
> -		    "qcom,pm8150l-rpmh-regulators" or
> -		    "qcom,pm8009-rpmh-regulators".
> +	Definition: Must be one of below:
> +		    "qcom,pm8005-rpmh-regulators"
> +		    "qcom,pm8009-rpmh-regulators"
> +		    "qcom,pm8150-rpmh-regulators"
> +		    "qcom,pm8150l-rpmh-regulators"
> +		    "qcom,pm8998-rpmh-regulators"
> +		    "qcom,pmi8998-rpmh-regulators"

Thanks for dropping the "or" as well.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

>  
>  - qcom,pmic-id
>  	Usage:      required
> -- 
> 2.20.1
> 
