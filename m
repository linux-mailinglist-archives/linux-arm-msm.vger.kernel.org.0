Return-Path: <linux-arm-msm+bounces-11359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28524857E28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 14:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD3D32886B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 13:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD27112C540;
	Fri, 16 Feb 2024 13:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KMb2w7Vv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8B112C53C
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 13:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708091730; cv=none; b=MClDova8AyG3SY7zLVTT42i1MjZXwbgcVOkDqaNy6CxZjYllrm1yBheeS9ejWJ1VhiQlq9wYIwbUf9Af+Nm/K/vEqptoNrORIdC29rdJx8HUW7k99F4DRA/1F8/N3FI4LlerlCNtHBR2xQWgJ4DmAxK3GWBSdZFfQih+qGdyN74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708091730; c=relaxed/simple;
	bh=/mmB228C/BQ7s2uCVtfW3Iw03rGkUt4iO7SoUQ3CO14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mp0KBQBq2lYJuRbjMuZioxdehgKsAZg9YxL1/80XIbGeEtoHae1preEgYdmiD/C1yy3Q+QHpyxvGk5gt0Jf4lvZHx55BPRZ1hi+v3QqtKfgfyCrhj9gvLTrxHWrh/QhPTVqvHPSMYNZ4mQ6/kJspC/7Lw9O2AkY8PLFYBFUFBKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KMb2w7Vv; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e0a4823881so1396279b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 05:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708091728; x=1708696528; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bI4Ce7Y+3/vThHJnrphpGJSZUsrKr18V/3gqTitmj3k=;
        b=KMb2w7VvfHy9uJGSCtwR7cKMjaC/XnldpWPtUnVsDC7mjx3yw3LA080p98CPQw/+1Y
         dSPqAmTCKAb9iCSwJlyG+E6ouJTL55gmBMIRq3GgY2UaJ86FiUKvGeHghPWbgCwOSXrG
         Md+EP8mPhRdY/YsS1cGStuExDLPfQ/S0R+KQbvcdm9iMiLQ9b2/ULMzvzRE0eWgJw6D+
         WM6B+VFjr4PMUxSKH5axAEcodHDV9yYCfUrD+sURtU+L91njKfU09jyOF6Q+gln4Jqk7
         zC2apHriOND5d08UpwMvIb2zPmtL+yZ8ZbgypcvQtNgIOKdA2Why1iASp2p4zjXPb1p7
         0sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708091728; x=1708696528;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bI4Ce7Y+3/vThHJnrphpGJSZUsrKr18V/3gqTitmj3k=;
        b=pOVNCBavTxkaqhR59k8eCtmr8UFCyY7uRv/owqkFZ2mdysDFpLnVawir/Z9pX96bLo
         pXfDs4DZJAMjomg6m4yELPZKsN2Mh88eQrrZUaDDasirqOakwP5lKcs/0UFov/xN2qK1
         Kt2svBwwVng00GrPNh3VIok8Cp2IZkYBMSMEgxBaNqeXQDG2sy4xyUCsCkkJGEfqBo8i
         xO4LFs1so+c2YOX/3vRVl4zWuNOANzdy7YECgUVcg7cZAnxq3BeEjXSKM6mwJ6bCaOhn
         Hj/fx51Z+JY49uPc17AlMP10Si8608SzOc4h1ZLDnswV9Csi2+jow9irXr+qGi0LVdNw
         LU9w==
X-Forwarded-Encrypted: i=1; AJvYcCVmQuLl+E7jqomF6PHnF7Mco0ufNo5bLBWztNZLjCwgxfMPNTFWoyGOOaBz8ywbU4nWHbjbxYftE9zC2ST1eNdY+rK3As3JHg08qGt5ag==
X-Gm-Message-State: AOJu0Yx1QWAjCo0YDFXKDUip8GF3JEyvJcct8CSe4yWWquyAP2pQf4JY
	f+i/ttgZJ5wnpn5wdOZaZYQognAOw86ONJhxjRxJ3raG9twQl3cvt/CrpvUILw==
X-Google-Smtp-Source: AGHT+IG5X9pFHNpEVClMkRvB4oUBk5uuCFFhE0K0bOxMjLfz7CmeR6OBbOeQW+aMCqoelUXN6nRq/A==
X-Received: by 2002:a05:6a00:2d81:b0:6e0:9da7:8cfd with SMTP id fb1-20020a056a002d8100b006e09da78cfdmr6229080pfb.5.1708091728322;
        Fri, 16 Feb 2024 05:55:28 -0800 (PST)
Received: from thinkpad ([120.138.12.48])
        by smtp.gmail.com with ESMTPSA id r17-20020aa78b91000000b006e08d628e2asm3181579pfd.19.2024.02.16.05.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 05:55:28 -0800 (PST)
Date: Fri, 16 Feb 2024 19:25:22 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Nitin Rawat <quic_nitirawa@quicinc.com>,
	Can Guo <quic_cang@quicinc.com>,
	Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: msm8996: specify UFS core_clk
 frequencies
Message-ID: <20240216135522.GK2559@thinkpad>
References: <20240213-msm8996-fix-ufs-v2-0-650758c26458@linaro.org>
 <20240213-msm8996-fix-ufs-v2-3-650758c26458@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240213-msm8996-fix-ufs-v2-3-650758c26458@linaro.org>

On Tue, Feb 13, 2024 at 01:22:19PM +0200, Dmitry Baryshkov wrote:
> Follow the example of other platforms and specify core_clk frequencies
> in the frequency table in addition to the core_clk_src frequencies. The
> driver should be setting the leaf frequency instead of some interim
> clock freq.
> 
> Suggested-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Fixes: 57fc67ef0d35 ("arm64: dts: qcom: msm8996: Add ufs related nodes")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 80d83e01bb4d..401c6cce9fec 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -2072,7 +2072,7 @@ ufshc: ufshc@624000 {
>  				<&gcc GCC_UFS_RX_SYMBOL_0_CLK>;
>  			freq-table-hz =
>  				<100000000 200000000>,
> -				<0 0>,
> +				<100000000 200000000>,
>  				<0 0>,
>  				<0 0>,
>  				<0 0>,
> 
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்

