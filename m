Return-Path: <linux-arm-msm+bounces-25534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD0392ABC6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 00:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A6D1282A00
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 22:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBF114F9C5;
	Mon,  8 Jul 2024 22:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hq5AqRCF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4AEA29
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jul 2024 22:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720476694; cv=none; b=CtzE4Os130NAohASyPp+Kbk/kL57RlW3vbeCMR0jQkIaV/IauK9LFtFAt2nVZrQt+0FNHKdDja9vltxHu7LK94hqvBkCfGxK7f1v4EbvZDYuihuFlRADknjd+LvwMRG9bpDhnd58bv3IL67IxCJowk40MyzALarETo9b9KjfzjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720476694; c=relaxed/simple;
	bh=6KvmucEde1tcRldkCNw+wTdczGIhi8t85g4FHyGU7SI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rk6+P2sDndwMdYJQZPc+gdmES2kvjqv8FKpfx65I/E0T0X1FnF4PxZgpnhHwYmZ00ou0h8on+exautNrc6+EKcxfOmqZDowR98R3qDdD2oRrWf7xvMXNTaKSdAqSfVg7fkFdXtyfKZHvewzXVIHMGU26ggrRgAOPDVLi/brBYzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hq5AqRCF; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-65465878c1fso34423617b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 15:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720476690; x=1721081490; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=akSjRnSmQJXB8QkjLs5AoCqiPkMwFsS9lxtSRUZRr8U=;
        b=hq5AqRCFQ/7AhtO/U1KxZQCwwLFmJeoG63AzMV7auReAU3efFLVOI9v9pwLZOr9zTl
         8JUigL4l1Bk2QFGOsm+of0ssWywb5/8rSYU5RS3DAe9F8EuvxKRICJEHSN2aV+IlauJR
         IVuMIiqO4bR9ErrXS6CEplpPVAEryfNMoLdqCvWK28iV3njy6iNGh/2pVn0c66RTdedR
         7u1s9xBJp42jNdPWJ7qZLSweQsYfsjteqxP58E1QARoCcbocLHpizMUEZ+055P3aSRBm
         O4T9v3hLRdpEcI8vuG4A0yMldN964wou93yC398zmMNI2UwSnUQAzKS9bigC+j2uZ+FP
         adsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720476690; x=1721081490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=akSjRnSmQJXB8QkjLs5AoCqiPkMwFsS9lxtSRUZRr8U=;
        b=wzAJcH5JAFGWpxMWzMc/BjeQG+t4wQMU+GeVbsv50Avg1Xsal0vLvs8QkqTOWWvE0a
         EC6see7mdGZbkVBOS9UjEd0ZrjA+E8YhMsEhnsiAh4VZzUKdbaD0NKCTu/ScO15q/8hg
         +Yxb4cPN7YRf2ks13GI64lGpPSmNAy2ZbltILhLKU4MsGAQHDQltuYBib9EU+A1oJQaD
         n0QTee06ZMEkhuPf6vSrKd3uaPXYS83kGorlZgoWtrkj/XvZPqQRud5XIllRidvKotYL
         LrTGKVijjimxm+YSjXSDU1kL1ChVD2DFIAGqxR+XV8axd7ettraQTAost7+sX17r7yh2
         O6QA==
X-Forwarded-Encrypted: i=1; AJvYcCXKLIDzQDS1H0jyjREM5QP+pOpTQJ81YmunyuWswjLWhTpbeRqUB9h7u+TEmZ2VHVvlWIrAzO6RGBjQqJvL/CgsjUFjz7e/mMLjPqxFGA==
X-Gm-Message-State: AOJu0Ywb292dMvJAELelSVdfftwhi/B4lSAtnO8fu+5to3iuOrRJZjPO
	8lKNpMbqOAbGYmJNlyvVBuMnyVar75LgTWAvJ6UtPBoulDFVl0thNKcnvYLjk2Ynz0kdAe7QKlX
	SdTSxDMXyiEZpbMGqOhFK+qttuO9UtFhwo3h78w==
X-Google-Smtp-Source: AGHT+IGJJD4YdSne2E2CDJPTcw+1HwH33TbgcTt5pV7mkcprUs/4t0BFrxvbt5GIFxFuNWKCvnJHBDIxbicRlCahRC4=
X-Received: by 2002:a81:6985:0:b0:64b:2a73:f050 with SMTP id
 00721157ae682-658ef2494cfmr10696077b3.23.1720476690444; Mon, 08 Jul 2024
 15:11:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704-hdmi-phy-v2-1-a7f5af202cb5@freebox.fr>
 <5lbtymde3plfiqkvnd2lrjzxhengmsw242uqapnzpvfd5jrm25@x2ik2h6vrdxm>
 <2d21db63-4371-45b4-ab24-9a725c29e09a@freebox.fr> <CAA8EJpqz1SiUdTMpx5hmnax_rBqtpVAtOZsaL8UfHnZ5vZZFHQ@mail.gmail.com>
 <c7da3acb-4456-496d-9876-b05abcc0e010@linaro.org>
In-Reply-To: <c7da3acb-4456-496d-9876-b05abcc0e010@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 Jul 2024 01:11:19 +0300
Message-ID: <CAA8EJpoD4og3eb2aFB5HkFh3vAfyhqG=smtcUbmgNeuWwaJtGg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: add msm8998 hdmi phy/pll support
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-phy@lists.infradead.org, Arnaud Vrac <avrac@freebox.fr>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jul 2024 at 00:27, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 8.07.2024 2:49 PM, Dmitry Baryshkov wrote:
> > On Mon, 8 Jul 2024 at 14:07, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
> >>
> >> On 05/07/2024 16:34, Dmitry Baryshkov wrote:
>
> [...]
>
> >>> I'm not going to check the math, but it looks pretty close to what we
> >>> have for msm8996.
> >>
> >> What is the consequence of this?
> >
> > That I won't check the math :-D
>
> Dmitry is trying to say that you should check whether the calculations
> are the same or almost the same as in the 8996 driver, and if so, try
> to commonize the code between the two

Not quite :-D

They are slightly different. More importantly, this is a different
version of QMP PHY. So, it's not really worth merging the code.
Earlier on I pasted the patchset to move all HDMI PHY drivers to
drivers/phy/qualcomm. I plan to integrate msm8998 support into that
patchset (this should not be delaying this patch though). But I don't
want to commonize the HDMI QMP PHY code before somebody implements
support for the third version of QMP HDMI PHYs, the one that is found
on msm8992/94.


-- 
With best wishes
Dmitry

