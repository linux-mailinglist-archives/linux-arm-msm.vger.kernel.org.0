Return-Path: <linux-arm-msm+bounces-16419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B22AF899009
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 23:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 450922897DF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 21:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702F913B79F;
	Thu,  4 Apr 2024 21:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VP7wkD0C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F30612DD9B;
	Thu,  4 Apr 2024 21:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712265796; cv=none; b=ai37iDIgeydlWLKrDQ4Soup8sNPDKfN6kvBijfRHA4lIq/ikI1dYnwBDtB3I9UiB/D5GEPRObNY07jkV9Iumj65cYCHjm1qnAlph5brzHBkHFIWxOXmiw7FoG5T1HbaXnTtVYrcp8j5yBfKkN0pcFnnqGg9gDQSZ+GuM5yjPjVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712265796; c=relaxed/simple;
	bh=3TVcBr0w/hux0AWphLCDJyUovSkE9ClzpHoAsEMWFPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JstqXy1JO5WibDG8FdKw/M93q4u/3oIseLKibXUdcbndtf+uNJ7QlTidHq/Z8f70vuFH+9rK9GtSTjGnE20727PiKFTYYj0HkPqPPb8bVnf/nJq13uE0Tr3AM6x+UjAl9BMjM/qGzj6KNl8oLuS6+7jio0NnUYG4iXpjbi99B4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VP7wkD0C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C45F1C433F1;
	Thu,  4 Apr 2024 21:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712265795;
	bh=3TVcBr0w/hux0AWphLCDJyUovSkE9ClzpHoAsEMWFPk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VP7wkD0CIk1Xq+wJ9acs/zTbnufV6xQ/JUIRd4/GaQGZ/DRSMzg39LpHvTSX4lfKH
	 iTHoGScXnOhQ388/uEgFOsDuNG6UL7lQaRZ2f7J/nkuGJX2RBT65mamPcy2WwQO53F
	 Y5zNfnC/koZeMMfOSyVBtc+7MYH5jQslQCIZgRN+jiVr2p0gUoVLVmF4hfjDz2H455
	 IiNe8FQ6Q8odocAeoFGKOc/32d9bvf3jdrDnhXgXZ1IL63rKG2mTsl+cLJsIhdGc/A
	 b+jcGTOxDZPOa+wtiY/JbDsZDeLLx7LKkt7lFV6I8M93pGhGDu+EpiBb85j7iMLmHr
	 1ofwUUfhVwkVg==
From: Bjorn Andersson <andersson@kernel.org>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 1/1] clk: qcom: smd-rpm: Restore msm8976 num_clk
Date: Thu,  4 Apr 2024 16:22:46 -0500
Message-ID: <171226578691.615813.15073915135961701115.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240401171641.8979-1-a39.skl@gmail.com>
References: <20240401171641.8979-1-a39.skl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 01 Apr 2024 19:16:39 +0200, Adam Skladowski wrote:
> During rework somehow msm8976 num_clk got removed, restore it.
> 
> 

Applied, thanks!

[1/1] clk: qcom: smd-rpm: Restore msm8976 num_clk
      commit: 0d4ce2458cd7d1d66a5ee2f3c036592fb663d5bc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

