Return-Path: <linux-arm-msm+bounces-77975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22217BF0A41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 12:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57BC53BBC7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 10:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DF12F9C37;
	Mon, 20 Oct 2025 10:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zl4Jb5px"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A97F2F6173;
	Mon, 20 Oct 2025 10:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760956923; cv=none; b=M8C5pWFcGXmLOcn7o5uBks2JNGH8S8Lmdyer2Fm7Z1bzfSFlwqsF9mHl4oxWls55BbHlh0QX30b0M1/dZ0hozp9ihb87VAc1o74bx42E9EPVNG48xuW+MoBmVolZftwIZS/NzfZGgu+3GgictnBanZkP+KWotcttaspCke0c7ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760956923; c=relaxed/simple;
	bh=y88yYtIPcaKLSXHBMpyAJOyLtM4yqPgxQ5m4nmmLOt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rv8SqM6itEy14a8axpVphZWb5am93YINzw2Mvnu/FnZByfJfSDQWfv6HFEJWLVukXXVspSvnepLbuhj0iLhbvfCDH7i9PAbDlAb9FNF+FGV7MpR0OUTTz2q2DLqHo3/u27Ca3tD0iHdCWw4c0CWxsvyMRwX53e12VKfF3X2OUBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zl4Jb5px; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF49C116B1;
	Mon, 20 Oct 2025 10:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760956923;
	bh=y88yYtIPcaKLSXHBMpyAJOyLtM4yqPgxQ5m4nmmLOt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zl4Jb5pxnPEcz+uK0jeCu2YANwi9b1R3aLdth2hh2VBk5w310sxGKnJV6I/KVz/gm
	 JGM2jZ0GYDpQNaGfvoFVKKg29WL/gVsIGjHQyyD3dM01n1cJ0QApF+wOaIEw8zYN1B
	 vNNChZ2ndEQC3PegGl9+yAV50B+W9TYzU38legl9hbpashEOVFJ/sJE/C2D6KMmThc
	 psrQEfoqHw+Fz3tJbUs2eSN3PHEbMHk+PRh5f2B2lrF5+yQyp8jNhr9zec3C7ufZOg
	 AeNBPcDLUITnlrn7TZdbfpBKGi9I1iAxGJ8zFmUnuBxPWm4bJov/iEdJRZY4ZIS0xE
	 bH7itmnJ4ewAA==
Date: Mon, 20 Oct 2025 12:42:00 +0200
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
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: display: msm: Document the Glymur
 Mobile Display SubSystem
Message-ID: <20251020-swinging-herring-of-coffee-adfdea@kuoka>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
 <20251014-glymur-display-v2-1-ff935e2f88c5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251014-glymur-display-v2-1-ff935e2f88c5@linaro.org>

On Tue, Oct 14, 2025 at 03:38:26PM +0300, Abel Vesa wrote:
> Add MDSS/MDP display subsystem for Qualcomm Glymur SoC, which is
> is 2 minor version increase compared to SM8750.

This suggests that at least some of the compatibles listed in the
binding would be compatible with SM8750. None of them are, so I find the
message confusing.

> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../bindings/display/msm/qcom,glymur-mdss.yaml     | 264 +++++++++++++++++++++
>  1 file changed, 264 insertions(+)

Best regards,
Krzysztof


