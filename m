Return-Path: <linux-arm-msm+bounces-4043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE2D80ADB4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 21:20:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9450F281275
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 20:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27FBD57324;
	Fri,  8 Dec 2023 20:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AEj7wduW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E3A610DE
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 12:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702066834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2FTOMdJpRPbHn3vU2n7KIGDnUrhFTCYmrUCTOtwVngI=;
	b=AEj7wduWuOMjhRtIoYB/xGVSxs0CBorjhRxcPuJCu5G8k5sjTKhpR7NQCyVZe4a4cbEKi/
	cvi47nyLgA25gfMMp7hPmuoGJCzd68zWEti5aJDuXSnR98jmF+R2ksDK06xtf0uWWCAiM+
	ToMCqMxX8eSliaCo57JWbWclIgyxUAQ=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-g9SavWQPMBOwrG6gFT_SNg-1; Fri, 08 Dec 2023 15:20:31 -0500
X-MC-Unique: g9SavWQPMBOwrG6gFT_SNg-1
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-1fb33566583so4843910fac.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 12:20:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702066830; x=1702671630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FTOMdJpRPbHn3vU2n7KIGDnUrhFTCYmrUCTOtwVngI=;
        b=Bl/igJElVBZ/uB0u5TVQHzjiFWUB344X4UbRwsW5DQ8Yq7vySS515U7j+tzlDuwolD
         /ofmRHy/XphySdVj3DY1TE4v+SuCZe794B7Ue+I4S2653JXg9Ky8BB8FYuFwBbxRMDsh
         fCKVbyFJwt4mSGaZwQeZzXqu2QSSmhYzHemNstbtBV+ItsqioKCK0U5A5Fu2GfQ7LJkA
         HiBTUJbTztJKqfUihtIaeYNrSLFdHV5YsNvtr6MQv8OwrvMy/Oy3DKGnsiDj1vOIvUbG
         zq/xifOhair0N8xmYWlYqsfJtgspnLehLWako9wM6sLxEHA04HCNyf3gxSTbE79dl6o9
         dDvw==
X-Gm-Message-State: AOJu0Ywk94BnkGmaWVOhv3ygRmJNlhHtkH48GNa62flKt3h5fXZhQdJm
	hDet6Uy+ESAGRxm93Y7HiKKqCKXcPX1aAIfaEZcgpO7kPqtUQm1g8iwIl8DBQuCpJGZSssA846O
	PFRNUC/6OxKPrrIQ2HDGW96TN1A==
X-Received: by 2002:a05:6359:4585:b0:170:17eb:9c51 with SMTP id no5-20020a056359458500b0017017eb9c51mr481906rwb.50.1702066830526;
        Fri, 08 Dec 2023 12:20:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLWmk2lhCMiTr98WkK9KeFFVT1gu2su5EkI3YZa49gE9uU8KYl5h62TvxFqSxd5sJ7laeJbw==
X-Received: by 2002:a05:6359:4585:b0:170:17eb:9c51 with SMTP id no5-20020a056359458500b0017017eb9c51mr481899rwb.50.1702066830252;
        Fri, 08 Dec 2023 12:20:30 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
        by smtp.gmail.com with ESMTPSA id po8-20020a05620a384800b0077f0a9ec24bsm927364qkn.105.2023.12.08.12.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 12:20:29 -0800 (PST)
Date: Fri, 8 Dec 2023 14:20:27 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Sneh Shah <quic_snehshah@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH net v3] net: stmmac: update Rx clk divider for 10M SGMII
Message-ID: <2yx7snbvbvjycuszzonmwxokr4pvqslz2bpy4eoyrri5tzlymb@t3t23x7eeknq>
References: <20231208062502.13124-1-quic_snehshah@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208062502.13124-1-quic_snehshah@quicinc.com>

On Fri, Dec 08, 2023 at 11:55:02AM +0530, Sneh Shah wrote:
> SGMII 10MBPS mode needs RX clock divider to avoid drops in Rx.
> Update configure SGMII function with rx clk divider programming.
> 
> Fixes: 463120c31c58 ("net: stmmac: dwmac-qcom-ethqos: add support for SGMII")

You didn't add my:

    Tested-by: Andrew Halaney <ahalaney@redhat.com>

from the last version. Typically that's fine to do even if you post a
new version as long as the changes are minor (in your case it's just the
comment that was added since I tested, so definitely fine to do).

> Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
> ---
> v3 changelog:
> - Added comment to explain why MAC needs to be reconfigured for SGMII
> v2 changelog:
> - Use FIELD_PREP to prepare bifield values in place of GENMASK
> - Add fixes tag
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index d3bf42d0fceb..ab2245995bc6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -34,6 +34,7 @@
>  #define RGMII_CONFIG_LOOPBACK_EN		BIT(2)
>  #define RGMII_CONFIG_PROG_SWAP			BIT(1)
>  #define RGMII_CONFIG_DDR_MODE			BIT(0)
> +#define RGMII_CONFIG_SGMII_CLK_DVDR		GENMASK(18, 10)
>  
>  /* SDCC_HC_REG_DLL_CONFIG fields */
>  #define SDCC_DLL_CONFIG_DLL_RST			BIT(30)
> @@ -598,6 +599,9 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos)
>  	return 0;
>  }
>  
> +/* On interface toggle MAC registetrs gets reset.
> + * Configure MAC block for SGMII on ethernet phy link up
> + */

s/registetrs/registers/

>  static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
>  {
>  	int val;
> @@ -617,6 +621,9 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
>  	case SPEED_10:
>  		val |= ETHQOS_MAC_CTRL_PORT_SEL;
>  		val &= ~ETHQOS_MAC_CTRL_SPEED_MODE;
> +		rgmii_updatel(ethqos, RGMII_CONFIG_SGMII_CLK_DVDR,
> +			      FIELD_PREP(RGMII_CONFIG_SGMII_CLK_DVDR, 0x31),
> +			      RGMII_IO_MACRO_CONFIG);
>  		break;
>  	}
>  
> -- 
> 2.17.1
> 


