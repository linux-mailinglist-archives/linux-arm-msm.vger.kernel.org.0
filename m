Return-Path: <linux-arm-msm+bounces-45283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C21E8A13CCF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 15:51:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A1823ABAF2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 14:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6A722C9F0;
	Thu, 16 Jan 2025 14:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cj4BxhIO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBA122B8C2
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 14:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737038971; cv=none; b=C5+zbBCajLTCcIdm8RFhXI8HGzVEvX3732SNlX+SCeR8NH6W5iW5ZlVHAB9ytAUzxDnNDF1B9Ddj3Qhgw4hr3DjwhLC+qITteCfF7PBT78jummk5fZYpzu0DTZcJC06WVsE6aLCq/ZsKJpLifDYK+0zf8EdZs8lkw/dw/KeRPAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737038971; c=relaxed/simple;
	bh=Wje1BciONDqQrKQyhp/R22j+9s7pjT1C1mQYS4XxTmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HUY3O79xLCnFVqxGJrK7+di2kRNhLFPXg+s2GD0pjrJ6w2rAwBtzBLYpb/vgT92uQTRW9G9r8Euin5Hp2VZsfFkI9k9Xh9UVmshnv3Xom3lTrWmJVwFMH7QF2+t+/ylwpWjticMAdBcqj28FGJAsb6Ran9wouCzeD9VwD5xPcJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cj4BxhIO; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385e3621518so483730f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 06:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737038968; x=1737643768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbb6Ezfzp9O8O/V6bl6D5LDxeK+r+UlRD6ckNgY/1gU=;
        b=cj4BxhIOazRcHCNPKjsyeoxRxz3FuQ4Ok7sBqmWmD1tVSWnG27HKkfrR/NoN8ftx2I
         VEsUNWMd6b8voWUmiayk67a6BwE6ZAuE7BLfM+cLRX5WUTiB2o5I6CKQIv1MhopaLRoC
         MbFd3V/x5dGnX6EqIcbFKwDV9pKahE+HZAyFHgsWmGDJO/esypA1uxFBJcqvJyKK0fyS
         o510CMK33n9WCSv6mOZBx7P5/vALGzjjUF1l1nHVARra/93O7A3uAQYoUxDNpiHmI+jP
         y4uE6Jb54xEwxChGoUvFhn4IbFLt1eWx5J5my2duEQmmgdzOuX6I1nV9VjwtwTeLFoOQ
         2p/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737038968; x=1737643768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbb6Ezfzp9O8O/V6bl6D5LDxeK+r+UlRD6ckNgY/1gU=;
        b=ccNRdI0zTXhZRpWOFJ6oROwP5Jkxf5p1GHLS8FHhtnsojeUrJnKmpG89YmxXGonDen
         XTxUVa5PvgxBAC2jlJXiuJotuPnllCSTnyrJVSQG5TgHkwtG00VHiK9ywbWJsk7qTnSy
         ts+klNP+86O+fOLib8yvkNkBKeqWq0jRpCQs3JsggGen/vBbaBlDLWAeKx9cS8/VhiF9
         OZ7xgPzg2HIpAmUmqNJkdKFlBgKeX7cQWQXH13tfJgjAN8A6i0KW0AdmOXVXZQqF5boN
         s0vEtUbC3elvtGdyGwc0IZCUCuTQjRV9i/r7zV8htNFHot6XJvY+tfb4NqEQ2CRn5R7k
         wZ/A==
X-Gm-Message-State: AOJu0Yx6IMI9WlPS7+WGNcNK7WxIACg5lm4Oq9ctwxgxLyWvISlAxGeM
	LD72VFz2rDNFwb/v8gizL4WHaI2HArqH2fmoQG3bko6qEOcJNCAmDYpf076YrSI=
X-Gm-Gg: ASbGncuH8lTesuJNFeP0XJBp63dipFQ5UR00mIjzRfO/vfPEdVutivTp3h6WUWea3sN
	jBCOreLRtevFx5dUYr/SbSocQbra6de41G0xws72VHXA1b5QRZf0tmht8wv1PVK5MsuJ7qsJ2YQ
	4b3Xij6bTpyQFkXlthLbJShkPaGZYoK8nOG1Aa2z3nKJCt5N0c67jNuYku8a7Tgvl7wnib6bUtR
	ixjR6nC3g7VglOSFvxTJwigUyX86G2L402yhiRYBhCYW/02cmF+QIc5BUfwRZu5gddBlZJjOodA
	WQKqR7pH6HsdiI7xjwD/wuBu6q66alIfyocm
X-Google-Smtp-Source: AGHT+IH9TQuJ8S6VwCv/DsUwUueSrMwmdIaON0G+tCnVqhp1ubDleE7CO0HW5JVWQ93mm1BDZ5rH1g==
X-Received: by 2002:a05:6000:18a4:b0:38a:a043:eacc with SMTP id ffacd0b85a97d-38aa043ee63mr16034591f8f.1.1737038967915;
        Thu, 16 Jan 2025 06:49:27 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf321508esm70310f8f.10.2025.01.16.06.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 06:49:27 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 16 Jan 2025 14:49:06 +0000
Subject: [PATCH 2/4] mmc: sdhci-msm: fix dev reference leaked through
 of_qcom_ice_get
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-qcom-ice-fix-dev-leak-v1-2-84d937683790@linaro.org>
References: <20250116-qcom-ice-fix-dev-leak-v1-0-84d937683790@linaro.org>
In-Reply-To: <20250116-qcom-ice-fix-dev-leak-v1-0-84d937683790@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Eric Biggers <ebiggers@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737038965; l=939;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Wje1BciONDqQrKQyhp/R22j+9s7pjT1C1mQYS4XxTmo=;
 b=aMMD3l+fSYmaasELHSb630GvEIX81VeJMVo3eY8nHViIArWh5G7STBR9Qc3WZpAaFDvitRjk8
 m9LNmbtOIdmDxHTkSnPmHvYOH/JFRZpvuMIE8UrP0vRAQpXFltqIOPi
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The driver leaks the device reference taken with
of_find_device_by_node(). Fix the leak by using devm_of_qcom_ice_get().

Fixes: c7eed31e235c ("mmc: sdhci-msm: Switch to the new ICE API")
Cc: stable@vger.kernel.org
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mmc/host/sdhci-msm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 4610f067faca..559ea5af27f2 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1824,7 +1824,7 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 	if (!(cqhci_readl(cq_host, CQHCI_CAP) & CQHCI_CAP_CS))
 		return 0;
 
-	ice = of_qcom_ice_get(dev);
+	ice = devm_of_qcom_ice_get(dev);
 	if (ice == ERR_PTR(-EOPNOTSUPP)) {
 		dev_warn(dev, "Disabling inline encryption support\n");
 		ice = NULL;

-- 
2.48.0.rc2.279.g1de40edade-goog


