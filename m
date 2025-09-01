Return-Path: <linux-arm-msm+bounces-71428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A3CB3ED0F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B535D3A96AE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 17:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57AD324B04;
	Mon,  1 Sep 2025 17:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ks9JmaEi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977B6320A34;
	Mon,  1 Sep 2025 17:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756746488; cv=none; b=IOpI2b+uLe8/ak3GpDh6ZSenmXgByXQ4xJ+cCcVechTU3P27PMh/8CcL/BYA6vXA29lCEXU/gTcTZ/t/SJtX7hcD2hxVI9zZAYeEMNYe4/6euZ4TaVaoS6Y53w31Ojd7wJsdqY4LAJMn+Ppeu+/5oF2oAJitFW6NYq3XnvQqrZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756746488; c=relaxed/simple;
	bh=2yYH/cfpjLpeERChnwoG49UtSP4qJklF2fBBnkxU32o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cTbw4/KhwTFqd0pXdqRC4MN+r4j5tG/CbAAeyBMgPTFb2pj1m6JtoRvkge64l4hYIDIPglpR40Sst0PmHOYeDqkbjAKYW/q5M8qUBsDL3z03BrnLZy+jtmzHgd2v0bAr7MI67Anz6FYO/yR40K13EAj621fc6b3cP3n5Z6tMMHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ks9JmaEi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32E0C4CEF0;
	Mon,  1 Sep 2025 17:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756746488;
	bh=2yYH/cfpjLpeERChnwoG49UtSP4qJklF2fBBnkxU32o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ks9JmaEiZVOQXMVVTh13IA7jdlAJvQsTf23dO1/iOd8AqXykPBr/Yb8Wnu/HgkJXY
	 aZfhz1qk+auJTxe0YNzGAHFPKta5Fc1ouhqd7u22iFqukxMUX3xZl2RKWq4k2GRc/w
	 yBuJoXUGnsdCyk4tLuNQh3xZMLK2obL0lvQGShYUsEHWbCZjLKYbD+br/MJ8wgSw0I
	 sUKK2uqE/1RmP0GQ8U2ZPQMailYEB8Wueqgung7Vsb2t2nGHEvuUbYk8PFpc6RZTIi
	 w2drlZZrv0aIo9B7XAL0mYgR6QIPswTiEhrmN5LPkWbThaojZw36tsIpIBm5lFJlz/
	 OntQImmwu5Szg==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, mani@kernel.org, neil.armstrong@linaro.org, 
 dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org, 
 konradybcio@kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250830070353.2694-1-nitin.rawat@oss.qualcomm.com>
References: <20250830070353.2694-1-nitin.rawat@oss.qualcomm.com>
Subject: Re: [PATCH V4 0/2] Add regulator load support for QMP UFS PHY
Message-Id: <175674648426.186496.9175302825889906237.b4-ty@kernel.org>
Date: Mon, 01 Sep 2025 22:38:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sat, 30 Aug 2025 12:33:51 +0530, Nitin Rawat wrote:
> The series improves regulator handling in the QMP UFS PHY driver and
> adds load configuration support for all supported platforms.
> 
> On some SoCs, regulators are shared between the UFS PHY and other IP
> blocks. To maintain stability and power efficiency, the regulator
> framework needs to know the UFS PHY's peak load, as it determines the
> regulator's operating mode.
> 
> [...]

Applied, thanks!

[1/2] phy: qcom-qmp-ufs: Add regulator load voting for UFS QMP PHY
      commit: 0c4916aadb8df892399eec99f775655c31049195
[2/2] phy: qcom-qmp-ufs: Add PHY and PLL regulator load
      commit: df4beac9da5f162770c8563d11cda327d748c20b

Best regards,
-- 
~Vinod



