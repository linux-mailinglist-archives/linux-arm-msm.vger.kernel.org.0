Return-Path: <linux-arm-msm+bounces-32995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C26A98EAD4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 09:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDF741C20A34
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 07:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D28881AB6;
	Thu,  3 Oct 2024 07:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCKqCEzI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3098A73451;
	Thu,  3 Oct 2024 07:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727942011; cv=none; b=GiM6vhQqjXpPkedjs+yARRYYsGWM3WUVsuUr83nwySEImM42bAERy+szf6IpymkUoqSsMlPn4qo0v5RfOHdP8U5srPoa6q5sO/ijxOjp9ADzF0x9QKSdtz4ObJS8LxK0M5+hbkzn+3VGv8mJjWpI5PZVn4ZMtnoK2i1gML+SLm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727942011; c=relaxed/simple;
	bh=Pnx8kHxQm0FdTMFRWgE03qZ03nNrfmYdyEyjD1G0its=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7UtbpcIcTEuxHYfJLx59YfeZwYFOIvJdAfrVzE9lRLz7S6utX8NjKwQLfjnxi+9Af9DlD21NleJc8HLz7gdAZzMM3LySWvZCI5Kd5gNqz/GghifEbO1BgF7ffRkGKVtYFkg2y82/o8fdRLSJC4jTKyz3ZNsuo9CiujyNZrpuzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCKqCEzI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A62C4CEC7;
	Thu,  3 Oct 2024 07:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727942010;
	bh=Pnx8kHxQm0FdTMFRWgE03qZ03nNrfmYdyEyjD1G0its=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PCKqCEzIslXrsHczDbIFNb6zfwf5FXgCWFf2GUGBco5/vRUfcqBo5JEmXO5uhqY9o
	 Rh3JhnbfWw5tFNzGUj1gfOYD4K78wbI5hzzGCbo9g3BCcktN5adkx9jB17nWNxXD67
	 ad5bRAOfpUfSenSWEr0piHxg7g991hBgcsy90zbw3oX2tLvpnaqOpuivme+0RLyWWo
	 weu70wy12lb1FczfxluRN3pwVbG1f0iTHaBblc6c/LrPP25E39TDZ0y6GPBXDqC9RJ
	 eT4nKO0Pi9EONx+vHK12Vn4JcW65mSQYaoHNgOfIniGyEouChKquoplLmJ25zkzHM1
	 QkDn696Hw1qjw==
Date: Thu, 3 Oct 2024 09:53:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mahadevan <quic_mahap@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Kalyan Thota <quic_kalyant@quicinc.com>, Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: display/msm: Document MDSS on SA8775P
Message-ID: <hieznomkoezdzmmvxfrvfrma3v5lixnkjkahh25fz5fttcpetv@t4pvd343j3ww>
References: <20241001-patchv3_1-v3-0-d23284f45977@quicinc.com>
 <20241001-patchv3_1-v3-1-d23284f45977@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241001-patchv3_1-v3-1-d23284f45977@quicinc.com>

On Tue, Oct 01, 2024 at 12:11:36PM +0530, Mahadevan wrote:
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        const: qcom,sa8775p-dpu
> +
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sa8775p-dp

Where is this binding? The schema is incomplete.

Best regards,
Krzysztof


