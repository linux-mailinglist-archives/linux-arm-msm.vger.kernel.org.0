Return-Path: <linux-arm-msm+bounces-24554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 181D091B600
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 07:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72F46B21478
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 05:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5BB12AF0D;
	Fri, 28 Jun 2024 05:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jA0AB05C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FBA4206A
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 05:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719552030; cv=none; b=o2vgeog2nNv3wu5LPVfmNtvkGNYFBugMiXK1FSoDGJGugMyGwC2DAIbmTYTgswd95H4wd7MzHfZ1VeI2y6+o0pWAwxPujNsN9dCOt2XTI6/Ed8C4FUidoYTB49WHaQYw8lg3cweC5hnep5/FMlXEcu4048d7mN53dYO8FJHUhKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719552030; c=relaxed/simple;
	bh=nozoIUcXI4qDBNkbxpqvRvoom0g8ypFap+QSsXv/xZs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ltAm/pV3Zub8GYdXyX4IlV7H9mqJAC2nYVa4CTGfiSZHSxy91MS9XyK/KxiaFuQA/qdvHwsikTpS4wuliHzZTnojV7eYbfmSlEsCIH5JNbx1kLydopheHAfVESJ8GeNqKaA1Qklp6A+EwcMZ79ASAQPbBfx12AtUpisV2SvA5zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jA0AB05C; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52cdc4d221eso217184e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 22:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719552027; x=1720156827; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vpefSJiaGnqEfIeGrIWUX7KpqJ2img/BwDRlYR/iXXw=;
        b=jA0AB05CeMDAx1oQb8NBTtAuKbiI887UGYs7wzeops1nRb5GDdHwnEcsp/KAvU3yqv
         4X5b11bnn+dQwxiWbK+Ko6+j3X5u+lOkiW5wXfzzqYeZZMyRCaX9tH+Hzmy/FEJyyHWN
         HXvzAX39B4gaTKHDZQnZoHZ0CDt72BJNZLI1XYT2nRkhXHn5lnoxd7zzjIhXswXInriI
         7+8Xpgw0+60QTc7eYfIdRURhT1fDgjFSobI21/uo0Cn9fc7xRBJY1p8ZS96Wg7UCPb/5
         UcmJStzLlw5HcSiKDUUuJAJmUT0uodjvLiQ4ABSU7lIXl7bk6wh9bjZijQa3UfUrOOzM
         PfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719552027; x=1720156827;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vpefSJiaGnqEfIeGrIWUX7KpqJ2img/BwDRlYR/iXXw=;
        b=aIJcTh9jGZZgDPeH3Bs15wfyhtoyew0Wrc9Nn6bvjkEyV7cBDv71GC9dueUHCfm/7/
         2GFkUeeW3zjXJz845PW3v2H7dTJuBAioc9x7XgBMLpDAl4JGIrz9ba139oql7rnlSBoz
         ZF1yZi5rc4wKyJQTeYNI67FKjsCq/UwkHMwECwRTXMtFaTySQf+PxXtzQL+ryV7xT9+o
         9BxTa7LQBrRuylih7X5QPAZLta1IV33ITqDtthpha58a6zcOEoTwSO7gcKyZhL1jw+xc
         gaOyG4HQQWB5nzmpkaHXkUkU34uouzLSyImMbYhasLJx5U56jOAuyss68up+0Jj7wa6M
         CTEg==
X-Forwarded-Encrypted: i=1; AJvYcCW2coVVUEnUsjV46VpuWH3uCygTXN6KXwoQW6z1BTfGJwNOQ5izvv5DzPyaB29/PkG2+gxCexk6DtNXWbY3xjv74lLAwiRbL9G77FdKAg==
X-Gm-Message-State: AOJu0YxNF7zuSwO76Qqg5QmcsjnuAt98VfQd8YDT+M6QGdObuSn5XhVJ
	KVtKIiLbc7GsDIloBqmGEMuVctCsQhFH0TaUmB1Zeu0WT2T3+dACqa6NpMjXmkZLDNHeTv+c5MU
	sbQtaIQ==
X-Google-Smtp-Source: AGHT+IFxae/ZOWmakYzI1aE7tdFOnmCfK6pLehwC0xpC1CEJL44IXUw0l2cwjQo8TT3azIyHySknEA==
X-Received: by 2002:a05:6512:220c:b0:52c:ddce:4fda with SMTP id 2adb3069b0e04-52ce183250emr11796358e87.2.1719552026893;
        Thu, 27 Jun 2024 22:20:26 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab101c5sm167736e87.79.2024.06.27.22.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 22:20:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] clk: qcom: gpucc-*: stop requesting register resource
Date: Fri, 28 Jun 2024 08:20:21 +0300
Message-Id: <20240628-gpucc-no-request-v1-0-b680c2f90817@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABVIfmYC/x3MQQqAIBBA0avIrBsoKYuuEi3MRpuNlVYE4t2Tl
 m/xf4JIgSnCKBIEejjy7guaSoDZtHeEvBaDrGVbK9mjO25j0O8Y6LwpXmgWtXS2lzSsGkp2BLL
 8/stpzvkDURVnzWIAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1748;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nozoIUcXI4qDBNkbxpqvRvoom0g8ypFap+QSsXv/xZs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfkgZCO1i8MgCYMFMkelu5PazNJg+YyIXN7oPT
 6Jo+hBxdRWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZn5IGQAKCRCLPIo+Aiko
 1Qu+B/977z/5JNUU8bWElQL0CjlvFvUdulyiVMSBTJrs0GiUb+G2RUlPm6Jl6I82DlbMOcj5rv2
 nurFFvlR3i9LkQqpC+VWYznTq/5Iu1R3XM7Ss5e4twHFkwZXD3fiaDqK+/9f2jB1OAVYT2MMkSA
 hsRxYxev+GUNbn7HuJ9YVDJScUO8azF4iUEn5KOSbETc1AM/paaeVXS1OkDrT56wpmv079cgQxI
 D86NIsaljIOBks0ADHdAkgbuDF9ut23aufyeRNtt77c/R18/a8wEii48qn803Bl5tFmMwbiVOYv
 BnuawaTtmdeXMKVptadsyUHxRH8zv1a/Smw4qHuGN54BuF7p
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Testing of [1] pointed out that on all modern Qualcomm platforms GPU
clock controller shares regiser space with the GMU. All gpucc drivers
use (internally) devm_platform_ioremap_resource(), preventing the GPU
driver from using devm_ioremap_resource() on its own. As GMU register
space includes gpucc's one, make gpucc drivers use non-requesting
helper, allowing GPU to take over the bigger memory region.

[1] https://patchwork.freedesktop.org/series/134401/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      clk: qocm: add qcom_cc_map_norequest
      clk: qcom: gpucc-*: use qcom_cc_map_norequest

 drivers/clk/qcom/common.c         | 20 ++++++++++++++++++++
 drivers/clk/qcom/common.h         |  2 ++
 drivers/clk/qcom/gpucc-qcm2290.c  |  2 +-
 drivers/clk/qcom/gpucc-sa8775p.c  |  2 +-
 drivers/clk/qcom/gpucc-sc7180.c   |  2 +-
 drivers/clk/qcom/gpucc-sc7280.c   |  2 +-
 drivers/clk/qcom/gpucc-sc8280xp.c |  2 +-
 drivers/clk/qcom/gpucc-sdm845.c   |  2 +-
 drivers/clk/qcom/gpucc-sm6115.c   |  2 +-
 drivers/clk/qcom/gpucc-sm6125.c   |  2 +-
 drivers/clk/qcom/gpucc-sm6350.c   |  2 +-
 drivers/clk/qcom/gpucc-sm6375.c   |  2 +-
 drivers/clk/qcom/gpucc-sm8150.c   |  2 +-
 drivers/clk/qcom/gpucc-sm8250.c   |  2 +-
 drivers/clk/qcom/gpucc-sm8350.c   |  2 +-
 drivers/clk/qcom/gpucc-sm8450.c   |  2 +-
 drivers/clk/qcom/gpucc-sm8550.c   |  2 +-
 drivers/clk/qcom/gpucc-sm8650.c   |  2 +-
 drivers/clk/qcom/gpucc-x1e80100.c |  2 +-
 19 files changed, 39 insertions(+), 17 deletions(-)
---
base-commit: 5d98d5e70f505b7278336de493eba94cde5526b3
change-id: 20240627-gpucc-no-request-cb6b5f72e8da

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


