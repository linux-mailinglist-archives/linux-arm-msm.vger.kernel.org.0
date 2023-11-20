Return-Path: <linux-arm-msm+bounces-1236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6697F1F34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 22:33:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B4F41C20D86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 21:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED9338DF2;
	Mon, 20 Nov 2023 21:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cluwzw5O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4712CA;
	Mon, 20 Nov 2023 13:33:22 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3316c6e299eso2042547f8f.1;
        Mon, 20 Nov 2023 13:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700516001; x=1701120801; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kWNfORC9WXph6KKDiI7YmzeaXM5cXoqqihKDnt/tg2s=;
        b=Cluwzw5OFtzeiZoa68ubC9KWbv4ROMqa9blzQBwHsvEDrEvN0CU1dd4ICeMSk+XkUH
         ZlgkJG61pC/3+inc6II4Ogugv9n3VswVti5+Tr0YQ6IyXK1DP1QfI5jQrJ4HBvOWezg4
         thqAtBl2kvSuIGHtNg2zeyXBF/PrxfUKg8+lj0r5dtZm2KerDwoNpcdy59pftvBXmmF6
         lDl4ofcqF8UMxEh+42PtZbzJDl97JM7sDo6aEVYzzIwd2PuCLxcFBse4wp4tNpyWGsQs
         6Ye9SQDAImc9Q37bWqAJdkZeS3nCaew82u3xJYzeZMcZf4dOyTW7V1itijKrL2pt+Lpo
         WQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700516001; x=1701120801;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWNfORC9WXph6KKDiI7YmzeaXM5cXoqqihKDnt/tg2s=;
        b=aQBzt8l4+ohJT9w3v1jYM0fgz+itU72O783xWfK2X+BqcVH/a6MR5o+l3fT/taeJeU
         h0No/u8oO1wNCm6H3NOWQOLFBrJMP1H2qHXchpIuD1lTafgDe+KzHaa/VWuHBpfa58LE
         MBhnQI4IJra1yYRWnztmLKCD4D8JgTqouWl+IT2gM+Mr+//fOCbUWXZ+F1JM7bWjUJ0r
         z7UcESifa2QWyJtv4NNteigP/EmM49tZlUrLdrQO/t+oGeL+AOZpCyUfecmARg+St+wL
         y0eBeg1A0jjjnjuauJvAfVSbUwT+xxnoSoXtd3TeBu2a8DNuJoN2WM/rXwl+Tzkc3ijW
         7p3w==
X-Gm-Message-State: AOJu0YzZKXbERaY6CR/xA0wmgJc+fprJvU4aXOXtH1tJ4qjvWT8QCvyt
	HU9X2K+6xSvlFABbi3QSIuE=
X-Google-Smtp-Source: AGHT+IGWWKqhNx6gXBkuFHcXHhfK1w8N/HKv9y2WoU75JVgzVFjqqAOeK/jHkG5ym9ne0q6hzaMShg==
X-Received: by 2002:adf:9b89:0:b0:332:c4b0:6a19 with SMTP id d9-20020adf9b89000000b00332c4b06a19mr4949954wrc.59.1700516000813;
        Mon, 20 Nov 2023 13:33:20 -0800 (PST)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id c15-20020adfe70f000000b0032da8fb0d05sm12257843wrm.110.2023.11.20.13.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:33:20 -0800 (PST)
Message-ID: <655bd0a0.df0a0220.568c3.92d9@mx.google.com>
X-Google-Original-Message-ID: <ZVupN1rFPGIPryuG@Ansuel-xps.>
Date: Mon, 20 Nov 2023 19:45:11 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 03/14] dt-bindings: net: document ethernet
 PHY package nodes
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-4-ansuelsmth@gmail.com>
 <c21ff90d-6e05-4afc-b39c-2c71d8976826@lunn.ch>
 <655bc8d6.050a0220.d22f2.315f@mx.google.com>
 <45784368-93e0-4d57-bb0c-5730f53f5a08@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45784368-93e0-4d57-bb0c-5730f53f5a08@lunn.ch>

On Mon, Nov 20, 2023 at 10:25:10PM +0100, Andrew Lunn wrote:
> > A real DT that use this is (ipq807x):
> > 
> > &mdio {
> > 	status = "okay";
> > 	pinctrl-0 = <&mdio_pins>;
> > 	pinctrl-names = "default";
> > 	reset-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
> > 
> > 	ethernet-phy-package {
> > 		compatible = "ethernet-phy-package";
> > 		phy-mode = "psgmii";
> > 
> > 		global-phys = <&qca8075_4>, <&qca8075_psgmii>;
> > 		global-phy-names = "combo", "analog_psgmii";
> > 
> > 		qca8075_0: ethernet-phy@0 {
> > 			compatible = "ethernet-phy-ieee802.3-c22";
> > 			reg = <0>;
> > 		};
> 
> ...
> 
> > 	};
> > 
> > 	qca8081: ethernet-phy@28 {
> > 		compatible = "ethernet-phy-id004d.d101";
> > 		reg = <28>;
> > 		reset-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
> > 	};
> 
> I've no idea if DT allows this. The issue is that reg is the same for
> both nodes within the ethernet-phy-package container, and
> ethernet-phy@28. They are all addresses on the same MDIO bus.  We are
> parsing this bus structure ourselves in __of_mdiobus_register(), so we
> could make it work, but i don't know if we should make it work.
>

And that is why I have some reserve on the idea of defining a reg for
ethernet-phy-package. Adding a reg would create some duplicate. Is it
really a problem to have a node with no reg in the mdio node?

(patch 04 of this series already updates the parsing function to check
one level deeper in the presence of the ethernet-phy-compatible treating
any node found as it was defined in the upper mdio node)

-- 
	Ansuel

