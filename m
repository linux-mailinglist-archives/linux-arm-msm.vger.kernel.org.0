Return-Path: <linux-arm-msm+bounces-20500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8F68CF799
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 05:02:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C66E0B21258
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 03:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E638B8C0B;
	Mon, 27 May 2024 03:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKdDnoQa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8E1262A8;
	Mon, 27 May 2024 03:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716778858; cv=none; b=JvXjJC2LpYcGAr+yqOzg27bzuCIOItFcL6GVNhdNN6IKU9D2L9EaleN3EnqUtQ4+YnJmyODbG3WiQYtIYGSjhcbFCVSKrQwflAR+XEuEcn6X0vgHaRCTfzOS5idPmvDMzSX8l0nlPrKciDIiW0p+b3uPBJYvwtn6t0DuENWteMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716778858; c=relaxed/simple;
	bh=8t++9FGnrunXZmkGxqQTVTc2wu2GvvFL2qx6gtv+rvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gwWBJ4OAkvq+rHD34OlTZJlMbJqfEZTKVxkFlvnAkg8XlBDueWRGDGxKvWdSBjU8NTVgRic83PzimSxmty15arwbOEKE1wWFgPy21bfXLSQ+PXpAehrwTr58r+W2+FS3x6HAU59DUMFqDKOkaPMHwpyTgJWrisRlHduF8y6KeM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKdDnoQa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB301C4AF07;
	Mon, 27 May 2024 03:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716778858;
	bh=8t++9FGnrunXZmkGxqQTVTc2wu2GvvFL2qx6gtv+rvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RKdDnoQagxZm+2tSpL3cOBV3UWJXn22DMP9Zk1sJIBS7nd/oeUv/t87gIo2s5eD2I
	 lrV5k7ev0u5rYsQxV7hgGZ8Hc2ukl/+/UFWrPaO6FFMoLXXn3waHCRF+XWzCcD79Ho
	 5EDMcW7Q53tzd20Y+eeq4GhT+nAnzUSIQLcgyTRilo/nfWNxjxbG4hux8oc6eHTvif
	 +5h+trkxjh0KODOGRR9Z43oclXd9IDN+uUrd+10JUBNwwu4Gk88aZP52NdsSVluYa3
	 Eg9XG76/+WwXr9hSZK6jCbtASlJZ63WgSg0h7nLzb5L6keQAnF0B+VLNH3K9NfHDzk
	 8QdZwytY4ChZQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	cros-qcom-dts-watchers@chromium.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	David Wronek <davidwronek@gmail.com>,
	Andy Gross <andy.gross@linaro.org>,
	Evan Green <evgreen@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Iskren Chernev <me@iskren.info>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: (subset) [PATCH 00/13] arm64: dts: qcom: fix PHY-related warnings
Date: Sun, 26 May 2024 22:00:26 -0500
Message-ID: <171677884215.490947.3851539402371570359.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240501-qcom-phy-fixes-v1-0-f1fd15c33fb3@linaro.org>
References: <20240501-qcom-phy-fixes-v1-0-f1fd15c33fb3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 01 May 2024 19:19:26 +0300, Dmitry Baryshkov wrote:
> This series goes over Qualcomm PHY bindings and device DTs and fixes
> obvious errors and warnings reported by dt-validate.
> 
> 

Applied, thanks!

[04/13] arm64: dts: qcom: sc7180: drop extra UFS PHY compat
        commit: 48299f604d27dad1168cc90b89f33853162c6e33
[05/13] arm64: dts: qcom: sc8180x: add power-domain to UFS PHY
        commit: 9a80ecce60bd4919019a3cdb64604c9b183a8518
[06/13] arm64: dts: qcom: sdm845: add power-domain to UFS PHY
        commit: fd39ae8b9bc10419b1e4b849cdbc6755a967ade1
[07/13] arm64: dts: qcom: sm6115: add power-domain to UFS PHY
        commit: a9eb454873a813ddc4578e5c3b37778de6fda472
[08/13] arm64: dts: qcom: sm6350: add power-domain to UFS PHY
        commit: 18c2727282c5264ff5502daac26c43000e8eb202
[09/13] arm64: dts: qcom: sm8250: add power-domain to UFS PHY
        commit: 154ed5ea328d8a97a4ef5d1447e6f06d11fe2bbe
[10/13] arm64: dts: qcom: sm8350: add power-domain to UFS PHY
        commit: 634acc8cea1584b507801315831a330443f819b4
[11/13] arm64: dts: qcom: sm8450: add power-domain to UFS PHY
        commit: 27d3f57cf5a71484ea38770d4bfd10f6ef035cf4
[12/13] arm64: dts: sda660-ifc6560: document missing USB PHY supplies
        commit: 4edbcf264fe2c0167e0b0b0af060bc767e01f9f3
[13/13] arm64: dts: qcom: msm8996-xiaomi-common: drop excton from the USB PHY
        commit: c1aefeae8cb7b71c1bb6d33b1bda7fc322094e16

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

