Return-Path: <linux-arm-msm+bounces-26771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 152D8938D01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 12:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 444401C23E7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 10:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C10E16D9B8;
	Mon, 22 Jul 2024 10:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="juEYqPBV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4799A16D9BD
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 10:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721642561; cv=none; b=bM6h3zcR1tkyHTvZbL2TIkbDpeEYJqDilPGRTgY4bAetZE8aGsQBpzJC28fXnHjl0kRFwVcKiJMM6AkXrebg6LeM+83wHQsv34+UA7DWf4PErTyemuZ3OUH8yX2DnLzc9iuMquO7yZRqMHP60PDNa/FhxrOGCgUknmdAVP2zyQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721642561; c=relaxed/simple;
	bh=1tsT4b8DGGL+QFZQspKwxeNTO9f0P7qFe9/yXTihcY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CnQPjEXEVcBGomIb2ry1as87ad/IC9SeTSMd/uUgxkhcaJk4+ohc9kSDw7ybAjadaQnmTaAEvpI5A+bpq0sIvUf7T6G0935gMw6xyiYN6bLImQ88l+LXhKVimZFToHOBEpqZ5pQuGMND5A+SOasSr8Tn9t5BiSVzdDSjOccchnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=juEYqPBV; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4266f3e0df8so29049945e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 03:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721642558; x=1722247358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eGuVC5Vs7wz3fjreYGjqAyPVizZVMZqiOrXvPksg6uw=;
        b=juEYqPBVIo3Mxtx6gtlDlEu5k3323iIrQrjjjopTgSVfnPLinqI3hMt6fwY0ixC2uZ
         2SHbq/Uhcd0aEsLr5lX9DNxkbc4E8KKWIl2PWE132kDMwNFY7UFQhGVn6u2SujNyn1Uh
         rYd2RxnxTFMiyncOMtZWmsV3lgS7xPGAPDOPbpPoDHFc6uJ2PXIIVVcygweNain4u5QS
         MOfMPLjIOSkiM0DAvZ+t6kDNhqgPoUXbfzz+ONdU7/Aw1B0R+QCDEgMdTgZBgGpS7FHM
         fi53Jhf7qcIrIrcg8Hnw47Azly67b6tnegArUx5fwStfPxV5u1HQVh3rgfbruF1ym1Wl
         lXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721642558; x=1722247358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGuVC5Vs7wz3fjreYGjqAyPVizZVMZqiOrXvPksg6uw=;
        b=fchlRt32q+btXsg75wQEkeijbRh6eHmSOKzNqLmgfYw6mWXjfyeuP5FLPmVIiwOBLR
         nv8b+nyUP/IU4p3+1N7akjfp0hp9h7ZbJ7AZr1wfn71GqMz3eOdoif0yTU6jphKGGlt1
         xqWoHBVh+GFuCwONHXGdUA9Tdj1AJc1D6IilCoNXJj+mObQTDjKpSbu+ELygvlhqZCHN
         9iaZrDALHs2VUk6uab/zHaqDODNMKNIphknbji/LjOmB7j8t16pKluUad8bjpBrKa3aZ
         n7ENRRkGvWy3ywgBGpLyLba42+rSdpjcIXm2S2BQ+5u0NGO6fdTpm4fAxOLMedIRSifD
         B7OA==
X-Forwarded-Encrypted: i=1; AJvYcCVONwUWavrJpaiEyxgBRYaV1XrsQOdtL0ZpCOhD1PdZ67RNUoida4vexwySOXS5OzMeAvpkWSJK9O5ft2Ysdudj62F+epO6BSjVvXLt8Q==
X-Gm-Message-State: AOJu0YzEoIQkkkmO3pPFJD+0niGGJ6YaqvS2nYJ8pWPq66OUyDdq32kq
	51MKHTnj1jTqtfTxn/zJMblaiMwaVc1CIjDo+IItzb2lEbpEjCzoMja7EjuQhms=
X-Google-Smtp-Source: AGHT+IGV6BtwYJQfjWjVJPNEvWIIJOZTau9IHQi/bLa/mTUwjcaxDBVX8GAYvsLzLcy6z5GKEpWgOw==
X-Received: by 2002:a05:600c:4e91:b0:426:597c:7d4d with SMTP id 5b1f17b1804b1-427dc53a006mr48799515e9.18.1721642557554;
        Mon, 22 Jul 2024 03:02:37 -0700 (PDT)
Received: from linaro.org ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2920313sm109722425e9.0.2024.07.22.03.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 03:02:37 -0700 (PDT)
Date: Mon, 22 Jul 2024 13:02:35 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Xilin Wu <wuxilin123@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 01/12] arm64: dts: qcom: x1e80100-qcp: fix PCIe4 PHY
 supply
Message-ID: <Zp4uO3YNpgui3bAl@linaro.org>
References: <20240722095459.27437-1-johan+linaro@kernel.org>
 <20240722095459.27437-2-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722095459.27437-2-johan+linaro@kernel.org>

On 24-07-22 11:54:48, Johan Hovold wrote:
> The PCIe4 PHY is powered by vreg_l3i (not vreg_l3j) on the CRD so assume
> the same applies to the QCP.
> 
> Fixes: f9a9c11471da ("arm64: dts: qcom: x1e80100-qcp: Enable more support")
> Cc: stable@vger.kernel.org      # 6.9
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> index e7758f172d0d..212ed20b3369 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> @@ -576,7 +576,7 @@ &pcie4 {
>  };
>  
>  &pcie4_phy {
> -	vdda-phy-supply = <&vreg_l3j_0p8>;
> +	vdda-phy-supply = <&vreg_l3i_0p8>;
>  	vdda-pll-supply = <&vreg_l3e_1p2>;
>  
>  	status = "okay";
> -- 
> 2.44.2
> 

