Return-Path: <linux-arm-msm+bounces-33479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBD2993F64
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 09:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89A461C23F80
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 07:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D791C1AB1;
	Tue,  8 Oct 2024 06:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BqORMC6l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE2D16BE23;
	Tue,  8 Oct 2024 06:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728370377; cv=none; b=o6dP6UxRBFfJIb5j3ugViTPOGUX9KkRp2X0hYI6nA1hRNEGbT5c9LeDlr+91OItju309Gc/C5zom9mJg8AsZMfEg9+3IIKbKqfW5mPaNYN43P4W7isKkAdoLqYForqtHWUQvkrqLZ537gY0ar+ZHG5dYKzv0KV+Z2cAroMAJSuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728370377; c=relaxed/simple;
	bh=TmYMLZ96jvXq3r5wT7E8MQYJvfIyxM0I25WLk5CYBEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JS0DPgFHJYbve4Cei72CUTJpPFvKmx6j68b53PWSjQu6WKqAB0bLnZdY8KUDL2hbKXjJhwvxigZQR59Z1q30ZOJrxACQ8HeGTroga39MhD5jK0Al2Z+KVLkrVZLLkeVcgrG8LZ8fnswggrdJLBA02op4l9+bso693sdGQ3IMo/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BqORMC6l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27B61C4CED0;
	Tue,  8 Oct 2024 06:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728370376;
	bh=TmYMLZ96jvXq3r5wT7E8MQYJvfIyxM0I25WLk5CYBEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BqORMC6lGiSTJ6iES13MDpnAZEe730CGTBQ3io4MFZA18V1yR+69pOE8kpzkaMv9Z
	 AYAdXxEWhJoYfJQvdcbE1N28szkCGHBvLnGaLeIeb9vHNngwbMHdUqdJEK3mtNfDSR
	 RsLt7TdoHgnJ8KHy2okIBY0/JbFTOXbkDnYNVeFw9kP7hFOndQi48CH9Y/VexY09nc
	 UogS0+vwD42OBkryWZp8B+IdX3OI22sIQ0qLVQoAkLIUhAfDdpoj6nylORX43mnpti
	 UjxANXflzIK4JcRHUAF4xprY5opuUGK7droG7bjAFHG3aLDN5axcwPH2MbGQmch/p3
	 0HFcYa1vmeiiw==
Date: Tue, 8 Oct 2024 08:52:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org, 
	konrad.dybcio@linaro.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, 
	conor+dt@kernel.org, arm-scmi@vger.kernel.org
Subject: Re: [PATCH V4 0/5] arm_scmi: vendors: Qualcomm Generic Vendor
 Extensions
Message-ID: <knykvevy7rtu4tkrbm2jxpkhzjjkypgpghgsbyzvxkhp75d3c7@5zu6jknd2xrf>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241007061023.1978380-1-quic_sibis@quicinc.com>

On Mon, Oct 07, 2024 at 11:40:18AM +0530, Sibi Sankar wrote:
> The QCOM SCMI vendor protocol provides a generic way of exposing a
> number of Qualcomm SoC specific features (like memory bus scaling)
> through a mixture of pre-determined algorithm strings and param_id
> pairs hosted on the SCMI controller. Introduce a client driver that
> uses the memlat algorithm string hosted on QCOM SCMI Vendor Protocol
> to detect memory latency workloads and control frequency/level of
> the various memory buses (DDR/LLCC/DDR_QOS).

None of your patches are wrapped according to Linux coding style which
makes reviewing more difficult than it should be. And before you answer
with checkpatch, checkpatch is not a coding style.

Best regards,
Krzysztof


