Return-Path: <linux-arm-msm+bounces-88359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE64D0DAFE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 20:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B96F1301623D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 19:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1212D8DB0;
	Sat, 10 Jan 2026 19:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JE8GU/lE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75022494FF;
	Sat, 10 Jan 2026 19:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768072304; cv=none; b=WSSaNIm8Pbfue01EiOAL5gZlH0gbIDS9w3CUMWJLtYdoTCCuibAA/MU1EShjqIaJh2RtNTmaTLMraZSEx0J1cxvhRfvL0JGf4xCxVkw1C3FmH4uurk/ocXnZeUTChj2ZEM9B5oS3qHRqpPTyncqFEPNlidwGxjJ1G3LdFHjzFW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768072304; c=relaxed/simple;
	bh=SBC3y5NMBrGnJXeYirZbDnJ/ctoBoxQBYPKcOV/16Qc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r+vF0TGQOYNn4I9Hx3Wt22lkfJG5VvOjGiKJHxuf0pE802PfdMxhXQpLB46YfyB7eu5iaUITX56+emTJ08D6h34MX/sbZfFUxvouVp+87JvVYztWu8o2P+5gQvLjQOAYxaJ+cXENesVVI1eGN7xRZRGWV65Z4MpGfDKT17wvFIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JE8GU/lE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B4F4C116D0;
	Sat, 10 Jan 2026 19:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768072301;
	bh=SBC3y5NMBrGnJXeYirZbDnJ/ctoBoxQBYPKcOV/16Qc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JE8GU/lEvFL5VV75HfsB9ItFGvdiTcPZXrhlWCl4G4bJaov6vtNEjw1iv5ZfOTTbb
	 2osjaxFu7MO1T7gpKMSO9rylXirisAxpP6EeAGDl7cvtHf1MJdl4tTZTLW8AyQBofa
	 BerQKmBH0x9JpenwoFh43ddm3+53ytpADKMWJNG0xA9jz70ux16fcda58eocHEQnhh
	 KZXe/8wE23ZO6vy2UV3JWpyh9A2FM9sVE8litkt4Y01/IPwnmRSoqA6/318DY6//Kr
	 iSKaTtTBxPNfZEQyKpkRPC4F//Pr910wn+i+MOezWjIlQbxFrLIZLshkQKTCbIitvh
	 AHZbFuIBZ8ATQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nickolay Goppen <setotau@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux@mainlining.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm630: Add LPASS LPI TLMM
Date: Sat, 10 Jan 2026 13:11:24 -0600
Message-ID: <176807228434.3708332.15241559768508077782.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109-qcom-sdm660-lpass-lpi-dts-v1-1-d3eb84f10a39@mainlining.org>
References: <20260109-qcom-sdm660-lpass-lpi-dts-v1-1-d3eb84f10a39@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 09 Jan 2026 17:03:59 +0300, Nickolay Goppen wrote:
> The LPASS LPI TLMM pin controller controls pins for use by the analog
> and digital codecs, such as the PDM bus, the digital microphone pins,
> and the compander pins. Add it to support the codecs.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm630: Add LPASS LPI TLMM
      commit: 0e09a596ad2e23d62e2707d5d1a68eaa76787f1b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

