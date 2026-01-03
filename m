Return-Path: <linux-arm-msm+bounces-87313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE41CF01F7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 16:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50924300DA7D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 15:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5C82C0F83;
	Sat,  3 Jan 2026 15:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kLcPGB3q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4119223BCE3;
	Sat,  3 Jan 2026 15:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767454280; cv=none; b=RZRHr9cfM7j/dguD6V95XXNn8wvbmTXY7c1V4mjYaMDfMAQNSNfPfTmRn7NxBC+gE+SApRXW6db+1PSfKvLNaiRvEtbaVXXvivsxfslEQqP3OtVYZT//rIRPIE9gHmLbd6pSO6G6/QwFN8AJcYboQWr1/3sRJcuuMc1m9iOrsaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767454280; c=relaxed/simple;
	bh=Gp5cbcQWRtX2d9SlLhFf5G7SliMS1HJDCzKciXheDac=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RyNVpnK7g4scPD844Rz4rpyQEmZ2HAibieKIo68I8pSWHQhHMHMuA5xWY37gp7W3SvB4jagks/stRV9cAwS8RMrcsJGu7/JrG+hWjITs3/NNnguaNADFqM6fF4beLYOcQiw/oOivyhglNkJpowyBHb+dgRw/ruY+3ZG6e+7cxUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kLcPGB3q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D1DC113D0;
	Sat,  3 Jan 2026 15:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767454279;
	bh=Gp5cbcQWRtX2d9SlLhFf5G7SliMS1HJDCzKciXheDac=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kLcPGB3qTb9/xxuht/rtTOBzgvhKVwPZWgyJ8JoPN2Im7RaWQEwUGH5GtzjEoyNYK
	 LEnkLS/tnWOFBSBl4Bj4EofIYnPUz1HvapUA5V6aw9eiYC89tx9/CyadMApEQ1s175
	 HurtyXAnmFQx98kZHUwnbmboK2ij0+eYnNnQC5hJxBNmyRSkXHMwZE0gnuYw//B8w3
	 yNweg5WaS0p0p/eo3+dAn0oUIhvgpjp9XfQMGZJXgfJ+VwWU7KQVL5FadZp2I97lmD
	 jkOCP9b1JIG08MZjXc5B4e6016Znab9FQn4rL3jkramcGo+hULsStmEA53snerfaNy
	 9quxzJ0dJ42Gg==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,adsp: Allow cx-supply on qcom,sdm845-slpi-pas
Date: Sat,  3 Jan 2026 09:31:16 -0600
Message-ID: <176745427322.2626390.8402364058025458069.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229152658.284199-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251229152658.284199-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 29 Dec 2025 16:26:59 +0100, Krzysztof Kozlowski wrote:
> One SDM845 board uses cx-supply, which is not allowed by the bindings,
> as reported by dtbs_check:
> 
>   sdm845-samsung-starqltechn.dtb: remoteproc@5c00000 (qcom,sdm845-slpi-pas): Unevaluated properties are not allowed ('cx-supply' was unexpected)
> 
> The SDM845 SLPI binding already allows lcx and lmx domains, thus the
> cx-supply seems like a fake name for something else, e.g. some
> enable pin.  The qcom_q6v5_pas.c driver parses cx-supply, so it is an
> established ABI, therefore document it for this device only.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: remoteproc: qcom,adsp: Allow cx-supply on qcom,sdm845-slpi-pas
      commit: 2cb0c97ce4392d1b76c178bf7c6613b4e89a4b19

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

