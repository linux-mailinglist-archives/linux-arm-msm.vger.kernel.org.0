Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43F3862F717
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 15:19:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242265AbiKROTb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 09:19:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242256AbiKROT3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 09:19:29 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DB03C76E
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 06:19:28 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id n12so13322267eja.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 06:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=huayGJZuEj82T3VVhDBfYhkqbqsIQAROvGUjJHMy0A4=;
        b=BSd6d199NcnnzDGi4lrYRPT//cxZq4puzQawgEGxmol7u3hAoc1R4UMctzanxVT5ZI
         9uM/GXS/0GijzL2xZSc+KKGGaUTXHnqyWyPrONkVi1jcBKpn51yK+sX7MgpWcc+gInLG
         TgxDdjLCyRzL3juUiZQ+V0GBo1uvK/LuMaE3n677+33i6Evh9pA0K8SLvu7MrqRiv02Y
         5pb1wabXt3b6VHtT5djc+i38irWqod0/WQtZGt67U/kiqblPZtyMaD2uoOr6tr+z+6rt
         aed2mErkQy1gikw+kZFROJrFhAX6Eg+gfhGeskWFkOinrGtrSfvvlDDr5LuSpGVP91A6
         Igmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=huayGJZuEj82T3VVhDBfYhkqbqsIQAROvGUjJHMy0A4=;
        b=hRG+C4NkAqJiVjTen5bECiP3w+KqR/7RBSPBLeLJ9nKa4jggUfRmTizUOO0pyQqCGH
         Cgq21cvKkbHvvGyalv+6KNPMhIVXXMQ0LD2uzmg6Mnnwt7SjWNg/8DzbzVMfYAKgIdo/
         NZi4TjVR/yPm4IeBZRyaNAlvjFqZRnuH8igTWc4UOxmthYgc+jmcTmUEjO9hZymlORsF
         AYJ2fLUpkemIctS7k868Vdmxx189tYrPY+3PO6Q9BV97LNlmczJifzYfLaqlC39/Fv/D
         Zns+QquN2U4fCcbj+xvdC2XC/AQC0VOXhziPhF6p+S361CuwmQxWGaL+4YwwhWui+EQy
         vdkw==
X-Gm-Message-State: ANoB5plZSaljgBTAgIR6ThJV9k1mLiDQU8fAVxehMBUaPdKA6b0l8mrP
        nGv5L/cCynBkNLkpN4ecZOzkQw==
X-Google-Smtp-Source: AA0mqf6uK3wLOR2f3cv8+L5adpdIIy9QHfdrqKmoyY5V4tC4oEGoKDk8aU1bKav2RGmAnpcMQdBaUQ==
X-Received: by 2002:a17:906:c24e:b0:778:d81d:b1f0 with SMTP id bl14-20020a170906c24e00b00778d81db1f0mr6113608ejb.731.1668781167068;
        Fri, 18 Nov 2022 06:19:27 -0800 (PST)
Received: from [192.168.156.208] (92.40.169.209.threembb.co.uk. [92.40.169.209])
        by smtp.gmail.com with ESMTPSA id ky13-20020a170907778d00b0077a1dd3e7b7sm1717981ejc.102.2022.11.18.06.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 06:19:26 -0800 (PST)
Message-ID: <4e8c2d46-ef74-42ad-e70f-dfc9a796f13a@linaro.org>
Date:   Fri, 18 Nov 2022 14:19:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 1/2] remoteproc: qcom_q6v5_pas: disable wakeup on probe
 fail or remove
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Mukesh Ojha <quic_mojha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <s3FHojr9Uw7APAwEfc-TCdbc4o_X6o3a0BQxTBjrfM2kWX7tqxnECIE9VtPZmGaEl7Rxl5Qltzu76_QYm_jHqg==@protonmail.internalid>
 <20221118090816.100012-1-luca.weiss@fairphone.com>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20221118090816.100012-1-luca.weiss@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 18/11/2022 09:08, Luca Weiss wrote:
> Leaving wakeup enabled during probe fail (-EPROBE_DEFER) or remove makes
> the subsequent probe fail.
> 
> [    3.749454] remoteproc remoteproc0: releasing 3000000.remoteproc
> [    3.752949] qcom_q6v5_pas: probe of 3000000.remoteproc failed with error -17
> [    3.878935] remoteproc remoteproc0: releasing 4080000.remoteproc
> [    3.887602] qcom_q6v5_pas: probe of 4080000.remoteproc failed with error -17
> [    4.319552] remoteproc remoteproc0: releasing 8300000.remoteproc
> [    4.332716] qcom_q6v5_pas: probe of 8300000.remoteproc failed with error -17
> 
> Fix this by disabling wakeup in both cases so the driver can properly
> probe on the next try.
> 
> Fixes: a781e5aa5911 ("remoteproc: core: Prevent system suspend during remoteproc recovery")
> Fixes: dc86c129b4fb ("remoteproc: qcom: pas: Mark devices as wakeup capable")
> Reviewed-by: Mukesh Ojha <quic_mojha@quicinc.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
> Changes in v2:
> * move new line before rproc_free which frees 'adsp' as well
> * pick up tags
> 
>   drivers/remoteproc/qcom_q6v5_pas.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 6afd0941e552..67f5152e2398 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -556,6 +556,7 @@ static int adsp_probe(struct platform_device *pdev)
>   detach_proxy_pds:
>   	adsp_pds_detach(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
>   free_rproc:
> +	device_init_wakeup(adsp->dev, false);
>   	rproc_free(rproc);
> 
>   	return ret;
> @@ -572,6 +573,7 @@ static int adsp_remove(struct platform_device *pdev)
>   	qcom_remove_sysmon_subdev(adsp->sysmon);
>   	qcom_remove_smd_subdev(adsp->rproc, &adsp->smd_subdev);
>   	qcom_remove_ssr_subdev(adsp->rproc, &adsp->ssr_subdev);
> +	device_init_wakeup(adsp->dev, false);
>   	rproc_free(adsp->rproc);
> 
>   	return 0;
> --
> 2.38.1
> 

-- 
Kind Regards,
Caleb (they/them)
