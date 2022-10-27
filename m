Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC94160F7B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 14:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235644AbiJ0Mnh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 08:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235216AbiJ0Mne (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 08:43:34 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B9AD8E47D
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 05:43:32 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id j14so2256471ljh.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 05:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=atHpyVeDvRSxK97x6ncdrfXkT0/3Udk1X2L2iSDbRWI=;
        b=mfT4BdhP9SUoj/74Ss/1RbrT+saz3w/uYz94FzaYqv9/gI9t3NG8VIyQpLAJEy/jRw
         UzwB5xV7gaNkqmjKZvkTJcXnu4zrztTKJBvDTCJT9PzS2emX3wRl9jaNGzh1oKNe4fI5
         OPO0bCr+2kZRbuNN9K0KbpbCXnycHiXff9Wwl2spQKkUWt9//l7yzUS6aCR9vUlLRKMH
         nuf5+BmldZxhwr48LCN460/Kp4F+MFS2IXn/Bpd29IWPJmqNoW5jBsbaUkWO3XmvUZ6Y
         /C/Ew6CeotdbDC0QThlsPM6MGVeHIv0DFFymvQ3M0anjq/6LF76yxrNxh2IINMgX+JRw
         2BKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=atHpyVeDvRSxK97x6ncdrfXkT0/3Udk1X2L2iSDbRWI=;
        b=18NlcliM4p/TIrQtXmYrH0UjSV3mxFuQ/EwbwEm+k+TqK6l4p3TC8u3I7zb5GuMGUU
         b6nD3sZWicPDOVthTiZBqsg/VSOIlvz5j9qpA3Wv341T+EjEpbOTyS2Z4t0jVaoIfgn0
         +ZOVICR38xBb0JFQO4u51c5ied+lTvvq/GiwEBAaXQ0RkReM26n1SDRuoePoi8/FijHr
         vgakuH2mL3CdQy8d76lULNOIgJKjZI5Krp+MQeolEQRIpspKpcqU0uojbmdH3czN37pn
         PK2/W4NY6xKHhbrXYR74bM8vjP5pud2+PdyJM/FQnIyiu+GzrvXda8B4s7sYdKMetKkf
         qJug==
X-Gm-Message-State: ACrzQf1qFXkrtC+YQvdf42m7rKq/0X/fojo0+FR3HXOian5vsfyXMdtE
        vS8rkB4/V64XdIih2082x/j7tg==
X-Google-Smtp-Source: AMsMyM6zRp9lukIKib2/jvNiSe8l+sxzPJvD16MdorWgPwYLJK8JlqoB7SJqTxLRPQXghF6b12xGJA==
X-Received: by 2002:a2e:be10:0:b0:26f:b35e:c29e with SMTP id z16-20020a2ebe10000000b0026fb35ec29emr19198877ljq.488.1666874610470;
        Thu, 27 Oct 2022 05:43:30 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id p18-20020a056512313200b004979ec19387sm167821lfd.305.2022.10.27.05.43.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 05:43:30 -0700 (PDT)
Message-ID: <cd5a049d-0ff4-bd61-1e0e-81b9ed5911fb@linaro.org>
Date:   Thu, 27 Oct 2022 15:43:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 2/5] clk: qcom: dispcc-sm8250: Add RETAIN_FF_ENABLE
 flag for mdss_gdsc
Content-Language: en-GB
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>
References: <20221027123432.1818530-1-robert.foss@linaro.org>
 <20221027123432.1818530-2-robert.foss@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221027123432.1818530-2-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/10/2022 15:34, Robert Foss wrote:
> All SoC supported by this driver supports the RETAIN_FF_ENABLE flag,
> so it should be enabled here.
> 
> This feature enables registers to maintain their state after
> dis/re-enabling the GDSC.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   drivers/clk/qcom/dispcc-sm8250.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

