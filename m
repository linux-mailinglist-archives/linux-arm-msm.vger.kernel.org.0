Return-Path: <linux-arm-msm+bounces-46994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EB9A29F0C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 03:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 363DB168461
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 02:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DC214375C;
	Thu,  6 Feb 2025 02:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y4y+NCKA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2ADF13AD18
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Feb 2025 02:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738810749; cv=none; b=PgC5HA681NgTyL4qimkcVN0hChsGFH53wbBQ18ju9U3brHY4IY+zD5Pysls7fQ5tDwrvVdf9a4m/V1BXZ8EJjUoDWL4irZeIOzzaFkc3cJnUYuYwkrWtTj1xaOIoXtWMLLCf6fxHZohUcH3BjIy20lT1suC4NStS6ibUlqZRyKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738810749; c=relaxed/simple;
	bh=xpSXMWwlLNzKtWV1KBmP7Clwn+nFCQDYWmI2gagxk8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sff0dr0kFH0RJQ54cR/25nfcEeNbunJzrGcqEz4vlVtE2MF5ybsFIZeoV079KAJTs2w6CNvtiQI0W38VztvFnHeEcxWqkCvIGw4XYKLURumGOoHfZWEUmj8JQj3at1un5IT38+vFaZaHpKTvN65OLgt2i99hvDRlHuTHWi1XpQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y4y+NCKA; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6f973c0808dso4676787b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2025 18:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738810747; x=1739415547; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l/z4GkdOZvjEDxSCGrV/XIvnD7ZGn+b/HUYhhAqOYhA=;
        b=Y4y+NCKA29UoFk008q+tCxpiK1kFPoeB8a0KkRIa1t3SbDvZNIYctYV/qHaN9ZhrUn
         t5O4vOqJ9y2X19Gy1eL6uDcKHwpv/KrFZiW+y91U7gy9+sIG/+fNic2+UjKouNPb6czu
         56Rl7ZKjAOf0Q6WuJaZxjXqMHibrfHiB/zt0XGgP3G/G4FOth49v+jGdLMfSE3oxx6Jp
         BvNzO8oKs3GcHwYDhLydpn4+X/UZlF0a6dJ4JK9ISp16XYwhvaTsMU+d0CUp45+ffybU
         DZijJwsNdJK/PVkM7MDyf5YYH1MIoRlI/d0/QBNXXsDp/gMcc6Dw3DAL4UrqreYr8nM9
         NMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738810747; x=1739415547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/z4GkdOZvjEDxSCGrV/XIvnD7ZGn+b/HUYhhAqOYhA=;
        b=ouWhHINxA1PycJs9axYXUa2KWOwrWz3CGgqPCvkoTHMNoouj3dvJLjXCKGagEPzV4w
         W34Mtfhj0xRCQN/RwD01Q3FrP32lxY9CjIOYdmC2n63oO5PGYJzEuoapWkA3PT2UWvFM
         9e71s7ZcFgnQWO9+VSYyH40F3WGM8TeHv0R9AhlHCTzD7mD+hASiJlssbJs60d4O7VJF
         vHZYAxEGQZ7IIIw145xsGCZFmGCz7s8UIRRXGAfeW3scjs0EG3KrVRxEft8TJYdWaZPN
         cfbqQ+ANF2t0k5kYnDGIdUCwXoCFBBfbSnor75prBmnB06nwsEY3vhqBc4B9np/PrD9j
         WS8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWRhwlAAxBRx0GxbopBRW6kbacd0mBllPjO0bTHdPtL/0lmbRKYTY426OKRldfWp8kRPmPyGh9kIrIcIX/x@vger.kernel.org
X-Gm-Message-State: AOJu0YwWC55t7xmW26DY+ICf/abYUUMYar7yS+2fMAQz/Lqw6/6FTPV2
	kQBqHaBUBMI41OgMAse5KFYlZ0/QzXE1cjU5ZN9qTXXdSDAyQoeJnXlhCAKuH12ViLnXoSUaCya
	LjB2fvRZrEvAqErPK5V/V97AXnj78CQL20FtDeA==
X-Gm-Gg: ASbGncsc1+OqEBMIopiajzP1DK44Fe5Z0JzuVujdOTVkf8gCgMehS264rSWV0ekKuBF
	gVVGHE4yh0wwPAxDahjyvbJdHPzrUPY3VrU4RjPUYFtrobXbiaGoZZMf8QDSb4A0lBKy0dz8=
X-Google-Smtp-Source: AGHT+IEUCXp0Z6BlIVSlpQmYiCrMVoIPfBcbK31DQrOkfatSXI/CWz7ZdCWEVfMxuC5acrdTbio7/U55cACpK70t4Vg=
X-Received: by 2002:a05:690c:630f:b0:6ee:a81e:6191 with SMTP id
 00721157ae682-6f989e896bamr49344277b3.22.1738810746798; Wed, 05 Feb 2025
 18:59:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAA8EJpq=QRbWe6KTxcmHkHp20rgEgLZeGYV7+Hy2Qkfo_MyV1g@mail.gmail.com>
 <f7818536-4aff-4320-a9eb-9d755b86d6d8@oss.qualcomm.com> <CAA8EJpoEpbtEDU1kC8xMEM8dxGzG31vSf3wFsaG8+CZky4sanA@mail.gmail.com>
 <075e8192-09bf-41c5-863b-5543d7cd4dbe@oss.qualcomm.com>
In-Reply-To: <075e8192-09bf-41c5-863b-5543d7cd4dbe@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 6 Feb 2025 04:58:56 +0200
X-Gm-Features: AWEUYZnVcPacMIF7Wom4Vrv3DZaPEs_wyOvXgEI_JjKTnPB6g9rDSgpN89MnBKA
Message-ID: <CAA8EJpp6-cEjrrY0J1ueT57SVP-k471EosJ3OnHjb-i7JYW96g@mail.gmail.com>
Subject: Re: ath11k-firmware: WCN6750: hw1.0: Qualcomm Robotics RB3gen2 BDF, v2
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath11k@lists.infradead.org, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Feb 2025 at 04:31, Jeff Johnson <jeff.johnson@oss.qualcomm.com> wrote:
>
> On 2/5/2025 2:12 PM, Dmitry Baryshkov wrote:
> > On Wed, 5 Feb 2025 at 20:46, Jeff Johnson <jeff.johnson@oss.qualcomm.com> wrote:
> >>
> >> On 2/4/2025 3:05 PM, Dmitry Baryshkov wrote:
> >>> Hello,
> >>>
> >>> With the hopes of getting this into the February linux-firmware release:
> >>> Please add the following BDF file to the archive.
> >>>
> >>> Changes since v1: added regdb from the same archive
> >>>
> >>> * description for what hardware this is
> >>>   - Qualcomm Robotics RB3 gen2 platform
> >>>   - WCN6750 WiFi/BT chip controlled via the remoteproc (DSP)
> >>> * origin of the board file
> >>>   - It has been provided by Qualcomm as a part of the RB3gen2 firmware
> >>> release, licenced under LICENSE.qcom
> >>> * ids to be used with the board file
> >>>   - WCN6750 / hw 1.0
> >>>      bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2
> >>> * md5sum of each new board file to add
> >>>
> >>> 39b270f43cb6d733cde607bf2b23e2be
> >>> bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2.bin
> >>> bfbd247fe961dffc4e7fb413703fb284
> >>> regdb-bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2.bin
> >>>
> >>>
> >>
> >> staged...
> >> https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/commit/ae4407c02a434534590dec3e0ef26b371fd7888b
> >
> > It's proably not worth it now, but it might be nice to have a
> > changelog of any kind. Like 'added BDF for Foo Bar' / 'updated BDF for
> > Foo Baz'. If that's not too troublesome ;-)
> >
>
> The problem is that our workflow from CLO to our ath fork of linux-firmware
> doesn't maintain any history, so any description in CLO would not show up in
> linux-wireless. I actually had a descriptive commit message for the CLO patch,
> but I was convinced to drop it in favor of the boilerplate messages that our
> tooling produces.
>
> I'm thinking that in the future for community-contributed patches that I'll
> insert myself into the workflow and rewrite the commit text before pushing to
> ath/linux-wireless.

Thank you! This might indeed be helpful.



-- 
With best wishes
Dmitry

