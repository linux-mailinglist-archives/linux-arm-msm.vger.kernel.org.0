Return-Path: <linux-arm-msm+bounces-31277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A8D97161E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 934E31C22662
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 11:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79EE91B5EDF;
	Mon,  9 Sep 2024 11:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tHoAlgNv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C37F1B5ED9;
	Mon,  9 Sep 2024 11:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879705; cv=none; b=D0hIrHItQVWj2S/9zp+P3pUiwLTP2P38CXNUyYBhVNzI03qZr5fmsnqq7o6ercICO9IV1D6SnHn8YPM+y5OpHuKQj+a1rGSLNuzzNM3SFOG47WHLzHS2U74DFxqlgCSM2r+/wmJi0gjHXPtGoSqDhl+86BMRqU5tHSWfNOsITSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879705; c=relaxed/simple;
	bh=Vu1L7iRCfx2GEoTH7JacVxbBz19fMF6i8eZvCZQp+Ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mc2ISTDt6Ll/k2G4qTF7YoorretrEAXqUxIZiNYh/0kbKZG0Sae0aJtUIhilVcSrQC/gCkHbAyyXPMgOGXCrvOAs4OJWBfHW4snUwqLqbjh9HMRUvEdHYA4Alv00PxmlOyx8VYwmjQHIAaBvxGkbc7Ake/YHRmAegCNISqJgAy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tHoAlgNv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA9FC4CEC5;
	Mon,  9 Sep 2024 11:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725879704;
	bh=Vu1L7iRCfx2GEoTH7JacVxbBz19fMF6i8eZvCZQp+Ow=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tHoAlgNvTBiMw/o9LVCa3MC/liCgXVbaKIKw8uB+BrF+Hxz5bPwI46iyTRGeb/3Q+
	 dMfm+0M+kLMmfB10IUOJTZoUN8rElLBSCteQp3eiN4FQ9YtgHDkjGVA+W3NwMJydur
	 4rbmccouxM18DYKquF2Zg/TgvjcSpxxs0MmXnC2tDp2re7XIgu+u/IJFA9MRnA8Mga
	 A7demGEGH9FWAlBnrwweIHyeVRrhn2gfsGEwN1UpFW7BW61fOh9lUulcHN5wNb/yL+
	 qmOKw+WbmjHKkka8Ajim3mD0BllOlxdhPrlEX4dPZIuVNFHUTIhdZmKDxlwUAOAUU8
	 nrCasK+truhyg==
Message-ID: <f25930c7-d05a-475d-8ec4-8ff1b6a2ec26@kernel.org>
Date: Mon, 9 Sep 2024 13:01:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: qcom: sda660-ifc6560: fix l10a voltage
 ranges
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
 <20240907-sdm660-wifi-v1-4-e316055142f8@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240907-sdm660-wifi-v1-4-e316055142f8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7.09.2024 8:48 PM, Dmitry Baryshkov wrote:
> L10A, being a fixed regulator, should have min_voltage = max_voltage,
> otherwise fixed rulator fails to probe. Fix the max_voltage range to be
> equal to minimum.
> 
> Fixes: 4edbcf264fe2 ("arm64: dts: qcom: sda660-ifc6560: document missing USB PHY supplies")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Oops

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

