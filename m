Return-Path: <linux-arm-msm+bounces-81105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E35B5C489AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 19:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DCAF3B9F23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 18:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EDE332D0C0;
	Mon, 10 Nov 2025 18:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Xo2Nsqbw";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="NvqIc479"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798B4329E67;
	Mon, 10 Nov 2025 18:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762799450; cv=none; b=eM9rG8LcHzDxa+1/McHBgNmtFVXcKsdZvj0min+TXgWLxmt92gsrEOB3cfRIK9zsftr4qKMlB9lKKlRN1QWCw8eu+gfezY0Rp9BHfs82x7zWIEHCpEyMGpylCk7JEXwhwjTXgm2xOHxNd5I60PHMja4oLzETNSDDwvWm++Fe5Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762799450; c=relaxed/simple;
	bh=r6hjCFY7ZDfh8HONhlJU3D/wYlGjhLFGXKeOM2SCKyY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BsU+TTLe8lf9SJEEL3E7GJW9Uj05JA5DvIAQtyCpisAsYn4RSLR5JcriyG0u7IdaQ6U+ROdZrXpwtzWIdXF1sNTyqCahs/9hmuTPbJWlbgFaMEEgoUb4usNC7MDWi4HrlIzlJlMkvk1pT+uM6qLy3w3+bf8OfYv3M7QXfPTapR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Xo2Nsqbw; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=NvqIc479; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1762799389; bh=31Nk15njuGNIYaJvc37e73N
	QXmUsWSKUyoBRg+NCptg=; b=Xo2NsqbwNspgbJaG/FeBgd8/X0SMKwTgngQNC3h0aiMGgOFJFF
	IuDcSVur0Ee1drhmJaUnjL3oE7wE38n2VHRukRFFiI3lyd/ar5GbThC1TkvEDgyq7Uz99ELK7h7
	7mtG6Xza/BGCumoLn0plCChY14z2tYToJ4xlwvObGGsbet8i6ejkCtESUJfy3jhTSrBbYLuHwpA
	u8nTL2ON3qGLncJtmW5mcliFp3YkjixoUo8oB9M/4E42cVDv1C0lr7bho7yqGjXigIyFDlcvfxk
	IlvWUGFrRs1kopxLcFWsz6W77/tEUzcDLUj7BeKqVQ94JSugw1vSmYG4WbQUtM++Mpg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1762799389; bh=31Nk15njuGNIYaJvc37e73N
	QXmUsWSKUyoBRg+NCptg=; b=NvqIc479J2hlHJFLojgrh5XyxhLrPVBWyl6OetjooMq0O8rqkZ
	Lq1PTP5ZNPdWX/6msyItHMp0PThWWFePixAA==;
From: Nickolay Goppen <setotau@mainlining.org>
Subject: [PATCH v3 0/3] Add SDM660 cDSP support
Date: Mon, 10 Nov 2025 21:29:42 +0300
Message-Id: <20251110-qcom-sdm660-cdsp-v3-0-cc3c37287e72@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABYvEmkC/33NTQrCMBCG4auUrB1J0jamrryHuMif7YBNaiJBK
 b27aVeC4vL9YJ6ZSXIRXSLHaibRZUwYfIl6VxEzKN87QFuacMpbRpmEuwkjJDsKQcHYNEHbKds
 KKQ6KSVLOpuiu+NzI86X0gOkR4mv7kNm6/sEyAwq04Y7L2mre6dOo0N/Qo+/3IfZkFTP/VLofC
 l8VW2ujGyGto1/KsixvrQPQT/sAAAA=
X-Change-ID: 20251018-qcom-sdm660-cdsp-59ad56867a18
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, 
 Nickolay Goppen <setotau@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762799388; l=1097;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=r6hjCFY7ZDfh8HONhlJU3D/wYlGjhLFGXKeOM2SCKyY=;
 b=fcdDXLO0PLxddxH6w0ZXBjGqx18n7GGwDSgBV3tNeZXhwEpmnSwf4mpHiIE8Q2FUSI30AP1lz
 Eq5MXPiQ0thAJqTIWfBPrHgRc4Zpm0fMnUBN5FOpmUVPMVq/7lV48yp
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

This series adds an ability to load and boot the cDSP remoteproc
found in the SDM660 SoC.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
Changes in v3:
- Resend after 2 weeks passed with R-b's and T-b's added.
- Link to v2: https://lore.kernel.org/r/20251019-qcom-sdm660-cdsp-v2-0-0d3bcb468de0@mainlining.org

Changes in v2:
- Added missing constrains for both aDSP and cDSP.
- Link to v1: https://lore.kernel.org/r/20251018-qcom-sdm660-cdsp-v1-0-042e283db29b@mainlining.org

---
Nickolay Goppen (3):
      dt-bindings: remoteproc: qcom: adsp: Add missing constrains for SDM660 ADSP
      dt-bindings: remoteproc: qcom: adsp: Add SDM660 CDSP compatible
      remoteproc: qcom: pas: Add support for SDM660 CDSP

 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 8 ++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                          | 1 +
 2 files changed, 9 insertions(+)
---
base-commit: 93f3bab4310d4ff73027cc4f87174284d4977acf
change-id: 20251018-qcom-sdm660-cdsp-59ad56867a18

Best regards,
-- 
Nickolay Goppen <setotau@mainlining.org>


