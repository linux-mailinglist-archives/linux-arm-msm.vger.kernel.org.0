Return-Path: <linux-arm-msm+bounces-44755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7212DA09618
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 16:42:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 465103A2519
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 15:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5C12116EE;
	Fri, 10 Jan 2025 15:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I3K7u67+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C74E20E035;
	Fri, 10 Jan 2025 15:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736523741; cv=none; b=d+2C/ZpuGipssT3+DppcDnUOy8y+/WaNXGDvbC+5irt6qiP0TyAHsVGsaXbeWbKp0aPRlQD6EzB985PkaYFNYygsgz71FfGhlVG5/sgcUKl+q54ard4USd8VFy5vVUSTy/G1dEFzrIew6cGQLB5jq5rGnQsrilVazNYNEImB/D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736523741; c=relaxed/simple;
	bh=0JbrcSA0wgydpf9KLb5sc9g+DVxsu7epgNB0LdqaTUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P/cRfcBu6W89/2kL2nV9GWLqKIRSHGlVVFqPA3CZ/0W2vUVD7lXGWZ0a3h7rXWWmoYEckEyaLgLs5LLlOcCLgbdo9Mt90zQxmarRkSwQrPv7kWJdcs1Bl1EWIeF0ZaJGLTFYTfY071s4UEnzrFe3lPbSBK3cozjU7UrVPWRR+WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I3K7u67+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC8AC4CED6;
	Fri, 10 Jan 2025 15:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736523741;
	bh=0JbrcSA0wgydpf9KLb5sc9g+DVxsu7epgNB0LdqaTUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I3K7u67+RiLJh2QL7qXFplGaK0NXFs1/Yc2DShHWe7lUpOqDYWNnY1ik71M6GXVad
	 FuqUReNZ684qOWYGnNm5y/jN+r1IQASqEJgqIDxQ3j6mczivot/1DevJG25gS7I4tO
	 WOCP+ygFE6WG3qfZorGmqab2cGccCjxTj+YpyHga1w4yiSm2CzmtIX1byFepme/c8t
	 RCxPjE8AMhWYXBmbOXZLQmFHGdlpAPlpqdNhxSyO7D1Tp6618DX2hBshXSOiR5TEyo
	 GDgVbdEiL3fG2W5wk6xIBMIR5c7H5cJOmLoJIusWzhXIG5D10mU9pabUhqEvRUaJ3B
	 tRAIQVgbwzaVA==
Date: Fri, 10 Jan 2025 09:42:20 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	devicetree@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: input: Correct indentation and style in DTS
 example
Message-ID: <173652373941.2921038.12458464520929067305.robh@kernel.org>
References: <20250107125844.226466-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107125844.226466-1-krzysztof.kozlowski@linaro.org>


On Tue, 07 Jan 2025 13:58:43 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/input/qcom,pm8921-keypad.yaml    | 46 +++++++++----------
>  .../bindings/input/qcom,pm8921-pwrkey.yaml    | 36 +++++++--------
>  .../input/touchscreen/ti,ads7843.yaml         | 30 ++++++------
>  3 files changed, 56 insertions(+), 56 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


