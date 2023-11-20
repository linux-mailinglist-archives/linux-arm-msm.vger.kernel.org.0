Return-Path: <linux-arm-msm+bounces-1184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6E97F16FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 16:15:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 664462825E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 15:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE05B1CFBD;
	Mon, 20 Nov 2023 15:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98772D7C;
	Mon, 20 Nov 2023 07:14:51 -0800 (PST)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-35930447ae9so13859275ab.2;
        Mon, 20 Nov 2023 07:14:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700493290; x=1701098090;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pvyuBwDWjlua8KTa1tSkZYuhpwaN2g16l8i+kRkooGI=;
        b=F9TYe0EE6EbiJk0bO+xVpdtrHDV/yE5IE3/WpSTzRVJ6WyIJbSa9l3FgfRsIG/HrCn
         dRarfRq+i9me5Prl6FDBx920EKe3MR8HRPyTkxFWJeOtd6uc9Mx8hUB7L2xejFRk+xfW
         /0qdpWA8pYvrcDbbWQcONH//qiXe2yJP5DOPsD5hCTP6Dcq4VuS+EMZzijoBs3mZHY3m
         qts4qpClVuJJfzE8lJ8QLJZ/LJVnwCIOc/F2baGHo5ImkdMm2ECW7EL74Z4ZPjDBf0q2
         YdMSt8fmNRDL2RKQQJCHEeOkZ4HqrVxyPWtUQ3/csSgUhaODyGsSdh1nM5RBN2F5B3ZP
         y6pg==
X-Gm-Message-State: AOJu0YyF16Kx8c77XWTwZGzjn4qbNxE056ZMaLpgBnw+DQorFvUGF4OK
	wYsX8ODoaRE1G2rZUFMSjA==
X-Google-Smtp-Source: AGHT+IG7xvPwlp/b4aE9KUp1vczIEf4+6xwXP9on7fUf1y2nYNw0P+9020srGtfv0qnr6wMJ5vQlPQ==
X-Received: by 2002:a92:dd8f:0:b0:35b:380:88d2 with SMTP id g15-20020a92dd8f000000b0035b038088d2mr3993458iln.22.1700493290338;
        Mon, 20 Nov 2023 07:14:50 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id j16-20020a056e02219000b0034fd4562accsm2484574ila.28.2023.11.20.07.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 07:14:30 -0800 (PST)
Received: (nullmailer pid 2026531 invoked by uid 1000);
	Mon, 20 Nov 2023 15:14:02 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Harini Katakam <harini.katakam@amd.com>, Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Paolo Abeni <pabeni@redhat.com>, 
	Qingfang Deng <dqfext@gmail.com>, Andy Gross <agross@kernel.org>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, 
	Russell King <linux@armlinux.org.uk>, 
	David Epping <david.epping@missinglinkelectronics.com>, 
	Vladimir Oltean <olteanv@gmail.com>, SkyLake Huang <SkyLake.Huang@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Robert Marko <robert.marko@sartura.hr>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Simon Horman <horms@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, linux-kernel@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, linux-mediatek@lists.infradead.org, 
	"David S. Miller" <davem@davemloft.net>, Daniel Golle <daniel@makrotopia.org>, 
	linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20231120135041.15259-3-ansuelsmth@gmail.com>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-3-ansuelsmth@gmail.com>
Message-Id: <170049324201.2026498.15592956023583173731.robh@kernel.org>
Subject: Re: [net-next RFC PATCH 02/14] dt-bindings: net: move PHY modes to
 common PHY mode types definition
Date: Mon, 20 Nov 2023 08:14:02 -0700


On Mon, 20 Nov 2023 14:50:29 +0100, Christian Marangi wrote:
> Move PHY modes from ethernet-controller schema to dedicated common PHY
> mode types definition. This is needed to have a centralized place to
> define PHY interface mode and permit usage and reference of these modes
> in other schemas.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/net/ethernet-controller.yaml     |  47 +------
>  .../bindings/net/ethernet-phy-mode-types.yaml | 132 ++++++++++++++++++
>  2 files changed, 133 insertions(+), 46 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-phy-mode-types.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/ethernet-phy-mode-types.yaml:21:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/ethernet-phy-mode-types.yaml: 'oneOf' conditional failed, one must be fixed:
	'unevaluatedProperties' is a required property
	'additionalProperties' is a required property
	hint: Either unevaluatedProperties or additionalProperties must be present
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/ethernet-phy-mode-types.yaml: 'anyOf' conditional failed, one must be fixed:
	'properties' is a required property
	'patternProperties' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231120135041.15259-3-ansuelsmth@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


