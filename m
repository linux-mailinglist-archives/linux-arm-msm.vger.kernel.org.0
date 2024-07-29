Return-Path: <linux-arm-msm+bounces-27169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C76A493EC26
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 06:00:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B24128237C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 04:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1DC412CDA5;
	Mon, 29 Jul 2024 03:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nrPZrLbH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798A012C7FD;
	Mon, 29 Jul 2024 03:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225527; cv=none; b=gD4+d6emWxPOGone91Sg8+j41ECEfxkXXFnISwG9O5DyqYWt4NgCZhKZEc4kFpd3Y7e+lJKTwHl2jc93xh77752mZf6jCGsTFvm/AWMRwNF4Eo/wtxo+PttE+Ngcv8ulc3fSj4YjIOfjLULteaVLYq6jLF85MU7PRxLRxoNzPrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225527; c=relaxed/simple;
	bh=bUnwh+BqJM0fJarUiyxLSiQJFv9RaAaEAcnRmgfQhfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=se8lMdqqTJ3Pa/ahxcNplbksSbxJ3GEnI2qP7vl97m/ju5bAsvBxFLK5Dkix12zUR/AwuKyUDBls7xGpuaxQ4dEcObaWp2hMF2B+2+kSD/mN36ibIwzSaISjYHhigEd7HAoM9eHvTAGuCwE873pJushcQC0YpccE/6hQ+SvFm5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nrPZrLbH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 738A1C4AF0B;
	Mon, 29 Jul 2024 03:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225527;
	bh=bUnwh+BqJM0fJarUiyxLSiQJFv9RaAaEAcnRmgfQhfY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nrPZrLbH/kHu/w1U0zl8d0ANaG97wJdVkHFbKzu1taq3ReAMEXYcPBdZLx2+K1kZK
	 PRDg74bmKTwE53X53A1R7peWF5WH/kolWufurtyARU9Mcg4sWN4dw2Oaj8DFtgWBa1
	 8ic5R/j3ltE2QXPnVmuvi7Ej2zH3MbsbLoQemD+Q0+5Iv3klD+7/m6PyMoobGs3LjN
	 /HQdmz2T6Bt1GSuMgRugD83biQ6PnL6H6yN2GvCLQYzIkdwKchNg+h6QAFsPjZUyt9
	 QfujUbAcD9tq6x/jJuBio92zrYG5t86Y7kuLnOZQ2jv1vXId84Dm41GJjELfpDkc+1
	 Ko7BB7RwIIxlQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] x1e80100 dt cleanups
Date: Sun, 28 Jul 2024 22:58:13 -0500
Message-ID: <172222551301.175430.6987435641162715525.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711-topic-hhh-v1-0-a1b6b716685f@linaro.org>
References: <20240711-topic-hhh-v1-0-a1b6b716685f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 11 Jul 2024 12:58:45 +0200, Konrad Dybcio wrote:
> no functional changes
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: x1e80100: Fix up hex style
      commit: 27302c7d8590995b172708e65fe227b7d60aabac
[2/2] arm64: dts: qcom: x1e80100: Disable SMB2360_2 by default
      commit: a237b8da413c1ab2a85d411c99dbb168d0d0183b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

