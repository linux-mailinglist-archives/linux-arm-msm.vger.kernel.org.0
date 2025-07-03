Return-Path: <linux-arm-msm+bounces-63537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FD5AF7721
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 16:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5D5416577C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 14:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3A42E9742;
	Thu,  3 Jul 2025 14:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FJka/BVM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842691F16B
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 14:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751552301; cv=none; b=Iyy2QzBZiTSbA1f98uyZErJBXxeETgmTC0BC48V5xpPO+U+nXKu0S9V78uABkNAOLRx2pvx8t8PAYaW3bB7VioOUXby+1Fkf2LxjPxdb6TukCg/jcz4ikLJxLOmY4WiqhkJ6TsNNgeteRqWLm9fPpm20tT36hR8TGbVORith77c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751552301; c=relaxed/simple;
	bh=lDEriJrBoc3Z+FCyx3l8NGEqH25UvL1Vt5miiyOmCZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YhuX6oXLmup0cziMmXMiXTRBsdJ95M2Dk2eTFkPxCwkJvS1di0H+kv/KrJ7a8jFLlhYMK0P8yGDdnpwYvI+PuTiQkCR8+cDaCn9jeoREM83FLSf66n8mN/+j1B9avufEHhea3OwlXP9bqjb4NY0BixMiVL4lfGIxh+jBNIm6PAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FJka/BVM; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7111d02c777so54104507b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 07:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751552298; x=1752157098; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lDEriJrBoc3Z+FCyx3l8NGEqH25UvL1Vt5miiyOmCZk=;
        b=FJka/BVMMa+CcS/D4YzLm9Y/gi+MKnnj/rNU9tmjKjS45mywk7ii/fVMjrRmJpKpbB
         jMVcr6S9WjGSDkBcxWG2BFzItagHdmlaOUCTgKA+iYeSKfXvKLFlV9ExcqaQREPYDz7B
         9wsI2/ionZg6qtwcxMf3suOy9MnqaMC5Elhn4mjCMzREwMNbtMWX9v0V0hwmTvfuX9gm
         l3CDEN5XjV7ey8b90migl09S8IHVfUZO8E2cTRm7A9EIEA1z61hJ3OpALVHQnLLHmZHv
         CE4YEvBsbMDARxEAzAAbQ935pIgVBt4PtvlagID95K27lRykHMjHARP8QK0WoocRXpYm
         XroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751552298; x=1752157098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lDEriJrBoc3Z+FCyx3l8NGEqH25UvL1Vt5miiyOmCZk=;
        b=n0fm8wJcgfehn80KOEeMrJeVs0Hno74zoKM5cnihylOTLYg02lquIEWJ4PaIvXzUWy
         XsqCLOHrbXYRnv5pccNjlEp6ODAkLWOKPreEkHevR5irGALmedkNqoolmIFTBO2XhL6A
         jAmsAUrE3Xo17mVq/4xD2iEH+mgsnpDQ3VLW/u41tT1E8nWTTH9UpSClLcuqC/BSczl2
         dfNWiQfRMYJsELbwuvD/Lq8S9MeCQTG4EPj+ReTHzcn+A+rNtWLwvxHdH6TGGLOJnPcD
         fkBEXKhW+4ETT22vlIcNG6xkubY+LeyvvxhBpARBG3XTpYqypcojs4mgRXELiXfIXCGx
         Ilig==
X-Forwarded-Encrypted: i=1; AJvYcCVwjm6Widg5nnoeT+dfHel6hI4DR0d19cilxKHoxZwPH/cDg5JyA9sY3OFj2GufJ/L+SAu9aGUroS5WjN5a@vger.kernel.org
X-Gm-Message-State: AOJu0YxUWCoDdHLbRWFCWVTOQRZiuea07/YgXJmJvywy4O2HTjL2bXrP
	d6WeHkvNKc9EoIENB2672VAmQDYYQFIulhoaUKuqZb6muYM4fauVyh5I1I1zn6RseObtt6Q/Q1+
	3pr8k7i0xRrNg8y8/OiyTJ3LTcFbijSgzdwI4nNrpVA==
X-Gm-Gg: ASbGnctx7k2/8EYOFlxjnnXwNYTN5KSP/cJ8PpP7XAv/F84fBJJYRO5ulSxQ1mA/P2X
	FUsLBonFcuczadulqv+J2Wwj2R3x3GlNbXWz1I5plNhf3xvwfdPtGhLzlHwuIwhcwd/cEegDP2j
	3yxfmNe/Zg2MLF/EN51XW2WkUMnX+NhtYCIjYj3Xf5i1vv
X-Google-Smtp-Source: AGHT+IHKCVcm58iGQvDz5IlH+nt0wPYjDF0vM/IkWNqcRP0IW3DHZFT+X09mtu99FrvVXSO9bQ0r4w8ZqDRsbPuqnNs=
X-Received: by 2002:a05:690c:4:b0:70d:ed5d:b4b4 with SMTP id
 00721157ae682-7164d3f1568mr98778977b3.24.1751552298210; Thu, 03 Jul 2025
 07:18:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701100659.3310386-1-quic_sartgarg@quicinc.com>
 <c7lpaij5f5monr7zfeqitncwnau22iollid2gs7okyorlegtmg@jlq65x7ipp25> <9db5d1d4-1965-4334-9540-fbb66498d7d5@oss.qualcomm.com>
In-Reply-To: <9db5d1d4-1965-4334-9540-fbb66498d7d5@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 3 Jul 2025 16:17:42 +0200
X-Gm-Features: Ac12FXxdoEtdtcX4FMKf6jgOtjpthIQIwg_rwvmCiwfJ9Oh4FD81OkKMZc8cM-Q
Message-ID: <CAPDyKFqh9tUrNGRj3xnRGtT=YxX5XhhMcWPCTATdon_joVHqAw@mail.gmail.com>
Subject: Re: [PATCH V3] mmc: sdhci-msm: Ensure SD card power isn't ON when
 card removed
To: Sarthak Garg <quic_sartgarg@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, linux-arm-msm@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_cang@quicinc.com, quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com, 
	quic_pragalla@quicinc.com, quic_sayalil@quicinc.com, 
	quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Jul 2025 at 14:09, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
>
>
> On 01-Jul-25 12:27, Dmitry Baryshkov wrote:
> > On Tue, Jul 01, 2025 at 03:36:59PM +0530, Sarthak Garg wrote:
> >> Many mobile phones feature multi-card tray designs, where the same
> >> tray is used for both SD and SIM cards. If the SD card is placed
> >> at the outermost location in the tray, the SIM card may come in
> >> contact with SD card power-supply while removing the tray, possibly
> >> resulting in SIM damage.
> >>
> >> To prevent that, make sure the SD card is really inserted by reading
> >> the Card Detect pin state. If it's not, turn off the power in
> >> sdhci_msm_check_power_status() and also set the BUS_FAIL power state
> >> on the controller as part of pwr_irq handling for BUS_ON request.
> >>
> >> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> >> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> >
> > Should this be handled by the MMC core instead?

Ideally, yes, but honestly I am not sure how.

The current support by the core, detects that cards are being removed
and then it schedules the actual removal/power-off to be managed from
a punted work. This seems too slow for this kind of use-case.

If the core would try to inform the host at an earlier stage, as soon
as the mmc core detects that the card is being removed, would that be
soon enough?

>
> If possible, yes, but if it only works because our hw-specific
> sdhci_msm_check_power_status() behaves a certain way, it's good
> to go as is. I have no clue if that's the case.
>
> Konrad

I agree, sdhci_msm_check_power_status() is certainly HW specific.

That said, I decided to apply this as is, for next, thanks!

Kind regards
Uffe

