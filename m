Return-Path: <linux-arm-msm+bounces-62711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E41AEABE3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 02:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EA4A1C431D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 00:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D24312DDA1;
	Fri, 27 Jun 2025 00:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sSCckswS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021E87261D;
	Fri, 27 Jun 2025 00:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750985228; cv=none; b=J8JJetyoWhngWo8Jb+veoxbh/kf2WFj0MSYztx89b8VnB9vc8rwTsg3uf8iv1HNboxwnLr6g99uD6b1ufP9umjmKIxi8QbZFAEqBcZk0WXoWPAOwt3JJCC9SBmzfOP5AsTiEJ4b5Nqsvj4raXGxmaPnpoc54OAbvoqeaK2h+5tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750985228; c=relaxed/simple;
	bh=KLVo0i7bzQjuCkB6EyoBn05Oq4kJmck/VNNy4YqEOZY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NKLnqd8YQOjz67oyPvQKyMGl1ggHSvGpJLjGf7yg+00Fp2n1LDXRcdddjSUmw7GBfYk/fkRkrgekSNUhjlobvk5D4RUsBtWc2GtGUGMAkjBP0Wa/dY96LvXkHHKc5EO+7RLq+4X4jD4q40NjE96Y8at0dImm3dikmnlHkTngObo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sSCckswS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441ADC4CEF1;
	Fri, 27 Jun 2025 00:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750985227;
	bh=KLVo0i7bzQjuCkB6EyoBn05Oq4kJmck/VNNy4YqEOZY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sSCckswSACPcKvyWCKnrG2h1+jZ67FaMJTasx6hSt5ts/L+BJx5oHj93hwJZ8ioc1
	 q3h9KH658ecGogfhe3XXRVBtKn2Y3cPDOwyEUDdJXjYu6YcuqfmadmBFYEwVqo4FTk
	 bBj0+xI3F2R6yR7xFSq5grvz2V7U5IJtHKkdQlr1A2V0z1b3mBmzvqa5OkKMS2kyCa
	 ICcrUiZ1QzYcb1RksKQ79BJqjO97w+XMY2dZHL5ogoPcZGaqTMfVa3qMVma7UvKszx
	 sRGFdQ/z4MFpYMn8PUAdMt3w6hUeZHy3hQEha5BCeJFRITaUCtDN/S+82sB6Aafnwy
	 sPpsHpoJIIKvQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com, 
 quic_nayiluri@quicinc.com, quic_ramkri@quicinc.com, 
 quic_nitegupt@quicinc.com, Mrinmay Sarkar <quic_msarkar@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250617-update_phy-v5-0-2df83ed6a373@quicinc.com>
References: <20250617-update_phy-v5-0-2df83ed6a373@quicinc.com>
Subject: Re: (subset) [PATCH v5 0/2] Update PCIe PHY settings for QCS8300
 and SA8775P
Message-Id: <175098522717.106297.12993468962065635081.b4-ty@kernel.org>
Date: Thu, 26 Jun 2025 17:47:07 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 17 Jun 2025 17:08:18 +0530, Mrinmay Sarkar wrote:
> This Series is to update PCIe PHY settings as per latest
> hardware programming guide and remove max link speed dt
> property for SA8775P PCIe EP.
> 
> 

Applied, thanks!

[1/2] phy: qcom: qmp-pcie: Update PHY settings for QCS8300 & SA8775P
      commit: 03aa45d6c62d6861dcbcff627d88814c0ddecc88

Best regards,
-- 
~Vinod



