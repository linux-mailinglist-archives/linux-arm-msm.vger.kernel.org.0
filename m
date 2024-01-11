Return-Path: <linux-arm-msm+bounces-6998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3950982A6FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 05:45:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F6F71C22C57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 04:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 298EBA5A;
	Thu, 11 Jan 2024 04:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KMqD5Ssr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9657815D5
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 04:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7beefdfe71eso84605139f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 20:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704948315; x=1705553115; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7R9gKBrtFfdTSBzgP4ylVTAW1UeNRdgNJL0FxjuEn/Y=;
        b=KMqD5SsrwNY/c6gl2uaWfyjq2FIurOvhbxladRbN5FczYCV/z/wHv6YYb0j5DR7cGX
         MiqyCk8JVUf/jrRGExtM1pRyQQ8fttkSfG+yzHAZWlyItGGaM91Eye4+kxDY65F8tkRt
         NSeTGXyAEEbansF1qPGI4M4IKYMRICOe2d8R8ixKjaN3zrNAU8OhiA0q/5fbWPAs3Xig
         te6HOjcfS+gGGkv21rV0t3hLbAoWyqxGmV84zStu8qIRsr/PPWjUoOVTsx6OCoqLpsed
         pXbMcmj/hGvEwpjikViM57FWu56HV0waYp0cpm11LWxTQiuVgbwZ4BM2GQybSlByF+Te
         s6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704948315; x=1705553115;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7R9gKBrtFfdTSBzgP4ylVTAW1UeNRdgNJL0FxjuEn/Y=;
        b=VYcdLf+meLRVU14xHrKJFIsPTHuAyswBX+wvRTvyLf/qfsfHA1tDU5rgAAUrR8Eczi
         7Ta6aX1OB1l51RAi/cgek96QC1gCyZXIm3i0UdX25ue4l9BD8/7ivLUnE4K8XcIR1aZV
         1Jruf/yNfS0YH9Q7TWdKoW2lKgm42FL5rSS0IShfjOoTt0gjKpTKZuB2uInRMfj6HCGN
         q/vbvCjRdv/cgcdPjpGfXi4ZmvFwHeJMYBfMVx+1WwFqrpMnQVCj2m1KZ7pEuqme4Xvl
         /0lFoOuyeOgD3lPsr2jtNgs6dw/qtz33axRvgXIVmQlKwbsxS6KUnK1NNCo7Ko59nYUm
         egfA==
X-Gm-Message-State: AOJu0YwgFbp4pscJ+25diF58W81ODtbvEdHh36pifD43qRDbGsSdlP1J
	zhg/xX9UA8W7zsSzBb9oe714qbhIqjdS
X-Google-Smtp-Source: AGHT+IGR7jEQOfx+9LAfCrSObcolC0Q08hARoar8x4gxVIDslDvgDR0eK3ZurK9TSXoFOec1bhy69w==
X-Received: by 2002:a05:6e02:1d81:b0:35f:7d16:c92d with SMTP id h1-20020a056e021d8100b0035f7d16c92dmr813267ila.44.1704948315660;
        Wed, 10 Jan 2024 20:45:15 -0800 (PST)
Received: from thinkpad ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id f11-20020a63e30b000000b005c661a432d7sm202451pgh.75.2024.01.10.20.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 20:45:15 -0800 (PST)
Date: Thu, 11 Jan 2024 10:15:08 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qrb2210-rb1: disable cluster power
 domains
Message-ID: <20240111044508.GA3761@thinkpad>
References: <20240111-qrb2210-rb1-no-cluster-idle-v1-1-cec14ec15b02@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240111-qrb2210-rb1-no-cluster-idle-v1-1-cec14ec15b02@linaro.org>

On Thu, Jan 11, 2024 at 04:01:14AM +0200, Dmitry Baryshkov wrote:
> If cluster domain idle state is enabled on the RB1, the board becomes
> significantly less responsive. Under certain circumstances (if some of
> the devices are disabled in kernel config) the board can even lock up.
> 
> It seems this is caused by the MPM not being pinged during CPU idle (in
> the same way the RPMh is pinged when cluster idle is entered).
> 

What does "ping" mean here? Please be more specific.

- Mani

> Disable cluster domain idle for the RB1 board until MPM driver is fixed
> to cooperate with the CPU idle states.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> index aa53b6af6d9c..9a0308ef8b0f 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> @@ -177,6 +177,24 @@ vph_pwr: regulator-vph-pwr {
>  	};
>  };
>  
> +&CPU_PD0 {
> +	/delete-property/ power-domains;
> +};
> +
> +&CPU_PD1 {
> +	/delete-property/ power-domains;
> +};
> +
> +&CPU_PD2 {
> +	/delete-property/ power-domains;
> +};
> +
> +&CPU_PD3 {
> +	/delete-property/ power-domains;
> +};
> +
> +/delete-node/ &CLUSTER_PD;
> +
>  &gpi_dma0 {
>  	status = "okay";
>  };
> 
> ---
> base-commit: 39676dfe52331dba909c617f213fdb21015c8d10
> change-id: 20240111-qrb2210-rb1-no-cluster-idle-7bf43b3a0452
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

