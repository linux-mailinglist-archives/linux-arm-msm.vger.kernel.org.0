Return-Path: <linux-arm-msm+bounces-57555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7586CAB2C14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 01:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5962E7A983E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 May 2025 23:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9E2264F84;
	Sun, 11 May 2025 23:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aC7LJLFC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FEE264A7E;
	Sun, 11 May 2025 23:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747004514; cv=none; b=b6CQBqOIp9xbNQczR649SUezHS1KbLWqSxVckQ7t5fcHhY8OFp1HZ8F2nqwRpKsfju6WJfXmcTVmdztnzLwP6q4MtU95afU/Q2JMNgmXPp4xEDkZGYoX9uhD10hITFt/Dz6xQ/YY6O0r+EhSellEtqIcVLyYMoRgWD6WYmKy6YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747004514; c=relaxed/simple;
	bh=kYxmuv7ahIYTKATngz3dp8W0gDaMOThAVS8MW2YBYuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DL7Pq/YS1tBZXlRjMA2Da5ybLUFkZjDmfcJNnMW+jKPgrODlMjZyCwLlnNHKELk/P9QIsFbiX7dZV38QzfXZK/OpodcQfxsV8h/xPyNkt4ScU0TnAiGoPU6Lo7Kb/wdpIJdQi2KSHhEA085IA/m6QwCPNxUBigeIBFgueNtDqRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aC7LJLFC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E3F1C4CEF1;
	Sun, 11 May 2025 23:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747004513;
	bh=kYxmuv7ahIYTKATngz3dp8W0gDaMOThAVS8MW2YBYuE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aC7LJLFC2gtRZKh3eymAWzZ26wkoPD5if/DNHeSY7spQbd0ZH+cd69AxqFreSmqRO
	 GWgUROEy9ucLAg2hS1JWuL6tj7ThhYznVLpuPuiBSWd2WLjP9nVuxjQcH0CnuDErl5
	 L150sPSEU9mcuzVbuyLMYWbwcQ7iMsQ1wIdYXYMNImgWWPOe8akuArVw+Vgq2F98YF
	 RrWHKKffHVR3CrRReXZ2GfoOJ7W9GUhJaHytWShSWN6oOTepJyhATILudcAkiAC2XM
	 FOnj6TW9IRLUpf2/fr4MVJPF207lbF5GNfYBOmRZzhpCmcOef6d0Hd7/b67U5TSu+b
	 e+mJtRgq1CLsw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Selvaraj <foss@joelselvaraj.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joel Selvaraj <joelselvaraj.oss@gmail.com>,
	Joel Selvaraj <jo@jsfamily.in>
Subject: Re: [PATCH 0/3] Add Xiaomi Poco F1 touchscreen support
Date: Sun, 11 May 2025 18:01:36 -0500
Message-ID: <174700447978.10930.10118870419515316823.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20241007-pocof1-touchscreen-support-v1-0-db31b21818c5@joelselvaraj.com>
References: <20241007-pocof1-touchscreen-support-v1-0-db31b21818c5@joelselvaraj.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 07 Oct 2024 21:59:25 -0500, Joel Selvaraj wrote:
> In the first patch, I have enabled the  qupv3_id_1 and gpi_dma1 as they
> are required for configuring touchscreen. Also added the pinctrl configurations.
> These are common for both the Poco F1 Tianma and EBBG panel variant.
> 
> In the subsequent patches, I have enabled support for the Novatek NT36672a
> touchscreen and FocalTech FT8719 touchscreen that are used in the Poco F1
> Tianma and EBBG panel variant respectively.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: sdm845-xiaomi-beryllium-common: add touchscreen related nodes
      commit: 424246ed3e5d1d7b4a33e2b13a30c8d1b284fad5
[2/3] arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma: introduce touchscreen support
      commit: 2be670d00b4002f56b11a57a510540001ef1cacb
[3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium-ebbg: introduce touchscreen support
      commit: a18226be95c7ae7c9ec22fd31a6124bef5675c64

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

