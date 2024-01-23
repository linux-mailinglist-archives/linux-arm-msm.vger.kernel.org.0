Return-Path: <linux-arm-msm+bounces-7994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C51383951B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 17:45:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB759297381
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 16:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C781781AC1;
	Tue, 23 Jan 2024 16:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dxZqdEO1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF7B7FBA7
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 16:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706028008; cv=none; b=F5ElPlUChFr0045zGP2EtGYOIygvSECvABECQuvFQ0ufPqctKYfpf8PzJg0g6a0BK66f0O0T0GHL2XsU/fr6/Zblqc9BPmMd2pcvB+Ofy6XNq+6l1BBKcp0/9SzbEeDjDHAHeVKTVtmyCjn2eC+CRNlw0Wj6ccTYizmRFX6T8/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706028008; c=relaxed/simple;
	bh=/Lxu3ibdZFwYSpIB8dDpNCNVTxZpLUd0wwrOHEKIIQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tdoiL1Uuyrs9eO43mhFNVNlkNeGSsFswMI4yCB8vQweASMM9MNCkCPNrXeUv9dzfb7FfSO23wr9cduyXT++LYnWFP6AOvTJfQp9Sa98PTLii0p29wkLt6DKGoZw2PNfgKeKGx+qHEzgniPd3hqOzHL2mYolBDUjPKfFiYPwV3T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dxZqdEO1; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6000bbdbeceso19822847b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 08:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706028006; x=1706632806; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kYAfHM7R7rnCSNUY4kqAV2WMKXhdQppzOOG2/3x8MBw=;
        b=dxZqdEO1gwZXch2pvaryaG1ruVjEpNldw2gEI+BcuOJsGkzssciyTeEPBs1En7uh5q
         EXfWLKmnsDISDuT2cY/6l9h8RGTcX+hlvyv2mIp52ngVPbhdirRaewI5cU9l5eqcLQ+3
         WT6Puk8/uxKKjGjCAQRO4Q/Hf4kVPdWi/g/AZ/pWcRthujHpiT1kU3EyyzV51pTeRrvt
         xmLXThbQRUikjifQn3JJnG5Aeaee/RkI0TsS3jOLE//JD8b/upxGb0hfi+Lc3iuRzXbs
         g5l6Y1Q5KX1aWqrlF/CxuoLeOu5cTmOfNzINjfpvctP2gMEqCnMI11/Lqv40jw7e805m
         +Wug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706028006; x=1706632806;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kYAfHM7R7rnCSNUY4kqAV2WMKXhdQppzOOG2/3x8MBw=;
        b=r+KgtfkBD2F+W/0vkxOH+ENmtUFkwZqn3akd+PDTNcVDGBaXWRm6hxiQ3wpmD3lRxk
         Y9cvNCnCvYE0Ia+a/e5vY+S2UIJXARI9lD+u0LOxid651bK7/BBgSMgxKGGlqHHuGvJB
         JMju6OY6CgRoAZuxwuN8vyHumHBB2g4EaQsu0ZUQcTueiSeHh4Sn3awvccsD/bIGK5Ow
         +gcGTx3yDLxFhDbMvDHNNGFNodv2ARCULojDMcR0me152HZ+ZVPOb8KujBsBDgUOgqiw
         CZEdhhLgbkHupmMVOGQPpvMrq5Xni5vipTTR1M3tNGyFo3qKkcxLlX0pJ1Buoia4UtD3
         HhHg==
X-Gm-Message-State: AOJu0YyIaAzDmYFbo1SxTubyqFEFcG9OeEFCkt8RKUhWEhNOahTBmruB
	4/jDiudTL6wNtFHpIV2aRDFOH7rvu+bkNhf79uBXwCL5YcCoPlQC7+190nmCCQ48cTyLZp8nRXh
	wYn5aP4rga+xyNRfC5JcLaIO4sLfZNYPnHtqW4w==
X-Google-Smtp-Source: AGHT+IGC6FCCx/JUl5ZF8p8TNRTwdcBW/FXg69irqngvfoaQBTfEyAlrxYiVawNtHkSVTMOs3vcjUvi8P3kIalAiNeE=
X-Received: by 2002:a0d:ca95:0:b0:5ff:e530:eeaf with SMTP id
 m143-20020a0dca95000000b005ffe530eeafmr3085307ywd.2.1706028005745; Tue, 23
 Jan 2024 08:40:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1706026160-17520-1-git-send-email-mantas@8devices.com> <1706026160-17520-3-git-send-email-mantas@8devices.com>
In-Reply-To: <1706026160-17520-3-git-send-email-mantas@8devices.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 Jan 2024 18:39:54 +0200
Message-ID: <CAA8EJpqLYmpAt5D6g01Urg21ie7PpHkj3DRuxkqm6Epanzuksw@mail.gmail.com>
Subject: Re: [PATCH 2/2] phy: qcom-qmp-usb: fix serdes init sequence for IPQ6018
To: Mantas Pucka <mantas@8devices.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Baruch Siach <baruch@tkos.co.il>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jan 2024 at 18:10, Mantas Pucka <mantas@8devices.com> wrote:
>
> Commit 23fd679249df ("phy: qcom-qmp: add USB3 PHY support for IPQ6018")
> noted that IPQ6018 init is identical to IPQ8074. Yet downstream uses
> separate serdes init sequence for IPQ6018. Since already existing IPQ9574
> serdes init sequence is identical, just reuse it and fix failing USB3 mode
> in IPQ6018.
>
> Fixes: 23fd679249df ("phy: qcom-qmp: add USB3 PHY support for IPQ6018")
> Signed-off-by: Mantas Pucka <mantas@8devices.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

