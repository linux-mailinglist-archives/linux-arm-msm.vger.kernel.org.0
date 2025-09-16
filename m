Return-Path: <linux-arm-msm+bounces-73767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CB2B59E7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 18:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 078433B1604
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 16:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E42B32F77B;
	Tue, 16 Sep 2025 16:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WlsM6Lua"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100CB28D8D0;
	Tue, 16 Sep 2025 16:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758041905; cv=none; b=MapKu8pYaRhRXTf9/LoonfgHt71R3aVzT0LRaef1G2j7v+CxpoM4ir77SU7qdR1X0WZ/LaobOe8Zt5HWeYtOsCQ+1v2NC8D5RYP/bU7I34Upe/iUR5KUUj2WFKGdGYOm6hP8G4hiq83LOsx1ElCBL/TV17XTWh7JNbq+h+Gq2Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758041905; c=relaxed/simple;
	bh=qXtf/DMwbrxYnqxGJFqCfEPREe6f4ULK9Fuo7zPPESI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZAyfMdyNtM0zfmTD6l0nyOsA+9PkNS0H7Ftnjz40W9cDa+Hqc7qBr9oM9PPNFfScTNRlVSrCawccKg3dW0Z3dloVaOegCNAXF7JjaPEzkelllXVGP0VltXNV3LE/mO/OE5oUYhioK6A2NiHcQxvWnXEDG9WmfTM3YYyjryXYEqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WlsM6Lua; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4011C4CEF0;
	Tue, 16 Sep 2025 16:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758041904;
	bh=qXtf/DMwbrxYnqxGJFqCfEPREe6f4ULK9Fuo7zPPESI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WlsM6LuaLLcAPHUG2sfjDSsQmV5CY/oRmu7xdaUb6ci+/WqAVzL5RFx/JBr33oRWK
	 LA2s3ERfIkcxVBy3eiSgkGS5S1LLS6Mm1RWAQpaCC2wySr2+M/dUF3NCeUZc1rs9k0
	 Ys9pyH+hJtLpGfLUnzNm82LMeId26ZVHXkdCvVJF03dnhHTh3EWxd2eVRaC675LXf1
	 Y7Wq36+BX3tD3SDNlhlIC7DA15jHmVkzp7ja8DHK2ohKcIufFeAHFijZ82dvP3Adua
	 sumnw8GH5iLtHAUf4JJDNw2sA+se9m5dN1AkKdlmq55TvAM92fPxZnon85722YaeO9
	 eX+Cm2uLQ2yaQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: qcm6490: Introduce Particle Tachyon
Date: Tue, 16 Sep 2025 11:58:07 -0500
Message-ID: <175804189845.3983789.16459612683691453692.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915-tachyon-v2-0-4f8b02a17512@oss.qualcomm.com>
References: <20250915-tachyon-v2-0-4f8b02a17512@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 15 Sep 2025 23:24:14 -0500, Bjorn Andersson wrote:
> Introduce the Particle Tachyon board (https://www.particle.io/tachyon/),
> a single board compute with 5G connectivity and AI accelerator.
> 
> The boards currently ships with the Android Boot Loader, but replacing
> this with abl2esp allows writing a EFI System Parition and OS partitions
> to all of LUN0, and a more UEFI boot experience. A prebuilt version of
> abl2esp is provided at [1], as abl2esp-v6.elf.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: vendor-prefixes: Add Particle Industries
      commit: 3bc3ff8fd2fe5886043b38d3d3c9d6ecb12d0a83
[2/3] dt-bindings: arm: qcom: Add Particle Tachyon
      commit: b727cf24feb56a93f7bafbcdce7ea99b9ccb16cd
[3/3] arm64: dts: qcom: qcm6490: Introduce the Particle Tachyon
      commit: a319cf4a4b09a1dd3b2652fc96f4f08c0647ae64

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

