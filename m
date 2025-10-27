Return-Path: <linux-arm-msm+bounces-79027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E26C11BF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1CA363528F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271B7330B0D;
	Mon, 27 Oct 2025 22:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kShaVJFS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD2433033E;
	Mon, 27 Oct 2025 22:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604496; cv=none; b=Pha2IwJAE1Va649NHNFEVp1SGEeFFNYBm5lgJJJnFiCgvxdj5cBAdOQeqvuJ5Mz7mxfrnCoD3UkhVpRTGD1YQcA6hx/N840SgXHi3C+39WAUN8w50LdfHY5UP3YvO9xzHuTpoXxJSC5HOpNdZk8HsqfHPhnQIus8C2xLAnfbboI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604496; c=relaxed/simple;
	bh=hskzDD8HUeXwC50IhNj2Mu4+m8LF6s8opBnhX9/UfpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gNOre4DaIEtQtIxZdtO+rlEIb6AQasDOUxPakYK5+dev/QpqptoHbw8U0fXQl7vnGIMZ06Cao1/x28LEwQgwfb93TjYa+rwgNu6QDLorUGrpC4QqdStM2JCZUBd343QNfDJOeaxsr8HwlHXekQ7ou3+XM7nzAzDp46HeZ9vnc+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kShaVJFS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3541AC116D0;
	Mon, 27 Oct 2025 22:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604495;
	bh=hskzDD8HUeXwC50IhNj2Mu4+m8LF6s8opBnhX9/UfpE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kShaVJFSIi+iCAs6uKFp4qJe1vDck5CYgiVE4IyzIUtfg/lZaaxhkrwWGBfDmoXFL
	 KBbN4SEzF4N3zFawA0oVQoxxqMxFQhIb3FYvvT5BDll1msK4CaLSZwM7jCdGMAuFl+
	 btCZOPNXAeJbvJGsrfl2FPfcW/Xy+fGZ63/iYlgtviCMAE8gYnvEUiefJ7E81F5hkw
	 eysDIlnQAHMrZh2+4MgGyhm/Pz0TIU8//CnHQmAgr4ce2u19oacEs+dVqkFJbDSEoD
	 Pnexa+0A8gwSD6vUOuv+XpZ6fCxK/x1FbBmkk6bO+mS/aaoaJ5esIqYrLpXWtdE23s
	 bCx9KGlXUDKpQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gergo Koteles <soyer@irl.hu>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: Correct gpio used for slider
Date: Mon, 27 Oct 2025 17:36:48 -0500
Message-ID: <176160465200.73268.12852755495618000388.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250927-slider-correct-v1-1-fb8cc7fdcedf@ixit.cz>
References: <20250927-slider-correct-v1-1-fb8cc7fdcedf@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 27 Sep 2025 13:20:28 +0200, David Heidelberg wrote:
> The previous GPIO numbers were wrong. Update them to the correct
> ones and fix the label.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845-oneplus: Correct gpio used for slider
      commit: d7ec7d34237498fab7a6afed8da4b7139b0e387c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

