Return-Path: <linux-arm-msm+bounces-4134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7478380BE20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 00:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AF0E1F20EFE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Dec 2023 23:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 715031F61C;
	Sun, 10 Dec 2023 23:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UvONUFbc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C381DDE0;
	Sun, 10 Dec 2023 23:21:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 727FAC43140;
	Sun, 10 Dec 2023 23:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702250481;
	bh=Ebg1Pl+ZMLOou6Mg4RWGn2tcbWhqseOKxzJU8l7+g5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UvONUFbckoc7EUhr3XlhCT0yKXPkcuT1jKoZIKi6Lz4T52CeYvmqgLGIcR9To8UWB
	 qeaRBoBqcX+C3Oz/Cdj/ln7bFGp3v8eY6Btiwa7I2sFjbx0NdGKN9X08g3nNc4Xc2/
	 LUnm9hjJawpeVKxRTkSCPzsEbUbcoBaM3d7y15k68oAT8M9Hz8NL179ux4IaIfWIWY
	 kkX5R1IIdE27fjFXE4G99bQ+LnS9xxGUrZiZZ6x9cFQIPVhp+AzvwwJyiI5FuLw7pD
	 7D0tYO1UFqwy4U1VO5z1bK2QcxVebJezhGFp7TCHYNJX8sNNq46VHjGx8Xuf+2Zg1b
	 HX6IK6gU4jF/g==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650: Add DisplayPort device nodes
Date: Sun, 10 Dec 2023 15:25:42 -0800
Message-ID: <170225073870.1947106.12491933482797485031.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208-topic-sm8650-upstream-dp-v2-1-69dab3d074e4@linaro.org>
References: <20231208-topic-sm8650-upstream-dp-v2-1-69dab3d074e4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 08 Dec 2023 13:16:45 +0100, Neil Armstrong wrote:
> Declare the displayport controller present on the Qualcomm SM8650 SoC
> and connected to the USB3/DP Combo PHY.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8650: Add DisplayPort device nodes
      commit: 990b6c928b212d930ae8b002dd86043cc4a302ba

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

