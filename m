Return-Path: <linux-arm-msm+bounces-3982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E96DE80A619
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:51:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A45BC28132A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 14:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F7B224E2;
	Fri,  8 Dec 2023 14:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NMyGGvr8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFBB1E529;
	Fri,  8 Dec 2023 14:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7495C433C8;
	Fri,  8 Dec 2023 14:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702047088;
	bh=oZazlu35FGl33bAmgGLk0gjDXlFaLMKUUL6nhzMSGko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NMyGGvr8nnocoVdTTf7cH1BT/N0uoRTUIVKR8Vj/O99E/XXj/QWf5IKxFNWxgeXTp
	 SOVqEb6FRxbggOnwhVVg5yeFqhWw+GLIDhdv2hHQvSj9OcmfbWUbHsTBqk34YjBsrh
	 geYE/fEl6O1ozpsLaUMQvOInB3fKxlrzZx5h1npblP+/l60Q0bV9WUfBBRwmHPwUZR
	 5O92m/ScT8bvjh/dytXBTfhMtqALe4vl6FAvjwaB23y5JlWNJdyXqwpr1ot6DYR2B/
	 f872WxhQJADs1kB+w1YrFQEoHLD6F3BSfCh/Lik8d0A1dRDqJd/zRoam1892TPqhUl
	 TSQzyOzP6XuzA==
From: Bjorn Andersson <andersson@kernel.org>
To: konrad.dybcio@linaro.org,
	will@kernel.org,
	robin.murphy@arm.com,
	joro@8bytes.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	Sibi Sankar <quic_sibis@quicinc.com>
Cc: agross@kernel.org,
	vkoul@kernel.org,
	quic_gurus@quicinc.com,
	quic_rjendra@quicinc.com,
	abel.vesa@linaro.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	iommu@lists.linux.dev,
	quic_tsoni@quicinc.com,
	neil.armstrong@linaro.org
Subject: Re: (subset) [PATCH V3 0/5] dt-bindings: Document gpi/pdc/scm/smmu for X1E80100
Date: Fri,  8 Dec 2023 06:55:35 -0800
Message-ID: <170204733628.342318.12423965421675968471.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231124100608.29964-1-quic_sibis@quicinc.com>
References: <20231124100608.29964-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 24 Nov 2023 15:36:03 +0530, Sibi Sankar wrote:
> This series documents gpi/pdc/scm/smmu/soc for the Qualcomm X1E80100
> platform, aka Snapdragon X Elite.
> 
> Our v1 post of the patchsets adding support for Snapdragon X Elite SoC had
> the part number sc8380xp which is now updated to the new part number x1e80100
> based on the new branding scheme and refers to the exact same SoC.
> 
> [...]

Applied, thanks!

[4/5] dt-bindings: firmware: qcom,scm: document SCM on X1E80100 SoCs
      commit: 696945e427e63ebbabad656893fb82da1ee2a980

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

