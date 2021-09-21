Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65848413595
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 16:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233647AbhIUOvE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 10:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233644AbhIUOvE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 10:51:04 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 858CEC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 07:49:35 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id ee50so1590360edb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 07:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kbJXvFoSEvxHLyKnjMflLly9fly3CInLB69cwVX7xdo=;
        b=tYSW29yeUWqRzvnjRGrKTSE4VCN2prpGK7avcSPiX2hbcRhvWIe4eHsRIhzvW8dvhD
         RZodQF8gcy1FmSyHcT23rkhFTt/PN07lWVwTqlpzJy75LA/OoASnp3OWGCaJfa6knqym
         ubaciDfYlukBacgpGy/L5aMfhOEu4BE9h1H7T1H2sr++0Wq3AgrjP6P1I7UHWxLKIzaB
         Ab+8QS/YW8jzKhc+QLeBQrI3Q3b2K/CiUn4u4azS8Glw0t9bJO7ou252ZP9z8wVNnOEv
         HS+u1hhY/IqkfgCixx282iGqUFuSj/YljbeRStdmqTjBGJi/RZykK/kM7xdzkObl7PYi
         3Emw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kbJXvFoSEvxHLyKnjMflLly9fly3CInLB69cwVX7xdo=;
        b=cG5X8yTnelMcmqhhoTyGxfRXtH9loMS1PZJvUm52pByIHCa8ccYBsgbdvAXimWzbi3
         S3u+efAb1ZwBiWmzpL7UzHpbX7+IB7krLvcyd1E+kq7MwU7GthMbq/RE9VPsldhUSz6B
         jr4JKQQfAU7YoML5XP0g+FCYvF+kmtKMyUv3YGz2qIrK2XcN3aUeaiJZXy9XvlflKzDL
         yXhcIF5hfPWqk9SoBqFwK/Rt8AOlS5xl/PcwG1EracGkySV18MUf86sIGjWDdESUhcfO
         DSMfaA7WR0egAcZaImrHNFTsjiQ2Su62HbHun63cakW2DiIOjBFxxkz8cYtMzda8MoK5
         /UZQ==
X-Gm-Message-State: AOAM532O1LWYZtAsZAOAwkV0pimYeHOcBSx3pdHCh49MSIlpYneDo4MH
        r/H91BJBxvOmys4OfV6cpPiG1w==
X-Google-Smtp-Source: ABdhPJxaFH1ZMxaaIbwngcLMnTBozQuyOC7lMAQM4ZXlVrQUypzfk0udabkL58rFHitwgBFLHVb48g==
X-Received: by 2002:a17:906:3693:: with SMTP id a19mr35581281ejc.237.1632235658651;
        Tue, 21 Sep 2021 07:47:38 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id t24sm8675788edr.84.2021.09.21.07.47.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 07:47:38 -0700 (PDT)
Subject: Re: [PATCH] misc: fastrpc: Update number of max fastrpc sessions
To:     Jeya R <jeyr@codeaurora.org>, linux-arm-msm@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        fastrpc.upstream@qti.qualcomm.com
References: <1632123274-32054-1-git-send-email-jeyr@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c5ff1eae-d45f-3aac-c2a0-32d23c33620d@linaro.org>
Date:   Tue, 21 Sep 2021 15:47:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1632123274-32054-1-git-send-email-jeyr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20/09/2021 08:34, Jeya R wrote:
> For latest chipsets, upto 13 fastrpc sessions can be
> supported. This includes 12 compute sessions and 1 cpz
> session. Not updating this might result to out of bounds
> memory access issues if more than 9 context bank nodes
> are added to the DT file.
> 
> Signed-off-by: Jeya R <jeyr@codeaurora.org>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   drivers/misc/fastrpc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index beda610..bd7811e 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -24,7 +24,7 @@
>   #define SDSP_DOMAIN_ID (2)
>   #define CDSP_DOMAIN_ID (3)
>   #define FASTRPC_DEV_MAX		4 /* adsp, mdsp, slpi, cdsp*/
> -#define FASTRPC_MAX_SESSIONS	9 /*8 compute, 1 cpz*/
> +#define FASTRPC_MAX_SESSIONS	13 /*12 compute, 1 cpz*/
>   #define FASTRPC_ALIGN		128
>   #define FASTRPC_MAX_FDLIST	16
>   #define FASTRPC_MAX_CRCLIST	64
> 
