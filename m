Return-Path: <linux-arm-msm+bounces-10082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 812C884C803
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 10:53:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1F93B25EFF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 09:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E384C241E2;
	Wed,  7 Feb 2024 09:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GzQiPDNF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FDD23777
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Feb 2024 09:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707299592; cv=none; b=avDX5oXA6zoFyXW6YA5YscWoQxRZjiJ1yM5SWZ0kp/ef01LBZqn9/jQhdu4z1guegcA/4R2rO2ly1IFt9g8G+MOhTRQJzUo35SQcFntH+3Fwz+3PAMLp35v17jr/oWObwITQIIxkTkAIaavmsxzDP0BF6ScZZnNToX1565PlgyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707299592; c=relaxed/simple;
	bh=fBagnQpf9lsurAdCpTPPCwp0zC2lC8ox5gnQI1Q20r0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XaYomt4/N00RNad83njifUxmaW+apbMFiWUG2m8PBRB1BazQVwVcbjMl7ZvCAsdjCfBGuZV5nVSEeiapQWNZ3YSHJmXrrD2Ulkp0rtEe9CV5YmOPjeyTFCwQcrg5R6Lg77fJlgLEs+zWdzcWY/u+UMBFvpmDyl0xwC26VgpdxHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GzQiPDNF; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-60406302a5eso4513917b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Feb 2024 01:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707299590; x=1707904390; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D48j7hXU3glDBmXxDOFw5bCwEMnSogYiPviREFd32FQ=;
        b=GzQiPDNFGzV+WacOxV2qmKnevKuNYdxne9ZZf2GPguun7J2rV5ep60zPImNMx1tVMd
         FPt5dKM3bcUx7hOWghjP+f7V7T8AZlu/rmJuH8i+IB/vX/hA2tkaiMT8i2A5v9s8LzAB
         cF0sDnRNQK4G3d4zw2FicrJcJDC5521gaQ1Xlt0uOtLqgthqLhBljxqQ28ngwY2qo7+1
         8NSFjvK4f179Lg38idDuML0rIlQVOm+sb+fSIYk78PjtDWkPWV/DJ6IwFdP5eTxkJ4oa
         LBC7LkP1s62rD7gWyXeqKZc7RlrE+oAmVigSDOVO+El8zL25BoPnIPZvI7wtXL3zVoBW
         g6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707299590; x=1707904390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D48j7hXU3glDBmXxDOFw5bCwEMnSogYiPviREFd32FQ=;
        b=iQI7+XcUExeem2pROC++HT0M/fMb5JJ6VhvCvvZCm/rJVGo9bi4plwlXrRLfEzzh4H
         hRjH5Jyt/V/0X9fgJsOuvUKcFM+70pE5M76cEJYoynr34naM76KjNmXlgPK0lhbzBY4a
         hv30BkgfENyFfpAlgoouZCjo0uBMC5dBIhXvuoJkahpeKCxe7I5c1lnRR4rqtnu1vtY8
         F+c3cXNQ0OOgRNPGa9KKdegPBozHiInia6R6jGXMnJuzFTWFR18x8gqm6yqMzcJphCPF
         QFBiShM1wPFgqlj0c+QQXN/Xvgr802XbWnxnZkqgedtAmXr7Ejv/U+GYOy6+Mw0jq9Wr
         E51g==
X-Gm-Message-State: AOJu0Yz9I/yKcE5FJid+zpREozLdsA1vLVBmIoKNc1OQWJhl5LZ0indC
	0SNhuVLnq0i9Ew8Rxw18s/6WIGqfz51mLgreNHs2B5LZ5VRqwSoIahQig5S9Sf2GpR6EsAEu3WM
	sHSOXTT37BAeliBVl4MmpVmV3PnU5cRaYma9PLw==
X-Google-Smtp-Source: AGHT+IEh15/3UNFNxwbhtyktWrw5Dq3WwqrIRYrh9/Lre+JIygghfrZgJ0hP4Cue7+98aLmgX4RyI000Dpu6bvDHXZM=
X-Received: by 2002:a81:e60c:0:b0:5fa:5251:2332 with SMTP id
 u12-20020a81e60c000000b005fa52512332mr4349582ywl.32.1707299590157; Wed, 07
 Feb 2024 01:53:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240202064039.15505-1-quic_ekangupt@quicinc.com>
 <20240202064039.15505-3-quic_ekangupt@quicinc.com> <2024020248-improving-algorithm-a5f0@gregkh>
 <a2c5e594-f485-4510-84ba-6cd022c4c774@quicinc.com>
In-Reply-To: <a2c5e594-f485-4510-84ba-6cd022c4c774@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 7 Feb 2024 11:52:59 +0200
Message-ID: <CAA8EJppuaPLuH2Xb1Cu6P1HiD3PSjTy4L-Q6C3S82m5RAxfApg@mail.gmail.com>
Subject: Re: [PATCH v1 02/16] misc: fastrpc: Add support for unsigned PD
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, srinivas.kandagatla@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Feb 2024 at 10:57, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
>
>
> On 2/2/2024 8:13 PM, Greg KH wrote:
> > On Fri, Feb 02, 2024 at 12:10:25PM +0530, Ekansh Gupta wrote:
> >> Unsigned PD requires more initial memory to spawn.
> > What exactly is "Unsigned PD"?
> >
> > And where are all of the userspace changes for this series so we can
> > verify they work properly?
> >
> > thanks,
> >
> > greg k-h
>
> Hi Greg,
> Unsigned PDs are sandboxed DSP processes used to offload computation
> workloads to the DSP. Unsigned PD have less privileges in terms of
> DSP resource access as compared to Signed PD.

All such details must be described in commit messages for the patches.

>
> Unsigned PD can be enabled using userspace API:
> https://git.codelinaro.org/linaro/qcomlt/fastrpc/-/blob/master/src/fastrpc_apps_user.c?ref_type=heads#L1173
>
> For multimode invoke request(other feature) also I've shared the
> userspace changes with Srini which he will be pulling to userspace
> project.

And this should be a part of the cover letter.

>
> Please let me know if you have any other queries.
>
> Thanks
> --ekansh
>
>


-- 
With best wishes
Dmitry

