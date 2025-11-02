Return-Path: <linux-arm-msm+bounces-80039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82514C29481
	for <lists+linux-arm-msm@lfdr.de>; Sun, 02 Nov 2025 19:07:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BACA188DBCF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Nov 2025 18:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B108A24DCE6;
	Sun,  2 Nov 2025 18:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eUJzCgNK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C962494D8;
	Sun,  2 Nov 2025 18:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762106790; cv=none; b=GbRLTTw/YmB/iuZ4EX3iEFpz8fh4cV7/umNJiNgDzn6ymfW9fGCceBrDSCvII786HXhK4Z4WYZX8haMaFDZK65Nftn8JVt7x8HtyV99Jf59+CpWIlYbS/6oFT/v7P4+gwAtri2rTDaY7ZNUvYBotVbpZOY3pCk7dEflRlcK0TZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762106790; c=relaxed/simple;
	bh=zE55+vFgdpk3goPlSGtfCbLdny394f5YeMvgwdvPdt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XumtGvTsxUrt12jRpYCWG5HeoFKHdjm4Yw6+oUk6ovfPiOKSoUjE+bxB1jE/ws0EOt5h9Ctz3oU34JiNQW2paanmcWlsjoSlIo7funn19JLLCsyW/Fr0x5Sm4OxjCx9DIQuU4GBssMn0/6m3aXrosOS4CDzuelciLx6rBwpr2y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eUJzCgNK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B910C116B1;
	Sun,  2 Nov 2025 18:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762106790;
	bh=zE55+vFgdpk3goPlSGtfCbLdny394f5YeMvgwdvPdt8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eUJzCgNKLOO2GdheqoOWZMVSVkAlEgzooVEDvGCOCoUeoWbCbSvybD6nHItc2N7m3
	 ZqipvSME7xuF6IeoS9/IeafJbktzTQyG3UQhdQLVOfnpl1zwY9bUmPazlw0/nGYRdD
	 L22JgYM9fb+7BgGcE09wmx32XpiqBLgwzlFVPWBfD/YxAxcbo4Uq8O1wULnb+Y9RRL
	 B1+FFcP1cMdyXmQNtVEauZpN9EvIzXXiRh6XlK2S6T1l5vqlXu3LcQLAK+hLXTpp/N
	 1YleTkQjKYAzpHzpVgyiapSMPga8pG3H3A1uB7KOtJ3lwvF7RQAYuwM4a/ssZyE0vZ
	 IJ0Wbwfn1RppQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/3] Introduce USB DT support for SM8750
Date: Sun,  2 Nov 2025 12:09:47 -0600
Message-ID: <176210698636.937813.8961503052287724125.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251101174437.1267998-1-krishna.kurapati@oss.qualcomm.com>
References: <20251101174437.1267998-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 01 Nov 2025 23:14:34 +0530, Krishna Kurapati wrote:
> Add support for the PHYs and controllers used for USB on SM8750 SoCs.
> 
> Version-6 of this series has all the binding/driver/dt patches acked.
> But only the phy changes have been merged. Version 7 was a rebase to get
> acked patches merged. But comments came in to use flattened bindings.
> The v8 for usb bindings patch has been split and sent out separately [1]
> and it is ACKed. On v10, the pmic glink changes and usb role switch
> support are added while addressing some comments obtained.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs
      commit: 7a5bb9f60527fdc469e8fc53c537664fe0d481b0
[2/3] arm64: dts: qcom: sm8750: Add USB support for SM8750 MTP platform
      commit: 2340f29e2b06e24b44f5e8a4220d61605b3ea533
[3/3] arm64: dts: qcom: sm8750: Add USB support for SM8750 QRD platform
      commit: 530f824a4e1878c3d80dee070b831daa80a48634

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

