Return-Path: <linux-arm-msm+bounces-79075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 43319C11DB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 676DC4E8462
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F3F34FF6E;
	Mon, 27 Oct 2025 22:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TXPLt8Ql"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CE334FF63;
	Mon, 27 Oct 2025 22:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604542; cv=none; b=mxLclnZisCWPaCvM6Yv/fUjJb7F8Qr72XyWXp075Xm+eK4vcVnNwQDtBMAFbF/xaid7S8/mdcnyd0Gno6dczvXZIpTHXLS2oDvkkDvUuM6Pq+PxPExyIraXwgt9JTXjTGBlwUZBlWcx05H08eSS3SdMHFD+RtR0hCEHZWteoXzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604542; c=relaxed/simple;
	bh=8MrOJ8hm/M+OvYV6HKO1FumNIs9f4/QJGUqkXKe9x7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MbDHLqRoqwDgLqBG3jOUc3MfZSiX1knuolpVDEl1AAuaPwhExXrttLpEyG+1SmGBL42W3zWHAPUJyQt/cSOgA/CE1fgbP+Sz7resT6br36zTcBckL0pRf0yiMLgeSJS3fgJoD/U6CZuW5Sg8dRN7eUqw2qS3wAgs3/a9v3X8C0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TXPLt8Ql; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA480C4CEFB;
	Mon, 27 Oct 2025 22:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604542;
	bh=8MrOJ8hm/M+OvYV6HKO1FumNIs9f4/QJGUqkXKe9x7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TXPLt8QljP2Wfu85K7CA27WEkDlxi3ZE1BOeLBEDtLpC/6h0XLsXGvyPtvrjH7Rt3
	 jUBgvAm5kLyrcG0bgpJmMuNwCTMSefOWz24cArlO9qUUw4Oa6CNcoI3XMsAvoQQ7PA
	 lqts+LOsw/Cg7q1oMkEYxigNQD8M121mdmWZDEH+3z4LVpVKAtyWa0Tr4xjn2+AJHd
	 4evCsCQZ6hKWVTSqmmtXSNmz4/eb6aKGM4COwSIJNxeWVXbPk+UBOv98TElIK9Rfg/
	 qX5OtT71qyM3KoC6bwT5j03rvcJRZnnD4DvH1Khb08nbAJaC+ZgYjzhCqeJ8hlyMDo
	 opO5N8Nptp7pQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Erikas Bitovtas <xerikasxx@gmail.com>
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: msm8939-asus-z00t: add initial device tree
Date: Mon, 27 Oct 2025 17:37:35 -0500
Message-ID: <176160465208.73268.15556003473353414195.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008182106.217340-1-xerikasxx@gmail.com>
References: <20251008182106.217340-1-xerikasxx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 08 Oct 2025 21:20:18 +0300, Erikas Bitovtas wrote:
> This dts adds support for Asus ZenFone 2 Laser/Selfie (1080p) smartphone released in 2015.
> 
> Add an initial device tree support for Z00T with support for:
> - GPIO keys
> - SDHCI (Internal and external storage)
> - WCNSS (WiFi/BT)
> - Sensors (accelerometer and magnetometer)
> - Touchscreen
> - Audio input and output
> - Vibrator
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: qcom: Add Asus ZenFone 2 Laser/Selfie
      commit: bc42d98593535ccca739f67d9b9cb859f4e13304
[2/2] arm64: dts: qcom: msm8939-asus-z00t: add initial device tree
      commit: 42621cbb3afd47e1e3000abe2da8ac33286fff4f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

