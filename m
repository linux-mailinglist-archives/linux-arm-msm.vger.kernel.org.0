Return-Path: <linux-arm-msm+bounces-23508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E9F911B0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 08:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35A96284160
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 06:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6FF16C6A5;
	Fri, 21 Jun 2024 06:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FDklf1+O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA2B16C698;
	Fri, 21 Jun 2024 06:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718950300; cv=none; b=kpPLlvgA0kfJZb8YpFUbKa8zjbjIi+yr2vLylWBG50FVUjD4J4jRSfkNe3SHM6zKc9NUs0WDjvw3Eb8/3A7SAuUt5E4Ewh/4A77uqY0BBGA7thvyrpoBrqPOdW5IPGFC1RGY1K9azpagj6D7vgRt1ebiva2RdWKVVaYE/onhWvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718950300; c=relaxed/simple;
	bh=LV5ZsDZ/AvXD2Lnrz72jHwvuXC8LbrDw7it9lZGBw/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CKtLdm+KwAOAZ4ch0L56QEicJyMNMz64JHqhO9e0ULmEPO3te3uU238yrcC6s0x6aOXL2uAy8lm8GAAtzsnPrUBuvexoiVh8xoTm9gVSCYUE7S+Ezn/isZJ/yZPzQs9oXqrDFKcV/hxnGc5N5cLeYCvlGscjXPkK/zwoLgu5OnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FDklf1+O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0700DC4AF0A;
	Fri, 21 Jun 2024 06:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718950299;
	bh=LV5ZsDZ/AvXD2Lnrz72jHwvuXC8LbrDw7it9lZGBw/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FDklf1+OZmPzhRuM+MpQfD9WvO6ZvFudkp9QFlBtZmw63vV7AeOP5qr5sfpXS7NZ2
	 SiPEXEeY5OtO4PVlXMTLB37wWicYAtdjs7aezxfae6qOGxy2Xk+4vf7nJrQ3PfjQ23
	 aDIktLYCTkIet4gnXMCcEPlfkea6v8k/lqMZhl3UDuCKIQNxGINZqdXeuI38X2z55M
	 vNzePkMM0iTzFisPO+F/U6osRtcUlD4eyos+yfl+8wuxAOp4H3LpELZboSBpaw5kP9
	 kVGhR05ov7stRfhnT5Lr4Pdx2IpLeYvw2Mxc7xZ/fNwsie4zBaX2hZORipGhK6zGyE
	 s4U/43gJQLtaQ==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	"Lin, Meng-Bo" <linmengbo06890@proton.me>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Nikita Travkin <nikita@trvn.ru>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-gplus-fl8005a: Add sound and modem
Date: Fri, 21 Jun 2024 01:11:21 -0500
Message-ID: <171895028804.12506.15791059138922631590.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619111523.54301-1-linmengbo06890@proton.me>
References: <20240619111523.54301-1-linmengbo06890@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 19 Jun 2024 11:15:29 +0000, Lin, Meng-Bo wrote:
> Enable sound and modem for the GPLUS FL8005A.
> The setup is similar to most MSM8916 devices, i.e.:
> 
>  - QDSP6 audio
>  - Earpiece/headphones/microphones via digital/analog codec in
>    MSM8916/PM8916
>  - WWAN Internet via BAM-DMUX
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: msm8916-gplus-fl8005a: Add sound and modem
      commit: a39e850037fa520b3e089d4d11b3c3baef4de41e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

