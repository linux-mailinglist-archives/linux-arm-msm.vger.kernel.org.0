Return-Path: <linux-arm-msm+bounces-85620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E576CCA20E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 04:03:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 565363018D74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 03:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 139D420299B;
	Thu, 18 Dec 2025 03:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pyg0Pfmp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97212B9B9;
	Thu, 18 Dec 2025 03:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766027030; cv=none; b=WMU2VBSDvuf16hmV/XepcbzGCQ6ehBtyHPBM9VxU6qT/dIv03m9LdZlf9DYUCE9izugJUCH1oitIXfLJdkoNc4vcUPHVnnQKNTKk5NcL0wDIh0QSQhDbvpRpEt7eFj7JX7QndAEQXMsjSNkP9ySqxvlYUXyEENNLiKcynkXwwX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766027030; c=relaxed/simple;
	bh=KF5X+pCVWCgR3I+ZJ42mCEyYk97svtnFxm/pzJyOSVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C+8UtnLoJs9JeDhW+o9infH0dYTbAPrZ7KLfd00xmLiZQHNEqu1e6vKq82aTaCPJa3IB72O2w5AZ37LDZcd1lqvdkAVPi9+9z4YNrr+2pqE9Yv5oCx7C68HKv/F/8UcXa16XyWu78YDWBjXx79lfruofpGcCq7x4WPSid4MmCPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pyg0Pfmp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD902C116C6;
	Thu, 18 Dec 2025 03:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766027029;
	bh=KF5X+pCVWCgR3I+ZJ42mCEyYk97svtnFxm/pzJyOSVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pyg0PfmpQX8KliO5T6D0hY4/E+zZcrb7qvcHPo9RA3HsjaZl8G8KzPbL3XVwyhaq0
	 W3EkHX8LQ/QKnX5RtXbbRb/LZorhSOlvjMqqHClqN2qaZcgWYXHcTL/1uhlBUfe2NF
	 1Qhfc4l3p9HvQ0qoneOrcdaqHyvfuDwHjnp5TWxUOQELrvbgzcY/9ogRPJdE8C1IXW
	 /HngvrHl2usyam/dB91vtIbMw9IB4XZjQdfWPMVlojS7j0o806GC4z2EFvY7OMh3yr
	 186yGl/8qPuQWWyPz40cowHYFTqc1ikNiK9xG9qWXq8pnonoWw+MNxsA5r/rIINgja
	 3Gcre3HakFOtg==
From: Bjorn Andersson <andersson@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: qcom,pdc: document Kaanapali Power Domain Controller
Date: Wed, 17 Dec 2025 21:11:49 -0600
Message-ID: <176602747931.229487.16721375623004206494.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251021-knp-pdc-v2-1-a38767f5bb8e@oss.qualcomm.com>
References: <20251021-knp-pdc-v2-1-a38767f5bb8e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 21 Oct 2025 23:00:26 -0700, Jingyi Wang wrote:
> Add a compatible for the Power Domain Controller on Kaanapali platforms.
> 
> 

Applied, thanks!

[1/1] dt-bindings: qcom,pdc: document Kaanapali Power Domain Controller
      commit: 5422fad3e1cc2293cb3549f8ec02013ea50a9c80

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

