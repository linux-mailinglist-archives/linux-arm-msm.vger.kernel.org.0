Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 392482CC9E9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 23:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbgLBWsY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 17:48:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727672AbgLBWsX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 17:48:23 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D15AC061A04
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 14:47:43 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id l200so125760oig.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 14:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ob6N6LEmjYzZj1YS2x9ED8vHkOgPZxeW5ccz4MvSEV0=;
        b=dF3w6dfIHKF8MD8k0cJ1XRIvFiFkIQ8e/154VHbDml3LqMWrDyjGBj91Lt29P3egYq
         8O5+S4dc0dsCDdyPTNnWRwC8rkWCVLTYbrdKaJCzbBeyQr9yZTxn8BmkqMzGPYEk5f3s
         oZJhPRiBz32x9F4Zq+yf1Rv0lSssrwrf0uB3FwqPb4hZp44SA/uF2KX4Na76a7AfKksj
         l3GregQNSfzdYUl9pe0FZ6XUfnL5RJPvjUpuM+YibARE2jEbo2Uxh6sas//vszyLaVOR
         okLEhnbStXAJU6exRqnr76jCzaPk0XuYt949jfdd3fGAPAh7TIp1rMywM7nP/X1vKd0y
         G0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ob6N6LEmjYzZj1YS2x9ED8vHkOgPZxeW5ccz4MvSEV0=;
        b=VZchwizf6/MDt/Rl19vvk4cNvzRzNM07jhqMks7PQfC/dxv06EHjKEJrEvJbfn75hM
         QrLZUj0eU5T+vbMc05U/aB3sEuG3OlRhwIIMbuLHqLGLTp17qU4G6/qm+SivIr/+afJl
         SRycRuyHJbkzcn6M4MdUKPRu7bvP96Z6lCH8n4mg/tQLHiI28qmEIMVF8/2bgpxoO1SM
         E+MRQhDLqvnQki0U4cs4TAX0L6kjkKDzOfSxjZur8okwtilD1fALPUhreIBCKx0Miq8K
         Lov5TGVBQskjYkaW2v4eAoMj02UL7BBx2SUN2/UesMsUEhQvz4eNn63cp+K2tQ5oqYar
         LDZQ==
X-Gm-Message-State: AOAM532+9cXyRmWnwswd7tS0DY4suIj9pGpUYxjLzgcyy2ehuKDuXJXE
        INpGKE8mBTti6EzIh2PaM9h2Btl/0RWxvQ==
X-Google-Smtp-Source: ABdhPJwszFk9KvVPaMkOOp+xCH0oC5FGFddD+gK8E6gCyWvuapaL4xlTbIFgdSzaPaiJ6XYF6VoP5g==
X-Received: by 2002:a05:6808:2c4:: with SMTP id a4mr6366oid.114.1606948683206;
        Wed, 02 Dec 2020 14:38:03 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o63sm27841ooa.10.2020.12.02.14.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 14:38:02 -0800 (PST)
Date:   Wed, 2 Dec 2020 16:38:00 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/7] arm64: dts: qcom: qrb5165-rb5: add gpu/zap-shader
 node
Message-ID: <X8gXSEeBxFHAPmZe@builder.lan>
References: <20201127095548.128217-1-dmitry.baryshkov@linaro.org>
 <20201127095548.128217-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201127095548.128217-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 27 Nov 03:55 CST 2020, Dmitry Baryshkov wrote:

> Add firmware configuration for Adreno zap shader on qrb5165-rb5.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index 9c5135585ec9..d1f6cadca35a 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -423,6 +423,13 @@ &dsi0_phy {
>  	vdds-supply = <&vreg_l5a_0p88>;
>  };
>  
> +&gpu {
> +	zap-shader {
> +		memory-region = <&gpu_mem>;
> +		firmware-name = "qcom/a650_zap.mdt";

The zap shader is unfortunately signed with a vendor specific key. So
can we please move the test signed file into qcom/sm8250/?

And to avoid pushing all these scattered files to linux-firmware, can
you please run pil-squasher [1] on it and use the a650_zap.mbn?

[1] https://github.com/andersson/pil-squasher

Regards,
Bjorn

> +	};
> +};
> +
>  /* LS-I2C0 */
>  &i2c4 {
>  	status = "okay";
> -- 
> 2.29.2
> 
