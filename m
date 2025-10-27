Return-Path: <linux-arm-msm+bounces-79043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FE7C11CAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:41:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 259B94F07F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE1D33DEDB;
	Mon, 27 Oct 2025 22:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RrtGVWeD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA3933CEB6;
	Mon, 27 Oct 2025 22:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604510; cv=none; b=pT3lCAMXczyl1o7S+5xZDvbiXwgsuyRYFqEbhC5lWhAROnOt0Zjx9Wl9ZU5AGGIAOjpytC5Xj9Po63gf1gytOdUAvIKySuTfxzQN1fNcS4LkBC5kMyi7qUjJ8467Dgu8nUGrvXLd6Beql7PvYqw6vp3/OtPfgXBJrWxcKKVJx1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604510; c=relaxed/simple;
	bh=DQtdIdhlEQoyP4M4Ljxo7FNgqK2rwBGhhM2QUeC5xDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KnCqfi7/E6V7qtf9QR7uWv+oLf4vmRHgswLn1ZRagd+eiBgPSrT20SCQKiOqQob7rF1D9oC1elUpdCwfhpjWYeRckeYD14pKEmDvS8urL/ZT+fnRljbanTEW/qK61FL626QG5EeFU9mzVWv87UsvRIK5TCetctdECU8PBbrntIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RrtGVWeD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F6CC116C6;
	Mon, 27 Oct 2025 22:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604510;
	bh=DQtdIdhlEQoyP4M4Ljxo7FNgqK2rwBGhhM2QUeC5xDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RrtGVWeDdoRP4scGRGARZPSyhZQaRNyPibORaR1kILShxFqkJsJZhHRZDDPjW+ZyW
	 jAb03fTOuCQMksI3b1crk+2KByfX+Q7Ke0J7OTKJVa+tfKCstKEo/s07pUQuVfxjAT
	 QNBw6K9L1O7ebRr5USkf0c9K3lqMBtaDCLIEIPghREUUNwR1E9MFg3W09Zky/WoGhu
	 5zrUmVjSJzVj021WNVbEynCwOJhf6kNRvMClHqWkPc9GT6L9SQm3V2cwlHMmK0WYlm
	 b5m59o9gAIPuYb8QItN9gCBPhGptoNNh34X9QmIMpzQJlrhoOre8t47UPWTAwUqXqh
	 8j7jb8BXSibPQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8750-mtp: move PCIe GPIOs to pcieport0 node
Date: Mon, 27 Oct 2025 17:37:04 -0500
Message-ID: <176160465206.73268.11883575967664088111.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008-sm8750-v1-1-daeadfcae980@oss.qualcomm.com>
References: <20251008-sm8750-v1-1-daeadfcae980@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 08 Oct 2025 10:08:55 +0530, Krishna Chaitanya Chundru wrote:
> Relocate the wake-gpios and perst-gpios properties from the pcie0
> controller node to the pcieport0 node. These GPIOs are associated with
> the PCIe root port and should reside under the pcieport0 node.
> 
> Also rename perst-gpios to reset-gpios to match the expected property name
> in the PCIe port node.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8750-mtp: move PCIe GPIOs to pcieport0 node
      commit: cc8056a16472d186140d1a66ed5648cee41f4379

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

