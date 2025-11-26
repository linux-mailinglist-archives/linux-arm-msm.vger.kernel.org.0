Return-Path: <linux-arm-msm+bounces-83405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5D9C88C79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2881D3B2675
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 08:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16EFB31A551;
	Wed, 26 Nov 2025 08:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CUfz7zoO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3AC1EEE6;
	Wed, 26 Nov 2025 08:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764147294; cv=none; b=i4CI+FefrMEGJ9fOq/JREpwchWdCrkQ3o0efKco8Jw7h96gLsFXv4DOr854Q/3PEfA//mNuqIT+Rmzqjbczn/0f0zubOrP66mShODujt2lHeVlZu7JVeBc26ORLghyY6y7g7vuk0WDFHtRFrFoqUPWLkFYVlQU0JivBBBOeWPQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764147294; c=relaxed/simple;
	bh=xCRAyoWbSZNWin2EOaLMWug7Ia709OOAhIVrGrb85T0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxvKo+BeI2ZQwzdHQT/6TmpW3RrDi53qdWqAiBWIsTU3mkcvcj3bH/MTWxUsaW3ppOfwoFNgAO/L14GtJ8YRCmDPDSA8t8eWEFGUD6IjW0fLMDXeD88nB7eeWH89RHzgOQ7uaYw7YNi7wz1TbO7j1ekNq/MENS3ppZh6cVJHse4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CUfz7zoO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDFF7C113D0;
	Wed, 26 Nov 2025 08:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764147293;
	bh=xCRAyoWbSZNWin2EOaLMWug7Ia709OOAhIVrGrb85T0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CUfz7zoOO0bNvMWjFJAXUC25goct4lLAEaVl55r6xr2XEMrCscCLibUegUS/mCzvF
	 WI0jXhdGeUKlWnXsCsqB7/y8XGYRLRTVOtf7SwcRNh8O+YJ1ZhKwg+YJlQ9cyH15op
	 LeNOX1XsG403nQra8uz1Nx9a3fit861WYbYBcAyZ+bt5kEtdz0mvc8gIlmmtdADKqs
	 flxM9HFPxLl/kYtsrq2jlgI/q/srS0ivNK1RU+MxuuP1ZoCBzUtjkW4+Q55EEkWLSm
	 r/oJF04sDWZYFRuFuUbXtKhRMr/uByDY7OxWJaQNW9wRx4LrbU6sn0tB0RdNyo1Vjv
	 XobKNJlPK2ldQ==
Date: Wed, 26 Nov 2025 09:54:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: cache: qcom,llcc: Document Glymur
 LLCC block
Message-ID: <20251126-augmented-lobster-from-neptune-d7bbb5@kuoka>
References: <20251125-glymur_llcc_enablement-v2-0-75a10be51d74@oss.qualcomm.com>
 <20251125-glymur_llcc_enablement-v2-1-75a10be51d74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251125-glymur_llcc_enablement-v2-1-75a10be51d74@oss.qualcomm.com>

On Tue, Nov 25, 2025 at 02:46:22PM +0530, Pankaj Patil wrote:
> Document the Last Level Cache Controller on Glymur SoC
> Glymur LLCC has 12 base register regions and an additional AND, OR
> broadcast region, total 14 register regions
> Increase maxItems for reg and reg-names to allow 14 entries for Glymur
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/cache/qcom,llcc.yaml       | 47 +++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


