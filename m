Return-Path: <linux-arm-msm+bounces-28674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAF3953B98
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:41:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE1F21F25601
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68871509B3;
	Thu, 15 Aug 2024 20:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7tbsdYD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB5814F9EB;
	Thu, 15 Aug 2024 20:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754460; cv=none; b=lHnWi6dH8+JWAVXXHuXfpWzmeFfHo2iZSUBii3YMe/zi2noy5EQBVrNaEz8C2rgcIiwCWXRegjOu2Mbs9AQZhcnnnKkdoBuKDqnMx6CmrlvbXooCiaoRiDLZupb09TnMbUNSeUi2OmKYcrple8LLXLlx6l3rzs/5q19pwY0a4c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754460; c=relaxed/simple;
	bh=GewyCBGEXW1cdKt5N5+wiW/5d9f9OmiiAC8uFF1eC2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dI0uC/q3kg5/JqtO8XvJ42ZwbXJxBseIV/DlELOYuH/2dCqLXy06bHtnCVxyb6ThBR5fQ38RaNDnggZqQWsvrBWm4W+dO6hkr2da0ao2EabQIjG8zzBd9aMxLg5bsxUd9mH/BavatboS8hdqUI4ZVdgK4a/btjJGyL14l0wOmhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7tbsdYD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7608CC4AF09;
	Thu, 15 Aug 2024 20:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754460;
	bh=GewyCBGEXW1cdKt5N5+wiW/5d9f9OmiiAC8uFF1eC2s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k7tbsdYDyihVK44EYKxgIcnsNAXIa5iZE6M2QPG1fcl+SfjxAhjIsRxrgOZyZL7h5
	 q3qZWU8IvRlW2QV9VIFlXIrSWftWluRethZ3UuiLlzIJjnTB3gStCQTfQim3Ax7JQm
	 bf4CwZjW9MtGxS6G+zKDXfhZvq9fHCnh39waBn1iFolfdRqv0htHDpTovhnyWjSWt0
	 XpTKoMDvi1GFGJ0zGrb6QYxZLup78MIZoCva9Cee8+XnWgCRiW+fXd4Yrw1WP3gAKC
	 PtwdwYGRM0o2Gm9iV5YxJIahS9LtNd9epIMLCcsl7FwZs6I9qB0E3d44PQyBEHLGU5
	 FnEkQm+WQuBIA==
From: Bjorn Andersson <andersson@kernel.org>
To: Elliot Berman <quic_eberman@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Amirreza Zarrabi <quic_azarrabi@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>
Subject: Re: [PATCH v2 0/2] firmware: qcom: fix an efivars regression in qseecom
Date: Thu, 15 Aug 2024 15:40:20 -0500
Message-ID: <172375444819.1011236.16107983269982714423.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731-tzmem-efivars-fix-v2-0-f0e84071ec07@linaro.org>
References: <20240731-tzmem-efivars-fix-v2-0-f0e84071ec07@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 31 Jul 2024 09:44:55 +0200, Bartosz Golaszewski wrote:
> The first patch address the regression with efivars using the qseecom
> driver reported by Johan Hovold. The second patch removed dead code that
> was left over during the conversion of the qseecom driver to using
> tzmeme.
> 
> 

Applied, thanks!

[1/2] firmware: qcom: tzmem: fix virtual-to-physical address conversion
      commit: 1c753d001a259d0278fe318a1ed3c8aa5f3ea09e
[2/2] firmware: qcom: qseecom: remove unused functions
      commit: 924fc22c282edbf93869b150d9e1b47e0b10485e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

