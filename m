Return-Path: <linux-arm-msm+bounces-6512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FE3825350
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 13:23:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94B921F218E9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jan 2024 12:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977162D609;
	Fri,  5 Jan 2024 12:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nNWtshWn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D062D602
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jan 2024 12:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dbdbfaab70eso1283080276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jan 2024 04:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704457381; x=1705062181; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C991Kcbi8EdmQDb3tJTHkkPG5xfVAMnq4S41RyLoAJA=;
        b=nNWtshWn9oJvdWnyqS+Ns9La/+xMhCn9m/A9Svu7HtKmnCPhFhAW7vAcqR0lQWVn2O
         dsoXAuFj3B1N0Q04ZzhunxyBifeowuaJwolIPOMsyfW5mH+eLCB/HrpKGwNvxUDwhxtA
         m4lJcZLzDIYyzqhh2XX6wmkk9NXNc7/RAhYBDPvvakBojk0vU+s976y2rwys5s3lshiH
         /kN5qAtYbeN5K2ey1Y6IGk70S9QeD64R7kZte+LeJiSrIRQV2T4qyeKwOpBMAsu7i8Gj
         zc9VTWGi9SQL0ULdm/2Cj2fqUu3YwKM7tfpFz1TJNEPb4UL6bV5DSB+2FyBSAr3QqDNz
         m09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704457381; x=1705062181;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C991Kcbi8EdmQDb3tJTHkkPG5xfVAMnq4S41RyLoAJA=;
        b=Y/UTUikecapdbJ8AVvT6jyMPfIMma6uV7TpUfsU1HM3qRq5HwxdCGpx0thq9Lv1t8i
         /Jwt8URNq5dL8u6SbtXVtdjHOSE6dxNWQZ/ih6Lw1CS5G32piJ0jBCohMxvfUAwKid9D
         skvPuQetaD0oSNBBIyNrG3PHmgYlzidQYWY1GjoWDQh7fKRN9F53Xy9ON2i5Bt3OqdVM
         Jj226MSTtF1OHAbnf9So3Ms9RVDc65L5W8zwdWm4eBB2SXrUOjud+3mNDOHYtl0QQmFP
         vNyFCZ1BWmlmRmXLSkKUCABWS28neG6UPozG5Vr01AYWc4wfGUxBVphOZ/CaIba7+p1R
         wziw==
X-Gm-Message-State: AOJu0YyBtk7q6rLNqKoBHwujkcvq9WLqXksxay6RABGwSCVRJCxevhgL
	+X2Cy5kNtUkMiLmaBJOeUCpz2/GSCDJLlIpjkd18Xn4EjBsOjA==
X-Google-Smtp-Source: AGHT+IEQgV5OrCEbtp12b8sdijpFbATgHeBlCuEInqUi0Sz+2wa1gWwH/h4tiEQ1nlBc7EOO+X2z81ICI/1YvwpoHec=
X-Received: by 2002:a25:d64e:0:b0:dbe:32be:f6ab with SMTP id
 n75-20020a25d64e000000b00dbe32bef6abmr1591563ybg.47.1704457381162; Fri, 05
 Jan 2024 04:23:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240105-phy-qcom-eusb2-repeater-fixes-v2-0-775d98e7df05@linaro.org>
 <20240105-phy-qcom-eusb2-repeater-fixes-v2-2-775d98e7df05@linaro.org> <158df3b2-a7fa-449d-9cc8-1e4cdf6ef49b@linaro.org>
In-Reply-To: <158df3b2-a7fa-449d-9cc8-1e4cdf6ef49b@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Jan 2024 14:22:50 +0200
Message-ID: <CAA8EJpq88bhFFY2RcSEqaecoTw4a_ps6Osx5rJs3s0Mi7toXyQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] phy: qualcomm: eusb2-repeater: Rework init to drop
 redundant zero-out loop
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Elliot Berman <quic_eberman@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Jan 2024 at 13:44, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 5.01.2024 11:16, Abel Vesa wrote:
> > The device match config init table already has zero values, so rework
> > the container struct to hold a copy of the init table that can be
> > override be the DT specified values. By doing this, only the number of
> > vregs remain in the device match config that will be later needed, so
> > instead of holding the cfg after probe, store the number of vregs in the
> > container struct.
> >
> > Fixes: 99a517a582fc ("phy: qualcomm: phy-qcom-eusb2-repeater: Zero out untouched tuning regs")
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
>
> This looks good as-is, though I think my proposal of storing the
> peripheral base reg instead is still better, as it'd require less
> memory (no kmemdup as the regs wouldn't be modified).

I'd second this. We usually handle such cases via the base + offset
rather than patching the data. If regfields can not handle this, then
the regfield should be fixed.

-- 
With best wishes
Dmitry

