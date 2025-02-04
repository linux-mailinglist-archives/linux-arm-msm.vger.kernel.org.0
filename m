Return-Path: <linux-arm-msm+bounces-46893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1651FA27E48
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 23:29:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86D653A48B9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 22:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82498218E99;
	Tue,  4 Feb 2025 22:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nNmAXepE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C2C1FAC5C
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Feb 2025 22:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738708150; cv=none; b=n1KzbfSKe5bmZfD4atK9ABXk5IM3AGCRhYlClE9knP7UgeMCsAMvZQjPyAt5Jcc4RbEmkSw5Y2NH6h/rJWjAKpiKQM4PAaZBt9KU/Q/XU/Hfct6zXrFfbwk6gYl/6SYiVbq5mSY69z3rzPzrDiKvG/zSO0CfkUZbrwM0QCnBc58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738708150; c=relaxed/simple;
	bh=1srAMdTgDAD1uZT3jYX/lYOWOeUKIuhaqZHT+H20o3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hM8WLc50NX+ONFwjIsFt29NuNDDNEeaNC6zmsmiLcN+mtaWUwdvCgyZC3cKzdZkPCOYlZkQEY95/6OIVTOGn0l+ZDTylpW7EktTvSPhRhxppc4Li6EKH/vXPPcLJy5IIsMpyUC2QfuJWeMq7dwSfCTDMtcSaetcPMSaaU/6PeF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nNmAXepE; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6f47ed1f40dso39199607b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2025 14:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738708147; x=1739312947; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ImqaY3OF0rdDd+Pbpd6r6Vx870LXLHen1oIkJhHNXak=;
        b=nNmAXepEg+m6tMlKr9uknLXN7NhrERXcAGIVG9t5hLIGsmvfjtlH3liq33mqhYPgZz
         XDx831VFJ166O7U80xLfNi/zxkmdTEYcvrfXsRnG/648pqhgRRbGynlG5Y+xsEOpGCfG
         GyUXz/TTgGJqpUsyBD/xc1TyRS/3DdJw6WxDIQdg+aebrnVjvJqVN0tKiraEOaT5JPw8
         aVjpYeidJieweuMmdjZZqz51k5NaH+35HqlV0qSvul2LgN/zKrrhkJw6pMdJsOrrtuc8
         tIFrZYO/aYQbc+hqQXCQpToTrrWjSaGJ0+DlwCpRysFMQ1Jjg4x8mrSGyDkQuHSI6KHR
         IHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738708147; x=1739312947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImqaY3OF0rdDd+Pbpd6r6Vx870LXLHen1oIkJhHNXak=;
        b=VIB7gIJQ+NU3GqIzmoSK0Tz82H9N3qIgznMFZPVTjys8YWJAyjNaynpZM3gntWByw4
         MKYRuwiWokVfSvmoGKxBeJYiLXha9e0vl/bxA1EvZSIr2JtNI8qGB0j/wLePyuG/DUjF
         WMPyYjBmSGj9qc2U2nGfAAE3xWTM+kHTKnB1zSj2pQtxAHXiP9CY/6gMa/XQC6C+XF2p
         HFxxkVo6NG0wRdCnhpZtiBFckwDuU6Ll4biu8V7chL8N12IIop5WxXf3vaXLjeEFKLAh
         xIEm++0jrWObVQR1DwH3yBdRILP3Pqq89I4/BdVFMQ5J8txMYDh4ZjWJa/DvkeJE7k3M
         JMDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrfyrbg23iPp75uOl4VaM7MHTxoZZx+RAKoiQLBNtnqy4A7QeaPCcdkCDmix9uPhVA9dlctumX1EHmrJnL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6j/UBjJwnLUpucadaoaTBynyKWgeJsXUlsooak4ivb9fMwHex
	M+/SQQ9zOrRtHtdBGgJAz+kS6t/XEweZOUfiZ5v6E1wZASs6KWPWvRQL0I32BR9dCRGJPRuwPlb
	yPHwGzLEofp+bJT0Zt5zc2V5P9b3z7+Y1Sb7pQ9Fu3hveCgvzVNY=
X-Gm-Gg: ASbGncv9MyLR9/Woc5agzJO8ZM/zBwVdyjZjGZJ/FywdqzHl+9SzuRWdWAH/eAIUC/I
	7MIWstopouY4KZbeqVvq18l/z73os0PEzHhO719ow5iXnrNO8bOXHCrFAw35dtJ7Jr6TjQ2v9Yh
	tFxBwiygkfBlFLZGrG5Ub/HSw0Hcaxog==
X-Google-Smtp-Source: AGHT+IFMzVpiKJN3Up/zy+FcwMndInTiEvF5Zvm41XRTBqdUWDxnqcHITL7J8nYNiiJQtT4eFFxPkkPKXSA/SFNPmL8=
X-Received: by 2002:a05:690c:d1f:b0:6f9:77ff:7c08 with SMTP id
 00721157ae682-6f989ee30c5mr6574977b3.19.1738708147418; Tue, 04 Feb 2025
 14:29:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAA8EJpq6P=ENtPHxAseD2dbCmxLJ2g-YVrNHVehgQh4tHk6tdw@mail.gmail.com>
 <c6e4511f-ee56-4df1-9dd1-1ff47b2c0f0a@oss.qualcomm.com>
In-Reply-To: <c6e4511f-ee56-4df1-9dd1-1ff47b2c0f0a@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 5 Feb 2025 00:28:56 +0200
X-Gm-Features: AWEUYZl6XV-N_xFfY4J28X96EZhviKLx_3l174-YBTa6UJXcM5rm1sebz6WufbQ
Message-ID: <CAA8EJprWdviez20LSjUW+NmEUm5zubqqEQPrDBXn1D1F_Q5xXg@mail.gmail.com>
Subject: Re: ath11k-firmware: WCN6750: hw1.0: Qualcomm Robotics RB3gen2 BDF
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath11k@lists.infradead.org, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

On Tue, 4 Feb 2025 at 19:11, Jeff Johnson <jeff.johnson@oss.qualcomm.com> wrote:
>
> On 2/1/2025 8:03 AM, Dmitry Baryshkov wrote:
> > Hello,
> >
> > With the hopes of getting this into the February linux-firmware release:
> > Please add the following BDF file to the archive
> >
> > * description for what hardware this is
> >   - Qualcomm Robotics RB3 gen2 platform
> >   - WCN6750 WiFi/BT chip controlled via the remoteproc (DSP)
> > * origin of the board file
> >   - It has been provided by Qualcomm as a part of the RB3gen2 firmware
> > release, licenced under LICENSE.qcom
> > * ids to be used with the board file
> >   - WCN6750 / hw 1.0
> >      bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2
> > * md5sum of each new board file to add
> > md5sum bus\=ahb\,qmi-chip-id\=1\,qmi-board-id\=25\,variant\=Qualcomm_rb3gen2.bin
> > 39b270f43cb6d733cde607bf2b23e2be
> > bus=ahb,qmi-chip-id=1,qmi-board-id=25,variant=Qualcomm_rb3gen2.bin
> >
>
> Qualcomm will handle this, pushing a BDF + regdb.

I'm sorry, I don't quite understand this phrase. I'll send v2 with the
regdb included, letting you handle merging of those two files into
ath11k-firmware and then doing a quick PR to linux-firmware (it would
be nice to get it in before the February release, ensuring that they
can end up in the next Debian release).

--
With best wishes
Dmitry

