Return-Path: <linux-arm-msm+bounces-43397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 041019FCCD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FB587A00EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 973141DDA2D;
	Thu, 26 Dec 2024 18:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gvCcLmj3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3DB198E9B;
	Thu, 26 Dec 2024 18:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237653; cv=none; b=RaiWIduFWRRzYQQgCtFAwJkv6rCBQxy+Fw2Us2oXOvMadck+XdMXR7+gP+V17weZrypamdHzUY0xyYWB/r3q/nbD39Qm7ZYerKyVjij3yuNQkVTogQOqLRa4Jfg/jxm0OFTpckYjPX4g/PAbKTSy4N9ShlZZcgWxIgecUjHdHN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237653; c=relaxed/simple;
	bh=wiHAYMlaZnvLr1hgim1YMb7gxYlq1ThyIG0imbA+IAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YvrExJj4yjn4b8ojNW72zft0pAjeWAX1kb7F5xSsPpbRXplsZPny79vy76wlZVJooJ5woBnD4pT7umejRDyCoe7IGYv+8bKjqbr1KOOiTtMtno+NGEyYr6jbndrab9DHJa4blMTx9y0KMM6in+Btc9XdCy3Kr3EqFatVqLJucF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gvCcLmj3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B741C4CED1;
	Thu, 26 Dec 2024 18:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735237653;
	bh=wiHAYMlaZnvLr1hgim1YMb7gxYlq1ThyIG0imbA+IAE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gvCcLmj31Wm5ySBZzq6kbWHqiVV577klPlktZu6UQ5SW+DOxuLmeJcjHfNbxRr1OH
	 g/kPrkev66JBDDYKLU/pQDRCDLIdgqBrhdnEIQUPX91SeCfuoP0tVMF/yw7jzElrxa
	 QYDeQFB0MkycCEtDdUQPtYLiHv3Shx6fIwNd6A/4w+yqYPWtifC+i1eWxxpjVt+rqG
	 5LuRF0b6qxvS4mqFBA/qOR0a+qIJfWsgQVx/7UEUiEEeQuti7XdLeq634k/OprarlZ
	 BiZLmTHFqMKGoIgQoJ6bxIxB1zcQKu8QnGTry1bvzIWbbJ6zd887aa1VaI3h4iPqF4
	 BAnvLNtJKN9xw==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@denx.de>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8996-xiaomi-gemini: Fix LP5562 LED1 reg property
Date: Thu, 26 Dec 2024 12:26:50 -0600
Message-ID: <173523761382.1412574.17501027929471451345.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241006022012.366601-1-marex@denx.de>
References: <20241006022012.366601-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 06 Oct 2024 04:19:48 +0200, Marek Vasut wrote:
> The LP5562 led@1 reg property should likely be set to 1 to match
> the unit. Fix it.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8996-xiaomi-gemini: Fix LP5562 LED1 reg property
      commit: 02e784c5023232c48c6ec79b52ac8929d4e4db34

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

