Return-Path: <linux-arm-msm+bounces-4224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7E980CAB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 14:21:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58F011C20CAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 13:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF623D980;
	Mon, 11 Dec 2023 13:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="wO4JFVbh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [IPv6:2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id ADEE2C3;
	Mon, 11 Dec 2023 05:20:56 -0800 (PST)
Received: from 8bytes.org (p4ffe1e67.dip0.t-ipconnect.de [79.254.30.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id EDD521A44AA;
	Mon, 11 Dec 2023 14:20:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1702300854;
	bh=k8UNSBAVgRXS6Dhpbyra/RJhgjDKIBpHGX+kNVBZNVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wO4JFVbhOJqAAa9UhOL1vlYp4E+Pq8SJdKRMas8p8iMhwN5dvh4oppfaQr9svFDjZ
	 k0D0a4WmDo4rjtSXunVfLRjkVWUH2buCO6E5cZZilyE/LvI/GjFKFWouZmmCbXaPUc
	 TTVpl1XfYoeGzg/fw1nEiwD20Wi0Zg3FMv1JnajvDXywiwykyfhUKoSdvTVKQWW6KD
	 Re6+D59HtS7Qfz4eOEX5bF2aYOH/huLzRpO1+1MIxl6xUB5GGIsKqpXLCmY1+XIAHS
	 G8NUoiIQXwTGdraayNrcJSgoMcw9xdznKvM4qm8s6b0fI2ZBi9q3gs1A2yO9fUEh8/
	 v7W5gZc8VHglg==
Date: Mon, 11 Dec 2023 14:20:52 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Will Deacon <will@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Clark <robdclark@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	iommu@lists.linux.dev, devicetree@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/3] iommu/msm-iommu: don't limit the driver too much
Message-ID: <ZXcMtNrJLb9_W-lH@8bytes.org>
References: <20231207125500.3322229-1-dmitry.baryshkov@linaro.org>
 <20231207125500.3322229-2-dmitry.baryshkov@linaro.org>
 <6397268c-7990-42f6-9453-44fdc638d5c9@arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6397268c-7990-42f6-9453-44fdc638d5c9@arm.com>

On Thu, Dec 07, 2023 at 01:06:09PM +0000, Robin Murphy wrote:
> On 07/12/2023 12:54 pm, Dmitry Baryshkov wrote:
> > In preparation of dropping most of ARCH_QCOM subtypes, stop limiting the
> > driver just to those machines. Allow it to be built for any 32-bit
> > Qualcomm platform (ARCH_QCOM).
> 
> Acked-by: Robin Murphy <robin.murphy@arm.com>
> 
> Unless Joerg disagrees, I think it should be fine if you want to take this
> via the SoC tree.

No objections:

Acked-by: Joerg Roedel <jroedel@suse.de>


