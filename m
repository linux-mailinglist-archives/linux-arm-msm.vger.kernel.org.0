Return-Path: <linux-arm-msm+bounces-35858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 622389B01C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 14:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF060B214CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 12:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077AF1F80DC;
	Fri, 25 Oct 2024 12:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFMr3E5a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DA218B48F;
	Fri, 25 Oct 2024 12:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729857629; cv=none; b=B/niz5O/NQih93t4AA6GVRaFmJ9mzMVpdJ1jEplu/HyilYgklvz+tyccjSEgIDl+8bkC4/sky0gGpOckwF4ZVIXoJpHDawMOAu4SLXkDjsq2vIJpffv29nO9myHSMh7RA+TAmn2ETEt2OXMbTZR+c2VvT5eYvNgbx8+ag5mKrrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729857629; c=relaxed/simple;
	bh=JQwR/chXzlq/cfm1F9FSdwlz8BaZGJQ7hxLBy6o2r70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YkCdjYQ1HXkoTO+evj9Hj0UDIseJ3RCVbuk50UWYvB/o6UIwiByZ/iDlB1YAUcvwRNh5zHQYFQEtq5CDa/bJBRA85lCMJft57f73O2K6+st3tDpqhrSgmnmt4guYOuobobGwnfcRcVjEdBVIwdi/6Cvf1+URurxHbvt8TO/PvEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFMr3E5a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B975C4CECD;
	Fri, 25 Oct 2024 12:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729857629;
	bh=JQwR/chXzlq/cfm1F9FSdwlz8BaZGJQ7hxLBy6o2r70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eFMr3E5atngJrrfXomJ8sggk5kYc52xPUiMWbJG8e9REsB8qS6m5oKahLDsOrS6ej
	 XcP97XsIAB1fTjdXj9bfR97BlvQ9Pt1HobJFz1wC0+MfYfzIelt6KlgTKEt7Zbdv7w
	 KN+NYfE3+8MBy1yt070yeslEuOv/Au6GoVwWRzVZHKJYrNsbAvRITn7o2alDGDknXT
	 J/yQqpcO+Dr8HDZqc1RmYzTjuoF/VEO5SumcAyHBEIIVXRS3/RZF4eTONinhHQg3ih
	 r3NWn/NChPENa3ZolwDaxUi7Gfgl48YKM+wPyFfEqoaPhyGbOGq8NXn/cofUnp/MC/
	 TTXjAC25znh5A==
Date: Fri, 25 Oct 2024 14:00:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, geert+renesas@glider.be, dmitry.baryshkov@linaro.org, 
	angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org, arnd@arndb.de, 
	nfraprado@collabora.com, quic_anusha@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, quic_srichara@quicinc.com, 
	quic_varada@quicinc.com
Subject: Re: [PATCH v8 4/7] dt-bindings: clock: Add ipq9574 NSSCC clock and
 reset definitions
Message-ID: <lyafg7jwbwoe3j7voecgd5tnhrb65utc3vkc5qqxoqug3qd47m@iudkp4w2mrso>
References: <20241025035520.1841792-1-quic_mmanikan@quicinc.com>
 <20241025035520.1841792-5-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241025035520.1841792-5-quic_mmanikan@quicinc.com>

On Fri, Oct 25, 2024 at 09:25:17AM +0530, Manikanta Mylavarapu wrote:
> From: Devi Priya <quic_devipriy@quicinc.com>
> 
> Add NSSCC clock and reset definitions for ipq9574.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
> Changes in V8:
> 	- Replace bias_pll_cc_clk, bias_pll_ubi_nc_clk with CMN_PLL
> 	  NSS_1200MHZ_CLK and PPE_353MHZ_CLK
> 	- Remove bias_pll_nss_noc_clk because it's not required.
> 	- Drop R-b tag

That's not really a change waranting re-review.

I wished you did not create here dependency, skipped the header and just
use some number for the clock. Having dependencies does not help anyone:
neither you to get this merged, nor us to see that it was tested.

Please confirm that this patch was fully tested.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


