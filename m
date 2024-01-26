Return-Path: <linux-arm-msm+bounces-8392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A884683D5AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 10:13:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66B4D286CAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 09:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1854510A17;
	Fri, 26 Jan 2024 08:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EvTDVmpk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB2614006
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 08:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706256618; cv=none; b=h0UHGXoiE3Tn/eIcCXXRoKodCd66X+QKBfAypV1dcdtnAFcWQzIdr1u7pJD9AHOGKruYfhf9AukFPGSG9Ep5ljP0J8TPqZm+iP9MyXLNbgLjMLR30+oO9ks1/9K2qFfwDnb/Njl15zXVt24bb1487xUmJf9AHb32MmFsoo2NdKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706256618; c=relaxed/simple;
	bh=t5Xk1RT4M0Csc/jUPQRNsGr5hsLf0lR7LKm1an0iRCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rj7EqGOVbLGC2wB8jruhgAzIewRtoDhSROBt2HBlkdV2aq1/kUjskuxHKRAy8RySPq/8GgAs7wWpv9+TH5R3/0u5NIf78YIus4rqoDv1/eZr+m/Uol57bOM67L9a7aBEicIHBs5uD6FJowdPsNRxcEHZJIYYeivIz8kEugyaBT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EvTDVmpk; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5ff7dd8d7ceso1352527b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 00:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706256615; x=1706861415; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t5Xk1RT4M0Csc/jUPQRNsGr5hsLf0lR7LKm1an0iRCE=;
        b=EvTDVmpkvsQdZ3ZGkUFiT2vbNBHvwp8RqWqb56jhlCsmaHiSns8fi/CyAHYoxLokan
         cygP1bDFibjMYUO94ENQiba9jBQubqe6magfDh28LwnSJKsPE/GBT1isrEMLUtoONaFh
         BBkk/F7qbaktqwwAA2vivk54tSY5AbMUpxi934AZVjFf/JGKrENi4XRi3GsLTOj25AQY
         dB3dCvSh6WdxpMEA0CdbBRd4M4RruCrwT0vfBYZVcjTKUVB1etKRxu5q0zLgszbw2RI+
         CO0j1n8kWwaP3oxqL6oCRBmxNHMPSR4ECzv5BcdBArPCYqKaHP87OX7M7aLWyZDPEKj9
         bIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706256615; x=1706861415;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t5Xk1RT4M0Csc/jUPQRNsGr5hsLf0lR7LKm1an0iRCE=;
        b=r2gtVgxCF6NfAGwFGFivTjTPw3Vic9HVgYpqT27CJWIDSdedh1sPuXDkeHK+qCHF5v
         gDwPtHfLVu/bIl69RxRic+9WHUfGxfXwaKsy8qjLpPnvVmFUDLZCOI4WqFIEB08V1vmD
         TEQ2TBwv3npu63ZFV0o3tSnL1MpzUKO6e5bJACY0JkZwbZ4yGqmdn5w5BiUHh6w2X9mg
         UDB8EPPu2qkaiC8md0z3YURcoCdUlvrAVdY8FWOwqXPZR3B423yOOv+nGeyxHzdNBStG
         ovFDrt98t6cIkLgxx2cSLOt1bkmtB5sEtCafuD82LxRGef9CxyI6I30DZyUMJkAaLnYI
         Vt6w==
X-Gm-Message-State: AOJu0Yzl6fCuwSguaWHOCzfV+W0lsJYT8HHbnUDs2xJb9MTLX8zPIf0Z
	NW1+azOwm5RjZaUgqYSsu91QvM/PgQAKisWFos10rNaXh1TlwoWNrKbsrIBu2c7DAvbwy1aLMAT
	5Jze5XYM40NleuVnzuUBWIgbxEjlr7hVpWYYquA==
X-Google-Smtp-Source: AGHT+IHnaNC5K++PdbgO7WEfWh0nVAaXrRXgiWebU6yDcX8FPmozYPH++dLrlUkis2bR82+yU94dtnUxE8v98Ryvz0A=
X-Received: by 2002:a81:6d81:0:b0:5fc:d382:4bfc with SMTP id
 i123-20020a816d81000000b005fcd3824bfcmr959161ywc.97.1706256615398; Fri, 26
 Jan 2024 00:10:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240126-phy-qmp-merge-common-v2-0-a463d0b57836@linaro.org> <20240126-phy-qmp-merge-common-v2-7-a463d0b57836@linaro.org>
In-Reply-To: <20240126-phy-qmp-merge-common-v2-7-a463d0b57836@linaro.org>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Fri, 26 Jan 2024 09:10:04 +0100
Message-ID: <CACMJSeuOmz2DC0m98k9MFx71A-9jyZkrWQMGt8DVUrqKJk-bsw@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] phy: qcom: sgmii-eth: use existing register definitions
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Jan 2024 at 00:23, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The Qualcomm SGMII SerDes PHY is a QMP PHY. As such, it uses standard
> registers for QSERDES COM/RX/TX regions. Use register defines from the
> existing headers.
>
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

I have reviewed v1 of this patch already.

Bart

