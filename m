Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85D236B236E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 12:51:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbjCILvG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 06:51:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231684AbjCILu7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 06:50:59 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C943E6D8C
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 03:50:52 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id b10so1560437ljr.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 03:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678362651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0p4GJeTW3q1Bm2/iH91/9m5M3HxUnLVVr8JEVsqlujU=;
        b=uAZSDpCmSBwNzHJsUgDMCykjDJ1+2EhsM3/sNOoqDYXq/5IoNNAZHXLRQpZD/iQ2mO
         DfO3Vd5oKvloFhnYdYxwf7fx03eusaNTzTHu/5kxR3x9g0Cfb0/YVrzDSX+4ZDOK895C
         AHZk3GcyQT/gIUQNz6INSDejCZWbIHQrJHbCIC4aZGzy7iCd0pDgjwFs/rsPzVKT/4li
         FpFH+I546qrIOkmnXGNP007f37EO6FLk11hWjo4AOPRPu1EGIr7T9AfZC7vZgWvO20fd
         jWSj7JnjEPymzcU3/1s4Vnu0Ek0DzFR09UKXps49HrcGzyIuxRYlgSAnAa3d58RoWijR
         JR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678362651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0p4GJeTW3q1Bm2/iH91/9m5M3HxUnLVVr8JEVsqlujU=;
        b=azzWoHaU6PerIP8QIgpnCqNeJ2fo3ZS6SIVvgBkYwkYoMWUAUlnjZceuuKfoF1U5gP
         z5P1aG5QRNKT44/wFLVnm6nv2uYaij+iDqvwwPkOdrwlTnKgmzTuTkyk2EZRG486OT2X
         xhJUSr8aLNpXFDkzWVzqkGNPmSlShK13u0g6bElZgl7QrAejKxjBOUmBvIAOsQN80UW8
         2c8kR1QjjS+Qq5KuZTiPv/geoW2KaedQLjRPXzF6VqHGpuhu1stOgsfrV3Z/R4CzGTTv
         sPVdozgVTVo680r3tAA8UVpMwMq3bdec9wrwnr8IxjMRUlN/FHriZkwwXC+rQ4XOIWKh
         KcEQ==
X-Gm-Message-State: AO0yUKWbT8/GqmJ0gofZhDv1+6m0lhG+zCjC+NsQwqFdeFoBnKgfLcOt
        k2XtLQt7l1Yn+wu2xlrryGlHZLrunYaO6GVVhQ0=
X-Google-Smtp-Source: AK7set8qaEPB+6IvkHMO2wAKbTPPW2DKT1KREG6IcHAlmzSU24LD0/9ZZbHq/qvLBERUYYPsKzm2CA==
X-Received: by 2002:a2e:b5b7:0:b0:293:45dc:8b0f with SMTP id f23-20020a2eb5b7000000b0029345dc8b0fmr5553203ljn.26.1678362650788;
        Thu, 09 Mar 2023 03:50:50 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id i186-20020a2e22c3000000b002946be8475esm2905584lji.135.2023.03.09.03.50.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 03:50:49 -0800 (PST)
Message-ID: <fb9392b2-429c-2dd4-baa9-953f2a2f6dd7@linaro.org>
Date:   Thu, 9 Mar 2023 12:50:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] firmware: qcom: scm: fix bogus irq error at probe
To:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>
References: <20230309111209.31606-1-johan+linaro@kernel.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230309111209.31606-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9.03.2023 12:12, Johan Hovold wrote:
> A recent commit added support for an optional interrupt which is only
> available on some platforms.
> 
> Stop spamming the logs with bogus error messages on platforms that do
> not use this new optional resource:
> 
> 	qcom_scm firmware:scm: error -ENXIO: IRQ index 0 not found
> 
> Fixes: 6bf325992236 ("firmware: qcom: scm: Add wait-queue handling logic")
> Cc: Guru Das Srinagesh <quic_gurus@quicinc.com>
> Cc: Sibi Sankar <quic_sibis@quicinc.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/firmware/qcom_scm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 468d4d5ab550..b1e11f85b805 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -1479,7 +1479,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  
>  	init_completion(&__scm->waitq_comp);
>  
> -	irq = platform_get_irq(pdev, 0);
> +	irq = platform_get_irq_optional(pdev, 0);
>  	if (irq < 0) {
>  		if (irq != -ENXIO)
>  			return irq;
