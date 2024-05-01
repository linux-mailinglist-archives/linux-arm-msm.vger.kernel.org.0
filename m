Return-Path: <linux-arm-msm+bounces-19060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 834168B8CD9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 17:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 109F01F260C3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 15:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C6312FB2A;
	Wed,  1 May 2024 15:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OtIUjcyV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B0412F390
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 May 2024 15:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714576677; cv=none; b=bZqCNl6ke27GV9ErU98N+5YdA08lJ8WjMrpXEqXvwt555wT1M7C4Br64A6jxkP1JKmRki3RAwUDF0Ig05otGiX4Am6qPujK0c51GbvH9I34A6sLtlqmi96z96QRyWL/6WZlJLTCpPJ/Ur/E4zwgh3kx8oig9lkNBaw5IH9PZEiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714576677; c=relaxed/simple;
	bh=XwmcPuQxx2tBf5gkCDnJVQZhi17lS1CN8P7TNrDPnEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bpc9q9PPRsQHQuV/KZatHETqoezBxaQPsMkHo9W6FR7XH4BaSFb0EHdlSoxC88wP1jjeotiQvx5ZBFTxaanPOTucqLPDctKezooiO7tnmJ4+fSa9d9unwCHbBO53imtGjG2dl7F3vLOCK4p71/L0bCCAHvZdSyuqRdeJ8JMZ/zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OtIUjcyV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714576674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w1KbR/bB5pAX4yeRaQtdilxJnSjmuR3a1duUgyjv4uo=;
	b=OtIUjcyVG9OQ0FLoYSPZ9YBPAb/bmBSIOiMDlzqocSJa61uqHvrEqe6mpc8TBcQk/gPwx8
	MWW7fRHVPCKnSN9aocxartyghCTGZTkR0H+LKNsUQYXV0Xq/flncteVt0IFjnXqu7AHlIU
	8FfLmXFzNO4+0rDHpxmGFj6BrRZAGfo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-ZJ5jwp8zM8qk9nbwFxy_bQ-1; Wed, 01 May 2024 11:17:52 -0400
X-MC-Unique: ZJ5jwp8zM8qk9nbwFxy_bQ-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6a097848a56so75101456d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 May 2024 08:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714576672; x=1715181472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1KbR/bB5pAX4yeRaQtdilxJnSjmuR3a1duUgyjv4uo=;
        b=CIApdO3wKvwjU7yYkjyvKPk//VZXJzeU1sMc4567DwVvFXwFE4Gk59zFZSqab47JQA
         uaz368FqhoMKu3567pFv70DeYWuzDRUEwURlqTvk4m2T24ZM49X/BqD3EInfVoo7wowC
         zmdRuOPNIoxee2Fu6nriWI2p+dhBitdl9BRCs9OQ5ES6xiSYQiS2XaVda/tZmY8wRxvy
         CJYvhBSn0LhQGLz5Z2K1Gli8/oQXCoQP36MX5Oo6NxhM2jIf5n449C2W+Y94KgXu47ge
         c50MCp/75hnDxK3ue1qNztfulIrGDVSjYlK2sLoM4y1wkSm4hKb3oefRMHY0Rk7qeFiS
         qoEA==
X-Forwarded-Encrypted: i=1; AJvYcCXykVYTEKCzNslzi6s8Ta6lTYliwhF7TFmgQBwQ2vYosuRVAGbjN3JGNTBlE34zzvTZQd3JHuzBMi7lFSxyV2iwFJgqncXkY694li7P0g==
X-Gm-Message-State: AOJu0YxgEQQXhihDzCDoBwSCXCJptHcuBE8D46qCxEYX74oEFbWZeGOA
	itduw+2axzrYw7me0KJSaVtOJRvKBNuIP7aETjQFdCye7muAOITbx5143hSIvvRCnQrKwolDnFp
	li05jiGPK1GbLwa5mLfh2+ktneVEk5C49wd0WLIcb99lVVeLp7eR/uPN1q+//98w=
X-Received: by 2002:ad4:5f4f:0:b0:6a0:c96e:c4e3 with SMTP id p15-20020ad45f4f000000b006a0c96ec4e3mr2892075qvg.4.1714576671604;
        Wed, 01 May 2024 08:17:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUT47ffWFVAGBG1ZcXvz+ipzMXbZ+rXAl2nPyrFx392+FQjQROOPjgZNDW95PwhpUpRQj1rg==
X-Received: by 2002:ad4:5f4f:0:b0:6a0:c96e:c4e3 with SMTP id p15-20020ad45f4f000000b006a0c96ec4e3mr2892047qvg.4.1714576671156;
        Wed, 01 May 2024 08:17:51 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
        by smtp.gmail.com with ESMTPSA id v7-20020a0cf907000000b006a0f4921e8esm549195qvn.119.2024.05.01.08.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 08:17:50 -0700 (PDT)
Date: Wed, 1 May 2024 10:17:49 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sa8775p: mark ethernet devices as
 DMA-coherent
Message-ID: <tcqvggpqdegqjtnz6vklhgcu7v4wdl5ncngkujsqaxtgntsmcf@obqec5wcjtuo>
References: <20240430-mark_ethernet_devices_dma_coherent-v2-1-24fbbdc90122@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430-mark_ethernet_devices_dma_coherent-v2-1-24fbbdc90122@quicinc.com>

On Tue, Apr 30, 2024 at 08:45:18PM -0700, Sagar Cheluvegowda wrote:
> Ethernet devices are cache coherent, mark it as such in the dtsi.
> Fixes: ff499a0fbb23 ("arm64: dts: qcom: sa8775p: add the first 1Gb ethernet interface")
> Fixes: e952348a7cc7 ("arm64: dts: qcom: sa8775p: add a node for EMAC1")
> 
> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>

Nit: Fixes: and Signed-off-by: should be grouped together.. i.e.:

    Ethernet devices are cache coherent, mark it as such in the dtsi.

    Fixes: ff499a0fbb23 ("arm64: dts: qcom: sa8775p: add the first 1Gb ethernet interface")
    Fixes: e952348a7cc7 ("arm64: dts: qcom: sa8775p: add a node for EMAC1")
    Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>

> ---
> Changes in v2:
> Remove internal change-id from commit message
> - Link to v1: https://lore.kernel.org/r/20240425-mark_ethernet_devices_dma_coherent-v1-1-ad0755044e26@quicinc.com
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 231cea1f0fa8..5ab4ca978837 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -2504,6 +2504,7 @@ ethernet1: ethernet@23000000 {
>  			phy-names = "serdes";
>  
>  			iommus = <&apps_smmu 0x140 0xf>;
> +			dma-coherent;
>  
>  			snps,tso;
>  			snps,pbl = <32>;
> @@ -2538,6 +2539,7 @@ ethernet0: ethernet@23040000 {
>  			phy-names = "serdes";
>  
>  			iommus = <&apps_smmu 0x120 0xf>;
> +			dma-coherent;

Does the schema need updating then?

    (dtb-checker) ahalaney@x1gen2nano ~/git/linux-next (git)-[b4970433daf5] % make CC=clang ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- CHECK_DTBS=y DT_SCHEMA_FILES=/net/qcom,ethqos.yaml qcom/sa8775p-ride.dtb
      UPD     include/config/kernel.release
      DTC_CHK arch/arm64/boot/dts/qcom/sa8775p-ride.dtb
    /home/ahalaney/git/linux-next/arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
	    from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
    /home/ahalaney/git/linux-next/arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
	    from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#

You can use eb15bd5c2a69 ("dt-bindings: dmaengine: qcom: gpi: Allow dma-coherent")
for inspiration for crafting that patch and adding it into the beginning
of this series.

>  
>  			snps,tso;
>  			snps,pbl = <32>;
> 
> ---
> base-commit: a93289b830ce783955b22fbe5d1274a464c05acf
> change-id: 20240425-mark_ethernet_devices_dma_coherent-6c6154b84165

It seems you're using b4 (yay! good choice). I noticed the To/Cc list
here seems small. b4 prep --auto-to-cc should basically use
get_maintainers.pl and include the relevant folks. You can add on to it
from there with b4 prep --edit-cover. Typically if someone gives you a comment
on a patch its a good idea to Cc them on the next version (in case they weren't
on the prior).

> 
> Best regards,
> -- 
> Sagar Cheluvegowda <quic_scheluve@quicinc.com>
> 
> 


