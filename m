Return-Path: <linux-arm-msm+bounces-20841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CE78D26B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 23:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A99231C2655C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 21:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0997F17B410;
	Tue, 28 May 2024 21:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQlGt4Jo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEEB224D1;
	Tue, 28 May 2024 21:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716930401; cv=none; b=R50fWftv0rdfnGRGylfJ+5fKt1IpNwZwBZ/8NZRmolnjKW6dCSg2fZZ0uX/vv25ElzN+AT7SKBTj1wjlCutO6QQD8ewxpORbL/Mc+YzN5Hv7uHgNqSuH8qAqrWxyechLihnHRHeswGp0XCL/GMWreM85rYyKsKf3BaJrp/qddEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716930401; c=relaxed/simple;
	bh=ZSJQyl9M2teS5Qx+/nF2zTSPDI8GKe5B/XcPj6W/pxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AwwOB1i62h8TA/Fmcg5UorwI7/unGP+XL1gaFhU6qOtLN5R9WXKrQeD2GHGflxdzroQz8N7lpQUP3als766AFt6sPtpqN0yknt+5YGb2koxFaNBmelvRtIixFWbh5RDbwITMA1PELAfEmV2XNdmfk0QXQi9McRZ+IY6kBhxtgMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQlGt4Jo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620DEC32781;
	Tue, 28 May 2024 21:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716930401;
	bh=ZSJQyl9M2teS5Qx+/nF2zTSPDI8GKe5B/XcPj6W/pxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bQlGt4JoOroymoDj15TKOYMq4CvoZ95q+35EHLFFNL+YjPWebxr8s94joLUHbNk4c
	 8D9YTkiisAAoUEHc4u6X/ThU9e91TDphV3FwDirx+SeSajrtXdjDlFhIAs/8sd5wSE
	 y0+miW1vGQ6vBvXX4cgnf3WeL/K4iOEzD0h2aB2AEsOEWL5qKn9jrfDbhxtsqfbS6/
	 fJsjjc62b1N+Cq6sixjlEx52JuDxHG6vY0+j4ogPYHm6WojgLxBv1OODtL1tfUl/0M
	 WLehtaA9506TQNPj5gQbNZTwYJWG3j6pQfrFsQpuffKtTeAbCf/od89ZBpwGUm67/w
	 dq27GJKSPFj/g==
Date: Tue, 28 May 2024 16:06:38 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/7] soc: qcom: smem: Add a feature code getter
Message-ID: <q3ajxhbj5kyc7ljgy7vr3lbpixjhtbv3ud7sgdec4u3iog6das@rdeymasp3n6j>
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
 <20240404-topic-smem_speedbin-v2-2-c84f820b7e5b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404-topic-smem_speedbin-v2-2-c84f820b7e5b@linaro.org>

On Wed, Apr 17, 2024 at 10:02:54PM GMT, Konrad Dybcio wrote:
[..]
> diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
> index 10e0a4c287f4..52439f48428f 100644
> --- a/include/linux/soc/qcom/socinfo.h
> +++ b/include/linux/soc/qcom/socinfo.h
> @@ -3,6 +3,8 @@
>  #ifndef __QCOM_SOCINFO_H__
>  #define __QCOM_SOCINFO_H__
>  
> +#include <linux/types.h>
> +
>  /*
>   * SMEM item id, used to acquire handles to respective
>   * SMEM region.
> @@ -82,4 +84,28 @@ struct socinfo {
>  	__le32 boot_core;
>  };
>  
> +/* Internal feature codes */
> +enum qcom_socinfo_feature_code {
> +	/* External feature codes */
> +	SOCINFO_FC_UNKNOWN = 0x0,
> +	SOCINFO_FC_AA,
> +	SOCINFO_FC_AB,
> +	SOCINFO_FC_AC,
> +	SOCINFO_FC_AD,
> +	SOCINFO_FC_AE,
> +	SOCINFO_FC_AF,
> +	SOCINFO_FC_AG,
> +	SOCINFO_FC_AH,
> +};
> +
> +/* Internal feature codes */
> +/* Valid values: 0 <= n <= 0xf */
> +#define SOCINFO_FC_Yn(n)		(0xf1 + n)

Please wrap that 'n' in some () here and below...

> +#define SOCINFO_FC_INT_MAX		SOCINFO_FC_Yn(0x10)

"MAX" sounds inclusive, but the value is exclusive.

Regards,
Bjorn

> +
> +/* Product codes */
> +#define SOCINFO_PC_UNKNOWN		0
> +#define SOCINFO_PCn(n)			(n + 1)
> +#define SOCINFO_PC_RESERVE		(BIT(31) - 1)
> +
>  #endif
> 
> -- 
> 2.44.0
> 

