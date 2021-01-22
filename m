Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C492D300953
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 18:12:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729702AbhAVRLi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Jan 2021 12:11:38 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:42539 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729620AbhAVRKn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Jan 2021 12:10:43 -0500
Received: by mail-oi1-f180.google.com with SMTP id x71so6695408oia.9;
        Fri, 22 Jan 2021 09:10:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VO4YDPSPk3X4YanEL+ISpxl4y2bC3b4d4yYT6txBL0A=;
        b=eAUceQnYb5SVZXmi1uyDnrO29qMQqCsBX/P0nq0ErCbL+NID++ZGUhR6hluf6XlchT
         3ykwry98dTV1Vn+d98fOVFZMbnvBRqHxmeBD4B4cwfTqK+w7ABhsZW7Fo3PRatpyG+Cq
         iJ43bZRr9xCuC+z95Fq1sGbSGJF/nTq4lzdJY04tlnP7AQVn4KXNq2lHpQ+BqwJTr+Wp
         sf3ryDKvCCVGVRLIkiSb2aal89o2D/Vmu1NIUFE3IqKcjAKYbtzs20TBCM6U6tgiXFqu
         7vFfCpHIqjMgXg6xQavPB9+TQzIkBkDB53q8d0Vbrnuhl9qdjzooq0YzD9yv+7JTO+18
         FF/A==
X-Gm-Message-State: AOAM530o5Abxnhi39/LKqAVf4kHtG3Luwkv13mRgT3j50kdldNmcyml1
        92gft1KV/EeMft2ijOJySw==
X-Google-Smtp-Source: ABdhPJx0C16VS8PjIIah78I3ttMMkQwNvl1FVW/XVbfR9XwakTiy+bbXofid0kkR0SqiLbzL5z12JA==
X-Received: by 2002:aca:cdd0:: with SMTP id d199mr3938456oig.118.1611335399575;
        Fri, 22 Jan 2021 09:09:59 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d17sm1787016otk.3.2021.01.22.09.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 09:09:58 -0800 (PST)
Received: (nullmailer pid 981079 invoked by uid 1000);
        Fri, 22 Jan 2021 17:09:56 -0000
Date:   Fri, 22 Jan 2021 11:09:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, sumit.semwal@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org
Subject: Re: [PATCH v4 6/7] dt-bindings: regulator: qcom-labibb: Document
 SCP/OCP interrupts
Message-ID: <20210122170956.GA977073@robh.at.kernel.org>
References: <20210119174421.226541-1-angelogioacchino.delregno@somainline.org>
 <20210119174421.226541-7-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210119174421.226541-7-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 19, 2021 at 06:44:20PM +0100, AngeloGioacchino Del Regno wrote:
> Short-Circuit Protection (SCP) and Over-Current Protection (OCP) are
> now implemented in the driver: document the interrupts.
> This also fixes wrong documentation about the SCP interrupt for LAB.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
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

minItems: 1
items:
  - description: Short-circuit interrupt
  - description: over-current interrupt

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
> 2.30.0
> 
