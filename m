Return-Path: <linux-arm-msm+bounces-41528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A55989ED053
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 16:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93D8E28BBFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 15:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849491D9A5D;
	Wed, 11 Dec 2024 15:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QDgJfxW7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53770246349;
	Wed, 11 Dec 2024 15:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733932091; cv=none; b=l1SdRishVGQ+5L+b0OPtrjEYKlacfmtF5Xz2XQx/hXu+h7Xv2FYc0+2LbDXXFhw1mqjf4Ur9BTPXaw+phegD2nUe0ZSFLr/QP8pgxn/xQ6leJU8Qcv7gpnIbQyjEnp+n73vZBJCAgr4c/4b94dR7tDpqbvdSKukfYyGM89M68+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733932091; c=relaxed/simple;
	bh=xeXUrKq1VEB8ey8qNxSP1xuOrXdj3Vug8+48gWTfqSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gT6e78J12zqDA4pwraMv5+FhlRZX33rdXLH6/nDv8TRRs4MHs+sG3eeKy7athwnMgj0m0ss6dQJo2ph7MRFcq7VlX7pNGmH8+fpwJrJcO9MQYomb20dGqc+ldc55H4plGav4szhqnpBcG+7f9FZYzA5GPAjuIhqiR7UyviwohC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QDgJfxW7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F8E6C4CED2;
	Wed, 11 Dec 2024 15:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733932090;
	bh=xeXUrKq1VEB8ey8qNxSP1xuOrXdj3Vug8+48gWTfqSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QDgJfxW7BUCUoFU6Y8PFna6nm45LEfHdKuQPuiO6ZProjbxDV6Al2T2vr76vdqR9C
	 VaBw+4aZzdoSleFpSv/VYcvibjWBBSA9AKOqeS9fgGLqpLDvdbChQ9TALiLbHrqQR2
	 WOXr8TXk9yqjrRXDxHfmUWZ6Jxpmtko8bOPNMcX3Ik4yhWFl//ewR671KqJmJ47LZU
	 e/2HNQBqFuFSpo0ON50W9zwHFvgiDbPzmsFK1aWnwCE6bWa5+IZ54S3VUALdGoo4X4
	 OmbE7guGiqUOsl8oFFnPzOOUJklFn7CYfoInSzZaWKY7u8rx/BDKZ2adsirlakktoj
	 /OKnWgxaNka/w==
Date: Wed, 11 Dec 2024 09:48:08 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: clock: qcom: Add SM8750 video clock
 controller
Message-ID: <173393208778.3087438.15451207086861596466.robh@kernel.org>
References: <20241206-sm8750_videocc-v1-0-5da6e7eea2bd@quicinc.com>
 <20241206-sm8750_videocc-v1-2-5da6e7eea2bd@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206-sm8750_videocc-v1-2-5da6e7eea2bd@quicinc.com>


On Fri, 06 Dec 2024 23:07:12 +0530, Taniya Das wrote:
> Add compatible string for SM8750 video clock controller and the bindings
> for SM8750 Qualcomm SoC.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
>  include/dt-bindings/clock/qcom,sm8750-videocc.h    | 40 ++++++++++++++++++++++
>  2 files changed, 43 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


