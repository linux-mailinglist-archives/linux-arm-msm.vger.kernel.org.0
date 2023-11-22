Return-Path: <linux-arm-msm+bounces-1513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 326CD7F4753
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 14:03:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCE5D281179
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 13:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038132137E;
	Wed, 22 Nov 2023 13:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hLZbOLas"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33894195
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 05:03:26 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a00c200782dso358970866b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 05:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700658204; x=1701263004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YcYUWH5bzrETcKbno6DmH/KmpiVWUmC1uDUZpbNkxL0=;
        b=hLZbOLasZtPK+NhtkJylKsv/0AptHHps729faXkPUQmdSWlYPwi+eDVtmkAvhqntdg
         dgbwu0+SNVKZGsJZY9nDG9+gzK+8CT6F2YRL/vmptJbezAzhKRco9VmBcgsiGdFE5ngE
         uI9TQ3t3bKJBP2TH4JdZvJVt95i/TiN0yZLONa2LttjyJMsyfZzob6aVzDfrlqxpSS9w
         BZxVB4PRFLUborYGAYnwxtAs5OxxblSv7lWTq+KXR7xQhCa6njEH7Wg+ENEPSkTeL2QI
         NIyrI3leLS01I+rL/YmH5sKYF07wJzklid8iav3p2GFM7Zu/Lr45dPVkZAUVCwjLPyzU
         fE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700658204; x=1701263004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcYUWH5bzrETcKbno6DmH/KmpiVWUmC1uDUZpbNkxL0=;
        b=Dr2FfR8JKFFsvsjt+t20TDqW+JCaigb9+EIF5zKfHjlXhvFx2Dzrg+dKxtf7jmH7mj
         qNcwaHreD+D7k8OyZXcqxdq5hQF690ajZo5bqpy/gy/Wij07P5IPzkrfq2KWcNDujAYc
         7H1ZkCBteU7qh18hftdt17x84om5BIfEq8cbqaU0iqSOPH+gt07rNe5QQjR0nXte/RkI
         OgyxBEfEQNHjVW9o9095CtieGQbOFC0CpAk0AHv4tt+TxAVzMlHkBIIuAklmC8eksZVX
         gS91caAUsGZcJuHyvNQGk481UtQJhJD5Fnpl3vECeL5bGtRFx2WrvvWlmRea4bqdCoXT
         N2EA==
X-Gm-Message-State: AOJu0Yx5dh8uZ3yY3+DoAnTjFcIELlM5VuyPB9NdnBAk3XnhT7G+CM6T
	ABB0TYDGpbP7TgwLnbg18yOnDw==
X-Google-Smtp-Source: AGHT+IEh3QsM15HWI8AtDUaKzyzxO6unVwWtCJeTfgjG18wkq4n4JMq+Iw7r2nqKQmxIPt7LxPtwUw==
X-Received: by 2002:a17:906:8e:b0:9c4:6893:ccc5 with SMTP id 14-20020a170906008e00b009c46893ccc5mr1359841ejc.57.1700658204634;
        Wed, 22 Nov 2023 05:03:24 -0800 (PST)
Received: from linaro.org ([86.123.99.122])
        by smtp.gmail.com with ESMTPSA id kk17-20020a170907767100b0099cce6f7d50sm6622637ejc.64.2023.11.22.05.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 05:03:24 -0800 (PST)
Date: Wed, 22 Nov 2023 15:03:22 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qcom-qmp-usb: Add Qualcomm X1E80100 USB3 PHY
 support
Message-ID: <ZV38GhOK/n47c6ne@linaro.org>
References: <20231122-phy-qualcomm-usb3-uniphy-x1e80100-v1-0-3f5bd223d5b4@linaro.org>
 <20231122-phy-qualcomm-usb3-uniphy-x1e80100-v1-2-3f5bd223d5b4@linaro.org>
 <ZV36k8AZdy9Zm-rj@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZV36k8AZdy9Zm-rj@hovoldconsulting.com>

On 23-11-22 13:56:51, Johan Hovold wrote:
> On Wed, Nov 22, 2023 at 02:05:22PM +0200, Abel Vesa wrote:
> > The X1E80100 platform has two instances of the USB3 UNI phy attached
> > to the multi-port USB controller, add definition for these.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 152 ++++++++++++++++++++++++++++++++
> >  1 file changed, 152 insertions(+)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> > index 02f156298e77..bbeba5722cf0 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> > @@ -24,6 +24,7 @@
> >  #include "phy-qcom-qmp-pcs-misc-v4.h"
> >  #include "phy-qcom-qmp-pcs-usb-v4.h"
> >  #include "phy-qcom-qmp-pcs-usb-v5.h"
> > +#include "phy-qcom-qmp-pcs-usb-v7.h"
> >  
> >  /* QPHY_SW_RESET bit */
> >  #define SW_RESET				BIT(0)
> > @@ -1138,6 +1139,134 @@ static const struct qmp_phy_init_tbl sc8280xp_usb3_uniphy_pcs_usb_tbl[] = {
> >  	QMP_PHY_INIT_CFG(QPHY_V5_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
> >  };
> >  
> > +static const struct qmp_phy_init_tbl x1e80100_usb3_uniphy_serdes_tbl[] = {
> 
> These tables and...
> 
> > @@ -1411,6 +1540,26 @@ static const struct qmp_phy_cfg sc8280xp_usb3_uniphy_cfg = {
> >  	.regs			= qmp_v5_usb3phy_regs_layout,
> >  };
> >  
> > +static const struct qmp_phy_cfg x1e80100_usb3_uniphy_cfg = {
> > +	.lanes			= 1,
> > +
> > +	.offsets		= &qmp_usb_offsets_v5,
> > +
> > +	.serdes_tbl		= x1e80100_usb3_uniphy_serdes_tbl,
> > +	.serdes_tbl_num		= ARRAY_SIZE(x1e80100_usb3_uniphy_serdes_tbl),
> > +	.tx_tbl			= x1e80100_usb3_uniphy_tx_tbl,
> > +	.tx_tbl_num		= ARRAY_SIZE(x1e80100_usb3_uniphy_tx_tbl),
> > +	.rx_tbl			= x1e80100_usb3_uniphy_rx_tbl,
> > +	.rx_tbl_num		= ARRAY_SIZE(x1e80100_usb3_uniphy_rx_tbl),
> > +	.pcs_tbl		= x1e80100_usb3_uniphy_pcs_tbl,
> > +	.pcs_tbl_num		= ARRAY_SIZE(x1e80100_usb3_uniphy_pcs_tbl),
> > +	.pcs_usb_tbl		= x1e80100_usb3_uniphy_pcs_usb_tbl,
> > +	.pcs_usb_tbl_num	= ARRAY_SIZE(x1e80100_usb3_uniphy_pcs_usb_tbl),
> > +	.vreg_list		= qmp_phy_vreg_l,
> > +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> > +	.regs			= qmp_v5_usb3phy_regs_layout,
> > +};
> 
> ...this struct no longer looks like they've been added at the right
> places.
> 
> > +
> >  static const struct qmp_phy_cfg qmp_v3_usb3_uniphy_cfg = {
> >  	.lanes			= 1,
> >  
> > @@ -2247,6 +2396,9 @@ static const struct of_device_id qmp_usb_of_match_table[] = {
> >  	}, {
> >  		.compatible = "qcom,sc8280xp-qmp-usb3-uni-phy",
> >  		.data = &sc8280xp_usb3_uniphy_cfg,
> > +	}, {
> > +		.compatible = "qcom,x1e80100-qmp-usb3-uni-phy",
> > +		.data = &x1e80100_usb3_uniphy_cfg,
> 
> Same here, please keep the entries sorted by compatible (and please
> check your other x1e80100 patches for such issues after changing the SoC
> name).

Thanks for reviewing and catching this. Will triple check from now on.

> 
> >  	}, {
> >  		.compatible = "qcom,sdm845-qmp-usb3-uni-phy",
> >  		.data = &qmp_v3_usb3_uniphy_cfg,
> 
> Johan

