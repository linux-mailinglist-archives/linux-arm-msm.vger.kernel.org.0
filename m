Return-Path: <linux-arm-msm+bounces-36090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9B29B20B0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 22:08:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBCCD1C208BB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 21:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C651836FA;
	Sun, 27 Oct 2024 21:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PG2LYzjq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91961DFE8;
	Sun, 27 Oct 2024 21:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730063296; cv=none; b=FKadvN8nUx0YeoYRbPNQwFvIxf7YBHK6la6tinzmN8II7kLXppqtvBp3zyPkHieG5dt/bYA9nvjwYUSHPYSY6jEV3UVh5EShIsT9kIsA6u73/xjwrbbcD/6A8hb/nTZJqflrjIccGWFv9Wjw8iWQQcrC88xsAfDfBKODMvKokyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730063296; c=relaxed/simple;
	bh=Av4m1e08tQNahPrMMg+/oG3DahuvKx4gT6858eKLzts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nvigeQXVg8dl5/cgMc4nOILvoMiRIBDkbU5Q6oJuwAIEEsoQZ3zx1kEVPoMrXnYEwEWKHsF+8AcjzRn23qQp0m2+R7W2LYaPJb6DhkZeUBPQF5EG5Kw/WyHLQpbcahfUB3wKy6I/1HyiYMV/ZLnBqhP6vuOOroLtKDjiMCJzpU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PG2LYzjq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3660C4CEC3;
	Sun, 27 Oct 2024 21:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730063296;
	bh=Av4m1e08tQNahPrMMg+/oG3DahuvKx4gT6858eKLzts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PG2LYzjqarxnp0+60iB7jPrhTV2KpZKv8Pp4Qcaa1njxZGVsokfmu5aFlGhyEHmQn
	 zpfmKwdUVsCC+6vjECPtP8M3oqbJw156rlaixqJPtxnddlzRULdVG5Cy+ywU316ECV
	 IYnaX+zkHnuhyRtzlUDFQHFbX5sy2UomHYmfQ/CtG+XN6EPLvRdJc/qwYzFVHq4uT5
	 ClhvtP3mgH2pWOwynfnjKuaKliFTHYunoF5VgcEZtxiPou/7wRjdAot+VLC5XTyJX2
	 Ytc3iTkSZ6YwUP4n/7ik6mka5uAdL4PRj38hP8jmhRcZd19O1PCcUDrr+rmg1nYn36
	 U1GcA8+5RmtWA==
Date: Sun, 27 Oct 2024 22:08:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: remoteproc: qcom,sm8350-pas: add
 SAR2130P aDSP compatible
Message-ID: <yjnzm6qbdx4py2hst5aipeaarnjipc4oxecm4s2ownnumx6cqb@vthdlulkduw5>
References: <20241027-sar2130p-adsp-v1-0-bd204e39d24e@linaro.org>
 <20241027-sar2130p-adsp-v1-1-bd204e39d24e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241027-sar2130p-adsp-v1-1-bd204e39d24e@linaro.org>

On Sun, Oct 27, 2024 at 01:09:43AM +0300, Dmitry Baryshkov wrote:
> Document compatible for audio DSP on Qualcomm SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


