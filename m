Return-Path: <linux-arm-msm+bounces-31849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F208097A540
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 17:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 395A81F217B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 15:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C66C158D8D;
	Mon, 16 Sep 2024 15:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iCSYIdJ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D0115854A;
	Mon, 16 Sep 2024 15:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726500239; cv=none; b=JdHF/rLrl5knRkUec7x+OyIOOfpjoH2H4WL+MEJ5jZqxVUTy74aj9TkK69hlvQyydOF+GFaAE3TgqXQXLsTodwvOCZaXsdyOkYmRN7Zodpdak7WBRsRBrihLgYTg9pqXx3o9x59Cs4KEMi2Wp7rNLCYqbu4Qy97nnCgI3wvI/1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726500239; c=relaxed/simple;
	bh=qD4ujfWspewbmLI96zIOIwR+FCHU3GJLIZW/IsoDLFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s25iAa2hvbGMEST+0PJJ7lsDK4Z0EteUDPX/i1YJdc+6kYL4L6sfo6ETa5xtUir+uGJ46QGvgLMTJcDUYGcqf5bTWMt4Cy2jUGmGykz3vfMXPc7ZBzx2Tyg7Qa26ny+kDzK+MemFNBYvH6YsTDA2K8jBSTp4M+rCsRlEEx6BJrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iCSYIdJ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9645C4CEC4;
	Mon, 16 Sep 2024 15:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726500238;
	bh=qD4ujfWspewbmLI96zIOIwR+FCHU3GJLIZW/IsoDLFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iCSYIdJ2R+jEL8qu1nVKJBsW7jCgmQs5cI9Y5u8/Rdvzt9tlTuPysbpyuuhcIUoZe
	 UNAgJYN1dLkgYF9EnKhnJfo9XR9xCdQRUtuVp0qqvOmCDa14lH1FWjLUMb6eGiDkxA
	 0QAvQr2+JKAA1ZEyx2DNMWXuhMHqtHm7/7rHgxrL2zqWOMQgN01TFWE6yX2u9gqNnT
	 1cirZm6IuULvnnJsw7c4OYtXiLQkyG/ncfu8uWYN2IRvP91kt9IlWcUWvqgWih4tWg
	 FaoqRG1UjZfUFnd96G6GEGkVskI0iZoFOmK7vnMwpEmWu8Yj7av7oMVxf+lCoUkuYw
	 5WVHbeMZCQEXg==
Date: Mon, 16 Sep 2024 17:23:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org, 
	andersson@kernel.org, simona@ffwll.ch, dmitry.baryshkov@linaro.org, 
	abel.vesa@linaro.org, robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_khsieh@quicinc.com, 
	konrad.dybcio@linaro.org, quic_parellan@quicinc.com, quic_bjorande@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	quic_riteshk@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: Add eDP PHY compatible for
 sa8775p
Message-ID: <2hv2hcpbanduw4wg2wbza4jkze4sgilrtyc7zack23uygwsjol@ckskl2rkd5xp>
References: <20240913103755.7290-1-quic_mukhopad@quicinc.com>
 <20240913103755.7290-2-quic_mukhopad@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240913103755.7290-2-quic_mukhopad@quicinc.com>

On Fri, Sep 13, 2024 at 04:07:51PM +0530, Soutrik Mukhopadhyay wrote:
> Add compatible string for the supported eDP PHY on sa8775p platform.
> 
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---
> v2: No change
>  

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


