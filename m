Return-Path: <linux-arm-msm+bounces-24349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6FD919743
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 21:12:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE1B928570E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 19:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95511922D4;
	Wed, 26 Jun 2024 19:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Oi2auZZ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4D318FDB6
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 19:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719429163; cv=none; b=MWIhJEfmeHPjHIYWTuSlgslV7UJ8QdT+XHeMaMKBne4mZB8HgRM68iARxfdDeZU/ERPBfV1Q2NLEYUtbUbBkM/hBp0b9iJZSZyl5hzdjezS5vH3LsIcwWNpDEAlfFsDygXVNCG/cecLZ+H4tc4D83CEhZVwFrJCxfkoKFBVo+qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719429163; c=relaxed/simple;
	bh=Pw+sCEAT+Z9dh5Utx8BERFX6HY3A5yb57Mqv5aaYusc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AF8xeGkgyFGgggEjgD3Ez4edSeqa5J9WHF8HVVEtongUA50C94x0TT/MbG9olZPBg+NYJX3ByUDV4+QsQFMopNd1LSMP2r05Q1EAb6GzOOeLHW/C99Dea+FiWCrHlN0XBh4Udq4w1PupCi2tCgNza/t/blvmK+flz06rPNME8so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Oi2auZZ6; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ec002caeb3so90686911fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 12:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719429160; x=1720033960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+UvH5HZmvKGGIuAO5J+pPITUJE8M1Ym9UtSDnHdpoGY=;
        b=Oi2auZZ6jHqg/RhF8Kb7AtwK3BAseDRruwduTKp1R9CK2qzBkz9xykt3XdzqYFGQGX
         EvDsA7HDQeGal7sypaE1rK4oL62nBjsKHmvHJKZCkFQNUFCswEZujFuPhyuO8MMT0i3F
         gbx2Wa4F2WzIiiJd/3SV8ecGp0QQ0/KMLZ8DDYdg8ExSav2F9+ZcxW9HJwuYKXXnexd+
         i0yuuY6TMZRoC91fnhgZUc/emYKDSyGb7SJ1O1EydKk1GloHrVLjEEHx25V2P3ZkQs1f
         CD0v6LTbQLx9jeul2lSOaI1q61TaDv7NGfn24Jx01IF6HWm14AkQEKwGfS60ffKmVkwD
         vilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719429160; x=1720033960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UvH5HZmvKGGIuAO5J+pPITUJE8M1Ym9UtSDnHdpoGY=;
        b=Q4um3zrKJizyVb6HOYUkhccWbEr1Rg1akFegGFSdJlLmCgEmDQwUzsafDKfSdqBxS0
         HSAGvPSrxcGTX4wKeH4RkFN/OoGE/N4cLq3/pLTG/2GwOJf1DknseYYodJ9y4oRrtgeZ
         6YtYphOCYi6qVqvbBEmS3HHYfdIAUJrzkxd1T7AWiRPEFd0cQytNs9T1EbnGMrQv19GF
         E7JvOanLTlB3PcuJvmgTNy07gneIMzYvCv/4UVY6k2VvXB2G2PX2H3t5TRdUgOtdz73D
         QJwDz1k5BpBqFsDwhLeq+KzvR9QzOKM6D7kzvBs510/R/qAcYRi4yj76Bgjew01RbKnb
         fFXA==
X-Forwarded-Encrypted: i=1; AJvYcCUbfDiL9lyPhkyd4f4QrUYhhxA2ruAzkC3zm65lRFzkg1XaTtOwuPqit0+MxbhOTG41rGbo7KlqSDJhghErzBG+dt3+yXTwpUIhFJGbYA==
X-Gm-Message-State: AOJu0Ywymrr4vZF+LDExOCDHUhoeLeaWNJgt4fSPLHChzJrA3p06tMsM
	7yiPhzDZ8zBPlX27Ises9pJKU3RswX1by7QAZtHh71+icDvdXc6IB8G8iyTqAfI=
X-Google-Smtp-Source: AGHT+IE54fLp4b5+PVB5ocCcYlWG8uo+/TidBzye5/q8GSTFRfbD3g+eiLD1LMP5cqwSaxhlhkqxIQ==
X-Received: by 2002:a2e:874f:0:b0:2ec:55fd:f118 with SMTP id 38308e7fff4ca-2ec57967b67mr72555061fa.1.1719429160614;
        Wed, 26 Jun 2024 12:12:40 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec5ef9d5fbsm9737091fa.136.2024.06.26.12.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 12:12:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 26 Jun 2024 22:12:37 +0300
Subject: [PATCH 1/2] soc: qcom: add missing pd-mapper dependencies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-qcom-pd-mapper-fix-deps-v1-1-644678dc4663@linaro.org>
References: <20240626-qcom-pd-mapper-fix-deps-v1-0-644678dc4663@linaro.org>
In-Reply-To: <20240626-qcom-pd-mapper-fix-deps-v1-0-644678dc4663@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Chris Lew <quic_clew@quicinc.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=819;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Pw+sCEAT+Z9dh5Utx8BERFX6HY3A5yb57Mqv5aaYusc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfGgm/BawO8IjUtIybCyJJSV9VTppnF4TaehK3
 qGpXPVFJMyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnxoJgAKCRCLPIo+Aiko
 1WbCB/9FQanfrmeJbxWFS3YeYkPem+T6g+tE7ERKrpGg7GNFI5dIT5rL1iBU6J5jRSrdiIFv/oo
 Hc08fGnOwoz8zmg5RddsxTmbFaH9EfxQoWkE9JEqg0JuLmWqO3EM3YusYCAsAAI90CeC1RybfnB
 GFRVvx2ODPrdXAtwx17XgXw96KbohZhuyNSK2E/pRstByXcayRtKO5BvCRRNhqWzIA2aKzzFoNJ
 SykgrbHXtn9iIiAAV7v5ME/c5TCrWgS5mZ2h+LYiuckWDhcKll8xqWveJEyjL50WdzRHhr0eWBO
 78usybF2bxIQrBMS/L3A/2uk36VZfSbOZnYTRMvQQ7ArM4bx
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The pd-mapper driver uses auxiliary bus and Qualcomm PDR message format
data. Add missing dependencies to the driver's Kconfig entry.

Reported-by: Mark Brown <broonie@kernel.org>
Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 0a2f2bfd7863..432c85bd8ad4 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -75,6 +75,8 @@ config QCOM_OCMEM
 config QCOM_PD_MAPPER
 	tristate "Qualcomm Protection Domain Mapper"
 	select QCOM_QMI_HELPERS
+	select QCOM_PDR_MSG
+	select AUXILIARY_BUS
 	depends on NET && QRTR
 	default QCOM_RPROC_COMMON
 	help

-- 
2.39.2


