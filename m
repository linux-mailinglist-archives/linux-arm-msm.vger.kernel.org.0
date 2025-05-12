Return-Path: <linux-arm-msm+bounces-57645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA1AAB46A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 23:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E69F19E4242
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 21:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312BF299AAC;
	Mon, 12 May 2025 21:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOrhHd/0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F9022338;
	Mon, 12 May 2025 21:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747086548; cv=none; b=TPL0oYRzYvP+krczudubahZqPBtGZuSUcTuzWIa/fj25NW0XYAgtzCSA3yty0jPn4PuLPGeqDy4J6OpcE69Ovd68e3uwibtkGM5dsbgqloKphqT/RxHNbptqHdHRcack4pg+QYF10iipvB76u+dvCxUCUlB0Yz8Teb+Des6Y44o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747086548; c=relaxed/simple;
	bh=/v2hKJDOeaSwgpA4hWsoM6Kte/4uX3qwWNorWOZh068=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kto8PcQ90ksPip6WUfoxnLofbtf7XBeTdfdmTS6Z2PZ9NxKBJJ9yqRbtdEUqORPjE9uzHFBYBZBCEZOHKnESeDxumwDq7vBuPRvE/OqrUIMyfwW5U9ZCBQvVhYw2O9Ly+qoENq+PV9tOpVy43YGVWlLn5LQzZHmRhaOAyJcp7TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOrhHd/0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD898C4CEEF;
	Mon, 12 May 2025 21:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747086547;
	bh=/v2hKJDOeaSwgpA4hWsoM6Kte/4uX3qwWNorWOZh068=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bOrhHd/0BqyVx7AqfogzJ+unOJ+ES6mzqbvpj081oAIy8ERU65DpQ5ewm2HH9d0/i
	 JvPU7qwaibonWmR3/t6ZHZJtxzXJ6outmhn98is71qRrnTr//rFh6Oyi+6gLEmdtWj
	 fHXFZYO4i1wO6OSgzcvGiqW/UjbvmgNcMmTgPk/QMjdvc5uo48cay1lypdQTzbN8aG
	 DAfS2wrV+9ga/IATnEjMsbWx/vuG8KL6vSnWK848WMJggp4F0qITKqkPFOp+sOM+eI
	 J3gKa2YtHeLGK4oJGXl8e9506NnCyO19WKfnMSxGIaM82RCJHYWMpHKYgFVXbsCUsA
	 I+0n434kL6GAQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/4] Introduce LLCC v6 used on the SM8750 SoCs
Date: Mon, 12 May 2025 22:48:50 +0100
Message-ID: <174708642731.3671.5500625017836369026.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414-sm8750_llcc_master-v4-0-e007f035380c@oss.qualcomm.com>
References: <20250414-sm8750_llcc_master-v4-0-e007f035380c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 14 Apr 2025 16:21:49 -0700, Melody Olvera wrote:
> Add documentation and functionality for LLCC v6 used on
> the SM8750 SoCs. LLCC v6 rearranges several registers and offsets
> and supports slice IDs over 31, so new functionality is necessary
> to program and use LLCC v6.
> 

Applied, thanks!

[1/4] dt-bindings: cache: qcom,llcc: Document SM8750 LLCC block
      commit: 33f7187efd3b5f9e03d50e8209d86a08d215d413
[2/4] soc: qcom: llcc-qcom: Add support for LLCC V6
      commit: 9186a0f3e4f2ebdd3e5ef1d87cef0418101a47dc
[3/4] soc: qcom: llcc-qcom: Add support for SM8750
      commit: 2c04e58e30ce858cc2be531298312c67c7d55fc3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

