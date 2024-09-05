Return-Path: <linux-arm-msm+bounces-30902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E584B96D8C8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CC861F22CC0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 12:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A8219B580;
	Thu,  5 Sep 2024 12:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dh6TlXH8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F5419B3E4;
	Thu,  5 Sep 2024 12:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725539939; cv=none; b=nz7ezMANN4MGAOkS8AL0YpWyp+Krt3mDYW1iCV9iW/4gQEsFkMmycUmKeiMQsV6S0rM1cRq26npUgzieQB5NTur4/4CQZVAOVOdaYCPWv0n2CFqzERLhLgOJMa6ecGynpQK072UBk+uiRCMiEtJOHFpRG6gOfwo3viw2hmdhpRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725539939; c=relaxed/simple;
	bh=Xc2cbpqPr9u/O2BK9OSp/0+ozrBLO1vUVnQ+4tUhrAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WOULSNXlKz8+2B7MmO+sK1aWiy1GFSnUQOTy8uautPXPqSKxnPJhRkREbNyP/20avZtlsoACFl3iAA7wjwgefGrdgLhVXqLy0DxtqGtOUAgad+1No3mXjwmI8wwxwKsGH7o+yp23v8Z5RVQDNaJ2ZjXXeS5OKCimeUNn0yYK1y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dh6TlXH8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD2D1C4CEC3;
	Thu,  5 Sep 2024 12:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725539938;
	bh=Xc2cbpqPr9u/O2BK9OSp/0+ozrBLO1vUVnQ+4tUhrAo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dh6TlXH8p5kPdFBlkXN1TK/1kc+9GMJo1jmybg+5TpPScqGaHCEU0naMM8dFJmivS
	 Nq1wU/i9pLj/mmvy4qhG8rdnkZ4A4xxKQLzNCgkC5gqf/UnyoXiXXn7LgpJXrF1UWk
	 X6WKK/gWU9yR+FpFlWCEjpl1/hPFW8sFwHjhtbRhNyHj9jE1IFDvhZHgJ0s4kFrlN6
	 t8xciDup/+72ZFyqLVCQmoR1b33VoYKpSjQ4rmR+6TApb/Qf7lFWUCJVrFTF4IZSkj
	 x6hOTkUxddI8ifXJkDmBNvm+Tb5yRVhXHm+Zt8GdDnV0Go2jhjCZ9xWk/MfCYa4TUh
	 GiAFVS3bQkIcw==
Message-ID: <2a15105f-67e2-42f6-b624-562485b0bee2@kernel.org>
Date: Thu, 5 Sep 2024 14:38:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8939: revert use of APCS mbox for
 RPM
To: Fabien Parent <fabien.parent@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240904-msm8939-rpm-apcs-fix-v1-1-b608e7e48fe1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240904-msm8939-rpm-apcs-fix-v1-1-b608e7e48fe1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4.09.2024 8:26 PM, Fabien Parent wrote:
> Commit 22e4e43484c4 ("arm64: dts: qcom: msm8939: Use mboxes
> properties for APCS") broke the boot on msm8939 platforms.
> 
> The issue comes from the SMD driver failing to request the mbox
> channel because of circular dependencies:
> 	1. rpm -> apcs1_mbox -> rpmcc (RPM_SMD_XO_CLK_SRC) -> rpm.
> 	2. rpm -> apcs1_mbox -> gcc -> rpmcc (RPM_SMD_XO_CLK_SRC) -> rpm
> 	3. rpm -> apcs1_mbox -> apcs2 -> gcc -> rpmcc (RPM_SMD_XO_CLK_SRC) -> rpm
> 
> To fix this issue let's switch back to using the deprecated
> qcom,ipc property for the RPM node.
> 
> Fixes: 22e4e43484c4 ("arm64: dts: qcom: msm8939: Use mboxes properties for APCS")
> Signed-off-by: Fabien Parent <fabien.parent@linaro.org>
> ---

This is fine as a stopgap solution, Bjorn can we push it in -fixes?

This platform is admittedly not of top importance.. but fixing this
eventually would be nice

#regzbot introduced: 22e4e43484c4

Konrad

