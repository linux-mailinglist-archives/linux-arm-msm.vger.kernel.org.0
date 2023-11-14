Return-Path: <linux-arm-msm+bounces-634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED227EB183
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 15:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F313F1F24B73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 14:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55253405D4;
	Tue, 14 Nov 2023 14:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A9TnZMVK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20BD405C2
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 14:06:29 +0000 (UTC)
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D2F1B9
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 06:06:28 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-d9caf5cc948so5813507276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 06:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699970787; x=1700575587; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2R5VXLdFwq3Yr4sy4ojbP/K5dGOeJnAWKMocChwVIJ8=;
        b=A9TnZMVKqiZ0tMulZayf1haVI1OF8gNP/y5KXSY8k2bQky5YDATgzQnP5lCtQb7RZg
         CB+g8/7CQ0EyyNCl6FWDugI2ktcNgzwI6lBxY0M8BF71Xr5oIbwHdLKm6gmLgFsEEhnP
         Ccg1lONUZmRwiEvcnujkzL80rVBFDRFk/bCo3I/s761kxohd16qWFxbT0xuDY8v6ozeW
         FTWSu+hFnmeOvSfSwtVxVw5ASii4uWWaHAfS2Mqv7Sm2HcdO/JCshFdiiBG4eIdPSEyB
         UbY4+XYtJysY4TIcwVXFCFUjFmnQWfv4a68i52uf1vV1k3GVGzDAGnSTpwC8LCvCs6zG
         S44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699970787; x=1700575587;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2R5VXLdFwq3Yr4sy4ojbP/K5dGOeJnAWKMocChwVIJ8=;
        b=i99qns21VMs3B431/p1gPt3raF7YuonzPtRSSdbdiQW669VCY3tYKbfAflngMd5Ev8
         3Jc8az1aU1etA/C8eBHNECz8Io+FZU4WQYTQm+2maq21I2WrnC4yR/rIS8AuGeQ2O5ak
         Y5ZtbsYcC2A9261h+oG5rOOLYDY8Bj4TdQFcVp7OY/3Rbm3/unGGAZU26y4R/f7z6iVr
         2ySXnBmskiM5INmQbZJFRyvSpWUejo79N6CwHqNSUR8y7goG6LaWaWayZbmzH9xkRq37
         fljgLAGwGmhnFpbnnvKQshwNJFq2u7s/BiDnlGy5jQoO6WDyqrnZtxmR9m/CuhLsSqf1
         L13g==
X-Gm-Message-State: AOJu0Yw1k8OXalh100ZMigplGev9OHaT/DJ0z9QCX6OY/BI4jApG+OUn
	XaE5qIvHff/VhcBZnl4XxrDl7Pl9YLA8Zhe2e8XJSQ==
X-Google-Smtp-Source: AGHT+IEGp77zVfveIN9Tv1vvBchnTPzGdXtXYANmtfvx4aFfUmUd7u+dIH4PTpunAnvF9bFQWXfZM8eoXOYs6RvC8B4=
X-Received: by 2002:a25:cacc:0:b0:da0:ccd6:b8a2 with SMTP id
 a195-20020a25cacc000000b00da0ccd6b8a2mr11294551ybg.19.1699970787662; Tue, 14
 Nov 2023 06:06:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231114135654.30475-1-quic_bibekkum@quicinc.com>
In-Reply-To: <20231114135654.30475-1-quic_bibekkum@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 14 Nov 2023 16:06:16 +0200
Message-ID: <CAA8EJppjChesDEXqUo5E1tRtjj_WH9NUBHKCyy8-n4YDCj0Yeg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, a39.skl@gmail.com, 
	konrad.dybcio@linaro.org, quic_pkondeti@quicinc.com, quic_molvera@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	qipl.kernel.upstream@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Nov 2023 at 15:57, Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
> This patch series consists of three parts and covers the following:
>
> 1. Introducing intital set of driver changes to implement ACTLR register
>    for custom prefetcher settings in Qualcomm SoCs.
>
> 2. Adding ACTLR data and implementation operations for SM8550.
>
> 3. Re-enabling context caching for Qualcomm SoCs to retain prefetcher
>    settings during reset and runtime suspend.
>
> Changes in v2 from v1:
>  - Incorporated suggestions on v1 from Dmitry,Konrad,Pratyush.

Which suggestions? This doesn't tell anything.

>  - Added defines for ACTLR values.
>  - Linked sm8550 implementation structure to corresponding
>    compatible string.
>  - Repackaged actlr value set implementation to separate function.
>  - Fixed indentation errors.
>  - Link to v1: https://lore.kernel.org/all/20231103215124.1095-1-quic_bibekkum@quicinc.com/
>
> Changes in v1 from RFC:
>  - Incorporated suggestion form Robin on RFC.
>  - Moved the actlr data table into driver, instead of maintaining
>    it inside soc specific DT and piggybacking on exisiting iommus
>    property (iommu = <SID, MASK, ACTLR>) to set this value during
>    smmu probe.
>  - Link to RFC: //lore.kernel.org/all/a01e7e60-6ead-4a9e-ba90-22a8a6bbd03f@quicinc.com/
>
> Bibek Kumar Patro (3):
>   iommu/arm-smmu: introduction of ACTLR for custom prefetcher settings
>   iommu/arm-smmu: add ACTLR data and support for SM8550
>   iommu/arm-smmu: re-enable context caching in smmu reset operation
>
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 156 ++++++++++++++++++++-
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |   2 +
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      |   5 +-
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |   5 +
>  4 files changed, 159 insertions(+), 9 deletions(-)
>
> --
> 2.17.1
>


-- 
With best wishes
Dmitry

