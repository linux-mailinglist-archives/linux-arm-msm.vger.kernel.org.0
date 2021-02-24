Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20C6B3242AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 17:58:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235301AbhBXQ4j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 11:56:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233814AbhBXQz6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 11:55:58 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB65DC06178C;
        Wed, 24 Feb 2021 08:55:15 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id i14so58164pjz.4;
        Wed, 24 Feb 2021 08:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HuE/AQ6Vh6xvo8ua5ZF0xBQXux+yrBrz/8Rh+Go0F8g=;
        b=aSrANCEvgZkQhK3OPS6sxk6dOcqgEZgvr75qmrr9KvBKaX/B9vuSW+WLqjMhkHhW5+
         BltSqEuHIGiq7KG1/mkQ6j7GenjavEK0wri9dmfg7m+IrawC57jEce3Cvf4LAOh2Yy/M
         aIv+/qS2VWusmAtIudnleD+79+1KRPOMHR4RGZ1CqkRnWjFDhZFhuredAFeoYUmVJmps
         0/JGDuuKn2CT2M1D1hk22ZH2yMSCmkhhrhJQBPVy0gIfaxx9l/xo/LbeoGzrceUAewrR
         smSjuBMgPBV2HSYZdfItumxlcfeyTD7YJwtn2bNOAMyHwT6pkxFOGiOxAZ/RcVDxyYdd
         97XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HuE/AQ6Vh6xvo8ua5ZF0xBQXux+yrBrz/8Rh+Go0F8g=;
        b=bhp6ely3YfdPjhSuSGET1gK8zUqg+791jgve9JSt8tDK+0OqzQLbfUOKoCKcaP13vp
         GA7a9suDd15yQk2ps7B6WT09/G8s9HQNMknmg8XOuIe2fxWkbkHWKBT9PT4y9/cTZx7+
         MpUnDG48S/AjmFvNNRbKKu9QbGEROYvw5c04TyJuqZzqUTmmpR8XHgTMjGoIG0QTC/Py
         sRwwJDESmerADwMvJ5HQq6hhYyN3+qqD+yhxa6Qe7SvDAjcNqzgFY6c4Tv4nruJHUnN1
         5rOswaZjMT2K8h+s90AFCQLSWsbtIBBs5LCT5gLmFFG6RLuvJOJJri4RMl0aPyxCJEtK
         s39A==
X-Gm-Message-State: AOAM531fxafRHzDfiWRTmGLtNgb318dH63+8GdteIDJeqUBk3mveOHLC
        2sn2a3s9be7qO3QOg9tbGos=
X-Google-Smtp-Source: ABdhPJwHgPvwxHVjX1vHznt6GbMNRSY5lix9heTWVB5dmjOG6nJuLv0k5g6080iF+UGUULgIPuctUw==
X-Received: by 2002:a17:90a:1b4b:: with SMTP id q69mr5348553pjq.108.1614185715447;
        Wed, 24 Feb 2021 08:55:15 -0800 (PST)
Received: from [172.30.1.41] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id j201sm3668368pfd.143.2021.02.24.08.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Feb 2021 08:55:14 -0800 (PST)
Subject: Re: [RESEND PATCH v6 2/3] bindings: pm8941-misc: Add support for VBUS
 detection
To:     Guru Das Srinagesh <gurus@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>
References: <cover.1611621365.git.gurus@codeaurora.org>
 <f75e75985a06b38ba77c618e108d797b7de17f09.1611621365.git.gurus@codeaurora.org>
From:   Chanwoo Choi <cwchoi00@gmail.com>
Message-ID: <2b0fa0f4-b5df-10d2-c09d-7c8c4c22ad39@gmail.com>
Date:   Thu, 25 Feb 2021 01:55:10 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f75e75985a06b38ba77c618e108d797b7de17f09.1611621365.git.gurus@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 21. 1. 26. 오전 9:38, Guru Das Srinagesh wrote:
> Add interrupt support for reporting VBUS detection status that can be
> detected via a dedicated PMIC pin.
> 
> Signed-off-by: Anirudh Ghayal <aghayal@codeaurora.org>
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>   Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> index e8eea83..6a9c96f 100644
> --- a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> +++ b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> @@ -22,11 +22,14 @@ properties:
>       maxItems: 1
>   
>     interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
>   
>     interrupt-names:
> +    minItems: 1
>       items:
>         - const: usb_id
> +      - const: usb_vbus
>   
>   required:
>     - compatible
> 

Applied it.

Thanks,
Chanwoo Choi
