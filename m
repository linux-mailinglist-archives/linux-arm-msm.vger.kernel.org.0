Return-Path: <linux-arm-msm+bounces-28694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F06CA953BE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A2431F26284
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696591662E2;
	Thu, 15 Aug 2024 20:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XHNPAVEY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4425914EC6E;
	Thu, 15 Aug 2024 20:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754487; cv=none; b=W5La0yMtY3i72G9IH0VG91MwlfXoR6LVUV8tCJrIS1nU+XT1Vk0v7MJW77wQFQFZoOoQ7Ow9V2ep57wMc/xDIeM2lmN5z/cKRrnr8lME3rq+O8W5BMdxXZrvROcuuTUhif5RVSXlDrXXRHuO2NmM6vip7gSK5Vwc9hGYIHFsVp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754487; c=relaxed/simple;
	bh=GE2khFBcy7yR360jXiArONJDt+vvLQpw3Vy/jLupo+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uHPCT88C7Nqb9+0b9waOgkHP8ykhmc/1/G1AmPggStznWbioIRqVw7osgPNz3XbC7m24uZC3o6+zSPqtDS0uloWrmk4SYgjaelLkx0rFQ2McunxlmGNOjSQe0XPzq766EPCLaWlZPo/X8Pn6GqMa6pH6/qzk56ZXSg7gB9KFHcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XHNPAVEY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9512FC4AF0B;
	Thu, 15 Aug 2024 20:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754487;
	bh=GE2khFBcy7yR360jXiArONJDt+vvLQpw3Vy/jLupo+8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XHNPAVEYAmgx92NfZhSE2t4p4YN1xduvZ26CjkL9gPdPRmf4tEZptLdkz1aq66Yfr
	 XvqIiF+IWaPWOoGhQqxKYqIRhJooI/HpLDKWyfpoz9DeWSETcOXiFAd7MFI97XOx63
	 OZxas/IO3dO72OfnMPoh4SKRDzUdo/7p61H/wFH72p3pl+pR1dmfSekofZ1d8+PaCD
	 3QYNOJ4xagtf+bBw14y3VY1xxJ9aJ4ecFRW7l8UPr0s7d0on8iq6L3BYya+i9umKnp
	 tP05lCYcy74QFXGQPT/2l4SjoSNHDLqDebxAotzvG/H8A74ZQGwO1c/Mmyf9vh5nbB
	 Q6eYXpnGCpzhw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Mukesh Ojha <quic_mojha@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v8 1/2] Firmware: qcom_scm: Refactor code to support multiple dload mode
Date: Thu, 15 Aug 2024 15:40:40 -0500
Message-ID: <172375444809.1011236.3383676612223403430.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240715155655.1811178-1-quic_mojha@quicinc.com>
References: <20240715155655.1811178-1-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 15 Jul 2024 21:26:54 +0530, Mukesh Ojha wrote:
> Currently on Qualcomm SoC, download_mode is enabled if
> CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT is selected or
> passed a boolean value from command line.
> 
> Refactor the code such that it supports multiple download
> modes and drop CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT config
> instead, give interface to set the download mode from
> module parameter while being backword compatible at the
> same time.
> 
> [...]

Applied, thanks!

[1/2] Firmware: qcom_scm: Refactor code to support multiple dload mode
      commit: c802b0a2ed0f67fcec8cc0cac685c8fd0dd0aa6f
[2/2] firmware: qcom_scm: Add multiple download mode support
      commit: d4d4049e411b246cdfc2df60d8d5a4474019c689

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

