Return-Path: <linux-arm-msm+bounces-75007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0114AB9E026
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECADA7A73C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995E13C01;
	Thu, 25 Sep 2025 08:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qQYh4Mpq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A578826FD9B
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758788148; cv=none; b=a144q51Lr8NKvNFQf2ftECMGH3xXzJPgVWyXW30v84etx4QeQ1jRgHl/LNyVoGGRmbSQrKA8hxzTFEYbk+oAMnQHnX07g1Av+EzOUFR8+68a3v5F9oax/ZKu1LtJQEFPa6HlVhY3kYYD+YAySco8EGLzvXGoW18uBSNCDAUzCVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758788148; c=relaxed/simple;
	bh=3fXiUWYjGWKVqU8lMvQIlNZWpDwmv3kekLmduLvwx5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rwwq6sfOzfJ/EkiUW7YhTNUT3lR0n9GpAMRX/DJqz6Rp4UGcOf+rfrZ2IUFvD7F7ewrj9q21lonSx+JvLOwAlTVkKRpRttPTKSTVNQfl6cvFb7VW01fjQQhovxJTYKvFHdnpHWaMlz8SQEF9P7pTtW5brN4m8sZRsC457c2v/rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qQYh4Mpq; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3eebc513678so679061f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758788145; x=1759392945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iIk5HEoQc9fl5mBS+Avjm6Evc+6IXsiML5Ejq5Yzfmo=;
        b=qQYh4Mpq1ICQ7o9JZ2hY7Ry8ZlcS4f3PJF4waW4iKHyRaLmqSMg5PPSvhZcyosz7sE
         y2pD0b8wyBNkQ4FLNympnFqKJ24yjC2Bl/t4n7NVH071WbGmoVQOG0faa0m3AwKaK1aq
         0lXSH2OmiyavjD0cdjJZYicvicTDB+BVEOsQR1UhQepdCUGjARQcJKX9oHDZy7ZXozsK
         sk9nkD336JDueIoakmfr+iFhz65qwyDw3O/m3EbgnBd+z4ewHX2u90ObMT738tunrGQx
         iuStu/ZNXwuZHVb1UCiBdlExc7zmjT7wI2DzMcYZ+FLBScjtTmeWr4bpq9+bUXVdmoc2
         lEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758788145; x=1759392945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIk5HEoQc9fl5mBS+Avjm6Evc+6IXsiML5Ejq5Yzfmo=;
        b=wwnPXyPDsomKmtjTpkmyNzXsOCWdXtlz9pUQILzziOacGWK7mdet4n2bgRtL/ltb3r
         xYPdetOEyOG+vFoHg8BnjmftcJruVz6q4ZqLdtw9SkyO/VN4tVgqfyqJa39cS7m1rtDV
         XR4cSE7ERx3ssBhEr9g8oyff7X6XUR2ukZWuAD1WpegVgBtl82vWB9uQvTH/4rtKDBVv
         zJre40OASuz6qTyEnNkbgFKJBXkCc1stcvrHJSs4myhZdPSaBOXHaAQbt5RfZBN/iIpS
         Y8rUURjZLUBl3svGSwjP/jKEJcBJ873UIdVA5CdPvT+O0C8OjvVUGxWH/ukpp+vlegja
         Hijw==
X-Forwarded-Encrypted: i=1; AJvYcCX9j4R4pnK2PFJIaaHBTG/y6+U36tqAT+pg5MptoFaxnwr9EboIWSBkuexRvEJsIitV/37pAF/or01xNn/s@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo4TU5Ez8f6UGj+d2z6LYyVP/8wedOFPuFBUfE86YU7bb6gNQ4
	yDPY/qTfsB60m2DgyvMzVvcwLimsMhaQdoW+cTDfaRq87rgyr8Uvo/UMaNTQiTDPHRM=
X-Gm-Gg: ASbGncuUTYdqyXYKLNgV4J7axVEyScyGv0H3qq4gVLW0MyasiBAuNjmXwg2rcSqWPro
	wdlr3rDKShnj1oJHBVI25Wb3G6WvYgd/ML1G7tPbXxgwyMgIwCq5u66oLSztvj/6pUCI0ozNIjj
	yDcB/swQPTnZNY+TfuxzOPBUwVrlcGIOIYRu2E+qMHPuCaVDlyaPoHSc2nKAldOWl7ichMHdMEf
	IVy+DRtgpIRgnfZKYgzkbnyGXm0s+GBUF+HnJ2eaot55p/IeHPDCMblFPDVD1bVlUyVmr29xK1V
	H1WB33Mop9HgLJqNhD1/QywdFV/o1bxVk1ClJDAWtGQKjkQPgSxveZDzRLYIlLqgkiO2qyh+ZDr
	uIWCjZoJi/GJ1DqRCWwgb0w==
X-Google-Smtp-Source: AGHT+IGLlMgfoOBrZIGbeZcCuMdmxs/fw9AstHCHAfmextzt2Ns/K8P+iRRUgzeWNUsYJXxAK5jmvQ==
X-Received: by 2002:a05:6000:2385:b0:3da:d015:bf84 with SMTP id ffacd0b85a97d-40e481be8a9mr2735250f8f.25.1758788144740;
        Thu, 25 Sep 2025 01:15:44 -0700 (PDT)
Received: from linaro.org ([86.121.170.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc6de90f9sm1888711f8f.48.2025.09.25.01.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 01:15:43 -0700 (PDT)
Date: Thu, 25 Sep 2025 11:15:42 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH v2 15/24] arm64: dts: qcom: glymur: Add PMICs dtsi for CRD
Message-ID: <tsh4w4paux3g772ynjcbjx3ntz6ynqx2ucd273yz3ncscxihjk@dwwjbcqyheuo>
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v2-15-8e1533a58d2d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-v3_glymur_introduction-v2-15-8e1533a58d2d@oss.qualcomm.com>

On 25-09-25 11:58:21, Pankaj Patil wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> Include all the PMICs present on the Glymur board into
> the glymur CRD DTS file.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts    |  1 +
>  arch/arm64/boot/dts/qcom/glymur-pmics.dtsi | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index e89b81dcb4f47b78307fa3ab6831657cf6491c89..97f6eedd7222368f5cbfdd02e9c4d87261d7f19a 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -6,6 +6,7 @@
>  /dts-v1/;
>  
>  #include "glymur.dtsi"
> +#include "glymur-pmics.dtsi"
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
>  / {
> diff --git a/arch/arm64/boot/dts/qcom/glymur-pmics.dtsi b/arch/arm64/boot/dts/qcom/glymur-pmics.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..59dcfb67a203a7c576406037377fc9fbdce51a97
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur-pmics.dtsi
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#define PMH0110_F_E0	0x5
> +#define PMH0110_H_E0	0x7
> +#define PMH0104_I_E0	0x8
> +#define PMH0104_J_E0	0x9

These haven't been used anywhere.

Maybe you meant to define the ones suffixed with _SID, like so:

#define PMH0110_F_E0_SID       5
#define PMH0110_H_E0_SID       7
#define PMH0104_I_E0_SID       8
#define PMH0104_J_E0_SID       9

and without the '0x' as you will get a build warning about it.

> +
> +#define PMH0110_F_E1	0x5
> +#define PMH0104_L_E1	0xb

and here is an even bigger issue. If you define it with '0x' prefix, then you
get the warning, but if you drop the '0x' prefix it will fail to build.

I'm sorry to point this out, but this hasn't been properly tested.

Thanks for the patch though!

