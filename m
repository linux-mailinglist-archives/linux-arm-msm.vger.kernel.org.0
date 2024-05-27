Return-Path: <linux-arm-msm+bounces-20503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D65108CF7A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 05:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7735CB21578
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 03:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99E54C85;
	Mon, 27 May 2024 03:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WY1wxS4X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9A03A8D2;
	Mon, 27 May 2024 03:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716778861; cv=none; b=i1Ixjn6Hs7eG5FzmCQwONgOwJD+rqghQNz/LjrfFav9H29zzVlcRNcVA6zPEq7O+VS3XwcVXTctpR/bGxYXwWokIBry5b0+vCM/FPh9JY9nD4QId/3zjWOIGK3H1YfbmHOzZ8zE7gc8X6fwx1htJ/AgWpBnKqBkuKQwvXXZxVmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716778861; c=relaxed/simple;
	bh=9MLSu0qnCgkhUaHNx3Hu4l/wBvP3fJRfT3ZcAkazzDk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mNAsCoHWGaiCclEonl/J1TqTzrv2e8Vq+HfrVMdaz46fpmkSo6Ny0Dtou2CIwUy9glm5VC9b7015avTmfiDmLVYWDGSRffKcwH3b/3o2Yspeul6ASpb/E9J5YISU4elta6HJTQul+DU+clHsbgd45vp5NbScPc4g5JeIq2xeoZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WY1wxS4X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A50C1C2BD10;
	Mon, 27 May 2024 03:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716778861;
	bh=9MLSu0qnCgkhUaHNx3Hu4l/wBvP3fJRfT3ZcAkazzDk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WY1wxS4X5tJ0DBw+U81v7qEET0obmF9XyldDFy4UoSmnRcqksq6kTerWRzH1fqwkS
	 9vu6m+/pH43+UtkSg3WlB4gHWoOkwpH+Y+MMMPoKHmkttkzE7ekFTpTKirwV+m9dsd
	 KBGhcR+1P8mcP7x2mWUCyeKEtV63Urj4cuS0qnKv+zU/wEF/cCONG2MEYxM1BiRFpv
	 uFRANF4iuBX21Ha2FEZv7qSxm0Kn5HySCQTbhwtv5TQ/Eqd6W6jy6MACL2FDO7P86f
	 VzSAT7EJwLWkiRUzjOEbVKnnEA0iVcuJKMl0KhfvmPDD98AUc8LhV/2q7w+gthRsHa
	 O7+eXQvitr4/Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: qocm: sdx75: align smem node name with coding style
Date: Sun, 26 May 2024 22:00:29 -0500
Message-ID: <171677884208.490947.15212665184484115260.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240426123101.500676-1-krzysztof.kozlowski@linaro.org>
References: <20240426123101.500676-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 26 Apr 2024 14:31:01 +0200, Krzysztof Kozlowski wrote:
> Node names should not have vendor prefixes.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qocm: sdx75: align smem node name with coding style
      commit: bfb751d9221361185bd2331dbf6e751e351a6c5d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

