Return-Path: <linux-arm-msm+bounces-68597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3885B2194B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 01:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B6F0462A09
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 23:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CE5F28153D;
	Mon, 11 Aug 2025 23:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2lvhc/j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F1A28152B;
	Mon, 11 Aug 2025 23:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754954853; cv=none; b=D0iaoLR5Kbs4yGGojBaPc9wLija9cncYE3qxzdnYloDG7cHpjhOu/CDJ8J1vF2sBcWPeERcr/1eF+MEstA0F4EJshZ7mAiL2YfePx6NVADnoLpMr7rW1FHbuZlMAfgjbrtbTKMbjipl4mxiG32CGwPG3k73tZaUaypK28/x1AX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754954853; c=relaxed/simple;
	bh=uwE75RP/rC/UsT0Oz278buH7MuD18+4QVG/pJE6eMZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XSlQmTExIp5SxKetgfCz5Hx1Vxd5ncX6Y5C5guVq9B8Ngp/jIu5eNJpG0G6eJO4RADcxkbiD/OKo0UabQ1blwSon0Qvm5unAZYkiJ4ApVMnVuGhtZAYE6RRNIMzs7Mo2buCAGnKp630opaU8DqO5hZM5uA7Uo2G4MyEz7Q17mos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2lvhc/j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B89CC4CEF7;
	Mon, 11 Aug 2025 23:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754954852;
	bh=uwE75RP/rC/UsT0Oz278buH7MuD18+4QVG/pJE6eMZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A2lvhc/jV+eUjs6uxwKpFX42exLUGUlEZq7SwChPB26viLQjqsZpP90/Hkpco/CHS
	 Xc/6XJcs8AC7cGfoT6ntADIcwzhMc+YyHsthMAoo3pdmiZfr/0CWsj0A1636uEXvm7
	 06Zk3ofsqoFTS8RAwPhHdthdM1HKcNhwOO0vT9PA6qOzZow4YRoeWBthbqUBvvBjHI
	 JIdcywclTh1o2hd7tL7ZIMJtcngNpKgDj/GdSVX+TfHU4i8NM1k4hcrTzM1H3d2ee1
	 7uWA6phROe19OyV+datgszyzbgAYabIRngGtiPNsVlBSo7sLN8I1bCN8dG49q57Nne
	 4i366DPMYZ7uw==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Sayali Lokhande <quic_sayalil@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org
Subject: Re: [PATCH V4 0/2] Add eMMC support for qcs8300
Date: Mon, 11 Aug 2025 18:27:05 -0500
Message-ID: <175495482456.157244.16005731493669293033.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250716085125.27169-1-quic_sayalil@quicinc.com>
References: <20250716085125.27169-1-quic_sayalil@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 16 Jul 2025 14:21:23 +0530, Sayali Lokhande wrote:
> Add eMMC support for qcs8300 board.
> 
> - Changed from V3
>  - used correct name for SLAVE_SDC1
> 
> Sayali Lokhande (2):
>   arm64: dts: qcom: Add eMMC support for qcs8300
>   arm64: dts: qcom: qcs8300-ride: Enable SDHC1 node
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: Add eMMC support for qcs8300
      commit: 43b8556e82f38cc2e7a66c9dd44d1104be4fe73c
[2/2] arm64: dts: qcom: qcs8300-ride: Enable SDHC1 node
      commit: d81448d49cb26d9255479c7c74de03a257b5c528

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

