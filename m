Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14E715AEE3F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Sep 2022 16:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234303AbiIFO42 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 10:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234774AbiIFOz7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 10:55:59 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7405A61C3
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 07:11:29 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id t7so10634696wrm.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 07:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=B4zfi3wHSNn9FNlM9S1l96FbYQ36vHWz1Z7BKLcOeUk=;
        b=HtLtWrmT9J5OUZ+Mgk7ErJkgpk+bWLlnGOg6axa5AqioTxGP2LV0NPYhYCOPRGhmJm
         fE4WXxWBo/G/YqNFOlmWoyzCMvqa4eiSDVLxAecuwqHHRKyfuEqGY5sX/GYubEmlwp8S
         aUEUbTEKz88BXEdKWD2v8qPDRThEdf3a+Hu1QlbaMdeZe1KQptbbn5X919x5IGKO2GnN
         fd7ngKZx4MvfgY+Fg/9udCPYjiFY08xab8UNPV3DanO9E0tfv5DlyiM02nF3ZtU1hTV4
         TKcLE7hZcQuI/qHhw4UOHOAxloixpvcQFdD1oaxOiywbE/RLOwNMo5UwxYkdyDdwen7x
         wZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=B4zfi3wHSNn9FNlM9S1l96FbYQ36vHWz1Z7BKLcOeUk=;
        b=74AQfDThtjufojrjtPQqxr7Si4VCfeQQSJPg2QqNi3oRR+wfRwKWaINKZceeczs0oN
         1sup1TQ3Yo3OvkGUooSdNxuvlh9XxcXSQFkZRqC5PDuusM+BkdD4ozFEauyE8LBtKTlp
         oFaV4U9XV/DTctleAQ+wOVX3dqvBCzm3BEJPzreFltofzScSHm6UrndE7MpC04+EnPEd
         yvC4Fboo6pVQ3QUswiKQSnzoTg7SYzdswPEgQymt1GySEiYAixcSiwPl3yF4Cz+1oVJ2
         65o19bmDcksaxZyyN+XZh4oTjQp4FJqOjCLZ9HZZOssgazMU6igIz8B1vjmN7XuWVF3U
         EguQ==
X-Gm-Message-State: ACgBeo0D9WLyZ+Itv/D3xkWaW17HBuoRKASiaHJoqHcULmP2Rb5PVyGI
        IXLx75ms5zbMqNkYPcfPIKtIiw==
X-Google-Smtp-Source: AA6agR442JJYtEnYGbWrbyNv+k4nZN59FCMH3VE5596ziuJEKLg70UbjQJUDeurPfpNtQrC4GSg6tw==
X-Received: by 2002:a05:6000:11d0:b0:228:8d5d:f2e9 with SMTP id i16-20020a05600011d000b002288d5df2e9mr5765730wrx.207.1662473434061;
        Tue, 06 Sep 2022 07:10:34 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id a11-20020a056000050b00b002205a5de337sm12907305wrf.102.2022.09.06.07.10.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 07:10:33 -0700 (PDT)
Message-ID: <229baa14-9436-a35b-8e4f-4ec5e55f6136@linaro.org>
Date:   Tue, 6 Sep 2022 15:10:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 05/10] misc: fastrpc: Use fastrpc_map_put in
 fastrpc_map_create on fail
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ekansh Gupta <quic_ekagupt@quicinc.com>
Cc:     Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
References: <20220902154900.3404524-1-abel.vesa@linaro.org>
 <20220902154900.3404524-6-abel.vesa@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220902154900.3404524-6-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 02/09/2022 16:48, Abel Vesa wrote:
> Move the kref_init right after the allocation so that we can use
> fastrpc_map_put on any following error case.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

>   drivers/misc/fastrpc.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 6730aa324e10..5eececd9b6bd 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -745,6 +745,8 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>   		return -ENOMEM;
>   
>   	INIT_LIST_HEAD(&map->node);
> +	kref_init(&map->refcount);
> +
>   	map->fl = fl;
>   	map->fd = fd;
>   	map->buf = dma_buf_get(fd);
> @@ -771,7 +773,6 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>   	map->size = len;
>   	map->va = sg_virt(map->table->sgl);
>   	map->len = len;
> -	kref_init(&map->refcount);
>   
>   	if (attr & FASTRPC_ATTR_SECUREMAP) {
>   		/*
> @@ -801,7 +802,7 @@ static int fastrpc_map_create(struct fastrpc_user *fl, int fd,
>   attach_err:
>   	dma_buf_put(map->buf);
>   get_err:
> -	kfree(map);
> +	fastrpc_map_put(map);
>   
>   	return err;
>   }
