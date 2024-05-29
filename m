Return-Path: <linux-arm-msm+bounces-20977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 112598D3C2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 18:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 275A51C21978
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 16:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47560184119;
	Wed, 29 May 2024 16:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/rOC/Db"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B331836F7;
	Wed, 29 May 2024 16:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716999825; cv=none; b=GZT8mKpqr51+8jY/cZRbUn5gkJJGUwWeJNQ9GizxyjROqu6dKQWpj37UU7pmpxDhp22l91TX1Pwk06H3jzOkG0NhbycoReyXekNLPMl9k1y02gPPcbfec8wx0mV4YexZP7IBa0S04UuBEiPdWeI6kxCrrALHtpvR1BGHIKx6oyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716999825; c=relaxed/simple;
	bh=9N0hJNQXkuQNNa9oA3jB7vdm0xPtdI4OUpNr2YsrghM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lm4qA0d/KZ1RFWXvk+Ni16hB/aAiW3EjuRaVH7AlnObso0E1MifSkp6pYF2+9vrEhlwar6peo8DhdLM8jEkivMcJMLjniiH2kD/QTP0SgeTMm2pOUisAMKN+y8EfTzNMQwKNJZzNmBnk4bUsmjAVF3z15BHAKN2/DTGBHcdQjdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/rOC/Db; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D304BC113CC;
	Wed, 29 May 2024 16:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716999824;
	bh=9N0hJNQXkuQNNa9oA3jB7vdm0xPtdI4OUpNr2YsrghM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A/rOC/Db5W8vhmp9QsdkAryq/olA0nGyKjOjLYVjPWEsS5ZuaaYu5dJIFtgtJvbE/
	 35qEsFdyZxGkGHJ+FOeCygLb2dqsGJNuNMbE6b8UvjlX+Cy/O9ztEvAoEBbTLUQX6z
	 nbt9Cy1v3f8rsME+0NY7grhLuJ9Gxeqk8aKz80kqW/UCGLq1iUV/DPpwC1ti8lJ4wH
	 7iL+Gvsa7AqPvuOtri0HU/Nwdr7Yg3mZs69+8vDghbsxqBnrjwjD1SYwkNU33I+6xz
	 o6zrOoNVM7FCaAwXhlb3YwxF15ViU35rHkWac3RwswwNexbcG9/RvtQoO3BL3SMedp
	 xm0fwdOGm53xQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] X1E PMICs
Date: Wed, 29 May 2024 11:23:42 -0500
Message-ID: <171699981917.603724.8196085781158706393.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240529-topic-x1e_pmic-v1-0-9de0506179eb@linaro.org>
References: <20240529-topic-x1e_pmic-v1-0-9de0506179eb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 29 May 2024 13:17:16 +0200, Konrad Dybcio wrote:
> These were overlooked during the first submission, plug that hole..
> 
> Depends on:
> * https://lore.kernel.org/linux-arm-msm/20240525-topic-pmc8380_gpio-v2-0-2de50cb28ac1@linaro.org/ merged into next)
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: x1e80100-pmics: Add the missing PMICs
      commit: 2559e61e7ef4efe546f081d8bee917e410e8e6a9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

