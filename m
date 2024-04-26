Return-Path: <linux-arm-msm+bounces-18688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED2A8B3F6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 20:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A67EB2100C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 18:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F3323772;
	Fri, 26 Apr 2024 18:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvsVv+/X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151BE187F;
	Fri, 26 Apr 2024 18:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714156459; cv=none; b=Rlx4MMUWIcbI1PCtPeSIRF4I2MePfuMNplTSX/HM6TYFrv0/8hVnU1kvQNHa8QxX/JWiXC5WXxl1JhBS4/kyArsGaA1RDOYwMxk0h41theh6ume4x7A2EKVKb/5kedGgKnXmyDWZzcJCOmNYB1363n2FSuEyXcAeQbxpxiZtd+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714156459; c=relaxed/simple;
	bh=FgrHStJWxmpAEZMZ2wgWBGQcbCI/vHyX2Dufg6pXZPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UhXxysR8uEv565iIgpQmWgbuEc0nQhqErdA9dE1stMqfS2UMXMvcZRtAHU5iE3lJVqEd41VqOKWEJ0AHF0w61MW5fS/2pKYdd4+nPPMCtiFvxJ17oun7RtkG1vlSfO4VbK/FM5DfBk6P4bscPQjqnKDi/QIbW9G88eIQCKzMAlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvsVv+/X; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3476dcd9c46so1831103f8f.0;
        Fri, 26 Apr 2024 11:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714156456; x=1714761256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LHO9+s7dwYbcvg43RH/XhbKltbb5WXC2wNCdO0hOUOg=;
        b=jvsVv+/XgU9XnAFmTritJIzdkzMfUte9YhM7pmKMG57r8jxVlMfuvPLrfXG0079nkZ
         EC9kiGelah6OMpOo3gEjzFPQO5QMN7nDXZAn/Wmj+xFVBu3mcT4NsbThgH01qptHNi8x
         5dVM+ZS/tAIwBh6u/bR5KIff/MHn45B32loTbupONfeDj2zb00fGsCZgyUp76Sc2OJOF
         DZv2OCOwy++4g7prWx0GUpPD4NNKKnZv5AGtJ+Noe+aPn2m4EuxcPJibFEBviv4ADraB
         3jBIJLf7c7tiRMxEAJWavjRRaj564aCHTJn/dY310lwdguR0eHGVdwE5+pLgheBdWERY
         X9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714156456; x=1714761256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHO9+s7dwYbcvg43RH/XhbKltbb5WXC2wNCdO0hOUOg=;
        b=ZEjs1BtTzlnnAXGp5eO4Ard8ZXdeCrWAFEODSioixNyE8mS6XDlblWA96BF2JUKYnG
         OvVy1fm2lQSHQZrIEQOZ+o0alzhRJ0LXP8mu0dsvseqrhQYS65vc6RIea+CrNWE7OmfA
         0O3gdHuswXLF7ZDJ0e7fS6qD1eFts9zKUm5nnqNLfSzyxWHDGQGp5q42B/62YnoIaQqs
         Z3kT5tYMBe6bt307V2M/f+S8QYCyM8aAIREUVuZ7WnQ0GgQVx2RjIkQ2oAxUikalFUZr
         w/BrTuP6NICeLz+rHJzm/1NLzNeQmWYYSVtW281SjZXofX0Rr/Nc67/cMlIerUIewzdY
         seKA==
X-Forwarded-Encrypted: i=1; AJvYcCVVbq8akeq8n14lPGPDXyhPX3inavv5dlvyMS8eYmr7PtoMwdkSCKGgyL+lUXwi0+101KFcqb/tYC1MpJN/4Px6bY/53c8ueamzcA==
X-Gm-Message-State: AOJu0YxNAvmyV/VnV5h27nq7Je21iPMBkkXu0ZPgFp0sElAbJL9mB7LI
	TxS5cCip0Mtk1Dbxp1QXmwdCFYGPvHcA3UUZ+QFrhGW4QCminpHW
X-Google-Smtp-Source: AGHT+IGxvOS371JZ578NXDpkxx1Yp7GpdcbmBlSgZtXYx84NZcLNH1r2vDIeMNa63gFlwJSCWfet6g==
X-Received: by 2002:adf:f007:0:b0:34a:74b7:3d43 with SMTP id j7-20020adff007000000b0034a74b73d43mr2330713wro.21.1714156456299;
        Fri, 26 Apr 2024 11:34:16 -0700 (PDT)
Received: from [192.168.0.20] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id b8-20020adfe308000000b003436a3cae6dsm22982701wrj.98.2024.04.26.11.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 11:34:15 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 26 Apr 2024 19:33:59 +0100
Subject: [PATCH v2 1/6] arm64: dts: qcom: sm8650: Fix GPU cx_mem size
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-a750-raytracing-v2-1-562ac9866d63@gmail.com>
References: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
In-Reply-To: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714156453; l=916;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=FgrHStJWxmpAEZMZ2wgWBGQcbCI/vHyX2Dufg6pXZPQ=;
 b=m7MzYEAOpzrakl0SmAdytTqsZxLHqiZxrkiMz7wap9RAwiDRYGRd8S2J3FJ9jrabgSw/PpAxC
 LCzkL3UFGbmDAQrltzOWNnlW7GKGkiOmoWj+wSgdFnEa0GoNzcDRMqp
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

This is doubled compared to previous GPUs. We can't access the new
SW_FUSE_VALUE register without this.

Fixes: db33633b05c0 ("arm64: dts: qcom: sm8650: add GPU nodes")
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 658ad2b41c5a..78b8944eaab2 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2607,7 +2607,7 @@ tcsr: clock-controller@1fc0000 {
 		gpu: gpu@3d00000 {
 			compatible = "qcom,adreno-43051401", "qcom,adreno";
 			reg = <0x0 0x03d00000 0x0 0x40000>,
-			      <0x0 0x03d9e000 0x0 0x1000>,
+			      <0x0 0x03d9e000 0x0 0x2000>,
 			      <0x0 0x03d61000 0x0 0x800>;
 			reg-names = "kgsl_3d0_reg_memory",
 				    "cx_mem",

-- 
2.31.1


