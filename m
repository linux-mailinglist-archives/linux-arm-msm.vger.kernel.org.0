Return-Path: <linux-arm-msm+bounces-31266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CCC9715B6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 12:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C94B3285020
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 10:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2C31B4C4D;
	Mon,  9 Sep 2024 10:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BMzcnzXy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E03167271;
	Mon,  9 Sep 2024 10:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879308; cv=none; b=lhtkpRxF7BP2gXj2obufszYBIYUTf9yU9G8fdqNqIUhSQPjB78Sj9gzI5+8ryVpdGvXQFgEh9vZQaUevpYxuDnZ1ENrKfhk5qO2enFz2nZArvM9GEAvuTTl53+vShDD9lJer7/ZLIWKHmM02p+EO+mwz/ZOL4uQfZ9NrHLF9d64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879308; c=relaxed/simple;
	bh=vulBngzA2JMSmlMiPWSHuatUz7yB+w9sjTQG3/c4syQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FJ8jegMNdP3XxNlNyEQzkGBdvEJuCLNQy4OPdp1X7IFEwoPypTg3KrUmBU4d92runA3GFVzs6bs8QuKL1j0CcRJyKd7p9RpiftICQSSNqHD/EuN4jHlp7SkE/9jY3wyFlGhqmLVP1TPCh6T8FniRinBMmIG26eoKbKIJjMwO6GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BMzcnzXy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE0AC4CEC5;
	Mon,  9 Sep 2024 10:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725879307;
	bh=vulBngzA2JMSmlMiPWSHuatUz7yB+w9sjTQG3/c4syQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BMzcnzXyGXd4O6C6bjgU9kmLDYRRVWixvggYtoyGWvREUC0/aOra9+of67lYQDyB5
	 7+zzS2RRHYL025d/Zaa7/y+Rv3YQNxL7BsQArpmAsoK8GZfKcanyAOdGupjnU1DjXO
	 V9vn4nMrVCcqKOxsLqaTVzWVQ7cawEocvPVFgksiFziRvtfmPBVjn3rX2kyB0LH5r7
	 tYSxVgA8hGOGToRhlP0SCseNR6tXcqEu6wsikBhaWJVIo4ekGVTWDvCV9mRW5vI4CD
	 FnWjn5oPQqd0FOwohcCMEYcg2ao0jh8BA/GeheqEq47FCWCWx6WU777O+3fkaBnE7I
	 4luP2hpJkKzTg==
Message-ID: <7265e8fd-0e0c-479e-b949-b374ce561386@kernel.org>
Date: Mon, 9 Sep 2024 12:55:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sda660-ifc6560: enable GPU
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
 <20240907-sdm660-wifi-v1-3-e316055142f8@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240907-sdm660-wifi-v1-3-e316055142f8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7.09.2024 8:48 PM, Dmitry Baryshkov wrote:
> Enable Adreno GPU on the Inforce IFC6560 SBC. It requires the Zap shader
> binary that was provided by the vendor.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

May I ask you to rename adreno_gpu to gpu for consistency
with other DTs?

Konrad

