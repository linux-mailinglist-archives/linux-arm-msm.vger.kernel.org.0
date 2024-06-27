Return-Path: <linux-arm-msm+bounces-24467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E88FC91A7F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 15:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CC69B242E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 13:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95EC19415D;
	Thu, 27 Jun 2024 13:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZUsRIpzK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53CF186E59
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 13:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719495342; cv=none; b=bZkj8IK8Y5duVy778f5QTgVtwd5lcnauhDpW+0x+76ljYe6lSiGCh61OFv1bJ93WU2pf57wIKxzICYo3A7+gB4Zqm7bUUd5MXcyVDdvIrnA62BGEzSgZMCNxLpeVj3eV1PQSk7rMapEWJS2msON+3aKfD9VNqaUMCooJzqGOx6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719495342; c=relaxed/simple;
	bh=ECkLSbvH8iNObOSfLRnRBRh9gep68lBkVwbXIQFEdNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uox21UG2AT94wOVV+cEx7pyeTh5Y5Y89jLbBCDCxvLKgc2az+8tCH+PntB7sd6Iz4qyzz6t+omH4agf7+EKf5TY1xVB0SC6ay9m5KNTMYmvx0mwBZRx12mw6XgFN2i5yucbPNsIQkL1tJrqXJ/7QoQNb7lkrbgCQZRS4A1+++7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZUsRIpzK; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52cdf4bc083so8387165e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 06:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719495339; x=1720100139; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZTpZBZTgTtJPGy1DDYqfUaipYcevWqb53smMmBjlmaU=;
        b=ZUsRIpzKPmFLPjWeWauv/NVMjwoq9m8ioZB6Bo5/Ne2iHUKVbZHNJ4EIKW36J601+O
         m6mNUnZDJFcV9Eb/Cl1ODUxfjm7Ge3iJ8HL1vWJS878JOiFpWH1rkExKu8UGyTZlztNi
         9bL1RR3Kvr20X+KHGwK+FDpG6RWcHmY4odD18fSPUSVb2BZfu74GrIeu9pcxxBdl0+KM
         5uihcUVa06TU/KvJ+569GUh9Qs5nIsIlhWhOL9JgbA7aNm0cjMZw7kR0rY7tX3zrunMG
         xVVUHn2V8I2D+dOlKgy95PG96nyqL/j5fRegIDQDcWt+jtGBVhpa+3oxkOlBmaDQaRtq
         DWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719495339; x=1720100139;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTpZBZTgTtJPGy1DDYqfUaipYcevWqb53smMmBjlmaU=;
        b=I+YI7waVilYm1yBgzGwfpHuHXWQkIhXc/APcYwIVIhy9+ubi+T5pYjD1OmXph98PIS
         fAOjVe3qyR2SOejkCTpAUN0y+mfiKmJaDv7vJyOYjPz2xKE/Tu7SCDeOKYWYjDsPUgLo
         5hPdOldMF/vtQlalFLW4EIXOFqVuWT7soFpcAdS9sNu3sXp+AAXmujXQfi/M7eOG0puR
         RmE1wtMkLkoZV2EqJC/ahmrXS5IlaQQg6t9pXgD8VrhuMShkz1z5eyzVeW4iQuT7Q6Qu
         eIFRjXgOgV/+9G2wB6ufXDnL85/C5Q3G0ZXqyZgaU7b9Ikh86uI23iEQSyJ/CTg/tgjx
         OENg==
X-Forwarded-Encrypted: i=1; AJvYcCVgBNk1IoFqE5pFF4ez9u8ssODEi4Tn4n1OaT80dpvZJya6arL4pZFfIPjgUECZLgvXlA43Hw6W0mpHEezhoGun98Q47AlYrzy6rEWicw==
X-Gm-Message-State: AOJu0Yx5ankp8CHmJnLxcBkvHSKCdEI2RatWwXCxIzyzO9VPQ1kS8JZz
	hHMMQi7/XANxdey/ap/znD4dsw0hDjd119qYsthV+J7wGw8n0DWC4Y0QrtzLrlQ=
X-Google-Smtp-Source: AGHT+IGu+u7lilJ/SxexYfMDvtjObFRCTV7LJmuSqktWIcvggXQyFmIyf0BupY2gXWdHAQKjaV1txQ==
X-Received: by 2002:a05:6512:556:b0:52c:df5f:7b4e with SMTP id 2adb3069b0e04-52ce0620086mr10409184e87.38.1719495339003;
        Thu, 27 Jun 2024 06:35:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e71305ebbsm207295e87.126.2024.06.27.06.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 06:35:38 -0700 (PDT)
Date: Thu, 27 Jun 2024 16:35:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gokul Sriram P <quic_gokulsri@quicinc.com>
Cc: sboyd@kernel.org, andersson@kernel.org, bjorn.andersson@linaro.org, 
	david.brown@linaro.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com, 
	robh@kernel.org, sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: Re: [PATCH v9 1/8] remoteproc: qcom: Add PRNG proxy clock
Message-ID: <ybcxapxxq7ieguql3lxebxpgd7mt2hsvjoaohaynhyymrbjgyl@visloguhac4d>
References: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
 <20240621114659.2958170-2-quic_gokulsri@quicinc.com>
 <chi3pzh5ss3mivnhs3qeoen5hsecfcgzaj6qnrgxantvinrri2@bxsbmpufuqpe>
 <73cb638e-4982-49a2-ba79-0e78402b59ad@quicinc.com>
 <ga5kczcyn3dqoky4525c74rr7dct5uizun2smvyx3p3u6z6vtm@5vshoozpttod>
 <2617940e-72ad-4214-be26-7a5b15374609@quicinc.com>
 <dyh3vxosjjfztgwgpb5jtoqhzfyf5jyfndaujqoslepzvbet4o@kx6xaotzazcs>
 <2ba4b368-d706-4723-a0aa-f1579600db23@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ba4b368-d706-4723-a0aa-f1579600db23@quicinc.com>

On Thu, Jun 27, 2024 at 04:59:38PM GMT, Gokul Sriram P wrote:
> 
> On 6/27/2024 4:38 PM, Dmitry Baryshkov wrote:
> > On Thu, Jun 27, 2024 at 03:31:01PM GMT, Gokul Sriram P wrote:
> > > On 6/27/2024 12:47 AM, Dmitry Baryshkov wrote:
> > > > On Tue, Jun 25, 2024 at 11:03:30AM GMT, Gokul Sriram P wrote:
> > > > > On 6/22/2024 2:38 AM, Dmitry Baryshkov wrote:
> > > > > > On Fri, Jun 21, 2024 at 05:16:52PM GMT, Gokul Sriram Palanisamy wrote:
> > > > > > > PRNG clock is needed by the secure PIL, support for the same
> > > > > > > is added in subsequent patches.
> > > > > > Which 'same'?
> > > > > > What is 'secure PIL'?
> > > > >     will elaborate in the updated version.
> > > > >     To answer your question, secure PIL is signed PIL image which only
> > > > > TrustZone can authenticate and load.
> > > > Fine. So, the current driver can not load WCSS firmware on IPQ8074, is
> > > > that correct? Or was there some kind of firmware interface change? The
> > > > driver was added in 2018, so I can only hope that at that point it
> > > > worked. Could you please explain, what happened?
> > > The existing wcss driver can load unsigned PIL images without the
> > > involvement of TrustZone. That works even now.
> > > With the current change, we are trying to add signed PIL as an option based
> > > on "wcss->need_mem_protection" if set. For signed PIL alone, we send a PAS
> > > request to TrustZone to authenticate and load.
> > I see that you are enabling it unconditionally for IPQ8074. How is it
> > going to work?
> 
> Correct Dmitry. In this change, it is forcing secure PIL. With a separate
> driver for secure PIL, this will be sorted right?

That depends. How will the running system decide, which driver to use?
It can not be a compile-time decision.

> 
> Regards,
> 
> Gokul
> 
> > > I also just noticed that Bjorn had suggested to submit a new driver for the
> > > PAS based IPQ WCSS instead of overloading this driver. Will also address
> > > that and post a new driver in updated revision.
> > > 
> > > Regards,
> > > Gokul
> > > > > > > Signed-off-by: Nikhil Prakash V <quic_nprakash@quicinc.com>
> > > > > > > Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> > > > > > > Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> > > > > > > ---
> > > > > > >     drivers/remoteproc/qcom_q6v5_wcss.c | 65 +++++++++++++++++++++--------
> > > > > > >     1 file changed, 47 insertions(+), 18 deletions(-)

-- 
With best wishes
Dmitry

