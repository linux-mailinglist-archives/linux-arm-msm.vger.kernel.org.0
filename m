Return-Path: <linux-arm-msm+bounces-43536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C09569FD8EC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2024 04:40:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C72E3A2530
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2024 03:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E53935949;
	Sat, 28 Dec 2024 03:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j6KiLlXp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225A433EA;
	Sat, 28 Dec 2024 03:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735357197; cv=none; b=ntGguDIcWxnMZxPicnXbS25UF7rDkY7LIcs7GJptxkzNaQC1iP08g0yDFjx/bpFl+mtBkC06bZevfRyuS94pq9yE7W9tGJrgVBvtPpo5BORdroW7wx+RlVKIlUHteZuBb4o1POsT3RwzT7xz6f1opHGyKOurvWrdycqh57fbKCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735357197; c=relaxed/simple;
	bh=gRLGLZMJDuaDn8BKAJgqm0Mrv3neWPxzWSRXMC4tCIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CRHDh5kWXeTAkZcZOjkqsr8xwBCWdzt7c0vZkzuWU8knwVxBI/G2PM0gecIMJstugWWHYFsitbnEJ2A9DKj3cM/bY5veveHtCr+kCrxpY5dRKSZaMZCQ9YSKKLWKvyHekZjjxYgGEpUJrHTmodVqXghvWY5CB0CtnJka9P4xs/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j6KiLlXp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A83C4CECD;
	Sat, 28 Dec 2024 03:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735357196;
	bh=gRLGLZMJDuaDn8BKAJgqm0Mrv3neWPxzWSRXMC4tCIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j6KiLlXpuqgRaaaXX/zgQpxJagva6w5I+mDE04t/l3M/IRGc19etr8+bH9MiCbdEi
	 AjnEa9euXyR1+VEtmY5NEFSBTSuFOQso0XdLqOrw6mKHpJF1uPVbK/7cLQJS18iIIy
	 eMg5IFYH9acSRQBvIrRviekMadPCWh9GEw3j+keYB0fHkzPEfF2Isinri5PP7nyae1
	 Gfox7bgC0b0vSejc1Hjaw/HQb8U2jAx6uVgkNQCeEMJu5Kzp2M447qm3zAwRv+GUFB
	 K0yVKTbf5ndq79KQf449b7eoHj8EteK5OeKOl7Y8ueDYlZ3RthlDraRBfDFXlvkj4O
	 DoHSgxPYC+9Qw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Fix interconnect tags for SDHC nodes
Date: Fri, 27 Dec 2024 21:39:53 -0600
Message-ID: <173535719177.1533665.14581872557543882948.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241227-b4-x1e80100-qcp-sdhc-fixes-v1-1-cd971f7f0955@linaro.org>
References: <20241227-b4-x1e80100-qcp-sdhc-fixes-v1-1-cd971f7f0955@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 27 Dec 2024 14:58:36 +0200, Abel Vesa wrote:
> The CPU-to-SDHC interconnect path for the SDHC_2 needs to have the
> active-only tags. The tags are missing entirely on for the SDHC_4
> controller interconnect paths.
> 
> Fix all tags for both controllers.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: Fix interconnect tags for SDHC nodes
      commit: fabdaa29f58124a30569008d419282d9ef9cc082

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

