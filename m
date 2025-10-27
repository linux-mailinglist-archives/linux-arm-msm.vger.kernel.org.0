Return-Path: <linux-arm-msm+bounces-79055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 016DBC11D0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 013DE1894F65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA43346A07;
	Mon, 27 Oct 2025 22:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bqqq75WB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02229346A02;
	Mon, 27 Oct 2025 22:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604523; cv=none; b=VWhmgnKmlNLuT4E68CT2AB039JkT29EHH0moRjJBuAlF9cNmps5fpsT7Qift9u8Af07T0QeTt9HhBX/N9xO9giwHuWusqiU32IYSyBsAwLz98HPPN2ANLocgKl+llrbNRII5mxxXZBl44kDA5gR+/QXMxSzaJZpaHg1uO6tMyhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604523; c=relaxed/simple;
	bh=LmS+mySg0Pat3NwqwJftgDKkBpWKjtX/7eQ0Ll9Nf4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nneGft9S9/w2UR9IEZ6NZgTJu/00fworLR1YyUfop9nwPrVc0LsAujtpVUBpntqxiUkXixqGZ6nHAGCH+C/BekfDlGPE8uDySP76RCt+wYq2980jyJNAA9YkIzkNI99WrbHAPLOkFd89mNZgL3dICPNZyGx93C9pf0oX3Sgfe6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bqqq75WB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1414C4CEFB;
	Mon, 27 Oct 2025 22:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604522;
	bh=LmS+mySg0Pat3NwqwJftgDKkBpWKjtX/7eQ0Ll9Nf4I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bqqq75WBs4IRuqRFzewUWmkSQXWK9LVtkjJgqRI/1UBSvpPjljl5yn3avxRFFpi2c
	 iarlJZb/TvI6iJx30hMDgzjFhq+2UM4pWxkqxcOUcOsl8ttxASyAa+f3nhE8GXGj2s
	 cVPz524GBKlNOqvv2w9pZvVMVgCg3rG0q1ChhtI+gSRPZPk5255X6W5SuiCsJ7GbD/
	 vIHKB/WwtkCGu4zKEpwK0cw1PqqEhF+E5MMGBEMuCPeAxGUPq2C1rSJ6bkdmTQj+Ba
	 qSre4llW85IpQI3/UFs0nJxyM7Y1SPKTQQES8F4pJzFSvALKZaeqrGod/O+0JqWEtL
	 ShsZs/YobU1hA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Fix shifted GPI DMA channels
Date: Mon, 27 Oct 2025 17:37:15 -0500
Message-ID: <176160465219.73268.574142904224141061.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013115506.103649-1-mitltlatltl@gmail.com>
References: <20251013115506.103649-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 13 Oct 2025 19:55:05 +0800, Pengyu Luo wrote:
> The GPI DMA channels in sc8280xp.dtsi are wrong. Let's fix it.
> 
> Origianl patch was rebased to the linux-next and formated to a new
> patch again later, then it got the GPI DMA channels in the new patch
> shifted.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc8280xp: Fix shifted GPI DMA channels
      commit: fb48d3f3abba9a7bca2814fa2e9db8ac5b9e16b9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

