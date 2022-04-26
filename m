Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20D7D50ED27
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 02:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239393AbiDZAJB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Apr 2022 20:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239121AbiDZAJA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Apr 2022 20:09:00 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C2C113796
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 17:05:55 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id x33so29087083lfu.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 17:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=I4wZrpcqpY23HjGTdRVWpcxvWKlwdsGGFL/N6W8CJ2U=;
        b=UO9vEjaKrcoqWvgG7eshOb470xBd9TV7qtKJw9FOm3/SsdEthQOUpHamqL+aYO+9ty
         IauEV7r0129/CyoX1opTQjt6dCvpH/kHVkSLujjNFZvGTSfDKq6+ZcpTIrlGkwY4Oa/w
         Uyr7PvS0/G73+PbJ3XC2NQzVVnaugewgJCzXEFSgixQ58rTnCIS/aNW89FSpMnEKTvgk
         YLOJDNigCxYBL9z8aXKazwUJngwZFtTAObfGNGh1fP61Td4/5uEh/HYZOxmpDJ1FPZpi
         nbb4rJ0lJv5y97IQK25pFg/pi06CFse1clI5VloNTRlNQqH1GfSwdRM8Dg7VXQ3m62FW
         8N9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=I4wZrpcqpY23HjGTdRVWpcxvWKlwdsGGFL/N6W8CJ2U=;
        b=a5v/HpVQJ8tGSyvcADsvBhqKAJuPI3PxemE7hbyIDpMCKNoKQXH8DAXDEL57sHGNyY
         JnM74eW8XGrf8fiuDFJ1WYFq2YRB2UOvqc+f3tyCVW/+QxNHyuf/eaNh82TOIsrOvKOT
         abDHYdAt1VroKerqWIMYPiXC1qwhk36YNZd4PNdP0dFLRi4/Q20oNltSZO8H/cdONQwy
         wNaZYZ/1S2gCy1WyX0mRxbDxiGhsxy8jviSfbhwgoLQA71dPGNj0DQxFi5CmtGdviPu5
         x8usalfnCPr+GcPHTtIKMBThh5hXH3j/53Nx8hEVi71PkU8BxbKcGmfBuPdxd7WwQxjV
         tcdA==
X-Gm-Message-State: AOAM530Azjzy2J5xVwL0iOP7uXnbrVYV9RZnPhtlKwan6TXC52cIh6R2
        3G1g5hAVX5LiFJJXN93N2/V/rQ==
X-Google-Smtp-Source: ABdhPJy7QiuGL02pBXE/dt8cSME5KdzlIgZ/vty8ZsP14pDWE/qTuFuSxDNKp6DRPFZBoGZySvRwNw==
X-Received: by 2002:a19:ad46:0:b0:46b:b1a4:ffd5 with SMTP id s6-20020a19ad46000000b0046bb1a4ffd5mr14627769lfd.103.1650931553470;
        Mon, 25 Apr 2022 17:05:53 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f22-20020a2e6a16000000b0024f0cf6fdb0sm736179ljc.138.2022.04.25.17.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 17:05:53 -0700 (PDT)
Message-ID: <36150c01-9146-cebf-bd86-8e096135cbcd@linaro.org>
Date:   Tue, 26 Apr 2022 03:05:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/msm/disp/dpu1: set vbif hw config to NULL to avoid
 use after memory free during pm runtime resume
Content-Language: en-GB
To:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, quic_kalyant@quicinc.com
References: <1650857213-30075-1-git-send-email-quic_vpolimer@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1650857213-30075-1-git-send-email-quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/04/2022 06:26, Vinod Polimera wrote:
> BUG: Unable to handle kernel paging request at virtual address 006b6b6b6b6b6be3
> 
> Call trace:
>    dpu_vbif_init_memtypes+0x40/0xb8
>    dpu_runtime_resume+0xcc/0x1c0
>    pm_generic_runtime_resume+0x30/0x44
>    __genpd_runtime_resume+0x68/0x7c
>    genpd_runtime_resume+0x134/0x258
>    __rpm_callback+0x98/0x138
>    rpm_callback+0x30/0x88
>    rpm_resume+0x36c/0x49c
>    __pm_runtime_resume+0x80/0xb0
>    dpu_core_irq_uninstall+0x30/0xb0
>    dpu_irq_uninstall+0x18/0x24
>    msm_drm_uninit+0xd8/0x16c
> 
> Fixes: 25fdd5933e4 ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Let's merge this fix now. However I think that a proper solution would 
be to disable pm_runtime once we are in the uninit path.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 9c346ce..59982d3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -793,8 +793,10 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
>   		for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
>   			u32 vbif_idx = dpu_kms->catalog->vbif[i].id;
>   
> -			if ((vbif_idx < VBIF_MAX) && dpu_kms->hw_vbif[vbif_idx])
> +			if ((vbif_idx < VBIF_MAX) && dpu_kms->hw_vbif[vbif_idx]) {
>   				dpu_hw_vbif_destroy(dpu_kms->hw_vbif[vbif_idx]);
> +				dpu_kms->hw_vbif[vbif_idx] = NULL;
> +			}
>   		}
>   	}
>   


-- 
With best wishes
Dmitry
