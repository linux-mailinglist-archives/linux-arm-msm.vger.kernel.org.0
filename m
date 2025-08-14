Return-Path: <linux-arm-msm+bounces-69136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1845B25E63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 10:09:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8BE817B3C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 08:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037AB2E2664;
	Thu, 14 Aug 2025 08:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j3DR2zks"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C815927A12B;
	Thu, 14 Aug 2025 08:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755158830; cv=none; b=YzNbYf6NKGAfk6+GCbZRWeT/TyZltLpKEXp4JofYpq05P+OQ6alPafhbfp0RpQgQukVUfbrfOLVhQO/p9VoqTnU6ObLjtqgXuMoy+KYQw8/KZJRaiZQ9TUki2DEV5hI07Ge47zW+78uexJaLZ6GXuZ0q6UKyO0xQFK7ZcFkCbGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755158830; c=relaxed/simple;
	bh=Il0WWMV2+0zJaBAEupvI9iKf2fQYXz9ojo2+2AmZbuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zw0kvy+4z/aw6RnBYBgxmPbLW8uADaqbYlF844za6bAVRYPiRHP6jErwb+mO8/QLRwvJ3WxseDmrfr+h5kyZrNY/fvOaaOicCGUf91J7W5JaWGoLAMfxGrU2yaApRNw6unbv5Amv5lHQdIAgsnA7sN0Q/QIojKwMtnLg3bZciH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j3DR2zks; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0717C4CEEF;
	Thu, 14 Aug 2025 08:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755158830;
	bh=Il0WWMV2+0zJaBAEupvI9iKf2fQYXz9ojo2+2AmZbuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j3DR2zks9xtxCntatW5lSYPxgP3Qlp0t4bOziW4V9M3k4O5IbOD4/cOsjXnnf/1Hu
	 ZWz/bhDjVzNMEWunoYwi+FVofjpp2keY69uAcuEdHWlE0+Pz9i0pm47Zj0uI3je6yM
	 l90Ej5BLJBzwwYftvZKa4CCTKvJiD7JcANEC1/Qk80nRnGQ6JPmhB7koyVvKJiHGq2
	 o+O+X2ddQxyb2LWf/yOsOeE1pXA+Oo3eCjTQBXUMTHxniHHNq8a1UogQPJto/s1N/K
	 sJdH9eB5f7+Iji1SPryPQSBZmZ2o6u4LyaIGC5r5moD+rswYjP/t8TPXEQxo2kBmGf
	 ihYhJcqjZHifQ==
Date: Thu, 14 Aug 2025 10:07:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/7] dt-bindings: clock: qcom: Document the Glymur SoC
 TCSR Clock Controller
Message-ID: <20250814-wakeful-pronghorn-of-symmetry-a1ca28@kuoka>
References: <20250813-glymur-clock-controller-v4-v4-0-a408b390b22c@oss.qualcomm.com>
 <20250813-glymur-clock-controller-v4-v4-2-a408b390b22c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250813-glymur-clock-controller-v4-v4-2-a408b390b22c@oss.qualcomm.com>

On Wed, Aug 13, 2025 at 01:25:18PM +0530, Taniya Das wrote:
> The Glymur SoC TCSR block provides CLKREF clocks for EDP, PCIe, and USB. Add
> this to the TCSR clock controller binding together with identifiers for
> the clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8550-tcsr.yaml           |  3 +++
>  include/dt-bindings/clock/qcom,glymur-tcsr.h       | 24 ++++++++++++++++++++++
>  2 files changed, 27 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


