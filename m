Return-Path: <linux-arm-msm+bounces-3815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9052C8099A7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 03:53:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 358881F212A8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69A14A23;
	Fri,  8 Dec 2023 02:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gwl5icqW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35507F4;
	Fri,  8 Dec 2023 02:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7380C433C8;
	Fri,  8 Dec 2023 02:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702004010;
	bh=N6irFgoDejeQrHblovY7KccaG0xZkVPKbD6S8AoIYMg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Gwl5icqWyuHxrxcw9NefcDWqH3ic8WqxMAU5tl7i3Cukr701iSSG9clpap7ZQeexe
	 7Hp2Tuo4RS/i3QP0QwcIsG1VvbQB4vH+b8V8gOVRvjBM/pK5G7ERcQ0QX2FYCFQ8cw
	 WgXUYmebMKvE7s1A35pvkO/4OZQ2vTbiBw2Nh6eBBYApD8dZfE4vlkRvRfDc4GQqco
	 K87EbvKyJ1kawrmQvwgJSXiMgBDRCB1+8tik5hdDgM6eol0mVBpo9Af9S6lrOSgGos
	 pnlIj6hGUvH1TpZhoryN4Fso3RYG+BnlsgsItjtu4dTRVYfqgOVtiIrLZimqK5vRnw
	 NMzQG1N1WxSWA==
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
Subject: Re: (subset) [PATCH 1/2] ARM: dts: qcom: minor whitespace cleanup around '='
Date: Thu,  7 Dec 2023 18:57:34 -0800
Message-ID: <170200426933.2871025.3571363968242066955.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231124095049.58618-1-krzysztof.kozlowski@linaro.org>
References: <20231124095049.58618-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 24 Nov 2023 10:50:48 +0100, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space before and after '='
> sign.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: minor whitespace cleanup around '='
      commit: dd744d7d15294816bed9d66c7f815d8b24ccd22f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

