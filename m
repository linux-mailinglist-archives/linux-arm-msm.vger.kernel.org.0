Return-Path: <linux-arm-msm+bounces-18084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD00B8AC003
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Apr 2024 18:07:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98AEC280DAC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Apr 2024 16:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B311CA8F;
	Sun, 21 Apr 2024 16:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNsXhLGd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C178D1C686;
	Sun, 21 Apr 2024 16:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713715631; cv=none; b=kJ8Qq+eZeugRV37M/16RfzH3obYwnZ8sZLu7NzG53ODDHRtkljq+CjEsFibAsf6aKGTBATrmeqBe1khjt9V1YKAjGhkysxJViMUwRH1qpdgpPj0g2i85DgWxncbDU4qLOeGaTAX1BeFixha6Fo0PKzRh9p+OHp1f4wQq9rdkDGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713715631; c=relaxed/simple;
	bh=N2Sj0kArA7wrd7SFYc1+TopbIrvFLeT3Q1e2tEt60u0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kDUwi6WQLzOn+0dXBmswIS+3jd/n5a+HJ6L00g2oCnPhGahnwzao4z2CeIravmwAZA/eHNoz7VJMS8h9sqiseuCS/3ViNytov5UNSrEgpnREoFATUKKvWxDVQnOtISPSu0oDF6mE1jf/8cowJdtrx5Fg+MIrv87rWfkJLmMZRdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNsXhLGd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00AE8C4AF0C;
	Sun, 21 Apr 2024 16:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713715631;
	bh=N2Sj0kArA7wrd7SFYc1+TopbIrvFLeT3Q1e2tEt60u0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jNsXhLGdPBtlYI7141/f8r+FQnp5ZJkILXArDj5ZzOu2AJ7FGFOEkIOFDqTPdIy/n
	 qnILru2vOBuaCNjWBkEbbtjhxzgGup2ph+YaDNXASAm7eCW5TPEeegYE2R5Bo6pJZy
	 1Fhxs0Xxj5H20qj40FQYzzxGTMJP2LIr5TpdK964yAaylu6rSq7P5xr/l1JjFhA3bY
	 yJXBcOPxj+Wx55k4xrcdPUj2OiNzEGvUi8vPYlCNWWIiT3SAlCBNCjv+5+ThBbtJej
	 eOrTWuoZ0Ot2fJS41G2WJOBmTlW05UZDPacEPLwbRurXCw296N6z0AP5zmGwPh9vo4
	 Tc5nxq48Zfv7A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND] arm64: defconfig: qcom: enable X1E80100 sound card
Date: Sun, 21 Apr 2024 11:07:04 -0500
Message-ID: <171371562483.1174524.6312701240959095623.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240403094422.15140-1-krzysztof.kozlowski@linaro.org>
References: <20240403094422.15140-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 03 Apr 2024 11:44:22 +0200, Krzysztof Kozlowski wrote:
> Enable the sound machine driver for Qualcomm X1E80100 sound card, used
> on several boards with X1E80100 (e.g. X1E80100 CRD).
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: qcom: enable X1E80100 sound card
      commit: bfff021ebf0beadc4fe8eeba252b35a188db2c6e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

