Return-Path: <linux-arm-msm+bounces-18988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 090038B7F57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 19:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7C55280CDE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 17:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56D41802A0;
	Tue, 30 Apr 2024 17:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pJh+Fm2H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521BC18131F
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 17:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714499991; cv=none; b=kTA7qzTI3MxvY9N8zc7h9p8bVrhBod7HtO2HwaHNEQalplG1brMJrp1f4hVh0sl0FR4v2bKZWzfiihtC9OWd0ioP2UJwwnnHYd9uMLcfRT2TrslJkN472i5IWhWaWNT31c9tIMAKPQ/8q73scQHjtRx2v/Y6iDeNEozrncRy1L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714499991; c=relaxed/simple;
	bh=L9oTYqz7coCes4v46W8uTEssCznxNlmpxkBvoifmY60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RHFlOPiHQMdlu3V3bMOk1AD93+571HLSGk2JPMYdArfZXwLxlIKQ6afy1bXtgWQk/FWNptvO6Ddc0R7leO8wUaO+4MMwFVGn5XxGdzGzVA4NFwNAa9sxe8HzHZKc1QmlsAsxXC9dhlhCA8mFJYeIC914YqQCOfw29eQE91nMZDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pJh+Fm2H; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-de5a7b18acdso5511308276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 10:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714499989; x=1715104789; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vseX6k1o+B5FqObwflCIgJI2bSMTOCAMOHrgjYjS0ao=;
        b=pJh+Fm2Hu9uyHqmGO6wSmYgTyjcEk+KP0ZnDWNfk8Vj6EhzHHv/VQqt6eXq7wisjeV
         Zn6ypK79yrC1hBz+VvWu3JPbJfntKCvfA5Q1YcvH0weJEYQLR9J3iAHdVoKu4eeN8KUe
         QrWC2rTACvbnGF29DSRSLcWwb1A2Em0UQ682Ej8ZIU0SsGBV19pci9xXtMnM34pbNi7j
         e0Kndd3hCTEY/coaLzeTUFPoRdY6QoyMPtgKrAdvXl2EsWzDJ/icDR5NjOgkTnKSFJsa
         cZrHm1qR3z4xbA8e/+VI+BvTWGgnjnhsRxgoiWBzvHmY1q9u9+c5f4Z5sUkwB8NPpZ21
         Z+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714499989; x=1715104789;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vseX6k1o+B5FqObwflCIgJI2bSMTOCAMOHrgjYjS0ao=;
        b=VSBTXpD2Drc8UWp0oay6mP6XCWxjYLUDCZkX/SFvUFRBeM9ZPneRYDnv2M07u/2jKS
         1PT5SvybkVO8F62LHJIOg9wenGZ68JI6/o2pQUPZ7B9iTdEBqXc+Q1eUGtmgXSHDrNw/
         2rcNY65YJUXzgDssCOKDQPvFnyJlhXXal7Wd1wg9pJxm8QMRtzmWvIU5GrX40D3RBqR6
         TRlXHv9uk2ohbJYsIjX4LTf+v//LdPeVnkQG9l0WbnSkpJvQsaDVXlzfnz7343Yvdy/V
         NySN6uH0BYw/X3JZOTF9Nc0j467PGpi2JJz2fD5Xb1vaue2A9bKHg4FG3XaZNeoKI23c
         MmUw==
X-Forwarded-Encrypted: i=1; AJvYcCWsrmyNMQ6JgytGXQMGUmwUvgIUKkeQOGj86YZw46U5B45fS3E5e9ve0sXSmwKXCfgsOcbmImcrqXjujQfp7d7hr1rx0LeD1seT5MBAIQ==
X-Gm-Message-State: AOJu0Yzx45xbEtuStgFPeIhmxQPhpiOIGPMZDo61wZS5vJ5N5IYNX57U
	3IpA5qBEa9MwFRv2/uDQT2a1xm3DdCS77tUjDdf3SzAEnnYSFoMzz5oEjsWybq4SfbR607dqSQn
	I5aSlW++nTlvtQkjAMD+0t6zztQHfo0UsCKBrQA==
X-Google-Smtp-Source: AGHT+IFxTsE2SveaRlTBhB+EE6DHBgwYOYt11ZOE5SdTfnq52tv68cpVnXh2QMmknwt5E8opTI/WtCOAflJ81I1ljMk=
X-Received: by 2002:a5b:648:0:b0:de4:7f18:4a3 with SMTP id o8-20020a5b0648000000b00de47f1804a3mr316138ybq.25.1714499989331;
 Tue, 30 Apr 2024 10:59:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123144543.9405-1-quic_bibekkum@quicinc.com>
In-Reply-To: <20240123144543.9405-1-quic_bibekkum@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Apr 2024 20:59:38 +0300
Message-ID: <CAA8EJpo2nU81K275eze9W_LyXwrrzP-u3DE2OaVfBgsVgHcK=Q@mail.gmail.com>
Subject: Re: [PATCH v9 0/5] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>, Rob Clark <robdclark@gmail.com>, robin.murphy@arm.com, 
	will@kernel.org
Cc: joro@8bytes.org, konrad.dybcio@linaro.org, jsnitsel@redhat.com, 
	quic_bjorande@quicinc.com, mani@kernel.org, quic_eberman@quicinc.com, 
	robdclark@chromium.org, u.kleine-koenig@pengutronix.de, robh@kernel.org, 
	vladimir.oltean@nxp.com, quic_pkondeti@quicinc.com, quic_molvera@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jan 2024 at 16:46, Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
> This patch series consist of five parts and covers the following:
>
> 1. Re-enable context caching for Qualcomm SoCs to retain prefetcher
>    settings during reset and runtime suspend.
>
> 2. Remove cfg inside qcom_smmu structure and replace it with single
>    pointer to qcom_smmu_match_data avoiding replication of multiple
>    members from same.
>
> 3. Introduce intital set of driver changes to implement ACTLR register
>    for custom prefetcher settings in Qualcomm SoCs.
>
> 4. Add ACTLR data and implementation operations for SM8550.
>
> 5. Add ACTLR data and implementation operations for SC7280.

Colleagues, just wanted to check, what happened to this series?

-- 
With best wishes
Dmitry

