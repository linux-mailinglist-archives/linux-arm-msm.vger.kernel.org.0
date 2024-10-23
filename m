Return-Path: <linux-arm-msm+bounces-35512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F029ABCCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 06:19:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 128141F241E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 04:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DF914D6EB;
	Wed, 23 Oct 2024 04:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tbPYGI/B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD471155359;
	Wed, 23 Oct 2024 04:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729656984; cv=none; b=T6uPomfxIr6dc/q8Yi1SPHFnK6sR81y1HVw80NwFy0P5xiAQ17VDicbcXkWTKsqT8uiZu7G80bL/NlTsFcwZGNi+s4xQEa28ZuhK2Fvzya2ZGfj579Ceu8Jys33wGvbh7n9ZgB8aCGe4KySR86pJ61wsWpmUvPiLA2VSZGFcBQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729656984; c=relaxed/simple;
	bh=UDxV7XYkif2d0bftv56KzhbxnOqR0eP486/8xyevWWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RIwXN1ACuZVM6zxYVwR0DLgkolAbvqkpjY3nu/xahb0zWyDTtR4i4oEUtczwaZBajG7BVq05gFwcC3JN6dVSdL5QuVkxmVsFLHl3vhKIBQ0pzmCnxxBnUt0n5eEnTHEFLRk3uCM5m90qZjG9dOOYLK14XdoPoaiMCu+ypFOQuDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tbPYGI/B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4310C4CEC6;
	Wed, 23 Oct 2024 04:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729656984;
	bh=UDxV7XYkif2d0bftv56KzhbxnOqR0eP486/8xyevWWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tbPYGI/BDyNlCeaZ3zKBVn/HVKr9hQII3Wn9hEXsDCgYAePV+y2ELUiU/GVnv8IaY
	 j65h7a0pPwxwWCEpfMv6Cto61u3jlv2ACUNeAbxhNRKr8FH2MgNyCPm/vLnbicOOm2
	 IG60+GrY25eoRuYSWPBRaM30T7YNHe9oQSFV19ljuFifgAuSwHiW59MpSEtV7hZ/Bc
	 7SUpnS1w/dVq/DRw7f9lKmlQ2KLDfljniQhpwV+mXEs31vYvurl3Fpt5ialjBcNB9w
	 qhhrNJloggdZ/ZVJu57sediJzSe4M6CYc9hARzXaQTOXuFSAu15aVUQdmOQgcrISYt
	 Xj8XHerT2miyA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lijuan Gao <quic_lijuang@quicinc.com>
Cc: kernel@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Tingguo Cheng <quic_tingguoc@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Swetha Chintavatla <quic_chintava@quicinc.com>
Subject: Re: (subset) [PATCH v4 0/7] Add initial support for QCS615 SoC and QCS615 RIDE board
Date: Tue, 22 Oct 2024 23:16:00 -0500
Message-ID: <172965696413.224417.15394852919307321985.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241022-add_initial_support_for_qcs615-v4-0-0a551c6dd342@quicinc.com>
References: <20241022-add_initial_support_for_qcs615-v4-0-0a551c6dd342@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 22 Oct 2024 16:54:28 +0800, Lijuan Gao wrote:
> Introduces the Device Tree for the QCS615 platform.
> 
> Features added and enabled:
> - CPUs with PSCI idle states
> - Interrupt-controller with PDC wakeup support
> - Timers, TCSR Clock Controllers
> - Reserved Shared memory
> - QFPROM
> - TLMM
> - Watchdog
> - RPMH controller
> - Sleep stats driver
> - Rpmhpd power controller
> - Interconnect
> - GCC and Rpmhcc
> - QUP with Uart serial support
> 
> [...]

Applied, thanks!

[2/7] dt-bindings: arm: qcom,ids: add SoC ID for QCS615
      commit: dbc81e680a0f007cf062963c40f145074aacab2d
[4/7] soc: qcom: socinfo: Add QCS615 SoC ID table entry
      commit: 8921bf54bfab240ea551b605c5c16c58f8777e97

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

