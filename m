Return-Path: <linux-arm-msm+bounces-47897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C45FA34018
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 14:18:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B3CC7A4C58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 13:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CEAD242908;
	Thu, 13 Feb 2025 13:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ti/HQKA1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59684242905
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739452652; cv=none; b=kEQIz3YYu9kRuZdRyx+TBRKBsOtkbOliV3IqPo2OcL0lqLPUfXd71FFDx7PcRQbz9Rd/HffYO3ohBz5TH7PpBeX1CRIoXcg47b1FOUjCcr14uW8ZKPhgsFyOlxGg2esvhZWUxbj1tFDghlvp8Wz2LyoRSW1YLfhpUor8Iduibb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739452652; c=relaxed/simple;
	bh=twos7VfiREI1lt7gyyuE3NukwS7GJ2VzxwoMptj2Rn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+DwuPL6oUHgjJjnzPfL71RbRvXgpQcxNpdzKVl2YCWG57YC4qrtRD67BZXUx18KRZydJrpNB3YpGB3bMhqJ/lkP1T04M29Dmye5ACOqQlhyUwxVnHe5ttQpu1byEU+PQiRpieJT/8nL0ai/rPX/iJHbygfnNDz3GXqIKp+OOLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ti/HQKA1; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5450abbdce0so845704e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 05:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739452647; x=1740057447; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDPL6pwh9XndS7ixZg6tkUnBBXi8JbHU1IwBI+r54wg=;
        b=Ti/HQKA1djgCEHPW4gGCrpE9Hqlk8r9OfGTUE7Wd4ld0pKZkd3ZMtEcogoABEavxX4
         gR8sTHt8aB/quVbCBLrzShhwpCFDyytOY3xz5kCNn26npq0Qk6LAnj0wu86ga/U+/Zx1
         luv0iJ5bvaoWQ9Rse3uwqU6bOKi54KDf5Upjy2Us9GZZLOM/1nKi/jPpSUynSUPlEKVu
         nDmfXitw5C8dBKsYzlfoiBVekYVkCmTXAcfYPblxxclX6RBde9CycaccW9c5K2iTOups
         KHfsSHFggaJ26cnjmgNoHcJBH0XWg+l4AB4VOM+dbyUjnfH6XJrVrAoj6EDz33hoMpw2
         FFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739452647; x=1740057447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDPL6pwh9XndS7ixZg6tkUnBBXi8JbHU1IwBI+r54wg=;
        b=iCg2Lk0PD+VnAysIIoXqOJuNrRcQogDXnnKaN1z/0Fh1UJKMymYiXyVzLWYhoLy63T
         xsztB+airvGJ48S2oAVEEas9ysFoASjzoymGxKaz0cqFGPENRykFzzaPKJN2e6TqUhiY
         J+bLCIqG7NkBu0HuCcnkokmrOAnJznnyskl9dBQSf1gkqFb/MWsTOYU/DD4CPwYFcJTX
         yqtiWvPCzhevbqRVEqN3WemmNoGohY4nKLbaX1hV3YtChufg3jNCACeQA89LUqVGFKCG
         AtT++bLMjgsAkTNmNjKg4/w3yUazZRjhH7luU5GXciONXS8MN69poyLkjg+BPbCafVNz
         6u6w==
X-Forwarded-Encrypted: i=1; AJvYcCVJqf3du4eL19Gvg06Kv94xx4PAeekiFRPBT+YNyMnw4qy1+TH+7/+K2qemEujcQIgmzfsDsN7gv0PrJGPA@vger.kernel.org
X-Gm-Message-State: AOJu0YwbCNd3bUirzhip6UKYFvwOXTCgpIzUN5uOoRxZHCIziWAi5/Q7
	ZJQNv7qfS/s6yQyqv/I0mUoBa6QdMZ3WRyUagNW4OdA74KFHzI+vH09vDG2udFs=
X-Gm-Gg: ASbGncsQnZV/wGe2q6/Bf3eLcJwOaMjO+KdzdZ/cq5xqQU30jYylvuBx37oit6tUkLM
	J5tXWnsnn+n5aXTvv0opbqMXJnu5w/L5DoG5UO8Yqd0mYd5WPJQpQV8SJBITPXQ54KfBqewL/QN
	kdHgYBUxMSSm/VEw6vGFIiyEy1aFmjPMtwFjiPX5k0KV8VVIYBAcxNWqCTRHP6Syh0x/mQPiImF
	pN40b4mv84S4HDMpZ9SvsPcOdvpV2cNW6pyeLljZLU+IF/OwLghYfE+jshfk/sBTVgGXYnk7e9/
	E86M2bk2JKpMsOPWr+SO9OWdy8VQes9ibpV79XxQpvtUM5dJLYwZGWtKLpmWe19avX78slo=
X-Google-Smtp-Source: AGHT+IEbRbF6dkll0oMN+nTaE2De1fjnXOByxIocahjqxLVMhtL0WOpihglBcb99LvBdKAgDOxR9iQ==
X-Received: by 2002:a05:6512:4024:b0:545:bf4:4bc7 with SMTP id 2adb3069b0e04-54518282f24mr2585384e87.19.1739452647405;
        Thu, 13 Feb 2025 05:17:27 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f09b21esm176186e87.62.2025.02.13.05.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 05:17:27 -0800 (PST)
Date: Thu, 13 Feb 2025 15:17:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_srichara@quicinc.com, 
	quic_varada@quicinc.com
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: ipq5424: Enable PCIe PHYs and
 controllers
Message-ID: <rikpqwgeitxengmlhahnl5nzk2skityqmgurjx65fjq4q3nejq@6pqmbvaqkcz7>
References: <20250213071912.2930066-1-quic_mmanikan@quicinc.com>
 <20250213071912.2930066-3-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213071912.2930066-3-quic_mmanikan@quicinc.com>

On Thu, Feb 13, 2025 at 12:49:12PM +0530, Manikanta Mylavarapu wrote:
> Enable the PCIe controller and PHY nodes corresponding to RDP466.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
> Changes in V4:
> 	- Added a new line before status in pcie2 and pcie3 nodes.
> 	- Dropped 'output-low' property from pcie2-default-state and
> 	  pcie3-default-state nodes.
> 
>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 41 ++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> index b6e4bb3328b3..e73f61266012 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> @@ -53,6 +53,32 @@ &dwc_1 {
>  	dr_mode = "host";
>  };
>  
> +&pcie2 {
> +	pinctrl-0 = <&pcie2_default_state>;
> +	pinctrl-names = "default";
> +
> +	perst-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;

Don't you also need wake-gpios? Here and in pcie3.

> +
> +	status = "okay";
> +};
> +
> +&pcie2_phy {
> +	status = "okay";
> +};
> +
> +&pcie3 {
> +	pinctrl-0 = <&pcie3_default_state>;
> +	pinctrl-names = "default";
> +
> +	perst-gpios = <&tlmm 34 GPIO_ACTIVE_LOW>;
> +
> +	status = "okay";
> +};
> +
> +&pcie3_phy {
> +	status = "okay";
> +};
> +
>  &qusb_phy_0 {
>  	vdd-supply = <&vreg_misc_0p925>;
>  	vdda-pll-supply = <&vreg_misc_1p8>;
> @@ -147,6 +173,20 @@ data-pins {
>  			bias-pull-up;
>  		};
>  	};
> +
> +	pcie2_default_state: pcie2-default-state {
> +		pins = "gpio31";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-pull-up;
> +	};
> +
> +	pcie3_default_state: pcie3-default-state {
> +		pins = "gpio34";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-pull-up;
> +	};
>  };
>  
>  &uart1 {
> @@ -166,4 +206,3 @@ &usb3 {
>  &xo_board {
>  	clock-frequency = <24000000>;
>  };
> -
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

