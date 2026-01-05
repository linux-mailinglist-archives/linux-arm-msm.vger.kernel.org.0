Return-Path: <linux-arm-msm+bounces-87479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E31CF4AFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 17:30:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 109163007495
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 16:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720653376A9;
	Mon,  5 Jan 2026 14:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UYIsr1MR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DCF33769A;
	Mon,  5 Jan 2026 14:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622098; cv=none; b=DhiXpRMdIRg7Dcg3I3BIoe8Bz/J6YISMn5tnf5gvO8IdEidd3pM9rYvOlSvjQy4jaOqP8YTGCRuU1C5cnaDHW5LW4qplDZ4xOKh7UvFjT0o3Zt5egmCSYHJPu8yCRICo3fWHURUTY4DUsGvqxR11dlEtmN27rxUhbB7ZpLRY178=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622098; c=relaxed/simple;
	bh=nwN0pQFhi+ijUzj8bmiwYI/Ad969wX2RiAkWTI6e2LE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RW4CWlcJVkukwXCxLnsmIhFq0g9RxqkfcP92eS2GMAGVYNK7FKdExg1BSFV6mXf7VWucRWdJYf+w80/ffGzkIdWvRpQCbmy+7fhhrjuvz/c3BZgsUrk5pZncNFcOOG76ObNmxtV/Kfz3YMPJxnVRS8No9h+hdrF5Ynor4A5nuDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UYIsr1MR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC0D2C16AAE;
	Mon,  5 Jan 2026 14:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622097;
	bh=nwN0pQFhi+ijUzj8bmiwYI/Ad969wX2RiAkWTI6e2LE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UYIsr1MRTcrgmQEUb0i3nd43Se9IZpuAr0VMWrP/5nVIdhIJRG7DeaAFpgBlhonoF
	 /VxGaL+47Q7iJN8+4ETRh0Lkw8VCCdExEudACWpMQTv3cHViP944WV6ve7OubkvZQ7
	 7cOPiQd0r/d1cS5Il482FEUHDTjaUMHSDZkU4B8JS2eyJ5bsmbDeDJCNsIjBnkQkwW
	 KlmSflF0793w3ZhSupkAWvw0pU3Fc3zrLZ9lY5t8KVMd7RRLAr97qoaEtQ7CcGO352
	 DaeDZpPweNwb6p8Cx40fdo+BuYhuPeOJ7++FxVPZFzW9kLc+x1fgrgFa/im1oY4pLd
	 oNldLET5QyQ8Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] arm64: dts: qcom: lemans-evk: Add OTG support for primary USB controller
Date: Mon,  5 Jan 2026 08:07:26 -0600
Message-ID: <176762206397.2923194.2060104930644124439.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251128102507.3206169-1-krishna.kurapati@oss.qualcomm.com>
References: <20251128102507.3206169-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 28 Nov 2025 15:55:07 +0530, Krishna Kurapati wrote:
> Enable OTG support for primary USB controller on EVK Platform. Add
> HD3SS3220 Type-C port controller present between Type-C port and SoC
> that provides role switch notifications to controller.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: lemans-evk: Add OTG support for primary USB controller
      commit: 3b226dc2a0c39de609ecb383a92d9ed99d7aebc8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

