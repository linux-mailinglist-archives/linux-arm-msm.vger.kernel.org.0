Return-Path: <linux-arm-msm+bounces-26861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E9C939D57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 11:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 429ADB21D65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 09:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7996714D435;
	Tue, 23 Jul 2024 09:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XKljCd7Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8D214C58E
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 09:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721726086; cv=none; b=c4I/NPyF9cq2bYpRfJTnoVRCHKergsmqxf59BtSlKZR1QyEtx9Otf3D/9MDcH9QInchXt1UhGbWSrK7saU03AbRTwX5AVa8mDYWNUA4Uhn6XNQa2pS76CbGqH1ZExvwfXzN+MXXFWrcKzvQ8GiSdcbrd8NtmARfLj5QavBlfWxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721726086; c=relaxed/simple;
	bh=nUN3FWKPF4lxcMW0eNtynse9ROflNRGORRaQ45QqoqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kzu2aEdHCS1BQbdCzf26wfnnW6e4w2GW/XMHmHaEHlUhOH6W+RcWb2o0lJ1RzMfyRuoETaG+fT0jj+EZWUxU7lNdBtzSyUSPr/C6kqB2cTgI4c8Vjfwd1qpdcmXxT4aDyVSArO+yuljk43RGaNxvABjulkWTGOV2A+U8Xeez79c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XKljCd7Q; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6634f0afe05so58193487b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 02:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721726083; x=1722330883; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=do76fn9eVUpHN8Ddkeci0hwMk6DMn3ti88cC7rkfzQc=;
        b=XKljCd7QjGfKHnBgUEFsWG/hiYddjTvFPp8N8jPZMNd0GU6H8OUQZBRyspbCaiJe4n
         Hhmrd1/UaCJp4vyufJNTiwjgfAHk726xpgqr8s4ix3a+wF1qWbMqMCgOWqwnBEeS0lIn
         OE/pCbuu6+e8W9akhjGb2DtYG/xdm9jpHBXwyD0cDEmu2veuVMhKPwVP4tfs5E9TdLiv
         YOFRDE5cTFw941Mg6+nrSDGcDTIcRlYFk9UrKTA0uRbKZDchDGTxaQjA6shKl5qvlpVd
         yZuXWw7k4MQCP3RVsBH4Jlp0qfLoONp2cfkK6olNyoIgR5BXZB+/riBq0j2PJBRM3xQc
         LOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721726083; x=1722330883;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=do76fn9eVUpHN8Ddkeci0hwMk6DMn3ti88cC7rkfzQc=;
        b=DHy0hTss0e12XQ1Jem1DhaDq3vwYgBXymkO4NQqscqzZ8MxLf7KgcriwP73B5lymB7
         1hXBFISnnRieccRBcK8Lz+55FCyEGi55YdhFy14TnaZGOS9zR+ZgbRRN+PAiIq0eCxcg
         KCt9ahyKDMADVneTTMFRMRkEc323tE3lsMwIQZwOb6ymVgV646hQmmzJyMHonBTbdBAZ
         bxEWD303rGH9zBjEUbVOX9c1hiDyeDINC3JHIaUgxntMR5HqWL8/C7DaPQMTc0jmLxSX
         e8JQOLI9/2DjVBudxGiBAsFI6WmsbFUIllLbBw7LDx5jgvzo1vv1tQOqz+J52WUjTlHB
         E1Iw==
X-Forwarded-Encrypted: i=1; AJvYcCX5U5TKCEOLjrQf6amclygoEemL9JdjcQQN9ycOVDStAPsOQbSx9Qlh5YUXTQzIUVI7FqZQ9DCM67Dkd6QEA6cNd8gRGBwDJ3ReACNaaw==
X-Gm-Message-State: AOJu0YyOYJbhC3SWC1VK83/oN6ZIk0NP4xhneDPRnCT0oNlBPoPHAYZ3
	/u2mQB1cBuZyj+rfLUNHwlrcL3aX8V+ofuTSG95q9nIFBjyHrj5jiEELKTI2bQFbOsllsNG+JZr
	ihTmCpDWSBIeMNsYd8mSIGQU0wTK5uupv54jJVTPoPHOxufPg
X-Google-Smtp-Source: AGHT+IGDii57wttIhsWjllJQ0f567FJtrDS2mTN6cewKhchy/2c2bk7UMoqEAJRDMLDDuOfO1ytaXqNPjebbxFrr08M=
X-Received: by 2002:a05:690c:288a:b0:627:a917:76b1 with SMTP id
 00721157ae682-66a65e652d0mr117703277b3.44.1721726082779; Tue, 23 Jul 2024
 02:14:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240722080200.3530850-1-quic_ekangupt@quicinc.com>
 <20240722080200.3530850-3-quic_ekangupt@quicinc.com> <cr6xv4tsk23sjynnucve4366fwvffgq3rjnbkpxhzdfeiktwtr@ydrp3mduapui>
 <be9ffb28-3ad7-4537-bf80-45ea43f97374@quicinc.com>
In-Reply-To: <be9ffb28-3ad7-4537-bf80-45ea43f97374@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 Jul 2024 12:14:31 +0300
Message-ID: <CAA8EJpo=mXS43Mhp15Z6fRtLc+__+PmQ7yrOaOQKW-_R1sgbTQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] misc: fastrpc: Increase unsigned PD initmem size
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
	linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, 
	dri-devel@lists.freedesktop.org, arnd@arndb.de, stable <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jul 2024 at 07:36, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
>
>
>
> On 7/22/2024 2:04 PM, Dmitry Baryshkov wrote:
> > On Mon, Jul 22, 2024 at 01:32:00PM GMT, Ekansh Gupta wrote:
> >> For unsigned PD offloading requirement, additional memory is required
> >> because of additional static heap initialization. Without this
> >> additional memory, PD initialization would fail. Increase the initmem
> >> size by 2MB for unsigned PD initmem buffer allocation. Any additional
> >> memory sent to DSP during PD init is used as the PD heap.
> > From the previous commit message I had the feeling that DSP can request
> > more memory if required. Currently you are stating that PD init would
> > fail if it doesn't have enough mem.
>
> DSP PD can request for memory only for PD heap and that too once the PD
> initialization is complete.

This should be a part of the (previous?) commit message.  Also what is
the difference between static heap vs PD heap?

>
> >
> >> Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
> >> Cc: stable <stable@kernel.org>
> >> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
>


-- 
With best wishes
Dmitry

