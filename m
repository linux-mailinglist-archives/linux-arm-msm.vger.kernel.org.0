Return-Path: <linux-arm-msm+bounces-4410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B0F80ED66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 14:24:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 292F81F21610
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 13:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809BC6168F;
	Tue, 12 Dec 2023 13:24:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF59DA8;
	Tue, 12 Dec 2023 05:24:46 -0800 (PST)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3b9dc3215d2so2266201b6e.0;
        Tue, 12 Dec 2023 05:24:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702387486; x=1702992286;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Mu5OY9EeNLblapjoWxLOc/anyMYCIRnO6QV3zIN6QQ=;
        b=DbpTmSJGFpsOzJiMJO2GW4f+5j94U2Y0x7LBBm7JT15TRdvCMByv2+yJEz6QTmCVD9
         1zev64wxP1KTEpJ/UfwTBKQgroinloLxYkpZmV6b+jc9ZvsqamZ1+A/LMQSfzIG9+fOa
         S2wBnBrCr+Ho3mLeQYIP3PGLxqYhBCKcOLjFAjNiRoUhniFCsvwfdPyU0u4RI4Oe3b3Z
         q9wiYR9nrNzkxW46JNBHhZCe0n9ZqoQyUMcH9goi+/fow/M0Dj8GzmRwHrUMEu8EHE0m
         /0xqWCyaMnOP7SObecri/rYcFSLNiFy/F78kIzaQa8t7B/EdDU0Xffkv8x8/+boi6vfQ
         uT/w==
X-Gm-Message-State: AOJu0Yx7f5nPbqDab8gGEI7gS2CvpkZI+mjX79rGoD4SvJE9uHDVYaD4
	H9n5j1f40UK5jWXKdyu0oA==
X-Google-Smtp-Source: AGHT+IHm4cit1iUJK2zyIomx0aOxL5d+CrlgYwTDHHMA+JPNbzxp/5Z+Pdq6jI0cZxMer6lTL0wcJw==
X-Received: by 2002:a05:6808:152a:b0:3b8:b063:8945 with SMTP id u42-20020a056808152a00b003b8b0638945mr3910939oiw.83.1702387485688;
        Tue, 12 Dec 2023 05:24:45 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id dj13-20020a056808418d00b003ac9e775706sm2369521oib.1.2023.12.12.05.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 05:24:45 -0800 (PST)
Received: (nullmailer pid 1554265 invoked by uid 1000);
	Tue, 12 Dec 2023 13:24:44 -0000
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
Cc: andrew@lunn.ch, netdev@vger.kernel.org, hkallweit1@gmail.com, quic_srichara@quicinc.com, kuba@kernel.org, konrad.dybcio@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, agross@kernel.org, davem@davemloft.net, robert.marko@sartura.hr, linux@armlinux.org.uk, pabeni@redhat.com, robh+dt@kernel.org, edumazet@google.com, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, andersson@kernel.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20231212115151.20016-6-quic_luoj@quicinc.com>
References: <20231212115151.20016-1-quic_luoj@quicinc.com>
 <20231212115151.20016-6-quic_luoj@quicinc.com>
Message-Id: <170238748395.1554206.8758426127604170355.robh@kernel.org>
Subject: Re: [PATCH v2 5/5] dt-bindings: net: ipq4019-mdio: Document
 ipq5332 platform
Date: Tue, 12 Dec 2023 07:24:43 -0600


On Tue, 12 Dec 2023 19:51:50 +0800, Luo Jie wrote:
> Update the yaml file for the new DTS properties.
> 
> 1. cmn-reference-clock for the CMN PLL source clock select.
> 2. clock-frequency for MDIO clock frequency config.
> 3. add uniphy AHB & SYS GCC clocks.
> 4. add reset-gpios for MDIO bus level reset.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  .../bindings/net/qcom,ipq4019-mdio.yaml       | 157 +++++++++++++++++-
>  1 file changed, 153 insertions(+), 4 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml: cmn-reference-clock: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231212115151.20016-6-quic_luoj@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


