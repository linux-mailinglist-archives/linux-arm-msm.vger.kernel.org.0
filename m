Return-Path: <linux-arm-msm+bounces-57182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63598AAE6E3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 18:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EB89521A50
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 16:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD5428C2D8;
	Wed,  7 May 2025 16:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXFwwOQZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D36428BAAE;
	Wed,  7 May 2025 16:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746635922; cv=none; b=a9YR+yYNaUdCS8Iqd5OdCOTSfuKh74Kz31flpfvCMALH3Y/jWVKM0zv+CCWT3mwKk7dnThExSoGpPyHHwkqpsXtvenpaxt+KxGigmA7WVXnzN4TSRQIXRkez1K5/kDObC/JYxybC+q2Ot+JW0w0dr3KEXgjZqeptfU8JCR3pHQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746635922; c=relaxed/simple;
	bh=Lmt22MGqAPCS7bhzg3zG3Ritk6kyYkEIF/BqVY1P5Sk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ufZNUzFBQRJRQrBWATtWjFYXJv+SODVpAL1kK1CehRmDTF80JblOITMOfpQIgU4CElnESP8kE4cEE6y30oU10aUP/4J07FwmQTNwGaPE47xe2W57OE2IZFrRg1BhRertNbTcR/zX4COkvwdZxLJamx8hWGPLwcx/jyCPm+1PIYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXFwwOQZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9589DC4CEF1;
	Wed,  7 May 2025 16:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746635921;
	bh=Lmt22MGqAPCS7bhzg3zG3Ritk6kyYkEIF/BqVY1P5Sk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MXFwwOQZYuCFxsyyQMkCbl6bJQXdsNZibHMPxw60IaKPh15jQmoZ3134mJXd38YC1
	 Zy8XSPESOaK4ZpijSwLDM7HMEhilhFv9nEaFcae75r/TYFCqWX0pg88Mwe+KyyErJf
	 F5D1A1EteA9cr7fub95ORyrdhxKzAQgsyQUBY+mjuvaozxHS5b/mpQzO3IB44/FijS
	 tF25phCrHw9TGkCNmRAjSvDVAP58KMjstiDdqB7j59v38/i3kwUy3KsudWkzx9TDTP
	 2EKSWvPdh7lFBhT9thCA7uDWCYTTr0uqHuJqEJo34Vy6gmNZKU/4YuHAwcaWMoiNC0
	 TrjD14KaxMUQA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sam Day <me@samcday.com>,
	Casey Connolly <casey.connolly@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/6] arm64: dts: qcom: msm8916/39: Cleanup/fix UART console pinctrl
Date: Wed,  7 May 2025 09:38:34 -0700
Message-ID: <174663591263.3531.885721976162259110.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422-msm8916-console-pinctrl-v2-0-f345b7a53c91@linaro.org>
References: <20250422-msm8916-console-pinctrl-v2-0-f345b7a53c91@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 22 Apr 2025 13:03:47 +0200, Stephan Gerhold wrote:
> At the moment, msm8916/39.dtsi have two inconsistent UART pinctrl templates
> that are used by all the boards:
> 
>  - &blsp_uart1_default configures all 4 pins (TX, RX, CTS, RTS), some
>    boards then limit this to just TX and RX
>  - &blsp_uart2_default only configures 2 pins (TX, RX), even though UART2
>    also supports CTS/RTS
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: qcom: msm8916/39: Move UART pinctrl to board files
      commit: 8d88f6c9c5e774420673a37510b22015b1edd569
[2/6] arm64: dts: qcom: msm8916/39: Introduce new UART console pinctrl
      commit: 5c0c8b7a315ff63e01e9a608f78dea16daa57aed
[3/6] arm64: dts: qcom: msm8919/39: Use UART2 console pinctrl where appropriate
      commit: 2b8d22ef1687768e4b572d01cd2432eb86340dd1
[4/6] arm64: dts: qcom: msm8916-motorola: Use UART1 console pinctrl
      commit: fe848d64cc6516cd56f38d23cfb544a68231a6e8
[5/6] arm64: dts: qcom: msm8916: Drop generic UART pinctrl templates
      commit: 979b65d8f416353c6b44ec5c0ddc837b2d20ab47
[6/6] arm64: dts: qcom: msm8939: Drop generic UART pinctrl templates
      commit: f7f65536124db6a5666992f0d6fd9595fbbf067a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

