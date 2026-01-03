Return-Path: <linux-arm-msm+bounces-87330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4C0CF03D0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 18:53:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56DDD305AE5F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 17:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FAEA30E84A;
	Sat,  3 Jan 2026 17:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LtLuxoMM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEFE30E844;
	Sat,  3 Jan 2026 17:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767462717; cv=none; b=Rr5k/4RdYfFDl+qFGH7iemRdqB6mCd7SVDgACpQBJ3COgAD534iwnQJ0hhUjzWhTXypbx8vZ8qeWRHivRvjXxHG9/qneGwPsKTNC97dFbakCZiWBiy3Ekd1SiAwsxroA3omRCiY3+LlNJiHtZ9UQza3maIBpvgmE9QTlpXgHyXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767462717; c=relaxed/simple;
	bh=i3yUdTgrs7/7M+8hDVZPDplqHxhvD3O++cACK3gW7G0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=orUcf1BRZiANg/elVNxtmFPGZ5YRO6BdE6NQcHNR9wOl9g6jNaT2JFyR0iYbmfjgpziLqJ0+V37X6XRYWEMVtPyeBSnvaBR4pKYhudQvwcvTQmMaZ7DZbfs0Ei+Dvpb2cNxV4DARRTwbm23xVHvHH5HET6d8LrbHpfVdJMSdoO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LtLuxoMM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D7CC19423;
	Sat,  3 Jan 2026 17:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767462716;
	bh=i3yUdTgrs7/7M+8hDVZPDplqHxhvD3O++cACK3gW7G0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LtLuxoMMTzS2ceijyPp+GRmJpzpMZrW6D8el6ImKweCrZAUq4/r0u+yfLkus/QstS
	 YPSlMnZZQqEXKgeM9uJ0mEfOAXDXMNKBITjAKJZpKNkETgm4udzM+bTz8uHDBwMn7Z
	 Z0glCH/WY0wC7cGUD60CkFSFj3EzJ8HIfiIyVAYW2S7PM+ck+lRyQDV85PUm2UpPhE
	 +OJlKddAtVrSNyywk3TvwMqxUIMqzLk/A5CpNCSkvkb6LtIKeCUDsydnwGQ1lHC67k
	 fsmnsftEgNioyVuoTb4JIss7ihiGnbIkmz3kBDQnikNrcxg/fkyRb0JMz/eUu/VucX
	 HggrtbwtbL+7Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/2] Enable DPU and Display Port for Qualcomm QCS8300-ride platform
Date: Sat,  3 Jan 2026 11:51:46 -0600
Message-ID: <176746270366.2648843.14823530236161718490.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251117-dts_qcs8300-v7-0-bf42d39e7828@oss.qualcomm.com>
References: <20251117-dts_qcs8300-v7-0-bf42d39e7828@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 17 Nov 2025 14:49:31 +0800, Yongxing Mou wrote:
> This series adds the MDSS, DPU and DPTX0 node on Qualcomm QCS8300 SoC.
> It also enables Display Port on Qualcomm QCS8300-ride platform.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: qcs8300: add display dt nodes for MDSS, DPU, DisplayPort and eDP PHY
      commit: 6710f10459c159da45e227f50b8db9c33ee906b2
[2/2] arm64: dts: qcom: qcs8300-ride: Enable Display Port
      commit: be4a8c25ae3a367eab0ae91ded89a96ae9627b72

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

