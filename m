Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C3331ED9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Feb 2021 18:48:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234660AbhBRRrl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 12:47:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233217AbhBRQMm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 11:12:42 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A615C06178A
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 08:12:01 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id s6so2336974otk.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Feb 2021 08:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=B7l8LVEXNX+LsLdNN9PcLRixCEk1Cd2ioBVfM3iW1e0=;
        b=OjrGLq8xMGMZIayxpLYfrcI/b88ii2Ee2zYaEQWqoZ60KnqH9j/v4T4r5d64JHdl33
         DXmiunwNPaISEVJmeuNplr3nohcftRGvK8mi3iMwlf215EJQyqBRC4ay3zIwL9GfAfut
         YoFlF9Q8t30/XfjI7qUCOFGf+bBWpGxUWtAg/vhclOaa4G4PjBBqC+WijMXuMG3R9qOF
         /u/DefnLY0nKdcPXh8rPMi5AwlAqwr1wPjQefqn9eiOJjknEIerw0s7SKx++Y4AOAS3P
         8Rqrn44FhrWHLQ3DO5GAORvwjGkjd0xeZ/THvvE1QbLa5y2oGNKX0r5ZA7KOcWKEGq24
         /Dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B7l8LVEXNX+LsLdNN9PcLRixCEk1Cd2ioBVfM3iW1e0=;
        b=NkkNOdOf95dT6k+TaClBGhPqVQXkAIZmHndJgpVKxa13gl0flEb44F1+mfv0WqI8Bf
         HaprlP8ADXwZYxFfY5cJEwC4p2kmbyJ+z4rPojUBtrJj9i0tVtpb/FPghJiy35dqeaPD
         lLhyUEY0vyi5w+Sqt/C8xj1J+e/EOJUc5Ntcgj01rWYqcr6mGj+HhM6PaW9bCB5VBIjx
         rVLPPZGf1ETsV/nGVOl1dZcao5C5mNWeiJkEvCCgtK9aDJrNGR5VuaO/dFUObtJWlD9v
         LnG4wk7K55caehYWVnBP7DDHd9dx3B6QUjtT3s9z84RY/RNGEFeooB5tf78KJyZ9ORNF
         h5Uw==
X-Gm-Message-State: AOAM5333injwOiie3Do4jR0zkSEQe7Py/vllzNoNoy0Ekr808kslX+U3
        J84xxJmCVHiUAQ6SGRujLwhItA==
X-Google-Smtp-Source: ABdhPJwIR2A5cmmzQYQ3k1zr3bcK12whb0GxoacSqSwyuVGJU4bQQvV8JP++fTbS6Mv1yTvkl5ekNg==
X-Received: by 2002:a05:6830:19ea:: with SMTP id t10mr3539166ott.61.1613664720740;
        Thu, 18 Feb 2021 08:12:00 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 97sm1138988oty.48.2021.02.18.08.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 08:12:00 -0800 (PST)
Date:   Thu, 18 Feb 2021 10:11:58 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cpufreq: cpufreq-qcom-hw: Document SM8350
 CPUfreq compatible
Message-ID: <20210218161158.GC5254@yoga>
References: <20210216111251.1838149-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210216111251.1838149-1-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 16 Feb 05:12 CST 2021, Vinod Koul wrote:

> Add the CPUfreq compatible for SM8350 SoC along with note for using the
> specific compatible for SoCs
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt
> index 9299028ee712..3eb3cee59d79 100644
> --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt
> @@ -8,7 +8,9 @@ Properties:
>  - compatible
>  	Usage:		required
>  	Value type:	<string>
> -	Definition:	must be "qcom,cpufreq-hw" or "qcom,cpufreq-epss".
> +	Definition:	must be "qcom,cpufreq-hw" or "qcom,cpufreq-epss"
> +			along with SoC specific compatible:
> +			  "qcom,sm8350-cpufreq-epss", "qcom,cpufreq-epss"

Can you please extend this to add all the platforms that we currently
support?


PS. Didn't we have someone working on converting this to yaml?

Regards,
Bjorn

>  
>  - clocks
>  	Usage:		required
> -- 
> 2.26.2
> 
