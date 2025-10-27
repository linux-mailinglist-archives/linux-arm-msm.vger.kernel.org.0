Return-Path: <linux-arm-msm+bounces-79050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC51C11D07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:43:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9391658067B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677EA344054;
	Mon, 27 Oct 2025 22:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fq7pLwpw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4C0344038;
	Mon, 27 Oct 2025 22:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604518; cv=none; b=cjTjYyTqvI/sd5r66AXONbAyIrRtfdUzuyqE4N9ylCxtv21ZpjC1ZNX+HfYjC2M0EMcAj1EG3RtI+XnwYsPXPkaRzwMQU98Crj/m1RVtZ7BYWL59f4MF7ZkI5glyK4//xNKYtaTZinv7QmFEua8ShItZf4WXLt4COFCYxIgn3fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604518; c=relaxed/simple;
	bh=3PIW3GrdPjaCj6iy1A5OmkOMT62GmHPbVSyhbrd4qpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EfpRnaV3NisnxKuMjhypcdnuQofrYZmf++d8BMjgiNF92S4OkNZbcQcCqxyCKY9YQITkgAbgdZRb+4y0aSXuw2D/e7uGKvIcTC6aDbC3WpT+CM4ir9vtdS553yVKfoV64GLyJ0bEKsccqcSBIccQlI71F3CAMPPYGFkmzbzh/Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fq7pLwpw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F0C3C4CEFB;
	Mon, 27 Oct 2025 22:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604518;
	bh=3PIW3GrdPjaCj6iy1A5OmkOMT62GmHPbVSyhbrd4qpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fq7pLwpwdUNt84wog/d4UipzZyLqZdJY0l1LtGZMdAc8HFczgFAUt7bnCmWd21eGd
	 rf2KjIVsrhVDRKSVl805ter6ImWfj2QfO9Vt7dXyhPp3XGH++opcjpbe9OjPU7qQKg
	 9LaGlQafUPEVMyEqs2LnRBccJG8n8NCookhlIMB/sDpmvODuB/BILnF8UYQRrwlVPH
	 zT7JATLFdi20E4B7mVWq/zcrk44tTM9sFuH6RGNkblO/yP5XxrAq7IaCh0WSYWqPun
	 I25wu8e2GJ2bOf3fff+luxHPATGCC6wxngiqmHoBBflwG4GpgCt2ov2sIG72CsVbIR
	 uL3zBdM5g+NFA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable configs for Fairphone 3, 4, 5 smartphones
Date: Mon, 27 Oct 2025 17:37:11 -0500
Message-ID: <176160465220.73268.12654892674003695291.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014-arm64-defconfig-fp345-v1-1-53fe1eeb598d@fairphone.com>
References: <20251014-arm64-defconfig-fp345-v1-1-53fe1eeb598d@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 14 Oct 2025 14:11:18 +0200, Luca Weiss wrote:
> Enable base options for MSM8953 and SM6350 SoCs and device-specific
> options which are used on the Fairphone 3, Fairphone 4 and Fairphone 5.
> 
> * MSM8953 SoC
>     MSM_GCC_8953, INTERCONNECT_QCOM_MSM8953
> * Fairphone 3
>     NFC_NXP_NCI*, TOUCHSCREEN_HIMAX_HX83112B, DRM_PANEL_HIMAX_HX83112B
> 
> [...]

Applied, thanks!

[1/1] arm64: defconfig: Enable configs for Fairphone 3, 4, 5 smartphones
      commit: 415837986320ec94a0ecf4a85f95bca13575f81c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

