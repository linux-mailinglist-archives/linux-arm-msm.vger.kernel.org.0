Return-Path: <linux-arm-msm+bounces-50948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BD1A5BF9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 12:47:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0A38176A17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 11:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AEA324167A;
	Tue, 11 Mar 2025 11:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UPU7SL2Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7961D514E;
	Tue, 11 Mar 2025 11:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741693628; cv=none; b=kJiDDwVN0vBi/9Mh3nLssos46+VbhefOmcaJrrYpnF2uCke88p4mNBBo8UkT7V+XVKRxvhHALm5kPNLlVwPKSBmjcb4MorafrFkZ7CkkME1QNw57BR1gsdvTqu5KVqFe4z+bPgg/4gxQN7VZ/Ha4x0WASB3aMVsyG5te6SEl8fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741693628; c=relaxed/simple;
	bh=yRXYXZ9rV06lyaY2T1O8v8n5tymGv/7bHYuzwvkdyUM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lDUQmaWu89XEv6x6Vd9oNoXnc0ap1xrm+c8+RqmXePxcrOwcg0cQIl4c9ssG4S0ofgTGnq4j4x9ZKDtuar3MfMnI3MpMLEuABErNOEw+L/AXZfL6K1DDKsraofhiy9hPtkQWARCX9TjsLL7t0msakL4pAUq7HMqOj4R/Ne+2hvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UPU7SL2Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79ADFC4CEED;
	Tue, 11 Mar 2025 11:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741693627;
	bh=yRXYXZ9rV06lyaY2T1O8v8n5tymGv/7bHYuzwvkdyUM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UPU7SL2YxU2IXg0KW0RA96lOpuGU2yP7b9nBu990Wtx7QV1nktI6c9jkCjx8VII/y
	 q0Feq0mpHXEgcnbsr2Aef8DasQSJuZZoKNNZh+HZFk/14QJgRr3BxDg/MAqh1lc8n7
	 Ap46k9a6tsPn1458AnKmZhJEOdiUU499KHrtMRTllw/zIM7V6WD0/VxzwOBgpvoMl2
	 SUSWkhoD6lMZO0DhR44V6ty4MXIg/FcWfrnLHWsO6XQ2Q5WYZPc/WBCctb/7WttMX/
	 Pd5wIBZaxYWr4OW1RyzEAZcSe2pfb6TFJ7FHtMn7Qi8cEu6mxZKSFSDjpi9LoTxbw/
	 IymDnNrxvAuqA==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>, 
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
 Trilok Soni <quic_tsoni@quicinc.com>, 
 Melody Olvera <quic_molvera@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manish Pandey <quic_mapa@quicinc.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250310-sm8750_ufs_master-v2-0-0dfdd6823161@quicinc.com>
References: <20250310-sm8750_ufs_master-v2-0-0dfdd6823161@quicinc.com>
Subject: Re: (subset) [PATCH v2 0/6] Add UFS support for SM8750
Message-Id: <174169362014.507381.5528834930288014855.b4-ty@kernel.org>
Date: Tue, 11 Mar 2025 12:47:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 10 Mar 2025 14:12:28 -0700, Melody Olvera wrote:
> Add UFS support for SM8750 SoCs.
> 

Applied, thanks!

[1/6] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: document the SM8750 QMP UFS PHY
      commit: 12185bc38f7667b1d895b2165a8a47335a4cf31b
[2/6] phy: qcom-qmp-ufs: Add PHY Configuration support for sm8750
      commit: b02cc9a176793b207e959701af1ec26222093b05

Best regards,
-- 
~Vinod



