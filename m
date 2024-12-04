Return-Path: <linux-arm-msm+bounces-40312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F799E405C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 18:01:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43C83B34674
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 16:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D8B20C495;
	Wed,  4 Dec 2024 16:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmH3ok77"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA2013D246;
	Wed,  4 Dec 2024 16:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733330682; cv=none; b=XwQ8M5lpfcnazLiLMTBRIL7qT9zww3+LB9EUFDEgOrhKvR620VltB6tXAj1cCZ66T8ScJ+3fb+CZn3e9aDhRdJMg9PZ205jspuhp2QoxnUfLXT86TYGHbWmK4byFrDp/Dfz1WLkE9e1aWTNqVGUXfYADxmtwIENxsuPlDNRNMN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733330682; c=relaxed/simple;
	bh=aDEIjupiYQB81aNzzT7Hp+gUMAsckfJIInLxXTXx3vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7bRUHvBp2KNFMtmUiGOwSAQEXN+lpLGQTpVT7JZy6MtnCcGUxiZGWTdHV6THo6IpGZQoDUsgn/DOwHNbQj24glWj9680Ab46Md0wAPNcp/qKmAK92fv4zX5f4Xwcm2nZLYeveISsqhwK4TC0lZByjM/SF6P0/eXnNv+Ni09eCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmH3ok77; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46E07C4CECD;
	Wed,  4 Dec 2024 16:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733330682;
	bh=aDEIjupiYQB81aNzzT7Hp+gUMAsckfJIInLxXTXx3vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lmH3ok77Izy09A9T+H0c56jK62j13oTyB9dYi8uvXiR9O/LuA/oIX5amcmLt9dxGl
	 wa7+mXe2nVTdV48I8Je0QEbXvEgv6RreayeWutyYmoN82P9j9K0z0qQdYzH7B2T/on
	 SeN+f7i1qfinJ5nT9KoBuzgjUkyrfpqVfENcy1KgisYXuIdzChppajNd6QtrDJZaek
	 okAOUitwVknPlIw7xSA6+c/o3nba1pM04Y77fvfZWgxG8PYgNYWRKqWIMIdnB7p4Ov
	 36764pTPYOjr+Nlmali9UM/hCpJt4VZ252/+gCDuzz4N66+HP32A3DDRvHjb/zBmTJ
	 EQg8mYtMhTGxA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tIsUR-000000001Ov-2A2O;
	Wed, 04 Dec 2024 17:44:40 +0100
Date: Wed, 4 Dec 2024 17:44:39 +0100
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 0/3] More Surface Laptop 7 features
Message-ID: <Z1CG904RWBO4K0iE@hovoldconsulting.com>
References: <20241129-topic-sl7_feat2-v2-0-fb6cf5660cfc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241129-topic-sl7_feat2-v2-0-fb6cf5660cfc@oss.qualcomm.com>

On Fri, Nov 29, 2024 at 06:20:24PM +0100, Konrad Dybcio wrote:
> This series does the necessary plumbing for audio (alsa ucm & topology
> coming very soon), dual PS8830s and the PCIe3-mounted SD card reader.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Changes in v2:
> - pick up RBs
> - sort some nodes properly
> - drop PCIe port power supplies, they are on at boot and will be
>   described in DT after a suitable binding is created later
> - Link to v1: https://lore.kernel.org/r/20241122-topic-sl7_feat2-v1-0-33e616be879b@oss.qualcomm.com
> 
> ---
> Konrad Dybcio (3):
>       arm64: dts: qcom: x1e80100-romulus: Configure audio
>       arm64: dts: qcom: x1e80100-romulus: Set up PCIe3 / SDCard reader

>       arm64: dts: qcom: x1e80100-romulus: Set up PS8830s

The ps883x driver and binding is still under review so you should have
at least mentioned the dependency in the cover letter.

And then merging should ideally not be done until at least the binding
has been merged. Hopefully (and most likely) this cycle...

Johan

