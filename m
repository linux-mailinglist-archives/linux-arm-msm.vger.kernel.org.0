Return-Path: <linux-arm-msm+bounces-3980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B969E80A612
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:51:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 629561F2149A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 14:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5853200C4;
	Fri,  8 Dec 2023 14:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s7X1ftpb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A7720311;
	Fri,  8 Dec 2023 14:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488F9C433CA;
	Fri,  8 Dec 2023 14:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702047085;
	bh=hNZjQ8qcDkauJDqxcLLqCSBo8RI3dmQ4UqI8UDA79Zg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s7X1ftpbVkWuVF10k7mILfvrWf7WwPk+6shvkYw69Ozz8LUSL3MPIyZawb+RmhzgX
	 B519yv5wr6P1d/Du/QCsgxKMgDrjcHeZ1kpVfS2EZ8zsbFvhmHeCeXBc7vDL39iXCA
	 68sDhqxR9dovec17eZF7z2fJ5lqnghzK/JGJa75CywBdmikIU9nbdc93oiVtJ8lz3t
	 LdNP/M/GKeORcq6vaKeZ1+Fyi/LpJG47f6YOQa8tJCBajp1pV7Bpo3worNwPVKfqcZ
	 Tkq8XD2C9UHAAlgO50Ry73JqEUsczUvuywIao62MENbS8uxiE6lvUE6xU1+oeO1w9s
	 CmZ/foz27+Qlw==
From: Bjorn Andersson <andersson@kernel.org>
To: konrad.dybcio@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	Sibi Sankar <quic_sibis@quicinc.com>
Cc: agross@kernel.org,
	conor+dt@kernel.org,
	quic_rjendra@quicinc.com,
	abel.vesa@linaro.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_tsoni@quicinc.com,
	neil.armstrong@linaro.org
Subject: Re: [PATCH V2 0/2] cache: qcom,llcc: Add llcc support for X1E80100
Date: Fri,  8 Dec 2023 06:55:33 -0800
Message-ID: <170204733623.342318.1278236860389654377.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231117095315.2087-1-quic_sibis@quicinc.com>
References: <20231117095315.2087-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 17 Nov 2023 15:23:13 +0530, Sibi Sankar wrote:
> This series adds llcc support for the Qualcomm X1E80100 platform, aka Snapdragon X Elite.
> 
> Our v1 post of the patchsets adding support for Snapdragon X Elite SoC had
> the part number sc8380xp which is now updated to the new part number x1e80100
> based on the new branding scheme and refers to the exact same SoC.
> 
> v2:
> * Update the part number from sc8380xp to x1e80100.
> * Pickup Rbs.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: cache: qcom,llcc: Add X1E80100 compatible
      commit: e9ceb595c2d30edb2879f173f8d0dbbedd5e301c
[2/2] soc: qcom: llcc: Add configuration data for X1E80100
      commit: b3cf69a43502a8836b6d615c8aba05b88f00d8d8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

