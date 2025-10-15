Return-Path: <linux-arm-msm+bounces-77326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD33BDD402
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 09:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A94224EDAC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 07:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0930315D44;
	Wed, 15 Oct 2025 07:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ve6q0glE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD51204F93;
	Wed, 15 Oct 2025 07:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760515038; cv=none; b=SPCMyq3QC97gRgLA+GdP3uVacmMF7ZWyGBqXG3Y70FJEae9gB0mhQMPZES3Rnlu1nyLQA3wf++ah5P/QkQpqPFuDYca4BMuracPvGLmt+YW+cl9hUcYDuYnCjnXU7qKj42IfMknZMzLPs7X0/wMiVoWLb9Z/kCJewxia4R0oNNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760515038; c=relaxed/simple;
	bh=rMnEeuZpMCkImx14rR1tVShIMUAHBX7I0M7cFmW3xpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fvu+au+cuw2RarGfRumoNaX5xh9Dhk0nhy3r4pzWCnb3+YCzGc3w/N3uUfdmlBWYc5cJ627JzmAZsUgUaJIwBpqMfgUxPdVucPFyzeZHW/j7TAaGeomWJ2DwBDpEVS041yJyNQowDzKz8ggg2QQk1j01k71DKQnOrDQSCB7KiGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ve6q0glE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BE67C19423;
	Wed, 15 Oct 2025 07:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760515038;
	bh=rMnEeuZpMCkImx14rR1tVShIMUAHBX7I0M7cFmW3xpU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ve6q0glE60nB1N4bp+RHIsBsFcExvMe5QADbqm2wMWZ5SrXInkbibKludyImf9Wcm
	 XcHJHpB2TqckuNst1SlmN64cNsntXk/m+iQL7ATdYEKlKYq9yLUdwkvRS0Bc9j+WNk
	 O4Hs3d2+EIZ84GCFJcHumwwKjc9Qbaxcz1GL0RbFiyn0TEgjj5GA9u/AJnKdk9Srdz
	 bd7KDNMfHAXcuxAW2B5WF6uIXWanQMMnephqVmU5JuPNDRFxV+ZA4ng0zDlkIjpfjZ
	 F/4YuOpPtcr6DAAXlC7dFyLQjIvSMfnVVAZW5YpIt7bzP5IiVoJKic8xF++8zKY1Du
	 I9pn2CxY701Zw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41413CCD185;
	Wed, 15 Oct 2025 07:57:18 +0000 (UTC)
From: Prasad Kumpatla via B4 Relay <devnull+prasad.kumpatla.oss.qualcomm.com@kernel.org>
Date: Wed, 15 Oct 2025 13:27:17 +0530
Subject: [PATCH v3 3/5] ASoC: qcom: sc8280xp: Add support for Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-knp-audio-v2-v3-3-e0e3e4167d87@oss.qualcomm.com>
References: <20251015-knp-audio-v2-v3-0-e0e3e4167d87@oss.qualcomm.com>
In-Reply-To: <20251015-knp-audio-v2-v3-0-e0e3e4167d87@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760515036; l=841;
 i=prasad.kumpatla@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=7/U4Jmg6F6SwnO1ioLzeT7uYh7ZGHfDTbAMIyQre+6s=;
 b=K6X3RdEJfWGR8sYxA4MQ/xdzWEyVsOkaF5QW088LX/DjGzeuZVLeB7AVTGOgsBe5Iw84Z6axJ
 tkhnxvK+W1wDkU+9F03IO6vNPGMSELD4YSy7V2JTP/ONe/J3cx0mYCf
X-Developer-Key: i=prasad.kumpatla@oss.qualcomm.com; a=ed25519;
 pk=I3mn8JNlYnnm7frqMGXms1Rm2H+0gpAfknMlnBYqCzw=
X-Endpoint-Received: by B4 Relay for
 prasad.kumpatla@oss.qualcomm.com/20251014 with auth_id=541
X-Original-From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Reply-To: prasad.kumpatla@oss.qualcomm.com

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Add compatible for sound card on Qualcomm Kaanapali boards.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 78e327bc2f07..aea8c1daff32 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -191,6 +191,7 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
+	{.compatible = "qcom,kaanapali-sndcard", "kaanapali"},
 	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
 	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
 	{.compatible = "qcom,qcs8275-sndcard", "qcs8300"},

-- 
2.34.1



