Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 991105F07CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 11:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231460AbiI3Jma (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 05:42:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbiI3Jm3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 05:42:29 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 480B4BC91D
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 02:42:28 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id t16so4223342ljh.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 02:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date;
        bh=zzO/BABXosBW26dQzbnEVuKM6qmCAqUZCHFz/+F2wbU=;
        b=vog+SdyMWmM8BsTAKPH5HaEUFfZVGn3pbQBKPMtytKUC9k+5IA0QqXJ1ZKm417DmSt
         lqxWMAxG5UeXGnLbqTxE80hkfsmLRB3gWxsl0witKG5XbkWB2BUv/uXpAMVVGZdjKT6y
         nDyv4uNEIe5H7/gPSzb0e+8wf45G0YEq+7uM/2qIKJ7vJns58a0AkCP7JJErgpdMgk4c
         GsNPCtg0Rpb+44u6/qi0L26NQhivFror84C5ohokPpTv7sIj44Hym2plPPIWsMGJPPTq
         TklMJMsc8CmTsDIbe+9eCQRkz8x8ukdkAzFfkquTi4+FcCAQ4p9aIg7oTWlGw4mYHu+7
         jVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=zzO/BABXosBW26dQzbnEVuKM6qmCAqUZCHFz/+F2wbU=;
        b=yUA09FTyq41P1vdCs2BtkfT+cEWusUpzSEb0bgr7kcZaqsZT/SjVPykXWyy4j0AyoD
         i1DRHJULRbiMB+A1q4T6E3WlkZqQu3ymISgKjVzJwj68ztX0PBbSJa5ncmzjP8eLeePA
         9qteQwPn7GrQnh3CBsd6HURZ0F6gZdET51YxjL4CRF1+jQr7Wig9IX0Snoc8kcspyUAp
         KsFKWpV+gCrspHHQRx/dPmICB7miDe6I5rdi1mdrAAobY1B5qA00eJ/7O4smNdeNXrbd
         Ip6iWrHUffUmUrYdaekVfC2Bh8FDoYLWqSUik1bIZFcz1jZmr0nXZ5a8teUJEACpqbSz
         iOKg==
X-Gm-Message-State: ACrzQf3uGczFDI2g69I/2P997gWVaS0EG6yH6p0AtzU6lfD9bl3WPvuL
        17FO6isyeuAuCrwHA9JiVAE2K+FBb5ab7w==
X-Google-Smtp-Source: AMsMyM5F1t3B9dgH4g2gHekokkYTbTUDVoKD2+k7NhubEORICaGbBVq5Pi5IQuwRymtc5m1QgIRtTw==
X-Received: by 2002:a2e:3211:0:b0:261:c5c8:3403 with SMTP id y17-20020a2e3211000000b00261c5c83403mr2766450ljy.86.1664530946585;
        Fri, 30 Sep 2022 02:42:26 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u15-20020a05651206cf00b0048af9d2d119sm240785lff.130.2022.09.30.02.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 02:42:26 -0700 (PDT)
Message-ID: <c3aafcdf-9e24-9fbb-b022-d7d1cf04b7b9@linaro.org>
Date:   Fri, 30 Sep 2022 11:42:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/2] slimbus: stream: handle unsupported bitrates for
 presence rate
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
References: <20220930092006.85982-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220930092006.85982-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/09/2022 11:20, Krzysztof Kozlowski wrote:
> Handle errors of getting presence rate for unsupported stream bitrate,
> instead of sending -EINVAL in change content message.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/slimbus/stream.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
> index f8eade1e0132..28fbecb3907d 100644
> --- a/drivers/slimbus/stream.c
> +++ b/drivers/slimbus/stream.c
> @@ -204,7 +204,7 @@ int slim_stream_prepare(struct slim_stream_runtime *rt,
>  {
>  	struct slim_controller *ctrl = rt->dev->ctrl;
>  	struct slim_port *port;
> -	int num_ports, i, port_id;
> +	int num_ports, i, port_id, prrate;
>  
>  	pr_err("%s:%d AAAA\n", __func__, __LINE__);

The context is from development tree. I'll rebase and send a v2.


Best regards,
Krzysztof

