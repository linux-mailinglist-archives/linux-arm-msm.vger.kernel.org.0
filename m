Return-Path: <linux-arm-msm+bounces-29112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 070A69585E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 13:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 390CD1C2420E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 11:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DACBB18E04E;
	Tue, 20 Aug 2024 11:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n3z7TcFI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81E118DF9F;
	Tue, 20 Aug 2024 11:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724153680; cv=none; b=YyMbPt8B8sTkKkLPkLfPCwfxwIUBGzMyeXjYxNmBt87JRaVZh4HI+B5z0us39XlryuS/WVdfNZWEXqSiaPtH/mA7+M5yoyP5UsPju43R7SDe65YJwYB0qmo4D5/JvQrAqHwrmE9abgvrWbqSDLCJAuW0//sO1klCMUgT2id0fJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724153680; c=relaxed/simple;
	bh=ANtOJyH0JV4o+Vunwy/aTAJ4hHjalojLyLOaxtkYHnM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hLjIBXJ9a2ORSYy169+q/DLfKQiXBjoXHU8q0pIK9ZP7y9rUYSdNruAQkVfzAdXGjGdlf675QxzeqsvGkkbXTiSkStZrcD8S3ZaCBuq0z8fqSxSnz1dVrHVC74aJBe1TRXJ5sUzrcJxRSZuF2JEfOtXcYlGFeBgni8UAk1Y6FlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n3z7TcFI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEFC5C4AF0B;
	Tue, 20 Aug 2024 11:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724153680;
	bh=ANtOJyH0JV4o+Vunwy/aTAJ4hHjalojLyLOaxtkYHnM=;
	h=From:Subject:Date:To:Cc:From;
	b=n3z7TcFIHPL8iXLzTlpTVWyhqqVoiF9iQqDZYpnVXsKMfCECigZ7bv+l+0N6aHuV3
	 a08JM+h0lfPfQFXO03a/B0nPpDhG3PRxs6MvNXXxEO4QkJTbCGugRxb20Zsc1swGtP
	 igW4d8mu38ZEg1J4UNnmPQJ3HyJ07lkynfG5GRrQL9xJVJg8EddNyV5J2U9dGryQzp
	 UOuFSeLHq7tKnLnnJBtRXn1nAN+nmg9rucjqrZ/hHZ+QNGEM6I/SZLHO5c0PDdJvMc
	 1slCSmIbvDmSgA3HiIDU8fKfygzeWJZsps6JmxamMf/by60J/bWgVEcxL7LxeZxGUa
	 2SY/y8dGmqUrw==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 0/2] X1E80100 multiport USB controller
Date: Tue, 20 Aug 2024 13:34:21 +0200
Message-Id: <20240820-topic-h_mp-v2-0-d88518066372@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD1/xGYC/23MQQ7CIBCF4as0sxZDaWnAlfcwjTFTKrMoUKhE0
 3B3sWuX/0vet0MykUyCS7NDNJkSeVdDnBpA+3BPw2iqDYKLniuu2eYDIbP3JTApVKcnpXvZcai
 HEM1M7wO7jbUtpc3Hz2Hn9rf+ZXLLOOtQzv2g5DBM6rq+CMnhGf0CYynlCxPz35+mAAAA
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724153674; l=945;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=ANtOJyH0JV4o+Vunwy/aTAJ4hHjalojLyLOaxtkYHnM=;
 b=K3bAl5PJMv9ZN1iDgh7XLgtzoKbG9FJwTpjVu9oR3uuopmboqbu44hYSdEiIEy921RhSlf1Sh
 uMg/YJP73GhAZP7wbIVr4j2Kp9xysicOPA3rt1ccglXDyhtBX/B8NlU
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

This series configures the multiport USB controller on X Elite. No
driver changes seem necessary, tested on the Surface Laptop 7.

Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
---
Changes in v2:
- Work around git pulling incorrect author address from mailmap (base
  commit in the cover letter is now screwed)
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20240809-topic-h_mp-v1-0-3c5f468566d8@quicinc.com

---
Konrad Dybcio (2):
      dt-bindings: usb: qcom,dwc3: Document X1E80100 MP controller
      arm64: dts: qcom: x1e80100: Add USB Multiport controller

 .../devicetree/bindings/usb/qcom,dwc3.yaml         |   3 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 170 +++++++++++++++++++++
 2 files changed, 173 insertions(+)
---
base-commit: 96ecf94c28e732cd5f576ed0906398cf0b1a67a6
change-id: 20240809-topic-h_mp-52839d894530

Best regards,
-- 
Konrad Dybcio <quic_kdybcio@quicinc.com>


