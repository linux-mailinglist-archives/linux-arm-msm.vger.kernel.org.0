Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDFA31BD107
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 02:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgD2A1I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 20:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726348AbgD2A1H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 20:27:07 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B19D6C03C1AD
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2020 17:27:07 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id z6so150090plk.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2020 17:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8iXe5UNOtvxoBr1fCjKy4YdMeYzknNiZCyX4mZulCO4=;
        b=LO+jJ7eoH0QlVMnqSphJrRi6uT641MdDBa+ezZ3djwjt/ANTKHuDmNTGrJoKvMsFaI
         VOyMQfVfm/7bPIVOcJM4ubLmRM6kXo85a3du+bxSRMFPCkk2KozSvLeRlGtoXs76xdN5
         9h7Uo0QzrfbE6vovnuOGlmuNdqpcnBNQoYIaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8iXe5UNOtvxoBr1fCjKy4YdMeYzknNiZCyX4mZulCO4=;
        b=hncwuQsfWw38pid68USymS663ATtkvG+F9aCQzsmy4U20uOGRjOIvm2DOW3vwxDLeq
         btVyl6oVJvStI/dAPE3Ch0kDjoKPdybYh+EYqDQV3Ho8Y4eLguXosNOCTl2xtaJymyh4
         jt+tlRvoxeUWKSdD+uGWBPXUfapS2Dck2C+84bp6oM7xe0ySQH0YW80P+tFTp91N0MkD
         mVgNeBQOOyNbIrECL9pq0YB+YeXJqei4j467RRdm7w201NHlpbsp/zaQnKlAqwZS6ZZ/
         OZZ6WcKIK/wYbiKTqW39S1qduiDdWy/0NIal22LPGeoW+7Duf7RlhGmBbgab0GpM1frH
         Fwnw==
X-Gm-Message-State: AGi0PuZEfmjcD2jp49m6V9m9cYQnZxAkzzm5PDdy9o7qccsLlWQom1Yn
        r6hMQUvIuDXxHVuwcVTbNa7ImA==
X-Google-Smtp-Source: APiQypI+6a5SfLti8h4EiDEynoeN0alrnr64lZsu+93RPaV4oHN2xZFKTrFZ1ItPdNhHeP3XmM18hQ==
X-Received: by 2002:a17:902:8487:: with SMTP id c7mr28388208plo.251.1588120027129;
        Tue, 28 Apr 2020 17:27:07 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id g22sm3089515pju.21.2020.04.28.17.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 17:27:06 -0700 (PDT)
Date:   Tue, 28 Apr 2020 17:27:05 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 07/17] arm64: dts: sdm845: Add DSI and MDP OPP tables
 and power-domains
Message-ID: <20200429002705.GM4525@google.com>
References: <1588080785-6812-1-git-send-email-rnayak@codeaurora.org>
 <1588080785-6812-8-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1588080785-6812-8-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 28, 2020 at 07:02:55PM +0530, Rajendra Nayak wrote:
> Add the OPP tables for DSI and MDP based on the perf state/clk
> requirements, and add the power-domains property to specify the
> scalable power domain.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 59 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 36b9fb1..7a625ad 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3309,6 +3309,59 @@
>  			#reset-cells = <1>;
>  		};
>  
> +		mdp_opp_table: mdp-opp-table {
> +			compatible = "operating-points-v2";
> +
> +			opp-19200000 {
> +				opp-hz = /bits/ 64 <19200000>;
> +				required-opps = <&rpmhpd_opp_min_svs>;
> +			};
> +
> +			opp-171428571 {
> +				opp-hz = /bits/ 64 <171428571>;
> +				required-opps = <&rpmhpd_opp_low_svs>;
> +			};
> +
> +			opp-344000000 {
> +				opp-hz = /bits/ 64 <344000000>;
> +				required-opps = <&rpmhpd_opp_svs_l1>;
> +			};
> +
> +			opp-430000000 {
> +				opp-hz = /bits/ 64 <430000000>;
> +				required-opps = <&rpmhpd_opp_nom>;
> +			};
> +		};

as commented on "[v3,03/17] arm64: dts: sdm845: Add OPP table for all qup
devices" (https://patchwork.kernel.org/patch/11514693/) this table should
probably be inside the 'mdp' node.

> +
> +		dsi_opp_table: dsi-opp-table {
> +			compatible = "operating-points-v2";
> +
> +			opp-19200000 {
> +				opp-hz = /bits/ 64 <19200000>;
> +				required-opps = <&rpmhpd_opp_min_svs>;
> +			};
> +
> +			opp-180000000 {
> +				opp-hz = /bits/ 64 <180000000>;
> +				required-opps = <&rpmhpd_opp_low_svs>;
> +			};
> +
> +			opp-275000000 {
> +				opp-hz = /bits/ 64 <275000000>;
> +				required-opps = <&rpmhpd_opp_svs>;
> +			};
> +
> +			opp-328580000 {
> +				opp-hz = /bits/ 64 <328580000>;
> +				required-opps = <&rpmhpd_opp_svs_l1>;
> +			};
> +
> +			opp-358000000 {
> +				opp-hz = /bits/ 64 <358000000>;
> +				required-opps = <&rpmhpd_opp_nom>;
> +			};
> +		};
> +

depending on the outcome of the discussion mentioned above this might have
to move into the 'dsi0' node.
