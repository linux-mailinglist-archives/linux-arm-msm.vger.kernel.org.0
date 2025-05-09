Return-Path: <linux-arm-msm+bounces-57497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C579AB1F9E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 May 2025 00:06:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C41421BC556E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 22:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD21E25F964;
	Fri,  9 May 2025 22:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPT3h0fo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5BA24166F;
	Fri,  9 May 2025 22:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746828379; cv=none; b=OquWhTeqc+OSHSD8X/84GlV6K8Ktrpplyx9BEOqcp6In5QJm9f62r2svOEYANotF1vx+iQJmuUnIjI1OrOeTUI7q3CcD94kgB7El47tjoW3R4TtVIJfgdFlnWaQvJ1nDipvxP+R8quW8H/qwDJTmDq3aECGPJ0OM3m5gjND2CeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746828379; c=relaxed/simple;
	bh=RdaNVjYpV0ujRNO1itlb+RPBeLnd/2lTQku3mW7iF3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hRuGsXpMN5hlFDBb+LFdDv8nwXv+2dudhStAYIR7ak09KwwWwsZiJUWcMhwqcLing60ECXwM5NWevUoV0R4ua+D9x0Xrf+Psdh25gObjVF5bmPs+9tEaGYoYXKN8B+uyK3tbn9P7LarnyjhW6jBD1pKSSGck10dvXn2YXdADuX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPT3h0fo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0B2C4CEE4;
	Fri,  9 May 2025 22:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746828378;
	bh=RdaNVjYpV0ujRNO1itlb+RPBeLnd/2lTQku3mW7iF3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YPT3h0fotFbVgjyr7ntlydjvZvR7bCnBuS8m3ic4YEiKKkD2Lna1XBoyLzfzWcryo
	 fi0wBlK+mQWn3zd0bOM//LqQBychZD3OTfbHBihp96keHtkkWgjHn4xoKV9NhmNLQE
	 6X44wrMVpyi6dTLw16Lekr6VzmXLG0U3IkPQGjkVBb+CHoJ2glmG3bnQfVte5uE5t/
	 4/dIWlkLAGj0DjC+PvzpvJpMU6jjDnuToBpOEY+Ifb56hDrdl0uLBVByexNtSrFD5Q
	 +1jguokgXbQTZPDnFaxhs2MCIgoXLn5HUDD9rHI9+3wScsfsecV9tZk9mvIb35b8SC
	 Sc2yGCunlSxgw==
Date: Fri, 9 May 2025 17:06:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-remoteproc@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: remoteproc: qcom,sm8350-pas: Add
 SC8280XP
Message-ID: <174682837610.74587.5924726541252709205.robh@kernel.org>
References: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
 <20250503-topic-8280_slpi-v1-1-9400a35574f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503-topic-8280_slpi-v1-1-9400a35574f7@oss.qualcomm.com>


On Sat, 03 May 2025 00:37:59 +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> From the software POV, it matches the SM8350's implementation.
> Describe it as such, with a fallback.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../bindings/remoteproc/qcom,sm8350-pas.yaml       | 54 ++++++++++++----------
>  1 file changed, 30 insertions(+), 24 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


