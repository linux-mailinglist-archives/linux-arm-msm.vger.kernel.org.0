Return-Path: <linux-arm-msm+bounces-3812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 492CC80999E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 03:53:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC9061F212C1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E504C1C17;
	Fri,  8 Dec 2023 02:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NIrStDXd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C843D65;
	Fri,  8 Dec 2023 02:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 026B0C433BF;
	Fri,  8 Dec 2023 02:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702004007;
	bh=aSWILFwu/oQmJ57P5F2M3EaIkFjiiJY4+2urq78ilXs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NIrStDXd5xEU5laPkdBc5Br9pZwncfHyugKTlV3S5iFxozriJBfveSIM8YM4rpMHl
	 EIOSn+qxUkqCHdqhqXKVhuFuCHYi1PQKYNL8rX2JTTmvDJIpBkIsQYJ7mrVsQ8Z8kA
	 +CMewyFoXukJeHRYQN/fRFSmiSy0WJwkWR5iVa4FCwd1ZjqC3KUGUeFXebmjJOj/jk
	 wOOrQfqfBk2/AhsSVJQfh4K7RGETGlVlpgFtRvD1sn4WM4+E7Ybu550tWAnEj8tHOR
	 IktBShNcXBqcfcLMo4kedtfDLt5byHgyD3YxHi9KGO9Zpb3Eq+wA2PVNiB6ivQL3en
	 kk+/0RPUYIixg==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 1/2] arm64: dts: qcom: qdu1000: correct LLCC reg entries
Date: Thu,  7 Dec 2023 18:57:31 -0800
Message-ID: <170200426915.2871025.17631856635875176410.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107080417.16700-1-krzysztof.kozlowski@linaro.org>
References: <20231107080417.16700-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 07 Nov 2023 09:04:16 +0100, Krzysztof Kozlowski wrote:
> According to bindings and Linux driver there is no
> "multi_channel_register" address space for LLCC.  The first "reg" entry
> is supposed to be llcc0_base since commit 43aa006e074c ("dt-bindings:
> arm: msm: Fix register regions used for LLCC banks"):
> 
>   qdu1000-idp.dtb: system-cache-controller@19200000: reg: [[0, 421527552, 0, 14155776], [0, 438304768, 0, 524288], [0, 572293416, 0, 4]] is too long
>   qdu1000-idp.dtb: system-cache-controller@19200000: reg-names:0: 'llcc0_base' was expected
>   qdu1000-idp.dtb: system-cache-controller@19200000: reg-names: ['llcc_base', 'llcc_broadcast_base', 'multi_channel_register'] is too long
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: qdu1000: correct LLCC reg entries
      commit: b0e0290bc47dd1bc8b1bd0c6b9ec0347564f3f21
[2/2] arm64: dts: qcom: qdu1000-idp: drop unused LLCC multi-ch-bit-off
      commit: 468cf125e4796e8ef9815e2d8d018f44cf8f1225

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

