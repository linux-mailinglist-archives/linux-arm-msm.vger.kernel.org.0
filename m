Return-Path: <linux-arm-msm+bounces-60857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05995AD4129
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 19:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62DD2189EE6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 17:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9EE2248F58;
	Tue, 10 Jun 2025 17:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZmZp5Bv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBC52475E8;
	Tue, 10 Jun 2025 17:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749577445; cv=none; b=R9AyfKe8l3sOnJuJcs3RmmHbamFmGiaBYOGG34ulgrE0IXlroucYTTpn4mWk2Hc9YTypRIN5DZqVP4koMGHACJtACExl01NS9rMUDqJYyB/ahLBPHNQZTc8JPVchO/GveYXZ5gv4dDl4BHqUD3pbFBT1N038En0c7oSIjDWwXas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749577445; c=relaxed/simple;
	bh=vuZG9jiFWaNVC1So+7llqgGPE2Zh1pf9D6teTibGnZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EkS7NvD0wjsy1kNf9ao2YrX9R+UDS8jEMDVxhvCYbRyAQ9fizyydoWlLrgQJwqflfHTt7rHv8eyXqFpJYhm2PaZmxL3VLsbikqXyytgFn2NrATfwWgAeyGmHjc4tuQ2DyGvJi9TajM6xdzF9ZwHX0egW9DgEBxl5q/G4qmhDHMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cZmZp5Bv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9E9C4CEF0;
	Tue, 10 Jun 2025 17:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749577445;
	bh=vuZG9jiFWaNVC1So+7llqgGPE2Zh1pf9D6teTibGnZg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cZmZp5BvBcKHT/B6FN3y1E/3hD3/Kx3mmD8ikHyAXgG/0iipw1JBmIc86jCTLBkYR
	 BdxMrP3yn7pUthRhQu+pNdNW1sep/2Lgkr43vJl00nGm0/8kJtHL8WUbRC2TUQloM8
	 lwlsTpY14WcCTXjyz1uoO3fWyILqgXfHuymEnvkcqXb1hQX3HVeo6kTG0DF4W9CgYf
	 l2OfLlI4ZxXPvu22vwMcU2zh6h/7mlQce9UcUqy5c3Dixw9MoHt8j/pC+Lw+FImG12
	 rRsQ+801IV7v+7IsQTog+ORnN04qY6+IFj4WGpxJF03g+y4II/+jjnXzq0SIyC7wHp
	 qvXGaLunv8q9w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: enable sensors DSP
Date: Tue, 10 Jun 2025 12:43:57 -0500
Message-ID: <174957743673.435769.12139352096005282442.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608-c630-slpi-v1-1-72210249e37e@oss.qualcomm.com>
References: <20250608-c630-slpi-v1-1-72210249e37e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 08 Jun 2025 19:02:39 +0300, Dmitry Baryshkov wrote:
> Enable SLPI, Sensors DSP on the Lenovo Yoga C630. The DSP boots the
> firmware and provides QMI services, however it is of limited
> functionality due to the missing fastrpc_shell_1 binary.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm850-lenovo-yoga-c630: enable sensors DSP
      commit: 34b959213896f208b74ec0e670b3f926dc3acb20

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

