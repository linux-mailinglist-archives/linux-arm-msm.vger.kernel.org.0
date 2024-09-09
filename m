Return-Path: <linux-arm-msm+bounces-31265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A04C9715A6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 12:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F41C4282D87
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 10:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097031B4C4A;
	Mon,  9 Sep 2024 10:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUMz5f6m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C676D191;
	Mon,  9 Sep 2024 10:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879228; cv=none; b=AHsUErGzKjE8XJFnrp/Om3g9eqI0UVEJO6vb3iZwYdUgex1DQCLpFnCyOix+mNUYU9/9TQWCL6/Ibwow/CmeVqJKd9sz0Bn3SuDQsZlTb1s8QT+SEtImKpm0crwRoipcp5o7BovCftgtAHP/epbcIFrptCDmkHG8HNbYddjChKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879228; c=relaxed/simple;
	bh=OW2ouDZXCkWxy3cxd+kufRqhlyPc+ouqgbHl+qBD/Rk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d/8Juty3qzTmB3LmwoGBJrvvIdgC3yJCKKn8pO0dzewjucSTZuQuloYTXpIOEecNp1777hdixwsNlrlHXkz1YmO6ZZcX5H3tMafEb6dOq6DVKb2VRZDcUOrOSLQDjJl4pnnjVyQFQrewgLu+ckWJXIdn94Yh98MpvnM+rRpfjx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TUMz5f6m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116A6C4CEC5;
	Mon,  9 Sep 2024 10:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725879228;
	bh=OW2ouDZXCkWxy3cxd+kufRqhlyPc+ouqgbHl+qBD/Rk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TUMz5f6mp2AzwodXIZHJ++0N/zpQArcPdBF0Z+tPgU89Dou2Fkmpf5/my/S0kyFhd
	 57JAgpezp+WLLJk0BTe2YdUCfND49uQe/vq+JVx2UTtjx4NdWqT98xuZji3y1lQ88f
	 VLCoLCXRTakmmr3/qPKIxUpEmfmGoZVc7f2mtQyClolgpJAd9SHHz+P5L63bxUuTdb
	 cw+Ya1NXfoh6bt4zUT0wGLgKqVsRh0nRBsBQUXrvHpL8UbvofFveO9sq31W8UEG6et
	 KWSzAG1QD4nDTdabUbxW0enZBD4emWuO4xnFPEKhCj/JZfx+ToifXtOmK8YfblKSBz
	 Ub39eJPwwimDg==
Message-ID: <cdc1a7ee-e6c0-4cf4-8a52-1fbe6df64150@kernel.org>
Date: Mon, 9 Sep 2024 12:53:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sdm630: enable GPU SMMU and GPUCC
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240907-sdm660-wifi-v1-0-e316055142f8@linaro.org>
 <20240907-sdm660-wifi-v1-2-e316055142f8@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240907-sdm660-wifi-v1-2-e316055142f8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7.09.2024 8:48 PM, Dmitry Baryshkov wrote:
> Now as the arm-smmu-qcom driver gained workarounds for the Adreno SMMU,
> it becomes possible to safely enable GPU on the devices. Enable GPU SMMU
> and GPU clock controller. GPU should be enabled for target devices that
> have ZAP shader blob.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

