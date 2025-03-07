Return-Path: <linux-arm-msm+bounces-50647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB56A56EC7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 18:12:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 208351891CA6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 17:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12DB623F41D;
	Fri,  7 Mar 2025 17:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKZlJV5C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB6D664C6;
	Fri,  7 Mar 2025 17:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741367559; cv=none; b=WH6bvKkV4RurxVFHvRLuHa9AuWQBmhImM3kZk6utJUJX+iYLbFJX5qx3PyV4Y31BOAIkcATZTeS3KkRuq8fxoHpZyZzCEWIVdBVjRPE7vOg/QRom080vJBOFXqgcEDXZfoN7QUEsdz/gSNZJ/ouSSgg2mHg475nC/H4x2qudL8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741367559; c=relaxed/simple;
	bh=DmeybIg5QflF8n4Ai8iwbkFB064CUFl8u7QrxQL9rNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eVyPhRi4/izM3MG24GLkaRDy92IjOlz9y6at2AJDoOHKO2OKkD09dovRZtaJuDiHitec25Cwgy8M/rz9VWp/t4SZQGpSOQw9vBdTS1emJM7WVldB4XlAfJOft7yvaEpdeN94CHjTq9Htd7NC3r2fCU19xRLzRF/HBaygGS3HR90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EKZlJV5C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63E0EC4CED1;
	Fri,  7 Mar 2025 17:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741367558;
	bh=DmeybIg5QflF8n4Ai8iwbkFB064CUFl8u7QrxQL9rNQ=;
	h=From:To:Cc:Subject:Date:From;
	b=EKZlJV5C2lkL2hBtRVK6i/mh9nP/4FhB2j3c4BF/0ODDDaxWt8SURgWqDrBogScRi
	 bqBsz2RLaoOTzLlYtnYn9gTfkhFcBezD5hEgWmmzsc9qUhRq66Kd9lXgouBhyV12MG
	 O4jA4Tnv01R9Gzl22uNdj+DGBVX1hZpqRGA1nR5sKmrrWG/tZIHWEacy0kUNZ40Uq2
	 I8y7gDqYAbxWG8FgO3qwIc4htN0Z1GiKzl4DqghccQSfoEwhUmZtNzfZ7jgfHI5GVw
	 iqApcxsiHPCHr49nPgUDdKl7lm7og7c72LWJwj20Y7+HWTlZmkY/uRskLl7sQQKy7Z
	 KCKLNuhMEzu3g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tqbFV-000000001x5-0bJS;
	Fri, 07 Mar 2025 18:12:37 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/2] arm64: dts: qcom: x1e80100-crd: add support for volume-up key
Date: Fri,  7 Mar 2025 18:12:20 +0100
Message-ID: <20250307171222.7470-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the volume-up key on the debug extension board, which
can also be used as a wakeup source from deep idle states (CX shutdown).

Johan


Johan Hovold (2):
  arm64: dts: qcom: x1e80100-crd: add support for volume-up key
  arm64: dts: qcom: x1e80100-crd: add gpio-keys label for lid switch

 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

-- 
2.45.3


