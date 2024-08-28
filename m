Return-Path: <linux-arm-msm+bounces-29865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9C59632EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 22:52:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44D071F250DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 20:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303B41AD406;
	Wed, 28 Aug 2024 20:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y0BLNTlr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115091AD3F4
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 20:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724878119; cv=none; b=BVbXvUbIeQ8nHQX4e/yzWsdyGuQ236x9GTeopBgvIKLbr+94xFgzyiOldIx1gfMAyPxJ4INgSUJ8GrwBgcoFJ8h5sqy5I0tfh7ccZrfmGC6PInCR8PBoWFOZcUVEHr7lJrWuNA2Pj4zx9p9C1Dxk7aH/Pfj0AmV7tsABf1Te37Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724878119; c=relaxed/simple;
	bh=mWtLZVmxV1cL27U/O9IqvxtL6Ujyj7wOyW+QqP25l+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jM9Glz5Qqi19vf+ByblLsUrdyx6+2amFdpGMM9n02V88whI1xM+BD6Nj9aPkME32z6+18NjsnwTX3ibYWmuusLSJ/I1sfHb+L58VRFG3q3qM5eY1Nlv5tfdS5i4+yhaM8cdEaD2v6oLPWYFB08p9RfajkAjHkccEzk52lK0Mm2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y0BLNTlr; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53351642021so8550604e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 13:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724878114; x=1725482914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dzBlgscRo4qLIY/HPizE/St9vcbsZemW12ICbFPgg74=;
        b=y0BLNTlrMCt2L+PxjmYE1vQqXv3pj/QmjIB4460tl9mbzj8JEicjLLWrpFQBGcu/QP
         9qS5E8TuuX1+Uf6U0CCgWwpCXQtAd2UcE39F5elS1dV1kigdNNtyj0EmJoZF6hJLt1tL
         JNYyJMPaSpGy80mYIcmDQDb4SsmP63zud1LTHHL7YiQVpQYm3WfohiPgOLecD7vyvhdQ
         1MSP6wXIRQJ2pIV+yBnE7m7r+eCkTMJuewzm8lq3Srqd/D4oYIlKhG9XrhnmTUG1bHWC
         TeoBzLz6VSOBMPqun0MtSDAv/hoSVKEozVbJ1OKw0cQtPs10tt5rtlksp9b0SPE0oOwv
         cNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724878114; x=1725482914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzBlgscRo4qLIY/HPizE/St9vcbsZemW12ICbFPgg74=;
        b=IuNYWO+zA5sACcamcX4RLsVzlJFur64A2r1a8DxWoclDIDl/WdZO4OQ10/OzbJYi1L
         R8x/+GQzIyvkz0S5I41jFlRAIJMkPoXWKwIjQgbJU4445R+bvJh64nhF1BIr2IndNJmB
         QklbRQNGi87JlDK9ZgjfBYchA8IuiKDgJPgSmgNYxd1xZCOvN/RabYCiz1mzCIIO7k5J
         YG7hNRGa1itDJiKshGezbS2XOQKBRtBlaR2o7WqtyGvOhzMg+d2HYOF5fshs5K8TRZKk
         SpNM7x0feAK0ixSwFm+NbTpnBuk0uyC9VzVpv79oWzZ13keg4V1CYZybErK2p9VxeVdb
         /qyg==
X-Forwarded-Encrypted: i=1; AJvYcCVpGG36FPYBU8CswoQxqzKmqfufRuNo1liEAsYiYJMiwShWOA/OPGvNz7LQvL+RgPln3Ka/xPDVG5a/jopC@vger.kernel.org
X-Gm-Message-State: AOJu0YxXZ/kOHglL+oWcSE39DisUWpwAFBKFClHfD2rGEYy55bONlr9t
	HAESTcbyhV5rXHToRstQOb5eCNatj0bVpSrfHs97qBqnxaa+QStNrKVWp/leVA0=
X-Google-Smtp-Source: AGHT+IEWLxH8aizXRyTRgoMCFNNl0fWj6ZZLIUOy0gldXquj9BCL3ipA7VZggNVVXZZkfsb8RS0PNA==
X-Received: by 2002:a05:6512:3b14:b0:52c:80f6:d384 with SMTP id 2adb3069b0e04-5353e546424mr304172e87.3.1724878113708;
        Wed, 28 Aug 2024 13:48:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea5da8asm2344128e87.215.2024.08.28.13.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 13:48:33 -0700 (PDT)
Date: Wed, 28 Aug 2024 23:48:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Caleb Connolly <caleb.connolly@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8998: add
 qcom,msm8998-lpass-smmu compatible
Message-ID: <xjrzsagzcqorynvhp5o6p32a7f7gkz42wgrgrgdnok5332nkv2@w2amrqa327rr>
References: <20240819-smmu-v1-0-bce6e4738825@freebox.fr>
 <20240819-smmu-v1-2-bce6e4738825@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819-smmu-v1-2-bce6e4738825@freebox.fr>

On Mon, Aug 19, 2024 at 02:59:36PM GMT, Marc Gonzalez wrote:
> The msm8998 LPASS SMMU requires special treatment, because FW reserves
> the last context bank for its own use.
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index 1537e42fa03ca..f169f2dd281c3 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -1616,7 +1616,7 @@ gpucc: clock-controller@5065000 {
>  		};
>  
>  		lpass_q6_smmu: iommu@5100000 {
> -			compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
> +			compatible = "qcom,msm8998-lpass-smmu", "qcom,msm8998-smmu-v2", "qcom,smmu-v2";

Please also update the bindings.

>  			reg = <0x05100000 0x40000>;
>  			clocks = <&gcc HLOS1_VOTE_LPASS_ADSP_SMMU_CLK>;
>  			clock-names = "iface";
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

