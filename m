Return-Path: <linux-arm-msm+bounces-43415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E1D9FCD0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA05E163144
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C2F1DFE1B;
	Thu, 26 Dec 2024 18:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFFVz1lO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73541DFE11;
	Thu, 26 Dec 2024 18:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237674; cv=none; b=q2oZ8u2ci9TwwLixTcH3OtIDi7Hyt94G/AtHUpsaszNWcrz5VIf37IjqjdYjSerlEFOwV9FX+g9xurEKjHfLKMfiz9gv068hosDWQZyBG8Zfi03R3imi50n734Cft/3OKSNEGqnX1JutPDrrCr1jfcxAwcxIVEGJmE0dUwGLWvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237674; c=relaxed/simple;
	bh=bzCaQiU/TzTZW/rloA36KuA564NNmgLFFxwE6OJOa1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uiDee1zZ5SxNiZ8tqAo4Edyww8Crp5t8d+YUbv07mChKOl0J3Sxgw/VHjVCXtpy28sD9IoWHjBi4JMniUgEmy7umjtyk3D3LZwHBm4xZVcHNcMyr75faV4VpE+/d4CkmdSeJPetmOuI2m58S99Ok9L/jZxwbjnGDXy/X+m8eYn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFFVz1lO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8BC1C4CEDF;
	Thu, 26 Dec 2024 18:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237674;
	bh=bzCaQiU/TzTZW/rloA36KuA564NNmgLFFxwE6OJOa1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BFFVz1lOzdpRb//DbQMUZZNNDpaeN0yb329udquGqGjHDfVivaAXccZ20znsBlpZ8
	 B+EaTzSPiZbFrh5apy2SRHvJ+Xgk0xUyPe+CyyLOzvU6pFOP+GbwKi896hFT8viL2r
	 ulmqmPgmpIrlh+KI/H0h2dlt3YYo5aCR1cHY4f0vy1KblZzJOobiwjaV6imn6ZAgUF
	 LL863c1BiBzirKBkZs7Oz84qKqh3lN3Io5qwS/9yi8CzczFihg6pysQTfMCYhl/XE4
	 LR1P7k4c/gAnB8wW55pCwgLGl0LQjmMVeOAgjZxTizSUEErH//dgXzvifhvs9G73T0
	 89ceMGp4xdLrA==
From: Bjorn Andersson <andersson@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH V3 0/2] Enable Inline crypto engine for QCS8300
Date: Thu, 26 Dec 2024 12:27:08 -0600
Message-ID: <173523761393.1412574.4984254735203934418.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241125065801.1751256-1-quic_yrangana@quicinc.com>
References: <20241125065801.1751256-1-quic_yrangana@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 25 Nov 2024 12:27:59 +0530, Yuvaraj Ranganathan wrote:
> Document and add device-tree node to enable Inline crypto engine for QCS8300
> 
> This series depends on below patch series:
> https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/ - Reviewed
> 
> Changes in v3:
>  - Remove "Reviewed-by" tag added incorrectly
>  - Link to v2: https://lore.kernel.org/all/20241122132044.30024-1-quic_yrangana@quicinc.com/
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: qcs8300: enable the inline crypto engine
      commit: cc9d29aad876d83e752a1da6dc978088b248427e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

