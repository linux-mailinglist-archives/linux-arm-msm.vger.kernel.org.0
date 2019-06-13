Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF3844E95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 23:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbfFMVhf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 17:37:35 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46391 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbfFMVhf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 17:37:35 -0400
Received: by mail-pf1-f195.google.com with SMTP id 81so48482pfy.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2019 14:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=niNFpI11vAhO44einRqdwjoLItCHCO9233XjZiHQyaU=;
        b=VWyAXGKPO54EkkT6Acgj6BARkOxK/OgPKM3aZWm6CrPwTOzh/4dYYrimLWKWD5MXBJ
         24BEnzOE63HwDTRVWtdrcjwSpPMZlyjmJr7KetSeIdAMGYJs9F8OP4q1novWdQ8K8cW1
         WwQpCkm8ucq8sd542QexKKxYVSSjHAtSuJmrAIx8C1OQgLDyvJKIcR07VCwDOMbqYeMf
         SMV7kBZeeQ9evI6W03njns5230yNm1tzOFusuYUI9C8BVYr25D3VDv8bTVRUt9VQaPfv
         QsM+uaj2wS3gTO8XivsweLS3MNzzPfzJgHAWpfZ4LcfxL+OELhLK0ijI5CuQo+slWcRX
         ZUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=niNFpI11vAhO44einRqdwjoLItCHCO9233XjZiHQyaU=;
        b=GLFvdyTAjGEhmh2f1KQlblLaqrHyNyCPTNTcpaXN3tNF9VdEsVZGwBS40g6FAcviqG
         56jE5A4M4a7ipcQ9wZlEu7HTr/Lf47BTIuzvHKldbcCBeJvYWG0qrd+vqsbRuGKCpKiZ
         iy0oSMadpmuVgGsZd9EGFgKVsCVNYfLZq47yr2ucEVlwOWZQ9fvyZHFDdksHCT4aIaEA
         kp/rivDQOUUlxrBTNMTfgZoE0RLcwquLppwz8xYWPdG6qgYZliIRqzr6DP3UdAbwZHFT
         awsU6Jh4Dip0RLBTzUQk58rF8n/dspY82KmzVPrA1O/9JTSUiSRY7v1HsdzfvaYuEIaf
         eG+Q==
X-Gm-Message-State: APjAAAXyPlDyUMy7sY0EXMVrrb6sgCNsCxwKrQfvgz3kJSvlks/xF2au
        N2d11XhiPrQcvNPuWgSLwa43Ww==
X-Google-Smtp-Source: APXvYqwglE0/Cp+VMXnR+2NH92CcA2NClSyW42CnUhdnh1P+GPivZY9958ihtWBtbHS5dJMCg0Xw4A==
X-Received: by 2002:aa7:8d98:: with SMTP id i24mr27224795pfr.199.1560461854321;
        Thu, 13 Jun 2019 14:37:34 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p27sm667708pfq.136.2019.06.13.14.37.33
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 14:37:33 -0700 (PDT)
Date:   Thu, 13 Jun 2019 14:37:31 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     lgirdwood@gmail.com, broonie@kernel.org, agross@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH v4 6/7] dt-bindings: qcom_spmi: Document pms405 support
Message-ID: <20190613213731.GE4814@minitux>
References: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
 <20190613212707.5966-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190613212707.5966-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 13 Jun 14:27 PDT 2019, Jeffrey Hugo wrote:

> From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
> 
> The PMS405 supports 5 SMPS and 13 LDO regulators.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  .../bindings/regulator/qcom,spmi-regulator.txt | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
> index ba94bc2d407a..430b8622bda1 100644
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
> @@ -111,6 +112,23 @@ Qualcomm SPMI Regulators
>  	Definition: Reference to regulator supplying the input pin, as
>  		    described in the data sheet.
>  
> +- vdd_l1_l2-supply:
> +- vdd_l3_l8-supply:
> +- vdd_l4-supply:
> +- vdd_l5_l6-supply:
> +- vdd_l10_l11_l12_l13-supply:
> +- vdd_l7-supply:
> +- vdd_l9-supply:
> +- vdd_s1-supply:
> +- vdd_s2-supply:
> +- vdd_s3-supply:
> +- vdd_s4-supply:
> +- vdd_s5-supply
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
