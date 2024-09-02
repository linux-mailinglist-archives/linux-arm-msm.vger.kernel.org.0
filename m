Return-Path: <linux-arm-msm+bounces-30400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A3B968A46
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 16:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01DA02831E3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 14:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E1B364BA;
	Mon,  2 Sep 2024 14:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MS4WPfiS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFD01A263C;
	Mon,  2 Sep 2024 14:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725288640; cv=none; b=YNU4CZ9ulhb/sdZFuUEtD9C/4TRqfYxtztpp9rfLoKDDCdX7n2vOLyuD8h/2zCkEhZFeI1D4ekgmVQQ8zQeD45m1NaIQC6gLiU2RaLptcIt7fJ6JtOSqEYQpGjyTFRgREQR6GaamBCWSluRTFqvhn6ovyny1bKg6XP6KL22iQAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725288640; c=relaxed/simple;
	bh=l8gJUHRh/Nbcy3WVWR0sFIxz/7VA+j66L2wTsSiINA4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YzJCkqCOOR175BlQ2qJjPW3TWqjvrrypJSnZKGQNembTE50OeSzG/fqZGaCpYWTskpcdYwradWFcwuu2udui7Bu5aaxlFGfPUO+khzCGVLjFwuoF8Ucg9IXd4f546fXrGdMl1TJGmT8YDgqhD6a0JWudBwsEq86wa3hlyHAaXwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MS4WPfiS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59F4C4CEC2;
	Mon,  2 Sep 2024 14:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725288639;
	bh=l8gJUHRh/Nbcy3WVWR0sFIxz/7VA+j66L2wTsSiINA4=;
	h=From:Subject:Date:To:Cc:From;
	b=MS4WPfiSSDgFjAtlR2c+63y0AyAzkqY0WlEY77prfXmIYFwxdGhOMee0RMeMgzFvp
	 aklypt1PndJbvS0Qn0tgSuJcFhd6aMK7fhWHxI/pkLLJhxp6QiFMZBo2jc+1eeo+wd
	 L65tljEEL9o5pm2UMD6jyN2sly7u5cPWbk1KSI8UAC2bciPzmepCHCe/hCRt8BK3F/
	 I25wmwCRWvx26EsR7gj8um+DjOrho/lgkisd2FlNjoFL198/6iNLCMqXxGz2+mkzvx
	 ZAwSErf5/go52QQTkDKPB+hqULSWXuOTQ/MTkExWvWnb2lM/uFMePenDBf+qaC6/xy
	 Qk+jHA168sBsw==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/2] More Surface Laptop 7 features
Date: Mon, 02 Sep 2024 16:50:32 +0200
Message-Id: <20240902-topic-sl7_updates-v1-0-3ee667e6652d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALjQ1WYC/yXMWwqDMBCF4a3IPHdKGu9SSvdRpMQ42oBN0iSKI
 O69QR//A+fbwJNT5KFJNnC0KK+MjnG7JCA/Qo+Eqo8NnPGM1YxjMFZJ9FP5nm0vAnmsalZ3Q1H
 IvCsh/qyjQa2H+WrPdvSbIx3OEb7kvTjoJrkfcpUy1KtFG3TKOceFI8NMFn2Vp7kcCvmclBbOX
 I0bH9Du+x9xqPShuQAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>, 
 20240830-nxp-ptn3222-v2-0-4c6d8535cf6c@linaro.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725288635; l=883;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=l8gJUHRh/Nbcy3WVWR0sFIxz/7VA+j66L2wTsSiINA4=;
 b=w/JLkTaddEjp2S2uSTv8MMZ1wcKB8oYaXT4FW0QyAJtO6XtqGd/vI7UkFK3X4wC7Qat/6CWjp
 behaQ+aQsKFDtZIvva6aqgrUjOQ8x/BPOG29DQy4zxXRaTw6kdqJ3gs
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

This adds MP-controller-connected USB ports and lid switch support.
The dependencies are marked with b4 tags.

More yet to come, hopefully soon

Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
---
Konrad Dybcio (2):
      arm64: dts: qcom: x1e80100-romulus: Add lid switch
      arm64: dts: qcom: x1e80100-romulus: Set up USB Multiport controller

 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  | 82 +++++++++++++++++++++-
 1 file changed, 80 insertions(+), 2 deletions(-)
---
base-commit: ecc768a84f0b8e631986f9ade3118fa37852fef0
change-id: 20240902-topic-sl7_updates-8909bf66c5b7
prerequisite-message-id: <20240830-nxp-ptn3222-v2-0-4c6d8535cf6c@linaro.org>
prerequisite-patch-id: 69039c4c0e330e53885c6b3564d99f0a4aedc178
prerequisite-patch-id: c910914c40326e1d4b8c65ab785c56f10bba2e91

Best regards,
-- 
Konrad Dybcio <quic_kdybcio@quicinc.com>


