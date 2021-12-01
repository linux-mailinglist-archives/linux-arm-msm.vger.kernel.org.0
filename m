Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C47146456D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 04:28:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231315AbhLADcA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Nov 2021 22:32:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346442AbhLADcA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Nov 2021 22:32:00 -0500
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1C3EC061746
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Nov 2021 19:28:39 -0800 (PST)
Received: by mail-oo1-xc2b.google.com with SMTP id t9-20020a4a8589000000b002c5c4d19723so7372222ooh.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Nov 2021 19:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MO98g5+euDpCVh/jM+G9QFzSNcP/DvDPu2ZrHFjPZiI=;
        b=q6TBdnlLfvm7R0HoW22oepN5kftiW3DpHBwcdL5EVMVlQpGgSqkDtufnZK0r4iNdIh
         D6RdI8R8ln6MLdW4KiWC2Rx6rbXBLAJuvtf3lRKF2ZTk+btOyK5q4eAVTg1NuhnMH60N
         ir2AG6gVWCd+7tsmMUpib0VI1SFZTXsWTALpSenGMRJuKxA4me3+VxiJ68sGGyW7rsSy
         hQWPJpQPuFRXS2IVI+hunuBpke78ZuO1pj7rH17exKzYX6ifp2647hw5KHKf7u5df+K2
         rVlmY2XsKYDHsuZjjuOnSt1HZnLUx3m0A8nhApcOn+uH3etDRRTKh7HB6aSfpkjg820p
         fNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MO98g5+euDpCVh/jM+G9QFzSNcP/DvDPu2ZrHFjPZiI=;
        b=TFVaghzhQzD4oDchzS9GUqQkrRULeCnTI5EJ/Y7G1N6GtOsWgry27xa5HIPMmy0NFA
         SE/XarunjPxxIaP24qYhzqFEbW8HBO14ugJXdgcagdvbg63HbLLPpHcA91/moMoB0VKT
         jIV5unq8DwwdPGmFgAqgltWRmzgfUS6ulC5SDrdhtI6tpBy7/cb0tU+Nsu/t5m6ECRZq
         cXo3GfN2qlXPABA6Dl7vj8dwxjAcXGH2FhZungC7Ve5LZoyOaHaaU3whwpLvjxEEGtqe
         QlAdkvVBNGWKXIbKW1QXnRgGtwrsi7LhlymYYIknsaByqTg/zz1/UhSKmqwh4ZSs34Xy
         HbRQ==
X-Gm-Message-State: AOAM530VaiL7D6zwtjkJgv9tHnADcy8GVWnTumUAjQiNwMdyQU7/X3kx
        9NYIB5A+Rn40+aKIZ2SCgblxhQ==
X-Google-Smtp-Source: ABdhPJxRV0wt7Uha2/z9XZkBUc9mYcppiJ72YLqp1ThPKmdn8S+ZpdjExghjKIx6cLzq0lU87Q2lnA==
X-Received: by 2002:a4a:d854:: with SMTP id g20mr2695766oov.6.1638329319096;
        Tue, 30 Nov 2021 19:28:39 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w24sm3394628ots.10.2021.11.30.19.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 19:28:38 -0800 (PST)
Date:   Tue, 30 Nov 2021 21:28:33 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com
Subject: Re: [PATCH 2/2] arm64: qcom: sc7280: Add USB2 controller and phy
 nodes for SKU1 board
Message-ID: <Yabr4azUasmQDy7U@builder.lan>
References: <1637837815-8532-1-git-send-email-quic_c_sanm@quicinc.com>
 <1637837815-8532-3-git-send-email-quic_c_sanm@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1637837815-8532-3-git-send-email-quic_c_sanm@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 25 Nov 04:56 CST 2021, Sandeep Maheswaram wrote:

> Adding USB2 controller and phy nodes for SC7280 SKU1 board.
> 
> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> index 9b991ba..ffd483d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> @@ -80,3 +80,19 @@
>  		qcom,pre-scaling = <1 1>;
>  	};
>  };
> +
> +&usb_2 {
> +	status = "okay";
> +};
> +
> +&usb_2_dwc3 {
> +	dr_mode = "host";

The commit messages doesn't capture why the mode changes from peripheral
to host.

> +};
> +
> +&usb_2_hsphy {

Is this specific to this SKU? Is there a reason not to keep this in the
dtsi?


Please squash the two patches and please write a proper commit message.

Thanks,
Bjorn

> +	status = "okay";
> +
> +	vdda-pll-supply = <&vreg_l10c_0p8>;
> +	vdda33-supply = <&vreg_l2b_3p0>;
> +	vdda18-supply = <&vreg_l1c_1p8>;
> +};
> -- 
> 2.7.4
> 
