Return-Path: <linux-arm-msm+bounces-3105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF478020F3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 05:52:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5B17B20B2C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 04:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF3133E9;
	Sun,  3 Dec 2023 04:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpKeB8HW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E338D8F48;
	Sun,  3 Dec 2023 04:52:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E48C433A9;
	Sun,  3 Dec 2023 04:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701579126;
	bh=g9M9djE+Zo2OXIDWinS0oNMbR3ZSzjxtKnWXMhw6wI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SpKeB8HW4cy+hPa+FVjptdgDzrDMRDnS91UmNrziuyUZC0EcnT3uEO5wV+b5mMy6m
	 iF1HXcXBVBaDd0W0XZmFrfO63mRThmmdiL5Xk1JuMcLQnm2NY+kqeBAo7uDYj3SioO
	 tNUkCTyFknslfiwaGxdfDpN9RUX5EkrQpcoLVSPcc7xmsSRzwMqvWHBTvhHho5KqXf
	 +Xp+s2HAXmeIFWCIa3d1rCoMKBPEhC0TE2CzIMXkeNHqYheFEtPxKXakguIG72LZxs
	 VKnnTSvGPc17rsirBVcvvdOgbUz/KFnM5wS3LJzcmpPYOZcimXmOP17fjMoRlr5U3Q
	 238sq8IQyK2yQ==
From: Bjorn Andersson <andersson@kernel.org>
To: agross@kernel.org,
	konrad.dybcio@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	Tengfei Fan <quic_tengfan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: (subset) [PATCH v7 0/6] soc: qcom: Add uart console support for SM4450
Date: Sat,  2 Dec 2023 20:54:52 -0800
Message-ID: <170157925811.1717511.17508500866528370526.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231129103325.24854-1-quic_tengfan@quicinc.com>
References: <20231129103325.24854-1-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 29 Nov 2023 18:33:19 +0800, Tengfei Fan wrote:
> This series add base description of UART, TLMM, RPMHCC, GCC and RPMh PD
> nodes which helps SM4450 boot to shell with console on boards with this
> SoC.
> 
> 

Applied, thanks!

[1/6] arm64: dts: qcom: sm4450: Add apps_rsc and cmd_db node
      commit: 924645058d31bde9788d6b493adefc6f113b3272
[2/6] arm64: dts: qcom: sm4450: Add RPMH and Global clock
      commit: 483fa5552d352f3bfe835a3156e6cf037c4cf77f
[3/6] arm64: dts: qcom: add uart console support for SM4450
      commit: 980679261b061da92fc441fa4e2fdb7ef8baadb2
[4/6] arm64: dts: qcom: sm4450-qrd: add QRD4450 uart support
      commit: b6fbe1112e40109b8a0013d19b2d97f01438482d
[5/6] arm64: dts: qcom: sm4450-qrd: mark QRD4450 reserved gpios
      commit: 6e28e70f00756275151ffb02534c6d2318229416

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

