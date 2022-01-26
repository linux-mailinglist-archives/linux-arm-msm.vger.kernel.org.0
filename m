Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7831449C2A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 05:29:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231344AbiAZE3P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jan 2022 23:29:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231239AbiAZE3O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jan 2022 23:29:14 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C04D0C061747
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jan 2022 20:29:14 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id m9so20844555oia.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jan 2022 20:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H26PlBUtrEJIo/No25QJ2iD5qXCpVh9zQxB7sE6kPx8=;
        b=Y9p/Pi4GNYN0mgH1vypm5npfafzisH9GgU9halKYbqEhUCmz8vPwUsUQmSwO5a2Ewz
         fiPZDEO3nazvlnIJw7dOu+JEwOveIadXyvBekv1dbsDFOIerhMhBCW0um4+wjBuWY7Bs
         NYCf3Y7JSknFM6tUZ43LPZabuTiRaBiBeJR8VjtxVeoezEj+sdpv0jIpUCe3nqo8lggU
         auQXpwx9ElXdgNpkQR3orvuX5JIyF+VHTE9V1chIqSUF0xfbjk1xOAo1syQR93RPaNUY
         tjSB8ea34GreMSPoyxzQSgaDebwV94hf8LIs9f3Ft5GIPZxXf1SGO8flMw5WfbQNSQ8M
         HPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H26PlBUtrEJIo/No25QJ2iD5qXCpVh9zQxB7sE6kPx8=;
        b=MIBYhS1Ug3LlvV3cBWyPqJZPd+8OQ48i/yfnnAX/bkGI3hSUvajoSbnB4RGXNWg57T
         TM8xfmMPs/jnIzFLejSU0hMNVT5a2TADOeBKiqyXN445DvcYc44KY7gyRsUk54iWHCvU
         5lu9omu8SYXnoh+TmegQGV99KRNd0dTiAZiTEuRIj//Kfn6ZAwJuA8b8Ukr9hcnOi1nb
         8MVUvUcZl67ulyENp9gpCC7fKItuU3OZJ6d9dsrcprSdNGlOxjyTzXhv2997hqk5V2GO
         RiqLBCIdF8hq+fsp314JcvrJHj0iKCCp+rfnnkJtzsUzrB5/GUCw1Rna3Gs6ieKN/DFK
         YDYA==
X-Gm-Message-State: AOAM533tF0jHUo9SlSqphWcJ+vrrE2g2QdgjhAjcytnVdP/Yw7QQf+jn
        Clywp6434/h+hzfhzYRlu1pwMA==
X-Google-Smtp-Source: ABdhPJyVgj0yPYEpEHk7hsMhHdR0GLw9yZssPxERozv5pG76vqTSzOI/0Ky1SQmWRa61mmLmD9xrsg==
X-Received: by 2002:a05:6808:bc7:: with SMTP id o7mr2675803oik.315.1643171354161;
        Tue, 25 Jan 2022 20:29:14 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id n66sm7296255oif.35.2022.01.25.20.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 20:29:13 -0800 (PST)
Date:   Tue, 25 Jan 2022 22:29:11 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, pure.logic@nexus-software.ie,
        greg@kroah.com, robh@kernel.org, linux-kernel@vger.kernel.org,
        quic_tsoni@quicinc.com, quic_psodagud@quicinc.com,
        quic_satyap@quicinc.com, quic_pheragu@quicinc.com,
        quic_rjendra@quicinc.com, quic_sibis@quicinc.com,
        quic_saipraka@quicinc.com
Subject: Re: [PATCH V4 5/6] arm64: dts: qcom: sc7280: Set the default dr_mode
 for usb2
Message-ID: <YfDOF6rp8LJFIE4j@builder.lan>
References: <cover.1642768837.git.quic_schowdhu@quicinc.com>
 <232f37a6f76c3f24a122f32978b5c1e73dc7e7c4.1642768837.git.quic_schowdhu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <232f37a6f76c3f24a122f32978b5c1e73dc7e7c4.1642768837.git.quic_schowdhu@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 21 Jan 07:53 CST 2022, Souradeep Chowdhury wrote:

> Set the default dr_mode for usb2 node to "otg" to enable
> role-switch for EUD(Embedded USB Debugger) connector node.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> index 9b991ba..f40eaa5 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> @@ -61,6 +61,10 @@
>  	modem-init;
>  };
>  
> +&usb_2_dwc3 {
> +	dr_mode = "otg";
> +};
> +
>  &pmk8350_rtc {
>  	status = "okay";
>  };
> -- 
> 2.7.4
> 
