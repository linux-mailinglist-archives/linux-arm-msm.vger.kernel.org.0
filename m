Return-Path: <linux-arm-msm+bounces-70499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3ACB32D23
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 04:59:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 613511B610A7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 02:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE27221F11;
	Sun, 24 Aug 2025 02:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="liqrxY6I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98132221299;
	Sun, 24 Aug 2025 02:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756004169; cv=none; b=M5XHGstZNWZ/6CmHWOCYEuBF/0rbPt1qEkk5G04riYVssLsbKbB5VfpHBKMMOZmMTY4NKk3KdgBMDb29Td+HtURmbQE54BDfr3B2udovpqyQCmcVofQwvkIuxtJH8Udv9Il2Yr5ZpTEELtRYFNs3RGU/j2o16bnmK8Ma9OmwGu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756004169; c=relaxed/simple;
	bh=zp3XlvmF+H8SHwdXL6Zl5CJTC3wuNO5SdH2cftyDvUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k8VnYuVF6VsvwGbTkErD8aynPAO1w1Fsh64koSUh9nvUEdfSLpfbu52bZGNcFv3GDJFvYvfbvF2B25YYCu15PfHGf/4tqraQRoBzRcC6jqGxBjyx+eGBjm60grG4hW8Wz1hPHF1PfoTUW/R/SGfUs/A7fX3F7di13/1PQIjRU1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=liqrxY6I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8F15C116C6;
	Sun, 24 Aug 2025 02:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756004169;
	bh=zp3XlvmF+H8SHwdXL6Zl5CJTC3wuNO5SdH2cftyDvUg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=liqrxY6Iu/0bYe0QSuWOa+IQDf5OZbzCRr1UW76gZ3AM/9VfJ/JCZHPviAqyCLZ73
	 qXnu64BO9nCYlL9odouWNCEHAwSrf2Q5W15QOi9bIde0wooMF503f1Aib6/nPNf/4s
	 Xv8xocs31pJOm4S8Ys6NWcDCH1M82PjrlfDLQw3Kd86kv8zI2m55Wb+SDaRMS9Xdeu
	 SMgjkbMsqygfj+V4v9XFMTVxR3VTxF+kvkyR4n/di4u+9ZRt60XMtBFV/oqhoHwoNW
	 /GCQ99akqXtP9M+AWuLM43jL+SJOFmLj9Fuh5cjPTDyk5JdMdLqdviNIKxFuGysN9h
	 hosbKYYr5SyBw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 00/15] arm64: dts: qcom: Fix interrupt-map dtc W=1 warning and cleanup
Date: Sat, 23 Aug 2025 21:55:42 -0500
Message-ID: <175600415294.952266.11471241006603458949.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250822-dts-interrupt-address-cells-v1-0-d54d44b74460@linaro.org>
References: <20250822-dts-interrupt-address-cells-v1-0-d54d44b74460@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 22 Aug 2025 14:04:00 +0200, Krzysztof Kozlowski wrote:
> Get rid of one dtc W=1 warning and cleanup (verified with dtx_diff).
> 
> Best regards,
> Krzysztof
> 

Applied, thanks!

[01/15] arm64: dts: qcom: ipq5424: Add default GIC address cells
        commit: dc3f005e6b1f5b49ff70b98164badd664978d60e
[02/15] arm64: dts: qcom: lemans: Add default GIC address cells
        commit: 0eb765666714ea310439107bab3182430cc4d11d
[03/15] arm64: dts: qcom: msm8996: Add default GIC address cells
        commit: d434b7198a115a54c5f28bdffb6b77196c85758c
[04/15] arm64: dts: qcom: qcs404: Add default GIC address cells
        commit: 0325653b1adeb8f47dd46874e4fe8ec894a3bbb0
[05/15] arm64: dts: qcom: sc8180x: Add default GIC address cells
        commit: 6cfdee6dca1e5073b52eda54fceb193a80651576
[06/15] arm64: dts: qcom: sm6150: Add default GIC address cells
        commit: b8159aaf5ece22de52276d75b8b7d5ec517fe207
[07/15] arm64: dts: qcom: sm8150: Add default GIC address cells
        commit: d0054c3e5b8f737cda22c4b7625b8979fa3c8310
[08/15] arm64: dts: qcom: sm8250: Add default GIC address cells
        commit: 3e17f489e3f46ffe21d3d9d769b75ddf24905707
[09/15] arm64: dts: qcom: sm8350: Add default GIC address cells
        commit: 9c18757804e66304ed0287ed874a3575c7cb77e4
[10/15] arm64: dts: qcom: Use GIC_SPI for interrupt-map for readability
        commit: 2f8c7b179f283876871b9359be3ed947c9c56b56

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

