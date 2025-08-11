Return-Path: <linux-arm-msm+bounces-68595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80541B21944
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 01:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07D8B622053
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 23:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1284280A3B;
	Mon, 11 Aug 2025 23:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hy6ZFCd9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75473224B15;
	Mon, 11 Aug 2025 23:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754954851; cv=none; b=MEVVgSFNdqW3CdQlPrnNy0Gk15LILpRIy5dctzSiwwXGcGjPMhUd1XCbUNjPek/9oztwVQPo93vO0bLiRFI2hJsD3GWUBthSQ68XXFYC9lB6FD9fWTXTyrLG50xaNMqCY+JU3BaDoc3qf33HSVq3GyDwYv+QEAS/kLH0nSOoypM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754954851; c=relaxed/simple;
	bh=yjn+r2zANgcehBxJNtGwM3VVRQDKPpldJoKCRTp2U1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FwqgHwm0jTPDlHyvP21WsZncPqOmgCG0DzNq7+6u84Ixo6xrB7kD12T9NSnEDjug6Pa3zN74N8UofDLO07xoH8I0uNbg8ZqGJnl1B/Qc9NuYOqXUh9sYKwLwqSNXQxOSR1CQfUThyPucsRv/kMwpalcrWf8FNyHa8iFH6CZfdxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hy6ZFCd9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D1BC4CEF8;
	Mon, 11 Aug 2025 23:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754954851;
	bh=yjn+r2zANgcehBxJNtGwM3VVRQDKPpldJoKCRTp2U1E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hy6ZFCd9r/vXSHqyKuUG6tbutE7TxUJDas9BeY8mygMm7h1/MhYI08lni10WVDbnU
	 ukOvJaKyNDjJcrwFt1jjpuLIpGLrdkPBtU93M8xk77OmR3kUGe+wiJhA/VT9q4Smtb
	 DRuIPkLNJuVZzDU0Oig3kMqBrEeLsgycMJRwMbEMrRck7114dAELBsZGDlwzhBqnVt
	 9sKjM/tpFJ1UR5Ojb4Td+y3RKYxJmNng+DspwB+6TKjgXuj1cZ2iDDbLscyTQkAGKG
	 tFnP1agEKb3O+dx1CY24CuuAQ+LB8bwwIVZa1RGXENkB1t7P/0F/R7WKyDCDCMten9
	 JEiL4mtnxEoMw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luka Panio <lukapanio@gmail.com>,
	Arseniy Velikanov <me@adomerle.pw>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH v2 1/3] arm64: dts: qcom: sm8250-xiaomi-pipa: Drop nonexistent pm8009 pmic
Date: Mon, 11 Aug 2025 18:27:03 -0500
Message-ID: <175495482451.157244.15154728896879506058.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250716141041.24507-1-me@adomerle.pw>
References: <20250716141041.24507-1-me@adomerle.pw>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 16 Jul 2025 18:10:39 +0400, Arseniy Velikanov wrote:
> PM8009 was erroneously added since this device doesn't actually have it.
> It triggers a big critical error at boot, so we're drop it.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sm8250-xiaomi-pipa: Drop nonexistent pm8009 pmic
      commit: 92d05aceadbd799b416ad08bf2f741a096bf3e56
[2/3] arm64: dts: qcom: sm8250-xiaomi-pipa: Drop unused bq27z561
      commit: 56197c8737b88d300cda97cd71b64b8a93cf6f70
[3/3] arm64: dts: sm8250-xiaomi-pipa: Update battery info
      commit: e2ec684f82536d62e0d60663ed3689455a9b0b9f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

