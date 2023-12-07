Return-Path: <linux-arm-msm+bounces-3694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D4D80879C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:24:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 022E2283C01
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 12:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 908BB39AFF;
	Thu,  7 Dec 2023 12:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K+YfXuQu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0661CDD
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 04:24:15 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5d05ff42db0so6127997b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 04:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701951854; x=1702556654; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MiKLmLIgvazj+jtVgQtH7JvD+NHtPSGxW4NwV0BlIco=;
        b=K+YfXuQu9rw+8mUINwZ5NcYr8Doke2Y878dV69PlB1GgCqmmoos4naykIm4nBr9D63
         ViaqVp+P9D9jcG8EV7k+KrUInnoTctZhQNBb+fjsIXffcBbjczfN3qoBwufh0/ak6OQi
         scNwNTgYbrF63SGmP0ayga3nqyudxj6+LW5O0JUdWs2EK42l9jl3zVHywGHZmaEevjiz
         tb41a26yCX4tg55y/xinKmijdGoL342T0QUFR+yQQEyn+9UHiBrhZFQMzYNF/FsLF3E9
         OZbOCBcj/B1B0/CFEPZh4bMsbwBTLqxuSs84t7Vu19HNnE78+8fTgx98h5HVIly5O0Kr
         +UQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701951854; x=1702556654;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MiKLmLIgvazj+jtVgQtH7JvD+NHtPSGxW4NwV0BlIco=;
        b=ca7nyXQ+OzhGFJ5AXMT98/dl36+FkmCW3Ggux4+d/uMTin0CsjQ1ck4HIJBE8AhUra
         Pml8gH1nflyyPdwyyucW8/sec93mu03WJgtRG1KEFUS347tixomLPx6qepj53iG8H/3K
         8sZ9Uy8s/5cXks92HQYdiTYBqjMG8ec2r/bWwO51bBXY/exw17hbAv1y4QxIoI02LD8D
         cmxmJt1dBMqEJbzLy2KyerbV/rX9UtbFhmcoC1LKujuUmYcrMSfovIa+eKFZAmGvcXve
         uO8EP33nXMvxeOeG/oWLWWWNirMGb7OITKjDS+tWV8zDD0s/F9cxiXnjRh0+pJPSsVn2
         NU9w==
X-Gm-Message-State: AOJu0Yzssz9v3AR8kLRou1uXdiD2dHWgr+TEAY8Tc0bZ+Jys5M8Wxu1q
	DIMVodDUUe45d79mAvGN7otIgAItW3W2q2g2kQD6IA==
X-Google-Smtp-Source: AGHT+IHqCc46uHXGyBjJCpF2wowIEkat5HWL4fNDZS1yBZyQ6JsjmMrOr0YV4JZnMRdfN+polaHzy3D/khi0W5LPnYs=
X-Received: by 2002:a81:ae16:0:b0:5d7:1941:2c1d with SMTP id
 m22-20020a81ae16000000b005d719412c1dmr2049988ywh.74.1701951854242; Thu, 07
 Dec 2023 04:24:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-0-dfd1c375ef61@linaro.org>
 <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-3-dfd1c375ef61@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-3-dfd1c375ef61@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Dec 2023 14:24:03 +0200
Message-ID: <CAA8EJppHjA2VNBwD=EjcBSjqGtLcc=co8M8QjzjWi93VDSTOAA@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] phy: qcom-qmp: pcs: Add v7 register offsets
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Dec 2023 at 14:19, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> The X1E80100 platform bumps the HW version of QMP phy to v7 for USB,
> and PCIe. Add the new PCS offsets in a dedicated header file.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v7.h | 32 ++++++++++++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h        |  2 ++
>  2 files changed, 34 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

