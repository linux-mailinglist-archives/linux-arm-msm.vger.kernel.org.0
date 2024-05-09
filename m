Return-Path: <linux-arm-msm+bounces-19606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 116DD8C1573
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 21:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2B47B21B0E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 19:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E937F7CC;
	Thu,  9 May 2024 19:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhPualp2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549CF7F465;
	Thu,  9 May 2024 19:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715282881; cv=none; b=sc9xq47SI4lgWu4BzzgnmclIdJuTkgEixPtS67XM49VsyK5YiTXgd5hmaSOz/yBUfW8DaNSZHtm4EE4Ejxg2j3LVaiYvKM+SCU3Enm3ASoW2RFB+AcdFqWwO8zb51a4lR4pe2hoKHscD96tcXjR/gsz8/OO0hb3BEcfV96iWpI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715282881; c=relaxed/simple;
	bh=4q15vxk3U5tCW6AqzqeDT1BCURgzaUxT8LIVZ+ub84w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qWKl7i8lzsQmz3eBG401RYT8U4W+W4uu/Q+4Hv14SVJ2NPqO0T82dX88zAapQ6Q/iSjfA0plXESnC8FeODCvuf5qO1Qv1oN+fb0wQ+g8oL6TUgGFlRwvw4wxwxVzn7cy4RFWIKdJGt7WRPN6XndxbzHMXPQJkls2AjhYmIuUir8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AhPualp2; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5ce6b5e3c4eso859651a12.2;
        Thu, 09 May 2024 12:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715282879; x=1715887679; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4q15vxk3U5tCW6AqzqeDT1BCURgzaUxT8LIVZ+ub84w=;
        b=AhPualp2198kz0S9hsm29RrZ1ztS6o17/WSYWVqyKBTCgBNo0b7Lb9jHuMcx/wFutS
         XoprlOSJqPWlrzCFms59vK1vMeu5LdObmiWxNNjEEI5wZ1YEBKM2dTxnFYjfn6SY8QeS
         civCt1MJ+Alw3Gz6S74gVTG3tNXvxZ1cFcTWCo2e6wSkmOj5qkHBcJhBVN3eycO0BHf+
         3/i9KIhwyC6TjWDqDcXMG7N1JcB1+0/EJqEUmUAC/XacT4N40WWnWiaHVoLiFQL71HgD
         BPouTVvW5mvnwDqybPhiM1GY5lEkbPOec39/Q3N0vL7EcG95VUxQZ7xfJUyI+6WafNGL
         LhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715282879; x=1715887679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4q15vxk3U5tCW6AqzqeDT1BCURgzaUxT8LIVZ+ub84w=;
        b=stUSFh+j/7pFTbJoUT7Kg6dYlSxaEHAXKTpqBnNGp5seII3uRh3Lj36xFgCzlwl/qe
         vgoeyfmmXT4Pg9xznGwzSuy9SURWHd7/3f28STPUM2rvYToK1tlUOhDUb20jqTMy1+IM
         O2u+fiEnqdUs50vI3ZBnbTZ+Se1pecwE5QZ/9ix+EzVLsmpCulOhgAPumI6W0ta4jGJa
         gjOWcMuZC/T/Wm/qOOfEtlH4Pah53CO+dVZiJPKq1shSNR7sPQOENAkHt5a5fdTdaOHA
         f4pX1/iKxgqIiXn0rbl1/Pq1dwKkav+aiqS0Djd7eI5BPrBe1e7VXHrkBased49VfvWV
         Buxg==
X-Forwarded-Encrypted: i=1; AJvYcCXo+UocqITmqQ7bs+ZNruhkwDel5gzEmcF5xpEm62xSahP0wJLdOmKfmodZNj1C1KxDoBPjOGAv57N+G+rKjLwDWnvmb92bBZxZgFwo6rzaIABTm8mcyQzImaBXjwTYXnMHucfklEO4IHvUMA==
X-Gm-Message-State: AOJu0YxH7/ugLBRDIDIrjtMwyKWYOIdwGpvkeNQ0P9ueG7QBPKgE6OOR
	aAQk6R0umZhTvcsB9TOpfzjWFezUvryjL1P5T3JMueRaHUhZbv0Axwod2sWIOW9MTsr/xtjXbrM
	PMkvJ1LXC7oTAk0JXY0UCnEjGV28=
X-Google-Smtp-Source: AGHT+IFD2St8xMS5+Rfyw+Ljbcn5AcM1Wr/haO1ug4eK3rhYqRM3DPV+yzOiYy33989tocEobfL+9d6S07ZnmExnzgs=
X-Received: by 2002:a17:90b:185:b0:2b6:c4d7:fbf9 with SMTP id
 98e67ed59e1d1-2b6cc758aa9mr396866a91.13.1715282879509; Thu, 09 May 2024
 12:27:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240509-ctl_irq-v1-1-9433f2da9dc7@gmail.com> <151f3503-d7ce-b11d-0658-1d26a47b1920@quicinc.com>
In-Reply-To: <151f3503-d7ce-b11d-0658-1d26a47b1920@quicinc.com>
From: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Date: Thu, 9 May 2024 21:27:48 +0200
Message-ID: <CAGsSOWXFoFte_Ubbzudo3Ru=s35xsuiSwkOC3zHnZHM7_zj7pQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: guard ctl irq callback register/unregister
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

There was some previously sent patch series made by Dmitry for these soc,
msm8996 was sent together by sdm660 but in the last version it was dropped.
I have recreated msm8996 DPU support from that series but it will need
some more test.
I am testing msm8953 series but it is depend on msm8996.

