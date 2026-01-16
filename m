Return-Path: <linux-arm-msm+bounces-89465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 516ADD38894
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 22:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D96B130C8465
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 21:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34C330E852;
	Fri, 16 Jan 2026 21:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HayS2gkV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDDC3016E1;
	Fri, 16 Jan 2026 21:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768599559; cv=none; b=liUu7GAI68/ega+S3Po79P/D8y6+/qWQ6dw6ugDszgq9cB4qxVtnu2aWqDH7Qyzrl28Kq+MouUeMEDSaAV8AF8+Ky+beRYIcT1L09ykjI0gvNOLKfgVxo+8/90bNCsIC6JGJyF6W5Pk24EqfkhLhMhO4c67rpFN9amVpoHYZDgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768599559; c=relaxed/simple;
	bh=Q460nemJjn7BK5Cr4gor78PfAvd4Wxs24xQ5qqVx+1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uz0DzOilbxADyru3OTAZS1tiq4/cj21gkn6/4x7eW1/PmyogDDHu/1LFFqt8mSlVB1u0WEzSsGbCUm2i78x+MfNlq640Ss+vLc6axU/dO+NGb8RljCRpKAxdiFsZqvE0pfY/tt3Bo4ttG9rT9gsK51AKL89cyoSUWrMdsjREAL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HayS2gkV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B14C19423;
	Fri, 16 Jan 2026 21:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768599559;
	bh=Q460nemJjn7BK5Cr4gor78PfAvd4Wxs24xQ5qqVx+1Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HayS2gkVEiN47Pn2qHGq/75otUUEzm16El73IL+NJZGotH04gXBx8zUfe8VSJ2Ndr
	 hzuw8Qt172sXpZNKOgsdmQ1Ab9pikflnQCJdaibBn6auIJR4p8wxtHRMLtnnkM1HR5
	 /qV5OxMUNO99X6GdA4YHe7LP/pF+5qWF7JF3XFGfWYrqAYRHPGZQZcKr///HH0Q0b6
	 HasMDwwXdyRBduBZVVpLxqSorpHWZNnc8mGjthRbl+HYnaIhiYiyMsy/HDdr2K3p+i
	 W7rSY+dKas6WWlXPEzUV3U/3Ge4/lzM7Njat62piEk4dDi6xPHVjYDEautqwG/xT5R
	 2sGZDn3cmGISg==
From: Bjorn Andersson <andersson@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
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
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mailbox: qcom: Add CPUCP mailbox controller bindings for Kaanapali
Date: Fri, 16 Jan 2026 15:39:10 -0600
Message-ID: <176859948755.425550.13963894058052009653.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251021-knp-cpufreq-v2-1-95391d66c84e@oss.qualcomm.com>
References: <20251021-knp-cpufreq-v2-1-95391d66c84e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 21 Oct 2025 23:32:30 -0700, Jingyi Wang wrote:
> Document CPUSS Control Processor (CPUCP) mailbox controller for Qualcomm
> Kaanapali, which is compatible with X1E80100, use fallback to indicate
> this.
> 
> 

Applied, thanks!

[1/1] dt-bindings: mailbox: qcom: Add CPUCP mailbox controller bindings for Kaanapali
      commit: 58e69e8f9c9a4df948dfc554c26b8f4adf505636

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

