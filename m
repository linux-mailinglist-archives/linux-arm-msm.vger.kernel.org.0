Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 467D830092D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 18:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729191AbhAVRCo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Jan 2021 12:02:44 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:44115 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729525AbhAVRCY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Jan 2021 12:02:24 -0500
Received: by mail-ot1-f47.google.com with SMTP id e70so5687054ote.11;
        Fri, 22 Jan 2021 09:02:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6sVAS8McQtykZSKMD8TJfco5bmcxCKrGxCBO63fTSXE=;
        b=JVavhHJNLPJuuaCdoodJe5nUYDQ5EC8hmBHmQqPBzqpBNdw+9aSK6CEvMZUE3TqDBJ
         GH3BGHVvnI4durnnJXaL7GUxb8F5/gwhyZutobSqIRB3O9jF7ZER5tTN/LDQilpTzLjO
         W/3bXdLfMoq64bqVL0ojgk1dvnxzpNJtKYcq9LUwjoa37+aRY/DEY4FyE41JymqKzsI8
         p6CZAs3h3VmSTeiiHvczZdYuyF7VvKK7qZxACY3Rlnf925maz+v/iBdwKO/aBgq+v7ib
         JdNMae3RRIpqEynH3MYNtiqKjEE6SSq+gcgWG/ccRl3P4nquvkIy+6jsLCkEJXIz3kho
         YMQw==
X-Gm-Message-State: AOAM530HzZr/3KVarNsXgbBJ83rej4dpcsuc+qyb3cZGnRB73doc6Cwy
        oZjkZk+/xsj7P+Hd8d6OUA==
X-Google-Smtp-Source: ABdhPJw6HJVLhsFnLETDiHvMJKo7SqxjASi5pXnzmYTpS34geiMln/JrZncuiromxmbZbCWYTmaKnw==
X-Received: by 2002:a05:6830:3495:: with SMTP id c21mr3965016otu.97.1611334899943;
        Fri, 22 Jan 2021 09:01:39 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p11sm1751250oif.55.2021.01.22.09.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 09:01:38 -0800 (PST)
Received: (nullmailer pid 968208 invoked by uid 1000);
        Fri, 22 Jan 2021 17:01:37 -0000
Date:   Fri, 22 Jan 2021 11:01:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, sumit.semwal@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org
Subject: Re: [PATCH v4 4/7] dt-bindings: regulator: qcom-labibb: Document
 soft start properties
Message-ID: <20210122170137.GA962214@robh.at.kernel.org>
References: <20210119174421.226541-1-angelogioacchino.delregno@somainline.org>
 <20210119174421.226541-5-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210119174421.226541-5-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 19, 2021 at 06:44:18PM +0100, AngeloGioacchino Del Regno wrote:
> Document properties to configure soft start and discharge resistor
> for LAB and IBB respectively.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../bindings/regulator/qcom-labibb-regulator.yaml      | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
> index 53853ec20fe2..7a507692f1ba 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
> @@ -22,6 +22,11 @@ properties:
>      type: object
>  
>      properties:
> +      qcom,soft-start-us:
> +        $ref: /schemas/types.yaml#/definitions/uint32

Don't need a type when you have standard units.

> +        description: Regulator soft start time in microseconds.
> +        enum: [200, 400, 600, 800]
> +        default: 200
>  
>        interrupts:
>          maxItems: 1
> @@ -35,6 +40,11 @@ properties:
>      type: object
>  
>      properties:
> +      qcom,discharge-resistor-kohms:

-kohms is not standard units as documented in property-units.txt (and 
.yaml in dtschema). Please use '-ohms'.

Given this is already applied, send an incremental patch.

> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Discharge resistor value in KiloOhms.
> +        enum: [300, 64, 32, 16]
> +        default: 300
>  
>        interrupts:
>          maxItems: 1
> -- 
> 2.30.0
> 
