Return-Path: <linux-arm-msm+bounces-85766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDEECCE57F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 04:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18B8E304EF56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 03:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB9B2C08D7;
	Fri, 19 Dec 2025 03:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r6ky8rUj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D609028750A;
	Fri, 19 Dec 2025 03:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766113881; cv=none; b=bcHpzm2d+41vdHHwdOQq3un00cRyHkhey+XmNuJm/dqwOyqM8r7ZfW1BtDMMCpdvYvbmQoi9A6lfRvOm5Xl7a0UY1HroTpsnzz63lBW3pYPsjlGxD290UXrRhTEBM5CWginkGc0Dk7tzdDD9kuoQTm5FljdS32SNo7Zcamb9naw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766113881; c=relaxed/simple;
	bh=BJZfYj9KKsg5t9QSw8GnQAkzi4mJGghJYrgStp4Icz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nwn8R3FVYNIwKHmKC9a1ztDpW+mAZIXagpjmFaYUhzfEgza1ZoG8eubvnecud97GywfpYnFHZuWrDBSj7WrMWRzd3Ytnb1/pmLmyqoR7bYQwJ+kcUni9mUSUvXkTjqm/GQKuu3EBSfWIE6/r4Aq5BYWyq99Kp/bpwPWoFTmoo8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r6ky8rUj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D338C4CEF1;
	Fri, 19 Dec 2025 03:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766113880;
	bh=BJZfYj9KKsg5t9QSw8GnQAkzi4mJGghJYrgStp4Icz8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r6ky8rUjsR8+0C4gwkvMoVkNCMPJTKK1GcuSi9wKxs4UacnYQmSdTARlc2CtKdjLb
	 hDXHIPFr3yONNb1oVDyNIjOXAWQqwgVPf+OV1dWW/td2pY/FMuRuTQeFFriSFg8Wrd
	 cCmjpNuje2HIeYI+30NAw2oV93Yhubygg2I/S9N7Fs3RrUyLR5DB4klu2KD8O0PWpj
	 gL4+SlukX+fPuRfQ9GYUGFiUCEubzq36lrGO9vNQIlO8yOkJVsaBs5TQcF7xt/zwRP
	 mt29+RhpaHO+4XhHR9iglBs1YKSw2KAfitMvHtoC3tLVFQHggb4XF17nMJBiHlpVE9
	 Q5IJcJQy3zrLA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Tengfei Fan <tengfei.fan@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/5] arm64: dts: qcom: Introduce Kaanapali platform device tree
Date: Thu, 18 Dec 2025 21:11:16 -0600
Message-ID: <176611386991.374588.10655425642624679621.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215-knp-dts-v4-0-1541bebeb89f@oss.qualcomm.com>
References: <20251215-knp-dts-v4-0-1541bebeb89f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 15 Dec 2025 01:07:20 -0800, Jingyi Wang wrote:
> Introduce the Device Tree for the recently announced Snapdragon SoC from Qualcomm:
> https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5
> 
> Add device trees for the Kaanapali SoC, MTP (Mobile Test Platform) and
> QRD (Qualcomm Reference Device), along with the corresponding defconfig
> and binding, providing initial support to boot to UART shell with UFS
> enabled.
> 
> [...]

Applied, thanks!

[2/5] arm64: defconfig: enable clocks, interconnect and pinctrl for Qualcomm Kaanapali
      commit: 69f155531baa9c6125aa3b911b3ca820f9108a36

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

