Return-Path: <linux-arm-msm+bounces-20499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2D28CF797
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 05:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ECAD1F21694
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 03:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D5310A0D;
	Mon, 27 May 2024 03:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DdhEbs9u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6C1168C4;
	Mon, 27 May 2024 03:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716778856; cv=none; b=nF0cb+q24sgdL+lRNrNmx8mBc0i7iw8IShBG5DWdopQQVSqmrcjBPNqrc9Ut1cJrGoYPz15U3MS5wEh/sbcYge56k4YbHq+nw9hqx+Bh3Eg6k5S+PSa3HqXKN/STMPt2DEuo1AOlVUZPTKEYOXt7PsGfnyB219EXKC9B6VjgaPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716778856; c=relaxed/simple;
	bh=hCDjalwYJOsAlsf5juR1hFiClQXU4XZ8uKfKRwcoN2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GgKyK2fqXWYv5ldgmSmEzx2r3CB0jOEelo9HJzeyPmd5i7iKBdNUqngylxrx8wiyj7wdd4Q0S9lptiNlXN6jSImgmCdGDxMsC7CqbAHDCUK/k3EAkK2KqZpBgVX5c+ksD08z6qx8X4FnJ4GV3+G0MHSpIXgVzs+M/mgJbwVqZqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DdhEbs9u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67A1C4AF0A;
	Mon, 27 May 2024 03:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716778856;
	bh=hCDjalwYJOsAlsf5juR1hFiClQXU4XZ8uKfKRwcoN2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DdhEbs9uVtH0TasGL+rWhOsVMxFKsDy6cTkORiwgEyjH0pe/37alfik1xCSZk+tr/
	 3+3zXLvCVEZuJ09zQfzTFkJerOOP4sDbMS+dS1PNuEiDoi6HE6uRfdXy9PyjnNJaSQ
	 SyBTPOtDdemLXtAISdw1nnG9J6usf065i4Yu2/QhJRdfUs/f2fjPaNrHA/rSdh5XEk
	 feFrRjY9PJHqfGbPcGPoJ0tLldqXJbdrnyXqf4vi1dfR0zXHTYxPzRaCooJb8k0W/W
	 mZHcNu4ogSR3VXxGVWnVdpfY2JLxOx6veGSFyb2atS5ict9RZEoWSgsMQOjSeHNNoD
	 NSSPkZhULFXzg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/12] arm64: dts: qcom: move common USB-related properties to SoC dtsi
Date: Sun, 26 May 2024 22:00:25 -0500
Message-ID: <171677884195.490947.4534241393412636380.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429-usb-link-dtsi-v1-0-87c341b55cdf@linaro.org>
References: <20240429-usb-link-dtsi-v1-0-87c341b55cdf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 29 Apr 2024 15:43:37 +0300, Dmitry Baryshkov wrote:
> Move common USB-related properties and nodes (e.g. PHY's
> orientation-switch, generic endpoint connections) to the SoC file. If
> the board has different needs, it has to override these generic
> usecases.
> 
> 

Applied, thanks!

[01/12] arm64: dts: qcom: sm8150: move USB graph to the SoC dtsi
        commit: 4b699d2d569483760a18eeec1d80f691d635550e
[02/12] arm64: dts: qcom: sm8350: move USB graph to the SoC dtsi
        commit: 18eac39beb32cec920aaa29aaa15084cde6e366b
[03/12] arm64: dts: qcom: sm8450: move USB graph to the SoC dtsi
        commit: a84f3627f9d9765853b244f0cf50d3cafd1f0957
[04/12] arm64: dts: qcom: sm8550: move USB graph to the SoC dtsi
        commit: 2f212acedbbfe7119219935c8c670c3323f07186
[05/12] arm64: dts: qcom: sm8650: move USB graph to the SoC dtsi
        commit: 65931e59e0399129d845452c945b8017ad0570df
[06/12] arm64: dts: qcom: sm8350: move PHY's orientation-switch to SoC dtsi
        commit: 4f35b0fe2673655148d528982386d9ba5113d537
[07/12] arm64: dts: qcom: sm8450: move PHY's orientation-switch to SoC dtsi
        commit: 1a1322c8a698c8ccafed5379ae8c97dbf8480698
[08/12] arm64: dts: qcom: sm8550: move PHY's orientation-switch to SoC dtsi
        commit: d02c0027ea20f67a8dcf023786eb993abee2179e
[09/12] arm64: dts: qcom: sm8650: move PHY's orientation-switch to SoC dtsi
        commit: fbb22a182267c8de4056bd531caae1d5a32bb40c
[10/12] arm64: dts: qcom: sm8650-mtp: connect USB-C SS port to QMP PHY
        commit: c2f1d0c08fc11ad45d5980ffb1ba3a0a78cc8318
[11/12] arm64: dts: qcom: delete wrong usb-role-switch properties
        commit: dad66630a083263b513448426523a3b52a959c79
[12/12] arm64: dts: qcom: x1e80100: drop wrong usb-role-switch properties
        commit: 7c0922fc894ffff393ba57c4c20fc034e3a4917f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

