Return-Path: <linux-arm-msm+bounces-36034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A61FC9B1A1C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 19:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36543B219AF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 17:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83181D434F;
	Sat, 26 Oct 2024 17:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LPYIdG7A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F061CACF7
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 17:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729964177; cv=none; b=qcOiH96oovktEmgOfHBmmVSd6aCwYpE+HrD6nDqex6KU0WyVYMJLg8R6tgn2sLWC8myMGAAvQshGyxiusg57KSK9MdETI7Jz3lI+jzJ0PUYVOBOIBS9vmSrjHFREFgC1uZf+oWC83Gi4AivU6+uqSa5Gh6TTcPOry00GEdpWfkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729964177; c=relaxed/simple;
	bh=phUfAcDTOItD03YWDpnRE3vQIi5vjTKDUM3kCtTifo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IiPFt8yqM2Rmljzyx2LYIhl5ghPL6oZA/5IUtc2Ojvg1q3cdbLh1XrQJArI9xWufOOEyNW3pTbqE5zlh2z3OUs2Qd/5RWJDghEYRec4Z1jSKKvvHyhrCLf8OdCrdp1f3kIPP83n8WSrU3RMTzHKvj9US7xdcvjrKTQqyMkEhp5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LPYIdG7A; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f72c913aso3874086e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 10:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729964172; x=1730568972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fmS+fK2Pn+5Ry5DbVr2l2yafLL4Tr2a4G4QgAKiqolA=;
        b=LPYIdG7AjLiSOOGoneJH7LnOpt+n8GNyRswqWdsDcZe51jALyG6eQ4kBbewMmregNa
         JxHjW/dGH88x2O//AKObWRfFhjY0IqHV1WrJfJBVs9X0YUIjf2c918b9kLaU0gGyiMNU
         SiTc3ux3n/pKBpn5eCrGjgT5hm/1E4I6QPjqZqjj7k/WPJ++9VpjopCXleEyyWYzObwM
         L+Ms27Pgdg7oAoT3jNLWRl2AxRFXnKcjMdwH+Y67mSojFrIK3J6lXoAjWT4Y7+++JgBy
         Z1F+7nYNI58oHZN8ZEU2QRB/mq6R1gZR7OQdQEMuqGonzYNNT24cuutYbov9cCQeWqST
         UOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729964172; x=1730568972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmS+fK2Pn+5Ry5DbVr2l2yafLL4Tr2a4G4QgAKiqolA=;
        b=o+4fpjkaJM//vHdQBgoMANfSMhJnYpZKk/F9Nr9qaFj+5tpNsXiFpNuynPzBQFfcWQ
         fbwn+PgtTWVz485n9IcOFogkXNi0ZeUa6gDm6/JFJ07bbjKXcq4+eF5bBN/lWYcUplTT
         PowCcaZD15mKGDPaNTqWlwjRSi17eOy6STzdgYmQ0Gh0HZG8+M8cQqmdPIIGcONRr2wq
         3NyEjBhyd/VjUnL3XNMUdmD06vuuUo89xw8rWbFcSv3jjj94in9nV0+WOeCLSB+56ot1
         cBr56veCDO+T9mawTKtF3bJzBAUTFoxifinqcPNQjTcAoYaReelcO0bBcZlqKGUiY/q+
         +cuA==
X-Forwarded-Encrypted: i=1; AJvYcCVyYNA1nu1Q/R12j/oM67MnBm64WMFemE4vq86z6BBvZ4lLTEEGO4DA4OUPJzfMsINBlJ1VM7aEhf1fPjXs@vger.kernel.org
X-Gm-Message-State: AOJu0YzFzcd9LwbUaoivuRRdHPH2tFkrZ8XpE/m4hauSWaeho+lL5Ymq
	fo4VBtSJS5dmvT/Hdzr6zsNBV93OVVUd4N6PUai0+aop59UCFmhU2ahFPU570II=
X-Google-Smtp-Source: AGHT+IHxFtbh3mAC/q2yje7AqlBTOhREdJh9MYZEaNaVgKdJdZ09vcBo/Q+Pw/1GR6+WaFWYyICbXg==
X-Received: by 2002:a05:6512:39cd:b0:539:f51e:17d3 with SMTP id 2adb3069b0e04-53b348d0ccamr1172908e87.14.1729964172292;
        Sat, 26 Oct 2024 10:36:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e12452fsm566762e87.73.2024.10.26.10.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 10:36:10 -0700 (PDT)
Date: Sat, 26 Oct 2024 20:36:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, quic_ppratap@quicinc.com, 
	quic_jackp@quicinc.com
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Enable USB controllers for
 QCS8300
Message-ID: <xijjs445fzeuzbj2bg3ziwlzenrk4wo5zlyze4j5mldb444oj7@73ynic4xqfdj>
References: <20241011074619.796580-1-quic_kriskura@quicinc.com>
 <20241011074619.796580-3-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011074619.796580-3-quic_kriskura@quicinc.com>

On Fri, Oct 11, 2024 at 01:16:19PM +0530, Krishna Kurapati wrote:
> Enable primary USB controller on QCS8300 Ride platform. The primary USB
> controller is made "peripheral", as this is intended to be connected to
> a host for debugging use cases.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> index 7eed19a694c3..3e925228379c 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -265,3 +265,26 @@ &ufs_mem_phy {
>  	vdda-pll-supply = <&vreg_l5a>;
>  	status = "okay";
>  };
> +
> +&usb_1_hsphy {
> +	vdda-pll-supply = <&vreg_l7a>;
> +	vdda18-supply = <&vreg_l7c>;
> +	vdda33-supply = <&vreg_l9a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_qmpphy {
> +	vdda-phy-supply = <&vreg_l7a>;
> +	vdda-pll-supply = <&vreg_l5a>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1 {
> +	status = "okay";
> +};
> +
> +&usb_1_dwc3 {
> +	dr_mode = "peripheral";
> +};

So, can it be used as a USB host controller / connector? What needs to
be done in such a case?

-- 
With best wishes
Dmitry

