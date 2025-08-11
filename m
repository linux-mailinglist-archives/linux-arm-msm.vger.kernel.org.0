Return-Path: <linux-arm-msm+bounces-68563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEB3B214C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 20:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D04E1A2378F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 18:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D1C62E7BAC;
	Mon, 11 Aug 2025 18:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJ17dEbp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65142E7BA7;
	Mon, 11 Aug 2025 18:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754937690; cv=none; b=JnzSbDKKr1WlCpfyl8lM/NklAPxh7eY3Uk9jdN5F1UGFAGvA8qvsJsHi9YxbvC93p3r6uprfDXm0nXhg1TBYCt9nOSKTFEu8slZPQxtIKPEGPS2o/jkNwQH0ToHXJrMVfP1Zl8luwFXa2HxDnbd0pTHlYbZTZxh9fInmzd1WiJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754937690; c=relaxed/simple;
	bh=BZnxS2yUoERBo5IAxXA9i/EaXUa+h068WAH70lZ5qJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HFOQPIBwwdp5kRRLCc3vUWL8kWt1wzeyLMwjwhmt15+VgXEvw19RjqXefAvNInrxM1F/ofTB5sMU5UX/oQlLjP1zTa1JvFIv3AqE3W+Tr0Rq0oyOOP7ReiVkgBwmD845Agc760FWxQjRlDxyy3m05BTYODyFX+yZgS6BYcVP57o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJ17dEbp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90575C4CEF5;
	Mon, 11 Aug 2025 18:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754937689;
	bh=BZnxS2yUoERBo5IAxXA9i/EaXUa+h068WAH70lZ5qJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WJ17dEbpcwrRqfG0W8Ac2BID0EbPsVNh0/aJnhQDlc0ifM0ybsoaf0Os5EhjhnILV
	 0ojdijRk8Ll72bSZiG4mbKBI2UJoWETCdffN7jxhtStEOthGJVQUlVjdkfQm72yV6T
	 3k4D9CxqPM5KhSyk0dTRAy1Xc+XjNoqomrx1adEGOZ/WpV92cZskBT2+RGE2j1vEmz
	 mkG3r+YkEf9LduFsPmsCrN56Xx6AYLn7/Ui+omf0+JeSaVKALTaV2bz5UFFbDCJgg0
	 KBA/OCiTnbLcIcZBZwjZSFg2kqDWFlkX6zLRy/FkSdQY4BcoXfeQp3jn0wWKMWUZUg
	 nAbZ2TtKhH4kA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Yingying Tang <quic_yintang@quicinc.com>,
	Shuai Zhang <quic_shuaz@quicinc.com>,
	Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: (subset) [PATCH v4 0/4] Initial support for Qualcomm Hamoa IOT EVK board
Date: Mon, 11 Aug 2025 13:41:08 -0500
Message-ID: <175493766090.138281.1004973334650633854.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250804-hamoa_initial-v4-0-19edbb28677b@oss.qualcomm.com>
References: <20250804-hamoa_initial-v4-0-19edbb28677b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 04 Aug 2025 09:37:03 +0800, Yijie Yang wrote:
> Introduce the device tree, DT bindings, and driver modifications required
> to bring up the HAMOA-IOT-EVK evaluation board—based on the X1E80100 SoC—to
> a UART shell.
> This patch set focuses on two key hardware components: the HAMOA-IOT-SOM
> and the HAMOA-IOT-EVK carrier board.
> The HAMOA-IOT-SOM is a compact System on Module that integrates the SoC,
> GPIOs, and PMICs. It is designed to be modular and can be paired with
> various carrier boards to support different use cases.
> The HAMOA-IOT-EVK is one such carrier board, designed for IoT scenarios.
> It provides essential peripherals such as UART, on-board PMICs, and
> USB-related components.
> Together, these components form a flexible and scalable platform, and this
> patch set enables their initial bring-up through proper device tree
> configuration and driver support.
> 
> [...]

Applied, thanks!

[2/4] firmware: qcom: scm: Allow QSEECOM on HAMOA-IOT-EVK
      commit: 60a63913fd69bae76a3420c97ef40e865792a5b8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

