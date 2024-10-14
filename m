Return-Path: <linux-arm-msm+bounces-34299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD08699C64F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 11:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE12C1C216C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 09:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53934158A13;
	Mon, 14 Oct 2024 09:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IvhX30Se"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033F2157494
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 09:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728899263; cv=none; b=cC/kuZ5+UcZ/abyhAG3c4l5Aw1ytIZ7OHGeU+Yo8M0P3Dm3hJ0NSRolLjoR8Gbr29+AoebF8Kl8SBEEmp7f/cQegQ2W8S0QQIhRr6g67mOuL3nlSJfcl9QUe5RbKSjHIDEId44QPfr4NQ6y3YUrmYNBZcqXyRyEg5ZL35B10DEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728899263; c=relaxed/simple;
	bh=3mQ8bkD8qZROyouOc2p1vldj1dScaVgOW/KJ2GuiqPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H1odl1FyDSfy9e7ikeZSnCd59Fa/QNp08lAlzh9tnTVlE2sIif9SvTR7Kw0oO815C5OA2bTQ1iKxSY9mldLfzto5NjU7fnpfG3u+ipWwseQkt2S7z8tGhMMWLrSt3opRlOyuOiDHjkXDmGbXE7USqT+OVzyKg1E/yalOdWfDoXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IvhX30Se; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3493C4CEC7;
	Mon, 14 Oct 2024 09:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728899262;
	bh=3mQ8bkD8qZROyouOc2p1vldj1dScaVgOW/KJ2GuiqPc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IvhX30Seh8CC9RSX48hrYl7wkhTL9QwDPhR1LMd4ecGBQ8k5LYmKNNuipWW9ejJIs
	 9kC9E+yMf1XQy5uHPGtMtVC/Hhco7bY1xKD9cZeWw8niBagX7+9zfO9UTqsts43eop
	 caYEGtgNdvat6VwySSqI+oKGQFUw8IMo9SnHxCMdBwreFpIkpRXM3j1iDq/qFIuDrl
	 5gZjpSBX4cvnSnPzemhWTwSkc7HDtuCHegejgvPUFTY24pNIlw0rveJsBwX5Ff1OCU
	 LJZBXkByJ/GdwHTEI4UmgjIvXY59ppXZHYQCFtsBxA8trnJGTyc+yhBO2hURMRPHZe
	 D7tYbWswBExMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD1BCFC534;
	Mon, 14 Oct 2024 09:47:42 +0000 (UTC)
From: fangez via B4 Relay <devnull+quic_fangez.quicinc.com@kernel.org>
Date: Mon, 14 Oct 2024 17:47:32 +0800
Subject: [PATCH 6/6] dt-bindings: display/msm: dsi-controller-main:
 Document QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-add_display_support_for_qcs615-v1-6-4efa191dbdd4@quicinc.com>
References: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
In-Reply-To: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
To: kernel@quicinc.com, quic_lliu6@quicinc.com, quic_fangez@quicinc.com, 
 quic_xiangxuy@quicinc.com
Cc: linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728899260; l=941;
 i=quic_fangez@quicinc.com; s=20241014; h=from:subject:message-id;
 bh=QzSZ/Ct5mHITxFIkGSeEs5PMumalxJtc+YuO5VAUQ7g=;
 b=iWvhASurjdF1/1luSnheYQptvyFB9TxLx0geZPd6BRJpPrdfEBsfgUZMIczWyB6R6/C3KIY9Z
 VpYYGu7jodvDT+7SGmNZUXchYzcgoj5wXbB0kvqbb8JX5JIeO+YCSXd
X-Developer-Key: i=quic_fangez@quicinc.com; a=ed25519;
 pk=tJv8Cz0npA34ynt53o5GaQfBC0ySFhyb2FGj+V2Use4=
X-Endpoint-Received: by B4 Relay for quic_fangez@quicinc.com/20241014 with
 auth_id=245
X-Original-From: fangez <quic_fangez@quicinc.com>
Reply-To: quic_fangez@quicinc.com

From: lliu6 <quic_lliu6@quicinc.com>

Document general compatibility of the DSI controller on QCS615.

Signed-off-by: lliu6 <quic_lliu6@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index b0fd96b76ed1376e429a6168df7e7aaa7aeff2d3..4142c753d1c4c4797e3a3f5317c02f8c863cdd12 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,sm8450-dsi-ctrl
               - qcom,sm8550-dsi-ctrl
               - qcom,sm8650-dsi-ctrl
+              - qcom,qcs615-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290

-- 
2.25.1



