Return-Path: <linux-arm-msm+bounces-71441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5005B3EEA6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 21:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9A31203C2B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 19:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C793341679;
	Mon,  1 Sep 2025 19:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xh5Xx6Qv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D0E341641;
	Mon,  1 Sep 2025 19:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756755977; cv=none; b=TDFEAC0hJ7T5v3MTGJaRKKjU7BdDsLSesuRr6/sR8ce6GNGxkx/3bH0wThXnxiwW7D1q0/8CsTSOg9y9+aTJdrw9E1O6x/peo4AcGOP2g0vYwuAPiKIg9JwAPj+y1aRjIaeDwHsWk7DALc0a9w9aK0AVefmJCJYl90nZHlEgE3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756755977; c=relaxed/simple;
	bh=si7vXbyg5/be4LF8awop4lZTZ9vS+FZOw2bZxQB4iUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UHFG5pjEqwBhLuXO8JFcGwABKbsl5PzYUzpisFfGFxLTcQFAor/yT1RmWWrto3bwQhRqqz7jOyIEw0DG8m+jAAr75TzBzrmw0p17vsQfY36S5PC1bS+zCTs8TvQpa/qPc3hWTn9cGb3BOhQFrniSW5U3de/Pgm1BILN+NUA/sfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xh5Xx6Qv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F0A9C4CEF1;
	Mon,  1 Sep 2025 19:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756755976;
	bh=si7vXbyg5/be4LF8awop4lZTZ9vS+FZOw2bZxQB4iUM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xh5Xx6QvonzVKyHAs8yGtWmz1izDTeDh2NPpAz18L8JTikdkViXN0oIKkytgSlSC0
	 gT7CmQhdqoLSpa7diM28iaW/tJsycxD3Zdj3LAEL9iRMR02SjE4tsV11OGUjBVK8Wx
	 Rxr0qorjld2SsJswP3dJ46mps2C/S3vEz203QWclUBIpL1QQPE1/UQNToXTYDiUjIc
	 IwPR+qNXxWnwwgLW1vBdDmBwyWYLcYS2zkYRQyieEz5+754RHMUUGL27nvwBnPVnzk
	 cfS9hPwsu6YDo0gwfocFhi9wEQs9Q2mi7MC9VcfeTMdEgMJthXDhzZ1VQ4wL+aWV4N
	 ZHfxB22iTCBoA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vignesh Viswanathan <quic_viswanat@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: ipq5424: Add reserved memory for TF-A
Date: Mon,  1 Sep 2025 14:45:58 -0500
Message-ID: <175675595929.1796591.11809463459608448770.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250812-atf-reserved-mem-v2-1-1adb94a998c1@oss.qualcomm.com>
References: <20250812-atf-reserved-mem-v2-1-1adb94a998c1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 12 Aug 2025 10:22:12 +0530, Kathiravan Thirumoorthy wrote:
> IPQ5424 supports both TZ and TF-A as secure software options and various
> DDR sizes. In most cases, TF-A or TZ is loaded at the same memory
> location, but in the 256MB DDR configuration TF-A is loaded at a different
> region.
> 
> So, add the reserved memory node for TF-A and keep it disabled by default.
> During bootup, U-Boot will detect which secure software is running and
> enable or disable the node accordingly.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: ipq5424: Add reserved memory for TF-A
      commit: 8517204c982b1b36db766099a38cf752258dcd06

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

