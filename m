Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A353447FED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 13:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239728AbhKHM6y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 07:58:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238770AbhKHM6y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 07:58:54 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF6DC061570;
        Mon,  8 Nov 2021 04:56:09 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id u11so36005905lfs.1;
        Mon, 08 Nov 2021 04:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=PRd8lrxK2rGzfhR6xd0y8MjCqwkrKOfPHO6ZfywRVnA=;
        b=KIjeh7QgeVG9IpChI3cODLKL7UX3sRTcSUrfu1VjTjxWd6YTQAFs6DgtTlKD7+of3X
         9qMnCmd3G/Bt9S7g5nJxrnVSWenaSxcPt46EVzFkksOkPT+ivtxwJsXvEBkbzZG7fK05
         HE7lP5HBKUmNNGvsl9LfE/gMIWTahWcnIaFDKReCt9zL8CvsEoAHXnWTB7h6ttVb0WoR
         XSARKLikLYEgkQ+//uJKF+z0rXT1ojfCfGvvweo3RyKuULukZfbD2jSQQaV7Zhpebk0T
         KEGP/iIwjhoiC2dmNmgF4Mvj6mik13Wugtm+z/pFDmZoxny84TPnPsiwgHR1lAAK6Cdl
         wBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=PRd8lrxK2rGzfhR6xd0y8MjCqwkrKOfPHO6ZfywRVnA=;
        b=XPfqB9w++7ge0Zx0vV+AwOQ/Xxn26fMzzYaQNiAAJFxu0YQbifteCUG/d9BAdK7WJx
         VV0imlIgnMEWn/A6L7AcHA2nRs9T2oKMx5Pw4Q1+BR4Rw/R4C6puCm3QEchMnva3ovJm
         S9Zwv3d7OJQ1xkqtoRz7WsS7LIPE5rEx+A0o3SaV5mWGryC0l1kudDHRAUCe9IsEDIrz
         4a4Nlcivope1xwfbKGmkbmYaFFBXJkK2S6e6zRz/Kl8hUD/KwY1kjrTWn3G+SZeA75bM
         aH1G+babFZ3y1BUDFxNn/Der9NpVk6DluOLTo2Frr7SPyeZKdqNACjWqeuYjgmnnRVh/
         7viQ==
X-Gm-Message-State: AOAM532JAnk8eb47SLNDHek9qA8btJmy4n07y/WZqpAB7R15roHpjN+B
        eYB9svtlapuECI49Uc7IfJ4=
X-Google-Smtp-Source: ABdhPJz7b6AZzlifUaTMcQ3b65Sq/qgU3cFwHYqUyJ59VbtU0fc+lnXUT5NA+/1RzJQGcwUqsnEFjg==
X-Received: by 2002:a05:6512:40c:: with SMTP id u12mr21130431lfk.473.1636376168038;
        Mon, 08 Nov 2021 04:56:08 -0800 (PST)
Received: from [10.1.250.9] (riviera.nat.ds.pw.edu.pl. [194.29.137.1])
        by smtp.gmail.com with ESMTPSA id w40sm1809126lfu.48.2021.11.08.04.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 04:56:07 -0800 (PST)
Message-ID: <06a286d6-b675-3322-79f2-1127935794b9@gmail.com>
Date:   Mon, 8 Nov 2021 13:56:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: sdm660-xiaomi-lavender: Enable
 Simple Framebuffer
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
 <20211108050336.3404559-7-danct12@riseup.net>
From:   Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <20211108050336.3404559-7-danct12@riseup.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 08/11/2021 06:03, Dang Huynh wrote:
> This lets the user sees the framebuffer console.
>
> Reviewed-by: Caleb Connolly <caleb@connolly.tech>
> Reviewed-by: Martin Botka <martin.botka@somainline.org>
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
>   .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> index 8fd4d1732d94..122b487f197b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
> @@ -23,7 +23,21 @@ aliases {
>   	};
>   
>   	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
>   		stdout-path = "serial0:115200n8";
> +
> +		framebuffer0: framebuffer@9d400000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0 0x9d400000 0 (1080 * 2340 * 4)>;
> +			width = <1080>;
> +			height = <2340>;
> +			stride = <(1080 * 4)>;
> +			format = "a8r8g8b8";
> +			status= "okay";

This line is redundant.


Konrad

