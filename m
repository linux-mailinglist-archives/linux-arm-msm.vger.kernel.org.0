Return-Path: <linux-arm-msm+bounces-74465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 403DDB92C2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 21:18:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CC551906102
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 19:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A171E3191A1;
	Mon, 22 Sep 2025 19:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qDSVkCoD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3462D739F;
	Mon, 22 Sep 2025 19:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758568718; cv=none; b=u9Y+jwfLuL6Bc2Isjco3HIgNb3Im4SpMqWj21T+gzyg/QvPBNTlLrN2PXxHYQLIuJOmzo7eYkrGEQXntI83nh2DcW9kJ+oWG0AP+2DxDOihIEH0c4pXf9X1d4VrIvjbVdpFmSx0TOpptJ/2nR2L4zPO1TPG/lcF4KqnttwjkbEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758568718; c=relaxed/simple;
	bh=+6GthuWD7OfS7LclSstUGvru0X9bBCDJ1/9Qumd0NxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbxvPfW9PzZjrstbCPyr4fbDl3yT2hyDtjvAQ/EN2kliZBqThwHqvEZe+++UcQNwYksqM4/ca1v+haCoYLl9j78I5mBa+5xlEn+sqVjFHizo/d8WV9+CbM9lzcDkYcp2KAT6PQCmnFU2xu7D5pKDkTXX9jWDA9YvfSyx12zDD0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qDSVkCoD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC3DDC4CEF0;
	Mon, 22 Sep 2025 19:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758568718;
	bh=+6GthuWD7OfS7LclSstUGvru0X9bBCDJ1/9Qumd0NxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qDSVkCoDtsIsXX49GOFjZCJ4xt0bubXj0rvP+UuSUJtJ7mJ4bl4MLu3PrqGjdJUaP
	 8fUF4TsR5C6T+O9QDb/rM0PVCC9Np6Qa8hjYr/azg1E9vNqp0Ruw0fXrXYN444WcG+
	 cGL2sIVzDPwos8P+a1XPxYFB6cQJq6SyfrDP3sFbh0IkcakDYZ/a49X1qM0jyvHv77
	 H+Daz23i62GGk6fe9QpwV/1QYJvIq+a73Gb0Ok2HyoDth5Ltk9JwNaAwaZmIkTDDGw
	 MpPeYSa0Fd8EYzmHs0jm5UVFKFKLLLvZYFNiFRS+iSXCPccG0h5nM7xip1/2wMs5mh
	 II8Q06ApCzSfA==
Date: Mon, 22 Sep 2025 14:18:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: dispcc-sm6350: Add MDSS_CORE &
 MDSS_RSCC resets
Message-ID: <175856871448.840389.12273232916869077124.robh@kernel.org>
References: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
 <20250919-sm6350-mdss-reset-v1-1-48dcac917c73@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-sm6350-mdss-reset-v1-1-48dcac917c73@fairphone.com>


On Fri, 19 Sep 2025 11:57:23 +0200, Luca Weiss wrote:
> Add the indexes for two resets inside the dispcc on SM6350 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  include/dt-bindings/clock/qcom,dispcc-sm6350.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


