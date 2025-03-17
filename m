Return-Path: <linux-arm-msm+bounces-51559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D4BA63C3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 03:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D038188F50A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 02:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71AB19995E;
	Mon, 17 Mar 2025 02:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rJ/CHt16"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CC219924D;
	Mon, 17 Mar 2025 02:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742180172; cv=none; b=GGqxTJr+JXzIk8sP8dG6k6M6dAyB5g+jiLpfRvRmt6S8/Egh0mkTE+Uq0V5HzjcXrYotvJ4sbUAR+pJnm8HJn6VM9hxid2SCmKHcTKg95yZmcocNY96/Bx9gjkddpV1E4GGBbXEIX3ByFiE4HavkYgyBsZRTKfAjE7ecEj8kZq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742180172; c=relaxed/simple;
	bh=/JoA2ibJAz3nIKieech3nSYCGMaLCtCnunLnJfr610k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TXrMfq/XNOItiBZKtg8FHOeeYf4Fu8pdGNmrL2/8DeECzXCvQU/jg7HFEoINz02/ufFpHyw0b3jBBFqRZAblnIYAY2qpnAlozn6gpzvWBFf7pelo/EF1LzBHxAfvziVkSvlzhmEnYlD+ZVatItC2gfSRVuZetfE+mGnQDbLveO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rJ/CHt16; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF1FC4CEF0;
	Mon, 17 Mar 2025 02:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742180172;
	bh=/JoA2ibJAz3nIKieech3nSYCGMaLCtCnunLnJfr610k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rJ/CHt16v93Xm5687o0AiqEpe6rE8HetS3U5hDKFZGZ7dF1vKB7ZTXDty77/y3JSK
	 mdAdh7o12XU/Tx5XIXnTHdtL7jg12OWT31waE/dIi9SWwOpi2rR6VeYDELyKuudbUs
	 TaDlHtOf6PXI5v02Y43dlINbGHke8qGPWMGfzqFh1yjd/XPo7L3tuavnt6mL/n71li
	 sx1NvOPzIFMQC3kPo9dRhWEhVoWFqzpot3ZjodQ4VStdFmeeppu/qZruSMx0yC0Jbo
	 +Ba88tOmAtKwGaHHkWncXomPAZuxQbOcV0/6QUv7lucVliCuWfM7gPa+Ci2Y5IzNrA
	 SWpKYxGu5HV3A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Fix domain-idle-state for CPU2
Date: Sun, 16 Mar 2025 21:55:52 -0500
Message-ID: <174218015905.1913428.16575344783019224692.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314-sm8650-cpu2-sleep-v1-1-31d5c7c87a5d@fairphone.com>
References: <20250314-sm8650-cpu2-sleep-v1-1-31d5c7c87a5d@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 14 Mar 2025 09:21:16 +0100, Luca Weiss wrote:
> On SM8650 the CPUs 0-1 are "silver" (Cortex-A520), CPU 2-6 are "gold"
> (Cortex-A720) and CPU 7 is "gold-plus" (Cortex-X4).
> 
> So reference the correct "gold" idle-state for CPU core 2.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8650: Fix domain-idle-state for CPU2
      commit: 9bb5ca464100e7c8f2d740148088f60e04fed8ed

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

