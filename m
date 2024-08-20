Return-Path: <linux-arm-msm+bounces-29158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 772F5959049
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 00:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D0C91F2268C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 22:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66CD81C7B72;
	Tue, 20 Aug 2024 22:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+d3m5/U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4071D1C7B67
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2024 22:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724191934; cv=none; b=KmkGFjHVrgFD6bUESKcne0e68zyRNlUiWUMrCqXv6BNkUVk8gHYZp0Gasxr2T8wXPYmqMi4jSfjVdcAQTmHc+sk4T2TTQBMPbV4FP/8p/OffyFfvfxeMuEtq7y5GGfz/X8k0+gdRCVHx9e4DQQuFNt1Hb1GeE6JbXSKCIEbpZ5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724191934; c=relaxed/simple;
	bh=NMMlX9UPU+HvHD6gxixV63KPHDNT92sVJAVyjoPSAOQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o0u5ovVx9U/rCAoWUsdNi8vIMSU2TJCV+0UeyiFkdtZrDAdye684VgonYcdouRDQNRqCKBCS7y3Yxa9A3qaelrddIiPtXJeogUsTtWIh3fpxDSSMDuPNsASOq0NKE404b1WpfYtPVFTaikwJby/tX59TXibQ6IaLkYPG5vj+RZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r+d3m5/U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90CA2C4AF13;
	Tue, 20 Aug 2024 22:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724191933;
	bh=NMMlX9UPU+HvHD6gxixV63KPHDNT92sVJAVyjoPSAOQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=r+d3m5/UH6EClXxT4LtAzmKwC7Lo06MAskZIzBj+5wFnvEM05uRPeZGVWu5TxpNnm
	 EwBLSV+ZE1jmK1p4omCPWMYBRRh9oH4Zc1UN2u9g57RnFoERlNu9d7Vyaie8RrN0sD
	 5xTgRBB5rmlNbGB2Lj7A9yLl76sVMMFmnUiwj9Ens4CPelKBoAiZBHsAUxWtcho8a3
	 T1WVx5NYQmCNCd2mfrTS9s27sJ8WML1S0IwNCCB0huW9lwhKyuYUWNnhrvsI41PgsS
	 zCve/z6WvuaDUmxUy219dJZpAStQh0GUbg1owLgUA4qAPQfiBBEQxChZxYwZqRtWyT
	 225VKPJD8RIWw==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v3 0/3] soc: qcom: pmic_glink: v6.11-rc bug fixes
Date: Tue, 20 Aug 2024 17:12:08 -0500
Message-ID: <172419187798.1319438.5085340716089567921.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240820-pmic-glink-v6-11-races-v3-0-eec53c750a04@quicinc.com>
References: <20240820-pmic-glink-v6-11-races-v3-0-eec53c750a04@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 20 Aug 2024 13:29:29 -0700, Bjorn Andersson wrote:
> Amit and Johan both reported a NULL pointer dereference in the
> pmic_glink client code during initialization, and Stephen Boyd pointed
> out the problem (race condition).
> 
> While investigating, and writing the fix, I noticed that
> ucsi_unregister() is called in atomic context but tries to sleep, and I
> also noticed that the condition for when to inform the pmic_glink client
> drivers when the remote has gone down is just wrong.
> 
> [...]

Applied, thanks!

[1/3] soc: qcom: pmic_glink: Fix race during initialization
      commit: e4bff3088afc459687ed90c6584c443bcb5fba90
[2/3] usb: typec: ucsi: Move unregister out of atomic section
      commit: 15f19bc3de2ab0a5ece2e6aa34f626b38e9317cc
[3/3] soc: qcom: pmic_glink: Actually communicate when remote goes down
      commit: 8d856ad26551f9a9f428a73bf422e81c98e774ae

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

