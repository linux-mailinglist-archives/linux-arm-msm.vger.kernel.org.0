Return-Path: <linux-arm-msm+bounces-6037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3C181F255
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Dec 2023 23:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAF11283DE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Dec 2023 22:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E40FB481CE;
	Wed, 27 Dec 2023 22:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lFD0vFg/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557B0481C0
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Dec 2023 22:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a26fa26e7aeso228651766b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Dec 2023 14:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703715454; x=1704320254; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PNu/Hibw+A4NmOwrD/KUQB5a8JfK056fiWwU3utcXx4=;
        b=lFD0vFg/pkMF3icjz4TOo1KofM0J8sh+qbzvB48cEe2JTxrHhUjpWyJf9+grFzXfQZ
         yHSauMST/pRHVkCn48Td+2iJ6UTUIXJV79CvwAujjE1y+XowETLJZG6KNCQSnYTILiAs
         O4J00xsrjwkKnRP6LMjG7H+D8ne6mMHrqxkwXkHMgjY0p5QL5bEkvv4NvxzxvP0XX62T
         0Wkyr423xUht1PNExPpsBJ6nmvwVj20cC3lsGXZrtWf8QQgsMveyfe4kWeicyhTNDteA
         xt12rhCmAaV2L6C8VsR0xGtu1sLjqbLkE+HQHNBy+mrZruVbPLCyfoue26cAwNsy9x64
         /bJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703715454; x=1704320254;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PNu/Hibw+A4NmOwrD/KUQB5a8JfK056fiWwU3utcXx4=;
        b=iunNvb6MpRcKFZfm9UTTINolxrgbIRs62fFklyqgT392bWK8+WMCXrj5R+KjU2nG3O
         3jOLnoVbcl2ELTVkC62VoZgBDPsJaFHHGh0MaqbgI9x2mKvSwlwhWpjedBLFM8iqlfjH
         3v12nQL6gJA7C+SsiO+8bEQY1uTQsROqaY+aCsvyB6CZQ7zIyip9w2ENPdLV+jJuhUHA
         BVCUdRmflA9aaRzxLHORWA7xxZ9v2LfU0RUJ3b0ZI/9aIdMFrQVJARcfeoc3RB3mYHwC
         EtpbW+adHyEUwhDXf4xoXfb1g08NJF10+ngLAIQv9ngEoCTdNAcgLIX2TPmcPb/EHvnl
         kENg==
X-Gm-Message-State: AOJu0YzT3cDnnLvHL3Hff0bCCFDQlmipkkeEjS2N23XakY+/1B+ICKJZ
	uTEdaekHm0O5zyxdAxr2qzIF822AwUb4KJjF9PLkv6mFSiY=
X-Google-Smtp-Source: AGHT+IEhrJKQaqxQcDxDiFWu1GsD+/kBAspq1WlaGaHdfvd24+0hx/rKrrCeYR5Mu5B8GmS3/0zhjw==
X-Received: by 2002:a17:906:c143:b0:a26:a51e:4313 with SMTP id dp3-20020a170906c14300b00a26a51e4313mr4713907ejc.99.1703715454453;
        Wed, 27 Dec 2023 14:17:34 -0800 (PST)
Received: from [10.167.154.1] (178235179028.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.28])
        by smtp.gmail.com with ESMTPSA id ka12-20020a170907920c00b00a26ac57b951sm6245712ejb.23.2023.12.27.14.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 14:17:34 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/4] Qualcomm PCIe RC shutdown & reinit
Date: Wed, 27 Dec 2023 23:17:18 +0100
Message-Id: <20231227-topic-8280_pcie-v1-0-095491baf9e4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG6ijGUC/x2N0QrCMAwAf2Xk2UATH6z+ioh0MXWB0ZVWRRj79
 4U93sFxK3Rtph1uwwpNf9ZtKQ50GkCmVN6K9nIGDnwm5gt+lmqCkWN4VjHFSCQhXzkLCXg1pq4
 4tlRk8q5859llbZrtf2zuj23bAXignCN2AAAA
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Stanimir Varbanov <svarbanov@mm-sol.com>, 
 Andrew Murray <amurray@thegoodpenguin.co.uk>, Vinod Koul <vkoul@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703715452; l=746;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=02WWBUP4VI09LIYAqAaCWpT1VF+UeeRG3z0iQXnSq4k=;
 b=tBfut8NqDlYh7+Da2duoRNkj1XPLP1jm5yMzMTw+TWzl8uPNTQYxVXDF6QkJR88VepC4fiinP
 FcW8LeGpAUUDXcAbpR/Hs0fpWQ7x0hA/NJhGnlGeU/E0+Wyj1NIp0Im
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

This series implements shutdown & reinitialization of the PCIe RC on
system suspend. Tested on 8280-crd.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (4):
      PCI: qcom: Reshuffle reset logic in 2_7_0 .init
      PCI: qcom: Cache last icc bandwidth
      PCI: qcom: Read back PARF_LTSSM register
      PCI: qcom: Implement RC shutdown/power up

 drivers/pci/controller/dwc/Kconfig     |   1 +
 drivers/pci/controller/dwc/pcie-qcom.c | 159 ++++++++++++++++++++++++---------
 2 files changed, 120 insertions(+), 40 deletions(-)
---
base-commit: 39676dfe52331dba909c617f213fdb21015c8d10
change-id: 20231227-topic-8280_pcie-811c0f92fc1c

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


