Return-Path: <linux-arm-msm+bounces-20512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDFC8CF7CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 05:05:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0D3B1F218DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 03:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931FC13AD1C;
	Mon, 27 May 2024 03:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8Fray6S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695DB13AD14;
	Mon, 27 May 2024 03:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716778873; cv=none; b=jsj89mkbDaBgxkTKeQMShbNn8bYyM+vcrjTcEzwyaZv6idf4rBmxH1UOqiWKsJUZvpwUebLCxQGfMNmbulLAsn76O7X8no82WDPhhxEYj9Z7wF7VQ9VSqUgDVUjXyGIipbsMlAAQgz32ycvOKl7lKtdjqSlQA28BJ4DVeoOFJ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716778873; c=relaxed/simple;
	bh=KkWUF+Ohkjx/svEf3wHrviX8k8IfWZaNlYqryqSDCWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qd0c3Id5UUx8yzdag6Mm97ZHROnDqfuLfwCKkGNAWIZtI+Tm80UqudfpKVEzeki4yLVJUzXV/3akxOrXGEUJG+WdwxK/5WulUuYW003g6FkAFPFTw34ynZAGzcqesBeN5RMQMnj26xqd/2Xn4cUYFSfihWJdj16r4ABrwd31VF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L8Fray6S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 500EDC4AF07;
	Mon, 27 May 2024 03:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716778873;
	bh=KkWUF+Ohkjx/svEf3wHrviX8k8IfWZaNlYqryqSDCWc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L8Fray6SKBfykrOppE8GpMWfi8O2aVlkBCduVCawQi/fn6d5G0JW2FldweOHIobTZ
	 2oyB1d8bKgEJ0qYdmtyk5ch7emXYlELerSSHbaxqDbH2qDIN6reYrLh0eJ1VvqGZTL
	 QGRrkzgbPwdJyK9MlFXNlbX7tbsWjDwNbYq8hH/kTpB5KkGTZ7LjbDBp+voDbNj5vz
	 cAr2dxdhFabGKanEATFFmg4NqhOCzLeOBqYUs012eh/ZlgyjEWMfpZJO9x75lptdjg
	 sIk7DaGybOBUCppkhVHF4JRraKPbDpYjHy/Ka/oX0rUpMhnQsCLn6rGnrqcv59zVZS
	 5L9QImEOgH2vg==
From: Bjorn Andersson <andersson@kernel.org>
To: konrad.dybcio@linaro.org,
	manivannan.sadhasivam@linaro.org,
	jassisinghbrar@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: (subset) [PATCH 0/6] Add some devicetree node for SDX75
Date: Sun, 26 May 2024 22:00:38 -0500
Message-ID: <171677884217.490947.17155292242168330229.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240426055326.3141727-1-quic_rohiagar@quicinc.com>
References: <20240426055326.3141727-1-quic_rohiagar@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 26 Apr 2024 11:23:20 +0530, Rohit Agarwal wrote:
> This series add some basic DT nodes on Qcom's SDX75 SoC that are required
> for different subsystems.
> 
> Thanks,
> Rohit.
> 
> Rohit Agarwal (6):
>   dt-bindings: mailbox: qcom-ipcc: Document the SDX75 IPCC
>   dt-bindings: mfd: qcom,tcsr: Add compatible for SDX75
>   dt-bindings: soc: qcom,aoss-qmp: Document the SDX75 AOSS channel
>   arm64: dts: qcom: sdx75: Add IPCC node
>   arm64: dts: qcom: sdx75: Add TCSR register space
>   arm64: dts: qcom: sdx75: Add AOSS node
> 
> [...]

Applied, thanks!

[4/6] arm64: dts: qcom: sdx75: Add IPCC node
      commit: 220be0f04eb1c753fdfe8ff95942fbcdc5ed650a
[5/6] arm64: dts: qcom: sdx75: Add TCSR register space
      commit: 85ab1969865b78dc14af930d0819d52ab9cd6dee
[6/6] arm64: dts: qcom: sdx75: Add AOSS node
      commit: 91f767eb693881c0424e05866fde3c033c86c2d3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

