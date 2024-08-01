Return-Path: <linux-arm-msm+bounces-27668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5CB9444F4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 08:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB8AE1F26C4A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 06:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6289B16FF26;
	Thu,  1 Aug 2024 06:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d2d6q4kM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1B2166313;
	Thu,  1 Aug 2024 06:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722495323; cv=none; b=SY3r3SLXijcYeTZ24TA5DCTO36RIAiSkYgGwcQlrOdz3kN9xNk5wuPgRLSjC4ADTxgJE6jY2AFdJIoN80ILqNTV586FYBNwcWc02Y+NoVvvDPj73foaGNBzdqhRkA1ZiRMiRTkm2WXk9PjPTt9BHmRiNEyGBPpR6l9YYPgy9+ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722495323; c=relaxed/simple;
	bh=OudlCk6ZCHSbP8VDOgLZcY6M2eIeDTLJfMtcwrWBJ5Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E+u1ZrA0MPmXk5knbm7TeYMifRThMJR67r75BPPhvNndA1ormcxE48TjYpLqQHP/pynamV+xBRA+HZoJt/HAH5g/NFrg3XxTZVCStUlGOunouIuzlltwPbL3/u1Jnre/dIsmBWqHdj/oGeX90852piDkxy+JPZMGRWD3B9HViOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d2d6q4kM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE8E0C4AF09;
	Thu,  1 Aug 2024 06:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722495322;
	bh=OudlCk6ZCHSbP8VDOgLZcY6M2eIeDTLJfMtcwrWBJ5Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=d2d6q4kMLEJ1TUmfGxRj4r1ltVks3/KQsw39C2US6QNaXxSn4T5JrD8sWOXZw0nHn
	 Y0XVA+he4bJcYpWJ23QURc/wamYsIcmsntJdP7f6efQ7ah0AxWAMyZrjkTKETEK+vK
	 G6pIrTY0GtDp7pDgUigR8GK5h3xvHfF9rnoXtp8e/jDmyHvYSC/eYSlrUpBHHxCpUY
	 76wPMhAl1w4jxhvApoBpdGgNO3dW63HFm40FQlhaNmsK9emO/nSafFUkIe1usbP078
	 W/nrk1/KnSanbFB4R4C8EKWUQv2IH6nBzhaI4M2ott5L3K/14FcuisOlz/W538re8N
	 RL8fdu555AV4w==
From: Vinod Koul <vkoul@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: kishon@kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dmitry.baryshkov@linaro.org
In-Reply-To: <20240731152548.102987-1-manivannan.sadhasivam@linaro.org>
References: <20240731152548.102987-1-manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3] phy: qcom: qmp: Add debug prints for register
 writes
Message-Id: <172249532035.256913.2685367794999812971.b4-ty@kernel.org>
Date: Thu, 01 Aug 2024 12:25:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 31 Jul 2024 20:55:48 +0530, Manivannan Sadhasivam wrote:
> These register prints are useful to validate the init sequence against the
> Qcom internal documentation and also to share with the Qcom hw engineers to
> debug issues related to PHY.
> 
> Sample debug prints:
> 
> qcom-qmp-pcie-phy 1c0e000.phy: Writing Reg: QSERDES_V5_COM_SYSCLK_EN_SEL Offset: 0x0094 Val: 0xd9
> qcom-qmp-pcie-phy 1c0e000.phy: Writing Reg: QSERDES_V5_COM_HSCLK_SEL Offset: 0x0158 Val: 0x11
> 
> [...]

Applied, thanks!

[1/1] phy: qcom: qmp: Add debug prints for register writes
      commit: 4e92d504475ea5841716ad775f412342520a3d26

Best regards,
-- 
Vinod Koul <vkoul@kernel.org>


