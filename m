Return-Path: <linux-arm-msm+bounces-33725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 109EB9971CD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 18:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C75AC281B8E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 16:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A23B1A0B06;
	Wed,  9 Oct 2024 16:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OitXDxRF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8DE38DE5;
	Wed,  9 Oct 2024 16:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728491661; cv=none; b=U20QMeH7Sm3/YD2bW+em7kHy8MwadeNyFIZYxAjXBCwQ4N9E5a2g+KdSsjBX2AMX070UKiRKL+IB/PlC98dBPSbT8z52MgnJAYzvTGQij6FZySEuCBqgXGgTu1zmFSr5DsKZtFbJsEl8+kTnaPvXtyniqSn6cZ92wtediy4IlOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728491661; c=relaxed/simple;
	bh=K5athNe1/NvnaRmNTmFsQwsUp9p+aYNd5zMwqloPMQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rb+qfeVTrs7n+cpceMrY7BuHww9UYIQlliXcQqcyF5QpIPnL6fO3Tzk2KzRJaGFQ0fRVQqbgftzS5zoVcZsCqQN7gjBSIanP2sqvL/1/KpshQW7ICiTNAKifaitqUgbwQu0GlP6SWtqFGeP678e4r8JNMpHtMK3+DbBPeiyWblU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OitXDxRF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74FF6C4CEC3;
	Wed,  9 Oct 2024 16:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728491660;
	bh=K5athNe1/NvnaRmNTmFsQwsUp9p+aYNd5zMwqloPMQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OitXDxRFnp1UlcuCm875dCX+SvbASzcx22JV0ZGCer7G7XreuuTkzhK9buH7LHOOK
	 WzpOBl9ZxQxRoCbJIWkEbXCUqSqcmCoBXSF8L7BDSbjOIffHuTVH0r6k2ENV/NZ0mH
	 W3tXC3JVqtvaKi+wwuIp6P6Jp5eX6idpXEy1ZSdeN5ZUMneZZkt0AeSqgezGm5fpXG
	 SglM3YZgT/QkKFDzZD797oSbWkxRdtpS3EVGJ0GL5H6aff3SvoZCX7luiwMf6zkuiy
	 aEEm9zhzDfh5RhRHNvueT19o0cs2uIOJEUFlL9IJzKA+PBN/H9etLWAUH20/dgkDyK
	 Zz1Zbxtg/njvg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1syZdo-000000005Y2-1KZR;
	Wed, 09 Oct 2024 18:34:24 +0200
Date: Wed, 9 Oct 2024 18:34:24 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: Add Broadcast_AND region in
 LLCC block
Message-ID: <ZwawkF17sxYRk_vC@hovoldconsulting.com>
References: <20240718-x1e80100-dts-llcc-add-broadcastand_region-v1-1-20b6edf4557e@linaro.org>
 <39df7ff4-7f22-4715-a0f7-eb2475bd7b55@linaro.org>
 <Zpj8cWfcqYj8rUOP@hovoldconsulting.com>
 <ZpkOgpGCKp/w13la@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpkOgpGCKp/w13la@linaro.org>

On Thu, Jul 18, 2024 at 03:45:54PM +0300, Abel Vesa wrote:
> On 24-07-18 13:28:49, Johan Hovold wrote:
> > On Thu, Jul 18, 2024 at 01:20:37PM +0200, Konrad Dybcio wrote:
> > > On 18.07.2024 12:20 PM, Abel Vesa wrote:
> > > > Add missing Broadcast_AND region to the LLCC block for x1e80100,
> > > > as the LLCC version on this platform is 4.1 and it provides the region.
> > > > 
> > > > This also fixes the following error caused by the missing region:
> > > > 
> > > > [    3.797768] qcom-llcc 25000000.system-cache-controller: error -EINVAL: invalid resource (null)
> > 
> > Please say something about this error only showing up in linux-next,
> > which has 055afc34fd21 ("soc: qcom: llcc: Add regmap for Broadcast_AND region"
> > region")).
> 
> Hm, now that I think of it, maybe I should drop the fixes tag
> altogether, as it fits more into the "new support" category strictly
> because of that commit you mentioned.

Looks like you forgot to respin this one so that the error is now logged
with mainline since 6.11 and commit 055afc34fd21 ("soc: qcom: llcc: Add
regmap for Broadcast_AND region"):

	qcom-llcc 25000000.system-cache-controller: error -EINVAL: invalid resource (null)

Can you please respin as soon as possible with an updated commit message
and a CC stable tag to suppress the error?

> > > > Fixes: af16b00578a7 ("arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts")
> > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > ---
> > > 
> > > Please fix the commit title
> > 
> > And that.
> 
> Yep. Will do.

Don't forget to update Subject.

Johan

