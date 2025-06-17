Return-Path: <linux-arm-msm+bounces-61646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F05FADDE18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 23:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47B8C17E06F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 21:33:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B906B2F5305;
	Tue, 17 Jun 2025 21:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OkOQvmal"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BEF2F5300;
	Tue, 17 Jun 2025 21:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750195908; cv=none; b=Pw79bVkDSWWW25+anx+IyO9RLLc5pVkFDAXTQe/3w03DG+O/lhq40zWyG4BXuzHUiyRTfzF3I2cOGvp+3WCWEtHMdOCvTmvclEwz/uYykSHSRwhj/jx53u9DA+s1cSNHL6j9jpaaf2/B8sv3A3UNBeyxu/fs64SKGy23Ze1CBGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750195908; c=relaxed/simple;
	bh=LeEq32sNQEYyzZxdIn2lI2E4buF0iTL9TIugHF1T3kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LcX80StcYHivGWbUf78C7ksDSucYTJH1u5P1oBfcyTQaH2sYtnTixBXCRSkaCdPlxc7s7SMYWzSIIbJeq9JvDGji31ekNOBnTuXg/rOjCKu99S6onf1Ec8ggNmf4omOsivWgP3ZavuIa4CC6CoqHvnZaG27AkyIpnXQA1bJyib4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OkOQvmal; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE2FC4CEED;
	Tue, 17 Jun 2025 21:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750195908;
	bh=LeEq32sNQEYyzZxdIn2lI2E4buF0iTL9TIugHF1T3kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OkOQvmalPT0WtpZNwlAE1cAgJb1N4GG461PbSHVVkjEDpkcU54hkFoKN8K3mEeIiZ
	 /6I7b10BiknZaGqNIHjuxWAvd0MTds2eqgxGQ1G/d72iwloXNfuD2PbvY/yv3wQ6kJ
	 L3/+oWEG2lhYLt8H3Y64x9Is9EjiVoJwXh4PQ0lqI7yIXi9qePvfkTvOBPl91yhyHL
	 eCizVHNNRSJFE2j2Bx6nOPs70Gg1piSKauFp0d7Vr1r+dFlEMLQxmuxbOOvBMrrNKY
	 8PyzO7TTdN3AZAGP6fQ3RuOJuNiiM2crL09bWvPc8KxI42OX6knr6CTvZi2ymdMq6j
	 14p+5pw2iPt9Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 1/2] arm64: dts: qcom: sm8250: enable camcc clock controller by default
Date: Tue, 17 Jun 2025 16:31:31 -0500
Message-ID: <175019588859.714929.6372992975925434786.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523092313.2625421-1-vladimir.zapolskiy@linaro.org>
References: <20250523092313.2625421-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 23 May 2025 12:23:12 +0300, Vladimir Zapolskiy wrote:
> Enable camera clock controller on all Qualcomm SM8250 derived boards
> by default due to the established agreement of having all clock
> controllers enabled.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sm8250: enable camcc clock controller by default
      commit: 40afa658914eaf7042ce275269336d9d698a739b
[2/2] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: remove camcc status property
      commit: d5a6183a918cb1f2e442ab9fe68e9fbe0bd2ba3a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

