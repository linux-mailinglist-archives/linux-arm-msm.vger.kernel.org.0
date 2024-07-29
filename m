Return-Path: <linux-arm-msm+bounces-27163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D723C93EC11
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 05:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12B251C2166C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 03:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865DA8286D;
	Mon, 29 Jul 2024 03:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCPn1EBu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608AE82862;
	Mon, 29 Jul 2024 03:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225521; cv=none; b=oW92KS+rpV4hPxMmsh9qURT0dwEUBxXcNRqT7t1tSVYSfxpKyMptlzO3+i4O5x32673eb2CNsYqy5mMYXmr4BaMxRTnrVUxir0ED9KsI9ZHhILFSI7KIUyTH46SQyIqFvKBJ0PJOzid9/59CcSO4NNvFs9MIK9IrlqPqkvF8Xto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225521; c=relaxed/simple;
	bh=zfriKC4M9WC7MNKyT3UTplh3m6MtM6owsGBgoUm8sdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LCltprdVCL/ekzqPM31rKphFiUVmrPxDDxSDWCqbLJOHUkvinDxf04DWE34jZ7OXWpOsjHBNKaBfhGXCpbASEAp6IgQk6Tk3ksHqNWm95M6BOLCgunVhQNc3ZN2deiJOIm5HGLPdJr3UFjfl9XVLVB0b9TGuokwnDqh5z3MBEjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCPn1EBu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A31C4AF11;
	Mon, 29 Jul 2024 03:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225520;
	bh=zfriKC4M9WC7MNKyT3UTplh3m6MtM6owsGBgoUm8sdY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WCPn1EBurIP7zJo7oV1tZpBiL37QVWMI9+FMfKZNXL/rHVXJp6uDDoXWyPi/36XB4
	 3gt0lfeOUZ93nEzV4QgjRsRSEBMKzTJw56OP/gJ6qp6RMRMKnhSEZ0b/GEb5fmnVkR
	 jKmKKTUWGAWS04PFcIgZpKYV/MzwMg7TwVdwKvJ5h8eHv3I6dPcTdIrfDuTFuU3rtV
	 RyPI05xsKkIoXUTdqEryx1g3m9GxFRS5YCEQ8LtI1oQT3/FKqkCzDFbAE9gRnQ34Xt
	 mXb6BTKS+dDhVm8CeFuLeSBd3dE1bNkaWPRLVplLZipIPGVu2udpRF1skBHDtN+uhd
	 OADYY8V1HeOnQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Chris Lew <quic_clew@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd-mapper: mark qcom_pdm_domains as __maybe_unused
Date: Sun, 28 Jul 2024 22:58:07 -0500
Message-ID: <172222551319.175430.2431874932419605913.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240719101238.199850-1-arnd@kernel.org>
References: <20240719101238.199850-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 19 Jul 2024 12:12:31 +0200, Arnd Bergmann wrote:
> The qcom_pdm_domains[] array is used only when passing it into of_match_node()
> but is not also referenced by MODULE_DEVICE_TABLE() or the platform driver
> as a table. When CONFIG_OF is disabled, this causes a harmless build warning:
> 
> drivers/soc/qcom/qcom_pd_mapper.c:520:34: error: 'qcom_pdm_domains' defined but not used [-Werror=unused-const-variable=]
> 
> Avoid this by marking the variable as __maybe_unused. This also makes it
> clear that anything referenced by it will be dropped by the compiler when
> it is unused.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: pd-mapper: mark qcom_pdm_domains as __maybe_unused
      commit: dbd6bd124e34f9f859271ed9ae2afc39f36c7e8c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

