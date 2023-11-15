Return-Path: <linux-arm-msm+bounces-666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 547697EBC90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 05:20:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06316281252
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 04:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE86A5C;
	Wed, 15 Nov 2023 04:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A598A55;
	Wed, 15 Nov 2023 04:20:20 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29633D8;
	Tue, 14 Nov 2023 20:20:19 -0800 (PST)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6ce291b5df9so4070010a34.2;
        Tue, 14 Nov 2023 20:20:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700022018; x=1700626818;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zMZtG8wZ4mB9TMRAsuvMioibWJRVqhYk1Jf8pUMmSp8=;
        b=us2SG2kEg2UtOvWuCn1KtIAhB+9OLuXfh4YVKYyWuyVbP+N6XbKffs7OjhgGPrBLdZ
         tKLrUlVyPjAeK/7bVX5W6/0G7AgOztYaaocFQ48k985TVbF40N4h9dSLfnp/3Ow1Tuph
         I1GvAooztsNuYbLksbEr+ZzllzinPRzEM12jNBhgq6X7qgPELZQa6DzAO3qj9JushIXg
         OA5ef3ypbciWacfqeRh89exxnO9zYORMPdmOyt8gwqlSfm8fkX7dfSgR9DuHsC9ZWYbG
         BRshFwEk3h7kIa6b/FPvhO/YIuE6dAtIQxK6MxiAEYbExwoeXFH6o5HBIUF/h8arbBFl
         rqMQ==
X-Gm-Message-State: AOJu0YysOMrARaEXBHeQ7rm0O1HvDAyhuscAauM+S9cR24vZomoaywhV
	RDDcZeOTSl9SEz5YWU9ZZQ==
X-Google-Smtp-Source: AGHT+IEdr207A8JOAg6W3oZMktdcok05h9UBN4tPtj5Q7XydVuCDJSPsQP5hpIZAMaDb0onnVzA6fA==
X-Received: by 2002:a9d:6c8e:0:b0:6b9:ed64:1423 with SMTP id c14-20020a9d6c8e000000b006b9ed641423mr4036402otr.2.1700022018335;
        Tue, 14 Nov 2023 20:20:18 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l21-20020a056830269500b006cd0a56c406sm444524otu.60.2023.11.14.20.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 20:20:17 -0800 (PST)
Received: (nullmailer pid 1471064 invoked by uid 1000);
	Wed, 15 Nov 2023 04:20:16 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: quic_srichara@quicinc.com, linux-arm-msm@vger.kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org, conor+dt@kernel.org, linux@armlinux.org.uk, edumazet@google.com, robert.marko@sartura.hr, davem@davemloft.net, konrad.dybcio@linaro.org, hkallweit1@gmail.com, pabeni@redhat.com, andrew@lunn.ch, devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org, kuba@kernel.org, netdev@vger.kernel.org
In-Reply-To: <20231115032515.4249-10-quic_luoj@quicinc.com>
References: <20231115032515.4249-1-quic_luoj@quicinc.com>
 <20231115032515.4249-10-quic_luoj@quicinc.com>
Message-Id: <170002201635.1471046.17829589138044518697.robh@kernel.org>
Subject: Re: [PATCH 9/9] dt-bindings: net: ipq4019-mdio: Document ipq5332
 platform
Date: Tue, 14 Nov 2023 22:20:16 -0600


On Wed, 15 Nov 2023 11:25:15 +0800, Luo Jie wrote:
> On platform IPQ5332, the MDIO address of qca8084 can be programed
> when the device tree property "fixup" defined, the clock sequence
> needs to be completed before the PHY probeable.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  .../bindings/net/qcom,ipq4019-mdio.yaml       | 138 +++++++++++++++++-
>  1 file changed, 130 insertions(+), 8 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml: phyaddr-fixup: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml: pcsaddr-fixup: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml: mdio-clk-fixup: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml: fixup: missing type definition
Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.example.dtb: /example-1/mdio@90000/pcsphy0@5: failed to match any schema with compatible: ['qcom,qca8k_pcs']
Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.example.dtb: /example-1/mdio@90000/pcsphy1@6: failed to match any schema with compatible: ['qcom,qca8k_pcs']
Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.example.dtb: /example-1/mdio@90000/xpcsphy@7: failed to match any schema with compatible: ['qcom,qca8k_pcs']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231115032515.4249-10-quic_luoj@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


