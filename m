Return-Path: <linux-arm-msm+bounces-27806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC59946396
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 21:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E866C1C20F2B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 19:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 811DE1547D8;
	Fri,  2 Aug 2024 19:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E5yu08UV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C31F7F6
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Aug 2024 19:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722625937; cv=none; b=DqEIAlo8q+6cWr9WJ5/bJk7KfOHVxtb1XGTA/YUp9168VVXrPfnW2zEY2GeZw9LWPMLLlsRhxOo4aVDyeGwAo52ZABOSTPCYOLIlAaSgOYm0oCtTrIuFbZHjpsQbnc7woJ1JxxxJDFQydjSWDfhyPAoyRTwJsOWdo9UuUoC2hf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722625937; c=relaxed/simple;
	bh=JGtSVVreHND+krzlydv1deHKmflrZuoby2HY7g+SoMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FYvgKFk+zeKl/yYnWWnEatlnubOcjmnfW9KkNO2oSnY6komjyQIArzHQJ9O6i4Qe5xJWxwhJ8+yBWTezZvq9vQjTJ1BKvsoTsvoG04cGTzkDOTwIci6DxIUI7t0hIMi+TeaL36TRdHatnw7Dm9tLWRwb2ujXupJp/8JvTZ+xciU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E5yu08UV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722625934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MeHceffG2DvzwnKMzj0FH08E1flGznXu0RYbhG1MEgM=;
	b=E5yu08UVB7OT2cwdVFBkd3KhwDFmSjLLBZUUa6X5ql5VegAFGu1YyrqNcMoyu64h7BKPLy
	NjYoat68LRKYBplIO9JOfyPPZGwWvr8TVtWHgKzvXJ27pbmSbKStML/rZaOLipw50DiM6Z
	HX8Fgnd1h2547KoSk2jcOvGMlkwst3s=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-IXtMR2TEOTOOaY9_zJvYAg-1; Fri, 02 Aug 2024 15:12:13 -0400
X-MC-Unique: IXtMR2TEOTOOaY9_zJvYAg-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6b79ab201faso91666276d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Aug 2024 12:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722625932; x=1723230732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeHceffG2DvzwnKMzj0FH08E1flGznXu0RYbhG1MEgM=;
        b=oc5/2/4uGFqFJVblLUlR1YI12LIgJtiFNTV4/ORR4AjjasCAyLuDsmfvb8p5nV8VJd
         bgsn68p9KW6n1GVuO5Ohb177ogI0bT7DmYSeQERGkjVb7jt5OTg+YxHaqsUa+rJfPI0j
         r0RSUVN1Ne2bfJc1gz8RK2N72mSqn0XAoDyJDaRpBmzC0T9Y6wTIRtnA/nD5L8NrsskF
         nocKq36EyIcCM8QVnzJv6DNHzYuBoaCjo3uToOHpNCPG+vDAv7PHcq5+RaYGrHEpoMmS
         VaNaNYBPnWWkOT+mz3Qquw6yfptb0fiaaRGja0EVTtVYq+YuCeAM+GFN8k66UlwSBSHc
         niCA==
X-Forwarded-Encrypted: i=1; AJvYcCXlEfjM+p3vjYoDTYtzxBIs2ebMOVqFX6Pvgb8aYoKLQJ7qNGNfJPwg+x/zzog7DlwlasXj2ZCKyAo85VzogxX9Z4pPKq0DbDcc3r+I2A==
X-Gm-Message-State: AOJu0YwJJSS1EE3Y5eDKrMKXLgNVyNqosfukH2TkT58uQF7Zwpi/rIBy
	mnNSnHQQGaG1EiF+wqJ0IFm769xE3BzdRh6t/kJ0uLcfGATOOP4YdtEBVaCYuWiO1iclCORUHDS
	SaWC7tVSkezw1olCQIPwW3XwMmc/PmjKbJAqdiy6vraYtV7FPi8yCSitMACQbSLM=
X-Received: by 2002:a05:6214:419e:b0:6b7:a4dc:e24a with SMTP id 6a1803df08f44-6bb984c2dc5mr45628566d6.54.1722625932555;
        Fri, 02 Aug 2024 12:12:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRfbbC2Grol7Hz6dSqVP5HlRsLd1BHxqCCywxSF3I2nLeCO3jas/mUewssAd0BLE0wzgqG8Q==
X-Received: by 2002:a05:6214:419e:b0:6b7:a4dc:e24a with SMTP id 6a1803df08f44-6bb984c2dc5mr45628146d6.54.1722625932128;
        Fri, 02 Aug 2024 12:12:12 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c76aceasm9638566d6.6.2024.08.02.12.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 12:12:11 -0700 (PDT)
Date: Fri, 2 Aug 2024 14:12:08 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Alexei Starovoitov <ast@kernel.org>, bpf@vger.kernel.org, 
	Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 14/14] net: stmmac: Activate Inband/PCS flag
 based on the selected iface
Message-ID: <yma4bknen5jc6om56eorr44uuoqtziqvk4phds6cpkrubrs5dy@esxfxtz22egh>
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
 <E1sZpov-000eI5-KP@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1sZpov-000eI5-KP@rmk-PC.armlinux.org.uk>

On Fri, Aug 02, 2024 at 11:47:37AM GMT, Russell King wrote:
> From: Serge Semin <fancer.lancer@gmail.com>
> 
> The HWFEATURE.PCSSEL flag is set if the PCS block has been synthesized
> into the DW GMAC controller. It's always done if the controller supports
> at least one of the SGMII, TBI, RTBI PHY interfaces. If none of these
> interfaces support was activated during the IP-core synthesize the PCS
> block won't be activated either and the HWFEATURE.PCSSEL flag won't be
> set. Based on that the RGMII in-band status detection procedure
> implemented in the driver hasn't been working for the devices with the
> RGMII interface support and with none of the SGMII, TBI, RTBI PHY
> interfaces available in the device.
> 
> Fix that just by dropping the dma_cap.pcs flag check from the conditional
> statement responsible for the In-band/PCS functionality activation. If the
> RGMII interface is supported by the device then the in-band link status
> detection will be also supported automatically (it's always embedded into
> the RGMII RTL code). If the SGMII interface is supported by the device
> then the PCS block will be supported too (it's unconditionally synthesized
> into the controller). The later is also correct for the TBI/RTBI PHY
> interfaces.
> 
> Note while at it drop the netdev_dbg() calls since at the moment of the
> stmmac_check_pcs_mode() invocation the network device isn't registered. So
> the debug prints will be for the unknown/NULL device.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> [rmk: fix build errors, only use PCS for SGMII if priv->dma_cap.pcs is set]
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Russell, did you add in the priv->dma_cap.pcs check with SGMII just
because it *is* expected to be set unconditionally when SGMII support is
there?

Always fan of less conditionals, so just curious as to your motivation
since Serge's message makes it seem like SGMII && dma_cap.pcs is a
redundant check.

Otherwise, looks good to me.

Thanks,
Andrew


