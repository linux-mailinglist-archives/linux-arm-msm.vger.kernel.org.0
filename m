Return-Path: <linux-arm-msm+bounces-31871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D02E797A99C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 01:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68E1FB2A4BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 23:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0F914B96E;
	Mon, 16 Sep 2024 23:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5EUpS/p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0CAA95E;
	Mon, 16 Sep 2024 23:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726529495; cv=none; b=kQ33H7BpljkLpZtShvoM7L/8crlSrkrhWQ75syZv/9CFWZ0Ji8sfMqQwKTE9LEeIgO6T2/kcNIBrxeZJYlgx/fS8OIWdkV7BQsg29MjTl3w420sZNn3pmBM+9+n4ATI0NB072f0+94HsbuXAyHKF2VVVamiWIvl1CIEKSv/9fuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726529495; c=relaxed/simple;
	bh=NlrtveBbkVytJ0mYOxanL6NWYuPRN/Wu9c5bSft5Czw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W6adlDfyjs2cnroaAvZiiA8OYtLF68lp52UOwgvnubuD3WdOsfpwNY+MA0+z3pK3panylYAt92FXKMrr+NqWTFMxrdBcpUQTTEqaYE+wJUQpi/8f2cw0MihYvmssWfWNNaZvsIGIbRr5fPpYnLBZDhAhpxrtVP3W/chBFDvyzX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5EUpS/p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F290FC4CEC4;
	Mon, 16 Sep 2024 23:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726529494;
	bh=NlrtveBbkVytJ0mYOxanL6NWYuPRN/Wu9c5bSft5Czw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n5EUpS/pv5Y+xIrHurU3ysZxyCyUXx9zG/k3kdX7VJVIrtEJlvYUkPYk8A48+J4kI
	 cQQgijcK/srW2qjIzlpPY/d+PkFsZP7rA6Nz6Muq4AKBSecjbGEJ1Mm+Ppb6h1pyZz
	 7TAZF2EEVSTFut9dq2NjGOPUL7bOhynANAQGfzWbIUacfsf9OKNv3oi0/uX8Nd8Uoh
	 ud9uU2eozt7T2fEQ9CJ/XuC5pFnANshDinlk30kImT2E1nnxHfblGkCx1DP6VJnohk
	 QWxQFQadFXrxJKWBuGkTH3JawWmznKceFjssp6zLjctbvxCNikuQlF7jJHOnEnuz54
	 g9nyn/bAKf69Q==
Message-ID: <d182614c-d6d3-4dde-8faf-d89142ad41d1@kernel.org>
Date: Tue, 17 Sep 2024 01:31:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: x1e80100: fix PCIe4 and PCIe6a PHY
 clocks
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Rajendra Nayak <quic_rjendra@quicinc.com>,
 Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240916082307.29393-1-johan+linaro@kernel.org>
 <20240916082307.29393-3-johan+linaro@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240916082307.29393-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.09.2024 10:23 AM, Johan Hovold wrote:
> Add the missing clkref enable and pipediv2 clocks to the PCIe4 and
> PCIe6a PHYs.
> 
> Fixes: 5eb83fc10289 ("arm64: dts: qcom: x1e80100: Add PCIe nodes")
> Cc: stable@vger.kernel.org	# 6.9
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

I reckon you split it like you day so that it's easier to backport..

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

