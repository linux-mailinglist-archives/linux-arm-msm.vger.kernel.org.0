Return-Path: <linux-arm-msm+bounces-25437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A2492958F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jul 2024 00:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75EB71F21727
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 22:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59221494CA;
	Sat,  6 Jul 2024 22:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DPifaK64"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D2014901B;
	Sat,  6 Jul 2024 22:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720303306; cv=none; b=ll/M8QrhhdgKBa6mhvS9nYahrZbTZ+qkSZXW67XIc4g2Mp7N2gAW0AyD7EM8m0LhgSpMIqXn1wy0BbsJNKKcvmUSMgsqnZMytlMuYg2oDOvKMQSZcgB26XIFD2c5Lsw4E5somqWRYrBXVXls2gqQgasCzUbclgho7Fd9+uNRm5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720303306; c=relaxed/simple;
	bh=ePJh3+Ne745NCmr6nKsuv12wrAyiUwTKvImIFCXbgPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WttBeRdZdumaem1HJzpcnZnNZXCQgd3dCx6hiM0VF58gQO4IGZsWxbgAfuvA8fM17XcGb0WFevtUxFpOfVTiL9J20NXfFqg571fYXmEoYqhYVOEZMI0hmS14hzxODpC6T6faKw1AKq1Pozm1lhAmjrpr6FEFUuub/mkD/IaD0zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DPifaK64; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51CAFC4AF0E;
	Sat,  6 Jul 2024 22:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720303306;
	bh=ePJh3+Ne745NCmr6nKsuv12wrAyiUwTKvImIFCXbgPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DPifaK64tLk0jiUlV16+PViEF76M3PXYUBnFQhFKeo77XSbejHPPi89WwmISizHOw
	 WuBdL/s6J3szZl45Dk3YfuHwea4xTGp/I4sFhCzkfT2GKlbiTt11j3yVDT36XIniHm
	 uK+XIB+IXJ1K2fRJEq0VR0L/9Lb9MX2iPAqUcNW0Mi/apOqjPaYAhJPLiyPWUOVmes
	 3PQhiWUYawG2vO7zk6B5F6L9+yLS1JPSgdPQUglDL1DuZ8HMqCE9Lz6Ds6U6NgJxZK
	 jWwBiYBhbFTGDgp+RUOixbpOBA3qCVeURPwpJf6zhAY12lUpKjPQa+QeihRMEwM2Si
	 Gg2uhXOYvfdaA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>
Subject: Re: (subset) [PATCH v4 0/2] Add DT support for video clock controller on SM8150
Date: Sat,  6 Jul 2024 17:01:28 -0500
Message-ID: <172030328813.28909.17799012486731501951.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240509-videocc-sm8150-dt-node-v4-0-e9617f65e946@quicinc.com>
References: <20240509-videocc-sm8150-dt-node-v4-0-e9617f65e946@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 09 May 2024 15:54:02 +0530, Satya Priya Kakitapalli wrote:
> 


Applied, thanks!

[2/2] arm64: dts: qcom: sm8150: Add video clock controller node
      commit: cfe9685473add0ae76952f0eb54489c3547db335

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

