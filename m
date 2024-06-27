Return-Path: <linux-arm-msm+bounces-24520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BF891AD69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 19:07:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB5A3282D23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 17:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EFCE199E9B;
	Thu, 27 Jun 2024 17:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZNVPSyZe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DFD433B3
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 17:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719508052; cv=none; b=G1K39AjPATZISq6B7rRgZGcJlsA6NdrV0DJmozn+UJXKMAvP9dlR5D0gXetMnIWF2/y5AGNX4/jc/ozyFbm3hHqhJoWh7TIRTKufujz7f6AD353/W4mQMCwoq3U7n1igwcWOtGdf8ud/1B5jqihyTWy4SgSIxPjSQw9kue9BlT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719508052; c=relaxed/simple;
	bh=TilR43KIjFBeRdL1uCN+cULd4RllUEvgtbiOqptaisg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPt58Ch9oqrJecaf1kANoSWH4mK2K++f659D29PqlzU5wDSjEX6Je89lFeADg5soKgAhWgNfGfV0ByK6aVZYDLE0JUotej9S+I/3ihwDVAVBIAhEg/Zf32fTSIgIUjzylVjCWPtceyJZItRVK7+G74YKG/J9XbETxUSqtr+jR2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZNVPSyZe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719508049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qIxdFP2i4FT3D9Pm46UxMYOadfBkfMsZfXfJZXYueno=;
	b=ZNVPSyZe/0Z0mCskT+b1IFoXwQ3xQneEPw0n5gG5i8d2Dsypw9f/xauTkP58J/CKfKsciM
	dQpTp8H3/zMjiDGcwOzOuf+He3PdfGa6Y5/I19NW3IZyTV9yRr/0JM/a8pCNLsE87iBFc8
	uZKtQRt6ODKZWYXqqa7SjKn1u4lclF0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-4MdLqdbHOC6Bxj3itWw-SA-1; Thu, 27 Jun 2024 13:07:26 -0400
X-MC-Unique: 4MdLqdbHOC6Bxj3itWw-SA-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-79c0ffc2351so403234185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 10:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719508046; x=1720112846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIxdFP2i4FT3D9Pm46UxMYOadfBkfMsZfXfJZXYueno=;
        b=CnkedatB12/BX9UM/d1X01jBDZ7DauCCi9krVL+50LFBJImEvHYjcymoy5osA0j2Ul
         OBUDT0ENjMaXZ7SG8VnvwrC0xF13ZRu9YTZM8K3u7sYyfTqqCnPDGlPICXA9Jgnrzyvh
         f8StyHNvJgumjJBjp6szwyX8Wds3krnTt5p5bSUNoFsyet3vtcV7v+Z/YGETN6+WKEBq
         82THpkZklB0ES46EDkocZUf/U3q06R5SRerqlIDLsYledUCKDFQnQl4X9laY0gdYN1iK
         UjYGp4mUOWwGXKBdv6gaYeJwYMBMJBczhupJDMTVeG953TGc/5wdsyrywuwj8OZJz47M
         2uCg==
X-Forwarded-Encrypted: i=1; AJvYcCXA82DXqIk/psqF5vfIMPeqNfSNXfvesebNUFYhaHhTGAiMUuBVj1SGbXpvWz0+0SgDGsr1jzEVl9R42mjRLt+DlE/JDxV5sTaqCfO0TQ==
X-Gm-Message-State: AOJu0Yx2AhpmNxV4ViJrTBLL25TJSfQbSCZwFhsZGUgsproop74cxmCX
	xmWdmk7rAJCLZrUMBMBYxHmbayzHSP2J9qaw5Rp4sSQaqb0LFZyjacPmh0FEk3UqC0kJN3ETNLR
	LU9/gXPWGBiMUfJ7KWe0x+vRXh3jwleEc7Cw+4SZ/fg/biOHYofQYr8sStMqguN8=
X-Received: by 2002:a05:620a:394c:b0:79b:eb0f:7781 with SMTP id af79cd13be357-79beb0f7ec3mr1437500385a.53.1719508046051;
        Thu, 27 Jun 2024 10:07:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg/oiENJqDup3/M9UZYUuyNol+/22Ovf586SY/3tWxk/8vPIZ1xZuirsW0Zy9NbkOXr7WPng==
X-Received: by 2002:a05:620a:394c:b0:79b:eb0f:7781 with SMTP id af79cd13be357-79beb0f7ec3mr1437493585a.53.1719508045405;
        Thu, 27 Jun 2024 10:07:25 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79d5c8117e0sm72061285a.52.2024.06.27.10.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 10:07:25 -0700 (PDT)
Date: Thu, 27 Jun 2024 12:07:22 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 net-next 2/2] net: stmmac: qcom-ethqos: add a
 DMA-reset quirk for sa8775p-ride
Message-ID: <td5jbseo7gtu6d4xai6q2zkfmxw4ijimyiromrf52he5hze3w3@fd3kayixf4lw>
References: <20240627113948.25358-1-brgl@bgdev.pl>
 <20240627113948.25358-3-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627113948.25358-3-brgl@bgdev.pl>

On Thu, Jun 27, 2024 at 01:39:47PM GMT, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> On sa8775p-ride the RX clocks from the AQR115C PHY are not available at
> the time of the DMA reset so we need to loop TX clocks to RX and then
> disable loopback after link-up. Use the existing callbacks to do it just
> for this board.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Sorry, not being very helpful but trying to understand these changes
and the general cleanup of stmmac... so I'll point out that I'm still
confused by this based on Russell's last response:
https://lore.kernel.org/netdev/ZnQLED%2FC3Opeim5q@shell.armlinux.org.uk/

Quote:

    If you're using true Cisco SGMII, there are _no_ clocks transferred
    between the PHY and PCS/MAC. There are two balanced pairs of data
    lines and that is all - one for transmit and one for receive. So this
    explanation doesn't make sense to me.


<snip>

> +}
> +
>  static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
>  {
> +	qcom_ethqos_set_sgmii_loopback(ethqos, true);
>  	rgmii_updatel(ethqos, RGMII_CONFIG_FUNC_CLK_EN,
>  		      RGMII_CONFIG_FUNC_CLK_EN, RGMII_IO_MACRO_CONFIG);
>  }
<snip>
> @@ -682,6 +702,7 @@ static void ethqos_fix_mac_speed(void *priv, unsigned int speed, unsigned int mo
>  {
>  	struct qcom_ethqos *ethqos = priv;
>  
> +	qcom_ethqos_set_sgmii_loopback(ethqos, false);

I'm trying to map out when the loopback is currently enabled/disabled
due to Russell's prior concerns.

Quote:

    So you enable loopback at open time, and disable it when the link comes
    up. This breaks inband signalling (should stmmac ever use that) because
    enabling loopback prevents the PHY sending the SGMII result to the PCS
    to indicate that the link has come up... thus phylink won't call
    mac_link_up().

    So no, I really hate this proposed change.

    What I think would be better is if there were hooks at the appropriate
    places to handle the lack of clock over _just_ the period that it needs
    to be handled, rather than hacking the driver as this proposal does,
    abusing platform callbacks because there's nothing better.

looks like currently you'd:
    qcom_ethqos_probe()
	ethqos_clks_config(ethqos, true)
	    ethqos_set_func_clk_en(ethqos)
		qcom_ethqos_set_sgmii_loopback(ethqos, true) // loopback enabled
	ethqos_set_func_clk_en(ethqos)
	    qcom_ethqos_set_sgmii_loopback(ethqos, true) // no change in loopback
    devm_stmmac_pltfr_probe()
	stmmac_pltfr_probe()
	    stmmac_drv_probe()
		pm_runtime_put()
    // Eventually runtime PM will then do below
    stmmac_stmmac_runtime_suspend()
	stmmac_bus_clks_config(priv, false)
	    ethqos_clks_config(ethqos, false) // pointless branch but proving to myself
	                                      // that pm_runtime isn't getting in the way here
    __stmmac_open()
	stmmac_runtime_resume()
	    ethqos_clks_config(ethqos, true)
		ethqos_set_func_clk_en(ethqos)
		    qcom_ethqos_set_sgmii_loopback(ethqos, true) // no change in loopback
    stmmac_mac_link_up()
	ethqos_fix_mac_speed()
	    qcom_ethqos_set_sgmii_loopback(ethqos, false); // loopback disabled

Good chance I foobared tracing that... but!
That seems to still go against Russell's comment, i.e. its on at probe
and remains on until a link is up. This doesn't add anymore stmmac wide
platform callbacks at least, but I'm still concerned based on his prior
comments.

Its not clear to me though if the "2500basex" mentioned here supports
any in-band signalling from a Qualcomm SoC POV (not just the Aquantia
phy its attached to, but in general). So maybe in that case its not a
concern?

Although, this isn't tied to _just_ 2500basex here. If I boot the
sa8775p-ride (r2 version, with a marvell 88ea1512 phy attached via
sgmii, not indicating 2500basex) wouldn't all this get exercised? Right
now the devicetree doesn't indicate inband signalling, but I tried that
over here with Russell's clean up a week or two ago and things at least
came up ok (which made me think all the INTEGRATED_PCS stuff wasn't needed,
and I'm not totally positive my test proved inband signalling worked,
but I thought it did...):

    https://lore.kernel.org/netdev/zzevmhmwxrhs5yfv5srvcjxrue2d7wu7vjqmmoyd5mp6kgur54@jvmuv7bxxhqt/

based on Russell's comments, I feel if I was to use his series over
there, add 'managed = "in-band-status"' to the dts, and then apply this
series, the link would not come up anymore.

Total side note, but I'm wondering if the sa8775p-ride dts should
specify 'managed = "in-band-status"'.

Thanks,
Andrew


