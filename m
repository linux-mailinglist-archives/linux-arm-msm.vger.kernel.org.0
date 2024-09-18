Return-Path: <linux-arm-msm+bounces-31959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D73D97BC51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 14:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8802283A04
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 12:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D04518800E;
	Wed, 18 Sep 2024 12:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EgKi8xsB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8572628C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2024 12:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726663029; cv=none; b=si7Fb3meAfjmkm586+dWu7obbwn88NsMYGrhvim/pH3hKMTIjiQhPKVgPKWeMMp9jqtvLTw0i9cLG704anggGjutRO0h7abU2MR+HGKThDzFUva75EF8JySK4S99CNm5hiyk0imWlOlAb6HiuElMvZ/yI+1H59rhxH7lTiBBZ0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726663029; c=relaxed/simple;
	bh=zuikOUiCStkWfIyp50XAs1iEDDnX3j8rAK4EbG29k/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdZOSBCB7cgb9Xs06C02G3y1Ygye6r+rpUoV/7j6B0yrzYIJXeILMlszE3M7OUH7cDdWuF4jwU44jqGcfEWTXbB2MUHYNmqi3vIL/2golR16DMZUjB3sKhrx/Qua+PA6Z0yfpJniaN3+uK3EHnyrYJBoAlwAs8SQtztOzHGrkWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EgKi8xsB; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f66423686bso62074671fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Sep 2024 05:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726663026; x=1727267826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mM4xuZfDECsmdWvFjhmgD+BpJEKhoUr3CHqYNfTZlfs=;
        b=EgKi8xsB+U1M6sjlH+SVrMav4HI53SfTpyTr5LCgYDOgIFU+DW+iPaz474fMFoRhwr
         aZvjr/cAtLWPs1qGfYw4kGqKwNA5w2hRjkX4/ckLcAv0GlJSDvvtcAyxt1UnH2xo7fyh
         9I9lkMut7dOaXSV1mV+XX6zs8EwbXyAV5jms3a0jReXTh/ZC2k7JIPqcctB7+k1VkPMR
         xDKFpG2PrGF5SXTxmhsVVqOETVt1jvFMPSKyig6GV8v40IZNwVwmWgLTO/H0ZdNEJqjw
         l0XIw/0cKJZcyM2I0GFcu6hXAcZy/cfaKnXAU6Wx4URtb5/APqQBaZPrt5RMqk2Y+fXG
         2y4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726663026; x=1727267826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mM4xuZfDECsmdWvFjhmgD+BpJEKhoUr3CHqYNfTZlfs=;
        b=ZdQlOzuMvDFqlnFEk3wmisUuwuiwPAByWyHOMxoxsL/8/v5+pvdXcwr9tY45W3SsC8
         BOFIT6OGJGbj4odA4kZW32R7NZupffneZRjFcqdAztWjpLdkPRpPSoryeoQ1/fg6Vl6K
         TvdWYBg93q6YJSIXVMnQCwN06O9vNsFJspxmil+9m4mswWD+WplEDClhxN8Ex8nMUqr9
         8MaL0B8ITsYxWnQVYvGgrPtdJARBMNkj0zal5+u+R9Nd43xgGNv2iUDQHLpZa17+thi9
         HxeCIgs7uWYyhhvsWKSQGOPSW3seFaankyobXu6iwPS5EAne0zmDiBPp7NrfZAsryLdL
         vimQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPI4lHt771R9dDLM4D6yvYK/83G5wMeNBkH9FCafrwpSL05MUtwJrSItaa08rOfbxviXpVJqC6FjH0i4Vx@vger.kernel.org
X-Gm-Message-State: AOJu0YxeXSpne96AvoHxJr4JSKwzEdVW66itCAnRaoiJbeuiaXVwFbcm
	8H2/ziYCrVq45K8j3IZTR1T2SNGQ76VS4Ek6+IcorsBrOZnf03A1CbTLc/vyp8g=
X-Google-Smtp-Source: AGHT+IEB5Ofi2pPkK2q4Q+ADWhOk5w+/qe893H2cKWvOMMT5LUeKzbEOlLYgbjUh+PcuNJFQrfsNgA==
X-Received: by 2002:a05:651c:1544:b0:2f7:4c9d:7a83 with SMTP id 38308e7fff4ca-2f787f432a5mr118305621fa.40.1726663025313;
        Wed, 18 Sep 2024 05:37:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f79d2e1e80sm13499561fa.6.2024.09.18.05.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 05:37:04 -0700 (PDT)
Date: Wed, 18 Sep 2024 15:37:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sachin Gupta <quic_sachgupt@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_cang@quicinc.com, quic_nguyenb@quicinc.com, quic_bhaskarv@quicinc.com, 
	quic_mapa@quicinc.com, quic_narepall@quicinc.com, quic_nitirawa@quicinc.com, 
	quic_rampraka@quicinc.com, quic_sartgarg@quicinc.com
Subject: Re: [PATCH V2] arm64: dts: qcom: qcs6490-rb3gen2: Add SD Card node
Message-ID: <w74j2huiyk52dqtusatctygfdu2xq24kpirc3w4iyhwmpaxlpp@nt644j4gpnhv>
References: <20240918102921.23334-1-quic_sachgupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240918102921.23334-1-quic_sachgupt@quicinc.com>

On Wed, Sep 18, 2024 at 03:59:21PM GMT, Sachin Gupta wrote:
> Add SD Card node for Qualcomm qcs6490-rb3gen2 Board.
> 
> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
> ---
> 
> Changes from v1:
>  - Addressed Dmitry's comment.

Please don't use such wording. It doesn't tell, which comments were
fixed. If you want to give the reviewer a sign of appreciation, just
mention the name in the line which describes your actual change.

>  - moved pinctrl-related nodes below the PINCTRL comment.
>  - moved sd-cd node in PINCRTL_related TLMM.
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 33 ++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 0d45662b8028..c9f4c6812b71 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -716,6 +716,18 @@
>  	status = "okay";
>  };
>  
> +&sdhc_2 {
> +	status = "okay";

Status should be the last one. Excuse me, I probably missed that
earlier. The rest LGTM.

> +
> +	pinctrl-0 = <&sdc2_clk>, <&sdc2_cmd>, <&sdc2_data>, <&sd_cd>;
> +	pinctrl-1 = <&sdc2_clk_sleep>, <&sdc2_cmd_sleep>, <&sdc2_data_sleep>, <&sd_cd>;
> +
> +	vmmc-supply = <&vreg_l9c_2p96>;
> +	vqmmc-supply = <&vreg_l6c_2p96>;
> +
> +	cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
> +};
> +

-- 
With best wishes
Dmitry

