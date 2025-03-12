Return-Path: <linux-arm-msm+bounces-51086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 930C7A5D6A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 07:53:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0ACE81886B8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 06:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834461E5B70;
	Wed, 12 Mar 2025 06:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+pNAPEm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A4A1CA9C;
	Wed, 12 Mar 2025 06:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741762423; cv=none; b=jslumCfZZQ2zptBYb/2cv25F3FEXhi7mInQkDrawOEjAm2gnSgk/wrnrJlSzfUCRAqYJ54GZJc+0ein94fJZJkDCwpypDU3Jn762CQ7WGmbDkQwEGSTz0A87BmxCnQeFC77UDJT6WOLUtxUBXfQtAOuwGoGxu3ww0JatFWqG1ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741762423; c=relaxed/simple;
	bh=0iS2P4tq14TyRWpFc+o+HVSGK6GQ6tD3/92onG3zbPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F60FVDpOmBxpZeKi/QzwoW9MwXGv+lGs1flwDWV4lynEFcI8WrUF2RlGfj1ehDupQPtHMl9eH7zuYL03gXkA5sEvhO8jM8E3b3nrELoIecxpOAshgYF+5ofB8O8myJffUUVJcYwGIGtwJqsn9hnCsP1TqV28fLPjVTnZ6B7fhzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+pNAPEm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF74C4CEE3;
	Wed, 12 Mar 2025 06:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741762422;
	bh=0iS2P4tq14TyRWpFc+o+HVSGK6GQ6tD3/92onG3zbPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X+pNAPEmoz0DABroFYFzJcG9CdH7MJlhpLtygzqlGoSPIcuuwqw62+5mDoyGV+2Rx
	 stsj7L7tfMe8DBuq2bOOSqsBHKaJoD6ygEujjdCJse9H4xh9nLF6mzpV0a319DhyXi
	 Q4AcqFAEsFXGNQvohHxH5gFhhsEBYRhgpbkGrH05oG8aWRNzeTXjAIeh3QjSmbq3i1
	 hmJgW3cZLxPzzpy9OoGRnE4KoejamZJRFsKOsqQaXPz41GyxWlaX4X06YrBzNt5x7W
	 lYIH9UCoyyxbv9GGuYLojO1GutN67lutqwIanwE5K237YYXDTh6AxAhmtaO8t/EFOa
	 cXCJFv3sxz7NA==
Date: Wed, 12 Mar 2025 08:53:38 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Pratyush Brahma <quic_pbrahma@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: add the pcie smmu node
Message-ID: <aau6kgdbsq5mu5h4kqggzgua26o7dwc6hbkpmtgcnqx5dqhlgd@qcm2xzr64fyg>
References: <20250206-qcs8300-pcie-smmu-v1-1-8eee0e3585bc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-qcs8300-pcie-smmu-v1-1-8eee0e3585bc@quicinc.com>

On Thu, Feb 06, 2025 at 07:13:17PM +0530, Pratyush Brahma wrote:
> Add the PCIe SMMU node to enable address translations
> for pcie.
> 
> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 75 +++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>

Though I see a little benefit in having this SMMU node if it is not
followed by the PCIe enablement.

-- 
With best wishes
Dmitry

