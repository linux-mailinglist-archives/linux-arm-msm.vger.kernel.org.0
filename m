Return-Path: <linux-arm-msm+bounces-57504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D79FBAB1FD2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 May 2025 00:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C48F17CB9A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 22:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DC7264627;
	Fri,  9 May 2025 22:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UjFO5gYF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787A52620F5;
	Fri,  9 May 2025 22:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746828820; cv=none; b=QT8Rmn2s35H6AcbBYTMiVJsxzwZcUr6qgDjHnN+k+52tb94nfU3nW04zdmha69wq+4w3uZi8uE3wis9jqJ/pXNr8SNEM0oIjqnLCXjirVb3RBQ4MihCXQQSHv7vMlTcC35wE84EFGpT80zKoCyUkoERGB5589/YmjYIMWcx4dBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746828820; c=relaxed/simple;
	bh=BCSnvMNdWN0qTz9qd8ftNt9eQ+LA2F+bhQ1AJ35LPP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nUS6nWPTbnnjHiFT+VCaynXXLRtZ97pIDp67IocwceW2ODLlvjXGFaaF8ZxutXul5c+m7UoUfHVtaQ5glIEvZHAPeytX7Crp0V9YP5cNwQp2trfjJ/yrGanusMDVrblFP5sPO7/R0KAS/hKnyryxhbxFtIuL2KuRyKNFoB4ucU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UjFO5gYF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6B5C4CEEB;
	Fri,  9 May 2025 22:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746828820;
	bh=BCSnvMNdWN0qTz9qd8ftNt9eQ+LA2F+bhQ1AJ35LPP0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UjFO5gYFaaqSh4RgyHeKJPuLV5k3sR1ZOmMoCGVIZqjELMBcRDeEawhtdiC4Bwfjc
	 TKjm8eU8yEUuZ7a9kyaB/FACcCLCBCXeKAjKZPBwv36mVdaSv3FsYO2Crtd51C6l5x
	 5vpuqMfs/TWrhBBkbXkBy6tUJ27nWvt/wKpiXtgKOEy/p073ZiE2uLC24Fxg0JK3JS
	 6RNbcD+cISz6BWf4ofZsca4ogjHMqxOt/ZkUwJwyE97SZ7aFtWZJwU03dxIR8xQCJg
	 7rdx4RJNo1jVtvZbnQ4xviAW1Iafw0+KRwUcF++Y2MdN/beOi9VTkSWHBCy8Tl/iqa
	 0dgDd0lQRUb/w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Cc: Jingyi Wang <quic_jingyw@quicinc.com>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Aiqun Yu <quic_aiquny@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@oss.qualcomm.com
Subject: Re: [PATCH] soc: qcom: smem: Update max processor count
Date: Fri,  9 May 2025 17:13:27 -0500
Message-ID: <174682880487.49052.11647797464110622684.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424-smem_count-v1-1-931cf68f71a8@oss.qualcomm.com>
References: <20250424-smem_count-v1-1-931cf68f71a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 24 Apr 2025 16:45:41 -0700, Unnathi Chalicheemala wrote:
> Update max processor count to reflect the number of co-processors on
> upcoming SoC.
> 
> 

Applied, thanks!

[1/1] soc: qcom: smem: Update max processor count
      commit: acda397ad573109bad217182b7bb677696dcde1a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

