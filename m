Return-Path: <linux-arm-msm+bounces-36520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B42B69B7281
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 03:28:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7005D28165C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 02:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B72F84E14;
	Thu, 31 Oct 2024 02:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cE75NtXm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565F017BA3;
	Thu, 31 Oct 2024 02:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730341689; cv=none; b=ngdLtJ1O7D0CIv/L05mi1mw7IdG4hUvr04vWPhvCHpk4ptZLmbbK1GlsFEKQCT1FY/AGeF0ijFKr4vBXWFD2QQQsmoGV17v4u6eFPtE3atB1RPh8gUYF4nYdKCcWx9mwsjU5q0zpc6y91LSQ3gDcOVw40nxY5Pe6gxUzzY/yubA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730341689; c=relaxed/simple;
	bh=8BIQo0QykbY0+G6sL8ETJHJhiDHFJprVGPUxC/ITDK4=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=QZ/ICIWyra3f/wVXYtd9O3zTSyAC28TDH49D7cN/S3DAgtPfl/Zj3dh9yINv4pOym9SaRu3LOdN0i8yiu33Bjc3cJj3AON+4Na2EcFsgFxc6ytqdrYnjm9dXEelDh2s85h0YDvLpLiCPfT/8QcMQkMJVKsyHP9yP4iOdAtqMwDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cE75NtXm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98D33C4CECE;
	Thu, 31 Oct 2024 02:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730341688;
	bh=8BIQo0QykbY0+G6sL8ETJHJhiDHFJprVGPUxC/ITDK4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=cE75NtXmm9H0Cj0sGlR0QefPCWdv+7PEk5ioaHjQAIk2rj/n0sjMU5Eo3ICqHuJbT
	 UdVJGrKKdwahac91LK2LkBUEctzOTbXk1Fr7Qm5iUx2qFsIGF8Ab6Kh4jbmUiKfrKD
	 wwVrtCfLZNOyBJxr66adtyaxmMSpYl+zJ1afknc6NVgm+osFuPirBq0fLKbJXwGjBK
	 2dv/bgthqgGZ4lH2QDnr+GrjjQxGD56qJSt5Dqfr2+He6Uo4VFDyrYvQGV5Hs29L9n
	 MV4Dy5BnwES/6exKxcPp6qkMntGDOPWdjmhAObRhqaxAQDTyLXh8AUophttUXUCQx8
	 ec9FYXebp5zOA==
Date: Wed, 30 Oct 2024 21:28:06 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 tudor.laurentiu.oss@gmail.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, Bryan.Kemp@dell.com, 
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20241030182153.16256-1-alex.vinarskis@gmail.com>
References: <20241030182153.16256-1-alex.vinarskis@gmail.com>
Message-Id: <173034159113.3085522.9879701637514263982.robh@kernel.org>
Subject: Re: [PATCH v1 0/1] X1E Dell XPS 9345 Improvements 2


On Wed, 30 Oct 2024 19:19:35 +0100, Aleksandrs Vinarskis wrote:
> Describe retimers for the said device. At the moment DP alt mode is
> not working, but this still allows to use USB3.0 in both orientations.
> Once msm-dp is fixed, DP-alt mode enabling patch will follow.
> 
> This patch depends on [1], which is still undergoing reviews. As it
> appears to be close to its final state, sending this already so it can
> be reviewed.
> 
> [1] https://lore.kernel.org/all/20241022-x1e80100-ps8830-v3-0-68a95f351e99@linaro.org/
> 
> Aleksandrs Vinarskis (1):
>   arm64: dts: qcom: x1e80100-dell-xps13-9345: Introduce retimer support
> 
>  .../dts/qcom/x1e80100-dell-xps13-9345.dts     | 293 +++++++++++++++++-
>  1 file changed, 283 insertions(+), 10 deletions(-)
> 
> --
> 2.45.2
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y qcom/x1e80100-dell-xps13-9345.dtb' for 20241030182153.16256-1-alex.vinarskis@gmail.com:

arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: /soc@0/geniqup@bc0000/i2c@b8c000/typec-mux@8: failed to match any schema with compatible: ['parade,ps8830']
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: /soc@0/geniqup@bc0000/i2c@b9c000/typec-mux@8: failed to match any schema with compatible: ['parade,ps8830']






