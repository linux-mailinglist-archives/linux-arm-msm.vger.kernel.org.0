Return-Path: <linux-arm-msm+bounces-67054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D622B15977
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 09:17:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01A397AF401
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 07:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108212853EF;
	Wed, 30 Jul 2025 07:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pjgImYLe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D4428506A;
	Wed, 30 Jul 2025 07:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753859852; cv=none; b=qEvkyUFemDCl6MyuCoSE+/1EEDIDsflKC7Fy2IfCqYd3UU90ELJYvshMfDIeCwKv/xGIFSStAfds/flTEVQJN32CukkTUA/k6MEuMAJFjpOWV48R8BSjHv598AMmvR5zFkKkd8pIdcJMyZuRTh+SDjk34hs6NjRv8huYQ1451Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753859852; c=relaxed/simple;
	bh=AIbxQSaDWyTK50yRa2U0EQ+zSYw5GAyiSeDDAH8cuGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApVw45US/wV73DcZl1HRUx6hT4V30Lu6xZvq/oBXRhlOurTBKDEuLUnoyvcvEayc31AZXA+2BJc2b8LIoDhQ5r8inlNIlO37TKO1U1BBxsef6YumBPn9eUG4nCNMmlTSqO4BzweOe/EQIl4lxxBBjvomiZt4YTCDO9I8DeCJ8+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pjgImYLe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE9AC4CEE7;
	Wed, 30 Jul 2025 07:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753859851;
	bh=AIbxQSaDWyTK50yRa2U0EQ+zSYw5GAyiSeDDAH8cuGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pjgImYLeiNxd3dBLNoeElEnsyvi6O0Y66Z3casp2Ym8x/joWoyhZJupI0Y8cAR64/
	 AkzAOrGwiawhFSWYKl3pSSwzh+M6TLp8R95qr/MX+pD3XH3XJ/PAKcnRVEHk/MWJ4D
	 buba5aQy08ODTmBlglu00Khg9gFBNVx41/vDEPnuOvolwAGWGTAWYpxSKhBQasv7zv
	 LphL3uR5PuADKFC6VzumGV3207JX4DcHFaR3UT7/0WPAvlySoP4LsqJrOMlyXjku4s
	 d1NYZ87zSf+8WxqjZIaYab0yYz1hDnRQUqvj7XVOG99UQt9FPU8Hpsj2F+GynOoYHw
	 9Bz2nIDCiWpSA==
Date: Wed, 30 Jul 2025 09:17:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] dt-bindings: clock: qcom: Document the Glymur
 TCSR Clock Controller
Message-ID: <20250730-mottled-myrtle-bull-3ae03c@kuoka>
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-2-227cfe5c8ef4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-2-227cfe5c8ef4@oss.qualcomm.com>

On Tue, Jul 29, 2025 at 11:12:36AM +0530, Taniya Das wrote:
> Add bindings documentation for the Glymur TCSR Clock Controller.

Same question as for v1, what is Glymur?

Where is any DTS using this (or explanation of lack of DTS)?

Best regards,
Krzysztof


