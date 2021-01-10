Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 187E12F08AC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jan 2021 18:22:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbhAJRTm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jan 2021 12:19:42 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:33918 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726394AbhAJRTl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jan 2021 12:19:41 -0500
Received: by mail-ot1-f54.google.com with SMTP id a109so14755828otc.1;
        Sun, 10 Jan 2021 09:19:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=+It8DKP+b5gt+Nl1+4PLMeiYko01W1zgU1hu5LDI+fY=;
        b=m9SIYc1GmIPXP4//Ely5zs3qEbfqhtHf12XG2GEB1MXWsYh6CyCJyYH3SWdSuL6bXv
         51CP6ZQzFxookyh9s7n0Z45SjWD59FbnzhbSbsVpyRYt2EsyVxhPvGi9HTj0N5fkSSba
         LiGQISRikrJBcz5vRD/g+3ni0lKnoBo/6JK+fNiaQ5FxmMKmhag1fXNlAxyrSqDGA345
         c+ijLmA8JwlzN/dIh4SQKx4NLpvbugkHLnhaLVdxfubd9REROXvZp8nzPfx1wrsWg5uc
         8Iqu/519fBam9hIh91bvXMw1InSXehmRu+7iecIC3/t31GSc8rJNesg5NCGdiGtD/XP6
         9GlA==
X-Gm-Message-State: AOAM531jvo/BNFwmYnBbEEbN2DILtEi3tmTOKay0XRRgN0AQGGBRDQLA
        EZ5H+hWfolYeFbg+ncR8xJeaSbAynA==
X-Google-Smtp-Source: ABdhPJwEy7JMj1nwAxUQAdeb+EDsAfyf9t/S3EcEh/fWPnviqi+Z1bnyg9L8xy5eODCN8YSdFT/HHA==
X-Received: by 2002:a9d:4795:: with SMTP id b21mr8535917otf.65.1610299140487;
        Sun, 10 Jan 2021 09:19:00 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 31sm3070386otd.24.2021.01.10.09.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 09:18:59 -0800 (PST)
Received: (nullmailer pid 785279 invoked by uid 1000);
        Sun, 10 Jan 2021 17:18:46 -0000
From:   Rob Herring <robh@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-kernel@vger.kernel.org, martin.botka@somainline.org,
        broonie@kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, agross@kernel.org,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        sumit.semwal@linaro.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com
In-Reply-To: <20210109132921.140932-5-angelogioacchino.delregno@somainline.org>
References: <20210109132921.140932-1-angelogioacchino.delregno@somainline.org> <20210109132921.140932-5-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH 4/7] dt-bindings: regulator: qcom-labibb: Document soft start properties
Date:   Sun, 10 Jan 2021 11:18:46 -0600
Message-Id: <1610299126.029858.785278.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 09 Jan 2021 14:29:18 +0100, AngeloGioacchino Del Regno wrote:
> Document properties to configure soft start and discharge resistor
> for LAB and IBB respectively.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  .../bindings/regulator/qcom-labibb-regulator.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml: properties:ibb:properties:qcom,discharge-resistor-kohms: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
	Additional properties are not allowed ('default', 'enum' were unexpected)
	Additional properties are not allowed ('default' was unexpected)
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml: properties:ibb:properties:qcom,discharge-resistor-kohms: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
	300 is not of type 'string'
	64 is not of type 'string'
	32 is not of type 'string'
	16 is not of type 'string'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml: ignoring, error in schema: properties: ibb: properties: qcom,discharge-resistor-kohms
warning: no schema found in file: ./Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml

See https://patchwork.ozlabs.org/patch/1424112

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

