Return-Path: <linux-arm-msm+bounces-34637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AC89A1443
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 22:43:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0AC61F22E6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 20:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7240218308;
	Wed, 16 Oct 2024 20:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NMKckwJw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B230215F5B;
	Wed, 16 Oct 2024 20:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729111361; cv=none; b=KSLH3gT+xl7eQ5J2x2PDShO03RnAI9pJUCCxqZVClgFY4Iw06azeuAnhAMhwuAMeuc9fXFnJF7FjMV4ZO0bWMtjPIEPYGSh+bRSZ0FoEQWwCP2dJ0ym/eYAeL+lliKl7d+5YrxmBeF2zC/EDxnIrOrhhiK0xsQOOq0mQe1MjPQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729111361; c=relaxed/simple;
	bh=wT/udwW2lr8VmAPw5UvqQWzeUjqw6GPW2K7JxJOR0cY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g2X0N25+pXuRS+hPxsLUnStCGGnMlpDiaAsOsEhB3H2YARcHLrV7ytkDr7K15+MC0+Dm0bY7CpZVtf3SANCUcCluSBTK79ywv6Jxhbg9/J7K4uNB7m0uzeSp39sEU/35uTx+ZPi1cp/agoZabzLaltpmTWB1cC+MVteybYQ5CiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NMKckwJw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BEF6C4CED9;
	Wed, 16 Oct 2024 20:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729111361;
	bh=wT/udwW2lr8VmAPw5UvqQWzeUjqw6GPW2K7JxJOR0cY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NMKckwJwZdh4BDJLQ2aBJQXrYrl6cZ8990HWn/7mW9Uo5vXeQKUpA4Pd28nKtwThX
	 2gxCeVNKXakSIWK3ilCn1Y29EFefTh44NHEUEdO0CYUl0kCHLFcSSZYlw4gaJpHvxB
	 0Pe6q80zTUX0PVfNWOslcRUArmfVJc2x2rGtjB4zsJrUG+tqvq2eqKad6P89jtFtCC
	 pfWHmMK1d4acBiwA1Xc9dRZrrcqD+GEiuEoF9caEwuq9qP0bOhL5+EWfmQh4XIplQ3
	 YZKPpzR7j4l7px2g7j2xcdbbh2xZbYZXyzUI3m+nf8tHPvtTybSPxPzbygivMVHT4m
	 IbwRu21WvviAg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8450 fix PIPE clock specification for pcie1
Date: Wed, 16 Oct 2024 15:42:28 -0500
Message-ID: <172911112242.3304.7496536723240394633.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241006-fix-sm8450-pcie1-v1-1-4f227c9082ed@linaro.org>
References: <20241006-fix-sm8450-pcie1-v1-1-4f227c9082ed@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 06 Oct 2024 19:47:56 +0300, Dmitry Baryshkov wrote:
> For historical reasons on SM8450 the second PCIe host (pcie1) also keeps
> a reference to the PIPE clock coming from the PHY. Commit e76862840660
> ("arm64: dts: qcom: sm8450: correct pcie1 phy clocks inputs to gcc") has
> updated the PHY to use #clock-cells = <1>, making just <&pcie1_phy>
> clock specification invalid. Update corresponding clock entry in the
> PCIe1 host node.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8450 fix PIPE clock specification for pcie1
      commit: 5d3d966400d0a094359009147d742b3926a2ea53

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

