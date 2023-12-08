Return-Path: <linux-arm-msm+bounces-3977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B9B80A60D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:51:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5C7E1C20C8F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 14:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FDA020B2F;
	Fri,  8 Dec 2023 14:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rCE65J8K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F110208D8;
	Fri,  8 Dec 2023 14:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296FAC43391;
	Fri,  8 Dec 2023 14:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702047081;
	bh=+NSdCIU9xKZjuOomM6eVNr+zZBHKb8GcvYdKwFvQrFY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rCE65J8KX8bX5GRfRilS2mwdwe4kmUBCpzdice+WBsWjuxX0scJTEDXcKgSXpKQxl
	 16tnUAYwj0JiHOk3fzZuFLHc6exex1T8BDdRwt9aLfuTbou+ioxpS/rxO6VztJian8
	 lO6Ee/0g5BCg1tfXDu8JzsRRspcSXuJqMU0MveiSC5Fmx+qZZZKL/j+L17gdbkQHA0
	 HY9hGU6wIg6BhkSusYs9fwsjx34pXNDOkS9lhuMqjS6DOU/2uZp+vb5qnW+9Nvyb79
	 27z5HcYSZ9mFV+VAnH54kMN48pe+9ZqkkIF7YZsA55a5knNGFv/b1HChTetx7UVEiL
	 027yZRbryHAug==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 0/8] arm64: dts: qcom: Introduce SM8650 platforms device tree
Date: Fri,  8 Dec 2023 06:55:30 -0800
Message-ID: <170204733635.342318.13009978624343160327.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231130-topic-sm8650-upstream-dt-v5-0-b25fb781da52@linaro.org>
References: <20231130-topic-sm8650-upstream-dt-v5-0-b25fb781da52@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 Nov 2023 11:19:55 +0100, Neil Armstrong wrote:
> This introduces the Device Tree for the recently announced Snapdragon 8 Gen 3
> from Qualcomm, you can find the marketing specifications at:
> https://docs.qualcomm.com/bundle/publicresource/87-71408-1_REV_B_Snapdragon_8_gen_3_Mobile_Platform_Product_Brief.pdf
> 
> Bindings and base Device Tree for the SM8650 SoC, MTP (Mobile Test Platform)
> and QRD (Qualcommm Reference Device) are splited in two:
> - 1-5: boot-to-shell first set that are only build-dependent on Clock bindings
> - 6-8: multimedia second set that are build-dependent with Interconnect bindings
> 
> [...]

Applied, thanks!

[1/8] dt-bindings: arm: qcom: document SM8650 and the reference boards
      commit: 78804eecbe5c4d533ae8b7c3a85b278e3594ec94
[2/8] arm64: dts: qcom: add initial SM8650 dtsi
      commit: d2350377997f3606d5b76ee7dc6101c148048951
[3/8] arm64: dts: qcom: pm8550ve: make PMK8550VE SID configurable
      commit: 707060bf2a3cf3329b848e12a038de4d81356579
[4/8] arm64: dts: qcom: sm8650: add initial SM8650 MTP dts
      commit: 6fbdb3c1fac7d48f996098254758736e0b47f6b2
[5/8] arm64: dts: qcom: sm8650: add initial SM8650 QRD dts
      commit: a834911d50c1dda9c3022141e9f9c948e707a0ff
[6/8] arm64: dts: qcom: sm8650: add interconnect dependent device nodes
      commit: 10e024671295184fe7556fcb427444b57d2e0ed5
[7/8] arm64: dts: qcom: sm8650-mtp: add interconnect dependent device nodes
      commit: deb63527ab248301adc302e21d79c0aae5a827db
[8/8] arm64: dts: qcom: sm8650-qrd: add interconnect dependent device nodes
      commit: 0c5b1016b5f30eb2313f942abef5bd7a7be12ae8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

