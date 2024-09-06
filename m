Return-Path: <linux-arm-msm+bounces-31087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CC496F0E2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 12:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 017A6286673
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 10:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722B01C9DD8;
	Fri,  6 Sep 2024 10:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aRQaqOuP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2541C9858
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 10:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725617088; cv=none; b=awotzWkoBbCogqtQW2V+JtM3gum1eYMVfiHOFQqivKaogdv6twcfAs42BbjJBM6XwfnjAj0+FQx7JAWuPlvGhb3B/JVUsLyDstnsdqSZFUVGgnhQTTLsQBGho48XdjIZLZd7xR/8TwefqHcEXcY33celp6giSxSDPHv19wD0bDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725617088; c=relaxed/simple;
	bh=ju/WNXLZa51es1aLKi3YTUeCubFru3m7GbOM1EA3t40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GgdGe7VDYfeKs3bro0o1tJ7wtRJXxl4yVlxHjc8a0SvHFCybfPLr5y+FL+HUUrb56yVFdvugTSOUQlDq36JkR701Ww2I9+zkvn6cIGGPFl8hGGsuJaSR1w0zhepyTD2aHc/67uBPsSh/KP0snNfFRc+h4wHf+NN0xig9cu/KeuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aRQaqOuP; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f50966c478so20530291fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2024 03:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725617084; x=1726221884; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=conazCNmwKwRZFKszCtH4D3K4/XIDaOm770X7uvpF+c=;
        b=aRQaqOuP0r2gQvLa5zyhBwwby5HxEyAn8QWPt45Na8FEHEgwSemlTvTdkVhUtBkqOv
         4oMJ4eBXsHBpMGuPHNL4yJcbIHSS6T4Watu9eu0sv3GTaxP6dlHMngIn/k+QL8UsUakp
         JNNFVmEY4l0r+IiHRFqhcQl1m4lLo0a8BDVX6fndRA9PVlcg4PbTQ+4d9xQTNBnnDGhC
         fagHIJCeTRAj3ctCCFxDlPTkkNkFsSS8wNW2hTaCTFmNlDk3rpPzucfv05o/kxB6C1F4
         9T1Gk6fw3VzoOai638HFQGIeWxuWA5fI1nWPh7EsO/GglHvDr51E2QYi4+jvPNEdgxiS
         0HnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725617084; x=1726221884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=conazCNmwKwRZFKszCtH4D3K4/XIDaOm770X7uvpF+c=;
        b=BRNepkEGJhaWiX9Z+vg4TIPuWnmaFhbRvmPsCjtz6uG7d/+vbM4pGUw9qyzmkSwGdl
         6W0IgXmcGfYpV5+yq8WX+tZz9vpoAUPYfwgu1icrkpvX8+nbz0q6po3ALn9mICKtxdrW
         6sJgJStL8tYXmsZhVE+eO5fPoFSQvlHNGJR8omFvDkM/4kpFnMVq4UoH4LrBf1mnnZk9
         Dde9lOleImb1mXf2IVLjZXs9abJ9v0nD+3YN5C/SdB53YuSUsUIHhfHIKpTNi1f9b0Sq
         QW8oBYSacY2E7y8thlGMHMPTLkqh6Dr/dYI0PT78YXQd6tR02W8mPmvf7C1yt+87N4Qg
         AYRg==
X-Forwarded-Encrypted: i=1; AJvYcCVjdir7LZItR6ae6vWtVXxLoGMPrLjcQfXjbYwkMbCTiCWrVeWZIRGwQgoktgOgULrr7zhR6He+k5hbzJXa@vger.kernel.org
X-Gm-Message-State: AOJu0YzZKhvVG6Iz2QcoGmP/WND9d2yv0tdBCvr4IKuKkSeNadk/wfcM
	TuyAE6SkvuqwjkaZvVyfQKh8x8qlXyW9GzgI95DYZ7EvQKuZjjkwkQ99jaOPkOLw6z0L6Y8C0iM
	G
X-Google-Smtp-Source: AGHT+IGeyzqs6kME051X1HodS6OUcEVd1fJmzfHiaYvknClUVHClFoyo1i9WvELf/ZjGHo9rc3d5qA==
X-Received: by 2002:a05:651c:198e:b0:2f4:f279:36d3 with SMTP id 38308e7fff4ca-2f751eaecf8mr12374031fa.4.1725617083891;
        Fri, 06 Sep 2024 03:04:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f65e893563sm6351791fa.4.2024.09.06.03.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 03:04:43 -0700 (PDT)
Date: Fri, 6 Sep 2024 13:04:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: Caleb Connolly <caleb.connolly@linaro.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>, linux-arm-msm@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH] ath11k: allow missing memory-regions
Message-ID: <w6c22o7j7bv4j3jkcvt5cwdnatsm4lzqtmchh62xm6vqsdv4hs@k46fzmeoyfrt>
References: <20240904095815.1572186-2-caleb.connolly@linaro.org>
 <8f64a4ab-abf5-4afe-bc4f-725fc89d27ec@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f64a4ab-abf5-4afe-bc4f-725fc89d27ec@quicinc.com>

On Fri, Sep 06, 2024 at 12:47:31PM GMT, Raj Kumar Bhagat wrote:
> On 9/4/2024 3:27 PM, Caleb Connolly wrote:
> > On SC7280 platforms which are running with TrustZone, it is not
> > necessary to manually map the memory regions used by the wifi hardware.
> > However, ath11k will currently fail to load unless both memory regions
> > are specified.
> > 
> > This breaks wifi on the rb3gen2 which only specifies the firmware memory
> > region and does not use the CE region.
> > 
> > Adjust the order of operations in ath11k_ahb_fw_resources_init() to
> > check for the wifi-firmware subnode before attempting to parse the
> > memory regions.
> > 
> > Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> > ---
> > Cc: linux-arm-msm@vger.kernel.org
> > ---
> >  drivers/net/wireless/ath/ath11k/ahb.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> > index 634d385fd9ad..e24f8da565db 100644
> > --- a/drivers/net/wireless/ath/ath11k/ahb.c
> > +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> > @@ -999,20 +999,20 @@ static int ath11k_ahb_fw_resources_init(struct ath11k_base *ab)
> >  	 */
> >  	if (!ab->hw_params.fixed_fw_mem)
> >  		return 0;
> >  
> > -	ret = ath11k_ahb_setup_msa_resources(ab);
> > -	if (ret) {
> > -		ath11k_err(ab, "failed to setup msa resources\n");
> > -		return ret;
> > -	}
> > -
> >  	node = of_get_child_by_name(host_dev->of_node, "wifi-firmware");
> >  	if (!node) {
> >  		ab_ahb->fw.use_tz = true;
> >  		return 0;
> >  	}
> >  
> > +	ret = ath11k_ahb_setup_msa_resources(ab);
> > +	if (ret) {
> > +		ath11k_err(ab, "failed to setup msa resources\n");
> > +		return ret;
> > +	}
> > +
> >  	info.fwnode = &node->fwnode;
> >  	info.parent = host_dev;
> >  	info.name = node->name;
> >  	info.dma_mask = DMA_BIT_MASK(32);
> 
> 
> ath11k_ahb_setup_msa_resources(ab), will only read the device-tree and
> save the memory addresses/size form device-tree to ab_ahb->fw.
> These saved address, only used if "wifi-firmware" node is defined.
> This the node "wifi-firmware" is not defined it is considered to be
> running with TrustZone, and saved addresses are not of use.
> 
> This changes looks fine.

If this is a 'Reviewed-by' then please state so in your message by
adding corresponding line with the tag name, your name and email.
Maintainers and patch management systems will pick it up to reflect your
contribution to the upstream process.

-- 
With best wishes
Dmitry

