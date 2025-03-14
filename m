Return-Path: <linux-arm-msm+bounces-51494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBFCA61BBE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:07:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC0D08830B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F345F2147E3;
	Fri, 14 Mar 2025 20:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rs5eiSgz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69AF2144D4;
	Fri, 14 Mar 2025 20:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982515; cv=none; b=Us9SogqCS+wCIR2WQ70Sx3E2WOxpSUtX38YPMpUUMofQFFtbP5M3ndhE5YgojMcPxK9FDBW+4w5IGq7AMKAxJcAuWlu0eOtpZlplV799px8P5xs9S+eBijf68wmbPsd3NzpvPT5QB3P5Nd+U3hWpNE7xurA47LzZNTBodzNDUBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982515; c=relaxed/simple;
	bh=88f7Ma4D1tI08SR+/sJODP9RMMmek9rQUGeeJmk5KjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M9HPyDDf7bNQaRbVTyIJ3Sk46gKqSBynDqj+9WOg0usICgPaQKulVrUlNNU2StPr/zL7qWCp+CuEAovo1J3Sft3GtGgmOroNY7viAuY43Ofkg8MhRTxfYy55Ie6bc8JNf3uIFTrSTMF10xOIPtqbzeMciZHY0zpM8TRMj3xKBzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rs5eiSgz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70983C4CEED;
	Fri, 14 Mar 2025 20:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982515;
	bh=88f7Ma4D1tI08SR+/sJODP9RMMmek9rQUGeeJmk5KjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rs5eiSgzeWEpXUsB5rezj6c412befpbq9QP6qG82WJJpEHoix3nAWdIDelXcIl9f3
	 bZlSPKsd72r8vU6fwWlqBOiztktNVy8FYz4QA1r+w7yY/UoPTdik2CgianYswLGIHj
	 SUmSuAboN9JEedcIqaLDmGHQflmKlAAyMhjcYL4/+hTcmlcjP96cQSHQQGAw5hL7mX
	 HDuYjhHjh5LJt71hRn6DXLHx/Sd/SdysIUHmdJEsGVqopjbNmrgOXsCSc0SDvLAVLb
	 28EmLVVQuRNLb7QhCfGAefqCsYs6AIB7S+KCjm/yfsS5qx7IN5ziURa3t6WVl1D+DY
	 pnPq7+7aFSQWw==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quic_srichara@quicinc.com,
	quic_devipriy@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: quic_varada@quicinc.com
Subject: Re: [PATCH v1] arm64: dts: qcom: ipq9574: fix the msi interrupt numbers of pcie3
Date: Fri, 14 Mar 2025 15:01:08 -0500
Message-ID: <174198247870.1604753.16869100845723436708.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313071422.510-1-quic_mmanikan@quicinc.com>
References: <20250313071422.510-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 13 Mar 2025 12:44:22 +0530, Manikanta Mylavarapu wrote:
> The MSI interrupt numbers of the PCIe3 controller are incorrect. Due
> to this, the functional bring up of the QDSP6 processor on the PCIe
> endpoint has failed. Correct the MSI interrupt numbers to properly
> bring up the QDSP6 processor on the PCIe endpoint.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: ipq9574: fix the msi interrupt numbers of pcie3
      commit: c87d58bc7f831bf3d887e6ec846246cb673c2e50

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

