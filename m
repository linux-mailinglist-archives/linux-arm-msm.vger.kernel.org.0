Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 907D97C5095
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 12:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234811AbjJKKwL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 06:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234886AbjJKKwH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 06:52:07 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A70CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 03:52:05 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-32d3755214dso1409147f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 03:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1697021524; x=1697626324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TwWT4IYbpXX6DFtsyZBSiSeurVMLjbNbulZ+VeIuYDs=;
        b=Ugcfb81P4Ooh6vAxTH10lY2xWbJv8OHAPNyoPWhWPPIWXFAfckMtuzYl7PCqHlG1rU
         61zaUANrACN/0oMVBdtrENsPpeu+zDIW1/tatgORDsV0N9UmP6rlCRQ2mTD1za/7LSAh
         Na4ET+OuwFuCOHnU+4YMjRT7BST/PhQN2Abzmqh5xYsbitvCO4f36q1zpilKoDRhJX83
         x0WSxWtVxXsT1XwsF1rHQsLHnx5wO575ZH9Z24PtuHEK0dAaJA2/r7cJ8PGaW27cDZKq
         tQs9arelqmc91U5Qw5o2fA7/u/40VV892rg2zhzQekAOMz1K/i1Rk5xCZC5/TrTNI+vo
         51ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697021524; x=1697626324;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TwWT4IYbpXX6DFtsyZBSiSeurVMLjbNbulZ+VeIuYDs=;
        b=j7eHPV5Au9NWzxERz+R9pl77mFbRSf16wxpXLSYpufTnBexoXWu2q/CKyFzxaZKdFJ
         XP0th1/RrDighX67Wx7kEdgO9jHNzCOjVu4a6ORC4zAM7MC2SDAz8Pxe1SkvwbNLIxvU
         jX3HwRhOsH+JdM2f8uV5trAfghqzwKasGz95AdqZgMpDn66XlPAXoQCw7729j5z7XzRk
         S3dwl5cp3QTgEgS1tVvaby5vLsAR/zkbPpqIjMoMxYcUUubwgCx0MCCkNJSigphPx7/g
         GzNY9Sxl0+dh8pl4b1f6XJIkZTGvF0gp6Ftv1mh9BS2xGzw6A+/YVJr++/F8NlIpltpM
         cPlg==
X-Gm-Message-State: AOJu0YxEuIXJmDK6DgVIOZr07nkTPQ+IV5RfveQqoPlzCFhPbLl93j9r
        GigMfz0zKfOPT2btWC5NIT0F6g==
X-Google-Smtp-Source: AGHT+IEXISshUTVPtxuyUeL4wx1qW+uUDwVadrLh4BOqT5XeQ1RR0hjE1Eq8bw6kFW7kfimA7KekTQ==
X-Received: by 2002:a5d:4149:0:b0:31f:eb8d:481f with SMTP id c9-20020a5d4149000000b0031feb8d481fmr18571149wrq.29.1697021523796;
        Wed, 11 Oct 2023 03:52:03 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id t4-20020a0560001a4400b0032763287473sm15312339wry.75.2023.10.11.03.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 03:52:03 -0700 (PDT)
Message-ID: <81b1f92b-92ce-4e4d-8385-bab3a2acece4@nexus-software.ie>
Date:   Wed, 11 Oct 2023 11:52:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: defconfig: enable DisplayPort altmode support
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
References: <20231011103245.96638-1-dmitry.baryshkov@linaro.org>
 <20231011103245.96638-2-dmitry.baryshkov@linaro.org>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20231011103245.96638-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/10/2023 11:32, Dmitry Baryshkov wrote:
> Enable the DisplayPort altmode, it is required to get DisplayPort output
> to work on devices like Qualcomm Robotics RB5 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 9509a73db774..5807397e645a 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1048,6 +1048,7 @@ CONFIG_TYPEC_MUX_FSA4480=m
>   CONFIG_TYPEC_MUX_NB7VPQ904M=m
>   CONFIG_UCSI_CCG=m
>   CONFIG_TYPEC_MUX_GPIO_SBU=m
> +CONFIG_TYPEC_DP_ALTMODE=m
>   CONFIG_MMC=y
>   CONFIG_MMC_BLOCK_MINORS=32
>   CONFIG_MMC_ARMMMCI=y
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
