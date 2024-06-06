Return-Path: <linux-arm-msm+bounces-21846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2868FDD59
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 05:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 251661C224E8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 03:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3705D482CA;
	Thu,  6 Jun 2024 03:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fUOx1S8X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E02D481A5;
	Thu,  6 Jun 2024 03:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717644046; cv=none; b=dWNwOYPsS7Anl7QIwDVJhHnaT9XEwz14mHz7oAYfCR6v08+9HzHrBm1mSrI/NL4E0Atbgvx6tKRKAPkp3uZ8KbI1A7oYtC9QwcqSwVdxjCBWMSA2xLFj49RG/GXSFmybOvAui4UUe3ZTNzrJvw8BfutHz8QBh4bRvkmnzy2hCS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717644046; c=relaxed/simple;
	bh=s8giKz48XBd0HCLgORkzI+767X+sWwlzGArFmnWe/dA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=enL5l8dOhrhHTRwUHCnMbAuBudgMjTlLp7TiOsadWFiScIQn5VP8PScK9PaKp38AN8kAt8ZQetHG1wyc/FmpqGuoxEmwmoKeTfmzES+c+2BWSk99/j4xvuAxgHX789R/jYMakc5zJD4jqESJBHhUSEjSo7twHtLNoYsI09g34LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fUOx1S8X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30EB8C4AF08;
	Thu,  6 Jun 2024 03:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717644045;
	bh=s8giKz48XBd0HCLgORkzI+767X+sWwlzGArFmnWe/dA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fUOx1S8XVy2paxxtEOa0wC2fOpgqZCajhKVSez/YZ+Dr9D5oFEhbUe1fnIlhN7iLX
	 bKbNZEF5NSreu9h8GsUedtHDmh875Gm9z+ynhQuYAw9sblIa4blP3ADj2A6uVPBeMa
	 Dfrs0EB0/4ZEgenwc/kXKNqOgEDCuT4KwQLVjy4VxUsqrpJWuBIzG7n+PKPJi8lSew
	 Z3B2pnka9szCO8qG4xqmn1R+Y37JrwoIqZqN12aLWF7CPp1g5cGcLg4NgIGqHhU+aq
	 4wNsU1KiD/z66rN7lQ3yYI6fURplQKuv9ZEiGmCP9zizEep2+oUaeWvBaEWBKbGNii
	 MRmDwEb1cNSoA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: use defines for interrupts
Date: Wed,  5 Jun 2024 22:20:32 -0500
Message-ID: <171764403325.730206.3491532618526883560.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240605154605.149051-1-krzysztof.kozlowski@linaro.org>
References: <20240605154605.149051-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 05 Jun 2024 17:46:05 +0200, Krzysztof Kozlowski wrote:
> Replace hard-coded interrupt parts (GIC, flags) with standard defines
> for readability.  No changes in resulting DTBs.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: use defines for interrupts
      commit: e502de5d40f70eb3f2066d0231df0f40ff48742c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

