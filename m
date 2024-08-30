Return-Path: <linux-arm-msm+bounces-30169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 673B2965996
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 10:11:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF372B22A91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 08:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E2D158A37;
	Fri, 30 Aug 2024 08:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OhNsIyEK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAB51509A8;
	Fri, 30 Aug 2024 08:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725005450; cv=none; b=hNOZszWxDgN48KJdw9ABkWgfH6DNuYAQn4L4cw+SBj+iifuRCMWt0nHvjheJ7gqD9Be7SOda6gOZSUQKY1x3lwhct4ZT9N9QJnm3R1K8kApjHC/EDqAgtJDMZLKf9vcbo2jylBPk5dGLKcklDfr+X+4mNq9DzySPorfSKETYjHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725005450; c=relaxed/simple;
	bh=xYuItBQNMP96MzefUyk+q8WjjT2Y1ucVlzEXtvlMHcs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jqR0G/JrN7XwOdE3wz6EbjYZ9QBpzkfNBhEommXLLMG8Eh+ykDf2MTO0ZXhrHfU2EbEIyvWrtut3qB8ukj8rb9J8k3DHI0mCHwhPvTk9Fdk9DkridfWhxShq+9PuRZrFh5aJcSjvUndyUWOg5KmDrLHBOKlelOY1GXAfccJdWYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OhNsIyEK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA72C4CEC2;
	Fri, 30 Aug 2024 08:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725005450;
	bh=xYuItBQNMP96MzefUyk+q8WjjT2Y1ucVlzEXtvlMHcs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OhNsIyEK3V2pCrW3tzn7S5hCisdmB5E7oCfj25Oo0JKAAK/Ujg7pBCHKQSugzFyQu
	 UFXzC0iB4ftTxjcrMOUucHRNlgoVhvUnxMBlfRlTJpVqbO6f3pcWSbuZYpxFd+Vv58
	 BpPAenoG07doPHMHViJIFhtwq6o09PH3ifnCqogtyn15eeDynet6mz08iSVdq9bF8u
	 IvmINMgaqU3z8r+lKg4E15douPhE9VqP3LR9fEY6GgF1RGoTLwQQEX6ficnww3IYA8
	 swmt4k0NWxFg+yOzlLsIq7D5pNZCzBsVZ38wZ3hNGjsy1G0jrHsOfgTreO5fEJ3hSg
	 hRnQD6f+DVunw==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20240826-phy-of-node-scope-v1-0-5b4d82582644@linaro.org>
References: <20240826-phy-of-node-scope-v1-0-5b4d82582644@linaro.org>
Subject: Re: [PATCH 00/11] phy: simplify with cleanup.h and few other ideas
Message-Id: <172500544630.434293.13040748970370817856.b4-ty@kernel.org>
Date: Fri, 30 Aug 2024 13:40:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 26 Aug 2024 12:07:16 +0200, Krzysztof Kozlowski wrote:
> Make code simpler with scoped/cleanup.h/dev_err_probe.
> 
> Best regards,
> Krzysztof
> 

Applied, thanks!

[01/11] phy: broadcom: bcm-cygnus-pcie: Simplify with scoped for each OF child loop
        commit: e33525de6c3c7780564e0859ea6daef27309995b
[02/11] phy: broadcom: brcm-sata: Simplify with scoped for each OF child loop
        commit: a7f1dbf479d2a3cbf2a25bd186bbe15efd17d849
[03/11] phy: cadence: sierra: Simplify with scoped for each OF child loop
        commit: 612f9fcb435fdc9abd46b6339c9000cef6d323a2
[04/11] phy: hisilicon: usb2: Simplify with scoped for each OF child loop
        commit: 93cab07a02f08e4a2837dd22280b741ba0a7a541
[05/11] phy: mediatek: tphy: Simplify with scoped for each OF child loop
        commit: d2714416770ed0cecaf69eaff34d20817f2c3bea
[06/11] phy: mediatek: xsphy: Simplify with scoped for each OF child loop
        commit: 77df35acd182a23c117a937ffd6b0830a5428649
[07/11] phy: qcom: qmp-pcie-msm8996: Simplify with scoped for each OF child loop
        commit: 608863e1e600a4d91b00dddd6ff11eda1cbebaa5
[08/11] phy: ti: am654-serdes: Use scoped device node handling to simplify error paths
        commit: 29b44a38503856952862c710d47d933c0173fd04
[09/11] phy: ti: gmii-sel: Simplify with dev_err_probe()
        commit: 27a4046255377eb0faab5c41fd271b1acab1ac41
[10/11] phy: ti: j721e-wiz: Drop OF node reference earlier for simpler code
        commit: afd7aaf3ecaf1b247db1294ef0687fb3cb530213
[11/11] phy: ti: j721e-wiz: Simplify with scoped for each OF child loop
        commit: 0d5a213c2eae880e0f7f8bc252314bae194d68d8

Best regards,
-- 
~Vinod



