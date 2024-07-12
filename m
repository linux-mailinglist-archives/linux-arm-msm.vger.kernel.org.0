Return-Path: <linux-arm-msm+bounces-26026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A549E92F91E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 12:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47BF2280D27
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 10:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44D81581F5;
	Fri, 12 Jul 2024 10:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LuEanQH2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8040AC8D1;
	Fri, 12 Jul 2024 10:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720781059; cv=none; b=D2JPmz8YEn0uCr5ra5CK77SRNRFUuFeQS1UTrWEdCxnNzVwqoZfZtoLT4LwerSwVMHmhlzO0deR/Zh8u6oUCPDArcAJxOp9vLNmtfVi6+2ZVYsrnnV5P0nLZH/HZ1ZPW5G+wfOmKI3p4/4MMZBsxCO9gtqPS4Dt6Y1O5W5DZvTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720781059; c=relaxed/simple;
	bh=L0YSHlGM7l231nMUkWGf/mkY221OF+GrMZOhwaiyxD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJFjse9sO3KpMnZifY0OK015k02QirrILSLetJEjFBH0PJH77UJScUA/2hEELYXT3rePm57k5dOH1Hl2cF7wJAHdJNU5Jk2Sysu4ht6gzniPUP8L5iOkvxQys8QXNET5QJ9MKi+BOIrsl8eDw3A4xgynA7d0HuLnV0IvyuanQuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LuEanQH2; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70af0684c2bso1453618b3a.0;
        Fri, 12 Jul 2024 03:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720781058; x=1721385858; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E22sckPZ2iccJGGZWMET6RS69Ab/uAuKqjV+oC3kJ0s=;
        b=LuEanQH2Rcea7iANBpThBYrZ8GUOPulyo8DZKJ/1d9BPvBkbkUuF7pZF82oggyhrTk
         SLjku3arwm1sgfH5aN/eKo815BxEQ1+bdpKfIhaqudoOJ4Lx+UC93v11xDJSJt4jfakk
         PKIc45+JJo7LUFKeSGnBwt9QFEqB/IEd8ZdlOqchmpYr70fWl9qEEMEQbxqhiPtd6ic7
         2IYmZq4Tc7FP33PLpEibfdL9WVdZ0aMoyAJaM4/VbEejg92k2cX71OcMO6zZ7q3wZg6m
         1nn+h1zevKD0IHPsa5McsM0/pbmx/SeXwfTXT1TkZJX2N0rPkL8tzMc5pOAM45ITNgKU
         Q3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720781058; x=1721385858;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E22sckPZ2iccJGGZWMET6RS69Ab/uAuKqjV+oC3kJ0s=;
        b=lBUHSSH80etAqt4IltN6rDk2SOQQJb2NrK3mNrJrSZBrHXdr670D8LcYf7qODK9fHs
         7kMr1I5XlgLZ1s5ILrsTFaYaoYDLu2DEx3BqMI50NrN5wtYKYnuQGggK2zfPiYxh/+RB
         eHb/b7X4hmdkE5b4zP/UBreI4kkZgOCdVfVrCk/JucPbie4Y1GkhKD9/dDfg1pun2vsN
         xeqouVqwXOJIEoJfXhy9BTEyowpbrAIZ8QIyA7NuixYxhk4tLmb/5RvZpXaK9ki2QJ2L
         RTX6egck4V7mjuitQ3WYdp04CVN7GTe0mXMV/R4Q6Veb9844wcAaXQqSrZ4PvwmNCLn2
         Zf9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQEVDRejiQ7/czu7GfGW/G4OxEMuCchLO7vDFyKiOJxR94xDYY+SZuV5QWFPBxj/DZ193AdNu1nUUz+8tOpNcZFtFTtx8GbsKhek97ub3GR8iGZPJXwUmwcpOIYOtGsYzL7Kd0JoHx5PdJzQ==
X-Gm-Message-State: AOJu0YxtIbVHS3BoC3MOXI6iriF8QV629eXnYAGKdZ0B9iVRMh5ULL/J
	qBvtjmVR2e0DIs+sXMHhoSs89w3mAbygtvjAU1iZBhn96YleQvG8
X-Google-Smtp-Source: AGHT+IE5b9+iCVtwmGHf0Wkjtr0hkV7dCaoYaILm8Gf3jfokkRwio3dhJq+NteqFg5+YdD7ymPUZZQ==
X-Received: by 2002:a05:6a20:e18a:b0:1c3:b263:d992 with SMTP id adf61e73a8af0-1c3b263da2bmr5517445637.5.1720781057644;
        Fri, 12 Jul 2024 03:44:17 -0700 (PDT)
Received: from bnew-VirtualBox ([2405:201:3020:7812:2a86:5bd7:c7ce:a9dc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ab6c53sm64572895ad.153.2024.07.12.03.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 03:44:17 -0700 (PDT)
Date: Fri, 12 Jul 2024 16:14:11 +0530
From: Ankit Agrawal <agrawal.ag.ankit@gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drivers/clocksource/qcom: Add missing iounmap() on
 errors in msm_dt_timer_init() function.
Message-ID: <20240712104411.GA183177@bnew-VirtualBox>
References: <20240712082747.GA182658@bnew-VirtualBox>
 <a6ae5f72-76e2-4c80-8039-b3bb07ce3a3d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6ae5f72-76e2-4c80-8039-b3bb07ce3a3d@linaro.org>

On Fri, Jul 12, 2024 at 11:51:50AM +0200, Konrad Dybcio wrote:
> On 12.07.2024 10:27 AM, Ankit Agrawal wrote:
> > Add the missing iounmap() when clock frequency fails to get read by the
> > of_property_read_u32() call, or if the call to msm_timer_init() fails.
> > 
> > Signed-off-by: Ankit Agrawal <agrawal.ag.ankit@gmail.com>
> > ---
> 
> For your future submissions: run:
> 
> /scripts/checkpatch.pl -g $(git describe --abbrev=0)..
> 
> to run some static checks, such as "title is rather long"

Sure, noted.

Thanks!
Ankit

