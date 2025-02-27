Return-Path: <linux-arm-msm+bounces-49707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E979A48241
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 16:00:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 618D8188AA81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 14:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293E525BAD6;
	Thu, 27 Feb 2025 14:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="judPU/uM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBD325BAD1
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 14:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740667784; cv=none; b=jpdCAPLDdaW5MdJM/crKSpmnlP/Dy2K/QYcaEGvxovn97jwWHHFwYgWrPd+Ndwl9atWUw0AXJlfa5sW3Ka8mn0QYDk246wxR0IPl0kinG1rTaAwQ9C0GrBlEpyiju/l8nWH9cMvSTObPT9DBDarxBrHopPEFj7H19VuT8uCyuZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740667784; c=relaxed/simple;
	bh=6faw81wFFaRXZ3ymmYdJwV0mSvCtlP2Ar7QjlZFTgoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMbmUqdKckFfJJ/QcPsw37e20R8KfgyQqfUmh9qCgx+vtr80exgRxLa2VLyPUIGkQ7ZR7HyhxUIZL7+y0VAtl8HmUydjmT/3Bybrgf0MxcWR+xiYCXHA+NQcqxLp4LAP9YlIys8X0XXe+X9Syfm5yCpMPrATbJkBh+9S4Ww7VZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=judPU/uM; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22359001f1aso15614995ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 06:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740667782; x=1741272582; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=smnGGK6K/Wef+b2awCjLQ7c9xAU1Vqd0Z5QG8gAABNQ=;
        b=judPU/uMsYozBnMd+rF7yQgjRKyWcfspUpOL7O4D6Qu0vGtEQXaW80EAINGBF3aSGO
         noWvuuIibRn7Zf64JOzA405Y+lwU08n/udEMRvSiWCw9cj9YEPb0WR+zUWUhxQMXqjPm
         lGVjMs8dWyyvSOfuqIGCunUofES+wOr51+mci83gfpqgaYYSG1n1jqZcW16M5wCGxQNi
         WVNH28NbJEH931xJd29QZoC0PAk5zghXGwS+sznl4QI05OOadq4XkGOshBP+lGlh93Nb
         d6IN/9auyIcVySUq9YVs+H+Lyc/6ozzn5cMqO5T3t4NsIUb1GZP5IaM+GUbmIccHDuXI
         3DOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740667782; x=1741272582;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=smnGGK6K/Wef+b2awCjLQ7c9xAU1Vqd0Z5QG8gAABNQ=;
        b=SR6fDreGWoBUMVfdLJ6m+yOnHLTbs+pH6y167CGfhT7PqK1n8pkHxYz4wQMjNJ0gcy
         wJICUPbHIdeb68mg7QWPwxw7aEMcfdtpPEwwwAqU0p9xEC4vgvJe7Pmyu+0ne0uzFhFn
         T5FTRr0qtHL+iTmWAGehSth/KSJB+B/25DirDjP5o0dxYpomST2lCpEJ2273T6//SCgd
         qhWsxzFVGYXW31POP7E84MkTZ4lB3WmbBIV2pM8B3WB/UKvdHW+ztf9TmFsb7ovlImzV
         Sd9oN3yUK+5FLxIGbZagnINHXPrKHgA9BHDGxdxjgSDcCwq0/wFrMTpHEkctZKXzL3Wz
         Nh7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXt8vkslSHrNzESy+Ned8nWfWIun5vpE93mpDNFCdcpl0hFYdcJ9wslm3nvQOuw9KZQj7VZbBhIyxf9z++p@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1rikoo+AUIXc1G1hDMM992Nxx6k6nA5yjCCqZ5bGa/q+2ViWL
	CLpHluPjvNXtv99PvAo0r3QZ3NRIv9FXqW9KdMpi3WkAX2BfP8Ue7nU0DnnJzw==
X-Gm-Gg: ASbGncuh7h5dfTcFtvM3WSlOgfbolUMSIsF4ZGP6TYZRN58ONzrYBaSMzgC5ahk++Jq
	QoxWOSbgYXCd3MLU1YQXF3GpDWN17vGJY600vMsW2mx80LS6K1uZO5pDsglUXVWhLonKY1Tbipl
	sg07/4fdHaSn5wF+dIGLeY54hxI4zWxK931rOKKpJdzM88wdq7dIhW+LnPTRKxMcOeoaRbBxL6T
	KHgpBsY2nGlysSULwfJ2+2jWDex3e21mvDuqjC8dDE899c12LGi5TCOGRu4MC0ElxCJsf4KHOkB
	ZjTWi6G6GPoph7XcTj1x1yzqYXAdhPSUZKs/
X-Google-Smtp-Source: AGHT+IGPbMh9YLaLdnjg+qD36H+rS672w6Z7sxM9qS1ipKhQCSGEXPnAHeWSHqT6Fb4RF7dlqr8/wQ==
X-Received: by 2002:a05:6a00:c94:b0:730:99cb:7c2f with SMTP id d2e1a72fcca58-73426cb3cdamr39658350b3a.6.1740667781668;
        Thu, 27 Feb 2025 06:49:41 -0800 (PST)
Received: from thinkpad ([120.60.51.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a0060069sm1661260b3a.159.2025.02.27.06.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 06:49:41 -0800 (PST)
Date: Thu, 27 Feb 2025 20:19:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>,
	Manish Pandey <quic_mapa@quicinc.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_nitirawa@quicinc.com
Subject: Re: [PATCH 0/3] scsi: ufs-qcom: Enable Dumping of Hibern8, MCQ, and
 Testbus Registers
Message-ID: <20250227144936.4wrvydm4i4oenszf@thinkpad>
References: <20241025055054.23170-1-quic_mapa@quicinc.com>
 <20241112075000.vausf7ulr2t5svmg@thinkpad>
 <cb3b0c9c-4589-4b58-90a1-998743803c5a@acm.org>
 <20241209040355.kc4ab6nfp6syw37q@thinkpad>
 <3a850d86-5974-4b2d-95be-e79dad33636f@acm.org>
 <20250226053019.y6tdukcqpijkug4m@thinkpad>
 <6eb9ec05-96f1-41d2-b055-56e34d5722ae@acm.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6eb9ec05-96f1-41d2-b055-56e34d5722ae@acm.org>

On Wed, Feb 26, 2025 at 10:40:51AM -0800, Bart Van Assche wrote:
> On 2/25/25 9:30 PM, Manivannan Sadhasivam wrote:
> > On Mon, Dec 09, 2024 at 10:35:39AM -0800, Bart Van Assche wrote:
> > > On 12/8/24 12:03 PM, Manivannan Sadhasivam wrote:
> > > > On Tue, Nov 12, 2024 at 10:10:02AM -0800, Bart Van Assche wrote:
> > > > > On 11/11/24 11:50 PM, Manivannan Sadhasivam wrote:
> > > > > > On Fri, Oct 25, 2024 at 11:20:51AM +0530, Manish Pandey wrote:
> > > > > > > Submitting a series of patches aimed at enhancing the debugging and monitoring capabilities
> > > > > > > of the UFS-QCOM driver. These patches introduce new functionalities that will significantly
> > > > > > > aid in diagnosing and resolving issues related to hardware and software operations.
> > > > > > > 
> > > > > > 
> > > > > > TBH, the current state of dumping UFSHC registers itself is just annoying as it
> > > > > > pollutes the kernel ring buffer. I don't think any peripheral driver in the
> > > > > > kernel does this. Please dump only relevant registers, not everything that you
> > > > > > feel like dumping.
> > > > > 
> > > > > I wouldn't mind if the code for dumping  UFSHC registers would be removed.
> > > > 
> > > > Instead of removing, I'm planning to move the dump to dev_coredump framework.
> > > > But should we move all the error prints also? Like all ufshcd_print_*()
> > > > functions?
> > > 
> > > Hmm ... we may be better off to check which of these functions can be
> > > removed rather than moving all of them to another framework.
> > 
> > devcoredump turned out to be not a good fit for storage drivers. And I can't
> > figure out another way. And Qcom is telling me that these debug prints are
> > necessary for them to debug the issues going forward.
> > 
> > Your thoughts?
> 
> Does this mean that printk() is the best alternative we have available?
> 

For storage, yes unfortunately.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

