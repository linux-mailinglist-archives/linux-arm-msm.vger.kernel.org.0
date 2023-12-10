Return-Path: <linux-arm-msm+bounces-4129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B663A80BE15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 00:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BD851F20CC9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Dec 2023 23:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0951DFE4;
	Sun, 10 Dec 2023 23:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EAj11NC3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035EF1CA9B;
	Sun, 10 Dec 2023 23:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57815C433CB;
	Sun, 10 Dec 2023 23:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702250474;
	bh=gvwR2j/z1ZaZOnuiohyEd3caC9SRMzeObIfDq/TJzFY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EAj11NC33OEYTlSuJwOejAh9fXKT1j2awCHg+VfDk8sUh/8qfBNXPBtif2iJw1fVy
	 r4whRckFx+EMEneWvcV/P0zZcYKTucM/Ws4TM/RM/a9Lr8nu1/LvulZ/C8Nl2ygKjT
	 3tJxt5SdDF24uFFAJWBRi/I6PluN0mHPzGJWO6aBhQQrSxSWkLW0Yb41aBn3EZ3rkA
	 gUhRboSV6ncRSYp+2m2dbC85hXh0EDRXEcI3Ck6r2fc64V8GKpmpnczAOK+R6yec9A
	 0hiuw54LhNN/Ix+0x2CsehgC/YS2XS9oZxxk9PgOept4OwPNjhn95Rh5RM0reBO3Xd
	 wLMFZsZmo5F0w==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 00/11] Remoteprocs (ADSP, CDSP, WPSS) for SC7280
Date: Sun, 10 Dec 2023 15:25:37 -0800
Message-ID: <170225073883.1947106.12108217961435416842.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208-sc7280-remoteprocs-v3-0-6aa394d33edf@fairphone.com>
References: <20231208-sc7280-remoteprocs-v3-0-6aa394d33edf@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 08 Dec 2023 16:07:56 +0100, Luca Weiss wrote:
> This series adds support for the ADSP, CDSP and WPSS remoteprocs found
> on SC7280. And finally enable them and WiFi on the QCM6490-based
> Fairphone 5 smartphone.
> 
> The first two patches are fixes for the MPSS to fix some dt validation
> issues. They're included in this series to avoid conflicts with the
> later patches and keep it simpler.
> 
> [...]

Applied, thanks!

[07/11] arm64: dts: qcom: sc7280: Use WPSS PAS instead of PIL
        commit: 0bcbf092560cc1c163156af67176cbb4b8a327f9
[08/11] arm64: dts: qcom: sc7280: Add ADSP node
        commit: 3658e411efcbb4df882763b09ae49efaa86585b4
[09/11] arm64: dts: qcom: sc7280: Add CDSP node
        commit: df62402e5ff9df1960622b4d7bc5dd43dc8e7b75
[10/11] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable various remoteprocs
        commit: 5ffc529fa5dfe428ab9a7866b58b964a376dd953
[11/11] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable WiFi
        commit: 16e84c137919dd91c1cb1102a3d536fce2d6ee94

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

