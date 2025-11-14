Return-Path: <linux-arm-msm+bounces-81793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CD0C5BD72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 08:49:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6E673A1653
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 07:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7C8E2F60A3;
	Fri, 14 Nov 2025 07:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SrjLvpGY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76941191F91;
	Fri, 14 Nov 2025 07:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763106429; cv=none; b=mXrd1dc0FQFsW9Ph16UmEBHtcH+J19V+onfgAYTlP0wPgcocnqUqKESjyN69ySizcM9aKcotCGs6YBsrviqiticVBn77PBfBZqJwhP6YLgs4Leho2FGJwGiCo/7R6xcZaqBzPyHa7b8QtfUnaGIhMJRmVjR5Mgci0owd/HTXFpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763106429; c=relaxed/simple;
	bh=KS+VcO/NTMZzXSDvNP23TtVP+SjCFQ9HliVU+Se9klE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k8L1A4tEPtu36jt5wa6D4m4E3j7LrgkzDj9yajOWlR3Y97+1v23b7HjW314AMhwpAZbstdh0eqwGNLBw9z4Q2pZkRkizZtQrhP/ETauu08V6QI/odeFFZuCko18LBkcslEBXcuq2Xnk9B3GkRpDtJuySoyKXTJzhNV3O6EJOEpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SrjLvpGY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3B9C4CEF1;
	Fri, 14 Nov 2025 07:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763106426;
	bh=KS+VcO/NTMZzXSDvNP23TtVP+SjCFQ9HliVU+Se9klE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SrjLvpGY9ZtMNfRbSPRpEaPKz4dzOPNPThw5cZ9xjU65B15xf2Jo5Aubz8cS0ERcE
	 ncTWY/ZI5nAnG0H0eBfetkm0jwty0SCzjnSYrEL+QR8XCi789VW4IeSadplEOmLWUS
	 +hhTVprQ1mUi6R017Y5xTvSqdTfHRGBWXjUaVyZlRy3A2PwTXGcwwxC5heiU/LpQQ2
	 IXabMdeE2HRfZcjEAer4to1wQ+jRhCsql08OJ1RoAsTNIE+z9Y5RgOx38So4GiAuFC
	 a3ndCVZZBEcJbUA5p6gzjpGJd4RfgBTtBzYHPg5fDJ6n/m14gn75xkt0+C/sind/jp
	 dIijx0E9vUj2w==
Date: Fri, 14 Nov 2025 08:47:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sean Paul <sean@poorly.run>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
	Jordan Crouse <jordan@cosmicpenguin.net>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Connor Abbott <cwabbott0@gmail.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 18/20] dt-bindings: arm-smmu: Add Kaanapali and Glymur
 GPU SMMU
Message-ID: <20251114-astonishing-marmoset-of-performance-33cdba@kuoka>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
 <20251114-kaana-gpu-support-v3-18-92300c7ec8ff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251114-kaana-gpu-support-v3-18-92300c7ec8ff@oss.qualcomm.com>

On Fri, Nov 14, 2025 at 04:59:15AM +0530, Akhil P Oommen wrote:
> Update the devicetree bindings to document the GPU SMMUs present in
> Kaanapali and Glymur chipsets.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


