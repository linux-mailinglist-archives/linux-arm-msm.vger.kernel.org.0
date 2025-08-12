Return-Path: <linux-arm-msm+bounces-68840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F07E2B23A79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 23:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A57A584FB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 21:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE8B204C36;
	Tue, 12 Aug 2025 21:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ih3LCefU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D2B2F0698;
	Tue, 12 Aug 2025 21:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755033341; cv=none; b=Wax8j/0zzZ8gT+KSNuwwodGJpf65+oBM8d7SIOMNOx7LCcYUfIZmCeNLbnm6TzDdI0Q6/XKHRWVS0mpSEYJuv+fTwffFRaH+5cSsATmw+Rq4Q0WesURYLK7iYI9KPKxqU4YJ7efez/Vhgo1gapxgdwp75iUEBay4aAPs4czWD6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755033341; c=relaxed/simple;
	bh=HcOxzS6qBsSVE3yw+XQzBxASJfQdC62OPfuwpF03smk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ijpd1V076h0A4DEHpckgCe1+nhwCCb09cUFe17rfRS5Nha2l8dIaKu8YlSA+/qjrdL0Tb6ZwVvvXaAKAAKEonCgYuzW2svSJo10CVil/OfAv1lKUZmOBQ96AU5IhTe/NIBucJJwDE0WFqxNGDoiYDSWafOpuEwZitvtTa4L0ORQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ih3LCefU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E79FC4CEF1;
	Tue, 12 Aug 2025 21:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755033340;
	bh=HcOxzS6qBsSVE3yw+XQzBxASJfQdC62OPfuwpF03smk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ih3LCefUSY+rnDkCyvJfBQnEGfKpKIUG/SSgONBmpBJeaT8QvIGebsBiqMguuhfpB
	 kmzwwUJgNIkoUCTTP0Ko+F0pwbeMAiYph673Q73CY0OG3x44WvDpUnKnlxF5AsMih2
	 YoqLCTYDvK/i5zeqoLD5x6WErxtRkgRHLYvKfO4S4xBC8XfbuLYuT8ppFQFIbgyx5u
	 MKpFAIomBeARZaSYF2XEBlV+YRzPMV7I/CUA8l1m2mSPg8CsQkTpRv0qg7CI4V8Hwy
	 /vyMz50naNCGd17P9GC2LQJR6ocg/UejODSxHS78IfVtNGIg5ybxWym2uNu9AzkVGI
	 znoIKJjgpyZiA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: qcom: ipq5424: Describe the 4-wire UART SE
Date: Tue, 12 Aug 2025 16:13:45 -0500
Message-ID: <175503322847.231048.7613485046039418494.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250812-ipq5424_hsuart-v4-1-f1faa7704ea9@oss.qualcomm.com>
References: <20250812-ipq5424_hsuart-v4-1-f1faa7704ea9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 12 Aug 2025 16:02:41 +0530, Kathiravan Thirumoorthy wrote:
> QUPv3 in IPQ5424 consists of six Serial Engines (SEs). Describe the
> first SE, which supports a 4-wire UART configuration suitable for
> applications such as HS-UART.
> 
> Note that the required initialization for this SE is not handled by the
> bootloader. Therefore, add the SE node in the device tree but keep it
> reserved. Enable it once Linux gains support for configuring the SE,
> allowing to use in relevant RDPs.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: ipq5424: Describe the 4-wire UART SE
      commit: d56ddcee0101a4b948be0d388e91f5f38f14d448

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

