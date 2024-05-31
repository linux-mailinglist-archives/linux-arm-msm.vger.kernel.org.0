Return-Path: <linux-arm-msm+bounces-21198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9368D5BA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADC6A1F2286C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 07:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC5174062;
	Fri, 31 May 2024 07:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MYUNwDed"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4132874050;
	Fri, 31 May 2024 07:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717141264; cv=none; b=VQx51MUFtNlocepRT07rGW3b4DGnfum7BYOlgDcFk2/1cyPvcUjDwP80IRDzD8XH8mCDg9Cb65UP/3tFjwDMExoVFf7UCQ+TZy5D/ZXVVwcEbJvnVo3Y2aiynxezTNy9axrbSfmNiFSu7p+t58qahYItyQY+nZQ+RKv3/1V+gbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717141264; c=relaxed/simple;
	bh=vltjejuO7tw9DcgUgSTnpAOHr+n5KJeGLCREj4IgYAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hx9LAqp9Eg8y6cv0tQGWAb1KXLdXUBbZ+zWZ8IVtLXYHnRyC7PSZ9GKdti0Yr9HNytMgWO6qInI263q+hdLYxPc3RpML+1CdZpJsMQ/j5vgPQ1hxdrOLPCf86RjXrUgIG8ORnJkMJ37dOML5LdEchK/IpRszl9DDcDt35Kbgl9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MYUNwDed; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A02C116B1;
	Fri, 31 May 2024 07:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717141263;
	bh=vltjejuO7tw9DcgUgSTnpAOHr+n5KJeGLCREj4IgYAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MYUNwDedUzOc8Fym1z1ZNoTfGbQsWTeHdRPxqK8rWOO7dNU1DRa36JdL3gK1ZjEV+
	 SQw04sOi55gAjw19OlJ9UDzed4E4v9BbUX5ZMgVUkL+ClOjQ5b5tTXLsZovMSje6YZ
	 Q8+XOz2wpDibpUg2T8puQUcLdPWcfRmNWaxJpqLIoz/HuEqXjgbijsysRzydfeuKhA
	 cEDXf2CeYSbhGNuLlMqmbd/3+LOOtX//tLLlbBf7q+Uxoy2r3I7tPqsXVC3UK0oo3z
	 wcKzR4sBZ+YTh/BYXH5Hga6ZuaiZEoU6RJlUMMICWyzsrDxT0DYIF5hKvpOurBwURY
	 hmeTQuhJm//LQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sCwsr-000000001Ay-2xPi;
	Fri, 31 May 2024 09:41:05 +0200
Date: Fri, 31 May 2024 09:41:05 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: x1e80100-crd: Fix the PHY
 regulator for PCIe 6a
Message-ID: <Zll_EUDOu7LJFBfZ@hovoldconsulting.com>
References: <20240530-x1e80100-dts-pcie6a-v1-0-ee17a9939ba5@linaro.org>
 <20240530-x1e80100-dts-pcie6a-v1-1-ee17a9939ba5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530-x1e80100-dts-pcie6a-v1-1-ee17a9939ba5@linaro.org>

On Thu, May 30, 2024 at 06:43:39PM +0300, Abel Vesa wrote:
> The actual PHY regulator is L1d instead of L3j, so fix it accordingly.
> 
> Fixes: d7e03cce0400 ("arm64: dts: qcom: x1e80100-crd: Enable more support")

This patch and the next one is missing a CC stable tag:

Cc: stable@vger.kernel.org	# 6.9

> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Johan

