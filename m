Return-Path: <linux-arm-msm+bounces-17763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 706568A8CB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 22:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF1DFB236B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 20:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC7937714;
	Wed, 17 Apr 2024 20:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kFLTFp1Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D42739877
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 20:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713384426; cv=none; b=LismyxOLNrnQeqj39vsX/4RD7Wg4S38ZVXK1l8wcok7fRnJoX+8eD8egxhNxKVjgJc2w4qWhzHhPAPLjkNNR76UFIzwyiPb9VMDPSzmrjPOB4THMo+nfCLqosWF8AL/NHKaOifjLX1P9uKInQVCV0C2HPKYMW0gdEcAIyMV9uXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713384426; c=relaxed/simple;
	bh=FP49noh0itl+WdqHEAWcbgLL5Hde1RFigpB7XfXqmKc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E03sDHzArBehKJe+8n0lfXci9DyBKvTRWsKoOysEEOypUcL1HWJuQotEARPuLb0xDxY0aEN6ioPg1QVDA/AzhpsJY4EEC8dTD5E7cqt75Q5um8milFygR6RZEuc09EXgPcUo44z//aRh5RqqlraPq8xHqV0koj0uFiG4FOLfoHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kFLTFp1Q; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a55323f2ef9so3177366b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 13:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713384423; x=1713989223; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yXdx5eKBbphyNwU77pSPLcGmccDtrtsrx93Wp2k5WuM=;
        b=kFLTFp1QUibBPWsTs4SZXclBPlhXEzH3ZsdyZEVM4oQRveNc2FSIciVtsY5GYc/jL9
         LyDj852I+vko088MTwm00eSr6j7PAHoQbgJT859wuSBN+xApk1WhXO592jphJfblKViI
         t6T3NgsQgpkqyz149kPKdiBcVnglRU4ZdCoHYyoJZMeoNXaOQMffiyj32bmSU8akskBw
         RHU9vRvZsack7P34BjwECNwBSvba5j8NAU3+Z4QLv/IUR+kqx33Dc4yqKP1b7j3txNGv
         KsqrdyHfXtSzS0pM3UJ4j7uyKFi8TbjrY5ppdubU/Hbs4vR41f0+rmqgW+tUM5A4pUCI
         DLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713384423; x=1713989223;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yXdx5eKBbphyNwU77pSPLcGmccDtrtsrx93Wp2k5WuM=;
        b=hFtrBtjsaQiWECPt0HIG2ED3YoLY/GMxQv+iFyKsN5kuto5ZQraBcnYLfpnPmBu9iX
         Us+YBljsFMADKgkfiIB28ei7SO7qVc6f3ANN072lD4TGRMGWxpCWxRoELu7TPV1W7uXW
         mxmD7UNtAh9Thx/w9RBnQnyYVcuMDEjpADN0xKlNJ68jhMsV0Kst21VURUOtozcMj8Qz
         ttiMeoN0VT7qpmCdHDR+uJiNhIvZmHZUfDjjLHKxcgednf5iwRbFlC7pyppz01z0YWWi
         KufJrpZ0UhQXa0TjM/H2pDTue+EckhZL6imb4GURm9rnnjHwF+jkAToJsnCg6SI2w5tp
         SwrA==
X-Forwarded-Encrypted: i=1; AJvYcCWIN6QYsu4zsulo24hunz9oJTwgcNFZaALNk/dszi1qJhuKEiZFhS3FCl/cl8vNWueHARYqF36T0zAtOO4ZtR1X0f3IwYrnfPTlLEh/yA==
X-Gm-Message-State: AOJu0YxXKW6cTtzwSyKlWMY7XTIGUVOKVmXrATMWyajcdmqW6NBEA8rV
	HXtO6NIz+KwEgokOePxTuaTxrrl1bESXzU3/7NG95Bl7nTR+qJ9pz4t+7jj+ZDo=
X-Google-Smtp-Source: AGHT+IGHTmLXzZ4dbyEnVSVT1MrRjAMRM8nYk4BRv40HrWRSUnLpPYVy0DGHhCrF7OXDSp+mVHyrlw==
X-Received: by 2002:a17:906:36d1:b0:a52:4edb:6db7 with SMTP id b17-20020a17090636d100b00a524edb6db7mr319651ejc.54.1713384423496;
        Wed, 17 Apr 2024 13:07:03 -0700 (PDT)
Received: from [192.168.45.55] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id l1-20020a17090615c100b00a524e3f2f9esm6128057ejd.98.2024.04.17.13.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 13:07:02 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] Small qcom_iommu cleanups
Date: Wed, 17 Apr 2024 22:06:58 +0200
Message-Id: <20240416-topic-qcom_iommu-v1-0-fabe55b3b7b3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOIrIGYC/x2MQQqAIBAAvxJ7TigJsb4SEbGttQfb0oog/HvSc
 RhmXogUmCJ0xQuBbo4sW4a6LADXaVtI8ZwZdKWbqqmNOmVnVAeKH1m8v5Qlp02WFluCnO2BHD/
 /sh9S+gAK8gcnYgAAAA==
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Stephan Gerhold <stephan@gerhold.net>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713384421; l=515;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=FP49noh0itl+WdqHEAWcbgLL5Hde1RFigpB7XfXqmKc=;
 b=5/FbJrPNf4NOjKn27gt1gSHYQTPLvXP3Q/wmxcWPxxhTyDF9y1nO8Yev7Lm6eN7TR1F6ztJIU
 VEbRiJZYxJWCb1lNQrR88PCttN36W1/IRLJpjwJGHXzSIN1jFYqU75k
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

As it says on the can

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      iommu/qcom: Remove useless forward definition
      iommu/qcom: Always consume all clocks

 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 54 +++++++++------------------------
 1 file changed, 15 insertions(+), 39 deletions(-)
---
base-commit: 2b3d5988ae2cb5cd945ddbc653f0a71706231fdd
change-id: 20240416-topic-qcom_iommu-8ef262408c9e

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


