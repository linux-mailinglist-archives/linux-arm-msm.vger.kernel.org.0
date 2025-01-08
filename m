Return-Path: <linux-arm-msm+bounces-44296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FA2A0522E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 05:43:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B57C13A6CDB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 04:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A687519F462;
	Wed,  8 Jan 2025 04:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHkc4FOW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B912594B3;
	Wed,  8 Jan 2025 04:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736311430; cv=none; b=pE03N8ApAe+4+Ei+K8jBVCAhqis+B9kQedF14dLJ3xM4leIo6fUWCTR4/rtyWuTEeUpBPo5tfnbW6PP/ODzKPkzACwMXU0VBpy9RDlMmJt7assWrucwUw48L2NdQQLWMzdM63mNLCckrI0Bg2Urdq3RuRXCCqjcsdFMjxH7Kjzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736311430; c=relaxed/simple;
	bh=3SIyobjSe1wWT8adrg5dcvMRCw+T/iMQ6Ady8+SJwWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BCxSrgr1bLKSUSap+j6JrCj6n25j75eIjX8uP2HXg/8ccZKjnAH1mbMD2KyTgRipgOQkKuTzcXreelyA1lwEMAMWqaC419sKe9zAIMZ00xhLMAicc3jhRdHg2s1bFFXfYcMniYsOHoSmki/fzoZZXunK0ZG6MaPDtB0ugPW9lzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHkc4FOW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFBA0C4CED0;
	Wed,  8 Jan 2025 04:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736311429;
	bh=3SIyobjSe1wWT8adrg5dcvMRCw+T/iMQ6Ady8+SJwWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jHkc4FOW5OV5aUmIJ7raUfIy0cjDKlhhIASSp93+Nm09C64hQJ0lVGMUhJn1wwtpd
	 ApaOtpv2xkw1HosYpuF4EljzEulCWjGWVRQdawgosrcgwRmkoc4ATcN0WdUgdKARPo
	 c+Gzedgo2mUjrBoORZqJVBwK1jziRC6Kl/pGal5qgj3F5L0F/3XCZpOjqVVuW9DJ6i
	 SlBDgFMVD5zesTr/ggqXiOQPIeMomFsGOXWd33M6wuvh4/zpFKptAT7E0MxP7pg0+/
	 UeykkASz0ED9KqADyos/uZg4kdrmdQvjuTsGq8EVMTc6FAZ8wYFlxb8IngU8yD092U
	 Jj7J1yI0EVqiA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniil Titov <daniilt971@gmail.com>
Subject: Re: [PATCH 0/4] Add rpm clocks for MSM8937/MSM8940
Date: Tue,  7 Jan 2025 22:43:40 -0600
Message-ID: <173631142073.110881.7863309609105034784.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241231-rpmcc-v1-0-1212df9b2042@mainlining.org>
References: <20241231-rpmcc-v1-0-1212df9b2042@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 31 Dec 2024 17:00:48 +0100, Barnabás Czémán wrote:
> This patchset contains rpm clocks for MSM8937 and MSM8940 SoCs.
> 
> 

Applied, thanks!

[1/4] dt-bindings: clock: qcom,rpmcc: Add MSM8937 compatible
      commit: 40106d4facbf0bd788126b2b82b25447b1b508d6
[2/4] clk: qcom: smd-rpm: Add clocks for MSM8937
      commit: 19024d7c5ddd90afd49b04967c7d922587c91728
[3/4] dt-bindings: clock: qcom,rpmcc: Add MSM8940 compatible
      commit: ec2514d5379ddbe4191f81d99c8fe6a235d0e802
[4/4] clk: qcom: smd-rpm: Add clocks for MSM8940
      commit: 0ee878729f0bbe3a206002c02d31e7d964958d8f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

