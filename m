Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5051D30CF79
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Feb 2021 23:58:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235852AbhBBW44 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 17:56:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235844AbhBBW4z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 17:56:55 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53D5AC06174A
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Feb 2021 14:56:15 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id x71so24634554oia.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Feb 2021 14:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Dm32qGeITy/wXwfoci85QkTYUB156GzAa0S0XhSZkKM=;
        b=r/jvhvEyOyCWAh1FptsuynQV5JI8870kjAmNMkfZfSB2H+ihLrbWp1zBV1ous6TZXr
         u/LsqWeOITp54W/EpB6jrpaOhOZ1lNUJBPl0NRKc5qKS7RRbCEqEwakggX3nMOYTNHx0
         Zr5Ipb3NjnWWvD0EUr/c7TBmlw7yerWHZ7D/8JsT7J1nKPRzDFUwKDoWEGb68oKwY2Pk
         m9wjk9hN3Z6hPSnfGNwfsJqWDYGC8eITmUFXTCEdw4Sf7i4kpei5QKO0FZTlEf8DWJO4
         YPXSjJC9KgP308CYzeHFfx6znTrIWabkD/9e/jwYiy+SKHAaA/xOPes+zO4pjx9/zL0h
         xB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Dm32qGeITy/wXwfoci85QkTYUB156GzAa0S0XhSZkKM=;
        b=dShi0amyayyAOucYXkXgDkSb8MpdvpWkMXlvP3kjHc0l2by+ZYIxRbSWiKqmLebW0v
         9WUJHXHsYy466e6YWO1rZp+Vnekkol5PoR18Raqsl2irCyMSWtAkw7k4Ou1YMxil0EZf
         OJ2yFhMfkPmK+GG38My2WE4zwwAw1dyj0N6B4QlpFBLJO2vA2JVuMqxySpj84UqVu4J8
         eEejdHhL2VffGlLTTCtF/pb9RckGtklwZOpiNo+hDFw9J62VFcO7Gx0YAy4lyH4MlfMU
         8VqRlHzOJy0GPHMoz/Rq0epqIUR03WmSkrLxmDGKl1FS1BAHTsYX12MGycZZ2wxbvQK/
         68ww==
X-Gm-Message-State: AOAM533GBufY7n/gWX6eJip90aW+cuepAInF7vo85Yfk80rdYOcIFj5B
        AoMm7VvV4PNx5SQjBscJ41XXvA==
X-Google-Smtp-Source: ABdhPJy3HieX1y6uSigaWYaXmpsZXAqkqYtUylVeJnOtvXiG/XVI6XNX9v2cD0qRMi/XIB7UpzUGDA==
X-Received: by 2002:a05:6808:84:: with SMTP id s4mr88001oic.164.1612306574723;
        Tue, 02 Feb 2021 14:56:14 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l4sm59124oou.8.2021.02.02.14.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 14:56:13 -0800 (PST)
Date:   Tue, 2 Feb 2021 16:56:11 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     "agross@kernel.org" <agross@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: pm8994: Add resin node to PON
Message-ID: <YBnYi2eMl0xtMcfq@builder.lan>
References: <8WhEzfSgoSe_f8OT9eH_6hLGTqY9k_Cy9ZLr84OJsFctROAlbUEz552XibQxt684Um8E5NS1_0qxIn3tRVSs0ui1mVUKhBFmUjJ_dannvrQ=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8WhEzfSgoSe_f8OT9eH_6hLGTqY9k_Cy9ZLr84OJsFctROAlbUEz552XibQxt684Um8E5NS1_0qxIn3tRVSs0ui1mVUKhBFmUjJ_dannvrQ=@protonmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 29 Dec 06:47 CST 2020, Yassine Oudjana wrote:

> From: Yassine Oudjana <y.oudjana@protonmail.com>
> Date: Sun, 27 Dec 2020 21:23:40 +0400
> 
> Add resin as a child node of PON.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  arch/arm64/boot/dts/qcom/pm8994.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8994.dtsi b/arch/arm64/boot/dts/qcom/pm8994.dtsi
> index 5ffdf37d8e31..334774a38602 100644
> --- a/arch/arm64/boot/dts/qcom/pm8994.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8994.dtsi
> @@ -58,6 +58,14 @@ pwrkey {
>  				linux,code = <KEY_POWER>;
>  			};
> 
> +			resin {
> +				compatible = "qcom,pm8941-resin";
> +				interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
> +				debounce = <15625>;
> +				bias-pull-up;
> +				linux,code = <KEY_VOLUMEDOWN>;

Is resin always volume down?

Also this node is already defined in apq8096-db820c.dtsi, so how about
moving the common properties here, but leave it status = "disabled" and
then in the device specific file make it status = okay?

Regards,
Bjorn

> +			};
> +
>  		};
> 
>  		pm8994_temp: temp-alarm@2400 {
> --
> 2.29.2
> 
