Return-Path: <linux-arm-msm+bounces-27646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD009441A3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 05:20:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70D36282D86
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 03:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9150113D89B;
	Thu,  1 Aug 2024 03:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDjmIcUO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6445113D891;
	Thu,  1 Aug 2024 03:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722482395; cv=none; b=NKLKlRFLwfGra7CaxbX16VaCw9KENxg5YC2j74tNVME3ksoALG9bcd6DSNn0cgjM9tU/K1/vDiHdH7K3LZg+HWFxRwhCeH6u4212LfVeFC5/gYGsWqJIV5Ul4VbxHQI8odvnuA62rZJBR65u6m9HliQzPQduLu000s+CYQuIlJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722482395; c=relaxed/simple;
	bh=+xKr/puYcWnzZ+3VG4U3A4dih8roUhDWRrryIrNGuV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GywfhOayYmqgVcFm/pJ9+NfS5y1s8TGcGap8KScqtMniqM6I1EH3qEhfwY8lttCLjjJhZqtqjSZGrOLm85e9npRdWJjhTr1YjwtZIwAQT6pn6npuGU40uuzi7p1QNzGyveQzuzc1c7f5Gs7qvGnCT+dUiNI9bXkUZbITpEIHYb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDjmIcUO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B2EC4AF18;
	Thu,  1 Aug 2024 03:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722482394;
	bh=+xKr/puYcWnzZ+3VG4U3A4dih8roUhDWRrryIrNGuV8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bDjmIcUOMLGQe4PbdaDQT7CD/2USlCHDzcIlrz6XSVfjk5EMGkffhVnGvDpxwZ87l
	 sBV3dOs2SkpUTJm6FfxItDvC8ySii7D8YRgp6pBuccuqDAwIjG0MBUhmnHSdJnCnhW
	 xFT2fDxAgfrn7S9dW72sksLNiW+Wx6I7TAko64fGRkQhu8YveyHE/3hpExrK1VGNE1
	 aov9gaHeqXD1FIbZGGmWl2eoofvp+WOmFqWYfeLWxurgL0w/CijPrPU+ylnGDp+II0
	 i6lg3OIHA5fz/ZqvOxZ76OafbD0aAUQFNAPaEgpbhKwRCOo5SG8YudwZRT8B/Nm1A6
	 W6R4nDEU9l1Eg==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: pm8950: Add resin node
Date: Wed, 31 Jul 2024 22:19:39 -0500
Message-ID: <172248238599.319692.5167574041335910415.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730-pm8950_resin-v1-1-26de4d933f95@mainlining.org>
References: <20240730-pm8950_resin-v1-1-26de4d933f95@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 30 Jul 2024 23:24:59 +0200, Barnabás Czémán wrote:
> Add pm8950 resin node as a feature of the PMIC it should be declared
> in pm8950.dtsi, disabled by default. Like all other optional components
> it can then by enabled and configured in the board-specific device tree
> part.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: pm8950: Add resin node
      commit: 359c8c8491b5345bf49a4e79c07a76ab8e21f412

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

