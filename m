Return-Path: <linux-arm-msm+bounces-79058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BC108C11CE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:42:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 68D91353B26
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FBD347FC6;
	Mon, 27 Oct 2025 22:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3PmDVIr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFDF346E45;
	Mon, 27 Oct 2025 22:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604525; cv=none; b=BrLAHYDbICcneXXwQHmuuWyjwhAkFKahbXKF3xSCqgMDJZ17CKiYC0mrbHlYZOQMoOx5AueoZkNXSwPLUrz1IDlMbcU5secyX2DYeDCWYvkVamEaVoBm4zLksTw5L/3Ewcdzqfz1WJZaELItWh+q8vLH9mwcYGpTQleSo3ZN/2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604525; c=relaxed/simple;
	bh=3mc6VYIH9+zXVbfurOKwLhCS9Y75h1WKZ+pOO6+zvc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NVqop2S1XKRaBI1Jb8eO0oTmtoEKNqga8JZ3atab2pObpz26LrBVujTvX3+87hqsh4iONPRyS6NyULx0PnIJMTkl6JA9NEMg+bqUM0C1d1+g4PZHqqhc4QryRM/5csmcDc81AAe2Axve8rb5nDTe8Frku0aGeLCUApfNuavia1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3PmDVIr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC95C4CEFB;
	Mon, 27 Oct 2025 22:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604525;
	bh=3mc6VYIH9+zXVbfurOKwLhCS9Y75h1WKZ+pOO6+zvc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b3PmDVIr0DXcmo0TJ48k0ZuHAxaKpui/SzujPVupaLNKg7GgrW+U0bxLDrxvw6bkZ
	 rfgtBDgpwQqt+Lf2DMQIVa2/ebN8/IkqkHC1UphF9jSnwxyqJd5NU7T4VxldW3XjRR
	 53rC1OUivYbAKwXYHaZOkcq+q1JIJflCQE67QRoJOkOUyvxqPB4M2j5FZnK1JOTqhr
	 4NynJ1rMi51TFzO2qp0JCzDfOfDNHC4+NBhQt2Wd22FdZQoUpl114s6qkLq2pzeAMr
	 f0hv3xhS9aw0Ap6HmF8VpyeSbAeLeNJzXSTz2TUN2crcOyvmf6SSHp6Q63QLn3HXWW
	 7rzvms0VBf4tg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: quic_srichara@quicinc.com,
	quic_varada@quicinc.com,
	kathiravan.thirumoorthy@oss.qualcomm.com
Subject: Re: [PATCH v1] arm64: dts: qcom: ipq5424: add cooling maps for CPU thermal zones
Date: Mon, 27 Oct 2025 17:37:18 -0500
Message-ID: <176160465252.73268.12350962000691210732.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023043838.1603673-1-quic_mmanikan@quicinc.com>
References: <20251023043838.1603673-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 23 Oct 2025 10:08:38 +0530, Manikanta Mylavarapu wrote:
> Add cooling-maps to the cpu1, cpu2, and cpu3 thermal zones to associate
> passive trip points with CPU cooling devices. This enables proper
> thermal mitigation by allowing the thermal framework to throttle CPUs
> based on temperature thresholds. Also, label the trip points to allow
> referencing them in the cooling maps.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: ipq5424: add cooling maps for CPU thermal zones
      commit: d5e86096feb689c9f5d9aa07c913747ba430a600

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

