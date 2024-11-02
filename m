Return-Path: <linux-arm-msm+bounces-36832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B8D9BA029
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 14:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 456221C20F70
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Nov 2024 13:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F337E189911;
	Sat,  2 Nov 2024 13:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ummwtIk0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52ADEAC6;
	Sat,  2 Nov 2024 13:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730552538; cv=none; b=hmI7C+faDPt4bJ0HBj78MgqnapCIbs7N7g0b3grX6+b3z6AXlccOEV2lfcrvlh1PF7qe9fIQbZHdjbi7pM1fIhw48aHkT2HuCYTFZ1Nyvs4DkxuTVJcvobxUtmpE9agP8IlcLcOYRVRqth0UQQzYotJ5EuyM1SkAmG1jBpYD4AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730552538; c=relaxed/simple;
	bh=7W8ecw9iKDX42Va0103cXROcPqELbw7Dq4r9AhyU8iI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j2Ii5g8ZuXNXShBIUV6WyE/daKmX1qGOIaB4kC/fy5fHweT9mI2yGjGMzKF6ttMZymihdQAXb/W/xmHahVWQ4+Gef9rAgysqwmaYIjuavp87bTDF1I0CvExgZqumJG0ykjDQohlYtJWSHeojEyG4x8h6H4wA8E3Y2TsWiwS3T7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ummwtIk0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629DDC4CEC3;
	Sat,  2 Nov 2024 13:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730552538;
	bh=7W8ecw9iKDX42Va0103cXROcPqELbw7Dq4r9AhyU8iI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ummwtIk0fBkH4u2coz36iBA1QCn9LCjkVSO7gJH0ENGGTbenuTWjetU+KP10PHhoL
	 0JYqvCrQoqQKQLEjqwFt1Q8kRVdMtx/+vjOtclDIkz4v9ibt9h1A7CxkaKTfHerDU+
	 7cJAhwp5gI6cW/i/MZCgDs2/LRE81NMmS7nUXB5CLBYnI43odCYednbWnM2JL6ogWZ
	 8KneQKQjQ4SFLpszofmjjVJvHkLqdgm5wdkZ/qeAZKtdgy3jtCAxbVbm0B05E7q9nQ
	 XfFeK1gbIw8kDIqgfc3OXW7AEZtcnZtAn7qmEZgod9ukuK8CEIe16T4USIjtjpLrI3
	 xYLAcC2WSJ0iw==
Date: Sat, 2 Nov 2024 14:02:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 03/11] dt-bindings: clock: Add Qualcomm QCS615 Camera
 clock controller
Message-ID: <dn3pg3h7fis2hn7pgkw3qwfkvbmf5tezowbkbqp3mzd6jcir6q@fffo2jjwcjgq>
References: <20241101-qcs615-mm-clockcontroller-v2-0-d1a4870a4aed@quicinc.com>
 <20241101-qcs615-mm-clockcontroller-v2-3-d1a4870a4aed@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241101-qcs615-mm-clockcontroller-v2-3-d1a4870a4aed@quicinc.com>

On Fri, Nov 01, 2024 at 04:08:15PM +0530, Taniya Das wrote:
> Add DT bindings for the Camera clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


