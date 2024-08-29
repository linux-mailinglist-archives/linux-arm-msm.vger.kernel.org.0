Return-Path: <linux-arm-msm+bounces-29992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7CE9642A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 13:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B5B2286BE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 11:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5980C1917C6;
	Thu, 29 Aug 2024 11:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ubZi3w8x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B810189B95;
	Thu, 29 Aug 2024 11:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724929608; cv=none; b=aLU9ImN6a5pDN5wJNpEVFDJJ53YwaERF1D6pCDIjm8s8sHFX+R2ZREDb+mHsq+WxQ+bZXmZHsAbK7eoyfGDoJrgBiJeYN3NWTYMQjOMIzDquSOtsugA+zHH9V8ElTuozGlMFMATdcHhV9+snNBtl4k7rEtuYD9rY5aO8VhJVtQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724929608; c=relaxed/simple;
	bh=fg/Pr9Xu9fIkWG4EBqfPavp/9fNb65GBV6otyYiBVvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HfeAhw+vUYK3KHqfCIOvufZIPzKRZxWUAC6lUZhbMeYNlfaguEEPtUcQ2dSHYSMjIK6fO7a3N1RzkgEbNiSxluUqeM0U6ffK9PlSCGc4oirIstLYWbksnXW5XtAz+USfxAA+hmnwlFAJ5QpTGqkTHZq6YXrjuWiyNMHGN6e6hPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ubZi3w8x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DC4C4CEC1;
	Thu, 29 Aug 2024 11:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724929607;
	bh=fg/Pr9Xu9fIkWG4EBqfPavp/9fNb65GBV6otyYiBVvQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ubZi3w8xP8xTAKbnCBG1uKicwv3mIjrvbnZiZ0jZS42OEeJBQYMG1zsVJIRpu5fje
	 O0M8BeKz29VQAhIWrZxc6fFxvVjSVrhpbKk+aI5OYFPybIvP7WfL1tNmZpFKOqPtV1
	 pmDO6H8LpoEFL+Lw/P4Z63DRA1fVJD7EzxJ7qemFv8Mp+LwI/Y9AySGV1zlDO/URY+
	 UonY5otW+50QDjH8UZfoamFuMo5xxUgPZomDaiusU1U+IX+d9Eiz8PDX0fLIFoZ9G3
	 EjYml9btFqg1L1WrypXxhEkmyrrST3n5o+We/SWBL9P+x/cPAV9HMCNF8fJehVcJzb
	 btl6mqPzZ9SWw==
Message-ID: <b2bc241c-ed17-48d2-b665-50f9aac9daaf@kernel.org>
Date: Thu, 29 Aug 2024 13:06:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: add NXP PTN3222 eUSB2 to USB2 redriver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240829-nxp-ptn3222-v1-0-46906bc4747a@linaro.org>
 <20240829-nxp-ptn3222-v1-2-46906bc4747a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240829-nxp-ptn3222-v1-2-46906bc4747a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.08.2024 10:21 AM, Dmitry Baryshkov wrote:
> The NXP PTN3222 is the single-port eUSB2 to USB2 redriver that performs
> translation between eUSB2 and USB2 signalling schemes. It supports all
> three data rates: Low Speed, Full Speed and High Speed.
> 
> The reset state enables autonegotiation of the PHY role and of the data
> rate, so no additional programming is required.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Tested-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad


