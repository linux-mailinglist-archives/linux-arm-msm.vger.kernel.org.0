Return-Path: <linux-arm-msm+bounces-78829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3374EC0B566
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 23:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A44643B8992
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 22:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13996220F21;
	Sun, 26 Oct 2025 22:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s0N9a6Ws"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1E572633;
	Sun, 26 Oct 2025 22:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761516938; cv=none; b=OAraA/uL3YRZ2JKhM9itTDKO5ywQwlLUK2GF2dELzd7FDmFVqEIL83kglzceJ7kG/tEuMGtGK7EJcuWrNLTg1voa42sSDAJ5CUdG23Eu5AA4F+kyeyddr2xJjTa7ENQGP0zxi8GGdVEtI/syG1fw2/Us8lEg5vy4YymY0gGKtx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761516938; c=relaxed/simple;
	bh=HsVvS+d7okCtQ5mjLmoJqtA3NyYSkQ5luidBs4em8yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbFGLg9vZoF28Cq/4CMD6EiSJuLlRQRciOjkLkdaU8a5IRLtEABu/dLzPgpguSkvBHacI2x+M9jf5aVUSwqjU4eXg+TMiKGH9/RghTHjuZzdvYwwHBWHBJeHXNHnEyx5kkPsa6XVWL45ve/S/9Sb6MYpwR8Olp4TFpnY1NHulFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s0N9a6Ws; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF45C4CEE7;
	Sun, 26 Oct 2025 22:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761516937;
	bh=HsVvS+d7okCtQ5mjLmoJqtA3NyYSkQ5luidBs4em8yQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s0N9a6WsHjGsv5XplbKVtoiAEYPurNptJGQtBFK7fPgAExpq1opS9XiebLN0VH7YM
	 /ftZfqaXNtLmOrrE4WqXbLTwLd5fT4IPD150VC2eyJGh9Oe7UnY4NqgsOmWvqyS6iM
	 r1DcwDg+jiWz2cPnOatidf3eZrl2sewgIouVNkWXoU/HOxtGou2rGb3axQPDYy5eNv
	 fVzqqBVAu0HhbaxYHOMDk08N1UJq/jYOzafrtoaCI1JM3c5sAeWj8iTToT5GtGKqmO
	 org1HoBd6D8Srg7coe9y3wB8KkPxU2pkADN7XDdAiIPy8BYLd8O3ErtOL4xSUlBoQd
	 rzdpf990YdAyg==
Date: Sun, 26 Oct 2025 17:15:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
	Das Srinagesh <quic_gurus@quicinc.com>, yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH v2 2/4] dt-bindings: soc: qcom,aoss-qmp: Document the
 Kaanapali AOSS channel
Message-ID: <176151693344.3032100.16182164232751767007.robh@kernel.org>
References: <20251022-knp-soc-binding-v2-0-3cd3f390f3e2@oss.qualcomm.com>
 <20251022-knp-soc-binding-v2-2-3cd3f390f3e2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022-knp-soc-binding-v2-2-3cd3f390f3e2@oss.qualcomm.com>


On Wed, 22 Oct 2025 00:28:42 -0700, Jingyi Wang wrote:
> Document the Always-On Subsystem side channel on the Qualcomm Kaanapali
> platform for communication with client found on the SoC such as
> remoteprocs.
> 
> Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


