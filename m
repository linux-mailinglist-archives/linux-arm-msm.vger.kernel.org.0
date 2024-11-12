Return-Path: <linux-arm-msm+bounces-37557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8130D9C4FF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 08:52:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 469FD284FBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 07:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF98820B808;
	Tue, 12 Nov 2024 07:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JfSy6wFf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF0A1534EC;
	Tue, 12 Nov 2024 07:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731397809; cv=none; b=OJHjj2cCGuvDgrcGN3JDZCBXU/bheZ2tMo1YxWGvvbsScfWfTtJnsqCbfKxa9RaKnlwQ6y7xotqZhfOUQPg+4I51FfiSKMuXECF0YOFramlFUbNX0ZHuV5HYCbLTUu2qWrEaODqxmmIUgA2JUaGzCVYpEgmcBTdDi6Y0eUS8tUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731397809; c=relaxed/simple;
	bh=KTjNL6Mlwilqba5V1gn5bkYFPoDYAjhd+CGB/chkZ9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UBxN7VhSdVs/LZmLNPabeegFJ3fWAoplOU1cjbRW0DbZa2HpBDk/3Ig6BawngBqli4jb5EiEZSCSapgMlI8No+dArdmssu52Ef30MnCuCH84798//ocA2OtZPCNu3RoOMd5gjo9oHLvxqKoVBMhTL/pLNVY0/9gPPC1an5UNIZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JfSy6wFf; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71e592d7f6eso3971093b3a.3;
        Mon, 11 Nov 2024 23:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731397807; x=1732002607; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tExBEVwLwwV3qvwCXok4hCaStQCdAlqHUzJglsGHEK0=;
        b=JfSy6wFfs9ITwtDrKjvRDuInjPM+RVIiDhN0/N5++jTm7e9C1PyXpZMG+cOv7MJcb6
         NmncLSzD5KU+anwiMyEOADPOmf3TtksCtFITQ6/DdMyGcTWii/yaWwQs3bpfq5lgpj7N
         fDCz+qIQp635FH3WbjYYnjv7H/XcjXCEAuwz5JyhpgpWJOAIHTHfppcKSH1qr+aJZz0W
         ustNVH2gGNRQkx8X5R/b/INgqvVjaT1nKguxEy32NgXiQ8pUqUNSSW5JsJpiyOmMEwz+
         n5KY+MY05BaZOOiq6xp+wcLucaxEIFu/LPDoIedUucgWTYpCfVL/3ZVCQGEZzBgSwEYb
         kJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731397807; x=1732002607;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tExBEVwLwwV3qvwCXok4hCaStQCdAlqHUzJglsGHEK0=;
        b=pyh4ZtnBLMFP9BaU9GGlE70p/uFMqwQc/y1r6xreQ44ONwMK/q6pmX7Fy4Na4iTx0t
         Yozz0a7G63uN4cFpR4dQbymt6g6vBzDtBL6U6FNhCJ67eBYitZxO9pSCs5u9UWDrJNWM
         li1Di42nwzVJkMNZVAQMPnJmQ1UTdYGC+vXjKAsmA2ciEcoobNklKsqv/qCgjjRsruN0
         M8qNA18cQa1m23HKKojqk2VSubUDBktr+SwbQtXqLEkiiC0zAjMSjaxGdFJDzTDiT0eO
         O73qVyyXW3dS4ZQpZgxlsElP/50lQX5aYNsK0r4d1LGNtRB35zuEFrQPVHC2R6m/+YY4
         aRLA==
X-Forwarded-Encrypted: i=1; AJvYcCUAf7EzVpC2ebTbu0syUPwl61tIH2CvxaVFXM+N3tn9xDvgp3LZd/2VSBDAOH2S4nlKrSYqQP4jM2mGIg==@vger.kernel.org, AJvYcCVdxIjKbb5tlVAepTfq3tp4Xl1cWl9vSiPXJ1zvc6sX7GQ0mmNANH6ItgJja+JMw8UUughEzfprzbmkNgT0@vger.kernel.org, AJvYcCXaTI0SOVVti989bcDD34vBJYc6uE0tlPEXAH8lhzl/AgVqOFfLpVFfdtBMKUx6+3SXq5Qfj+LbRKKHa22x@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl3ggYqnRRh2hbk9uhSCGNNUnCNe+8rOhzbrXEZX1saLI8Fdbq
	aw+Srx3aNf4XWb0XhdczAqS9U0a846kLsoCgDhl47nmr8vbw1dnG
X-Google-Smtp-Source: AGHT+IGsjGIAC+EKfaG5Y0Te1Uwj8kqNbyd8cIEupZrS98ZAWi/K3a6EzNwJxHziLH6w1cJ30cNXIg==
X-Received: by 2002:a05:6a00:3d55:b0:71d:f821:1981 with SMTP id d2e1a72fcca58-7241327b787mr21711887b3a.4.1731397807117;
        Mon, 11 Nov 2024 23:50:07 -0800 (PST)
Received: from thinkpad ([117.213.103.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a1fd2bsm10450163b3a.167.2024.11.11.23.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 23:50:06 -0800 (PST)
Date: Tue, 12 Nov 2024 13:20:00 +0530
From: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>
To: Manish Pandey <quic_mapa@quicinc.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_nitirawa@quicinc.com
Subject: Re: [PATCH 0/3] scsi: ufs-qcom: Enable Dumping of Hibern8, MCQ, and
 Testbus Registers
Message-ID: <20241112075000.vausf7ulr2t5svmg@thinkpad>
References: <20241025055054.23170-1-quic_mapa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241025055054.23170-1-quic_mapa@quicinc.com>

On Fri, Oct 25, 2024 at 11:20:51AM +0530, Manish Pandey wrote:
> Submitting a series of patches aimed at enhancing the debugging and monitoring capabilities
> of the UFS-QCOM driver. These patches introduce new functionalities that will significantly
> aid in diagnosing and resolving issues related to hardware and software operations.
> 

TBH, the current state of dumping UFSHC registers itself is just annoying as it
pollutes the kernel ring buffer. I don't think any peripheral driver in the
kernel does this. Please dump only relevant registers, not everything that you
feel like dumping.

- Mani

> Manish Pandey (3):
>   scsi: ufs-qcom: Add support for dumping HW and SW hibern8 count
>   scsi: ufs-qcom: Add support for dumping MCQ registers
>   scsi: ufs-qcom: Add support for testbus registers
> 
>  drivers/ufs/host/ufs-qcom.c | 141 ++++++++++++++++++++++++++++++++++++
>  drivers/ufs/host/ufs-qcom.h |  11 +++
>  2 files changed, 152 insertions(+)
> 
> -- 
> 2.17.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

