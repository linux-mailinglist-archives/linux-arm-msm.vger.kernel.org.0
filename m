Return-Path: <linux-arm-msm+bounces-37091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8CF9BDAA3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 01:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A00D8B21B72
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 00:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76BA6155A52;
	Wed,  6 Nov 2024 00:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D3RDTl4b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E27015573A;
	Wed,  6 Nov 2024 00:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730854434; cv=none; b=h3L/QQFkkqE79HBmrVSz9DaKNu9YPMd2HhPTKb91OZM4jXBaYm1Donotz56eNp+M0v3eH45dCeHMHt7uE+tN2/GKS0eOfv3oPeDySDPwPkv6Cuy0hpzJ8l6ajxyTcZvVWl3DVKu9Jz1X1R1TNHuJqW5X3N68higcR0cOCOcUPyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730854434; c=relaxed/simple;
	bh=zxKFgLZr5hu4ZPyiXE4850EXcyzJJjsKOR4t17a8334=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SUBY9F5wqNUWhaFrNM3cX4nzmp5NoY01DdWXvOs9ExXvoAnVxOshPcu0+Ot7Kkp8EwP/WhLC+6QjJfx4zNq9+NtRbQfsO+zwnSjgrjBTvHOrQBPd7bdPc8VuiZHER+YDzjb9LDEQLmaiwX5XMwrJcDzUuLSwouJ8RyMm58ZKH50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D3RDTl4b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15F1C4CED3;
	Wed,  6 Nov 2024 00:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730854433;
	bh=zxKFgLZr5hu4ZPyiXE4850EXcyzJJjsKOR4t17a8334=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D3RDTl4b/TSVdPecMm5f/yXBUBO5tUcMJ6XFtvb7Bhx6DA/NJfb19xK30IkWtijtl
	 8LrwkTmoLaCsBGIiSBhECNq11o3o6EIHTII3kb962+IMvP7YXrO5VXnY8kanMMio28
	 dzlQfDdAlUO6g4KtP24zEN88Kn2Vi4LEoXs2rIggJwyYjwV5oZDkTqztJINTJVDOST
	 U3tP6IH0jlCf/eiwZjDRFp5iFY/V0XHSbQc4YaQxVK2qa8N5SVR1KGXo15JeVE0VJT
	 4g5OmjF5trimjxLU/dwr4AHNXwDFaF58i4huBV61lKbSnwCI9Af4zVnaNHHsy7VQlA
	 TTik3jOVdo+CA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: llcc: Flip the manual slice configuration condition
Date: Tue,  5 Nov 2024 16:53:44 -0800
Message-ID: <173085441666.26510.14579873707259072400.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241104-topic-llcc_flip-v1-1-3003c846d131@oss.qualcomm.com>
References: <20241104-topic-llcc_flip-v1-1-3003c846d131@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 04 Nov 2024 16:10:53 +0100, Konrad Dybcio wrote:
> Commit c14e64b46944 ("soc: qcom: llcc: Support chipsets that can write
> to llcc") made the code not configure certain registers on SDM845 due
> to firmware security policies. That turned out only to concern SDM845,
> but the condition was chosen such that all other entries (for SoCs that
> didnot need it) were required to set .need_llcc_cfg = true.
> 
> Flip the condition, so the default is "doesn't need the workaround".
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: llcc: Flip the manual slice configuration condition
      commit: 92f3397c8c8d63fefe0d045425ad54c5ee5d57bb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

