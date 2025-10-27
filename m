Return-Path: <linux-arm-msm+bounces-79064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BD9C11D55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:45:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADE1A1A65617
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BCBC34BA2D;
	Mon, 27 Oct 2025 22:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K1GNez6b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D9D34BA20;
	Mon, 27 Oct 2025 22:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604532; cv=none; b=rqleVUwLm3Rw0op8xyFddUblhHpNW5MVIWEDI17W6w1p8KY46d0sZAJUWvhw2y3mgTDXmXN9JqgeyGrJgxp6DqkOx7fNU9LDXi4K7ELXCfyDfu5h0nhgbVK5Yql3zrNiIIW9x6kXCH2vfdbqhlUS4p86kknyzkZ+i/m/iklPZDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604532; c=relaxed/simple;
	bh=n5yFcw5o1kzF1GRsvPD3g5vdgb/VGStkxFBF+N/tD0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BtKsrwk2o+TJdzFGt1J7k/D/n47x79P4Us63mKQWTXxrMW10G6uUldGhSj66Jxh4rA6AhrLLrmBDcH1aHCnDb87r8FLCXk1Z3LB1ppOAh2Cd6UyX+kAk2olT81xhgITtA3Aw8XrE5TesQAO6fPsDFT85qf9d6q7w+tYvHFqJpWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K1GNez6b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 200B4C116C6;
	Mon, 27 Oct 2025 22:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604531;
	bh=n5yFcw5o1kzF1GRsvPD3g5vdgb/VGStkxFBF+N/tD0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K1GNez6bRt/4mFVP9Kr+zuyw1cZQU2sRYOprDUwbJXH6/fHoIA1XfrvfcbFe5mZWg
	 rD3adsaHAQ0MZcZmDc/7ZoiBJo0LYTiU/fxN+Ut9qR4y+XZaThqEONZsmNzBffoTBH
	 UKGSvw427vuzmq6PcnugBSkXzSVKjkwtRHMH4SyMMBRXNsDDJo0GroIymUqkmroOt9
	 iDxJ4Bm2SDJ3AmF/7lodCH4zRilOVSkefEwn5PPBsC6OJa5c0NmvlkzsflwKXwPP1C
	 P6I5ZispKDvt69fhAj0Q0IQQNJ00/VVd/YnvVAXuVGQ9ubXQSPLZsiGqbTMmvEzgr2
	 DYKw8SWMGnflg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Albrieux <jonathan.albrieux@gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-longcheer-l8910: Add touchscreen
Date: Mon, 27 Oct 2025 17:37:24 -0500
Message-ID: <176160465189.73268.9104821271911890245.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919-msm8916-l8910-touchscreen-v1-1-c46e56ec0a3b@gerhold.net>
References: <20250919-msm8916-l8910-touchscreen-v1-1-c46e56ec0a3b@gerhold.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 19 Sep 2025 16:49:32 +0200, Stephan Gerhold wrote:
> The BQ Aquaris X5 (Longcheer L8910) has a Himax HX852x-ES touchscreen,
> which can now be described with the bindings recently added to linux-next.
> Add it to the device tree to allow using the touchscreen.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8916-longcheer-l8910: Add touchscreen
      commit: b91f5d73b67b1f49c250cd443e853ca72b81eaaa

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

