Return-Path: <linux-arm-msm+bounces-74260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5748FB8BD50
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 04:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A04A7B310D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 02:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B521D7E5C;
	Sat, 20 Sep 2025 02:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sSWXTOa9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825CE2AE99;
	Sat, 20 Sep 2025 02:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758335021; cv=none; b=rSeWRqApE7cmMkobYALYAgNcSkDfp8+rCG3fHOAPbKVlY1pzarETFS33L5Ebn3B8bBvjCZa2IFxwGjY9upnuKY/SI9NUWMq6WOfU4l0GX5jqRqFRt3bsZjqO2zJw/jzROjDZ3NWhM4awJYM7P8TbOzb6m+CQtGOkz4iJS+ZHnvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758335021; c=relaxed/simple;
	bh=IWHXrd42rMszC4gDN9Iubd+R1ZPGy8TyJa34jW671KE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gA6iSHp9Sspo8FoDSA3y+0xSyc6uiOYHm03q5i0Tt4etJdGgCzSEQz4Ff0Q2K95TdFixnpdCAYcuZ9cBgPJd44JkHj/xFoy7xLKA15aWYtpGvSnEc2YASzYO8BAQznfwyNNSjfogMfqs3K0agWfPbfY2ocb3RZBStuVXlkxXFq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sSWXTOa9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D9CC4CEF0;
	Sat, 20 Sep 2025 02:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758335021;
	bh=IWHXrd42rMszC4gDN9Iubd+R1ZPGy8TyJa34jW671KE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sSWXTOa99DcYL0ykIR+QVz85d15YqWIyIlgBzUsQW45rAgSatPIyHabUqfCYPI0Dw
	 Lw41v3Clr5ZP6NNf/dhAdCpaAZggTilLG/DxT+ySSgX374oorhi0SaXTBvPAdzsIB0
	 nUviE/+xZx0sqQMiRpG3cJfq7Kzn15ztrkQK2JqkEzwRIqqRUcAamoG0cbzUHdv9Ui
	 iR5zwAuibnBloQ40nReIQX1N3H8Xey+iE/OeLbSLMc/iXJqG+m9xUiHhSpQktG9htP
	 FdFcu8tdAU7PGGlKOYTZg6hCbgsfvDb2I1aocjes3emHSaHxA2lAZgzJgJ00MVW2MH
	 uOe8Oe95NXPuA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Enable Adreno 623 GPU
Date: Fri, 19 Sep 2025 21:23:37 -0500
Message-ID: <175833500892.491899.14963786026200572496.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909-monaco-evk-gpu-v1-1-e14938780411@oss.qualcomm.com>
References: <20250909-monaco-evk-gpu-v1-1-e14938780411@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 09 Sep 2025 21:16:59 +0530, Akhil P Oommen wrote:
> Enable GPU for monaco-evk platform and provide path for zap
> shader.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: monaco-evk: Enable Adreno 623 GPU
      commit: ed7e440531601ba558fb81856352ef260ecb153f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

