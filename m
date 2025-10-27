Return-Path: <linux-arm-msm+bounces-79060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F08EC11D04
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:43:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ADF7034FE0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E236D3491F2;
	Mon, 27 Oct 2025 22:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QwTt/W5d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BE43491E7;
	Mon, 27 Oct 2025 22:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604527; cv=none; b=Sf6DMdhWx0AFaolCivMJ0fOq9Q5jYSJcsaiQ30FDKkGP+XTd3H/X4j/bnuYxXiGNw7LsJgDNKhJAaZjSZ6dljytZIsra8iILea5Nebu1K6ogZBjxtEJLZaq9nWbB70BRkmKQQ/vOGQghWWgbxyDnyObmJvDJPXhDhl1nMUz+kDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604527; c=relaxed/simple;
	bh=2goPCAIS+s/vWDxBV9KgW7LA61VWC+J7yIzd9CTC9UI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cLpWrd8fTsZd9/vYJkut1P7M+vEyLmVvCGul4lPxzB5nbKdTq/9ij0GpJPo6imaP659NGPLYGpzc/Om8TocdOF7uO+Qx4T2BI373fdeHH2GFLalm93u6ywq0GAexJWTS9elh+08ePK3paEywNaEZfpbo9Ecq9LZhVSODrEy9vXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QwTt/W5d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE54BC4CEF1;
	Mon, 27 Oct 2025 22:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604527;
	bh=2goPCAIS+s/vWDxBV9KgW7LA61VWC+J7yIzd9CTC9UI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QwTt/W5da5W6koPdzVYgI9bYKwXUyzO1Q3UGi4JnUDmO/lgRB9xZwz4TvduqrJfSC
	 REydLF9IxJJg7roFZRcjI+UJeCcda89wGUZREE3XOA3FRmUF+jQ8hJA2ZgxVdjOjeA
	 t6arKQ9b7JfYE2OWHGCfAxNXC3PXUzcTDn4epjEmyivxXp72ukr0DZdz/UUD6SbTdh
	 Eh1myUGPWskCAkZm6m6ciG3lqsrU/GNTAAzLhf3VU+oyayOq4xTz9D+fyC7VaB7ppw
	 cr9xjdFvDelBBuT/bn8h0uktYt9NeLTVNAyqa/TvWYAqNI82/ZvhqjZktpCt1H1IKC
	 nVLHn5aaUnYmw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	tingguo.cheng@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Update regulator settings
Date: Mon, 27 Oct 2025 17:37:20 -0500
Message-ID: <176160465187.73268.3694120785953225435.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919-b4-rb3gen2-update-regulator-v1-1-1ea9e70d01cb@oss.qualcomm.com>
References: <20250919-b4-rb3gen2-update-regulator-v1-1-1ea9e70d01cb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 19 Sep 2025 16:09:24 +0530, Rakesh Kota wrote:
> Update min/max voltage settings for regulators below to align
> with the HW specification
> vreg_l3b_0p504
> vreg_l6b_1p2
> vreg_l11b_1p504
> vreg_l14b_1p08
> vreg_l16b_1p1
> vreg_l17b_1p7
> vreg_s1c_2p19
> vreg_l8c_1p62
> vreg_l9c_2p96
> vreg_l12c_1p65.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: qcs6490-rb3gen2: Update regulator settings
      commit: 172ca2d802482a622b84f24bb872760d71a4e368

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

