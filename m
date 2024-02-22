Return-Path: <linux-arm-msm+bounces-12132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EA085F0C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 06:15:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 554541F23D39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 05:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29AE579F0;
	Thu, 22 Feb 2024 05:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nbQaCYzF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758DA6FD0
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 05:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708578901; cv=none; b=htoH+GcBDk/LLQWOGJivxiME0xHlovGE5c+LvG2BI2+mlf7hgTEvOGipmney32gSkS3FwdN01njce9YYDECYfFfjYu7rbT1JUe0TMd8tiblWNISB0JH77+gmUa2siiGcRrGdihjOO2MHdwwatrI/J1Dtjoinlj9hdG8AYRSfcNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708578901; c=relaxed/simple;
	bh=3qny8yzuMmyJ1HQecd7Y6U83EBozIttdj4TJ16oo/RA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JEPBJI5VCMRcRmHRBU5B7pxedW8SAMyRnzbNrCNN6dJh5uJpxH+iz4uzPPn3BnlFhBMj/ktMa+U8AD+wd8qC5Rq4tNydc6uCNW9wR1T5RA7iz8YVEzdrA2wkIGQGt6IAexmm4MXM+xb/nKa9ABItgSTUMdy6+Dilcu5MptU2PsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nbQaCYzF; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e4ca46ab04so227569b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 21:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708578898; x=1709183698; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SjzQi95PdLFUOi++bhedl7ZKNdPeeAhvaDxnULICb2Q=;
        b=nbQaCYzFHkSsh5xuQmilSY8caKzng7EsQVlrt0dnXkF0ss7nOHTAG5hGAOAWJvWpoI
         NgKvwLyUV9VDTIz0RjIAdBrhQdxYX2DJo6jbri4kL8qc00JgB81yovWj8ZC0j14/2pNt
         C8SSQWpgYZPydqS8B8ptc9VpTJ4xPaQB6rx0EIyJD0f9m/eBS+kNliKShqaVi+OKzDOV
         fieXFpCRfs/VjpObzj2P5ZBlBhh2K4IcaLSnmsJdHJa81h61qAtkz2MMaPuNIvv/aJU5
         B1rqQ28lMF1De2os6/HLPzuZM5k4mx7DdYjgYxPPZkWARBJ/uAalDSNV4769+tIHyPRt
         r9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708578898; x=1709183698;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SjzQi95PdLFUOi++bhedl7ZKNdPeeAhvaDxnULICb2Q=;
        b=OlD0ecO9vUfT/1jmSDShBLjkvJNPSERNQpm9zRWd9N5/3vC4m1xeQtsxiQaY7Wbtza
         P+To7kBIGlFz0ryzhHkl2J0bJFOOiCxyoco9BQXkJMqJEa4w2fd9qvZi8cALLAA8Dkqf
         OQsjufTyt3NXUaOwJE9zflRVnbPVN73AtGoS3Sqq9EDJX49GHlC1MMf1D6fcD0rvp7gj
         +otxrhkMe+oG2gHa0lb7+1VbdWCqB38sytYeCR3Cr4YAVrgDPW8TnrHZLy1c82ARXSaN
         V+gAtU7ryNf/ajekrsNIcsRbp/whpSBFwcEhAfoPt5Wb0lmU8LXds+FkupTQnmQ3oRib
         NENw==
X-Forwarded-Encrypted: i=1; AJvYcCUr3HGU8nYACuMETxpR0Xf766QnbYy8sl20S7kRovdz2e7+kAi1+U4Vg/GXfsbxklbgJkOlxFEIFCk8YEkrqi59GtGSk8d4RJeoXjmL+A==
X-Gm-Message-State: AOJu0Yzpmct1Qdbfcr+UQDjYtFOpBbbiRKgR94HXJbfIjbZSRyOhHLEw
	GMXLHjw4vrvsVSBEit+SJd7USGDmskpYoHSCLSU8UVOf0UWtjiQQXk1WIwhiVyzy3zms1nfz0Rw
	=
X-Google-Smtp-Source: AGHT+IGu63MPfTR0XWOYa6xte+sdI5ID4/pSdH0NA8SBF3CrpzvthDgTRKHWJ6IOCsRKwwxCAnXzlQ==
X-Received: by 2002:a05:6a20:d04c:b0:19e:9a59:20df with SMTP id hv12-20020a056a20d04c00b0019e9a5920dfmr26902478pzb.9.1708578897688;
        Wed, 21 Feb 2024 21:14:57 -0800 (PST)
Received: from thinkpad ([117.193.212.166])
        by smtp.gmail.com with ESMTPSA id li7-20020a170903294700b001db35d8ea6esm7109815plb.294.2024.02.21.21.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 21:14:57 -0800 (PST)
Date: Thu, 22 Feb 2024 10:44:50 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	quic_vbadigan@quicinc.com, quic_ramkri@quicinc.com,
	quic_nitegupt@quicinc.com, quic_skananth@quicinc.com,
	quic_parass@quicinc.com
Subject: Re: [PATCH] bus: mhi: host: Change the trace string for the
 userspace tools mapping
Message-ID: <20240222051450.GC3374@thinkpad>
References: <20240218-ftrace_string-v1-1-27da85c1f844@quicinc.com>
 <20240221061146.GF11693@thinkpad>
 <20240221091103.37497ed0@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240221091103.37497ed0@gandalf.local.home>

On Wed, Feb 21, 2024 at 09:11:03AM -0500, Steven Rostedt wrote:
> On Wed, 21 Feb 2024 11:41:46 +0530
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> 
> > On Sun, Feb 18, 2024 at 02:13:39PM +0530, Krishna chaitanya chundru wrote:
> > > User space tools can't map strings if we use directly, as the string
> > > address is internal to kernel.
> > > 
> > > So add trace point strings for the user space tools to map strings
> > > properly.
> > > 
> > > Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>  
> > 
> > Reported-by: Steven Rostedt <rostedt@goodmis.org>
> 
> Suggested-by: may be more accurate?
> 

Sure. Will change it while applying.

- Mani

> -- Steve
> 
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 

-- 
மணிவண்ணன் சதாசிவம்

