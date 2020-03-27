Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA9719618D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2020 23:54:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbgC0Wy6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Mar 2020 18:54:58 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41138 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727585AbgC0Wy6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Mar 2020 18:54:58 -0400
Received: by mail-pf1-f194.google.com with SMTP id z65so5201078pfz.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2020 15:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HU2M5O3jCfLj94Hwufwd4XPsJBSwx4R/uG7JulaLujI=;
        b=YPdf51gGhsv5lOIYljUemnb/IoF4tLDIRzFJhjUoZ86UQMM8TttCZzXcTOBm97T8WG
         GPAqsxP1v+5nFHf8EGUipD6IfGNrA1mSxdt0qWuTSZbbuB2DU1n7FL1zw+p1duoTY3B8
         0kfrv3XzLbhyl4C7XnCgzJm1RHGY8y56waHMloM9d6gPDIYjKr/WXIJiuEZ2qXyw21hA
         TRIy3sE3NFD1+QwN9qoSYlsDNGlH0c2jKCxzybtFbEf7vUOhHoytaHpKut3gHnc0BfQ5
         OOX7Ke/fjwPS/IxP8XNtO8H3tlAAHG8ThSqH5rYQBtZjolHaESuhqtXayy0SH+ch2xtB
         jiBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HU2M5O3jCfLj94Hwufwd4XPsJBSwx4R/uG7JulaLujI=;
        b=omGNME4CFIgVMYnPL7/of8diHQlXvdS08gkFyuhwO4fZrls2j4FxFVhkyMyAs9dcW1
         gN7aZaAchJQOXJ4IYbPSpMW03D4zxkG2spZhOYZixnDF4wVm9ZYmdzFwLFfMxBhN6MWd
         N5Zk3xcYg5ja2pkREEu/L8GX+7Vu3GLNCxSA29/E3e7wBhlM+nXosW8fGwIL8mIi2RCm
         BY0VMRouYOKi5xC6GJaj6bVAUEx3Nt86Wzr0wNTOjjrkOkzrRkUGPj+XzhbSEwll1GaR
         Frz0kOmupUImrPVLo9y1eB86GkTiH/DPIjDtBaqtZjesyqiVklimxvPWdL6Bhm/mZDJv
         XHmQ==
X-Gm-Message-State: ANhLgQ0eRAEcMaTlJ0MpGGJecoSJlcGlYFRXkzXQA46NV+4xvOjdO0aF
        66GQkhzr5mQS+eihY/CH7qJy8A==
X-Google-Smtp-Source: ADFU+vsJ5hSRbz6fduTj02IdL1Xzy2YBpy7LH6U+C7LpI1fAMwXLyOa9O45EJ3aIiGe9q26cEeMZ9Q==
X-Received: by 2002:a62:75d0:: with SMTP id q199mr1560271pfc.72.1585349697006;
        Fri, 27 Mar 2020 15:54:57 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d3sm4543941pjz.2.2020.03.27.15.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 15:54:56 -0700 (PDT)
Date:   Fri, 27 Mar 2020 15:54:54 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     rui.zhang@intel.com, ulf.hansson@linaro.org,
        daniel.lezcano@linaro.org, agross@kernel.org, robh@kernel.org,
        amit.kucheria@verdurent.com, mark.rutland@arm.com,
        rjw@rjwysocki.net, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Patch v5 6/6] arm64: dts: qcom: Indicate rpmhpd hosts a power
 domain that can be used as a warming device.
Message-ID: <20200327225454.GI5063@builder>
References: <20200320014107.26087-1-thara.gopinath@linaro.org>
 <20200320014107.26087-7-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200320014107.26087-7-thara.gopinath@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 19 Mar 18:41 PDT 2020, Thara Gopinath wrote:

> RPMh hosts mx power domain that can be used to warm up the SoC.  Indicate
> this by using #cooling-cells property.
> 
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> 
> v3->v4:
> 	- Removed subnode to indicate that mx power domain is a warming
> 	  device. Instead #cooling-cells is used as a power domain
> 	  provider property to indicate if the provider hosts a power
> 	  domain that can be used as a warming device.
> 
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index fe35d37a11cc..0d878b2ca351 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3703,6 +3703,7 @@
>  			rpmhpd: power-controller {
>  				compatible = "qcom,sdm845-rpmhpd";
>  				#power-domain-cells = <1>;
> +				#cooling-cells = <2>;
>  				operating-points-v2 = <&rpmhpd_opp_table>;
>  
>  				rpmhpd_opp_table: opp-table {
> -- 
> 2.20.1
> 
