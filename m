Return-Path: <linux-arm-msm+bounces-33856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFD69986A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 14:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 376DD1F2128A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 12:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6E71C689F;
	Thu, 10 Oct 2024 12:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dk3NdRHO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A31B1C232C
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 12:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728564732; cv=none; b=eqa1H8qnlMkB+OioS1qpoWY60kJJ0I7pMwBELiI99fkO4WjSzOS7uiieigq8qIE+d7JYh3kYgOrR0pxQxOI8FzV2sxsVhSMwt2JWQI1iKAC9r88aH5aMTPLHAcmFOcBA7+HY2QAmu8Rn1OWOkULXbwF0nIrpAHZjG+2XltjXktg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728564732; c=relaxed/simple;
	bh=EwmZ5/Z+UThPK21bqO00znJM+uCq1XTHwYWQ1A/6uZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0O2acNuhtT7YeVjsQgjmIisVnVdg/xj29wMyN9aG6J//5s6l9vfNvckMuWKqNuC7+JGWVCkWjp4Y7HZPlEeYdfTztOOV0f0XNPkWhxtZARAKMR0lnpH2ekuYHduHEcyHQKKUHeFVBPXMSU7VXSN/UnS7ysjP3VhJ79E0+1Ef6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dk3NdRHO; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fabfc06c26so7500711fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 05:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728564729; x=1729169529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gbPdTZYOr9+jukOclQOWDxW0Bv1v/+wCabMme/SKc0A=;
        b=dk3NdRHO8XtT4a9GWtRoI+c+n8hgrtcQJRVmHzHxZCTAV1zL2ZQ/hsICbK8TP8yaX3
         lyzNAYBnOolt8DJyiTKnrIFFsD6ERQ+GNleHXy+NWt1McW0ppyKddEBFidR9UQcRA08g
         aC1TVBxMcosxGqHau8SG0VTLieDbw/iFJovTLnZxdJaUacN2/z9i6v+ZsnBOWSIc31Vt
         8vbTEY+UOJdn3zj9rhvY2Ava5/WMXZjC/fx2C4/RQS5usex0hu9jFtAU3fB9caN728tU
         Q6sK843AXSXWyvTe3QqhqE6An8VuIAnqR1DliClAzSdC0/u8ySbJP2w+C/i2ToL83J12
         Owrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728564729; x=1729169529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbPdTZYOr9+jukOclQOWDxW0Bv1v/+wCabMme/SKc0A=;
        b=vjnjv3Vfvek+ksdGgES0gfn8h3I8LpmxyEbFkFo05Y1zI1+Qn3MX8N72vaTnhnzEVE
         EitwEN3ImM3jmM5SunmowCml1xIw3j69PBIB0RBwS+cQfgSXZTydM6VJVim/+l3qq8ml
         Fan83CzxDZQyyNhs69uT+GzbpjRypdsvefV8E5yCLrQ7k1yHx19huHjlI3GIAOdcBR9S
         e89CtktLkRM8IwZ2pJ0yUoN1a20e2SWES0dS6P7Tl4lmmdLB6ZnbnorjcHNfrfZwWD6a
         Bx57VLuCHE12fGxENljzdZ2Dgq/n/PtZc8WowsHmfI2sZ3rYxm3GENLTkJC5+EjGWQ7J
         FuLg==
X-Gm-Message-State: AOJu0Yxpd3+o2DZ4LyiXiNXYXYXFOpHd1LXNnw4tG8vrfZsv3vqt53nr
	o7BlHRxTzcZfTagbGMie8woGSTnPo099MyghRHAlUHX2YmWs5NlidCDnv4OxIBs=
X-Google-Smtp-Source: AGHT+IEEUTMX/pk5a4HSxBwIZWeBdAoCHQB/aKBVK7puY4U8VBsgKnZURDJmHJIdHOxBWR82hPQ6ug==
X-Received: by 2002:a05:651c:2126:b0:2fa:c9ad:3d36 with SMTP id 38308e7fff4ca-2fb1872bd83mr41533031fa.7.1728564729444;
        Thu, 10 Oct 2024 05:52:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb24707028sm1944381fa.80.2024.10.10.05.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 05:52:08 -0700 (PDT)
Date: Thu, 10 Oct 2024 15:52:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>, 
	Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	agross@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org, 
	konrad.dybcio@linaro.org, mchehab@kernel.org, quic_vgarodia@quicinc.com, 
	stanimir.k.varbanov@gmail.com, ath11k@lists.infradead.org
Subject: Re: [PATCH v3] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
Message-ID: <qf3wwrluqsytrlwclnp6limdnrsqs3odbk3cg67hyk6fad6zcf@yujf46ltsaad>
References: <20241009012738.2840558-1-quic_miaoqing@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009012738.2840558-1-quic_miaoqing@quicinc.com>

On Wed, Oct 09, 2024 at 09:27:38AM GMT, Miaoqing Pan wrote:
> Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
> board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> ---
> v2:
>   - fix wcn6855-pmu compatible to "qcom,wcn6855-pmu".
>   - relocate pcieport0 node in alphabetical order.
> v3:
>   - add 'qcom,ath11k-calibration-variant = "SA8775P"'.
> 
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 121 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi      |   2 +-
>  2 files changed, 122 insertions(+), 1 deletion(-)
> 

[...]

> @@ -702,6 +793,25 @@ &pcie1_phy {
>  	status = "okay";
>  };
>  
> +&pcieport0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1101";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		qcom,ath11k-calibration-variant = "SA8775P";

SA8775P what? Is it going to be the only device using SA8775P?  Please
take a look around how other calibration variants are defined.

Also please cc Kalle, Jeff and ath11k ML in future submissions

> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> +	};
> +};
> +
>  &remoteproc_adsp {
>  	firmware-name = "qcom/sa8775p/adsp.mbn";
>  	status = "okay";

-- 
With best wishes
Dmitry

