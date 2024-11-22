Return-Path: <linux-arm-msm+bounces-38743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B07A9D5822
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 03:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D557A28380D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 02:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94AE44CB5B;
	Fri, 22 Nov 2024 02:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MktxFL6d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DBD10E5;
	Fri, 22 Nov 2024 02:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732241694; cv=none; b=XoXcQU6Q/XO/b0r6TrQDCxlfAbuNwEzOm2V4F9dCppLwFMH6JBG2SihwZOQzW1x3s0feaSIkUY7UWkCWw0WSu35g0WOgf0Ez9FwtP31636hNf2vN6F1pqizcFWCHJIIUzhtnewPODp3P/8nD+TeU4gV18Br4N1+unC1xrmNsvJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732241694; c=relaxed/simple;
	bh=0tGRsxZ2XKgKY9LtaQHWz1qmiXM7FaFhcCu0WBJJUTs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A7tmRieGeE7UYpPkc/9ZcG2dluOeZ156QbZJtp53hg0A/6idqkjJ+ftG2vAaL8s1eS1zW8A0vk7x1MBQU62skBXDt7yLMrrCGzMtRbglQaCXrBt8n9/kTsSE07U50MfDRi90YzCFj56Pd1JnB/psx+mD0g60wSDg8SjKqCLIAXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MktxFL6d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 083A6C4CECC;
	Fri, 22 Nov 2024 02:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732241693;
	bh=0tGRsxZ2XKgKY9LtaQHWz1qmiXM7FaFhcCu0WBJJUTs=;
	h=From:Subject:Date:To:Cc:From;
	b=MktxFL6dSTI29O10YyiUXUUMPDu17xYdXmRyWtknJQYVFcL4u3k3PIec1hp4IdeOO
	 rSf2a2uUl+xnK5/eemlkLoj7cXb4tiM1WZiCYrwSPWolar9IjVyF2+h7HRnMPSHIVj
	 7YafVutVOws+82uQDKPVSw50Eb0nxALWJZPQJpjL6VoPuYNXJIFVSbLE0wShEdazsa
	 gTTbVebIe6DETzK5oIKK7AltHQFeaI85F82TDX4sYe8rbYhebrXH+gBUSHhXg+m79B
	 MBiePvwZNgxkEc9oOT2uFi1forMwrFF1SY1L+3xv+4zVy+OwDOKeOPGVkfvVy8O6aE
	 qNOxl68ew2cBA==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/3] More Surface Laptop 7 features
Date: Fri, 22 Nov 2024 03:14:09 +0100
Message-Id: <20241122-topic-sl7_feat2-v1-0-33e616be879b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPHoP2cC/x3MQQqAIBBA0avErBNyEsWuEhFiUw2EikYE0d2Tl
 m/x/wOFMlOBoXkg08WFY6iQbQN+d2EjwUs1YIdKSkRxxsRelMPMK7kThTd26VFp67SCWqVMK9/
 /cZze9wMqrxPmYQAAAA==
X-Change-ID: 20241122-topic-sl7_feat2-c79d32469a64
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732241690; l=737;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=0tGRsxZ2XKgKY9LtaQHWz1qmiXM7FaFhcCu0WBJJUTs=;
 b=Wu0liblFfEV7whjNjBGWMhlA1P4IqZvtb6lP2si5uPJnVd/36O3fVmM3/x0eq938A9VNgam/M
 3fB8cbi4EQPAFW10P3MFWWLhg9X/vAVUlJ5TXCzcRtmaMPNDYVyrrUb
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

This series does the necessary plumbing for audio (alsa ucm & topology
coming very soon), dual PS8830s and the PCIe3-mounted SD card reader.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (3):
      arm64: dts: qcom: x1e80100-romulus: Configure audio
      arm64: dts: qcom: x1e80100-romulus: Set up PCIe3 / SDCard reader
      arm64: dts: qcom: x1e80100-romulus: Set up PS8830s

 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  | 532 ++++++++++++++++++++-
 1 file changed, 526 insertions(+), 6 deletions(-)
---
base-commit: decc701f41d07481893fdea942c0ac6b226e84cd
change-id: 20241122-topic-sl7_feat2-c79d32469a64

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


