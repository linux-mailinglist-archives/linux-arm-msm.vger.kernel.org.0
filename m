Return-Path: <linux-arm-msm+bounces-3818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A29778099AE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 03:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5351E1F21355
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722FC1FDC;
	Fri,  8 Dec 2023 02:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZ3kTbWK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555324C8B;
	Fri,  8 Dec 2023 02:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CDF8C4339A;
	Fri,  8 Dec 2023 02:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702004013;
	bh=ct5z8TaxhTCE0x9MRzGXnRXlpuL+SWMfJGjjFvf5OIQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mZ3kTbWK9D/8AlbQwTvJTA7fi/v2jyWRnX5v6QjQAzKZqKIx6K2Mf8vA5eYEMOY9k
	 AvNGezq/2O/FPHDW2PUye1gPp6jaBdUqMll1q+U5TCQztgC2XApMl67/E2mO52GBZb
	 WA+cLIO1b1moL6rbPmG+qv6I8inHTH8gPKPrh71+vayvpyBJ1GnLiadf69JorKscX/
	 FYlGpCOFmCaGXmMOBYSWEEsgb6BJ0sAKZxvdKhrhmmI68cV6vX4FDNNOat3BgK6TBM
	 CWoAVve9YhvhVbT3JQ9konUS4Llry7aFxpomiv4PgzPxDr7Ln9ApuEzSnpDWDPCXOu
	 Za9a6D3BeaLCg==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: qrb5165-rb5: correct LED panic indicator
Date: Thu,  7 Dec 2023 18:57:37 -0800
Message-ID: <170200426918.2871025.16561322859589865587.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231111094623.12476-1-krzysztof.kozlowski@linaro.org>
References: <20231111094623.12476-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 11 Nov 2023 10:46:23 +0100, Krzysztof Kozlowski wrote:
> There is no "panic-indicator" default trigger but a property with that
> name:
> 
>   qrb5165-rb5.dtb: leds: led-user4: Unevaluated properties are not allowed ('linux,default-trigger' was unexpected)
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qrb5165-rb5: correct LED panic indicator
      commit: dc6b5562acbac0285ab3b2dad23930b6434bdfc6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

