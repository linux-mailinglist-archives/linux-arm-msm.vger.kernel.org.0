Return-Path: <linux-arm-msm+bounces-13732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C6A876CB2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Mar 2024 23:09:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93A29282E21
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Mar 2024 22:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89763604D1;
	Fri,  8 Mar 2024 22:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YhyMJIXr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856185FBA7
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Mar 2024 22:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709935717; cv=none; b=Lb3F27jo4jj2f9A6WXzStWejuDq/1NHQ7HJYKFV1Qo6MEfBWLhU9VdJZLGQPaQs2KDwO1kFlUOBQIk0qMNFuvRMIS5kvHledZgJvxuRRa7JueTtZFOR6Lr1OvUuycmc8pLvBpKZqFzgLcCKcXqS7iR2jXN8f5y2ljMnizC7VMFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709935717; c=relaxed/simple;
	bh=eWOTmd2tsTLxXcstbYbn83ahKI+wXi5kjtikQvd8TmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qRqPc6Vy5X1lnTkF2Io/lazZVHilMiJVHa9mFx8qfFQnh1RrkhPavNalzwn8eNOuVTbrhMUntLqxlZ5jy9iMrBvWZn8FaeBVNFoO0NX6RFGWcwY7LOXsnChVPSENN37UDu6ziiCGlOe1Fu4SZHKMHUGFavF3QbnJQrEWDo84MJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YhyMJIXr; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5139745e6afso1116740e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Mar 2024 14:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709935714; x=1710540514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PwYLLPvl+vc8WoafYRVCdkEDCnelT/9QzPyhGkE8pJY=;
        b=YhyMJIXrDBsTh70IwTXS3erwIly2laaNXDL6+KURz103rcq1FktJnemZ/zP79RhbHK
         DV52yJZvBWAtxkezYSA6BkP1tI8l1G+9uzySxjO1T/QPABlyXze7p5tpwFf1icqNL4i6
         2P9WBZub056ZXwwjIO358O/4BIeen3CdnuuvFziRvFDnCVt098x+yrnXM9cDEsLhjJHs
         PP2V/VHQ1O3duIamdSdbpoIu/zvSoE1VJUkL3okmPthSDZ3NfCfNQsF9Rqg2jb78Oiup
         d5l+8w+Gqs1/65Jk0hpsTvc0J5pMYgQW9pkNr8+lCkDUHMk50mPatzNnNEbYOT66m6gy
         rTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709935714; x=1710540514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PwYLLPvl+vc8WoafYRVCdkEDCnelT/9QzPyhGkE8pJY=;
        b=QjVdL7vv4lH4syVvcszTBAe6Hf+b2UlxAcQWKiXYC1Dh3wgwBReURdKyoM9hCP4APD
         BMRCL8KqURiADjbUyr6ZdwTDpUHZIuRePNwKAeXy0CSnmtoAeYq7K9PFZnNYCR4OJpys
         P4tL5DDtJtwQ6q/EDo+W5tny8+bPyo2ynnRCUdxA/3eVptRZUqEMue45QonafnrXmr7e
         88eMYIrFy7EDCNYREKwRqWtezBbCICz33SwbXuoota8ONrr5ptSSZEH2b5x7KiOMiRG1
         Q9Wqbfon2DQv3iYiDVCMTrDTxHiIaG7PGo0x9/I9f/FqyQUTx/yjcb+u4Z3hGZobo5cQ
         yXcw==
X-Forwarded-Encrypted: i=1; AJvYcCVnz+RuuOG9pV1Vhvtk76RyHY9hZ8EQ4NKsTqNIbPwSfz8AyqDFFkCnYesk18uAblTqff/T3TdF6tYkkFWRxMj8d4yw5F9XJy0aFlUhFg==
X-Gm-Message-State: AOJu0YyqUckMpRXw6YVfGLxLJUDm6/oR3Sp1VRdnIRR7yfY9uJvub8QP
	S2QWLWlBtURjk71jYTCd5yyyeKc7nBR7nGD2PIVgJPTgO1Ucwcq747uH3qAcv0OwZ0H5vjqdjra
	qtPs=
X-Google-Smtp-Source: AGHT+IHAV2kpX7EJHsUlb5qz1GWavXRchPg/L3LtUpK4DxckheMNV6bZmY/dkUgbnHUiStHe9NhTmA==
X-Received: by 2002:ac2:5e78:0:b0:513:593e:12c3 with SMTP id a24-20020ac25e78000000b00513593e12c3mr155945lfr.50.1709935713679;
        Fri, 08 Mar 2024 14:08:33 -0800 (PST)
Received: from [10.167.154.1] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id a14-20020a056512020e00b005130ff68b87sm78241lfo.109.2024.03.08.14.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 14:08:33 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 08 Mar 2024 23:08:21 +0100
Subject: [PATCH 2/3] thermal: qcom: lmh: Check for SCM avaiability at probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240308-topic-rb1_lmh-v1-2-50c60ffe1130@linaro.org>
References: <20240308-topic-rb1_lmh-v1-0-50c60ffe1130@linaro.org>
In-Reply-To: <20240308-topic-rb1_lmh-v1-0-50c60ffe1130@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, Amit Kucheria <amitk@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709935708; l=887;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=eWOTmd2tsTLxXcstbYbn83ahKI+wXi5kjtikQvd8TmA=;
 b=401goTee880ks06op80EKYjIveyZC5BEA5EmmeGSyAwJsuAfi4ne5Vaa2dRdOt5Aq/UBeKmf9
 xFVGDRm6yWuCBc2d54oDP6CUiP0MxtyBl/VnmgfIF62nr+BdmAcMdwZ
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Up until now, the necessary scm availability check has not been
performed, leading to possible null pointer dereferences (which did
happen for me on RB1).

Fix that.

Fixes: 53bca371cdf7 ("thermal/drivers/qcom: Add support for LMh driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/thermal/qcom/lmh.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
index f6edb12ec004..5225b3621a56 100644
--- a/drivers/thermal/qcom/lmh.c
+++ b/drivers/thermal/qcom/lmh.c
@@ -95,6 +95,9 @@ static int lmh_probe(struct platform_device *pdev)
 	unsigned int enable_alg;
 	u32 node_id;
 
+	if (!qcom_scm_is_available())
+		return -EPROBE_DEFER;
+
 	lmh_data = devm_kzalloc(dev, sizeof(*lmh_data), GFP_KERNEL);
 	if (!lmh_data)
 		return -ENOMEM;

-- 
2.44.0


