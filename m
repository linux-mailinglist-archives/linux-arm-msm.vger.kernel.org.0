Return-Path: <linux-arm-msm+bounces-29894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BD5963ADD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 08:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5375A286AB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 06:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9919714A0A8;
	Thu, 29 Aug 2024 06:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqxQ68U0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A79C145FE5;
	Thu, 29 Aug 2024 06:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724911396; cv=none; b=U+y8poeoLZt8d7yTwo8gQH929jdp9T5YTR4Q8TVhCXcGXsBmSx+UsiWUTniqc2/qDzj3G8sPvTanWLmv4LeVk4D6z0++AxTIfIGkk8nRNRGmrlmpRbpPxOdk2iWVWseE24qmY3PulVhOAkHl9Bk0tyW8upErFxYDfnpqMVFqrYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724911396; c=relaxed/simple;
	bh=ZyZN3+O1RMfjNpj2t7ozxtV9kKVmDeCujclq/RL61Hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MxYEX4cOo8ChiQUUDLkKrtOsx+b+ZKtJsUqBhfwbz2mZ82qK+1QtGise1g8CuRxLo/aKRC+xn8FWEpHw3U5DsXXFGQwhfmD9Xb3GGJgIpH9SpQmETh+19pwWp1cClddYR64ukeyBB0+SkCQw76RIreEHDKSmVCWcpsohPPwY/v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqxQ68U0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00CCAC4CEC1;
	Thu, 29 Aug 2024 06:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724911396;
	bh=ZyZN3+O1RMfjNpj2t7ozxtV9kKVmDeCujclq/RL61Hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lqxQ68U0hxnFzudj4JdTIkOZN75Cnf5u/UnWHOCW1xpgqB7StIdLDaHYxZ8iy1KWN
	 yoM2EavIr3CsfjYTRuVFDVgjKyzRrY34q/4+OtSawvtm3H2MfrrvKJZmwbZDYR/xq1
	 smQEHSJn52eketipXg4ry+tuGd0pKHZ1XOAT0UVMeukh3OQ0C9ALqpuDik63ajpSRP
	 Z1IjEj8anL5qWKrMFga2PpQYUV+UWRNlfgwg4mDtJBdqttDsnWngHGKSpjoywg06Hp
	 SCPKKFyD2/hjUOEnXpSFps9FMtV7fS+4j10Tyz77s/PNwtIR3Y5E5YzZLASUnH3d0P
	 ZDhqrEnC4EQ0w==
Date: Thu, 29 Aug 2024 08:03:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Lenovo ThinkPad T14s
 Gen 6
Message-ID: <meradugp7orfvb2zmesakv4dzoylgrtcxrv5775ytrfrq63grp@onsr5idj2h4i>
References: <20240828-topic-t14s_upstream-v2-0-49faea18de84@quicinc.com>
 <20240828-topic-t14s_upstream-v2-1-49faea18de84@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828-topic-t14s_upstream-v2-1-49faea18de84@quicinc.com>

On Wed, Aug 28, 2024 at 11:32:00PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Document the X1E78100-based ThinkPad.
> 
> X1E78100 is a binned version of X1E80100, hence use the latter's
> compatible string as fallback.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

You keep skipping my review...

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


