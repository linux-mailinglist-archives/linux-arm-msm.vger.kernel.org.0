Return-Path: <linux-arm-msm+bounces-31267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 666DD9715B9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 12:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23C13281C5B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 10:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01D11B5801;
	Mon,  9 Sep 2024 10:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o15ML7Xn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708CF13D53E;
	Mon,  9 Sep 2024 10:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879322; cv=none; b=WuTh85mHcGTCzeDPn4jr/CW+BXjVj4Cm1+jAJ0wgqYdjfmtC3Qt4Xma9m8kWkrKoprjHjpfkbgL7YLC2ksIb0mGK2zHrx5jpcD0HvwMXU/JX4qj7qKLz5rqH0r1gC5TO+dY9fC1jkGD6CrskqF72TnKTgA2PVxdm6rZ2dtbW+TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879322; c=relaxed/simple;
	bh=6dIX6fDBWfmrxj5aj7B5ZK6B3MK2n1y3yWpKkg4yw8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UBZjeKVWLAaVmiZyILXsnV4cpqKdzWehvVKAVBcrlvvfl3c6qBf2id4tJCCKwAvubZYNU+gvl861MyQZfMpuhpBmPF+4w3LrrPUkg5dsxzW1pR0GfJckiW7xXFljvNzIatjpTlvSk7w1bejQYeA7pDrRyscYp7Db5NvkWRbd8BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o15ML7Xn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED7AC4CECB;
	Mon,  9 Sep 2024 10:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725879322;
	bh=6dIX6fDBWfmrxj5aj7B5ZK6B3MK2n1y3yWpKkg4yw8o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o15ML7Xn0t/nq4M1PIFUcRXbuayvnS6P40AHIdS9UGnenXsYlarMH12VW2XRKose9
	 uM23U5oDFslPJ44SvXPc+shjUdxHJGhV32RoLsKOLhd7Tr2k5dBynDUXQLQRCPXfed
	 U6YqRBRIJXf89ZijEClvWGPe6WHm5Lrln17K/X/oVwjUmJlKPqPWSEEqjippdjcq7t
	 zdxmhu0BAGeEvKbJRrwFSc0OvmmMlgkKKJtkBYxzT29cDjP5byxrL2XbFjHtwIB4s7
	 HeR0GwH5aLElblgMn58gAyoUyGvEO/l7hLZq2/0Lq4C1z4n4HJem3Z47t83RHTpfS3
	 5ZKcmkZIXmJig==
Message-ID: <5f89eb08-bfb4-4c67-a8a5-48d2cd756b8b@kernel.org>
Date: Mon, 9 Sep 2024 12:55:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sdm630: enable A2NOC and LPASS SMMU
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
 <20240907-sdm660-wifi-v1-5-e316055142f8@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240907-sdm660-wifi-v1-5-e316055142f8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7.09.2024 8:48 PM, Dmitry Baryshkov wrote:
> Now as the arm-smmu-qcom driver gained workarounds for the A2NOC and
> LPASS SMMU devices, enable those two devices.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

