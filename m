Return-Path: <linux-arm-msm+bounces-28574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BC69527A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 03:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA1AF1C210A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 01:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60BF717C9;
	Thu, 15 Aug 2024 01:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kG8woxW7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC51B65C;
	Thu, 15 Aug 2024 01:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723686830; cv=none; b=PfWCOC+K9vXkrDiwLjug/aH2RKNmv+Ai7IS25gkst2hqE1Mi407U2FrlsrejxmnhSdW2kqjYIgjUN65t4JeS8uICxhUpXlYCKnmKn0zx8hm74TW9b4JGPaERgSOv5zoLzg3Lv6gOxYExqSUOw5WHaVod1t8A8ubQRIAsKEGgR2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723686830; c=relaxed/simple;
	bh=FDdmrQpBIE39g3qEti9X6pDTSz2q3cFAYWYuT+VEzo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iSzou7dW+6prI+WG48+/OI7ufN6taw6cKmUgq3STaq7YAZ2MtiuNFBAsAalOR2FUexDeVsg5+iiX2fw7zUP264RE7xMrWBlcHEMIf69cdJ1Fz5h0mxk0aTHVwJbllQkHv2X5L1XG/zWASP3jDSw8Q5cGivv0mDqTykNWTGuXRmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kG8woxW7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F246BC116B1;
	Thu, 15 Aug 2024 01:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723686829;
	bh=FDdmrQpBIE39g3qEti9X6pDTSz2q3cFAYWYuT+VEzo0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kG8woxW75ogyAzzFf7eufKCNAs9PxKyUoSpsHp67K0TrMDKsDDFs2DGdUURWMAQji
	 IrT4oZN5JojAXhbCppgl3PPvjQGarCh5GFdQBbHgql2H+dPe2VZ6+0Isc8nvEcC4bR
	 aC1RQiY4Q6JTGqgBfu+wYjJJUUthoSBD6T8/vfW1nAIF4aV2Mzcgbt98LmjYyhrCgn
	 mM2gjxXGNEe8300Aa0y2ENDNN7ON/4uDyr0/3hqI0n8WWOuLqfARbl01s1Od3wtaMa
	 JLGGqAECmJKajBhgv1amOU6n+TcDw4v/EnGCkjxva9DSJp7GdlcQqQhQdBt0Zkiacm
	 J90J5DfoAnyfA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8180x: Enable the power key
Date: Wed, 14 Aug 2024 18:58:05 -0700
Message-ID: <172368707426.4024760.9620308018249724794.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240812-sc8180x-pwrkey-enable-v1-1-2bcc22133774@quicinc.com>
References: <20240812-sc8180x-pwrkey-enable-v1-1-2bcc22133774@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 12 Aug 2024 20:34:19 -0700, Bjorn Andersson wrote:
> No input events are generated from the pressing of the power key on
> either Primus or Flex 5G, because the device node isn't enabled.
> 
> Give the power key node a label and enable this for the two devices.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sc8180x: Enable the power key
      commit: 3706bcfbdb8aecdb506b80e45e2e5851044f1f28

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

