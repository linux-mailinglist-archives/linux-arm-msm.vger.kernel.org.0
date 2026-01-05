Return-Path: <linux-arm-msm+bounces-87552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E28BCF55AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 20:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B50E30B3A73
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 19:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B666B346A1D;
	Mon,  5 Jan 2026 19:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/WYlNZ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92948346A1A
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 19:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767640607; cv=none; b=CMWV1zh6eElOyAqa/niUBceN82AIy2JsmIpgKD0BcFn/NHVEkt1lNoB4RipVDY7i02VxvFLm5VDkwwF2vPjUDhprNpltKUm9D4lM1R2dqFkq6SkeTKhG62VweAMR6jhA0gMuT69E+3IFO4nrJjhCCJzdGDbaRh0C2Lcx8ggMfvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767640607; c=relaxed/simple;
	bh=qGm+49JtX8VU5Mdh9c2p3JtUV2dUBBH0fGZy8TNjf9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W8eHbLXp4dBWkkwESBuNkvq7+O5QvAwvQNQIZ1YZ2EBu9Mqn5GmeU9RDzT4WPFeltdgXLcXlyrNRhG4ANTSfqgFld6hBdfaai77WX2IHS6XF9o+en3l1ddDDjJwoCf1y3f0k0EQnWi13yjKCSrGLrNhQKq1zL2sPJXKVmLd2Vk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/WYlNZ5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71FAC19422;
	Mon,  5 Jan 2026 19:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767640607;
	bh=qGm+49JtX8VU5Mdh9c2p3JtUV2dUBBH0fGZy8TNjf9o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D/WYlNZ58pj0QKtMndhguYrHXqnDSLkYKYp2/ExBXiOX0p7YACoAcpiUwC+EWluqq
	 Pqneo2dqoJKQ2keKxSoa9WSXwhtjXtJK9mnYLMidMlGStATMMnng5Wzp+84du7KIIl
	 0Ejcy7KJysqY4srFe8JYm8p7eOGuEh/WHUej+JGH/+cLYmUtqfZpGX22UiUUQtv6ZI
	 MvfeYubjzsah5+7mTv60NPmMh8l+57Q02nrZ2pD3OEhcdxFp5QGYuJkdejwg9QMtLv
	 OxBvsBn3dggP0kLyV0fwtgOsz37XfAkdaydpLqQYSgVUnFFANK9LJkH86UVMCbBUUM
	 QwI8ubhlInTlQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	conor@kernel.org,
	jonathan.cameron@huawei.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: cache: qcom,llcc: Remove duplicate llcc7_base for Glymur
Date: Mon,  5 Jan 2026 13:16:26 -0600
Message-ID: <176764058397.2961867.2550062983878611140.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105130050.1062903-1-pankaj.patil@oss.qualcomm.com>
References: <20260105130050.1062903-1-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 05 Jan 2026 18:30:50 +0530, Pankaj Patil wrote:
> Drop redundant llcc7_base entry from Glymur LLCC reg-items
> 
> 

Applied, thanks!

[1/1] dt-bindings: cache: qcom,llcc: Remove duplicate llcc7_base for Glymur
      commit: 5cd2a743ce384a5a4a1b5b09d4983df2592fbe1c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

