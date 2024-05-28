Return-Path: <linux-arm-msm+bounces-20777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A548D1E31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 16:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0B5C285BF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 14:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4EA716F29E;
	Tue, 28 May 2024 14:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YgAD7SpT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6E416D327;
	Tue, 28 May 2024 14:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716905619; cv=none; b=jueo50Rk446Y9wLgPFfcwgm96gqIs6MF3NxFr9NmoxuK2AH2l0XnwQ1FxD7qusVdUr/EL4rpt7WCRR91Ae9FIpZMjyUH0eou2bld4WyNxYjNjGihiB8Cs3pwRiWxi/YIUmeRF2EurryivB2kqPEzVK9CwWr3u9NIJMXD2XUR0D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716905619; c=relaxed/simple;
	bh=Uz8Be8ZEspivLtcozhzaU3T4UJ5vHZvkS1aTMEnBdj8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pfxOdPDzoPd0wB+ACdiPzz0TgTLlsK+MOA9zI/PSFLJDRlvdB+/PV5Gsemec10IwGYzEn3Q1cF8LVTy2FvRwzO10nJQQ4WmtwsAjskgVfQRdKqZH7ZUXPcacJTG78WnJZyGSx74+mGFM/FFkxXBB3gfLUmJGuTklsjY0bqBXSlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YgAD7SpT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C7EC32782;
	Tue, 28 May 2024 14:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716905618;
	bh=Uz8Be8ZEspivLtcozhzaU3T4UJ5vHZvkS1aTMEnBdj8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YgAD7SpTkzbC2ZfNgTCMF3mniIIMx/AH5Oj93SroKA/O07btcVe7yUJVgRbNP4b1o
	 At9ExMW/5bQO0udAqix2moB/CVgd0XyVJXHOWWi7ebC5jqfQInvqq0x+7btkr9Tu2O
	 4xqjIoD4YNIBTeZ20mXZeD6wHWcE0HRaIlTENC/EKFwpZMVCkks/YHHHFqfBQU6DkG
	 4nUl3vPNBQKeoY+qU/HOFY2lfxvugVBsNKW5F1OctwpJX31dyfIhq1OmgATz3tx7cK
	 1JyPRxC8sOc0SnkDhGgfofUto9AyCDFTi7CXJEiMEW5TPt/qZ6s5XoBwwmHQGBFfVH
	 XpeBT+an8pdsw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: Re: (subset) [PATCH 0/3] SDM670 shared memory and socinfo
Date: Tue, 28 May 2024 09:13:34 -0500
Message-ID: <171690561221.535711.3187424390701003363.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240524012023.318965-5-mailingradian@gmail.com>
References: <20240524012023.318965-5-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 23 May 2024 21:20:24 -0400, Richard Acayan wrote:
> This adds the smem region to the SDM670 device tree and adds the SDM670
> SoC ID to the socinfo driver. In addition to socinfo, the shared memory
> region is also used for SMP2P and the remote processors, but they are
> not added yet.
> 
> Richard Acayan (3):
>   dt-bindings: arm: qcom,ids: Add SoC ID for SDM670
>   soc: qcom: socinfo: Add SDM670 SoC ID table entry
>   arm64: dts: qcom: sdm670: add smem region
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: qcom,ids: Add SoC ID for SDM670
      commit: 1866407831deb945a16c60c38246f28c2475b28a
[2/3] soc: qcom: socinfo: Add SDM670 SoC ID table entry
      commit: 48e4da7919bea2f5c0e20b218385ffe8d5492ab2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

