Return-Path: <linux-arm-msm+bounces-31279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A05CC97162D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB6221C22A12
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 11:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A20DF1B5EC5;
	Mon,  9 Sep 2024 11:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qGT/dnK5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74474167271;
	Mon,  9 Sep 2024 11:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879848; cv=none; b=aZCoLn4mOWhx/sfD1pGD8kZfXl9ANjKgz/If3uqipV25WCS9ma78EedldWraqMVbybV2Qb8T8akbPTfJvNllGN9et0jtFl4AhPkKypMMomwV2eTcxsCfpv3fPjOumELQyJ0Ci5LhR2LhoZCGJQG7kb84Ep1Tz04M0UR95X5vDUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879848; c=relaxed/simple;
	bh=rQG+71X5dMYuzukcNsFCsP7U8YiVjahwLWlqQFcqFpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i/p+ob5PWQKdXRv2AYzYiIq3p82/WA6spxGC5mEs2KiAmNFGIRMQ5yYxVh0gtATMS7bWq7HBqFwsL1J8vn4ntmYvpnCeDvtJoi5vqbrNUeo/fJagA552aAB8xrE/pXQbu1srJ0o64RCeK76yJRpWJ4LsnSr734Q+/jKxjQpQnwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qGT/dnK5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDAC3C4CEC6;
	Mon,  9 Sep 2024 11:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725879847;
	bh=rQG+71X5dMYuzukcNsFCsP7U8YiVjahwLWlqQFcqFpo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qGT/dnK5BVF9Kfm6immjZp1idHoqUjF2w4Cipl2HU6e8SO7EQUadc8PoA6BdG119t
	 Xhx8L5JLNOKOvqIICqH9iJTcujHmvFk13+Y9W3Sln0nswakhv2WXVYVJv/K3lfLElP
	 yUE6Y/LGmi+r3YoU/32zpJs+OWqntlzux4oYWLCnfQIdtLsfqNv0RZ+vfd6b13uu7z
	 CQW8Svp+473bfYe90O6ys/WtxuQGlJzS7Mx+/7axmIjJwU+mqXlYk4AKuvAGYfKSUM
	 SfTIdQbiYji8KKmRvZqHqBiJqhNhjUnSElp0KnKkoy+79DvAMBOuoZ+2PRSbXSU2U6
	 BpV/p2xc9H87w==
Message-ID: <6b9c2261-ae09-4068-ab5a-6ee819c031e0@kernel.org>
Date: Mon, 9 Sep 2024 13:04:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: qcs6390-rb3gen2: use modem.mbn for
 modem DSP
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Komal Bajaj <quic_kbajaj@quicinc.com>,
 cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240907-rb3g2-fixes-v1-0-eb9da98e9f80@linaro.org>
 <20240907-rb3g2-fixes-v1-1-eb9da98e9f80@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240907-rb3g2-fixes-v1-1-eb9da98e9f80@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7.09.2024 2:51 PM, Dmitry Baryshkov wrote:
> Newer boards should always use squashed MBN firmware instead of split
> MDT+bNN. Use qcom/qcs6490/modem.mbn as the firmware for the modem on
> RB3gen2.
> 
> Fixes: ac6d35b9b74c ("arm64: dts: qcom: qcs6490-rb3gen2: Enable various remoteprocs")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

