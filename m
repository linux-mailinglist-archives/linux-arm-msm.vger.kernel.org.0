Return-Path: <linux-arm-msm+bounces-21045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 023E98D4418
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 05:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95C3B1F23231
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 03:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B7156771;
	Thu, 30 May 2024 03:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDPiUMW5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACF956759;
	Thu, 30 May 2024 03:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717039624; cv=none; b=t7K5oOiUmZdqYzwzjg7ww02sXf7aMdYLi9wbHm3JVbqFP/C0MOUB4Kq4HQ6seTGEtnfRq00yrqX2BbahyAgQ08jzriarEjRdPncq19EhURugXhObbT3MQOnDjLB8OyuQmwF9YhdKeVDUWCumBaOp2VRvsHkhBZF3xGkuHuF0pFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717039624; c=relaxed/simple;
	bh=Vc3ms1TNsMAkiORl1uqy8xv0z2tOU2rJSCXuKz+qbfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lU3XXNtZCgrgMJdfT+bkDmDnn5IJH8NIljB6KaCiAlodByckg4NhNXBEAYK5sIHQyfqBaDRN+yRHjZ+PfHo1k9I9xUMRYkPBTL947cmZPgS9fNuMyOVQTG/CusamwZeorgtDF1dg8fjQ59QBDHtFypMtXaiiskRVAw5FfhbL7vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDPiUMW5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47C8C32782;
	Thu, 30 May 2024 03:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717039624;
	bh=Vc3ms1TNsMAkiORl1uqy8xv0z2tOU2rJSCXuKz+qbfg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NDPiUMW554JKArIMgGQDNUnhaW9Ax5FjM9I82XJ4aF5kbLnqdllJV1mORJsnC5w02
	 zqewtUeZQZhi5oLG/qv9qNAEp0R5Z4bzRFeBlJFrmwjzgph6qriaElv2pnEBtOjCFz
	 O8Oa1agpVufuvfi2nE1TRQgLsxuXE/bHQxNGT/MPnaIRWdtdnZRhxTv9QyPL3a05q4
	 UQYkCj7+l1sKLpoKDq5ZTRVq6cuF/Sd1Y8zqppJ/zgtbQFAui1Cv3nW/y7EJK3inm2
	 CjJW/y6WKQHuqSS5+w9YfntxWdK1q2X8UYFMsP+ZpOIE4GvwmLHpoWIfjJNXw/6igz
	 hWpxVVnlj2oiA==
From: Bjorn Andersson <andersson@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: defconfig: fix config issues on Qualcomm SM8350 platform
Date: Wed, 29 May 2024 22:26:59 -0500
Message-ID: <171703961685.615222.15231747112923873807.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240530-8350-config-v1-0-d6e871236ed4@linaro.org>
References: <20240530-8350-config-v1-0-d6e871236ed4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 May 2024 03:51:12 +0300, Dmitry Baryshkov wrote:
> Fix two issues observed with the kernels using defconfig on the devices
> using Qualcomm SM8350 SoC.
> 
> 

Applied, thanks!

[1/2] arm64: defconfig: enable CONFIG_SM_GPUCC_8350
      commit: 3833d5787e774cda0f8ee19929a573924ba046b0
[2/2] arm64: defconfig: make CONFIG_INTERCONNECT_QCOM_SM8350 built-in
      commit: 26bd1c26991c69af6ab020289308cc5ea80cfb08

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

