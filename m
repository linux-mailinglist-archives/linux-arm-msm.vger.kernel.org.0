Return-Path: <linux-arm-msm+bounces-81335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D27C5096C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 06:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A7AEC4EAB2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 05:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C4C2D46C8;
	Wed, 12 Nov 2025 05:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igM6S1Vc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696D822FE11;
	Wed, 12 Nov 2025 05:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762924440; cv=none; b=QwFLhcVANQxaoPHeV8zNILHT1WhscHHRfJz8qC86e0DeiyC6Z6cG0CoEFI01fXfxfvXVXFpj/Mxg+ODblvhg4ndOEBFum6dmRnJM0SESztRFAKZNLtJPfAX1b6FglAvjZXtLKekgi4h2M0dMWFSe9fvYwMWbancXTe0+5jjSTSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762924440; c=relaxed/simple;
	bh=FpbAf0md5r1dab7p6Cf2Mtc8G58LQqSdPRFwXw8QawE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TqbNsG4chpHPtESe5iXBRcPwZVWztRV5HksYfaFSf2eqzxz06sc0y6jubWc0Dx1AiG4wyXrqQnSbg3k58DyUpfRwY0hgxuB0QjqAgi/gHt5OW/SvFbgDYd314R6Fi3T4evyYnXYbZK9e6ZwrjcMn/c3mzYicFyQ3VxYQcHOLrG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igM6S1Vc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227CDC113D0;
	Wed, 12 Nov 2025 05:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762924440;
	bh=FpbAf0md5r1dab7p6Cf2Mtc8G58LQqSdPRFwXw8QawE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=igM6S1VchLFvniDhk5TU7+j0/2jj8TXs7kz66V+22pfcjudHLClLSrwpfQcOUmocu
	 4qxzl+4QxjrIdbjkd33ZlQWvwzOxWon3dAKeXpK+D2TeivmGUsfoMVqulKDtVmLMwf
	 Xt1aa3+xWjV515xXTn55ePGsGopZ0XFUzRVxTaH0Hsy4DeoDeXxsVTzRrq+DKALSki
	 QcvkznKxr99km4ByJLv2v3G2JSre2gLvjGOzZEWv0zw7u/z5hl51AsX2Imtijfy9/S
	 3WKpC/pSjE2JtDemGrEkyCLkOqCGPPuyK8vmiZQahlSWl2fSqqRY2uBY8fRnCQQOYk
	 5mnW+0f70tXTA==
From: Vinod Koul <vkoul@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, alexey.klimov@linaro.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/7] soundwire: qcom: add support for v3.1.0
Message-Id: <176292443636.64414.2660018772717821461.b4-ty@kernel.org>
Date: Wed, 12 Nov 2025 10:43:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 12 Sep 2025 09:32:18 +0100, Srinivas Kandagatla wrote:
> This patch series adds support for Qualcomm Soundwire Controller
> version v3.1.0.
> As part for adding this support, a new macro of_property_read_u8_index()
> is added so that we can remove the qcom,din-ports and qcom,dout-ports.
> As v3.1.0 supports more than 17 soundwire ports. Also due to change in
> the register offsets, new entries are added to the variant data.
> 
> [...]

Applied, thanks!

[1/7] of: base: Add of_property_read_u8_index
      commit: 4a4806d2b390f7569f0c1b86a3749409810a506a
[2/7] soundwire: qcom: remove unused rd_fifo_depth
      commit: 89eed81ac2ced9ffdcf0b2cd5e16b89a2f1eae14
[3/7] dt-bindings: soundwire: qcom: deprecate qcom,din/out-ports
      commit: e6b9a5904aed55e958a8ec6b511801512b7eec5d
[4/7] soundwire: qcom: deprecate qcom,din/out-ports
      commit: d7082b941ebb742d63b60fa19278fb8a9e31ff6c
[5/7] soundwire: qcom: prepare for v3.x
      commit: 3edd93d75486c08f40e8017d16dd67f8405a94e6
[6/7] dt-bindings: soundwire: qcom: Document v3.1.0 version of IP block
      commit: 6ad5db5b5ac689d3e9576d374960b2c4364a00f8
[7/7] soundwire: qcom: adding support for v3.1.0
      commit: 21edb9ad7e9383bf2c310ec0ca75694c61811918

Best regards,
-- 
~Vinod



