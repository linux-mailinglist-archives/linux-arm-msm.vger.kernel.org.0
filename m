Return-Path: <linux-arm-msm+bounces-66092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97352B0DB0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 15:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78B281C8117C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 13:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7398E2EACEB;
	Tue, 22 Jul 2025 13:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HNnBnAt/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2582EA14D;
	Tue, 22 Jul 2025 13:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753191472; cv=none; b=sZyzT6X8IaL+Pbvj0RYjsBNqfnNn4tk7bwHR/z46Ybu859qYGj/d9XXcqmKOkApOKWKhHiThFDhKHknqSeYi34T/T8E4Hp5S3Zfk/EeziUnxtV4dj3LWRm7iO3CEKs+YAeyrHsoiwbU0CUkmNHuAxQbtQxBvh/19F/NNF3iQRM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753191472; c=relaxed/simple;
	bh=NjAE4n+e6SZHziIRn2JtRoddQFIce9KdubkyfGd8BLA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dWCJoRdSLuU48Nr154lXkiAIiKFzHLaqv94F4PzxkKIrnVrg0FYU5QHTE8f/voLd3lx3lYOdHky6Gy/yEs4RdEhvTvWCpSRBw4JwOyM8HsUlP10rCeKLYpLgkYHdj8CXzXCulCxCO3MAadKQXo8Ycf8P3P7/nBtPVWj1F2kIPUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HNnBnAt/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5714C4CEF9;
	Tue, 22 Jul 2025 13:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753191471;
	bh=NjAE4n+e6SZHziIRn2JtRoddQFIce9KdubkyfGd8BLA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HNnBnAt/iknYpQ+K7HFfXvy/EjZGWLywfFvn0G9IeFoTwkD1PCnYJH9gl9AKHOfmz
	 xLVXX/qSoKB8gyc/6CRYYiglIz1gUpuBrVoQPX9jc0hy5q6Fn9Lwkd1C4SY9qEbWsL
	 A23suMVMrxZ/p4l8YeZMdGibO1HS4EMh67vZfeAzRv15/g8WvER6ieiXv7McuwudKd
	 sUekcBOfbG1hXLTTAlqMO6FIfaYeSMrJtFDsUqm3RHaVyATlYTqbB+iVPyONq543iH
	 q0b5eyOv3h9nxbkJZBxySg7LeE7Ne7rBYlXCkpzrTXHaX8J0kcEXvfGaRBmrwFb64I
	 zyUQTjydvO3BA==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@kernel.org
In-Reply-To: <20250630-ipq5332_hsphy_complaince-v2-1-63621439ebdb@oss.qualcomm.com>
References: <20250630-ipq5332_hsphy_complaince-v2-1-63621439ebdb@oss.qualcomm.com>
Subject: Re: [PATCH v2] phy: qcom: phy-qcom-m31: Update IPQ5332 M31 USB phy
 initialization sequence
Message-Id: <175319146929.114152.10973803473678608653.b4-ty@kernel.org>
Date: Tue, 22 Jul 2025 19:07:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 30 Jun 2025 13:48:13 +0530, Kathiravan Thirumoorthy wrote:
> The current configuration used for the IPQ5332 M31 USB PHY fails the
> Near End High Speed Signal Quality compliance test. To resolve this,
> update the initialization sequence as specified in the Hardware Design
> Document.
> 
> 

Applied, thanks!

[1/1] phy: qcom: phy-qcom-m31: Update IPQ5332 M31 USB phy initialization sequence
      commit: 4a3556b81b99f0c8c0358f7cc6801a62b4538fe2

Best regards,
-- 
~Vinod



