Return-Path: <linux-arm-msm+bounces-51329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3508AA604C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 23:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20593175F16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 22:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E08F61F8AD7;
	Thu, 13 Mar 2025 22:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OR4lUDqG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90FD1F585F;
	Thu, 13 Mar 2025 22:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741906428; cv=none; b=YeXfXfXgsddTI/FeOU6QuglUSDUXXFrSDgPd06YaHvhucAUIfFtRU/IGnmduUGtEhS3+/2Qt50k8n1bo0GGh6OEcXbxddrJUmq1tXSnS87OpqLNCgLChIM0el1IS9vZ7/LKRpF2Cm+SSG4J3JRu0xuM6fuCr8Qu378PLx1Z6TsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741906428; c=relaxed/simple;
	bh=0Pf79xoJpzsJKbZvjRgGpD+kGcnppedrNyCyTFyrZ+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RauABJMuiuCPJdT9QzRWJtd+M5lL9rnaGEv+4Te6Ex9AfY7wmZu4w/1id418dtgC9U/1HSgdtuw7LUTJq8IWim2A5CkGdeOaHAw7QuxN4AxiouQiczr0nMhUAOCzrrvW40KaC4/79Y8VzPlxV4MdrWKmWJ77vx9cS/9JvZpCaJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OR4lUDqG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF321C4CEDD;
	Thu, 13 Mar 2025 22:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741906428;
	bh=0Pf79xoJpzsJKbZvjRgGpD+kGcnppedrNyCyTFyrZ+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OR4lUDqGKa8K11KB9m04s8Fltfpsuu/T7KPfj6The4utms9vZKgeAaZOrZcPRyJgO
	 IDix8/iIo8LVI6euP+cKYxMiGyI9Ygwe46YdK90uIao5U9+ZW1Ey32A4q3/1wIpZ0b
	 8HGjfwW5hWsAC6fbUMxfZ1mByvJ7y91UwwbJ8pDPd8qDxCj7HqY/yl6y0MG0AI3nu6
	 a2Vn93UlvMjpV5++L1cucgJIZxb5KFINYniX+9HalRFdFiyGOSi5ewERbFoCCejx8O
	 vKQTe6l0gz74E+BRUkQsY8S2sclChItyN+BA0MpbADrXjGTa/1sD4QKRm0A5ifS3ng
	 EX0rET3Q++fkw==
Date: Thu, 13 Mar 2025 17:53:44 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Robert Foss <rfoss@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Christian Marangi <ansuelsmth@gmail.com>, 
	Rohit Agarwal <quic_rohiagar@quicinc.com>, Kyle Deng <quic_chunkaid@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 03/11] dt-bindings: power: qcom,kpss-acc-v2: Add MSM8916
 compatible
Message-ID: <wccjda6emgvsgn3t5qj7kfsih2stcelnvwu45qok4bbln5kk74@drqp7wrrges4>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-3-0c84aceb0ef9@oss.qualcomm.com>
 <a7d76aff-0dc2-4b0e-9ee8-f433d8e745f6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7d76aff-0dc2-4b0e-9ee8-f433d8e745f6@linaro.org>

On Wed, Mar 12, 2025 at 04:12:14PM +0100, Krzysztof Kozlowski wrote:
> On 06/03/2025 19:11, Konrad Dybcio wrote:
> > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > 
> > MSM8916 seems to reuse the same hardware as MSM8974 and friends (for
> > whom this binding document was created). Add a new compatible for it.
> > 
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml | 4 +
> 
> 
> Folks, please merge Ryan work instead...

I'm not sure which "folks" you're referring to and neither is
get_maintainer (well it points to Rob and yourself).

> I keep carrying this patch for
> half a year:
> 

Where are you carrying these? Are there any other patches on your list
that have fallen through the cracks?

> https://lore.kernel.org/all/20240710155226.130086-1-rayyan.ansari@linaro.org/
> 

I'm picking Ryan's patch through the Qualcomm tree...

Regards,
Bjorn

> Best regards,
> Krzysztof

