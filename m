Return-Path: <linux-arm-msm+bounces-76831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DC8BCF47A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Oct 2025 13:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE9743BDE80
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Oct 2025 11:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3BC5245014;
	Sat, 11 Oct 2025 11:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lNiMk2+L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0752367D1
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 11:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760182298; cv=none; b=SCDWRHhtMeI3CecBW/A0+7TsZvgGwZWxcn4mvsQkyPDfo56cDjHYmxrGKBE3SHqDdFeztH6UYOlWwrYfw7Y0V6HE1QUeGLi+KaNrmXORHZBZRmomDOwoEewkABCK/LWeyiDOX8JiXNgHolLO/QtkJqNaY4kBi4duPJT4RIaOqzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760182298; c=relaxed/simple;
	bh=5RI+zDeyw3XTRljWW1rsNdQl1VRKEKQFrpl8fx9pYt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lu9ACQ32a5m70zBmpTscBNmE87K9e+1IzRdVSPleGQG9aDBP3NqbGX2GhOXPDh6juIcaijZeRk2tC0Q/NkezPbtO0fY+JQeHCMKJQxfJ7jcWp5ToVWahNCntTua05/vKAstkgt7eAxI1Af6V7koou6Haz/aqHrh82UYWpCgjpnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lNiMk2+L; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42557c5cedcso1589185f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 04:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760182292; x=1760787092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mNTGbfmugn5jBn7rCYmZzAG7du6mX8yV8hZzW+D5Gyc=;
        b=lNiMk2+LNE09jjuUfwBiCAjb+yGdyW1G4D+glgpbl4ggbxVNED30YsEmhQrXmijbLS
         yXfqEJn9QD5slBHBywuCTDA096QY1C6JjoVWcaV7TQBNf0VCUEGKkUP9qBv4QUaxP5Ph
         kEQDsNk+elcUXmYEuaiNsa9Chkv3q+Eb1QJIF3VW54xdMKyAOL8uhNzLYYK91DvQqCrr
         5Cdvg/f3qVi0vgAsYG3Ix3gvlXFi5/Qa5Z8wGYgeusIFvN7EtCo5dw5tapmAJVwUsRKi
         I+xeV3PKrZMAfInLzaxn3lo7py3jmpTnMB8NhFlmVYl1X+FQA9NysyfXgqgr6eUErdEW
         OCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760182292; x=1760787092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNTGbfmugn5jBn7rCYmZzAG7du6mX8yV8hZzW+D5Gyc=;
        b=k+/Jgw9gVJFoYmucczIYtcI5msut9wLYewuElXdsUe6sHtZ1NEJvs7wVKOdNAUUa/f
         xxeHzm4hwGzMvHuvMnZAGzvWaiv6eq+D4g6Rg/UWywJ3MEkcl1P8uBcaxdca0U6FS6ds
         FU92vErh++0wsOJM/eXnzfTm/BpOyrHh4tZSeGrq1wk2nXblazcZ35hwJuNc8/e3z5x+
         15G53zizD4rb972uWWuDTGPbGE6hbJdQX4UJv3dCxSKnJArz3GaPI5/wPLUYfzWWLsgH
         BzSPCwoPSiRX7rIdvo7hHF6era+kxAm9L6ZVcLW41Rj/IDlvnOxxYkrNVZQcwEmdVsF6
         inWw==
X-Forwarded-Encrypted: i=1; AJvYcCXwNu9KJ6eqhd+wMtYURxvZzYSbkBOclPCsmZu5+gG9OgoqqY0ClrnMmUuFe1KaKLwtOVqTQeKhrwBhCMaN@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ+xHkhayEtOXtEdTOCQ+z8oJIZXtraTo/+BmIUBbtYm4xdB2O
	ma5600BeORdXEFe1wWLraFAZyPjJ17h3UfWYuR7cBBnYTPrKNwgSj1TN90N+tfC/UbY=
X-Gm-Gg: ASbGncu7J+tS0F8iHNRV0WoV6J/AZTSfLUTjol2Tw1/zVqBcghctkD7Vg7tKI/iFyPO
	yCL9h/fb4MIXpqOqUpFOIc+MHRlqLPk8W8AhWTTkLwsmzjHW3fcHfCtH7J/x1nWF/jQN/fcAqqB
	xTX5lOZPlUSdAxBoZE23VS3D+nSV0u2+2RKzdmUAictWar3IBf9j5w+cIoLQSLWb85bJTC3Nwrm
	OK8J8CKvEErAWjrQG0BKV1v2zxKU5GCrvn/svdqpIBBjhtz9q3oc4nFE9H/SpQ67A5xsodQaEHt
	d1o2S8c9pEARObzbMFNE0bev/vXlIGrSOGbc73HW+dTCyL1T9TsJ7Uhoe63ee04DwFnEqnFdtMu
	rzHvSoneYb12w9hvTkQwvprKxiHXiPSX8DoVLSlUdxA==
X-Google-Smtp-Source: AGHT+IFCjuGBYnCDqcmxB9IrSM+BqDe9Q2x6ToeA46ZBK1ltHn2SzcZl6eRhCx5sKgenvc7B4y15cw==
X-Received: by 2002:a05:6000:4305:b0:3c8:d236:26bd with SMTP id ffacd0b85a97d-42666ac2ce9mr9301019f8f.11.1760182291588;
        Sat, 11 Oct 2025 04:31:31 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d4bbsm8686681f8f.2.2025.10.11.04.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 04:31:28 -0700 (PDT)
Date: Sat, 11 Oct 2025 14:31:27 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH 09/24] arm64: dts: qcom: glymur-crd: Add RPMH regulator
 rails
Message-ID: <sean5dkqku4norpl5llaps6wd3qjcxbb5kodjgvh4dshjkqvt2@jtlqhser6hsn>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-9-24b601bbecc0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-v3_glymur_introduction-v1-9-24b601bbecc0@oss.qualcomm.com>

On 25-09-25 12:02:17, Pankaj Patil wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> Add RPMH regulator rails for Glymur CRD.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 332 ++++++++++++++++++++++++++++++++
>  1 file changed, 332 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index 4561c0b87b017cba0a1db8814123a070b37fd434..e89b81dcb4f47b78307fa3ab6831657cf6491c89 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -6,6 +6,7 @@
>  /dts-v1/;
>  
>  #include "glymur.dtsi"
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
>  / {
>  	model = "Qualcomm Technologies, Inc. Glymur CRD";
> @@ -66,3 +67,334 @@ chosen {
>  &tlmm {
>  	gpio-reserved-ranges = <4 4>, <10 2>, <44 4>; /*Security SPI (TPM)*/
>  };
> +
> +&apps_rsc {
> +
> +	vph_pwr: vph-pwr-regulator {

dtbs_check gives this:

arch/arm64/boot/dts/qcom/glymur-crd.dtb: rsc@18900000 (qcom,rpmh-rsc): 'vph-pwr-regulator' does not match any of the regexes: '^pinctrl-[0-9]+$', '^regulators(-[0-9])?$'
        from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#

so node name needs to be regulator-vph-pwr instead.

