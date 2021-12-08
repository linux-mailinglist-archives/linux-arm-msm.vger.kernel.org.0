Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97DBD46D46E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 14:30:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234269AbhLHNd4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 08:33:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233366AbhLHNd4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 08:33:56 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABE04C061746
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 05:30:24 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id q72so2705529iod.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Dec 2021 05:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HSGS1d79YvwktanRoTlsJEx4+yVq/zg4TlZ3ZGtYtKw=;
        b=cC8uvc8hjaCALhAZ1k0VS+hU0HIBhKFKUmNhhn6jqmLLIRbcC/L9Kft9ZzSFYjLT6I
         9Ak/SsKLVgwrDJS4MXa4+iQrkI+b9P5onuDLe0b1NDL9EdTLT+PyOSIId0tjy66mV/NB
         tkAypJDF200ooWW/mAhtGSFYrbVYgFXkPOc+0V+Hxc/MyRTGeo7e7PmT33Qp2aUxyE+S
         POlgipX/PgV8d34Hp9E6ctS86m2h8Tbs39fDN60bBN60kHak4fpukSxs7G+WbGt4o4JL
         N85c9yMscTwwnQCZF4JpnYxL1R1uKng+o20wGfYqTO7TxmBpDE2ntHE9loPF1O7akQlE
         8J1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HSGS1d79YvwktanRoTlsJEx4+yVq/zg4TlZ3ZGtYtKw=;
        b=XSqaFRgHw78B8Ye7njYcN4pOg/YSnMeoh2QCSt4TUbXNg8XFB5x8QDJSWNIoPMIzpI
         5lSz7dEnzbnyNGdEiNIuGKgwu39BfeTFiS2nwZTOIurnRA6LlHguZijhr/KZgP9h/hOi
         vbW5hYYUUk4GinJSguFEP6QJZwdqOWeeYi7zbT8R2wHVhzvNJ5ORxADpXX86t+S+HudR
         VRHtE2VVdeQGKcv/0QGO4ApztDjlGVtdU0uo+lACSQ/anZpQNYTit/TCX45W4RntXzkd
         sUDCDqWj18g+Kiwr18O10lhYVFo3EEOoB26KEiw2AlMnjD/ACOvnjibzwvx9G5IrRKGG
         5MkA==
X-Gm-Message-State: AOAM533SK1EglAU7OFu7WQPTnzG97+lz4kfuCuNx4noLE9ry5qjAmbKG
        HpoXyVzq1qAaiIWKJBsS4s63gA==
X-Google-Smtp-Source: ABdhPJyWt0fThyv24kvSEl0q1lO29MXJxWdyNJ9KKTzpFKgTj9m9SDQX0hlj7Xx22o52FZpfGvnjmg==
X-Received: by 2002:a05:6638:150d:: with SMTP id b13mr58326249jat.101.1638970223286;
        Wed, 08 Dec 2021 05:30:23 -0800 (PST)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id h11sm2000812ili.30.2021.12.08.05.30.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Dec 2021 05:30:22 -0800 (PST)
Message-ID: <88091904-3430-d717-75a4-5928566b79b4@linaro.org>
Date:   Wed, 8 Dec 2021 07:30:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 1/3] firmware: qcom: scm: Remove reassignment to desc
 following initializer
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Elliot Berman <eberman@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211208083423.22037-1-marijn.suijten@somainline.org>
 <20211208083423.22037-2-marijn.suijten@somainline.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20211208083423.22037-2-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/8/21 2:34 AM, Marijn Suijten wrote:
> Member assignments to qcom_scm_desc were moved into struct initializers
> in 57d3b816718c ("firmware: qcom_scm: Remove thin wrappers") including
> the case in qcom_scm_iommu_secure_ptbl_init, except that the - now
> duplicate - assignment to desc was left in place. While not harmful,
> remove this unnecessary extra reassignment.
> 
> Fixes: 57d3b816718c ("firmware: qcom_scm: Remove thin wrappers")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/firmware/qcom_scm.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 7db8066b19fd..3f67bf774821 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -749,12 +749,6 @@ int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare)
>   	};
>   	int ret;
>   
> -	desc.args[0] = addr;
> -	desc.args[1] = size;
> -	desc.args[2] = spare;
> -	desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_RW, QCOM_SCM_VAL,
> -				     QCOM_SCM_VAL);
> -
>   	ret = qcom_scm_call(__scm->dev, &desc, NULL);
>   
>   	/* the pg table has been initialized already, ignore the error */
> 

