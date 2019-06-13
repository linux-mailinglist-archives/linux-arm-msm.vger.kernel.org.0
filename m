Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0083243C92
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 17:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728764AbfFMPgi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 11:36:38 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37618 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728692AbfFMPgg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 11:36:36 -0400
Received: by mail-pf1-f193.google.com with SMTP id 19so11243357pfa.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2019 08:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dIxmbqoHolBJ5JcAhkZwY20MNsxdVQHEXSvHFfDlnuo=;
        b=T1xzSsA9CWPyw7MWBoY1BkfuWJPaojXzqycfSspyble27NyBTeDRkcyEZlH3+A5O3T
         Z6NEGv0WS/CcB1j1VNYkJchhJJ9R9qZXDRNePgDjSugQ1t0q8105sxVsOZRxc+TLwaqs
         7kV//PH0M1EB4KS7oeLAVuKDggdnPQjpP8SIC2JqHFNKJG42LdxB9rFX6PDVXIKLsRT0
         6ULmpK6ETnJzaxuVhH0qZBw3k4cP2Za66kFl4eSE8OeQt0XCpjtZUKr+pjRA8J0H0usm
         QCJAafRqj3DAkuKtPOiLbmIvPRSGJTbM3N4gy3M8+ZeF1U2doaNJUOH0OO+R0Rz64xah
         d8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dIxmbqoHolBJ5JcAhkZwY20MNsxdVQHEXSvHFfDlnuo=;
        b=d057VmCrqJ1TpurvQfA4eVBznrVoI9laFJsFspsE4MmX7AKG8neeFQntPI7iz4H4zp
         GYNV8GpNg8iatFIr1tcYIgNJt1o1uiOlhZwssGGPUNb/gfgDumww6E5fyoIhyo9n0SfP
         hqPVafx16eYhluNaSEvUmPZwwHQQ6Gs6LdIKGdgYNUGK8Yk+90Nax1j8rX63UMajjFKl
         5HoJlOVk7ozI3fAyRdZftyrFeq8/LtZctE4zB8Uk4Zgi1u/etleadrCtoRuK0e2ZEcdI
         e8zIt0//5KK/BWLft6T9VS52bjdaFpnDOQFBdsruc+6vThc+xVUa43nSIwKeb0BdeynT
         zogg==
X-Gm-Message-State: APjAAAVUQqa+cG4Sb1jbcKyDB9l5IBrHqy+14rhs/fo+RIHX0+BXQGb9
        bRN9vrBlRJpItLriOqc64CCMSg==
X-Google-Smtp-Source: APXvYqzi2uLTJsw+edMFJq+DNQyvGd0PcsK9UYvnv+v8xA1dRESupytCXLoyfUCnalLWUD65g6ISdQ==
X-Received: by 2002:a63:52:: with SMTP id 79mr30999563pga.381.1560440195944;
        Thu, 13 Jun 2019 08:36:35 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t13sm276008pjo.13.2019.06.13.08.36.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 08:36:35 -0700 (PDT)
Date:   Thu, 13 Jun 2019 08:36:33 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     lgirdwood@gmail.com, broonie@kernel.org, agross@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH v3 6/7] dt-bindings: qcom_spmi: Document pms405 support
Message-ID: <20190613153633.GF6792@builder>
References: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
 <20190613142416.8985-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190613142416.8985-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 13 Jun 07:24 PDT 2019, Jeffrey Hugo wrote:

> From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
> 
> The PMS405 supports 5 SMPS and 13 LDO regulators.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  .../regulator/qcom,spmi-regulator.txt         | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
> index ba94bc2d407a..19cffb239094 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
> @@ -10,6 +10,7 @@ Qualcomm SPMI Regulators
>  			"qcom,pm8941-regulators"
>  			"qcom,pm8994-regulators"
>  			"qcom,pmi8994-regulators"
> +			"qcom,pms405-regulators"
>  
>  - interrupts:
>  	Usage: optional
> @@ -111,6 +112,29 @@ Qualcomm SPMI Regulators
>  	Definition: Reference to regulator supplying the input pin, as
>  		    described in the data sheet.
>  
> +- vdd_s1-supply:
> +- vdd_s2-supply:
> +- vdd_s3-supply:
> +- vdd_s4-supply:
> +- vdd_s5-supply:
> +- vdd_l1-supply:
> +- vdd_l2-supply:
> +- vdd_l3-supply:
> +- vdd_l4-supply:
> +- vdd_l5-supply:
> +- vdd_l6-supply:
> +- vdd_l7-supply:
> +- vdd_l8-supply:
> +- vdd_l9-supply:
> +- vdd_l10-supply:
> +- vdd_l11-supply:
> +- vdd_l12-supply:
> +- vdd_l13-supply:

No, the supply pins are as follows:

- vdd_l1_l2-supply:
- vdd_l3_l8-supply:
- vdd_l4-supply:
- vdd_l5_l6-supply:
- vdd_l10_l11_l12_l13-supply:
- vdd_l7-supply:
- vdd_l9-supply:
- vdd_s1-supply:
- vdd_s2-supply:
- vdd_s3-supply:
- vdd_s4-supply:
- vdd_s5-supply:


Regards,
Bjorn

> +	Usage: optional (pms405 only)
> +	Value type: <phandle>
> +	Definition: Reference to regulator supplying the input pin, as
> +		    described in the data sheet.
> +
>  - qcom,saw-reg:
>  	Usage: optional
>  	Value type: <phandle>
> -- 
> 2.17.1
> 
