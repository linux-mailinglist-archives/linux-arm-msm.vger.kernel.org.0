Return-Path: <linux-arm-msm+bounces-28247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C96194D108
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 15:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F3A11C203D6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 13:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13300194AF9;
	Fri,  9 Aug 2024 13:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKp6A0eZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D766919046B;
	Fri,  9 Aug 2024 13:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723209514; cv=none; b=J05wsyU/pPVtnx9TO+yAITAIcERZvDq0hhkFDW+sbRM7Fm16s8oalhL10MFulkUjZ403Z9hNtn7ZMnoujtItz1D4Kmgq7oZlOVPFtDjsqwfTurA1CHTkv5QvHX2fS+zeQio3wq80tjsz6DrFLG8U4aq7Fw9HCPKlb8EgkCgoaBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723209514; c=relaxed/simple;
	bh=ubYam9Esqdt0mTjK0h87GkQKMgw4IPMjM/DAi1xFtlQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X98R7grn9vF0yajPadIt1K5Ph/sEsOIZRn0AHczvW3G10rc+8xmo7Q7JZp8DSfMfa7FNjpABah8wZGbQiWJ/uyZ954k7SV+JAon4REA15wKDLPqr8br6+ZbY7EoTPpVC0f/2ETwtAZMSTrSHBfXox7HOS68iWKKBEXiVU/INS4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKp6A0eZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7356DC32782;
	Fri,  9 Aug 2024 13:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723209513;
	bh=ubYam9Esqdt0mTjK0h87GkQKMgw4IPMjM/DAi1xFtlQ=;
	h=From:Subject:Date:To:Cc:From;
	b=RKp6A0eZwdEvktFb46x1Pah1kHHDE1Ikvjvk0RKlFt+o2zvg6U9OQ61VRRNf37iNa
	 hWoJJYneXTavcNOpLr07QUvwYr9WuS8oUn51pcSVMpx1pLpSmGSqddnOptbwi2HH95
	 jHPdBQlG6EtSnGr9+ptBH7BZ8IIdC5CJEwHLQmR802ufbCcEDG8XNX2ZzJGlgMNPfJ
	 0AnQR/lhDUOP/DeuhhjG4tEkRKiFK+QsOjEuQH1CMBv7XVp/HjGca9UkgvD1Df9F/Q
	 ocPhF80MkXZ4R5jMzA93gs6jGWcw7UlDBwRMmqfBwZlD+agbVCVqOZgORo5KwvHERg
	 RVFFggPA4WiOA==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/2] X1E80100 multiport USB controller
Date: Fri, 09 Aug 2024 15:18:20 +0200
Message-Id: <20240809-topic-h_mp-v1-0-3c5f468566d8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABwXtmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCwNL3ZL8gsxk3Yz43AJdUyMLY8sUC0sTU2MDJaCGgqLUtMwKsGHRsbW
 1AMGOhnNcAAAA
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krishna Kurapati <quic_kriskura@quicinc.com>, 
 Konrad Dybcio <quic_kdybcio@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723209509; l=698;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=ubYam9Esqdt0mTjK0h87GkQKMgw4IPMjM/DAi1xFtlQ=;
 b=SaX3UMr3H1Lm93bm13DtvN33UqHLlPg4MGdmpC0o1Ji/VM6TVVtrR6xQgOrcfcTQ1YugoE8Mf
 o9I9D5De3kJBcjEemv+CDBGWykC7cEiZON68NKf9TDe01XOBpfLh8EP
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

This series configures the multiport USB controller on X Elite. No
driver changes seem necessary, tested on the Surface Laptop 7.

Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
---
Konrad Dybcio (2):
      dt-bindings: usb: qcom,dwc3: Document X1E80100 MP controller
      arm64: dts: qcom: x1e80100: Add USB Multiport controller

 .../devicetree/bindings/usb/qcom,dwc3.yaml         |   3 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 170 +++++++++++++++++++++
 2 files changed, 173 insertions(+)
---
base-commit: 1e391b34f6aa043c7afa40a2103163a0ef06d179
change-id: 20240809-topic-h_mp-52839d894530

Best regards,
-- 
Konrad Dybcio <quic_kdybcio@quicinc.com>


