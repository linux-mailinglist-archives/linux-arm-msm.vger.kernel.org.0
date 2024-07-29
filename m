Return-Path: <linux-arm-msm+bounces-27166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6224C93EC1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 05:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 916621C215E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 03:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B451185260;
	Mon, 29 Jul 2024 03:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EiRYqoj2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE5584FAC;
	Mon, 29 Jul 2024 03:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225524; cv=none; b=WCZinRBnAy54X7Hi1XFNFKKbZgO1Kkho594HLw9gNTJOec/MJpQYkfBmvX78KFc5VALu9ueEMTolddksDq5dMOrv8GTqJLopFoPKlcL3n/qnEztntn8Giw8NHps3uZglv/dVHIoe7ecHpSt0fvX4sVa3UGBWRubWgI2jbJduDIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225524; c=relaxed/simple;
	bh=mkJ0zEcEt3o4UhvGo4Jdp45S4meY8PeXLWGQDwUZyak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EjIYwjyp8zRvhEwNX4mFlhftjmfkwdhvSlqpWzlv9DaeUpu0mSb6CDMRI56OdIfbib+kytt1dy5dEeCAHiPRmCmuG8nHqDIJQVX1CqlCaAODeYt7R6a9oK2SFGEdFsUylsyaXSHtNYICJ5HZbKhpZim7VUeHSVvs5ncbHPFMbx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EiRYqoj2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17926C4AF10;
	Mon, 29 Jul 2024 03:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225524;
	bh=mkJ0zEcEt3o4UhvGo4Jdp45S4meY8PeXLWGQDwUZyak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EiRYqoj21XH/xOCfHVbHqKyAYYCzdg3re/U8SyDxiZKZ8N7d78/cuIRYt0/bpZ9Nk
	 hlyqUfbs18hFLJZkE0qT/uWlYciPFAkJFKjFQVOyjEPrGHK6K/4DJcDw1BqfvgBJ1d
	 qcwlvBzHO0l83uxnqQYDXvl+gbDx5ieFKHL2qg1WjBdlyMcS6x4V0q1DiUict04Kn1
	 Yhmm9cqo2Vdlko0mic/8HyFQHSRJat/wSs4unaGI6LvWJ+pa+MvDKQ6TZ6ZL/hEnn1
	 2xILCwevIvnD7mc9hAyrVo6bzKUG8raHOV3HO7w/xFfAx04BjLMzsnbrjjMp+9fcq8
	 JET2MVN8O0ZRw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Xilin Wu <wuxilin123@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/12] arm64: dts: qcom: x1e80100: QCP/Vivobook/Yoga PCIe fixes
Date: Sun, 28 Jul 2024 22:58:10 -0500
Message-ID: <172222551322.175430.15370831339827575299.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240722095459.27437-1-johan+linaro@kernel.org>
References: <20240722095459.27437-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 22 Jul 2024 11:54:47 +0200, Johan Hovold wrote:
> Here's a follow-up series addressing some issues in the QCP, Vivobook
> and Yoga devicetrees that had been carried over from the x1e80100 CRD
> dts.
> 
> Note that I don't have access to the schematics for these machine so
> this is based on the qualified assumption that the PHY supplies are the
> same as on the reference design (and similarly for the PCIe4 pins).
> 
> [...]

Applied, thanks!

[01/12] arm64: dts: qcom: x1e80100-qcp: fix PCIe4 PHY supply
        commit: 708950ab17453dbb1dc7067d1a70991be2efeded
[02/12] arm64: dts: qcom: x1e80100-qcp: fix up PCIe6a pinctrl node
        commit: ed2e81940e00872202f904846d051a384c50c9a1
[03/12] arm64: dts: qcom: x1e80100-qcp: disable PCIe6a perst pull down
        commit: 71f041f7a48b0631a0f069e97e230602fd896de5
[04/12] arm64: dts: qcom: x1e80100-qcp: fix missing PCIe4 gpios
        commit: 489a6e1500edc599fe320858ed664c4f1d08aba2
[05/12] arm64: dts: qcom: x1e80100-vivobook-s15: fix PCIe4 PHY supply
        commit: 5192a0a3d6953f59b754fa4085d0cd488a3dadcf
[06/12] arm64: dts: qcom: x1e80100-vivobook-s15: fix up PCIe6a pinctrl node
        commit: 2ba2614634017847eb622fd25091e3946b17dd97
[07/12] arm64: dts: qcom: x1e80100-vivobook-s15: disable PCIe6a perst pull down
        commit: 2d497a3fad55fd23e2e0d35608b897b825138c4f
[08/12] arm64: dts: qcom: x1e80100-vivobook-s15: fix missing PCIe4 gpios
        commit: 4a8e704c50d3abb6c04848fd869aa6701dc8ba81
[09/12] arm64: dts: qcom: x1e80100-yoga-slim7x: fix PCIe4 PHY supply
        commit: 28e3e1efe9c6319aa39cbe3431a8aeb3992d0a10
[10/12] arm64: dts: qcom: x1e80100-yoga-slim7x: fix up PCIe6a pinctrl node
        commit: 9dd42d3c2a0a0a354b20a87d5dd2049d24186c07
[11/12] arm64: dts: qcom: x1e80100-yoga-slim7x: disable PCIe6a perst pull down
        commit: dfbe556c0121db6de6503501c469cc97b5a76827
[12/12] arm64: dts: qcom: x1e80100-yoga-slim7x: fix missing PCIe4 gpios
        commit: 9a882c4f536782fd7431142edc01c4b921e5612a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

