Return-Path: <linux-arm-msm+bounces-1104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E547F0D70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 09:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F8831C20D59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 08:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C28E563;
	Mon, 20 Nov 2023 08:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ePjR+F68"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA88E8
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 00:24:48 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40853c639abso13902005e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 00:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700468686; x=1701073486; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LiwLz7rgORSXU5ZDowGagc2wpV+uTLoI4pnI3SOTIak=;
        b=ePjR+F68z/TXKmj8OI/7Xg1oRcLPmHqdKZV/dRUNsS8pqVEQnnO1VLR7RgCmDrvARO
         C/YvYnfk185f38imKCrx8vreLGR3zDgGbr0yTJxLeaY3hHU7T1iot98z83HazCzLBKAn
         PRllcRXLOuR/7Uvfqjyxu6y78eJPpucfaXqf44W7GhOXStnjye+hVHObCxrLPu7vWFLa
         lvda7nYfDInTx1OPgvi3JvgKguv4VODZb8yg2J3j7JS6jue8smUMGTd/ym+JHYLMeUtb
         Tz+dF7cWmG1t1QTreYkAH9zsAnTIYLNqiAPli6j5mWUEAsWkoT0wSSLZ5BUELKLp/eE+
         /f5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700468686; x=1701073486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LiwLz7rgORSXU5ZDowGagc2wpV+uTLoI4pnI3SOTIak=;
        b=tJtUN15j4jZw8Bi+CtEmKcAnd2jQqcO8UTRGo32MkMhmRQ+OkdoHMe5KbkBOO7vt28
         /nJgbS5SEzKHzy8GkrYsxygREW+rxn0UUj+S/DyXE9Z+UqS/EutILBEKj/pPJijMoPxC
         b/JSVYqMs4pz+NE/O890WOAG9BwLrOBwMDjZe5qnBXBW2/MpDjxKZGZTg8U/9zRTln0B
         eqJEvMWbs796UpnAo4olT8DcDeqfsoEOUihwfS8CTT8yEXTL22lExkxD3vOn/t40vNpf
         2Okbpo4zvaHLd/U6wcKhPQmChX2zGpWstbmbY38z0atmpYHa5toiVn89VRSjT7wPEcUx
         IssA==
X-Gm-Message-State: AOJu0Yw8K9eYiwGcNbHKZKZZyMa9WIoJUkWji/gsjEqIPMo1hnAyL5W2
	GnYd2mPyiB/VgmTba5sAIM47zg==
X-Google-Smtp-Source: AGHT+IFLuFWYBRvyWcbXSNal7y2L0gxiFMY6jL/MShNjQA43ddXnWWdRUS33btuzM+seVvagiGyBaw==
X-Received: by 2002:a05:600c:3504:b0:409:5a4e:512b with SMTP id h4-20020a05600c350400b004095a4e512bmr5583059wmq.18.1700468686642;
        Mon, 20 Nov 2023 00:24:46 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bg3-20020a05600c3c8300b004077219aed5sm17387903wmb.6.2023.11.20.00.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 00:24:46 -0800 (PST)
Date: Mon, 20 Nov 2023 03:24:43 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, freedreno@lists.freedesktop.org,
	Su Hui <suhui@nfschina.com>, Sean Paul <sean@poorly.run>,
	linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
	dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>
Subject: Re: [Freedreno] [PATCH v2] drm/msm: remove unnecessary NULL check
Message-ID: <23209856-0459-49bc-99d0-cab66e1c098a@suswa.mountain>
References: <ZSj+6/J6YsoSpLak@kadam>
 <095b7283-3555-cc38-a73e-83efec8a9bf8@quicinc.com>
 <62943ca3-26ac-8712-2caa-102dc98f099c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62943ca3-26ac-8712-2caa-102dc98f099c@quicinc.com>

On Thu, Nov 16, 2023 at 01:05:52PM -0800, Abhinav Kumar wrote:
> 
> 
> On 11/1/2023 12:23 PM, Abhinav Kumar wrote:
> > 
> > 
> > On 10/13/2023 1:25 AM, Dan Carpenter wrote:
> > > This NULL check was required when it was added, but we shuffled the code
> > > around and now it's not.? The inconsistent NULL checking triggers a
> > > Smatch warning:
> > > 
> > > ???? drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:847 mdp5_init() warn:
> > > ???? variable dereferenced before check 'mdp5_kms' (see line 782)
> > > 
> > > Fixes: 1f50db2f3e1e ("drm/msm/mdp5: move resource allocation to the
> > > _probe function"
> 
> A small error here. Its missing the closing brace for the Fixes tag.
> Checkpatch cries without it.
> 

Sorry.  I must have accidentally deleted it after I ran checkpatch.

> I have fixed it while applying.

Thanks!

regards,
dan carpenter


