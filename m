Return-Path: <linux-arm-msm+bounces-30072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E47964E63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 21:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 240801C21268
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 19:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF0E18A6BA;
	Thu, 29 Aug 2024 19:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Su3+N65F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D54E1494B2;
	Thu, 29 Aug 2024 19:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724958334; cv=none; b=FB6Qb3PJBFMk7wqMr6RFLGK6QEfQP+IFKMaO1jnNIeXz4aGKd71o0vdh/mVWZqD/ViBR/fbzWQ0tfJSC3boMiYw1d9K2fv+vpfdSuq3GVNPFlAmvbGrm39mgRjXo4mhqWG3p6UXLCod7jMpEqX6OoS9arWpTu2Id60t28wlKNqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724958334; c=relaxed/simple;
	bh=/iNnvS9L1fXTjGz3fzdrIG16tzQk111vX0xu7VQbKRw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oXWfFGlHBecK6lK15xz98KQK+9MJMrS5sV/r3r4LUZeSNEayxd6ezLWBw7on4gRfSmwSRCa+eHy2wY2TYgZYz2MRQn6oBWf+i436g7j+qw7J+u+ELqA5mDs7jKh8y6LwsmhHCvvq2LV7f0e7Q0gt/VrQZ1QuLSASGUqGxY4XkCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Su3+N65F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99CE0C4CEC2;
	Thu, 29 Aug 2024 19:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724958333;
	bh=/iNnvS9L1fXTjGz3fzdrIG16tzQk111vX0xu7VQbKRw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Su3+N65F8SCLhVmIKkbkdYOqxNvdHVw9KFHCmWybUJfn4dMzlJvyec159e7rcUh4W
	 xYYOHWrQUqFp0qyGsUFgPAN1/GM0bxKRGTnvgyPoGH8vZPZN/+mLI9T1NfrPjKSnei
	 59OWjwbp1UdraQK8LPF/KNMeVT0uTtvQXVet3VJCaUWLRzg7ygG1490WGhHXRllF0g
	 zeItbm9xG7J4Hvu9jg67AHKx9/c1/S0TDcGqSdN73/JJTCRrYrvplMMxEjmWIK04NO
	 amfeK09fDUUTgXR3SK7qH4UDJk4g8jmh93K5/jQbekJryb02NSwQpagn2PYTehIbzk
	 yjSkr+Co3KC3Q==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Qiang Yu <quic_qianyu@quicinc.com>
In-Reply-To: <20240801-phy-qcom-qmp-pcie-write-all-tbls-second-port-v2-1-6e53c701e87e@linaro.org>
References: <20240801-phy-qcom-qmp-pcie-write-all-tbls-second-port-v2-1-6e53c701e87e@linaro.org>
Subject: Re: [PATCH v2] phy: qcom: qmp-pcie: Configure all tables on port B
 PHY
Message-Id: <172495833122.405683.1905233025604889518.b4-ty@kernel.org>
Date: Fri, 30 Aug 2024 00:35:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 01 Aug 2024 18:54:53 +0300, Abel Vesa wrote:
> Currently, only the RX and TX tables are written to the second PHY
> (port B) when the 4-lanes mode is configured, but according to Qualcomm
> internal documentation, the pcs, pcs_misc, serdes and ln_shrd tables need
> to be written as well.
> 
> 

Applied, thanks!

[1/1] phy: qcom: qmp-pcie: Configure all tables on port B PHY
      commit: 00c5f32283f377ec60870bccbd518d9feb7fbc52

Best regards,
-- 
~Vinod



