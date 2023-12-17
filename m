Return-Path: <linux-arm-msm+bounces-5098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C24F98160C1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 18:22:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 605CB1F21CD2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Dec 2023 17:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3C247A57;
	Sun, 17 Dec 2023 17:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BmB5HTx5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276DF47A4E;
	Sun, 17 Dec 2023 17:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2014C43397;
	Sun, 17 Dec 2023 17:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702833699;
	bh=VNFbTsNHChBACkuTvNca5OCPmYKROsyMBUcu/yWYiT4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BmB5HTx5B9NFoNdIrInf9JTrd8rBkpUBOqV2wOn0/MHobQxXhZ7PZIge565dU7Def
	 Rf4k1geR5GdoWWnAAYGSmV1yMds9S69FQIEZFz1Jury9De18OrceeJpns4vVLqmq0m
	 ldk7KUYur63+8m/Y3xdMBgsh48hNqvyYWtSapfriUJcB0TLZVlZ/PU0T4YqwPCfZeA
	 wTMMEqtSqC90QB87EDoyMN9zq04C3rdJ0Uud3/hPFyMLuT2/9Nzz1U3FaxC5UkutcL
	 nMtLmdLeclwss4TBqJwULCKoQexVI2XuGfuJu/2GqDRQGddLS/CxglHLWHlyBOls97
	 Z63sT4MD61Pxg==
From: Bjorn Andersson <andersson@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 1/1] arm64: dts: qcom: ipq6018: Add QUP5 SPI node
Date: Sun, 17 Dec 2023 11:20:56 -0600
Message-ID: <170283349408.66089.8909285594268375716.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231203154003.532765-1-amadeus@jmu.edu.cn>
References: <20231203154003.532765-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 03 Dec 2023 23:40:03 +0800, Chukun Pan wrote:
> Add node to support the QUP5 SPI controller inside of IPQ6018.
> Some routers use this bus to connect SPI TPM chips.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: ipq6018: Add QUP5 SPI node
      commit: 2e16f9dc9be07f08442d63d682cdf89d6321b408

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

