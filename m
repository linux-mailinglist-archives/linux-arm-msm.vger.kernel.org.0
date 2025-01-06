Return-Path: <linux-arm-msm+bounces-44055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB2CA0333F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 00:20:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28AFF1885A16
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 23:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EC21E1C34;
	Mon,  6 Jan 2025 23:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zh0LYbhO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC931E1027;
	Mon,  6 Jan 2025 23:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736205633; cv=none; b=gDIVPZIqmaXK4JGZD/EgaEjgKpycTAzUcwb64TFlqyqGC3CA3eg+hZ6kv/tSRgmw4W+JjaDCgU6jMfLPpZX8Xz5G097SCGQskeY2vLaX5aUJaKdIsrEDrQO2TIZq6SczI9IrDOLMtp1RYD6JWtvqzXHCxVi9pDnpknNfmmujCq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736205633; c=relaxed/simple;
	bh=WHcCV+qHSDmDtkIsRiilOeJGGuNwN4ZXV1J2XwOrORI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uQ/rK55GOvyGCfI+2AWf+d+zVJmGMms8lO6hXXnRWqGOKxivbWGN8CrsQEN9RtbZHRWioTNgV9ivZwLC2b0gs2u/oHt15LG1bOFTSX/J7zFzMFOofUicBBKaUePLJ2JJrAkrNU+omPMdi/kRCeBikcaj5RTUVikAMN0ZLz05Cxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zh0LYbhO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630DFC4CEDD;
	Mon,  6 Jan 2025 23:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736205632;
	bh=WHcCV+qHSDmDtkIsRiilOeJGGuNwN4ZXV1J2XwOrORI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zh0LYbhO1o2higEICZvlZfinJQ8iKTl63r9VTIZPUylKzY5Vzc8ZDKw4T6lYNoOPK
	 UMxIsHSP06FwzIS6dM1AxnqJy8F+9cMEqE2LDHGLJqiJvCCgy/+9Uljq2TZvDUPl8M
	 7Q8/cI4Fv0JcV/pKp/WowG31B6P8krUIV6ZKee079CLOy+Ffa+OHfdDzxb49ovl/Mu
	 Ht+G1I2BYRzpza3hdrn42OTMCB3B0qK3awpGV/HzA/YwA6CEENJlm3ivFOiC2Ioz0d
	 QUhv+g/C+SvTu1H3uyCD/rYyxy38oSPslOfxdr8W0HuGTJ4O59DAj4xfUOpUKrL6Ws
	 uyCCY2gRhOdww==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Felipe Balbi <felipe.balbi@microsoft.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 0/6] arm64: dts: qcom: misc DT bindings check fixes
Date: Mon,  6 Jan 2025 17:20:27 -0600
Message-ID: <173620562621.21468.10487453204919965987.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241230-topic-misc-dt-fixes-v4-0-1e6880e9dda3@linaro.org>
References: <20241230-topic-misc-dt-fixes-v4-0-1e6880e9dda3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 30 Dec 2024 13:44:43 +0100, Neil Armstrong wrote:
> Here's a set of DT bindings check fixes
> 
> 

Applied, thanks!

[1/6] arm64: dts: qcom: qcm6490-shift-otter: remove invalid orientation-switch
      commit: abb00f0fbf31d71b9f725e58d6a29634175f28a8
[2/6] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: remove disabled ov7251 camera
      commit: 80b47f14d5433068dd6738c9e6e17ff6648bae41
[3/6] arm64: dts: qcom: sc7180-trogdor-quackingstick: add missing avee-supply
      commit: aa09de104d421e7ff8d8cde9af98568ce62a002c
[4/6] arm64: dts: qcom: sc7180-trogdor-pompom: rename 5v-choke thermal zone
      commit: 9180b38d706c29ed212181a77999c35ae9ff6879
[5/6] arm64: dts: qcom: sc7180: fix psci power domain node names
      commit: 092febd32a99800902f865ed86b83314faa9c7e4
[6/6] arm64: dts: qcom: sm8150-microsoft-surface-duo: fix typos in da7280 properties
      commit: 9875adffb87da5c40f4013e55104f5e2fc071c2a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

