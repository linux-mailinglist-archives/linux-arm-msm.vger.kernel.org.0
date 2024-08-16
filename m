Return-Path: <linux-arm-msm+bounces-28732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8086695412C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 07:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2ACD289B60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 05:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ABF883CC8;
	Fri, 16 Aug 2024 05:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rpk9rTkH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E422582C8E
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 05:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723786120; cv=none; b=Uu4316+TwDmWW7iw5KekiSlidXHSt/ZBSI1OcoHWX6TxL6FHiTgjvm/M/3o5lYPhvFHXi7oFTir4I+Zi8nl08QT7bsoaQVWeuw4bYqgKLKWIqz85MO6wTCPncgZ1h4SRjJMi4426i+a8xEJepo12p+nLdV5FIOJC21eJxHBJTSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723786120; c=relaxed/simple;
	bh=CVgyyW45hqKlKWSJtD9mWkFJqSEYWC96cjYmVWtoD4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzeRxq0WCcBZT+XBcdQYEB8YfJP384nWWX9nPM7rPsVYmhYSoGO20SG30gs8Lu4iatbH0wMEgQmdnxmX4u2i++Q/JeX5kJTeEf5s8+ixfKBlPmuMyFuBcsam61aScAkFO0hE0E5e9JxqHR+n4Bsy7985o6BhI/hNVIBuDdgxyik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rpk9rTkH; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70eae5896bcso1454069b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 22:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723786118; x=1724390918; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HjZ4i2QLY2MCZUTKrXk0L2WJ9ATcFb1xvQJ16nAWgPU=;
        b=Rpk9rTkHkfDWBw9ANRoJmFBPA1SiQO/sIwfIM5KjzGhfd/F3SyO8OY9AYC74q5r8GC
         Zxi0l/jNcB0pIyPkxhFlAVaki/xQWM+Ws6mYZ8uh5evqI+Ez/URAbapQMg2jhkkR2IEf
         QpMamo0fcz3yJI6p7iSXHCX9s09ot/6vM/OzSVNnZaFpzfiW3wr6TfeBsIBpaKgk0UWh
         bcx0A6wrL1bhkpJ/uFHlKOZ/9dDsJ70mfaV+qOlQZm4OVA0RNuD1BkZh640/qMHGQrAP
         as0zFafFBr+iV9xU7oWjoFmTJHC5OBsKjrSWZUFla2CzCX2Fc1tiRXOpiBpWuMQ/LkYg
         +ttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723786118; x=1724390918;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HjZ4i2QLY2MCZUTKrXk0L2WJ9ATcFb1xvQJ16nAWgPU=;
        b=K9NVV3h1gkiRqWi4lTPSGPfzYovlYkFF4B5tIv4fNpqV70W9fM3TLRgnOYj7ZY5R/t
         M4HCC8pqcq7vMUQN9eIh1JySXBcfnrKbfIqoL8Q4764Vo+ciRxmcH9h5Y0OWKTo2ZpnC
         UmJiR9/3lxRI3tOLPsoW29WWg5R8JsFMcKYzD9SniwSMpH25rb2bKHttor47lgKT3yqa
         gWg8eq5vMQNmq7yufUZhCmdSwhTS1t/ufiwGrYayOYGPWFchiK4/UajRDYyY5yDEbBuQ
         s9kSJ4cz5MuBt3FZfRkVrMRHhqnPAJeGB1f1B5RaaaOebKh7SGa4mieNJtbkUpPi5T3o
         42xg==
X-Forwarded-Encrypted: i=1; AJvYcCVmR9vsuyBged10S4gasSDW4m94Kja8EainWVNgOiQyX7dRcQ1edmR+UctgXNi+nxz9z/RZGnlTn59rbPFJuBaWLrAb+mnwAgylyX8aBQ==
X-Gm-Message-State: AOJu0YzSCFwpHpf1blpYRsCeTfMd9pkMpRTheKvLLuUPj5nGnoUeMURb
	/xkLom44e8o1wuMpFn3JDl0WiJz6TVauE3aS+gICCOgwJFDny+bHj8k0phFo0g==
X-Google-Smtp-Source: AGHT+IGG47xUshJiY1c6p/0b3IHMBPociHpJXS5YR2Dk8ppi8J/QwruzB8NXPo12pRISFhAwDv1BBw==
X-Received: by 2002:a05:6a21:3998:b0:1c2:a0b2:e69 with SMTP id adf61e73a8af0-1c90501bd2fmr2157398637.33.1723786118061;
        Thu, 15 Aug 2024 22:28:38 -0700 (PDT)
Received: from thinkpad ([36.255.17.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f039e084sm18407175ad.243.2024.08.15.22.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 22:28:37 -0700 (PDT)
Date: Fri, 16 Aug 2024 10:58:32 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Kyoungrul Kim <k831.kim@samsung.com>,
	Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH v2 3/3] ufs: qcom: Add UFSHCD_QUIRK_BROKEN_LSDBS_CAP for
 SM8550 SoC
Message-ID: <20240816052832.GD2331@thinkpad>
References: <20240815-ufs-bug-fix-v2-0-b373afae888f@linaro.org>
 <20240815-ufs-bug-fix-v2-3-b373afae888f@linaro.org>
 <4b24453a-3f4e-4707-8c3a-2dbb0040281d@acm.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b24453a-3f4e-4707-8c3a-2dbb0040281d@acm.org>

On Thu, Aug 15, 2024 at 11:01:47AM -0700, Bart Van Assche wrote:
> On 8/14/24 10:16 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > SM8550 SoC supports the UFSHCI 3.0 spec, but it reports a bogus value of
> > 1 in the reserved 'Legacy Queue & Single Doorbell Support (LSDBS)' field of
> > the Controller Capabilities register. This field is supposed to read 0 as
> > per the spec.
> > 
> > But starting with commit 0c60eb0cc320 ("scsi: ufs: core: Check LSDBS cap
> > when !mcq"), ufshcd driver is now relying on the LSDBS field to decide when
> > to use the legacy doorbell mode if MCQ is not supported. And this ends up
> > breaking UFS on SM8550:
> > 
> > ufshcd-qcom 1d84000.ufs: ufshcd_init: failed to initialize (legacy doorbell mode not supported)
> > ufshcd-qcom 1d84000.ufs: error -EINVAL: Initialization failed with error -22
> > 
> > So use the UFSHCD_QUIRK_BROKEN_LSDBS_CAP quirk for SM8550 SoC so that the
> > ufshcd driver could use legacy doorbell mode correctly.
> > 
> > Fixes: 0c60eb0cc320 ("scsi: ufs: core: Check LSDBS cap when !mcq")
> 
> Since this patch depends on the previous two patches, the previous two
> patches probably need a "Cc: stable" tag. Otherwise the stable
> maintainers will have a hard time figuring out which patches this patch
> depends on.
> 

Well, I have not CCed stable list for this patch intentionally as the offending
commit got merged in v6.11-rc2. So there is no need of backport. Once this
series gets merged into one of the v6.11-rcS, all will be good.

> Since this patch by itself looks good to me:
> 
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
> 

Thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

