Return-Path: <linux-arm-msm+bounces-3975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A50D080A606
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CAAB1F21431
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 14:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3CAC208D0;
	Fri,  8 Dec 2023 14:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5wMjlh+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44C61E4A9;
	Fri,  8 Dec 2023 14:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F7DC433CA;
	Fri,  8 Dec 2023 14:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702047079;
	bh=DICmne1+Q4nMyRwTfcHeDogcRF43p5yY2id5Vrnb/XM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V5wMjlh+PGVBUiTkQ0RMfG8ox0WL+KmWtv+R8ufM19UUH15cBFAyeD1wN8x6fbdNX
	 yWA04Gs8QrcIkiYU9BhuhaJWcfL18XyoYPiJaJbOfAJDRcpUzTfPqz0CQNoL36N3Xe
	 d9hPy4yI0/TIvN2TBgrdOeefMG5b5iFPDpAT/9kEcKifbmuEYK2hnNzdgT8TIqJ0lq
	 4Qq2vV66uScCsc2aq4yFCknHSRy0Iv3AaYCTdC8eCcYq9sBuuzGAeuDpMqsYXYLZhi
	 eNeMAU6E7rJ8fAEyGZbmJGB6N00Z6jIcikO7NKvA0l7A2FnSPp8HBJBvSHEmPYY8ag
	 2Oyfy63BYquBw==
From: Bjorn Andersson <andersson@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: firmware: qcom,scm: document SM8650 SCM Firmware Interface
Date: Fri,  8 Dec 2023 06:55:28 -0800
Message-ID: <170204733608.342318.8817176141039380578.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025-topic-sm8650-upstream-bindings-scm-v2-1-68a8db7ae434@linaro.org>
References: <20231025-topic-sm8650-upstream-bindings-scm-v2-1-68a8db7ae434@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 25 Oct 2023 10:21:56 +0200, Neil Armstrong wrote:
> Document the SCM Firmware Interface on the SM8650 Platform.
> 
> 

Applied, thanks!

[1/1] dt-bindings: firmware: qcom,scm: document SM8650 SCM Firmware Interface
      commit: 6da02af3f910bbcdd2914050cfcab1a9d7980494

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

