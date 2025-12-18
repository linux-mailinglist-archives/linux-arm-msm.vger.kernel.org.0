Return-Path: <linux-arm-msm+bounces-85622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFB8CCA222
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 04:04:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE906302E14C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 03:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B9032FD1D6;
	Thu, 18 Dec 2025 03:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hympmtEK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF9D2F83CB;
	Thu, 18 Dec 2025 03:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766027031; cv=none; b=G8n8PdslaPpfEpBEHdoExc2/Cp38/I+9cONKQnDWdDnNvJ4h7Xo+jkOZTyY4m1WJ7BUoqTRqq0nVLGvip240vgCJyBJxvZzEm4FVBWW9ApHc9q3iUwcPhaQbsYCvUmSZiP8ynNcCUOL89v0HxTwUJjb0J9k0anlNDTisd+P2jHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766027031; c=relaxed/simple;
	bh=gCJpWF+/MuOdnGbMC1H6UPbCZ3crCTdNp3W1x8K8BYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WPaZiQplTn9DvxdJKpAtryd+nQ3VVOra+mWJ7FxHEcGTM7pU7KagCV6rpKXW6E9TLvaS9aB3EyOpw350nTFfZ/3azQIGQbdxtqdDG+FNY3oTvrXbdwedRtMhlrBDx4rXToW/Ea632Nk4Ks5CLcLfAMqTdYI8ookRa8swA3oXoEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hympmtEK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22A4C116B1;
	Thu, 18 Dec 2025 03:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766027030;
	bh=gCJpWF+/MuOdnGbMC1H6UPbCZ3crCTdNp3W1x8K8BYA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hympmtEKPEekzNwuPvpf3aE8iTrXVUENc5LKZbDeJsMvndsdfhKtKMfkI0ZDNa3yT
	 P5EBb/U4tVtLBNHqnl60vvJ1LAX7wEnyGKKPtS7/kCCITnX+on59SDbO0DvpcEVbZI
	 FQYSn/YyrZrDIVPXSt/Dl18xlgBLbQUbbiA8N6irIf5I515NgINiDS1M9bhXu2KjKM
	 JTNu7AcwlUI25T78IKihIKcEEctnByKUBNL5HMaxcn8CM1GTQ1sFlDiJ64ls707x/y
	 fCKW/gC2a6dSA0mtfmSfgHloXBbJoq/UsMn4RIn415a3goMi1fSDrs0Ha9/jBtp73T
	 EkLiYlLGOb0JQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/3] mailbox: qcom-ipcc: Add dt-bindings and header files for Kaanapali and Glymur Platforms
Date: Wed, 17 Dec 2025 21:11:50 -0600
Message-ID: <176602747930.229487.3872286102246239208.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251031-knp-ipcc-v3-0-62ffb4168dff@oss.qualcomm.com>
References: <20251031-knp-ipcc-v3-0-62ffb4168dff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 31 Oct 2025 00:41:43 -0700, Jingyi Wang wrote:
> Add dt-bindings and header files for the Inter-Processor Communication
> Controller on Kaanapali and Glymur platforms.
> 
> On earlier platforms, Inter Process Communication Controller (IPCC) used
> virtual client IDs and performed virtual-to-physical mapping in hardware,
> so the IDs defined in dt-bindings/mailbox/qcom-ipcc.h are common across
> platforms. Physical client IDs instead of virtual client IDs are used for
> qcom new platforms like Kaanapali and Glymur, which will be parsed by the
> devicetree and passed to hardware to use Physical client IDs directly,
> so header files are defined under dts.
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: qcom: Add header file for IPCC physical client IDs on Kaanapali platform
      commit: f4a269eb1328d855314c858b5e903eca92ca3b36
[3/3] arm64: dts: qcom: Add header file for IPCC physical client IDs on Glymur platform
      commit: e36c38c91f5f3c07e65c58a0143e3124754a9030

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

