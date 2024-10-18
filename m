Return-Path: <linux-arm-msm+bounces-34873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F889A36AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 09:11:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81637B24ACB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 07:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C4118454E;
	Fri, 18 Oct 2024 07:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PxErCopJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3399317C7A3;
	Fri, 18 Oct 2024 07:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729235371; cv=none; b=gwOSST043rtmk7QCYG4+SzGxS7U1RoTSxk5Yx/T7rpfrrIcwCwApKTVodyl5lG6rC72Gz+/utzD8h291wlBvAp1TbRwxuEREm3treYTKs9aOT3puHtxzkvvX3OtsSlk8ZaOYWUwrk54RcJBgbdvoXCia29+WYa0x6BY2JODzegg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729235371; c=relaxed/simple;
	bh=XnVHZRXwZuASDsv12Jf5a4qqL6UGm2bIGyhu80U4bnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AbeufWbBGkY0HHlKrsoJ69lVk01fGLRWpXprKPvE0hVIPn+7VBrkLkFf3qDtfJm7c5Unw9tjQ3NM/ypd0143tfsguaN3GCOtXL/qB5o7+tQuYzznTW075Ja9HXd5GQ8EoZ8AywafOIVqCvBBi3932FCrV9lWlxeQwICClAftGg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PxErCopJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B5AC4CEC3;
	Fri, 18 Oct 2024 07:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729235370;
	bh=XnVHZRXwZuASDsv12Jf5a4qqL6UGm2bIGyhu80U4bnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PxErCopJeb+R501IYZaLxwxMVYUqB7NeObt2sxj9aCewCzj67OtX6kTYCGDkc31J/
	 Qfx48AjKznRfRqIPvisGU/I49axK9ne78gD0P3uStrxwMb7zJ38RbswWTb8820W1Ta
	 PjwTAcz78lvmj/J5+GhtLB/s1aSsgXQMv6QQJVRkgSZvN+47ePNVzgPb4mbDPyiClZ
	 UQvyIBCb1eQkxizsRIhHeiBL1+q6nJPTDWLQbZqS2rC0t9wAW8Abov+ZsadCXjekwZ
	 PyLtiEDC1QsS7EEtcKUlPNqjALyigPud8bRPAIdUDtQn+lm3FyzOKTg48Et9BygzlF
	 EOGhJabWOmIug==
Date: Fri, 18 Oct 2024 09:09:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/14] dt-bindings: clock: qcom,sm8550-tcsr: Add SAR2130P
 compatible
Message-ID: <getty75tgh72tyet74f3eq5giuevioot5lrc3xe6kderxklt7d@yc4hpg3inj2i>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
 <20241017-sar2130p-clocks-v1-3-f75e740f0a8d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017-sar2130p-clocks-v1-3-f75e740f0a8d@linaro.org>

On Thu, Oct 17, 2024 at 07:56:53PM +0300, Dmitry Baryshkov wrote:
> Document compatible for the TCSR Clock Controller on SAR2130P platform.
> It is mostly compatible with the SM8550, except that it doesn't provide
> UFS clocks.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


