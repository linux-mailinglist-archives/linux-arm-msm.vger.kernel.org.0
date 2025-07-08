Return-Path: <linux-arm-msm+bounces-64036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD13EAFCAD7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 14:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED13F4814AF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 12:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 265941EEA40;
	Tue,  8 Jul 2025 12:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pm/uJkZc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F026B17A2E0;
	Tue,  8 Jul 2025 12:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751978961; cv=none; b=Trcn5aiepCuScCAbNyFR4xqTf4xyEV8GeMrJATbyGEyJFEBEkvRBG1F8fuCU83ovsH0bv0AKtlLFbFj97ZVKelK0W/fBU17qJULfcNR6MbDDRUQaUC9/9pyhflnQREDnC2ma26/izLwTLocUEF87fxHWl8E5vDlI+uOMtIVxIkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751978961; c=relaxed/simple;
	bh=1FTq7reRRyN9NdkmjnF7RldFQXRezF9Nfp2asq+A3JU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RFc1Qwm9QDrWKXB4rig862dleiu8YRzaHja1ZotMsdZu+cglfPdZNajZ0nAfyj6M+tArsIybOyWsIKZCsg4buDnUEJZVuLD0nZ8dijVIM/JNkenED4dnSPeGAvX0O+3zsbtGCJpiAEOef83qRf6MypRhi/wTvIuaNsCg1x3iSQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pm/uJkZc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDBBC4CEED;
	Tue,  8 Jul 2025 12:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751978960;
	bh=1FTq7reRRyN9NdkmjnF7RldFQXRezF9Nfp2asq+A3JU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pm/uJkZcZ83W0pt74N10IwKUABPmHqbX+BHQJghwth80YTZ5pNQbLUsCExpj0cGBh
	 aSctck/cMPBk+5i1JVy5gpxQnSjE9MJnbNpU1JuTaED1T5xrl4nQjIJWWpGbfh7QtM
	 9UAqpVkjt7yE7AtAiC7/WKifmsLSldm793ohxdf/E4A6zPDaPWGPkZyM3vUPE9kNXs
	 1hMbh3BDAV2NTgKhnX6b4u7fD1/HalJV82ioiBIO09wJybczPBR6LwIqRbPcDQefKq
	 8cgaNTKR/h6Q/cmBMJepZOwZl7esoQYhsM10awc1puOslQMoHloLBxsok5cWCPrrQE
	 3ihrNde+XqH6Q==
From: Manivannan Sadhasivam <mani@kernel.org>
To: johan+linaro@kernel.org, mhi@lists.linux.dev, 
 Manivannan Sadhasivam <mani@kernel.org>, Slark Xiao <slark_xiao@163.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250528092232.16111-1-slark_xiao@163.com>
References: <20250528092232.16111-1-slark_xiao@163.com>
Subject: Re: [PATCH v2] bus: mhi: host: pci_generic: Add Foxconn T99W696
Message-Id: <175197895780.10109.7892492341064362636.b4-ty@kernel.org>
Date: Tue, 08 Jul 2025 18:19:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 28 May 2025 17:22:32 +0800, Slark Xiao wrote:
> T99W696 is designed based on Qualcomm SDX61 chip which is a cost
> down chip refer to previous SDX62/SDX65. Though we have a support
> on SDX62/SDX65, we create a new channel config for SDX61 since
> we add a NMEA channel support from this product.
> For new products we are allowed to customize the subVID and
> subPID only.
> 
> [...]

Applied, thanks!

[1/1] bus: mhi: host: pci_generic: Add Foxconn T99W696
      commit: 7a793ba2cc4a9ef59ab290d50cd847d314514323

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


