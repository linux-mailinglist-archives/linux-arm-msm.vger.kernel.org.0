Return-Path: <linux-arm-msm+bounces-61523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48373ADC1B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 07:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09A05176F50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 05:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605BE275B08;
	Tue, 17 Jun 2025 05:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pm6U2tZW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AC7274FD8;
	Tue, 17 Jun 2025 05:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750138223; cv=none; b=r2ry8ez0ZEikJHrlx1g3Je8SlqPZW8DiUtNavpsVUQYrvqMt2AEuqcxH5bhTnUMOLOgs+17RKTFnwx46bE/YAzRCesxD0zIheKe2/RYxYKRZaXgHlNrf4JR3gKGWOFBKIubBIUeZX92DjyiGSHFgKqIuLg/sVaaJOr6b3bcEUBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750138223; c=relaxed/simple;
	bh=l1Zwn6tKLlJL2jM6y69JEiT1LBIYqM+m+LRPXdZTy9s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JfMi4eK4K6hwMI4QCBBMeKFw+0Jadi44mc1ADf9joF+K94piFv2FRuy5V632jHfgm+uTaKwyohSVGzlZ7YehULTOTwXMeHkEBl3EqEHHY3xv9gtFdyOdJUtDVd8cB7O+tVLirSG6GhobrAr7c1sZzb5E1DCxUK+cz6gsRGQu9m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pm6U2tZW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5BCC4CEE3;
	Tue, 17 Jun 2025 05:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750138222;
	bh=l1Zwn6tKLlJL2jM6y69JEiT1LBIYqM+m+LRPXdZTy9s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pm6U2tZWY/kN+3S7a/0rEW6ke2LPrUrPvw/igHZhA0dnQQG8Dx3yqv5D+Aig2z0kd
	 j6kTGol3Qs7Q0eDnymsw7ucwEYG/w5F/hLzgR8UnfaylZmlXwDQA3SmW1o7g7s/tnp
	 beGplg3qwqEmojrdauilv9LH7EXM4xoRus4+2OJMOVICO4PWniBb3yPTiazVbNMROx
	 l1CzbbyEM3Y6JKiN0W5Bu4Bok8k+11Lh6cZqqdTitZIxaIFVjTIDbNeauroZIq+7Dq
	 gtczAqHCuZRmC2M+/Q+m84ruz7yqAg3ue0Oy1wxBQwxH3IH4wMmc3lXiudkABGSaPK
	 w61HAQjRytLow==
From: Vinod Koul <vkoul@kernel.org>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, 
 Melody Olvera <melody.olvera@oss.qualcomm.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-phy@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20250617034249.2067135-1-rdunlap@infradead.org>
References: <20250617034249.2067135-1-rdunlap@infradead.org>
Subject: Re: [PATCH] phy: qcom: add linux/bitfield.h header to fix a build
 error
Message-Id: <175013822022.98716.16014349305503113127.b4-ty@kernel.org>
Date: Tue, 17 Jun 2025 11:00:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 16 Jun 2025 20:42:49 -0700, Randy Dunlap wrote:
> Add the <linux/bitfield.h> header to prevent a build error:
> 
> drivers/phy/qualcomm/phy-qcom-m31-eusb2.c: In function 'm31eusb2_phy_init':
> drivers/phy/qualcomm/phy-qcom-m31-eusb2.c:210:37: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
>   210 |                                     FIELD_PREP(FSEL, data->fsel));
> 
> 
> [...]

Applied, thanks!

[1/1] phy: qcom: add linux/bitfield.h header to fix a build error
      commit: f0185cd5942569ea9872bf85dce621d0a7fa401e

Best regards,
-- 
~Vinod



