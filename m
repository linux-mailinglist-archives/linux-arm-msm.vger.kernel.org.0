Return-Path: <linux-arm-msm+bounces-31082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A031996F080
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 11:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C89661C23D13
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 09:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE791C8FD9;
	Fri,  6 Sep 2024 09:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y8TOy0UF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320011C9840
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 09:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725616504; cv=none; b=jnVHrzeici1JrWNmerZU2ROZvQlgCXmcMvfKx8xxVVntojhEa6E2JVDIUCzbsDzp2CXyf9lzFuewKK3nZ87sy+p80Sr9Ld/jfepdFfwgZp5Y0Y9d2ogGuctTzWSRrGOLP8kJu9sxc+aI8NZhWi1oPIM9Nuqni1Ks581PGA+FvC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725616504; c=relaxed/simple;
	bh=TgUfYpNfVCM36W5N/o95NjsehMbaFlikvyBsdPQajJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EouUFllsM1SHIzA1NIyA1c8ZTdlQhsJZjkU//Rx58tdoqDuDO8OXh74Mv/5tCsvDVV1FQ4Jwwa2j3mBAQltoYg7uhe8ZBBIsZVtR14ye8HCus9x9Q6RDFCDnZCYNQeh8G4yXv+UJ4iG91LfEFqCyt9WjLIeR5ZWiBMyxkd6VV44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y8TOy0UF; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f64cc05564so20147021fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2024 02:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725616501; x=1726221301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s86VyCjnrHQBv7IvvTu3Ou8rPKyNQh1txaGTPumLsys=;
        b=Y8TOy0UFkcNlrbYC9gqSv6npsJYvpSVeq4at/UBGFgx04WCOQGbpmviojj6oNLyiyX
         CP5rCV5/37zxaPnxSDdMwiKO4SZ71GCNg9yIxCyapwUTzANfEJuL6xymqfzQthwwqfcm
         4veDBbL4seCxLjx+NGSGRyBXxPxrR7S/SRjEArRZ86Janl9vS82G+1CVtsafTV/HITsA
         FCvDn3Ini6JNlTeOnEG7koo2Bfsmk59nCYwFFuXGnaAjJxPji9lcUqOCUnSoiURYPlSx
         DjrXWNAylwvGiyQ7PoaBkcjT1K9mjbZW1jqbDWgWI4lS/Xk55OOG5rKLZ9pLJ0eCWwH/
         iCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725616501; x=1726221301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s86VyCjnrHQBv7IvvTu3Ou8rPKyNQh1txaGTPumLsys=;
        b=IUIgiaZWqsJjQpr/ed6CdhuA5TaCzdsNtYNpcEsqQZPXqJwnpx0gLmHNmawm0sttqS
         1fNuG8pVWYMVDdbkiGSXOsGw08KOlxzrMJ/SdsJRFqZL5a8vJEtWlo9kCPIQr2iKeL00
         iKtZScYm8rp01pg7q1fwoUX+FuFjDAffKk0/XZDFeWRH1FQw/qfLuWqZoA2uSoYTDwGp
         kAi7qseUD8YVeIV/wqFyFDMbHqEAunVxIJ/xlTV7RsgL9mAsLixkDa2GnImLGqYZIzt/
         aQbTxKE7Iweg7IoQ6DMCHf156y6OdAQ75wvCTTw8tjyyWUCtDXfyWRamX5twZmrBDq8y
         F/DQ==
X-Gm-Message-State: AOJu0YyVxatR1jcR6h/TCUMUjstVk8dAc8MF2qpXqzNOpZDfhHGShJSF
	Q/QGPwbWGqNdxK1dP7tAPHP89J71DiBWIwbuI3BFu9WM2B4fjsXo3I1umPiXTto=
X-Google-Smtp-Source: AGHT+IF844pSrLixRk6wUHI5yRSvPlucQpVGpC8Ewt1wZPUcMFsg9NoBGfApKlFd7JpuCaxLM90GYQ==
X-Received: by 2002:a2e:b8c7:0:b0:2f3:e2f0:2b74 with SMTP id 38308e7fff4ca-2f751f8289amr15670591fa.36.1725616500494;
        Fri, 06 Sep 2024 02:55:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f7518d1c41sm1731481fa.18.2024.09.06.02.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 02:55:00 -0700 (PDT)
Date: Fri, 6 Sep 2024 12:54:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	agross@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org, 
	konrad.dybcio@linaro.org, mchehab@kernel.org, quic_vgarodia@quicinc.com, 
	stanimir.k.varbanov@gmail.com
Subject: Re: [PATCH v2] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
Message-ID: <on75kpguzpniuwurzfxfumzbgiarsqmthrpvj27mc5wjcebjsl@ol5zoyr2g5l6>
References: <20240906055609.2200641-1-quic_miaoqing@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906055609.2200641-1-quic_miaoqing@quicinc.com>

On Fri, Sep 06, 2024 at 01:56:09PM GMT, Miaoqing Pan wrote:
> Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
> board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> ---
> v2:
>   - fix wcn6855-pmu compatible to "qcom,wcn6855-pmu".
>   - relocate pcieport0 node in alphabetical order.
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 119 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi      |   2 +-
>  2 files changed, 120 insertions(+), 1 deletion(-)
> 
> @@ -702,6 +793,23 @@ &pcie1_phy {
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

Quoting review for v1:

Please add
qcom,ath11k-calibration-variant = "name"

No, "the WiFi node is for 'drivers/pci/pwrctl'" won't go.

> +	};
> +};
> +
>  &remoteproc_adsp {
>  	firmware-name = "qcom/sa8775p/adsp.mbn";
>  	status = "okay";

-- 
With best wishes
Dmitry

