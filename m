Return-Path: <linux-arm-msm+bounces-79519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 42482C1C26E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 17:40:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 132074F8105
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 16:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0872E6CD9;
	Wed, 29 Oct 2025 16:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jvUH8KFt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8762BE7CD;
	Wed, 29 Oct 2025 16:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761755493; cv=none; b=O1fVgYeYQ5Hv67X+uua9pGbTKVMmXakEvaocA0qhcFcppxHUOnQZ56ZCYXCL7VQeMaTHeFb50rSwGUw1SBD8qL5NvwOrqC4n13i/4QG2NywtuN6wRPLbKJxWooB6LzJ/iBpTI9tFTiNfzg5YVp3G196wSmt/U4msyL8l7kchudU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761755493; c=relaxed/simple;
	bh=Gcttd7Rfxik+Vk6KHktQNZwAC5E7sEhzhTaIP4LJPwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EAKZpuMkCFSi3A0rEzQMNI0n+GU1KxVvuJ3WRTqbrEc+6NsfavWDiixuQqQkX1AzZwZfunnhSRucqcZEExeNspIleb6qC+GFPpc80rgmE3YUx+Fw2C9jJOFPSu3ZMxiyAmxC+L7c/aIc3/0FTxGNbvSLkFmmTiBUs8XetSrCbpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jvUH8KFt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC18C4CEF7;
	Wed, 29 Oct 2025 16:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761755492;
	bh=Gcttd7Rfxik+Vk6KHktQNZwAC5E7sEhzhTaIP4LJPwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jvUH8KFtu1MQ5QVNObxz20SdC86EZt7PKPb/c/yr+fJxstJQyb6w51dm40B49TGz6
	 qjoTIdxE6iUn5NUDVMl/7nBu2CVk70meTc9DLDzbn8dkn2q9QQ3k5cR3xImWOlp54M
	 +X8S20pfk5ZNOsb0SnNa6N+gYecP2jigR+ILw3NvLlgAivOH73q1KxHH++n4t0IcNm
	 ynCg/3inzzO7vcrdnpY0Drg0nRkLHx1+CivIcQquyNbSsxvvq9ZgEzKSvJKoM/OzYy
	 7/LGYcwXjnYoQX+gYnNaj/bI1kbTZaPLGYr8plJrE0at4FpednvuEVPOv86HQYndPn
	 YfClLQTBYukHA==
Date: Wed, 29 Oct 2025 11:34:36 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/3] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 MTP platform
Message-ID: <vmtm6wy2ldvobgl2o7cqdtknyfg4fup2pqpddkftnhzs5tgqrq@vbo4j2gmr4px>
References: <20251024151521.2365845-1-krishna.kurapati@oss.qualcomm.com>
 <20251024151521.2365845-3-krishna.kurapati@oss.qualcomm.com>
 <r5zjb7v2ngsbx2y63tmdhnm4gbpla5fki4uzpjhvn7sqmzsqi2@7637rbudt3z6>
 <469fc3aa-9b95-4b30-a704-d568a830452f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <469fc3aa-9b95-4b30-a704-d568a830452f@oss.qualcomm.com>

On Wed, Oct 29, 2025 at 09:20:48PM +0530, Krishna Kurapati PSSNV wrote:
> 
> 
> On 10/29/2025 2:45 AM, Dmitry Baryshkov wrote:
> > On Fri, Oct 24, 2025 at 08:45:20PM +0530, Krishna Kurapati wrote:
> > > From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > > 
> > > Enable USB support on SM8750 MTP variants.  The current definition will
> > > start the USB controller in peripheral mode by default until
> > > dependencies are added, such as USB role detection.
> > 
> > Which dependencies?
> > 
> 
> Dependencies like pmic-glink and adding remote endpoints for otg support.
> Till they are added, we can enable peripheral mode.
> 

But this is 8750, Jishnu got qcom,sm8750-pmic-glink landed in the
binding 9 months ago, so why are we spending time discussing this?

Why not just add the whole shebang at once?

Regards,
Bjorn

> Regards,
> Krishna,
> 
> > > 
> > > Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > > [Konrad: Provided diff to flatten USB node on MTP]
> > > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 22 ++++++++++++++++++++++
> > >   1 file changed, 22 insertions(+)
> > > 
> > 
> 

