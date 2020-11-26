Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A11C72C52F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 12:29:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388558AbgKZL3c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 06:29:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731803AbgKZL3b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 06:29:31 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE9E5C0617A7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 03:29:31 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id t8so1387323pfg.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 03:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=k0RIdzypuBv+kcZ+GdFtDRYygeKwG4dwldChjydivrg=;
        b=AfV+9ENtvcE/VKnCWQ+4hYIbpTDyW52y/CO27egpFKyZmvH5v0APNwQodakbuaE+xn
         pl98K99HA9O79OCW0zDgkfCEdsefj/g66jsiAo/gaEZNJa46JhO85mYtWagX9NoYGHRy
         I96m8UHMDi91yJE8solJ3AYmx3WCqOWSVgKOMsJnZGx9PBXuoIi0ere5RkL67Dw2MXCh
         NeIo1HyDjRH1hhoyS7sJ+zmqyW6Txn/7xiZhaBrqo7pBBq3ZfZTu03r3/ZRIYUIpSClI
         LmT7zbW24p0+1qq3bx51LjoZdVAH7gxsCe2lTZVNgyTTS/p0C4FgDLi/QxelnIUkcU8s
         bwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k0RIdzypuBv+kcZ+GdFtDRYygeKwG4dwldChjydivrg=;
        b=EcNUrgL4Oz2rqQTiiUppQsEjlw78f+Ey7CkitLsy57JCulU98jeGD76QRl3RVfvWCZ
         inqzoKgAt4BygXlGaJ5eiHC+NaR85I96Lq5ARe0/uQdknjQObltInViwPShei/nQbGdX
         eX8E1dXlPA/rjy0bNWV/4NbaEGzfrj9dSr8JQHRs1kWDtiJdyawFAZCx4i6yi3KV6sXk
         KCUbxFjYOVCk5HdPfWId/CKEKlHvS1QpL8jlwMbjrKYsp9OG4/ZZgsK60RuSwbtZxnxS
         qB722ZBKabHhYrJ5Q0GUotE3Iqv7AoPRKFxhvZjk5QbnvKbZB+apd02Ta2N+Kc9Kxjwo
         Ox0Q==
X-Gm-Message-State: AOAM533MiF+tgyzrQ5HSoL0DBRAQNfZF0/JeBC+LJ1//usHTg0Vr/tiN
        idMRxofgWovypJSO3AVxNQl+
X-Google-Smtp-Source: ABdhPJznpcAKjvuFyGcgi0A7KblcG5d/jVXUTerMjwXcNHyOP5DrZ8apfdJhPN1+k1mIlZibvCuCEg==
X-Received: by 2002:a17:90a:d705:: with SMTP id y5mr3170683pju.109.1606390171388;
        Thu, 26 Nov 2020 03:29:31 -0800 (PST)
Received: from thinkpad ([2409:4072:6e95:f2a:3996:9d7f:e389:7f7d])
        by smtp.gmail.com with ESMTPSA id u6sm5910408pjn.56.2020.11.26.03.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 03:29:30 -0800 (PST)
Date:   Thu, 26 Nov 2020 16:59:24 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: power: Add rpm power domain bindings
 for sdx55
Message-ID: <20201126112924.GB51288@thinkpad>
References: <20201126092711.1084518-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126092711.1084518-1-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 26, 2020 at 02:57:10PM +0530, Vinod Koul wrote:
> Add RPM power domain bindings for the SDX55 SoC
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
>  include/dt-bindings/power/qcom-rpmpd.h                  | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> index 8058955fb3b9..fe20a73f47ca 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -22,6 +22,7 @@ properties:
>        - qcom,qcs404-rpmpd
>        - qcom,sc7180-rpmhpd
>        - qcom,sdm845-rpmhpd
> +      - qcom,sdx55-rpmhpd
>        - qcom,sm8150-rpmhpd
>        - qcom,sm8250-rpmhpd
>  
> diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
> index 5e61eaf73bdd..9fa2d66fca4a 100644
> --- a/include/dt-bindings/power/qcom-rpmpd.h
> +++ b/include/dt-bindings/power/qcom-rpmpd.h
> @@ -15,6 +15,11 @@
>  #define SDM845_GFX	7
>  #define SDM845_MSS	8
>  
> +/* SDX55 Power Domain Indexes */
> +#define SDX55_MSS	0
> +#define SDX55_MX	1
> +#define SDX55_CX	2
> +
>  /* SM8150 Power Domain Indexes */
>  #define SM8150_MSS	0
>  #define SM8150_EBI	1
> -- 
> 2.26.2
> 
