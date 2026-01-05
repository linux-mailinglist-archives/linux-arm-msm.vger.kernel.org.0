Return-Path: <linux-arm-msm+bounces-87484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E1ECF422D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:33:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93A57304485D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA3F7339859;
	Mon,  5 Jan 2026 14:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qOq1I7/T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F2E2FD1DA;
	Mon,  5 Jan 2026 14:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622104; cv=none; b=HaoMrqUjlbTM6D7zINPoNQdqbHScSgYfPMxKq1KPhr/uxbQLuiuDEjejOBenDwDlbbOtPkg4Np8o24HVAmp2eerbE+1o/6clfLVcQzNfE27XLh1l5B5ZpULMBsDU6P7cbI12mK1R61hpxl8Bg/aN3PDdUDx/EF1dsyVbzY8WNso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622104; c=relaxed/simple;
	bh=oSaGWQ31gTMcTuSGzPb9KkIJXfC6Y7TenizPkXSfDp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FlDi0EBDwWAUAQpMYb7EDh81IgHdT9BGdsyp5Ss/VGYLOZaYeiP7fNHbtrN7exJfaknw+B5A+reGGf8ilETlAyMb489rgSXxKtwmlOUb4NKP5bVafWyTei5Gh/vKmRwpv8CfOFYw+IMhdeBx5oii/mII3PFH4nw2tf5J/LTVXlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qOq1I7/T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DDE7C16AAE;
	Mon,  5 Jan 2026 14:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622104;
	bh=oSaGWQ31gTMcTuSGzPb9KkIJXfC6Y7TenizPkXSfDp8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qOq1I7/TlUjg45TyNL86zHIFLXTYh4iFxKGMzpvDWHiap+UtZdX1T9AkFJximlI/P
	 +DOzXS/RxCyVSiZB5Ej/FHmzh7pBfWaumGuSpwN5OEswJfkzYCvdDCvT9zxwLltn91
	 iYMxQy80oQccyeU27NqvGr07IjxV/LTUJM7otVBg0nXtMoz0WG9Z5eWMqP0pC6GQxs
	 SdAS4YKYgYRdiKt+JIDlYb8m4QUKTREgFD1WQL8Lb6qh99d2hyCnsvdna001S2IwY5
	 LVBjwKfWYbaB/mSSYAi2SM7MdzKr5dDkSWsMmxwfew1PmbP7Def2EP930uaq4oRroG
	 g4lFJHqDiR+LQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jens Reidel <adrian@mainlining.org>,
	Bhushan Shah <bshah@kde.org>,
	Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: msm8974-hammerhead: Update model property
Date: Mon,  5 Jan 2026 08:07:31 -0600
Message-ID: <176762206392.2923194.7000541435845887652.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251208-msm8974-hammerhead-model-v1-1-88975f30cbaa@lucaweiss.eu>
References: <20251208-msm8974-hammerhead-model-v1-1-88975f30cbaa@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 08 Dec 2025 21:41:02 +0900, Luca Weiss wrote:
> Many years have passed (more than 9 actually) since the introduction of
> the Nexus 5 dts to Linux and it's high time to update the model property
> to be a proper model name and thereby bringing it to the standards of
> the 2020s.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: msm8974-hammerhead: Update model property
      commit: e5e22c8ea49e62c390e3843a632727569f6470a2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

