Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88440642469
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 09:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232064AbiLEIVi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 03:21:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232014AbiLEIVc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 03:21:32 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCBC8165A2
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 00:21:30 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id l26so1892755wms.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 00:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K2llCY+S9xP0hToJ39zAtXBAJ+E1kB9/4btQ1z2p/Q4=;
        b=aFLyenYtj1VL6wuR/g2gdAe1q5V5TQwJVLAkd1ZKz+sdOfTRzZmUOv5vustsRMOeTs
         4btJibz1hP4yDfNk5Yuk205BwWxNjRKt3v6uYSSzBnz6ysOvxJX3C9w2080TR6f61lQz
         E+7ipKTT3wGEPyO+NwcubahKwKjRLhTFufrXcn0pS7mpeSb4iyY6doeI4QSskynkry/j
         ZWGdctaUwNlJZav+kxHDU6z2rC8kMqOF+MvQLNWNXvQTK9VTuealurfLDruwGQWxeaIR
         pUcSSSf5ml6N2TeO98U6nSgxk3kpkAC38P5w2mdV3LwGJpktpuvCTCQThXTWwrazsdjy
         HYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2llCY+S9xP0hToJ39zAtXBAJ+E1kB9/4btQ1z2p/Q4=;
        b=0Omb1MO/l2tdZjW+9McAnBrxI4+OFt+8xRmeGknjkUJKoz38DGSZKybCVafvkD3S2s
         HZd96rgEZWSKtlUv14rrbDl8qEiBdWO1Zwup1dd/us4rsapebFIY9yAP/RSYr8p29Svh
         QpI/GUuCV2S6LmiTDmO2sCq41iB53C0umY3XUFaTPSXyMv1uawunC5cPtL71foqLVAH7
         AJY0ZIyoi1JboDliXD5+r7Gv89uADPeId40jUldovtKP8DbvEmCh5afnj8RLzsNDD2zW
         vPuEx30u5cQqrDpNTbMeF0VjZdcfxBEWwJ6cOY2feCBqOqzukdj8UP076Xp9v2ShgAjk
         3NXQ==
X-Gm-Message-State: ANoB5pnOIwN2jgE/TNsXtqNUJ6R7OupG8N4O49+xtAYD72cCvKaVAwMZ
        b//CL19edx0aJ0gBNfCMvGa57w==
X-Google-Smtp-Source: AA0mqf5WiuFbN9XlmBzCmsv4CfQxfb0C1sECJ1I5kEKyWuh6lTY6TqTzlCPoveUNn59ONI7Ib2WCKQ==
X-Received: by 2002:a05:600c:4f55:b0:3cf:729b:d4b4 with SMTP id m21-20020a05600c4f5500b003cf729bd4b4mr53799723wmq.48.1670228489132;
        Mon, 05 Dec 2022 00:21:29 -0800 (PST)
Received: from [192.168.7.93] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id k26-20020a05600c1c9a00b003b47b80cec3sm22816447wms.42.2022.12.05.00.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 00:21:28 -0800 (PST)
Message-ID: <71a1619d-717d-b251-a03b-083d26c35375@linaro.org>
Date:   Mon, 5 Dec 2022 09:21:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: fix refcount leak in
 adsp_alloc_memory_region()
Content-Language: en-US
To:     Wang Yufen <wangyufen@huawei.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        mathieu.poirier@linaro.org, lgirdwood@gmail.com, broonie@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <1670203687-42016-1-git-send-email-wangyufen@huawei.com>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <1670203687-42016-1-git-send-email-wangyufen@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/12/2022 02:28, Wang Yufen wrote:
> The node returned by of_parse_phandle() with refcount incremented,
> of_node_put() needs be called when finish using it. So add it in the
> end of of_address_to_resource().
> 
> Fixes: 9e004f97161d ("remoteproc: qcom: Rename Hexagon v5 PAS driver")
> Signed-off-by: Wang Yufen <wangyufen@huawei.com>
> ---
>   drivers/remoteproc/qcom_q6v5_pas.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 6afd094..24439a6 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -449,6 +449,7 @@ static int adsp_alloc_memory_region(struct qcom_adsp *adsp)
>   	}
>   
>   	ret = of_address_to_resource(node, 0, &r);
> +	of_node_put(node);
>   	if (ret)
>   		return ret;
>   


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
