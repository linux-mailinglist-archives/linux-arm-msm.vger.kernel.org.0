Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF471B1B6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 03:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbgDUBx0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 21:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725829AbgDUBx0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 21:53:26 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45DCCC061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 18:53:26 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id g6so6012802pgs.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 18:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HjaU46gshLP9GG/96K+kwboQDvDrw0plitPA+YNIbGk=;
        b=xfRpFDiMGDmWjPTE0YYkUbpZVS47obtstRXpn7KoJtKrL2QbpLZfww1X3ZSIh8l0Nv
         n+sW9vfTuCEWuxgnENefnuyqJYDmvX0Xl9dbhxiDUU27U/ZaeXsqr7inv+SvEh78uAbg
         hZf8+Hox1ek/VyaKJyo68zPK/KFaqwxdO/NGoD8pLBlemT0P10eClmNQgU/SiT0rYoAm
         nvAiyJ857Lcxcgb4dBbMQGn+gfn3MGQej9GLjYxXrPpZ4MHMD5Gx42i7SqCQ51uExIAg
         XAzv9LqBijXqE+nnbh6rGyQs+EIjq58AiGqemnn/IX9SW/1bnrw70pFKeBSsc5tEX0oQ
         8rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HjaU46gshLP9GG/96K+kwboQDvDrw0plitPA+YNIbGk=;
        b=gP8mRf0WzY/jNWkZR6GF/kZZWwbXS/ePbTsqWjYgJoOLLxXK2ACLWmH237BiR0zzEu
         Rj6/AtaTZtImpqXkz+4lelYOWQo/REq+zmqNk8MXpSantUNRD4FA/Kv8W1LB2yTOk40C
         LJGjmBxV4cJg6P/R1PqO0MNZnymxQPb0eHUR97bX8Ge5NC5xsuqfDBrb6gEa0UL9otu1
         KH5HCrQ/Xb4+G4mBgVMhp9mCrir2lpu8LAfdTpoHnRegrWfoeHZu/EIf59aX3XTeAphT
         F2xz1BW3yWzjHxfsu34JDxIriAvG8p0ehimtfDt6q6D99gG4svc7VLre7BVVfP0H2DJV
         al/w==
X-Gm-Message-State: AGi0Pubkr4SeyvNPA5hNk0OZd9yC4h4gz003Tbpfk3O6hv+k/p/qbpZI
        JjOluI1xaRC7fspuXoXucBkcgA==
X-Google-Smtp-Source: APiQypI4Nxn9X9fDUlEU6GiIiPgk4BM6mX4SRxaaBvw8cFMIqbkz4RbBzf6gfeDAsH3XeeLgbtcPOw==
X-Received: by 2002:a63:310d:: with SMTP id x13mr7596695pgx.266.1587434004255;
        Mon, 20 Apr 2020 18:53:24 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s10sm657737pgq.69.2020.04.20.18.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 18:53:23 -0700 (PDT)
Date:   Mon, 20 Apr 2020 18:53:47 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: soc: qcom: apr: Use generic node names
 for APR services
Message-ID: <20200421015347.GT576963@builder.lan>
References: <20200415081159.1098-1-stephan@gerhold.net>
 <20200415081159.1098-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415081159.1098-2-stephan@gerhold.net>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 15 Apr 01:11 PDT 2020, Stephan Gerhold wrote:

> Device nodes should be named according to the class of devices
> they belong to. Change the suggested names of the subnodes to
> apr-service@<id>, which is already in use in
> arch/arm64/boot/dts/qcom/sdm845.dtsi.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Applied, thank you.

> ---
>  .../devicetree/bindings/soc/qcom/qcom,apr.txt | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
> index f8fa71f5d84b..2e2f6dc351c0 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
> @@ -65,30 +65,30 @@ which uses apr as communication between Apps and QDSP.
>  		compatible = "qcom,apr-v2";
>  		qcom,apr-domain = <APR_DOMAIN_ADSP>;
>  
> -		q6core@3 {
> +		apr-service@3 {
>  			compatible = "qcom,q6core";
>  			reg = <APR_SVC_ADSP_CORE>;
>  		};
>  
> -		q6afe@4 {
> +		apr-service@4 {
>  			compatible = "qcom,q6afe";
>  			reg = <APR_SVC_AFE>;
>  
>  			dais {
>  				#sound-dai-cells = <1>;
> -				hdmi@1 {
> -					reg = <1>;
> +				dai@1 {
> +					reg = <HDMI_RX>;
>  				};
>  			};
>  		};
>  
> -		q6asm@7 {
> +		apr-service@7 {
>  			compatible = "qcom,q6asm";
>  			reg = <APR_SVC_ASM>;
>  			...
>  		};
>  
> -		q6adm@8 {
> +		apr-service@8 {
>  			compatible = "qcom,q6adm";
>  			reg = <APR_SVC_ADM>;
>  			...
> @@ -106,26 +106,26 @@ have no such dependency.
>  		qcom,glink-channels = "apr_audio_svc";
>  		qcom,apr-domain = <APR_DOMAIN_ADSP>;
>  
> -		q6core {
> +		apr-service@3 {
>  			compatible = "qcom,q6core";
>  			reg = <APR_SVC_ADSP_CORE>;
>  		};
>  
> -		q6afe: q6afe {
> +		q6afe: apr-service@4 {
>  			compatible = "qcom,q6afe";
>  			reg = <APR_SVC_AFE>;
>  			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>  			...
>  		};
>  
> -		q6asm: q6asm {
> +		q6asm: apr-service@7 {
>  			compatible = "qcom,q6asm";
>  			reg = <APR_SVC_ASM>;
>  			qcom,protection-domain = "tms/servreg", "msm/slpi/sensor_pd";
>  			...
>  		};
>  
> -		q6adm: q6adm {
> +		q6adm: apr-service@8 {
>  			compatible = "qcom,q6adm";
>  			reg = <APR_SVC_ADM>;
>  			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> -- 
> 2.26.1
> 
