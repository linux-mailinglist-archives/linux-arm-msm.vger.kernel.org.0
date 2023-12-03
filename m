Return-Path: <linux-arm-msm+bounces-3096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFCE8020DA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 05:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 960031F20FD2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 04:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7982323CF;
	Sun,  3 Dec 2023 04:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jbJw/jMD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523624A2C;
	Sun,  3 Dec 2023 04:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4C83C43391;
	Sun,  3 Dec 2023 04:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701579115;
	bh=A7VTE3QnSrM8Wjx5d/M9Tr6CaBcSbMf8EZFHwWCBKnE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jbJw/jMDi7dk5/KLyZnLIZfnTrSD77+Yr4Pe3QH3eCihgfCjzI9tUnnu9vDAHNR8C
	 k2iGKimpFoHzl5kJSPakDEksqXvvswhnAfs7LCKNoDr9KwfmXuTSIH3LqXCBORaTHl
	 e/WEwEjM1kAvhFnwqyr6BaUsEs/CaT5Rjg12zGHIPoDC6MKITd3bTmaKPKmyMDl9tA
	 GvZNyCHqabzsJ3y/u+XQVJJSIGs7iUCgVh60PauCSm5A2EtGdnMi3jlIfpaeo3kGkK
	 0l1gi5pirKzOA4brSKRw8D+A5mJuD56i0WA3FfOiD97720/7KomF8Qk3XTemjKnOnp
	 I3cWnAqVqtVxg==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Luca Weiss <luca@z3ntu.xyz>
Cc: Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 0/3] Add support for HTC One Mini 2 smartphone
Date: Sat,  2 Dec 2023 20:54:43 -0800
Message-ID: <170157925829.1717511.13771309872564773437.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231125-htc-memul-v3-0-e8f4c5839e23@z3ntu.xyz>
References: <20231125-htc-memul-v3-0-e8f4c5839e23@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 25 Nov 2023 13:05:32 +0100, Luca Weiss wrote:
> Add support for this smartphone from HTC which is based on the MSM8926
> SoC and codenamed "memul".
> 
> Depends on, runtime-only, bootloader enables watchdog so we need to pet
> it to stay alive:
> https://lore.kernel.org/linux-arm-msm/20231011-msm8226-msm8974-watchdog-v1-0-2c472818fbce@z3ntu.xyz/T/
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: vendor-prefixes: document HTC Corporation
      commit: d69e34675a8be0affe8c55dbf50f795dac521933
[2/3] dt-bindings: arm: qcom: Add HTC One Mini 2
      commit: bfccc195192ea6ae72a4a49a85c94f1ad8ee7a13
[3/3] ARM: dts: qcom: Add support for HTC One Mini 2
      commit: be0061dcbac1b6a5a1cf681f7cabbb2681ab0e2c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

