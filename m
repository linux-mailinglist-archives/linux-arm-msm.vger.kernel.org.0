Return-Path: <linux-arm-msm+bounces-20501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D608CF79D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 05:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48FB91F216BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 03:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4549A28DDF;
	Mon, 27 May 2024 03:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDDKPZEm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AE628387;
	Mon, 27 May 2024 03:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716778860; cv=none; b=Y7dvud7L0YVHi0g72vOKqxd4bripj2OdsYE5G+ZjvdbvEBlqQaFFdeQOZWzn6VejEOVtZ8yWjMXQkdpyX4Gs1+R8MRCAVkG2nz1JGdvYe1QgsSgE2E0npsZgJanE4wXfvBxdgnlHG1d8tq+Wg4l+G9pD/OTYPM4ONjLmOGTGrTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716778860; c=relaxed/simple;
	bh=/TY8I3X1jPyCLToOQbkts7NNqII11DhdDRlDcUoi8rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nLD4b7DBC9uKAQmL7trpgWiYQ6Oyo+tIsQ2xuUQzYb9Jsb4cR3IBZyiMU80aDdxw36LB+ka4HiCZqPyzm/XmwdcaQr7JdyKhakaYmEk+greLcR5DDydyNa5i8mV0r4/mHwk7zdB8bHo0rbSDd2hYO2M4lU2kNpkTNSWZ+4ZFRCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cDDKPZEm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01FDC4AF14;
	Mon, 27 May 2024 03:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716778859;
	bh=/TY8I3X1jPyCLToOQbkts7NNqII11DhdDRlDcUoi8rc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cDDKPZEmfiZeHe4p8Io4W1jmblExreNz+OGGr91emlfm+iGiutjEoGdg9N2rm8IYr
	 w3k18OwhlQVwbKGPM7Rl1b9ie3Dg97zcZhmHqzgXI01twtDyBIx/bSFguGC8b40c8v
	 BcDTDqC2Qo3u9om7C7aLgdersr5TY884/TFCHjVcyNFS4UGaSR4eT0DrpL5ujKiaRB
	 4/Jw/6jRzBRNdDuoaj+Y2jkJ7ZzbuRmeTPa+w4Pav0UkJoMcD6VZMgv9qqDzU6VwlG
	 jD58TJjCijTzCpXAFINCFFF3CKgmAjz3h07Oq0urxT9hSYWq09BekJud9CE8/UZkuW
	 MeF2g4wUrkb+g==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-*: Allocate some CMA buffers
Date: Sun, 26 May 2024 22:00:27 -0500
Message-ID: <171677884195.490947.2226602783987880246.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240522-topic-x1e_cma-v1-1-b69e3b467452@linaro.org>
References: <20240522-topic-x1e_cma-v1-1-b69e3b467452@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 22 May 2024 13:40:09 +0200, Konrad Dybcio wrote:
> In a fashion identical to commit 5f84c7c35d49 ("arm64: dts: qcom:
> sc8280xp: Define CMA region for CRD and X13s"), there exists a need for
> more than the default 32 MiB of CMA, namely for the ath12k_pci device.
> 
> Reserve a 128MiB chunk to make boot-time failures like:
>  cma: cma_alloc: reserved: alloc failed, req-size: 128 pages, ret: -12
> go away.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100-*: Allocate some CMA buffers
      commit: 50b0516030fd549c9fd4498c9ac1f3a665521b2e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

