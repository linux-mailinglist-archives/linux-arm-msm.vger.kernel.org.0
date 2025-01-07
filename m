Return-Path: <linux-arm-msm+bounces-44187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A858FA046C2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 17:42:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B09D618885AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469821F8AED;
	Tue,  7 Jan 2025 16:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nv+ZL7go"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3CD1F8AE3;
	Tue,  7 Jan 2025 16:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267963; cv=none; b=QYBSwY2tIApoi6L7qzVfB99HNuRMIDqXeZ3+SAviGBDl+vOXQwfgpzTgo6E2SzlwGbQ4mzVkVlCg+y5YNKq6R6ZwuJfG4asu6eJ6Fo2EyYRAoeEv6LeryMx/TZ7GinMN+clMR6BSSR+w6+OKeDIAyWK+rqa6w5CJIcxttgpDfpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267963; c=relaxed/simple;
	bh=9n1Ik4P6FlTvaDCN4DWI/rq5kd13U+0/OdLysj8IjJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lMK9HhVVZbMcyAS9osLRXZeuzfibhsopQc0Zq7uJOoXFjW6dnLr8V+xsu3vs46LmcHX2cFaxELIGMcqub0hqFfX6EIGmhR5bGfJpb8d0TZsX62KgK0AmN3HwTzFkEdA1f+k2MhY4UTPPQBJQzAU/93rsFxg51liBLvN4NLkOxEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nv+ZL7go; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2748DC4CEE0;
	Tue,  7 Jan 2025 16:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736267963;
	bh=9n1Ik4P6FlTvaDCN4DWI/rq5kd13U+0/OdLysj8IjJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nv+ZL7goFAkZTnUBII6AAOc9vE66M3yUNdnLNDRLW20JlYb2+M9iI8P7r0inVQygf
	 15crFJ7usPmPfqdkkTy7GFl2lmAiSxMy0qrJc1DPZrusnzXqWcXmzL0E04PWNJbWOU
	 YAAMHDfS4nCYy0eq2UyWeLb+KS+9WrmU118q4+5YiBbA2fhKskljicIQlSEpocM1zl
	 jY57G9KRVNypjtMNhdp3h7gpNaWvqtBLcqreL3wac03EmoBWieIxowCMj2/N2e3PTX
	 5u7SM7brsMZmblfiG8JViTObNmTesZKnKsBYWzhDnWea9ndPXvQcspoRecbuWx8IUv
	 aJvxLwNsCnlvw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Prashanth K <quic_prashk@quicinc.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	cros-qcom-dts-watchers@chromium.org
Subject: Re: [PATCH v4 0/2] Disable USB U1/U2 entry for QC ARM targets
Date: Tue,  7 Jan 2025 10:38:51 -0600
Message-ID: <173626793393.69400.14562475710833287001.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241231080932.3149448-1-quic_prashk@quicinc.com>
References: <20241231080932.3149448-1-quic_prashk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 31 Dec 2024 13:39:30 +0530, Prashanth K wrote:
> Enabling U1 and U2 power-saving states can lead to stability and
> performance issues, particularly for latency-sensitive or high-
> throughput applications. These low-power link states are intended
> to reduce power consumption by allowing the device to enter partial
> low-power modes during idle periods. However, they can sometimes
> result in unexpected behavior. Over the years, some of the issues
> seen are as follows:
> 
> [...]

Applied, thanks!

[1/2] ARM: dts: qcom: sdx65: Disable USB U1/U2 entry
      commit: 5c876b8609026770c63700c21055452fa5641e53
[2/2] ARM: dts: qcom: sdx55: Disable USB U1/U2 entry
      commit: e3bab40d5961453545ef39aeb5198d2e718c9693

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

