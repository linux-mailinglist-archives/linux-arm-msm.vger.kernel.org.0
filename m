Return-Path: <linux-arm-msm+bounces-28696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 858EF953BEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06CF8B22D07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25DCD16B72D;
	Thu, 15 Aug 2024 20:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="txE2Lfz1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F070416B3AC;
	Thu, 15 Aug 2024 20:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754490; cv=none; b=bAVAh1uxxWJKN+OFUCDhymyuLe/8uV2Wrjx9NCbtkggfgr12ZSGc7uTvS6sNYdYuJ75Hv/WmcSWn1S8Lp97PoRRt/PsLB9RYNATnDgC794q1lCwuPeAB5i77w2KsXneIWz7Qo6fI0MSoPDmZ79guZbfDCWtOQTir7uTQRbjd1Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754490; c=relaxed/simple;
	bh=lD2ggEroBKMUI+iJngI/hHQMD0oMC2XzD9ih1gbjx98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dJgdsXoxa5pBlticY//10gVuVDOcJrMqQS8JBl8LA1+rR2VugZQ9UIU8Hw/N4EOqdUUTvnCMN6Eigk2lac9IiD9Zo4esrwBXGXuxu6I40dmENupPJ/cRS1VCdYdvfwgsIN5o63YRl2Nr2Egm7tVaZVn/lAfLegQCmXuhUh6S8nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=txE2Lfz1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 922BCC4AF0F;
	Thu, 15 Aug 2024 20:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754489;
	bh=lD2ggEroBKMUI+iJngI/hHQMD0oMC2XzD9ih1gbjx98=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=txE2Lfz1VgK255gkeEX3CT8Bh7RsiiA5n6hRasSb5nkcP6yWKiIiVxFatUHZL1mS5
	 eZWqZ+kMhkJwv/tldZaa31OMwdzX8aFTNB4UQJbc6nGs1lGWcIuXDmzfIECmC8fEaz
	 /JGpNanI60W96evOmE3yPiwrl3J9qdAxJgS/1inbOZ+A9U+l7rvBKctI0aKC73iDti
	 kVesaW6xQZpvskxRDfvQvT0m59MZxEBKx4OCZFvg81keuCiy37AZJjSAk9d/DKuycS
	 mI7xMEglprx9AnywFsrAPDM2hVxIED3Ho4npIRHeCwQJ0gpsrrzJntYrFFAQwJxCHN
	 4DUZXEgAo4Jeg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] clk: qcom: Fix SM_CAMCC_8150 dependencies
Date: Thu, 15 Aug 2024 15:40:42 -0500
Message-ID: <172375444834.1011236.2917691065241306486.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240813085846.941855-1-quic_skakitap@quicinc.com>
References: <20240813085846.941855-1-quic_skakitap@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 13 Aug 2024 14:28:46 +0530, Satya Priya Kakitapalli wrote:
> SM_CAMCC_8150 depends on SM_GCC_8150, which inturn depends on ARM64.
> Hence add the dependency to avoid below kernel-bot warning.
> 
> WARNING: unmet direct dependencies detected for SM_GCC_8150
> Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
> Selected by [y]:
> - SM_CAMCC_8150 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: Fix SM_CAMCC_8150 dependencies
      commit: 82ceaf6bcd7c7d01049c13f2461cc7830af41d53

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

