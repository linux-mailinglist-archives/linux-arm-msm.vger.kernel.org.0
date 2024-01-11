Return-Path: <linux-arm-msm+bounces-7031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A8182AFB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 14:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 659DE1F21279
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 13:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B40171C7;
	Thu, 11 Jan 2024 13:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tz9BXRNa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3CE171BF
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5e778e484dbso51335567b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 05:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704979883; x=1705584683; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kR4iLNoZiwG/7QwKJJ9btHkikLkNjD3TWvfuaGmalOI=;
        b=tz9BXRNa8qp2maBq94QSYH9wVNNzjuqtDneoqgLkPDSOE/Qv9XTuAWO39g7/d2NNLc
         LDHqi9v+povp4CnkLyKcyJa0zPD7dKSYnu5DzbtgO3FzQHSbhuzQCBTIw3qkPR4mz47R
         58tfL5++UOvpWalXIzEp1BKkUENxMJ4PP7sSfm1T7d8VnzEocJ15XAHPMWtj9XEm6Dsw
         dnelVWikozVcx4hfSHtwvff5+havxZPYf4YhypBE1Xo4SFaxregjB6Xbaun4D682KxUr
         xiyjID7zz8tUiG8WnaU+lvsyH3Km2c27QW9OS5MScx4IvR0oIjMJ4wkpCUcxYVDlJiv5
         IsaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704979883; x=1705584683;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kR4iLNoZiwG/7QwKJJ9btHkikLkNjD3TWvfuaGmalOI=;
        b=F2NOkcrvNVSf756kiBjqxG41gTc5nMvxa/NbBElSpCQVDTOh6tsOifKQOSLxhI6Peh
         gG89SIpbcPOuMoCAOLV1dVxi/rl7YAtK42cnkGAeryIn+4zGmgmLY4W7C6RQ1kHYCGzA
         3jIWmFD2dqa5BNGHx+ti4QO0Tc80kEjQvx8vn97gbJf/9fL95HkMyAtkDNJM+Z/A+kPV
         ttY2F4IBdsphAQ/iwajc7wjoR9LgIImvEW3O1unsNopKvrZ5L4/dAerLIEPYi18MaOlb
         liMKFkkS5vWblnxzFQydi8JqHqkec65BBFu1hsjZI6RfnnyECDFeqot6jfIO2pN6M2/A
         qFcg==
X-Gm-Message-State: AOJu0YxicQt0ZeLiWv960KaLn7KOSTR51EpM/dm9qpaW9wHZDwUrSeck
	vM5m5RupVXLkHiuUR6vd3/ZE8QcFx/N+jLAcy1A5M4zpGcZ1lZZPP67Y9qzBpvA=
X-Google-Smtp-Source: AGHT+IHFXBgcqQL8Xcd10mab8p43dzDdPPpnSiAY63imAg2nnprwbdnPqjTZIjXowFSc3VUfHSYO0G9a7psNfKzPkB4=
X-Received: by 2002:a0d:d74f:0:b0:5ee:6c5b:b1d with SMTP id
 z76-20020a0dd74f000000b005ee6c5b0b1dmr581799ywd.10.1704979882903; Thu, 11 Jan
 2024 05:31:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240111-qrb2210-rb1-no-cluster-idle-v1-1-cec14ec15b02@linaro.org>
 <046a7bd3-3791-499d-a604-ef408d3d8aa2@linaro.org>
In-Reply-To: <046a7bd3-3791-499d-a604-ef408d3d8aa2@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Jan 2024 15:31:11 +0200
Message-ID: <CAA8EJpoBmzqxuCzAK6APtCzbaU15Uehw8BTp0SjEDSFaMo30dw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qrb2210-rb1: disable cluster power domains
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Jan 2024 at 15:09, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> On 1/11/24 03:01, Dmitry Baryshkov wrote:
> > If cluster domain idle state is enabled on the RB1, the board becomes
> > significantly less responsive. Under certain circumstances (if some of
> > the devices are disabled in kernel config) the board can even lock up.
>
> I got that $sometime ago, but can't repro now.. which devices being
> disabled would cause the hang?

It was reproducible with 6.4. without this patch. With 6.6 I can not
easily reproduce the hang, but the delays / responsiveness is easy to
reproduce. Compare for example 'ps' output with and without this
patch.

-- 
With best wishes
Dmitry

