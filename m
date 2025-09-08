Return-Path: <linux-arm-msm+bounces-72637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DA6B498AB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 20:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2B051BC5A3A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 18:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4565731DDB7;
	Mon,  8 Sep 2025 18:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7SsXsoy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C5731DD88;
	Mon,  8 Sep 2025 18:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757357285; cv=none; b=TVQzdatjTj5vhpSV1D3GYVTsi10QQvw1MX+Xsx0BKWOg1f3WX5VT5PyqqWng0/thtbMHyBNa8SxvDgHUfgFBARUhtTBrmmEpX9eNCN4rL5x8jnI4BKNKvy2hDeiSQCjxKk9N4EL5d00yMPDW0TWBLKuTD/3II9tf5XaLep8HWdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757357285; c=relaxed/simple;
	bh=GNDIaFzx7blIt0L7sWU1LM3+kRLV8VV7eJWlF+VVvhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gaSMI30kmbrD8qeEDxIU5gF/uetQ/89AF7oNwqaYPAEsU0+OJ95MmYmdAF2MDwr4zxqvxLQ9cMN7vQOVWlcQPEH+rgngT0ULxK9gKPGeMBNSzAAThfRawH9Oa1PCCdAQCyXEMPqAHtb7d3iw5P2WRfwn8bV7bMv2aaG4t4h7Sks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7SsXsoy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 454D5C4CEF5;
	Mon,  8 Sep 2025 18:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757357284;
	bh=GNDIaFzx7blIt0L7sWU1LM3+kRLV8VV7eJWlF+VVvhc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M7SsXsoyR5qxyKmFLSqpPPfDgJmBiar5DD2HGduerTkpmvuhfsA71/pHFHHTwY/k0
	 6RvsjGjDtbISv78SkreoHS5mHy/SAjnVfRjWrPkburL2yg+CM70mWj/y3zJyr94w/t
	 X7UBU1yny206b34XNMStl0Oy8MZZjttf1ZEiORGK+LFWoO5uOIjI02bs2R1o5s9Fgp
	 5q5z3NcxoW6NKwdjdN5Lp/1kg3jtdZsRuyuO5gJKxuPwVXWsSaocYNrJCgQHtRwKFp
	 DX5JBDdRbuOWhMWQB6gBEPsW+9zSZXQeW/5brf6KfkV/bREQ/9At9jUCAJrhZY2eSi
	 DfzKqMA3rLLtg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Introduce support for Monaco Evaluation Kit
Date: Mon,  8 Sep 2025 13:48:00 -0500
Message-ID: <175735727830.2621347.7880458499216772171.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250905192350.1223812-1-umang.chheda@oss.qualcomm.com>
References: <20250905192350.1223812-1-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 06 Sep 2025 00:53:46 +0530, Umang Chheda wrote:
> Add support for Qualcomm's Monaco Evaluation Kit (EVK) without
> safety monitoring feature of Safety Island(SAIL) subsystem.
> This board is based on Qualcomm's QCS8300 SoC.
> 
> Monaco EVK board is a single board computer (SBC) that supports various
> industrial applications, including factory automation, industrial
> robots, drones, edge AI boxes, machine vision, autonomous mobile
> robots (AMRs), and industrial gateways.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: qcom: Add Monaco EVK support
      commit: 49e55bdbcbe0abf04d7c8c882d69755ecf43d878
[2/4] arm64: dts: qcom: qcs8300: Add Monaco EVK board
      commit: 117d6bc9326b1ff38591289f9677e273a9a467ae
[3/4] arm64: dts: qcom: qcs8300: Add gpr node
      commit: 89c85214735b633e846d8f6473fa57ba4cc11b81
[4/4] arm64: dts: qcom: monaco-evk: Add sound card
      commit: bb12da95a183253b619ca1691d6fd320b7e445e9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

