Return-Path: <linux-arm-msm+bounces-58572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D210ABCCFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 04:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB2484A4557
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 02:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8E525C70B;
	Tue, 20 May 2025 02:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JPL7P/yI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9120E25C6E8;
	Tue, 20 May 2025 02:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747707316; cv=none; b=UH4oLqgcw4i5Q8nMNdcLKhhbeIYn8muzUZw+weJOG+ooHcoNZtxHnY/9Esy9ZnTd1jqD130I7BH0NS17VkL8Zpk+gB8yxCXufY67u/242d5cmhb9Y0R9FZBY+pDWBi8zYMkowZtJYPFyuFmPO6QvS/Ogcpm4MzgDzNLsVu+XcsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747707316; c=relaxed/simple;
	bh=2ilp7pxphIm8EJs+v95HhhPbd0mhL6m22/LNf8r+w9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oWvihfufi4a/1J3FK8q9M24dnJ8cZNQYhRqfC5sZ3tnePyTpZtBFwTxHNnu3hvZHfG+GfkwSsmogRIm/YNXSGijRE01BLuKMk1rE3gy07xNtCTPvJfS4sjERDgAn7UebWIGjk0toZVZnKx+XybTSTeYjuB0wXDqsU77MZKv0r9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JPL7P/yI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D11C4CEED;
	Tue, 20 May 2025 02:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747707315;
	bh=2ilp7pxphIm8EJs+v95HhhPbd0mhL6m22/LNf8r+w9s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JPL7P/yIsoDZ5vr8tQGuQo7erf5BPb8B38Uakjtia5cd1m2m3JKsl7pkEynnH9+Df
	 A0S06prhTw8Wl0P8uixzfnIPunQlZF6m4Hf0/43/lvD3zZ2ibgnghnFeDxp/LmyHl8
	 QMZW3yxgIiu7EsRT7rvndpudxoeYnEZYYSDzqIQD9At0CNJnVAppME9h4bq1UIngXc
	 Pv5frAtAD2jC/koQCitef9smGlMNHHj5aYyhJxT/utRHkpHBpjAhWiNtfx7kYJ51PJ
	 cNOuxRe1RhZuhE5DiK4wuea1ms/2zXM283PmEK0Yv22QpmU2XIz5UMExGlefz8WqMY
	 wRuS/g3FFDC+w==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v3] arm64: dts: qcom: qcm2290: Add crypto engine
Date: Mon, 19 May 2025 21:14:44 -0500
Message-ID: <174770727723.36693.5478181432505582196.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331123641.1590573-1-loic.poulain@oss.qualcomm.com>
References: <20250331123641.1590573-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 31 Mar 2025 14:36:41 +0200, Loic Poulain wrote:
> Add Qualcomm Crypto Engine (QCE) and BAM related nodes for this SoC.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcm2290: Add crypto engine
      commit: 831e7dcc06cd3eff2213c691413e4bd0550ddcdf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

