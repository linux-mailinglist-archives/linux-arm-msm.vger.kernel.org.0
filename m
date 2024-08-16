Return-Path: <linux-arm-msm+bounces-28725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 776E39540D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 07:03:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 012F11F22929
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 05:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA223770E1;
	Fri, 16 Aug 2024 05:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ivTVQTM2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4976E8489
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 05:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723784592; cv=none; b=pJVIYqmgBevSbkM+U0b9DiqWf7Uoazp0NAiWVnz2wSr+jUKnk6pmlJ5rJuBGpPHjMQ5OVRqw6RCufTSETOiv3I6xktulsq5j8vvuRSk7NH7hJZO2LNREx1pLQ5ml3ZSRtixx+Ir1ZPPqey0GEimzjCzLUe5V+GkPqxsyqOeddoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723784592; c=relaxed/simple;
	bh=QKlYDVBAAflZ15/HRoSBk94fswp4zfvQsY9Jo/g3w0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0ou4Lryhp7g4K37enZak6J0ojwbFG+7dmM/WPc3a//w9dhFl0mKPIMa7btWRd9Ctx93A0/SqYd1hMh2lXzbP4dT2bybXyHmJff36fuFckc6Sq+HUJovKzo4SPdTY7aXm1LDbaqwznQ7l1F0bbbNBU5Oz0jJsR9B921q0xX2RK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ivTVQTM2; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-710e39961f4so1221063b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 22:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723784590; x=1724389390; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xg+4eAKOTh+mj0iqBF4qLZuw/+xIu3+MyiUmhRITewE=;
        b=ivTVQTM2RoV10SiNBAVjZNWaK4kmGeOrNbPlpfjwEgAvN3FbKmbtrtRnBZERjSXZEn
         F8Df5VRuJtmIf4Sjlt5PzzdugGk8YCAwjqNnz3irtf6HpmpBS8xXvdSCTkFZHjuQy2cy
         /hyVO4vBxfTIClgq4g5UT5og/vVMcY+NJyOgURBS6Fef86HDe9DjlxG69rbqYOxjBvLF
         eXyldTFNAAwk/RHKm3N8nR+SgUBH61BqwGwdj7K7sfxe7thQDHfgcz2Zf+jHNks8lxYk
         CC9xHza6wdhCqzHvHpolrFgvEZuDqHCAb0bG1wW6xZGDI0j1te8Nv+Z2/K9CMTxkpdk8
         tA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723784590; x=1724389390;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xg+4eAKOTh+mj0iqBF4qLZuw/+xIu3+MyiUmhRITewE=;
        b=nprdTy6I0BZizAqCBu4lAoiaeuyObmKxnc45MO9pwLJGOtiDUAEPXVwi2GI1qAup4t
         GvVK0dTOEGKZf0ZwfSPXeHFS9b/Z6gLtnON8KTtTpvKk35qgmid33nVBg7F8XZP4+hoM
         DG9d+04HRyNAlCJuthmUBQufT43783cCmNeOsOh1+cy6e+oc4kE6F/ldW25l/WHVSCGZ
         6oxyDrfq9ZPsh5kCDN1est0WiyTzJuKfx6IvON8whPrBovC/EqwiifYwAVX1+pAIFA1S
         7AeuRuwC2kt+HcsExiIgLA24Fxpj/dRkH0kCYNfNr5sBveJ4BmCI1Z9V1aaDEQJvhl+c
         hoPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM+1M5Fqss1xnYl7zf1dlA7+iio6NrHvgqNwPrrWpqqs7sr7SwYKgaoH3jYaL4OvgnAIHnUtofZOPMOusGVEJYc/115auHAVpb3GbK2A==
X-Gm-Message-State: AOJu0Yy+OoklCDPQhVMOwdyCH42wiNsyB0W0Ho43EPG8lGYA2T2Mygiz
	e+sZeK4pUgPPY4JUK3eJ1F1+KN/4xAmqf6R/SR2J2wMNdHmJQm026CaWO9Z8Bw==
X-Google-Smtp-Source: AGHT+IHUPprol+xeDuvBURglcqhp00FI0buO/85LpeamuWc3FiF0xr3yT4+pj2erS70Rc9XVm4dZQQ==
X-Received: by 2002:a05:6a00:91c9:b0:70d:27e0:a946 with SMTP id d2e1a72fcca58-713c4e3934dmr2112863b3a.9.1723784590591;
        Thu, 15 Aug 2024 22:03:10 -0700 (PDT)
Received: from thinkpad ([36.255.17.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127add68a3sm1839831b3a.7.2024.08.15.22.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 22:03:10 -0700 (PDT)
Date: Fri, 16 Aug 2024 10:33:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Kyoungrul Kim <k831.kim@samsung.com>,
	Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH v2 1/3] ufs: core: Rename LSDB to LSDBS to reflect the
 UFSHCI 4.0 spec
Message-ID: <20240816050306.GB2331@thinkpad>
References: <20240815-ufs-bug-fix-v2-0-b373afae888f@linaro.org>
 <20240815-ufs-bug-fix-v2-1-b373afae888f@linaro.org>
 <f339f1be-4d5f-46f4-8d57-473f38901bd8@acm.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f339f1be-4d5f-46f4-8d57-473f38901bd8@acm.org>

On Thu, Aug 15, 2024 at 11:09:06AM -0700, Bart Van Assche wrote:
> On 8/14/24 10:16 PM, Manivannan Sadhasivam via B4 Relay wrote:
> >   	/*
> >   	 * The UFSHCI 3.0 specification does not define MCQ_SUPPORT and
> > -	 * LSDB_SUPPORT, but [31:29] as reserved bits with reset value 0s, which
> > +	 * LSDBS_SUPPORT, but [31:29] as reserved bits with reset value 0s, which
> >   	 * means we can simply read values regardless of version.
> >   	 */
> 
> Hmm ... neither MCQ_SUPPORT nor LSDBS_SUPPORT occurs in the UFSHCI 4.0
> specification. I found the acronyms "MCQS" and "LSDBS" in that
> specification. I propose either not to modify the above comment or to use
> the acronyms used in the UFSHCI 4.0 standard.
> 
> >   	hba->mcq_sup = FIELD_GET(MASK_MCQ_SUPPORT, hba->capabilities);
> > @@ -2426,7 +2426,7 @@ static inline int ufshcd_hba_capabilities(struct ufs_hba *hba)
> >   	 * 0h: legacy single doorbell support is available
> >   	 * 1h: indicate that legacy single doorbell support has been removed
> >   	 */
> > -	hba->lsdb_sup = !FIELD_GET(MASK_LSDB_SUPPORT, hba->capabilities);
> > +	hba->lsdbs_sup = !FIELD_GET(MASK_LSDBS_SUPPORT, hba->capabilities);
> >   	if (!hba->mcq_sup)
> >   		return 0;
> 
> The final "s" in "lsdbs" stands for "support" so there are now two
> references to the word "support" in the "lsdbs_sup" member name. Isn't
> the original structure member name ("lsdb_sup") better because it doesn't
> have that redundancy?
> 
> >   	MASK_CRYPTO_SUPPORT			= 0x10000000,
> > -	MASK_LSDB_SUPPORT			= 0x20000000,
> > +	MASK_LSDBS_SUPPORT			= 0x20000000,
> >   	MASK_MCQ_SUPPORT			= 0x40000000,
> 
> Same comment here: in the constant name "MASK_LSDBS_SUPPORT" there are
> two references to the word "support". Isn't the original name better?
> Additionally, this change introduces an inconsistency between the
> constant names "MASK_LSDBS_SUPPORT" and "MASK_MCQ_SUPPORT". The former
> name includes the acronym from the spec (LSDBS) but the latter name not
> (MCQS). Wouldn't it be better to leave this change out?
> 

Hmm, agree. My intention was to align with the spec, but then the _SUPPORT
suffix is screwing it up :/

I'll drop the patch then.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

