Return-Path: <linux-arm-msm+bounces-35326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BF51A9A9875
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 07:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 696DAB2265B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 05:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6DE13A87E;
	Tue, 22 Oct 2024 05:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NiYOgB0S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4A0139566;
	Tue, 22 Oct 2024 05:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729575137; cv=none; b=bSNIaEBwyG2vcwDjgvcdO77tg7JVQrNMv3z57g1BKdENSoX82QSYEjR9hb2Ga7mBb6KsKursBzbk4IKVmSKGE9LwvHzkO72DOzjA9giYdhWQc+4/jXxXuZJBqUHah41Ze6t2od06tWf8L1PrI+lXUwMNd5ldDu43bEcRutVC5bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729575137; c=relaxed/simple;
	bh=6pdKu0R5DU7xBdvkPQVF4MFji5daPjJvJvF/nx/iZTY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hplHhDUCqeiW0FJFx+loW4TRmfT1fw942I0yhudTXqFLGJw8qteNc8eO3Enw8Y5Kypv+nhfnM6EvKYgevnu6qVf8UlcICu7O73KAAyZxRWPHTwFNEa+3JdFEgPospB3wL7kYWOVIxXt+qw1dbKhqQ9ulIaAb/VLQWDwR3E1keE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NiYOgB0S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5349BC4CEC3;
	Tue, 22 Oct 2024 05:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729575137;
	bh=6pdKu0R5DU7xBdvkPQVF4MFji5daPjJvJvF/nx/iZTY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NiYOgB0S6LWSVWNJ+V+KTNcDrBBERN9FT0kGFNfJAn9n5bPDPjwNH9s/qP8llu8bb
	 iq5+Nx02AMz3XJrpoBXPtIxv005cPhPDX4Ita0Jkb/Cxfsqhyryav/z28AacscyShp
	 bf95t3je7apJtC6o6M7srSQFyfOSpckWlFYJ2LewUc1dB6l3jd+X1KoC5gP6RwUDzC
	 LirbcFd3b/zR9sLYDNzEDCyKKGhHSSl67+HyY7E5D3nf0JzMDWeOrqIdS2/kszomTv
	 4lBCAGfenjZl83t2YAVrd4h2XhJdJID73rH5I5/c7iXrvAdMPM4tN2XaWwGbUvdV/t
	 ilXRAaqrjSzMQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jingyi Wang <quic_jingyw@quicinc.com>
Cc: quic_tengfan@quicinc.com, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xin Liu <quic_liuxin@quicinc.com>
In-Reply-To: <20240925-qcs8300_ufs_phy_binding-v3-1-c1eb5c393b09@quicinc.com>
References: <20240925-qcs8300_ufs_phy_binding-v3-1-c1eb5c393b09@quicinc.com>
Subject: Re: [PATCH v3] dt-bindings: phy: Add QMP UFS PHY compatible for
 QCS8300
Message-Id: <172957513423.488852.1097223397140343310.b4-ty@kernel.org>
Date: Tue, 22 Oct 2024 11:02:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 25 Sep 2024 15:34:32 +0800, Jingyi Wang wrote:
> Document the QMP UFS PHY compatible for Qualcomm QCS8300 to support
> physical layer functionality for UFS found on the SoC. Use fallback to
> indicate the compatibility of the QMP UFS PHY on the QCS8300 with that
> on the SA8775P.
> 
> 

Applied, thanks!

[1/1] dt-bindings: phy: Add QMP UFS PHY compatible for QCS8300
      commit: 30c280bc8e4555d55d7de7b85983990356c1e8e9

Best regards,
-- 
~Vinod



