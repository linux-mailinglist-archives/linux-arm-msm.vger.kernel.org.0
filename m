Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EAB821114B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2020 18:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732565AbgGAQyS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 12:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732810AbgGAQyR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 12:54:17 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D048DC08C5DD
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2020 09:54:16 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id d194so8627262pga.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2020 09:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EsXUdM5LAqzZIkn5/W0cNdIO5H2Xp89nIazo0CQdhNk=;
        b=GwqLCcMAMUHg3piKQ0M1OpiifrcnYUmWU6pkjcqeA7IPO+nvcLIkmswfoCyb5lnB7G
         nIILTLdTaOKsOt632Yaq+LLwyb08YkoB2dkZlyrzPSWuf/0FLqmNB1O0CP3iq/S6BbRu
         ih7Mgx0A4CC6tjz80rhNSqnEtE4ojrney1TIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EsXUdM5LAqzZIkn5/W0cNdIO5H2Xp89nIazo0CQdhNk=;
        b=XRGG4PfPmxRrsN41nTy08/19HJ6Y/Og8RsGQ0UQFesfPzxWkoR9AOr7AY8G0nawPHU
         YXHI79N1YOBYn2vd5MjHCpwMmRU1XgCGAPjEZo3KYHQG85Be5rdtHWVu78grl9mX+q8i
         aE/4pQhI63vyeFx25uNCUqFGwr/YIVqjNfZCMaISt3qn1yW+sN1nE0/cyqTgS7IBV1Yh
         IAiyLzhpCK6oMny27KxjHmEvCbN7ObXn7YP+pEuRrEgnfz3QBu4dp1SNuayE63yZrCXz
         kwu4cIzdKWKXDQ32zmkNhMD51ba3ZVhGDEPAuslGXZx3o3/kwGCY5VEll3wOfse2z0WI
         22Tw==
X-Gm-Message-State: AOAM530qsPk74+9JpcIU6f3XingLq0MBzW3IaTN1ZlNYbYivE6K9EpFG
        vXpO2exXtZIeaP7l+lVqbvQY1ZuOLKc=
X-Google-Smtp-Source: ABdhPJyRYU3xYExtmeUyfOXkpw7VsQvHdKoQQRhKbkqyHFECmUwIhbLYFz+24TYxhxLjY5slmp/3Ww==
X-Received: by 2002:a63:e214:: with SMTP id q20mr13297210pgh.402.1593622456365;
        Wed, 01 Jul 2020 09:54:16 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id q1sm6907508pfk.132.2020.07.01.09.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2020 09:54:15 -0700 (PDT)
Date:   Wed, 1 Jul 2020 09:54:14 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: sc7180: Add OPP tables and power-domains
 for venus
Message-ID: <20200701165414.GB3191083@google.com>
References: <1593603638-19296-1-git-send-email-rnayak@codeaurora.org>
 <1593603638-19296-4-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1593603638-19296-4-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 01, 2020 at 05:10:38PM +0530, Rajendra Nayak wrote:
> Add the OPP tables in order to be able to vote on the performance state
> of a power-domain
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 35 +++++++++++++++++++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index ad57df2..738a741 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2392,8 +2392,10 @@
>  			reg = <0 0x0aa00000 0 0xff000>;
>  			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>  			power-domains = <&videocc VENUS_GDSC>,
> -					<&videocc VCODEC0_GDSC>;
> -			power-domain-names = "venus", "vcodec0";
> +					<&videocc VCODEC0_GDSC>,
> +					<&rpmhpd SC7180_CX>;
> +			power-domain-names = "venus", "vcodec0", "opp-pd";
> +			operating-points-v2 = <&venus_opp_table>;
>  			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
>  				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
>  				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
> @@ -2414,6 +2416,35 @@
>  			video-encoder {
>  				compatible = "venus-encoder";
>  			};
> +
> +			venus_opp_table: venus-opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-200000000 {
> +					opp-hz = /bits/ 64 <150000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-320000000 {
> +					opp-hz = /bits/ 64 <270000000>;
> +					required-opps = <&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-380000000 {
> +					opp-hz = /bits/ 64 <340000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <434000000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-533000000 {
> +					opp-hz = /bits/ 64 <500000000>;
> +					required-opps = <&rpmhpd_opp_turbo>;
> +				};

the labels of the OPP nodes don't match the specified frequencies
