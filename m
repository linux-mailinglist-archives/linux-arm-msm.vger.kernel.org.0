Return-Path: <linux-arm-msm+bounces-34633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 695309A1427
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 22:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BC9728154B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 20:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69EC21643B;
	Wed, 16 Oct 2024 20:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L01deUNk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84717F9C1;
	Wed, 16 Oct 2024 20:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729111116; cv=none; b=kIvv/uW31hJQBexdRXTWLxWqcjqkM6/bocxYVql3RNG6S9EZch38wrx6c2t5A1u83jUgKf84/632NIIUtKvbgeRsx3agD23kX89mcle3LjE4aBrW9qqlmjzEShpIC33o7UIZZ9jgeQBMB3PvfDJSvdMANqQZglaZttOD3ni8ZK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729111116; c=relaxed/simple;
	bh=VeYldsMUeuH1eIzB54k8tZno3kXJgw65jPdBan5LLDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e8VJkRcBOZHMqyiT/3S2sbrLiXu5BWeIJoXzJBGBB3C5/WJ7fXFUlSgOZBxm+0doUhCw+eHHEO/4hVRCLDquPr1+ioCDw1OrPqqPEMaN1b2yIFTPEi9glDKelDUswoppsEYRgNvZEebEZpwNUqovILVxBq9MXrw7N2RnXGz5h7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L01deUNk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C778C4CEC5;
	Wed, 16 Oct 2024 20:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729111116;
	bh=VeYldsMUeuH1eIzB54k8tZno3kXJgw65jPdBan5LLDc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L01deUNk90IMXNo76DgQFJeDArg//HVogMGVMjO8toT8vVe/cVgLd9suEZnjZ36Ro
	 /9vM/ge+aKmKPsmwsEES2uUpXFQj+G/JYolTAWu/8cDi35vu5zGkeRXeJCxrqEdgJG
	 WO92BdKtyrehU8vaO8oTuB/nMQp0WL5eXQQPl99tEydcgmT69vPbuFvx+lEN8MDarQ
	 1tWtfp5b9jw4pOud51qPSkclc5kwj+3fQboWDbX5UNYohXATGAUXbRl/zNRQz0dm9Y
	 olYEvdlvqaQ3Bg1lHHNVYYJJP6jnff5b+/cLj3NUYfVt9JSZgdF7C+yaORVpjmI6V2
	 /9/Nv2SNwt3Tw==
From: Bjorn Andersson <andersson@kernel.org>
To: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	jassisinghbrar@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	dmitry.baryshkov@linaro.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com,
	conor+dt@kernel.org,
	quic_nkela@quicinc.com,
	quic_psodagud@quicinc.com,
	abel.vesa@linaro.org
Subject: Re: (subset) [PATCH V6 0/5] qcom: x1e80100: Enable CPUFreq
Date: Wed, 16 Oct 2024 15:38:31 -0500
Message-ID: <172911109550.2912.18415111863856509800.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612124056.39230-1-quic_sibis@quicinc.com>
References: <20240612124056.39230-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 12 Jun 2024 18:10:51 +0530, Sibi Sankar wrote:
> This series enables CPUFreq support on the X1E SoC using the SCMI perf
> protocol. This was originally part of the RFC: firmware: arm_scmi:
> Qualcomm Vendor Protocol [1]. I've split it up so that this part can
> land earlier.
> 
> V5:
> * Fix build error reported by kernel test robot by adding 64BIT requirement
>   to COMPILE_TEST
> * Pick Rbs
> 
> [...]

Applied, thanks!

[3/5] arm64: dts: qcom: x1e80100: Resize GIC Redistributor register region
      commit: 9ed1a2b8784262e85ec300792a1a37ebd8473be2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

