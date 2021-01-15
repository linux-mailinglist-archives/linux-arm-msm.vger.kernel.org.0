Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 717D62F723D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 06:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731863AbhAOFf5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 00:35:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731855AbhAOFf4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 00:35:56 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04E1BC0613D6
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 21:35:15 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id a109so7560578otc.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 21:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ex4djiKQkwoRFj7tuh1SXMLnnmR875ehYAWqWZ5AG64=;
        b=pdIWbmM15yChIPntLQv5+/QprnenTPRTblXc8b6ddirrDosII9dBhujL5WB51xLEUV
         bie0mZtZ/QY2HgeOb56sjn2jNAhO/h/6lxhxon8hk6vgMSMXG4s9FWnoddP13ycJ3Dyf
         LrOHQAp1KNA4ANcd2UWVrcchPgs3fsM8QEsNIDWkYAF27Vus9N1QYNgB9S8Et+Z8LORq
         osa2if+iZh02QM3oYubjV8R3hcEkZ3DykKkskg8dMOZ7CJ4XS32O3zfbbFaEOsHOgq1C
         3odr9enQp4oPwcuWweybcQxREznR6HilvH8znoyjdpKxS7ICBDCmrt3yQU6MwUoyz1up
         wU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ex4djiKQkwoRFj7tuh1SXMLnnmR875ehYAWqWZ5AG64=;
        b=OsqoKVNRjmlk6QjTdoC30eZxoLogeGPo0s6Jcv6dSKPnc8Bs9rv6MyECaZvu53MrAZ
         reNvrsZZy4yqKqOb3b9f4NGPDSwI3Bgfo2ZPi+dMT3XHym4o94qOdWBJmAjOLEWcLntl
         WJR/J/wr5n8aYU3R5W3+CjSzwmu7393JnRRYq++Xny1mKP9mZjpzGl0sXl+AujQT5MmP
         ss3gzWFhc0FqoLErxVieyA2vK+H4HiXrAKHde/MwpJ+uyScwUd5rSx16xeqsFcRIdvTa
         QX9wE2fWGmZddBrh/e0gsJwlKw4fbgvbcIgQPs1uKjk/vve1LuboX1l1MfiPD9TDpS9L
         QeHw==
X-Gm-Message-State: AOAM5330HbkaxCAITzNU17SqGxyfxcjQYlaEfGdPEe/z+FSuYvCNKk9f
        QvmzvvmaekY5hyKEC6nG1QUQcA==
X-Google-Smtp-Source: ABdhPJymcQ2AVQBNxFOrunqHg+Yhv5fJ/wqDhYf4YCO4gaImXFpt1lmK6+OCZiG5lwnYm/GeLmHjQw==
X-Received: by 2002:a9d:711b:: with SMTP id n27mr7096073otj.221.1610688915306;
        Thu, 14 Jan 2021 21:35:15 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 63sm1583434otx.2.2021.01.14.21.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 21:35:14 -0800 (PST)
Date:   Thu, 14 Jan 2021 23:35:12 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        sumit.semwal@linaro.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org
Subject: Re: [PATCH v2 6/7] dt-bindings: regulator: qcom-labibb: Document
 SCP/OCP interrupts
Message-ID: <YAEpkHSuf+Uv2kv+@builder.lan>
References: <20210113194214.522238-1-angelogioacchino.delregno@somainline.org>
 <20210113194214.522238-7-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113194214.522238-7-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 13 Jan 13:42 CST 2021, AngeloGioacchino Del Regno wrote:

> Short-Circuit Protection (SCP) and Over-Current Protection (OCP) are
> now implemented in the driver: document the interrupts.
> This also fixes wrong documentation about the SCP interrupt for LAB.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  .../regulator/qcom-labibb-regulator.yaml      | 20 +++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
> index 7a507692f1ba..cf784bd1f5e5 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
> @@ -29,9 +29,10 @@ properties:
>          default: 200
>  
>        interrupts:
> -        maxItems: 1
> +        minItems: 1
> +        maxItems: 2
>          description:
> -          Short-circuit interrupt for lab.
> +          Short-circuit and over-current interrupts for lab.
>  
>      required:
>        - interrupts
> @@ -47,9 +48,10 @@ properties:
>          default: 300
>  
>        interrupts:
> -        maxItems: 1
> +        minItems: 1
> +        maxItems: 2
>          description:
> -          Short-circuit interrupt for lab.
> +          Short-circuit and over-current interrupts for ibb.
>  
>      required:
>        - interrupts
> @@ -67,13 +69,15 @@ examples:
>        compatible = "qcom,pmi8998-lab-ibb";
>  
>        lab {
> -        interrupts = <0x3 0x0 IRQ_TYPE_EDGE_RISING>;
> -        interrupt-names = "sc-err";
> +        interrupts = <0x3 0xde 0x1 IRQ_TYPE_EDGE_RISING>,
> +                     <0x3 0xde 0x0 IRQ_TYPE_LEVEL_LOW>;
> +        interrupt-names = "sc-err", "ocp";
>        };
>  
>        ibb {
> -        interrupts = <0x3 0x2 IRQ_TYPE_EDGE_RISING>;
> -        interrupt-names = "sc-err";
> +        interrupts = <0x3 0xdc 0x2 IRQ_TYPE_EDGE_RISING>,
> +                     <0x3 0xdc 0x0 IRQ_TYPE_LEVEL_LOW>;
> +        interrupt-names = "sc-err", "ocp";
>        };
>      };
>  
> -- 
> 2.29.2
> 
