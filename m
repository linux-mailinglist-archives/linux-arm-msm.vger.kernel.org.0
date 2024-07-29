Return-Path: <linux-arm-msm+bounces-27162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBB893EC0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 05:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92B7D1F21E2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 03:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14F5823DE;
	Mon, 29 Jul 2024 03:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rjk5BaiN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D89C823AC;
	Mon, 29 Jul 2024 03:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225520; cv=none; b=US0a0UJZFwOP11p4D8hSgUmhdfsfh/k+eTc2mVH0b6z0Fx3yOue/ux+JXeKW7HvnKT9xVfeZtcqti8kjiHFahD1xa2ok2dcnmgCkplsDlvWWrP9NZB9aZa4RT9p0yREySza7sa8o9gc3xIu3atpegk9H+cl7679qvMtIWEOA9j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225520; c=relaxed/simple;
	bh=TA5poETAAz92aOIyTBfRr7V2ADhM0BC36aDqASPb1yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K6y+zAvLZk/U2+sPVFMe3q1ZRgimLxL5Mm21u75fAA7/ObeoRMwVtl/Dt8FgR3WG1hSbEzgQHUaVSCWaJwOZLS75l6Yq2sRV3oy7wISgGdM+Ez4wTXK5BSA8SP4W6GWtgyE2OvOyg1pvM2OBGyPR+TzwNQXhWMfq9YkV6iPHg/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rjk5BaiN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C9AC4AF09;
	Mon, 29 Jul 2024 03:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225520;
	bh=TA5poETAAz92aOIyTBfRr7V2ADhM0BC36aDqASPb1yk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rjk5BaiNex5Nb2WgfjNPLRG+bP0SIXreQ/mpaGms+hfyPfCXlYxiqW+yYwbcvpqlw
	 mdDSUuS/k6JWBUoACxhdnQW5Ga5R07PoksOweJKBZlOeE/Sz9jh1EzT3eU2V+EKuX0
	 6845m1hzOUmsFHWgjjCNzS1QjdIii9qNBpsmrtW5WNENJ85J8KBwf0tB18/QTRlSXa
	 nQQ0+9gxyZaHd8KDtkQ+4x+ougfE+wQATXPFHZu2RxZAFu70l/AJnQ0nLfYsgGyOE6
	 0PNX2hLQazjjtyqes6mQcag/RJEE+sGFmLf6R0pwpsqlH07twYYOuCWVGHsYYpWw3Y
	 r6BHnkIlqpanw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Amit Pundir <amit.pundir@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	dt <devicetree@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550-hdk: add the Wifi node
Date: Sun, 28 Jul 2024 22:58:06 -0500
Message-ID: <172222551318.175430.1023758913285401428.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718125545.2238857-1-amit.pundir@linaro.org>
References: <20240718125545.2238857-1-amit.pundir@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 18 Jul 2024 18:25:45 +0530, Amit Pundir wrote:
> Describe the ath12k WLAN on-board the WCN7850 module present on the
> board.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8550-hdk: add the Wifi node
      commit: 73655137a570e4a3cd226fd9f17920f507cec028

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

