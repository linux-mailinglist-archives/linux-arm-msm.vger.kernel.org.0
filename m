Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30B4A6C6BA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 15:55:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231395AbjCWOzp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 10:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231934AbjCWOzo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 10:55:44 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 457521C5A0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 07:55:43 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id p13-20020a05600c358d00b003ed346d4522so1291891wmq.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 07:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679583342;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E4M/ocI2aBcPn7dk5asZ9gOO9Pu/P0ulfvgoCMj9PfY=;
        b=RmV1ULAgTJbfeUfTtYLc5lEFYTxluY6m2quGpt4+y7JYzrBrQKsWHJkv9Mj+wR+VAi
         ki8lj0Kuzg3yh36GG3+zi40V5Z0k68rKEd/m7aocaWqQn0s4JTveHBM+C/Ka2JEsi3E8
         gNjcCzo6TxvvFOJ28jbMS7ioX/PT+O4nCMsHtKCW2iZXIXOisz8kBaoWhMlkviVIU2sd
         fqviPYZioYlnSMqY4zBLtZtzGukuhuinmxWyF58Y3vS6TWhoiNcMK9z2zP9xq7qk04S2
         q/gDaz1m4FV69B2fRHaPmnILvQXbxyAZDNUGPUiOcSYkzyahrXjm4mYPhxTZCe6//kec
         DL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679583342;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E4M/ocI2aBcPn7dk5asZ9gOO9Pu/P0ulfvgoCMj9PfY=;
        b=DKJmEGj/Hj2/u95cvLWA6pbm2ldM6bDtd0gn8Nczr5Se6CyGevMAr+vS/4AJuthhT6
         cHFhWCODtTHmOwatuCulkLQu0xVHbemvEvX0rJ5tjyevoY5YosuxGFL0hk6JKO+Ip4gk
         wmezAT1O7s96adTiokYbpkBfY/xVNMsbmgLpdQfjkoGcIvwG7dQUZcI1/wG5F37E8rWE
         26Y9tlW4cxyqWQIFRQKDxI5IGvjXFPTTOYbXSZqVTR7Z0NBgvBxRz18trCEVXIS2hPVO
         ZTBKvLw4/w46v6ZMRB3mXInvOAMPZQoKPC3OKQ7V6VRsWHpbe/vJXZ5t8I5/bJwxrwbE
         s6jA==
X-Gm-Message-State: AO0yUKVSpzF4Ed08yV6qv5WPj/laBGOITMmDTp0IohZnlBPvRSwOR20Y
        NK02aQ6cTiv8iJsGgOt2FIG/WA==
X-Google-Smtp-Source: AK7set8LJt6KIjfhsLiEainbvIdVwncLRYQNGucOcCMZbcxLr+nXfx0+M8cDo2o1/t33Ffuzwi3nsQ==
X-Received: by 2002:a05:600c:21c7:b0:3ed:9ce3:4a39 with SMTP id x7-20020a05600c21c700b003ed9ce34a39mr2594952wmj.26.1679583341756;
        Thu, 23 Mar 2023 07:55:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e25a:65de:379a:3899? ([2a01:e0a:982:cbb0:e25a:65de:379a:3899])
        by smtp.gmail.com with ESMTPSA id c26-20020a7bc01a000000b003ee44b2effasm2114297wmb.12.2023.03.23.07.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 07:55:41 -0700 (PDT)
Message-ID: <058166cd-c5bd-7baf-6c1e-fa28f2a918b5@linaro.org>
Date:   Thu, 23 Mar 2023 15:55:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] phy: qcom-qmp-combo: fix v3 offsets table
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20230323144726.1614344-1-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230323144726.1614344-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/03/2023 15:47, Dmitry Baryshkov wrote:
> SM8350 and SM8450 use qmp_combo_offsets_v3 table, which doesn't have
> PCS_USB offset. Add the usb3_pcs_usb entry to program correct registers
> while setting up sm8350 and sm8450 USB+DP combo PHYs.
> 
> Fixes: 05bd18348b88 ("phy: qcom-qmp-combo: Add config for SM6350")
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index c1483e157af4..3b488d12c933 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -1396,6 +1396,7 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v3 = {
>   	.usb3_serdes	= 0x1000,
>   	.usb3_pcs_misc	= 0x1a00,
>   	.usb3_pcs	= 0x1c00,
> +	.usb3_pcs_usb	= 0x1f00,
>   	.dp_serdes	= 0x2000,
>   	.dp_txa		= 0x2200,
>   	.dp_txb		= 0x2600,

Thanks for the fix, I totally missed the legacy bindings pcs_usb_offset.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
