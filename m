Return-Path: <linux-arm-msm+bounces-57647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA75AB46AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 23:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B593519E3E92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 21:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D55829A337;
	Mon, 12 May 2025 21:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="edzrpkjb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01108299A9F;
	Mon, 12 May 2025 21:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747086556; cv=none; b=H6ivHGRy+96AD73fepbEOKO32l2b3UYvQFsgFyrUyZHAo0fRRQOG3lc5hc1jmfGpaCdkgnbTwEn/z7ZfrnkRxTpiaQfeus3t1T+fjUPBgMJI23jzYmwB4MSed04prfVFsfIxFg8BDmSNb5aXbxszzBzb6nHsolFec/SlSNJke+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747086556; c=relaxed/simple;
	bh=x5bZI7q7Ly08U3qmX+RBa0v6IrNpK1dorkGJyjCMSuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fo+BUto2svp1/WPeyFG/kzlaYzlqK0wKhFxsEYKtIeiaM/z7EZqHVYBXPYqNMtDKqi7Dt8JKRdp+f/nZGpxJcsX3cdK6+F5NXoBb0zkZTQYst2GVHYZg6kK9MYoOyRbqVt9tmL6+xaqG0DDQCrJ7D3fsc/Vj8wJI7hebRuUZsHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=edzrpkjb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296BEC4CEE7;
	Mon, 12 May 2025 21:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747086555;
	bh=x5bZI7q7Ly08U3qmX+RBa0v6IrNpK1dorkGJyjCMSuo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=edzrpkjb+b7R7QJFny+VP0AiomOSW8kahLopcOOgvhorK1dRhTK0NrcEbcF/qW6ly
	 gQvqxAi/WHxhohD+W1nIU0vQOTxAfubLnaiAB5SrvZJjYKMpt2moGgzF3WQQ1hC8Wx
	 AA48GGl43J1YGFTnSisFPsrZNln68wVIYVOXJApdeNHtJmX50vrhTP3NDt8cFU+YD9
	 4QUQOqRnWjtXe6e5HTVNB1d2df5TFiHykzNRg1d6DSCY8eQm9iORrS47GNv/6TfAEn
	 Ko1bZpbzNakrQaJrPMJkfSPVhSr8oCMdo0UphXWIIHjVJfMTuNCzqf79U+CG7XFsyz
	 73HtBxS6OJGgw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 1/2] soc: qcom: socinfo: add SM8750 SoC ID
Date: Mon, 12 May 2025 22:48:52 +0100
Message-ID: <174708642736.3671.9464413659121665132.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508134635.1627031-1-mukesh.ojha@oss.qualcomm.com>
References: <20250508134635.1627031-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 08 May 2025 19:16:34 +0530, Mukesh Ojha wrote:
> Update soc_id table for the Qualcomm SM8750 SoC to represent
> SM8750 machine.
> 
> 

Applied, thanks!

[1/2] soc: qcom: socinfo: add SM8750 SoC ID
      commit: b7fc42fb0e6fd5c786e7e0eebe44ee44646ef47c
[2/2] dt-bindings: cache: qcom,llcc: Document SM8750 LLCC block
      commit: 85c5d9b9464b17eb2f5a00edd145f45a12ae31ba

But in reverse order...

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

