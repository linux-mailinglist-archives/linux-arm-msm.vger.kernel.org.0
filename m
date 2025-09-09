Return-Path: <linux-arm-msm+bounces-72853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69717B50364
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 18:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 974DC1C66993
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 16:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64BF535E4EE;
	Tue,  9 Sep 2025 16:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o+u3e99Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C54E35E4E6;
	Tue,  9 Sep 2025 16:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757437004; cv=none; b=Boe+1FRNukTZjWbGPkzscPx6uzsU4BGlSicVxjv5umQQvDp7MEFLJwCtE82KW7PrFCyyKfVKBH9aqv9Y7RRNArwS9fyEUFRmGl8gPPPd56l2bZGri6YR/Pt2kTaEcK0tLRH4H5tJKH9bTQxQlRtRBcHwlB0y7vv4vt53t5sSZz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757437004; c=relaxed/simple;
	bh=GmbK4WifRYitvIq2cQLRaKk4+9RHj7d1KLEj/MIpZX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i7X67UD91tELozBV9H2AYQTOuuNnPO/BdAQoIIlrWYkH6DSExZ2xZqq6caQ7fnBWKLHesEBYJ2OO3GSoV7Uc3XTUrYDX+gHBhyCnw2H1RwmCfsYFyVXHbPp6VJzjSGfvzwdVYbVP2Brq7HVfx+Fj5dn+1c3rNONTvjQRNSooLDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o+u3e99Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40CA7C4CEFA;
	Tue,  9 Sep 2025 16:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757437003;
	bh=GmbK4WifRYitvIq2cQLRaKk4+9RHj7d1KLEj/MIpZX4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o+u3e99Y/1coTgz5EdbN7rbjqdMdZ2ipxWVQimN8nIkzvBBioriHJHDHmwzpqPUSt
	 TyQoAsPulYQgqnBY6vQe0a0B9UgRb0e2nlSt6A5F9T9rurKu9FA2t2hsifMeIsmT6I
	 d51s+d7jpubBGCdm6eTfUfCdF7g/lWYUr7ZdSvthCsdWyL9YZmJLBP2TQvVc/SkhdJ
	 s8tYb7oqcwK7j2eb8Udf/ZkbNmplBP5IJNV50tXUUD+MQ29thXHNN6s6zVnsABwExy
	 7tRgCUVbn2TTARA7Yiilfrbm2HI0D3kyPspnyyFxdaZpQUVCzqyuPvYTZm5X+GMe5l
	 /rbA987bMPNOg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] arm64: dts: qcom: add initial support for Samsung Galaxy S20
Date: Tue,  9 Sep 2025 11:56:31 -0500
Message-ID: <175743699548.2735486.7815045530548192137.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250905190931.27481-1-ghatto404@gmail.com>
References: <20250905190931.27481-1-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 05 Sep 2025 19:09:28 +0000, Eric Gonçalves wrote:
> This patchset splits sm8250-samsung-r8q.dts and adds
> sm8250-samsung-common.dtsi, which contains common definitions for Samsung
> devices that use the same SoC - the S20, Tab S7 and Note 20 series. With
> that, also add a DTS for x1q board, which is the Samsung Galaxy S20.
> 
> Thanks,
> Eric
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: sm8250-samsung-r8q: Move common parts to dtsi
      commit: 194c7636faf8bab8deea3800e168b23319a9c198
[2/3] dt-bindings: arm: qcom: document x1q board binding
      commit: 818045d1658fd4ceec06fb6efa62ed9c5b7f23cf
[3/3] arm64: dts: qcom: add initial support for Samsung Galaxy S20
      commit: af7bf2a2bf8fe01b6e2f68af19517a4eec48bdbb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

