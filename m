Return-Path: <linux-arm-msm+bounces-56453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E762AA6ADB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 08:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA811982840
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 06:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62BE7265CC2;
	Fri,  2 May 2025 06:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZ7iPGdN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0EB265630;
	Fri,  2 May 2025 06:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746168307; cv=none; b=FYV/fEd3rSmc9u8JaIlO9G/MESo+DlDUdG5ggchE9P0ik/eGJix2c2kEYOyLKSboYiN91Cl+z2X+urOeTXNizdKk//rxhgv+m4LJV0hWVVq60vGWGBwtW5Cbp0BpM0lHUZu7DAA54zxUzKZZPskpPqyK/lIy23H900QWRevV4o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746168307; c=relaxed/simple;
	bh=QJ9aTTHTFxBlToloo+uiwvGhJoAcVpC6OfCdpgOOHG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7aGg0m407prtCxHmu9CPGqQqPlg8rkaE4czFySRaNzurAdHwO86VQvcYLEVY37wVjXpu1OYraxPcRAIxOEhXiwXSvU9Tp5dA0eMsgiGJxR2UmJMZ3TyoMVOXR8TPioEvrqHsNjuWUuzJWJk18Dli2co0LLqTvdIVT3bb5h4bLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nZ7iPGdN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086B9C4CEE4;
	Fri,  2 May 2025 06:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746168306;
	bh=QJ9aTTHTFxBlToloo+uiwvGhJoAcVpC6OfCdpgOOHG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nZ7iPGdNJcuyoJwjmQkBAzbrXcrtwZnLUVjTEE2vx5fpASFTArz8eNnClm6gXW1BL
	 I/rEDWlHG2a++qirzWV2fsiYgaObArz1sDPLyrDgyHjJPG/kvLatrpFo9ehJQJlWHL
	 xzfhgozf+LaQpPgItn2roLerMspxEeDLuc/fDwhzsZeC4wDm2op8ZyQukkhcFCPklE
	 1u33rDjjy7HtCGJfH9AYccAeXsK+Bs75nFPEACQg+mfFoNrEr1xqyn+x11k6ff28rX
	 k1QigNFOX9/K5a6qp7f2luOIhybvG+38H1QZfCWC3CQnjc2r9Jo/f2ZMpB/0/8VIWP
	 mJYhXVl2f07uQ==
Date: Fri, 2 May 2025 08:45:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: qcom: Add missing bindings on
 gcc-sc8180x
Message-ID: <20250502-singing-hypersonic-snail-bef73a@kuoka>
References: <20250430-sc8180x-camcc-support-v2-0-6bbb514f467c@quicinc.com>
 <20250430-sc8180x-camcc-support-v2-1-6bbb514f467c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250430-sc8180x-camcc-support-v2-1-6bbb514f467c@quicinc.com>

On Wed, Apr 30, 2025 at 04:08:55PM GMT, Satya Priya Kakitapalli wrote:
> Add all the missing clock bindings for gcc-sc8180x.
> 
> Fixes: 0fadcdfdcf57 ("dt-bindings: clock: Add SC8180x GCC binding")
> Cc: stable@vger.kernel.org

What sort of bug is being fixed here? This needs to be clearly expressed
in commit msg - bug or observable issue.

Best regards,
Krzysztof


