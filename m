Return-Path: <linux-arm-msm+bounces-33464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8C7993B91
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 02:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1EA81C23AF6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 00:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1081EC4;
	Tue,  8 Oct 2024 00:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msOndidB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4846E625;
	Tue,  8 Oct 2024 00:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728346067; cv=none; b=PVRMv+hHuPaxwhekIF2RQMutrEqpO5kg4xvAc8B2stZEsrEMMM9KJHpy7BRcJwPKfZ7wqQsoJY88YRh/qBoUOGuvkBIIyr1kQKUMH6Zp7xyl9YMeUetSqldQQbifpJ8LFKY7ATyibDM/+GyW8Z89us3lCvRKPZOlc/udguFqmMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728346067; c=relaxed/simple;
	bh=0ZiPvMVxIXnmgpbTOX9Pm5lEjwMw7/tpiKgJMEpIy68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwz6dxmw00a5THHcgETfub6WQ0xPqRA+UcIrzKcwjzeRjc7lGrfJ+0v86Rua6dh2gDuAU4t2dMJOvdxhMftLL3DZ4TuadkDokboS8/jsCBv2O7YM2jpt05egyoey+2kErtPspmVInM+l0IJ/A/SPlIe87zrtNsPS+C69jV2+tpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=msOndidB; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2e18856feb4so4209953a91.3;
        Mon, 07 Oct 2024 17:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728346066; x=1728950866; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=miFjzeWy++5orkxZQhpnOaD2jAcQZeozu/hleuos2cM=;
        b=msOndidB1TtMUqCSI0/Ux9TZjzDEID7H84HhTke1Nr40uqxehypZNQVu8Xg1/EHtOe
         nTz8FyklTZTrR9z0Zb/SoFFTfmhcQh72ejNRTvbKpuWvEo8foTVPUsZTCcwydmd+0twP
         6dto9TjeXrEa/VilqJnzS/z/Dz9y9g5L3RwmizTJQQ3U1gkbPtbzz+TRi0/+lbaIiXXz
         X7HnPcFuuqw76jzFTgJR71EUnkF/NtiufKXJZJoA6Qi0lNjFDjjuwWQsN5DCcF1QnKe/
         QFmSDUvHmFi6TcNMmxdXyqWt4UqgEEKtXGZHFy0ImmgoVq7gH/vx2dnFqnN/20tre1qu
         Ws2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728346066; x=1728950866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miFjzeWy++5orkxZQhpnOaD2jAcQZeozu/hleuos2cM=;
        b=jDROP3g/+ZVQu72GS9dqQyU0jjD8RVgElZHY27tK2pSEPOxgQVdiAi+J4pZiSvugW+
         cFg9pyovbZIm+al41qHMYUwJqOju8Qp1lhhdn76Ep8hCTI4p48RVI3ZzIUw9meajfTza
         CJW8+1CJWHQ8G3u7Jo0gMVC8RkP77Ld2eOtUxiNu/8nQo+cCxWuZHDm1Rxp025AmWo+D
         qZpIxBr/xWONvulbkilay7dreSSfq0GdR3k76GdkujswhkOk1d5iqIPP7Ph5NlPn+TIM
         wbMsrnfcpHvTxTrHxPlfF2M/k1Js0q55HtergB8dRDPO1tPnJC7qTkwTTGA1r6eAtPIJ
         +R3g==
X-Forwarded-Encrypted: i=1; AJvYcCVCDETsqBp3BDLGP9psbWzE/CLbCOdM85m1nHXrbGycBnai+mwGR29hP2eUhy+deVfdMcs63yH1+E0GBrJz9Q==@vger.kernel.org, AJvYcCVuwbtOgCwIh5W/9donSWWtvDGh/RfPnVDbwWm+4Gah3hdWo8Dw3tdZOyG9fUTyJ/xe/lp4pf8AI6dW@vger.kernel.org, AJvYcCW3Hb/Ji3xjZZ977AFcwlrRWWi51xb/qLGUH1WZ+7sgWYi5ym4BriXR1dYrHL6MmBgGU+tJp+vxMvNClH8K@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp3pRlkM5quWVfstMxCcdZdfzFDRL+DKid32xkdGx9MoMu2PUd
	Cdcn6tpoFTQtOGlObEJ4aa46NQ6lBGoTyj0I+S9gtAEU8Om/ERLS
X-Google-Smtp-Source: AGHT+IF0RBKwgW4tthfAQBSAoJIijBpe1n0ZQjkbJYge4bFLQtS9TcqoaC+egoNNjETfPykOZdtVwg==
X-Received: by 2002:a17:90a:43c4:b0:2c9:7ebd:b957 with SMTP id 98e67ed59e1d1-2e1e621e54bmr16491664a91.11.1728346065564;
        Mon, 07 Oct 2024 17:07:45 -0700 (PDT)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e1e83cabbasm7921653a91.9.2024.10.07.17.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 17:07:45 -0700 (PDT)
Date: Tue, 8 Oct 2024 08:08:03 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add wifi
 node
Message-ID: <ZwR341pdImJf_z_b@localhost.localdomain>
References: <20241007130251.125022-1-lujianhua000@gmail.com>
 <20241007130251.125022-2-lujianhua000@gmail.com>
 <181d03f6-9a1d-449f-a8af-b4d0fcc8b188@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <181d03f6-9a1d-449f-a8af-b4d0fcc8b188@quicinc.com>

On Mon, Oct 07, 2024 at 11:40:48AM -0700, Jeff Johnson wrote:
> On 10/7/2024 6:02 AM, Jianhua Lu wrote:
> > Add wifi node and this wifi module is connected to pice port.
> 
> s/pici/pcie/ (or perhaps better: PCIe)
> 
Acked
> > The following is qca6390 probe message:
> >   ath11k_pci 0000:01:00.0: Adding to iommu group 12
> >   ath11k_pci 0000:01:00.0: BAR 0 [mem 0x60400000-0x604fffff 64bit]: assigned
> >   ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
> >   ath11k_pci 0000:01:00.0: MSI vectors: 32
> >   ath11k_pci 0000:01:00.0: qca6390 hw2.0
> >   ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
> >   ath11k_pci 0000:01:00.0: fw_version 0x10121492 fw_build_timestamp 2021-11-04 11:23 fw_build_id
> > 
> > Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> > ---
> > changes in v2:
> > 1. add ath11k-calibration-variant property.
> > 
> >  .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> > index ebea283f56ea..7a55e271c3ac 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> > @@ -680,6 +680,25 @@ &pcie0_phy {
> >  	status = "okay";
> >  };
> >  
> > +&pcieport0 {
> > +	wifi@0 {
> > +		compatible = "pci17cb,1101";
> > +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> > +
> > +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> > +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> > +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> > +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> > +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> > +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> > +		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
> > +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> > +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> > +
> > +		qcom,ath11k-calibration-variant = "Xiaomi_Pad_5Pro";
> 
> Are you going to submit the board file per the guidance Dmitry provided?

I want to get comment for this patch, then send board file.
I have send board file to ath11k@lists.infradead.org now.
> 
> Note that I am not up to speed on the firmware/board maintenance procedures so
> we'll need to wait for Kalle to have bandwidth to handle the request (and show
> me how he handles it).
> 
> /jeff
> 

