Return-Path: <linux-arm-msm+bounces-73768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5482BB59E81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 18:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F99A7A159E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 16:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD183469EE;
	Tue, 16 Sep 2025 16:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jbKCjrji"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EB0341ABE;
	Tue, 16 Sep 2025 16:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758041905; cv=none; b=Fw40ogK91cyJRUAyAN3tb/knassWbib1a5t8qOaNj7fr1tnclFVji0vrV+ON/nVJZqAfr/9fS8zF4BVf7xfS2raATCmbeP0u+NuB10brqtQPUCQ3ysuqwDK+SdVSMzqtJSU/ZrFz2rnsMiii8amz01cZ8AnR8R5jl/ZHkbYdG/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758041905; c=relaxed/simple;
	bh=93fjpf398I4VLGyVUjv3L/BmAbCL96ng9l+D3XyJ1Lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S7aJAAPLxiFMS+szxmlA19kCQWBYCC0dkBQM0zI4p8pfo3STptiCKA4uCSwdZkFGBPL928S25UKtFg5lhaEztPRYQNZZfXwiFRB7lJTyrTJPsYaIj1RXCldKQqlRcKsacoRU2gysLbZ1VIkrFgkgzmaLrp7Jvp9uR48OZXyD6NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jbKCjrji; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1888C4CEEB;
	Tue, 16 Sep 2025 16:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758041905;
	bh=93fjpf398I4VLGyVUjv3L/BmAbCL96ng9l+D3XyJ1Lc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jbKCjrjiflSN0BzdrEFPsFqX+EaMlozthaQPNNn0yXsSeeWYuzymR73xpdpzlIMLL
	 o2GwGVA8HRSHSUwL13Z45xmGc825ihHsCnjJuSiA04ONBsW/oT8XRfbjfDfe9iPanE
	 mlMr8JyAhpf/PkRhxoz5SBfOwsft4D5DOFwkFUwyKnb4lpzByvT+SrB7u4DUXsFgjS
	 uqs36nNjjTSF9qULMTgAINBrLwQJxLWaVVMP2/3pKc9epFMxZLHODRFCo+u8OLOvt9
	 A2iBm4LNHW++/bDEco7erLsv4gIqxM0TVvfQaxJp75Hxaxi+GNztQSAonwqC013mGE
	 Lhsv6nCY2hOfA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dzmitry Sankouski <dsankouski@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: sdm845-starqltechn: add support for slpi
Date: Tue, 16 Sep 2025 11:58:08 -0500
Message-ID: <175804189853.3983789.5515899286200983483.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250912-starqltechn_slpi-v2-0-5ca5ddbbe7b4@gmail.com>
References: <20250912-starqltechn_slpi-v2-0-5ca5ddbbe7b4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 12 Sep 2025 21:56:34 +0300, Dzmitry Sankouski wrote:
> This series add support for Qualcomm sensor low power island for Galaxy
> S9 (starqltechn).
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sdm845-starqltechn: fix slpi reserved mem
      commit: 171e12ff755812dcf98b3ed98f15f54bf264fae3
[2/2] arm64: dts: qcom: sdm845-starqltechn: add slpi support
      commit: 50ced16fe5bfe76cf1cb7f0ff5371b0c141ea6c3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

