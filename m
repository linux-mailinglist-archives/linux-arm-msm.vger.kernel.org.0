Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFB51BD0CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 02:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgD2ACk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 20:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726353AbgD2ACi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 20:02:38 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6F91C03C1AE
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2020 17:02:36 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t16so132588plo.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2020 17:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2CAsXRsVnnRH9qykwpG2jwLytTUSsYDhGBBWnzkIxmo=;
        b=DTjNQ7WxIVv2kyEoi/eKDWmVq5xuFqq0y6FkjXCUixLdc69SpYY8WlYvK6j2DP+hIp
         kKoLIfvWwIyFNV54LtzyVPm1zJdEc2g7YclLi9Nys+e1e5B9UHo/svUPYwWL8ccXf29K
         dBcBnQxM+AoLbwkJVQtFVJvk3tn1xwWymj1C0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2CAsXRsVnnRH9qykwpG2jwLytTUSsYDhGBBWnzkIxmo=;
        b=CX1ke+byanUL7uygSzRoel8516ER09Gq8OI+Z6nLtieFz0wjD9GDfdK7Sh5lmIBykP
         CqVRCCEFbkSfilWDC9fBI7SGIXhXqmLpbzc85GPlp0NdQUGWMNfrXaPIOlLaWQ46Zx0G
         rNDJmoNoW9Uyad+rG9r54VGvZv2rq7VBch9d9cFVPrfq0lW3dnUGY1yoNsEFEAwmOQTF
         1kLV+58Cv+/MHFFyWEU90AYXqC7GTH7WMYWgXy3FgqjXZ83j0vqxZwI/Uxa0RK3Mxlvn
         ZzJBsiB6Rlw4ONGKTuoNQ12Mv876PPgXRK/mTZcVY70IQ2661yGeYnfOKOMX6nM1wWFr
         DZNQ==
X-Gm-Message-State: AGi0PuaWazcaN0Ln7LyIBVE/inGwCFiAaGf+2x/n0mbp+sjkCg+qlNx6
        jHXtWENUlAIL/s3vX9nN7EOaQA==
X-Google-Smtp-Source: APiQypJN8NM0JFwAkbfJokHfThEo4TBASYABj2DhRSML0C5dUS1OInUj/x3ZZkfBdRogU3C9Jh6QdQ==
X-Received: by 2002:a17:90a:ee84:: with SMTP id i4mr35744pjz.71.1588118556209;
        Tue, 28 Apr 2020 17:02:36 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id h197sm16715015pfe.208.2020.04.28.17.02.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 17:02:35 -0700 (PDT)
Date:   Tue, 28 Apr 2020 17:02:34 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 03/17] arm64: dts: sdm845: Add OPP table for all qup
 devices
Message-ID: <20200429000234.GK4525@google.com>
References: <1588080785-6812-1-git-send-email-rnayak@codeaurora.org>
 <1588080785-6812-4-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1588080785-6812-4-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rajendra,

On Tue, Apr 28, 2020 at 07:02:51PM +0530, Rajendra Nayak wrote:
> qup has a requirement to vote on the performance state of the CX domain
> in sdm845 devices. Add OPP tables for these and also add power-domains
> property for all qup instances.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 115 +++++++++++++++++++++++++++++++++++
>  1 file changed, 115 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 8f926b5..36b9fb1 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -804,6 +804,25 @@
>  			clock-names = "core";
>  		};
>  
> +		qup_opp_table: qup-opp-table {
> +			compatible = "operating-points-v2";
> +
> +			opp-19200000 {
> +				opp-hz = /bits/ 64 <19200000>;
> +				required-opps = <&rpmhpd_opp_min_svs>;
> +			};
> +
> +			opp-75000000 {
> +				opp-hz = /bits/ 64 <75000000>;
> +				required-opps = <&rpmhpd_opp_low_svs>;
> +			};
> +
> +			opp-100000000 {
> +				opp-hz = /bits/ 64 <100000000>;
> +				required-opps = <&rpmhpd_opp_svs>;
> +			};
> +		};
> +

Judging from SDM845 (which has more OPP tables) the convention seems to be
to add OPP tables to the nodes that use them, which seems reasonable and
keeps them out of the device list.

Unfortunately this convention isn't completely suitable for cases like this
(and the DSI OPPs later in this series), where the same OPP table is used by
multiple devices. A possible compromise would be to add the table to the
node of the first device that uses them.

