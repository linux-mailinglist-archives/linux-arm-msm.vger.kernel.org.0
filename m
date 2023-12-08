Return-Path: <linux-arm-msm+bounces-3964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE4F80A5EB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:51:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D910C281168
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 14:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8A2200B6;
	Fri,  8 Dec 2023 14:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EC4pKFyO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617911F959;
	Fri,  8 Dec 2023 14:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F34FC433CC;
	Fri,  8 Dec 2023 14:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702047067;
	bh=OOSG2z2H6unvPrg8WJZMqPGKC5UIGuJtfqrzdP2lRYI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EC4pKFyO5VaHe4xsYYtycR5gLba7A0Ij/M6At7MUNL4bgqlu2S7H4fqpH6iPTsUDC
	 /LDu1p6sgrN5T1LvL+LPTFnnuTOtVDSKvDnTdWXcuP1i2d8eaUIya4aheS24Jqgi9b
	 942MldcpSRuT+RURtoSR8JsAWkWIASPc6gNOYG/dRGY7lUS+4g9yr10FG31r4P9i7E
	 MdMNNTlGbMT8R/IjhkbLs/tMxSIR8Z0l5aS9i5+6nfo5Jjtu2X8qg3FU+yZESYn3oG
	 B6WFasUp2V1+t/qmEMlzOgWSe1jdi+Qyzn58I3KH30GvepgFF7qAIjIhoXcYCeeFKh
	 OB96OoSR//WJQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 00/11] ARM/arm64: dts: qcom: fix USB wakeup interrupt types
Date: Fri,  8 Dec 2023 06:55:17 -0800
Message-ID: <170204733623.342318.1053426997273097691.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231120164331.8116-1-johan+linaro@kernel.org>
References: <20231120164331.8116-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 20 Nov 2023 17:43:20 +0100, Johan Hovold wrote:
> When testing a recent series that addresses resource leaks in the
> Qualcomm dwc3 glue driver [1], I realised that probe deferral can break
> wakeup from suspend due to how the wakeup interrupts are currently
> requested.
> 
> The following series fixes this by no longer overriding the firmware
> defined trigger types for the wakeup interrupts:
> 
> [...]

Applied, thanks!

[01/11] ARM: dts: qcom: sdx55: fix USB wakeup interrupt types
        commit: d0ec3c4c11c3b30e1f2d344973b2a7bf0f986734

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

