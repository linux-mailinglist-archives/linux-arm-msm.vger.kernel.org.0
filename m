Return-Path: <linux-arm-msm+bounces-3368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA818040BA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 22:08:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1A031F21160
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 21:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C1E364AC;
	Mon,  4 Dec 2023 21:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I4plrVI8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71DAFB6
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 13:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701724074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mJ2aLBuQ82UANlQlbiQPqkEKJKPRAic/HCDLBzYoX6s=;
	b=I4plrVI8pxkE+gH1m9jpK65PnVeLj61KICZXPJvHuLL6aUNAmjOmx15KZ6WK2z5zRgnoxI
	/gCk9VJ9Jtm5Cmyrsz0NlVQLc2FuQUyXv0FU6AKI/MH7M4fVGg6Jc4fFcjvk0GNF54Nlgs
	jDNVKd78vpB0ffaKTGayhKYbEE5zKso=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-TJEIIJf0NUeZX-YipDVrgg-1; Mon, 04 Dec 2023 16:07:48 -0500
X-MC-Unique: TJEIIJf0NUeZX-YipDVrgg-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-423dba1e166so76410821cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 13:07:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701724068; x=1702328868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJ2aLBuQ82UANlQlbiQPqkEKJKPRAic/HCDLBzYoX6s=;
        b=TTnQD2SlwfrjvtvNhm9HbmaQsPuwpFlKotrAlfjUVBAog6I78U+u2AUA+LgiMrOnzZ
         YuAOLv78J6RYQlG9sfZ1RD/LS5+yp9eqXiLdeNqUuh/oTzOcifYhhbCshciXewkPV9P/
         PEyHp8AQD82W84ha9fgllLSxWQfxHD/e0uawmmT6vo9PdyBjejBuCz5mOIA2/VlSIYBZ
         W2gyvia1UGfxs0Sc4VIqkkJceMc67MowaT1le8G06QrsW9xVfDR065GVTj2g86Uuulkm
         fzF8OtrxAlMh+/mWHiTCzs0g2CpD8+CsRt7/QwFmSYYceByIHfNjLLyaE0sGor2n949v
         yI3A==
X-Gm-Message-State: AOJu0Yyym3uBLO+3uFk7fcblX9dvyJXjBdK8WzYlcE7KRW2daxV4ZK2P
	qjRW0Gzu5HxWRmG5RPLI8Mc6zOTDh6cGm+ApBD4F8xEwf/LWMuxfTNiksKrsI+VwMd5dB5FcIb/
	H5T9yjY4tvqHEkyiAPHmbV/33Aw==
X-Received: by 2002:a05:622a:612:b0:423:9887:cd3e with SMTP id z18-20020a05622a061200b004239887cd3emr209062qta.32.1701724068021;
        Mon, 04 Dec 2023 13:07:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbFKSKjTKx+Yam65LOYaKr2UKx4QIOdb9/HID8MZGjV0GNxiebXUhSTXBgxjLjto4QiruptA==
X-Received: by 2002:a05:622a:612:b0:423:9887:cd3e with SMTP id z18-20020a05622a061200b004239887cd3emr209036qta.32.1701724067678;
        Mon, 04 Dec 2023 13:07:47 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::47])
        by smtp.gmail.com with ESMTPSA id o16-20020ac841d0000000b00423829b6d91sm4583237qtm.8.2023.12.04.13.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 13:07:47 -0800 (PST)
Date: Mon, 4 Dec 2023 15:07:45 -0600
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
Subject: Re: [PATCH v2] net: stmmac: update Rx clk divider for 10M SGMII
Message-ID: <zf4fsrtrd736kxweputr2fulu7ffagivwi7zodctcsdg3uj6e2@iquglstf2gqb>
References: <20231201100548.12994-1-quic_snehshah@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201100548.12994-1-quic_snehshah@quicinc.com>

On Fri, Dec 01, 2023 at 03:35:48PM +0530, Sneh Shah wrote:
> SGMII 10MBPS mode needs RX clock divider to avoid drops in Rx.
> Update configure SGMII function with rx clk divider programming.
> 
> Fixes: 463120c31c58 ("net: stmmac: dwmac-qcom-ethqos: add support for SGMII")
> Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>

Tested-by: Andrew Halaney <ahalaney@redhat.com> # sa8775p-ride

I can confirm that without this patch traffic doesn't seem to work when
I force things in to SPEED_10 with ethtool (which required another
change to this driver in stmmac_ethtool.c to do so, which as far as I
understand Sarosh from your group will be upstreaming soon and is an
independent issue).

I am curious, I expected to see some dropped/errors output in ip link
when things weren't working. I guess the sgmii phy in the soc is
rejecting these prior to handing them to the mac? Or am I
misunderstanding how that works?

> ---
> v2 changelog:
> - Use FIELD_PREP to prepare bifield values in place of GENMASK
> - Add fixes tag
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index d3bf42d0fceb..df6ff8bcdb5c 100644
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
> @@ -617,6 +618,9 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
>  	case SPEED_10:
>  		val |= ETHQOS_MAC_CTRL_PORT_SEL;
>  		val &= ~ETHQOS_MAC_CTRL_SPEED_MODE;
> +		rgmii_updatel(ethqos, RGMII_CONFIG_SGMII_CLK_DVDR,
> +			      FIELD_PREP(RGMII_CONFIG_SGMII_CLK_DVDR, 0x31),
> +			      RGMII_IO_MACRO_CONFIG);

Russell requested a comment about why you must program this every time,
I think it's a good idea too: https://lore.kernel.org/netdev/ZWch7LIqbMEaLRLW@shell.armlinux.org.uk/

Also on my wishlist is making 0x31 less magic, but Santa might not bring
that for me :)

>  		break;
>  	}
>  
> -- 
> 2.17.1
> 
> 


