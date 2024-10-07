Return-Path: <linux-arm-msm+bounces-33365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 152C5992CB4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 15:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41C931C22883
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 13:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1EF61D359A;
	Mon,  7 Oct 2024 13:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnG6EYzZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BADC1D2709;
	Mon,  7 Oct 2024 13:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728306612; cv=none; b=d+VbR9ERG50CzVhtAbpMMDxLrScZMaD09RN0C89vk5fGvYYK0UE1D+pG7R5qvbsI+HZwrUYb9DvvDVGVgaov7j11vpxvFTb9m0hLE22387YcIVtt6OmxzqLEmrTJmbFdZBEwKkFG5fPMTkzPGJb373Fc8xycbVlWm/BcpnSOmD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728306612; c=relaxed/simple;
	bh=ZKMOHYyIlUI8eYLsmNF+LAQ3GbeFDijfwV4HhewOToo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cr4hdfJUM29UDZVZSbQuAmkm8VTKq2M/B3a/sSl1xQkR7Qq0Of+b9FhbrOMhNpJuCEftjI4fcH63j8fRyX1S1S8q8MHsNWw330+qMcwLmULNq/r48a3g8WJHsmkeIR6iHi2/gnWxAxsMjiHCLIjMS72X6lkPqO657lLKPJVo4Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnG6EYzZ; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e078d28fe9so2979407a91.2;
        Mon, 07 Oct 2024 06:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728306610; x=1728911410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wl8n/9TAPqgHKrSdwENGKR05xh35YHjoavZofuJF+rs=;
        b=TnG6EYzZQ0jA0NpySDTBDm5nYX5cJ9dj25r+OUPQ41TOjeoAGnYdk2cdHRweES4Yg7
         O0jUbW76vA2Zq2u1lXhAD87zljHbDxi60CLFidjNsq9hSZa2BzoiYWeSGwrI28molAoJ
         htB1X4fo+A7br/5g498I46cK1di9/L0gWt2g/EEHxaMO82lgjrisIXrxnbEB8bYo7+mL
         qk+3bx0DtRZTotgp/2OSZs152uv6nS4TP8AM0ErcOfCZO5XyVUSLQG+UhStlj/ncvO3H
         eIG6diMnNwvjUTD9G0lvlWWiYAaZ2KHFd3n24jbMnv97fvNFnRa8KwjaGF4zizLBlAo3
         4IFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728306610; x=1728911410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wl8n/9TAPqgHKrSdwENGKR05xh35YHjoavZofuJF+rs=;
        b=ZVvky2nqd9DcWAUs72xy/Hc0KuVRWQ6CLtfVOx6FpaQ+jR1N0REvjuwdjYKjCOIdzO
         SD/y1ev3twLAwc+pFRb+eLSQnTRs2Svx8eNGPeXdVJgmQGLdDDxq5pYggOSBg+EWUNRy
         i5GEHYmGqD2YtDGF6ud0UVnZnkawzEeS5w6zaa4hkEBYOyRVQnWo4xILVACn3qGSrfZh
         iWlSqz+J5JJle5wTRrABGRQHOliJ+b55Iop9ltlvjUfJgiEKFkLM5rAuW1ItS6p/nCes
         LvYpxoN7YRghpBrYe7RzlV8B4QmHAPjRK/lMXIUdTUXJoFIjs2dFy5KkaZ2PqPcooEsW
         FZUA==
X-Forwarded-Encrypted: i=1; AJvYcCW/xkGAuv/QC2lowfUTz9MrF0JgaW3i2lWy5MvJOQqU/pV5eDyV9ssLGyop60PLQZ11PZ6N/RJWl+nKhukB@vger.kernel.org, AJvYcCX9A953fjYXVq1ASw8XsQa05DS3gvooHmPB5vmgRPyLMa0gohi1twsbCif3IqokWCDlUd9BlqacM+P4@vger.kernel.org
X-Gm-Message-State: AOJu0YxFUE2LizP9Mkv/UX018T28iyhziH68DdtBqojCt+Fdq0845V8R
	oJwq4dNOuzod0TdGM/LnBJ4Vl7U34ytNa7lQeAuYaraanFoMkkq6
X-Google-Smtp-Source: AGHT+IH6dkdmoCABOb5rzM+ePQDA5F0ivfidowVx++O9LwE8IbPiZigqZNzfL+ryQGYC2Bfr1FfH2Q==
X-Received: by 2002:a17:90a:c393:b0:2d3:ba42:775c with SMTP id 98e67ed59e1d1-2e1e620eb83mr14850209a91.1.1728306610132;
        Mon, 07 Oct 2024 06:10:10 -0700 (PDT)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e1e85c99c3sm7018643a91.23.2024.10.07.06.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 06:10:09 -0700 (PDT)
Date: Mon, 7 Oct 2024 21:10:27 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add wifi
 node
Message-ID: <ZwPdw-O-LnohVV0Z@localhost.localdomain>
References: <20241007130251.125022-1-lujianhua000@gmail.com>
 <20241007130251.125022-2-lujianhua000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007130251.125022-2-lujianhua000@gmail.com>

sorry, I forget to CC Dmitry Baryshkov.

On Mon, Oct 07, 2024 at 09:02:50PM +0800, Jianhua Lu wrote:
> Add wifi node and this wifi module is connected to pice port.
> The following is qca6390 probe message:
>   ath11k_pci 0000:01:00.0: Adding to iommu group 12
>   ath11k_pci 0000:01:00.0: BAR 0 [mem 0x60400000-0x604fffff 64bit]: assigned
>   ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
>   ath11k_pci 0000:01:00.0: MSI vectors: 32
>   ath11k_pci 0000:01:00.0: qca6390 hw2.0
>   ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
>   ath11k_pci 0000:01:00.0: fw_version 0x10121492 fw_build_timestamp 2021-11-04 11:23 fw_build_id
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
> changes in v2:
> 1. add ath11k-calibration-variant property.
> 
>  .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> index ebea283f56ea..7a55e271c3ac 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> @@ -680,6 +680,25 @@ &pcie0_phy {
>  	status = "okay";
>  };
>  
> +&pcieport0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1101";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
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
> +
> +		qcom,ath11k-calibration-variant = "Xiaomi_Pad_5Pro";
> +	};
> +};
> +
>  &pm8150_gpios {
>  	vol_up_n: vol-up-n-state {
>  		pins = "gpio6";
> -- 
> 2.46.0
> 

