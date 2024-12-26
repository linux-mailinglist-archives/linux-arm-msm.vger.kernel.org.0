Return-Path: <linux-arm-msm+bounces-43442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B559FCEC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 23:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF6FC3A03B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 22:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7BE41DC759;
	Thu, 26 Dec 2024 22:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GzfqtkTV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B952F1DC1B7;
	Thu, 26 Dec 2024 22:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735252762; cv=none; b=h9tztTKdam3W/KrpY9i+DqACbpoRGrTDPTVXBZokyNhelA8Se03vgyv2O8JiR27SedGXDkItklHR7rMRlOX6FpbZqM/Fgbn+jnthmlkG4YSDhMWedwz31tLlybudwPvYTLCYnYHo/Ps9FgxxAovZ+PxsEfG4nnXwPEN82ZP6fFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735252762; c=relaxed/simple;
	bh=2fs3IHArnZE//kBX++W83TQclZJQMx321vjsZipm7ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B55oNvNs/2BYJfQDiK7Rc9qZqYKIzCwCZ6+gGtbZoe6OKrwUIQVvj+CTplTGqO2HEJlBshThpvTm876ySd6+PhY5hMl0Hx4aPPvdmC/zU/1+CDsFpTvuNc/+eZi4iaxIiIkenXHyrEWVba0m5dD6ZxerhVbwAXM7HSfsDCb33Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GzfqtkTV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1BDCC4CED6;
	Thu, 26 Dec 2024 22:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735252761;
	bh=2fs3IHArnZE//kBX++W83TQclZJQMx321vjsZipm7ds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GzfqtkTVkxC5A3oSIuut2sM5ve81oEKmqeatU+/bkXwRVeJ51k4gUfMlcsO2yAs17
	 GViyha2GudMAsGH6vDrvfqCV57YQmAPkPHwUxNeuS0rgA4x0ctrk5YGapyPXEYPPmT
	 Xdj6Z5Mz6GnVBTsHQzxuzy6pBRpXgWOx6oiv9lupcyt6QWlbpSyhNRI4HH/f9DJ1BG
	 qqijhQ6yxsk2yuY7wMYkKh+NU3VK36N0MnQIzAsytUGobjs94ESXXFO00spc5Jxe8n
	 kQfNjj2Mvxi1BlAYKdtlG1WilYLWq0JxtGnUjOxzzKjsjgsK+rvGF0MonschfGV+BU
	 eWhEp0RBILj2A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jie Gan <quic_jiegan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs8300: Add coresight nodes
Date: Thu, 26 Dec 2024 16:38:46 -0600
Message-ID: <173525273241.1449028.17508671752389589900.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241219024208.3462358-1-quic_jiegan@quicinc.com>
References: <20241219024208.3462358-1-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 19 Dec 2024 10:42:08 +0800, Jie Gan wrote:
> Add following coresight components for QCS8300 platform.
> It includes CTI, dummy sink, dynamic Funnel, Replicator, STM,
> TPDM, TPDA and TMC ETF.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcs8300: Add coresight nodes
      commit: 0f43254763b3a1635866d06593858ff86313b9ae

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

