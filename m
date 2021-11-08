Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4F9447FDA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 13:51:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235912AbhKHMyL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 07:54:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbhKHMyK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 07:54:10 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E9BCC061570;
        Mon,  8 Nov 2021 04:51:26 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id o18so35873350lfu.13;
        Mon, 08 Nov 2021 04:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=1brUdH+0MEki3bYq8GSoruDwb0IeBRNfpvk1Iq+GA/8=;
        b=NyzF7A5NPc4MLJLZwR6dSJ7LQ8cMnRw9W9k410Vm6cIk1quUeIJJ6NmvoFEQ346znK
         zNfH/P1ZkeZsL8MIYVTm/ygl5Jrk4Vs+RqHco+aZsR8tvUE8R+Ogx59J9DuRH7OdltQv
         IFZmpbWH9dCMC3LIiRmSNEdI/HboMU7PU7GErL6bwk3P88/4sKhaP8xxv67rg47h+zSp
         68Va6DgeQ+V22CxbfScw63CFrpBQURGBsE18QpxEjLoRi2Rz6mWJ7Ke+yVjfdSPhVLWe
         D15ODaOQ4JYmLpQCb4gUAJi7iTIXifcUvq+4rzugZYG0Gq6jgXuFXKQ6TMZ8Rb+zlI55
         uFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1brUdH+0MEki3bYq8GSoruDwb0IeBRNfpvk1Iq+GA/8=;
        b=wpbjaezo+Xv6JvsXgw6LsvkW9TfultRZlj393/VGMyaOXabzGYLi+oUx3NWrQFFBBV
         43hs1M/EmDwcn0MVEj7v5/ozcLTrtEQftRzZDAtF/PhYVlRAZpPdZ0RcZs1qu03VsGWD
         Kl6JJt3pRV/fPkOzcT4yuQE5KWRHAbpmYwroAZH1Mvhf0elYMa4HKfzucPTkJevaBb3q
         DrwrtcZhzh8yG6Zgia0uecCLBVia1vTzPT/LrXepFfYGifee6KMUrZE0I/S2J7lhh7hM
         czL7wjicchjq9jrEepdXPfpmAB3JE6VOabHjcmIFLbaeJiQEYTyTRpNuA9nX8aRd5UOq
         hDQA==
X-Gm-Message-State: AOAM533LgfFNQ8unTb/MwUAcyeosQ36EMT9Ere/uITaXOQlGCChD0KEX
        v5GW3UDlbypUqMh9JYh+v3b0S1Jyt0Y=
X-Google-Smtp-Source: ABdhPJxudhmtktbH+e+acXy8LaVw9jy4xF11oxMWHVCX57+HvOV5rdv5p++tFAMF0OCKZgjbzaEGaA==
X-Received: by 2002:a05:6512:33a8:: with SMTP id i8mr21303221lfg.497.1636375884713;
        Mon, 08 Nov 2021 04:51:24 -0800 (PST)
Received: from [10.1.250.9] (riviera.nat.ds.pw.edu.pl. [194.29.137.1])
        by smtp.gmail.com with ESMTPSA id l19sm636509lji.27.2021.11.08.04.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 04:51:24 -0800 (PST)
Message-ID: <f3bc34e1-6dca-d42c-e60e-280dcfb17aa9@gmail.com>
Date:   Mon, 8 Nov 2021 13:51:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: sdm660-xiaomi-lavender: Add
 volume down button
To:     Dang Huynh <danct12@riseup.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, martin.botka@somainline.org,
        marijn.suijten@somainline.org, paul.bouchara@somainline.org,
        angelogioacchino.delregno@somainline.org,
        Caleb Connolly <caleb@connolly.tech>
References: <20211108050336.3404559-1-danct12@riseup.net>
 <20211108050336.3404559-4-danct12@riseup.net>
From:   Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <20211108050336.3404559-4-danct12@riseup.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 08/11/2021 06:03, Dang Huynh wrote:
> This enables the volume down key.
>
> Reviewed-by: Caleb Connolly <caleb@connolly.tech>
> Reviewed-by: Martin Botka <martin.botka@somainline.org>
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
>   arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> index 365a03b56cde..28408240735b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> @@ -51,6 +51,16 @@ &blsp1_uart2 {
>   	status = "okay";
>   };
>   
> +&pon {
> +	voldown {
> +		compatible = "qcom,pm8941-resin";
> +		interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
> +		debounce = <15625>;
> +		bias-pull-up;
> +		linux,code = <KEY_VOLUMEDOWN>;
> +	};
> +};
Could you commonize the RESIN instead, like in here [1]?


[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/arm64/boot/dts/qcom?h=v5.15&id=b135d097eb1a2586ee2c0ebcc0d0aa4a9b641b68


Konrad

