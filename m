Return-Path: <linux-arm-msm+bounces-3817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0EF8099AB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 03:53:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F75C1C20CC0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 02:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814C64C65;
	Fri,  8 Dec 2023 02:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WwcElSzW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613804A39;
	Fri,  8 Dec 2023 02:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 920C7C433CA;
	Fri,  8 Dec 2023 02:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702004012;
	bh=TlJi6eYI0lB8fAkWy8E1xUasWzuI+5TcOkZW2KYTiWY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WwcElSzWCTmZbzjPUcTk94pwpEiT6DbVb8bd5jvml/lEnJfgG17s8i/FUFzU+tZ8d
	 opm97faS4bpI6QuZAV1KoSwzy7ybKUP6A+2fLqCkR/XfXVkrTl7hJk3mXnFHS2bs8W
	 KSBWC1dSj0Nc8uuUMd4JJP0ohA+71d2GMtQCyCfxAQTVT8vNW/hTWQbch/z1fbXolv
	 gR5+dlmV/TviDaY+ohfUcLk163+iqBn/zvCJaT7uLsVCzTSeROUPyAuUxZrxWQPWex
	 K6WqYs3/HNNoEFIlRDvsWc+o6A2rzDXElEui76Vv4R93/Qh5SS/XAW3jk6w3iAfqoH
	 6UAa/Ml9Qun6A==
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
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sc8180x-flex-5g: use 'gpios' suffix for PCI GPIOs
Date: Thu,  7 Dec 2023 18:57:36 -0800
Message-ID: <170200426920.2871025.15755406031779105330.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231111164229.63803-1-krzysztof.kozlowski@linaro.org>
References: <20231111164229.63803-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 11 Nov 2023 17:42:24 +0100, Krzysztof Kozlowski wrote:
> Linux handles both versions, but bindings expect GPIO properties to
> have 'gpios' suffix instead of 'gpio':
> 
>   sc8180x-lenovo-flex-5g.dtb: pci@1c08000: Unevaluated properties are not allowed ('perst-gpio', 'wake-gpio' were unexpected)
> 
> 

Applied, thanks!

[1/6] arm64: dts: qcom: sc8180x-flex-5g: use 'gpios' suffix for PCI GPIOs
      commit: fdff2141be44696f5cc69f2f6c20c26b9ac00760
[2/6] arm64: dts: qcom: sc8180x-primus: use 'gpios' suffix for PCI GPIOs
      commit: 9a1bd36aeb31649bc499f87671b76c7d117197e6
[3/6] arm64: dts: qcom: sm8150: use 'gpios' suffix for PCI GPIOs
      commit: af6f6778d34cb40e60368e288767f674cc0c5f60
[4/6] arm64: dts: qcom: sm6115: align mem timer size cells with bindings
      commit: f52f11271d90b1361a8364729a63a36b7456bc89
[5/6] arm64: dts: qcom: sm6125: add interrupts to DWC3 USB controller
      commit: 67e4656f4487b95a39e45884c99235f62ebfaa47
[6/6] arm64: dts: qcom: sm6375-pdx225: add fixed touchscreen AVDD regulator
      commit: 0d10ac7d2d9420d143ee738abbb06a9201e611b9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

