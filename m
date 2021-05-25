Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62C8039071A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 19:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232905AbhEYRHb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 13:07:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232554AbhEYRHa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 13:07:30 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D14DC061756
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 10:06:00 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id r26-20020a056830121ab02902a5ff1c9b81so29261302otp.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 10:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LBiWZXaIrz//b8Qdmr6+FgoMBjYgiBG1upZviLq9k1k=;
        b=Ysu3kljB/I0AjkP3oAgIfLYdr8YdisQu0OSz1pvZv0q+Dn2gcFi3zeoRrQMyG9SyPR
         jFB+2LW0DFLrW+f0Qn8jHIYwXolYzSlkAX0W6DkNmC0lsbqe5J4HSl2iPyEHN28BDJkg
         tB7yuY9duaLepYO+0AADYrO6OwqJLiuSDoriTYvZPqSnguG2ZWRD6xQol4VcTsxMLHbZ
         OW7hteS7nflKneLPs+fguLrl3UgLNab7Prg784RSY+a7LKgqpFP5iaMHc/dMwQZ4VChk
         eVBDkkNpxlFL3sXY1KBCQ11QaIn0qtgTaUXhLbKZXIxnIY8boAZGLJBzQrwQsy3B5w/j
         wDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LBiWZXaIrz//b8Qdmr6+FgoMBjYgiBG1upZviLq9k1k=;
        b=k53rZdsPIt7ta9yGMWLLXaIjSmHuzSpCf+uZFmHJgoA9w2e2h8V/+YInwFim/RXU6Y
         R/t7joC8uQuf0xKnOZ1wBa8Ijn1FvzfdSUn79yf+mk+0jibtEA/TsTmYwLodUM30LYNH
         g0UMH27/juDPwtvbpjJnfSV47uaze117P2GvhAjWUtBuApiWxaRMseExNuTRa7+qRVNr
         1/hLc20/usHCfI1UTG+5bp+GLTBoqL5kl6nj9I25kFnioA9DG8+HMOXjjGDMrvQQqJbf
         wvpGMYGle8q2aab0yGdYKspVI95DSiLkP7IRi6XGP2p/qVt8rrAsIUvH/rXCeUoVRh6V
         YnaA==
X-Gm-Message-State: AOAM532BbtA9LDaydXPlNRbOs5e6rJjzyd2OuR4jqxCazNcB6cHlERWp
        B1YMVTWbcXWGkbYHfeuEwWccWw==
X-Google-Smtp-Source: ABdhPJxHRD/LI5AsXb0JLCjTEcz/D/iT6mOagaeshO4aAuDaoV2kB5ZpQ1HPFS2IxEQzo1DZ5J2Wxg==
X-Received: by 2002:a05:6830:1e21:: with SMTP id t1mr22335831otr.100.1621962359745;
        Tue, 25 May 2021 10:05:59 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f21sm3573508oou.24.2021.05.25.10.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 10:05:59 -0700 (PDT)
Date:   Tue, 25 May 2021 12:05:57 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>,
        satya priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        mka@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kgunda@codeaurora.org
Subject: Re: [PATCH V5 11/11] mfd: qcom-spmi-pmic: Add support for four
 variants
Message-ID: <YK0udV1Wbm4Hvk72@builder.lan>
References: <1621937466-1502-1-git-send-email-skakit@codeaurora.org>
 <1621937466-1502-12-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621937466-1502-12-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 25 May 05:11 CDT 2021, satya priya wrote:

> Add support for pm8350c, pmk8350, pm7325 and pmr735a PMICS.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

@Lee, will you take this patch through the mfd tree?

Regards,
Bjorn

> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V5:
>  - Newly added in V5 to add documentation support for pmics of this series.
> 
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> index 79367a4..5ef79bf 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
> @@ -34,6 +34,10 @@ Required properties:
>                     "qcom,pm8998",
>                     "qcom,pmi8998",
>                     "qcom,pm8005",
> +                   "qcom,pm8350c",
> +                   "qcom,pmk8350",
> +                   "qcom,pm7325",
> +                   "qcom,pmr735a",
>                     or generalized "qcom,spmi-pmic".
>  - reg:             Specifies the SPMI USID slave address for this device.
>                     For more information see:
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
