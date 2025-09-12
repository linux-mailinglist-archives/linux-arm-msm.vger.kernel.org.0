Return-Path: <linux-arm-msm+bounces-73218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6B7B5423A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 07:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0F9C1B2759B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 05:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC3B270EC1;
	Fri, 12 Sep 2025 05:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I2tmdPcQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8E0214A9B;
	Fri, 12 Sep 2025 05:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757656469; cv=none; b=jDT4W1FOdnzWYYMaWHIy0b+ewBZhU/aZIBVvOU+oeR5iQnoQYISBxmVX/+gvgkOov65QLo3le5qQgc+lbYelvSDdBYyzLf6QjupOcbCyZZweVFU8opWm9Xu84QA7dxHHKjZy/MILZ5vG2mvSRbgXfepwqom7eoAryHqJ6KkIDr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757656469; c=relaxed/simple;
	bh=rWJWEK9OInlMBtKQyvNiNT2+XSgnu6NXba6lfxrN24Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDattPcWXashqNWt9Fy4VH8eyel0Yd+/x7ghQOiX7iTCU+gmR2tMbX+84lQeZSG77UJebA31nrUvcB/35CilNUOmGZnTXt8dflolnSXmhRHge4xyNBX6V7C96WIEaPcJ5GB3xpEysU2TDC6/g1cjip/wuSarhd1f2KlbZ+tEY1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I2tmdPcQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 418C2C4CEF5;
	Fri, 12 Sep 2025 05:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757656468;
	bh=rWJWEK9OInlMBtKQyvNiNT2+XSgnu6NXba6lfxrN24Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I2tmdPcQx1TUL3+1Bk7PDte09eLzAoWJ+FrHypU8zQnJk+2uPDE89Ia4y4aX7unBl
	 J60P3PbGHzs9yCMDP6L23pRNY02nPFSXJzhZxniyIJ1c1fEk+5e6YANr9qFGYTXzHu
	 HSbLH39Mii6vg3bbBmvBHNZqUADjXbTNDK8sxhDdjwO67ldX8GvTi0XVo3LCBmboNN
	 1KZ7oxDc9dkmz6z9alFV7zU26Yu0oFmLvejN3K4ng6+ObxQi+oBwrWVqI5hl7AT3GZ
	 5Q9KzWTGuyHlyAzVRyOfUEbQZEC/RQLWqe4on4jNY/PS4mMGk6aKpzoljK9Hf6+K8d
	 a52EcUKLBXU6Q==
Date: Fri, 12 Sep 2025 07:54:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: display: msm: Document the Glymur
 DiplayPort controller
Message-ID: <20250912-attractive-centipede-of-modernism-d3f13c@kuoka>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
 <20250911-glymur-display-v1-3-d391a343292e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250911-glymur-display-v1-3-d391a343292e@linaro.org>

On Thu, Sep 11, 2025 at 03:28:50PM +0300, Abel Vesa wrote:
> Document the DisplayPort controller found in the Qualcomm Glymur SoC.
> There are 4 controllers and their base addresses and layouts differ,
> therefore being incompatible with all previous platforms.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

You need to address in this exact spot the test failures.

Best regards,
Krzysztof


