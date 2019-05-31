Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30EAE3186B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jun 2019 01:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbfEaXul (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 May 2019 19:50:41 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39403 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbfEaXuk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 May 2019 19:50:40 -0400
Received: by mail-pf1-f193.google.com with SMTP id j2so7102604pfe.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2019 16:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=c79H5rQZz0sMWOQ2Dkv18YmAHI94MxyIDoL9IyRKnFM=;
        b=cMfP/lWBiG8HDIKe1reMsz+A5J375yyopBUdiNuYccJ9PoMGVkT3Cq6ArQqQttOXkw
         KElbIOArfqCdwgWKvCi9FEEgVPfH6EUxfR40IDtO7J+V9Zuycnvk0m6cN3XO3ms+Sux1
         nSHivP7dABj6PsTFIBz4DsSF+3JvZdeS9VVPjg5/f3OZp3m8q8lRg2ZvsDl4lTTHfPVz
         3TOTsjUz18jwKPdj38ZdWE91k4XwPtKf3ouv1ucmJmVdA5eKX4NfLIV/MqENcvLD2olt
         R/DQD7pzR8PTjO56anLH84cHeqskxN10riQmO6Do7Tp7IRdULf5Fbs22rBAQIz1721Op
         yA3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=c79H5rQZz0sMWOQ2Dkv18YmAHI94MxyIDoL9IyRKnFM=;
        b=FESNkMFg6v3uBpNW9m7i4VfFhph0K4CXaxYHNGUHYd5TG2FDqU563xZF2bDAXqk7kn
         ea7b4nUGtmrodcve68Ds+dnPnhxkD3EUX0fXysE0/IBoesmo+UojfWDIS0jRBFdwecnY
         uGGc9eF2HQmxVAcO6YaRU35pZgJ5AnxF+UYJ9LkJtcEjh8ZwJ+CWvrFmVvfHcvD3vJIf
         +b3eYJzWxOkudd3IWcLpmw/h3z2kHW3e76i2CBXvP3cKwcdDX0cmvgWNU3rNDQrPzgVg
         tUUIUFDTxgdHo/GVtyhwx5pf/HIN2WFl5EW/ku6fwMoR1q9oshOIyUf07p5Rbw8IlQyy
         S0pw==
X-Gm-Message-State: APjAAAXiGgZokDaQPBonR5ywodb6c39P4/HzE9Jru8FaS0TCFGtOVIlF
        jUsI/B2Yb2yWSJ3VtIQLmwFHeQ==
X-Google-Smtp-Source: APXvYqwA2DJD2HY8jlTR3RoD8ReSjSWYM2qtbknvUUBN0/2NaV3wiCv0C3mqzB04u5cUNeZGnBVCnA==
X-Received: by 2002:a65:42ca:: with SMTP id l10mr12087312pgp.181.1559346640216;
        Fri, 31 May 2019 16:50:40 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a11sm8290710pff.128.2019.05.31.16.50.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 May 2019 16:50:39 -0700 (PDT)
Date:   Fri, 31 May 2019 16:50:37 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RFC][PATCH 1/2] dt-bindings: power: reset: qcom: Add
 qcom,pm8998-pon compatability line
Message-ID: <20190531235037.GC25597@minitux>
References: <20190531234734.102842-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190531234734.102842-1-john.stultz@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 31 May 16:47 PDT 2019, John Stultz wrote:

> Update bindings to support for qcom,pm8998-pon which uses gen2 pon
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: David Brown <david.brown@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Cc: Amit Pundir <amit.pundir@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  Documentation/devicetree/bindings/power/reset/qcom,pon.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.txt b/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
> index 5705f575862d..0c0dc3a1e693 100644
> --- a/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
> +++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
> @@ -9,6 +9,7 @@ Required Properties:
>  -compatible: Must be one of:
>  	"qcom,pm8916-pon"
>  	"qcom,pms405-pon"
> +	"qcom,pm8998-pon"
>  
>  -reg: Specifies the physical address of the pon register
>  
> -- 
> 2.17.1
> 
