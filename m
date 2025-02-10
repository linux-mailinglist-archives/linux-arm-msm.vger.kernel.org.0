Return-Path: <linux-arm-msm+bounces-47486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBE8A2FAEC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 21:44:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FD4F163498
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 20:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F04E26460A;
	Mon, 10 Feb 2025 20:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fEaL7fjg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC11264602;
	Mon, 10 Feb 2025 20:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739220268; cv=none; b=gb66QldMYeOT0ewUZtIk4mAQBRzJpRu0Cp9TjRZCtYJ4h5cyeDQ7kg4EwrQ00iBj2lCmu9/pzqJKVIw3IC6S6ltGYFKuXT1gyVpy97DiO84Axxr4BvDf+Cr/CCpXKOVHl0fPP/SZ94pWrGfiXG8xJ+7q9/zxSkIwiGM3+j3EdmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739220268; c=relaxed/simple;
	bh=wifmzu9xEwa3RKrDp90ng/Xe20Yiu9Pe5xTag1XKVjs=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YvAomiPMWRH/vtTGWUb3XYdhW9VeuJx4x6tMkxNLwPHwtcK8/aHmc+UWy3fxhjres9EmYr9tr2g8VfqZdWL3hx4YBDqegbaVPl5KuhUMOfDOn+DANp/F/CLHGoXHp3WTVP73mtWSIiHWGRGkF33zLC5+MGwe7btGnD9uUULIybQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fEaL7fjg; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43937cf2131so14178235e9.2;
        Mon, 10 Feb 2025 12:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739220265; x=1739825065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6NEtmwV9Q2eVZm1Q+MnmM9n3jU9l+OA4FDiy13V9L+I=;
        b=fEaL7fjgL/YnzXmDgkuqzWvo+vYVaLGLZqIPUIOw/+2iSNqhPqHNIOdwF8gQ5wSWWX
         VX0UMNnbvPrLduV2thKIvmeRWoD+run/UxZRW8NTKJpgM2RjFMf3h1egbl6g3NcoIo41
         eP7YKrQjHi0SFbPFvOcmUFTkozjcuNUwc9rfkWgHGfubG/3HLMRBq8sxk9LLy5f4ok+y
         e7S2C6zdsj2zcP2EKeDJDq3KOGACkciVZhosA5wrkCL69weQS42aL8Arr8QK/UerDMLb
         sX2Q2VdcKYPV82l5qV6T8qvn71yJAN12KtvMEnwxToVLWRKb6YKxF3SrEqJFPcqT3NBs
         hKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739220265; x=1739825065;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NEtmwV9Q2eVZm1Q+MnmM9n3jU9l+OA4FDiy13V9L+I=;
        b=TFWc2qsF1ktYs+Y+csiAJL0uMKtQDh3i/cPh3RGcBmTCKmrcUzxW0EaXjvVEELRes7
         oWURz7CmBMTsGTkvZ926I+82+ZrWjhWCnG4LS7RP2sqbagSATIxJaVJU3/P16RjdHYxO
         l3S7K2Rwy4EHjay5cFcOs2SOhc4Y1DnoScX7jAP08ccXpDY8Bv3swCjQO28bsb3FMuvV
         Rmeo9JvqytexXnlbw3N17MDi6QnJeiwI+6O7kN3riZsJBer2QDSnzurmlQ3oKfRxXXk2
         bcyud+sD9ggR11ZZjGOjgwF5RhRcw6/Q0kknYM7hp4mlD0U696UEkBp8Uo8huXyOXcWR
         nm/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVaZyl6v7DkbcFOTErpO6a5/6Gqz4Iyj2soOSs2A8o4/jfKQURZAyltrCLRgUT+foFg4ZYnmM0I06kFTz8C@vger.kernel.org, AJvYcCXDsrQEwGsKajMBT+VZVNX1pQ7JqMExFTgRMqVbvAaY5AOKazxNF9DabEo/SIDqxud5I0uZWJun7jJs2/VZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzoKQpBcFG9hA42nLnjuiMHqjv/N9ojHI9MHUpCTywoIgazYwzh
	P6ERzqkF2tbGr/FEHI/F9iRtQ1dWY8jSEddlQs6I+45ImQ71KqW8
X-Gm-Gg: ASbGncsZ81LnuC7BECIjFGPq+mRwF9KUfiW7FmkUsmDDOfdAO/1PesKF+LuKBMz64gD
	R+kaCZhDwW6Coa7T/XK5wRtinX0nYw66bVGX8OPA6jVwsrpX6k+gGOG5hacalMxmbeFZ7LCmciT
	LVAQ8r5dQBDc8URYFQBlrqxH/NXzzrDX/ebbreimApxuC2c0ZFzaD2EqWACGRsSajeB5vQfeA3q
	hgPImTxjoxKFQVx/X1kC6zYZiBoGAT+tjynZW5pZfXxzIzQxGPm4ne2n6HZiyKq3GAICTKXh2Fw
	/jGJXoUdQ1tf0A0I9S4ZaORCrswxs8HaCuT9zy+XtXtO7fk=
X-Google-Smtp-Source: AGHT+IEg6Ex9yGj6IiVO4T3XJmOEo5+UOLRM1MjE0cCRwNc4t8KclMZj/motXYPdvRG1V4Payg6/Yw==
X-Received: by 2002:a05:600c:4e13:b0:434:9499:9e87 with SMTP id 5b1f17b1804b1-4394c8538fdmr9875435e9.25.1739220264602;
        Mon, 10 Feb 2025 12:44:24 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db110dfsm194994495e9.36.2025.02.10.12.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:44:23 -0800 (PST)
Message-ID: <67aa6527.050a0220.173001.b011@mx.google.com>
X-Google-Original-Message-ID: <Z6plJSh-02AN7QaU@Ansuel-XPS.>
Date: Mon, 10 Feb 2025 21:44:21 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: qcom: finish converting register to
 FIELD_PREP
References: <20250209145439.19047-1-ansuelsmth@gmail.com>
 <877c5xu8yt.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877c5xu8yt.fsf@bootlin.com>

On Mon, Feb 10, 2025 at 04:15:38PM +0100, Miquel Raynal wrote:
> Hello Christian,
> 
> On 09/02/2025 at 15:54:32 +01, Christian Marangi <ansuelsmth@gmail.com> wrote:
> 
> > With some research in some obscure old QSDK, it was possible to find the
> > MASK of the last register there were still set with raw shift and
> > convert them to FIELD_PREP API.
> >
> > This is only a cleanup and modernize the code a bit and doesn't make
> > any behaviour change.
> >
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/mtd/nand/raw/qcom_nandc.c    | 36 ++++++++++++++--------------
> 
> I'm fine with your two patches. I was about to apply them, but the first
> one needs to go through fixes, whereas the second through next, and they
> are dependent on each other. I propose the following modification:
> - create patch 1/2 with the content of the cleanup done just below, but
>   only adapted to the very specific spot that is touched by the fix "fix
>   broken config...". It would be a prerequisite for the fix.
> - patch 2/2 would be the content of "fix broken config..."
> 
> And aside, a totally independent patch easy to apply on -rc1 with the
> rest of this patch.
> 
> Would that work for you?
>

Mhhh are they really dependent on each other?

I posted them in 2 separate patch as one should have priority and be
applied ASAP. The other is really a cleanup and from what I can see no
delta in the patch gets affected by the fix in the other patch.

In theory they should apply independently.

An alternative solution might be to just delay the cleanup patch and
post/merge it later in some week? Open to any suggetion to better handle
this but I feel they don't conflict on each other (please confirm if I'm
wrong about this)

-- 
	Ansuel

