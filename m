Return-Path: <linux-arm-msm+bounces-20683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A64258D12B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 05:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46E3B1F225BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 03:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673FC6F062;
	Tue, 28 May 2024 03:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmKZnIPn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6D8175AB;
	Tue, 28 May 2024 03:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716867172; cv=none; b=KmIF8U9FG8kNWv8X77he/bvw55im7Jan1Xd8asrs/MplWk28T3TSc8gdf3f0rzjfT32PaOUdh87VFkZS5VxUDEv+E+NQK3YSvV+5c1u61KPVDMrApAMRncDHLZBHqAtDxOxpsRg+LmeyUbsCcVGFinSkIpOdbgK0Wy000Aort90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716867172; c=relaxed/simple;
	bh=Pzs6rAl+Os5a8UYy7z9/wmfBQy+KV2M+8MPnC8ZPMEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ctcXC3Spu9jWR9mDVYmrZNqj0E6vDwykvpE+jw1DXmz8R5rGFCsDd69xBYtAr5nFtz0hLHJ/v+RUDW1zwy0cIyTYwGia6KCdI4QgQnergkeFZJT0coySP7SWrIty3xmaZg3dkPs0RolvlLXMtbH4e6UH51DDorBOxarCgpwzq+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmKZnIPn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB38C4AF07;
	Tue, 28 May 2024 03:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716867171;
	bh=Pzs6rAl+Os5a8UYy7z9/wmfBQy+KV2M+8MPnC8ZPMEI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gmKZnIPnNK3g29Wcru+aBtBOQxafD+5woMVduH4CRxyDjuBpCTHaVv1uk6pNtUSA7
	 0PpMBwbreOJE4pZoQblge+whk405hEozvHOdEfOENRWwOmTULJ1R+BhoFRgKHQv8fn
	 lIIFV/HfImK0cIvRX86uwQWBPJeoDLF3nLDXk6zOVxPNVJhCw8Efgsd0p9qKxFSuhX
	 MQGJst2EA5mSGmJo6D+G3heS8pgJDEqgZSA4lA0X5/6imEZdvFD2HQv0tFNEbj3SRP
	 26dRHO53p0z3CFqPTLA+8GHRizSuJoWQNNah3VwKH2fOhb5Itq6OmRk/JOWYvY5gHo
	 w2zLcOahoafoQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/2] arm64: add minimal boot support for TP-Link Archer AX55 v1
Date: Mon, 27 May 2024 22:32:16 -0500
Message-ID: <171686715171.523693.8312722278124024372.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240326-archer-ax55-v1-v4-0-dc5b54a4bb00@gmail.com>
References: <20240326-archer-ax55-v1-v4-0-dc5b54a4bb00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 26 Mar 2024 15:52:26 +0100, Gabor Juhos wrote:
> The purpose of this series to add minimal boot support for the
> TP-Link Archer AX55 v1 dual-band wireless router.
> 
> There are two patches:
>   - the first one adds the compatible for the board into the dt-bindings
>     documentation,
>   - the second patch introduces a minimal device tree source which can be
>     used for booting initramfs images
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: qcom: add TP-Link Archer AX55 v1
      commit: 5c59666c443d730991ddbe46b098dc473cf56a55
[2/2] arm64: dts: qcom: add TP-Link Archer AX55 v1
      commit: e6d33c8b2f8063e1f195cfc0e7f1c9e21066d13b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

