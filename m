Return-Path: <linux-arm-msm+bounces-79165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A4260C143D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 12:02:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 272394E4B90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 10:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812FB305E1B;
	Tue, 28 Oct 2025 10:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yy/3i9ZL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F472FD696
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761648833; cv=none; b=blHyevf3iMu+Y88ti9T/0vTv00YzNJgMBbkvbIV2Y6km1c0XgHgxtOcjJENb2DoTf/N/q9pMzPufFXLHua9hqaMNrqm302+KYgEwS1cCY1pVd0EJwTVQFVuZT1lY/1VaSzMJRsRDjkQl2GH0NPuMotOFfUlSIC8TS7QrCM2EoIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761648833; c=relaxed/simple;
	bh=KAAq3UD42W1vG9OmM9VYHYbQDySbjL7ySIBoXYb+P6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4BXkGiPFrXD6H2xXNUIR2ZAqxiXdM14m6uuamCj2Gz8lMqpJfmT++IGL8rLH6o7HMzo/Ry23BgYAQNfbAbkFIZdk0Cr5VO48FsJm6kwUB/3VoysH11OS+PgEgfYjRMV5M1NoYlx1e8d86j3TlXigLIVc2QXvcTXPkZ4nysvKcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yy/3i9ZL; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4298b49f103so1986118f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 03:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761648830; x=1762253630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ciiMP+aVPTGP01jthAKSkaUntJMAjHCa/1wZcaGOww=;
        b=Yy/3i9ZLnTph6l90l0/LWiSjVJjFFrdB7gzpReH19Aigawc8qKerqf2BoIb2Z3O/th
         3CoMu0Ww8AmvCDWxQx3rmdXWiBLYQeN97T5iWohg9m+o7gKRNEHT4D4yZAhRiTKoJ3a7
         jIoB9i8YPDV7ney8HRyUDM61CedfEH2wdqb7KGHcqgMq1sbTvhv1G2fmU5MIZnWDW9aA
         mMKEapUS1wJDZ/bEVjtG6psYobGTa94j/fsLeL5WYgBMeYvgNQJ71Za8n8v7bJholgzX
         VkDPrXGLD8xLPnMvalQbhA9YgyvHvt7U4++6gFiBcTxUDfr8K7o8apYWqPZeS238SLS2
         ZWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761648830; x=1762253630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ciiMP+aVPTGP01jthAKSkaUntJMAjHCa/1wZcaGOww=;
        b=UAaIC3DtD0ZJHT2HClcVDkwe1LcSBGEdumiBdQ+XgOuXSfTBfKUlmzgUk5OWLbZjUs
         EFLoTqOw1mWid5qRzi0rGT9h5Xx4HjgM2E1v9UT+qw7Ky7w458oanYmAdi02A5YPltJX
         pt3k1el9skD3TrLvLL23Fm11S/kDRGs0e/DLIjnBLJvqbPmzRrUxrvnOSUkJ6Jf3+N+o
         2CY23a5I6eZ8xrTArQNH89NPsmIvw41JOVn/ACPTLRQBYMnRX0klYA4O/LlwtDDsz1R3
         E/M/PUwN4Nrm1iyhQqi02ejPBKAG5SkhK85qA11B/v6rUmo9FTTHehYpJBc3AuucI1qB
         VTtg==
X-Forwarded-Encrypted: i=1; AJvYcCXmzmHYiHLEb6eHoJNBdvEnEu2e3Ylp60M+TC4KqN7/NblDAFRSfI1o5fYyqmJNhVZb5QSDdMgHPeQaSGsT@vger.kernel.org
X-Gm-Message-State: AOJu0YzKK4TOxUPKlI7Zrrl2RRY9qkp1Zc7JEolld0UbKFOlWNElCXKp
	g7mhj4XSEO5lXiEBmG53TqOhTY3+8L2CI5pvWgT0tgI9bppuePrwKSKQgzA3ZzkQo2G9HhRlwcV
	5mpEf
X-Gm-Gg: ASbGncvBzT1N08Ocx7qkQce4O7ROecJANYrt95ajIlXRUHjzXeaIP5R3Y18ipDcANmg
	/6Db5UxfGCVKe4sppOMsP50Ni1ZnMIhRuknEghQWuJPYpgD27YE0hRuaaZLf9j2N2YR6eccNnai
	Rru4EyyG6sf24Rg7hI2Qyg/9enO6UO5Nzqug2lQdK4XDZISEVqGxcNRp9oSxgyht2LjgsT75l2X
	nMgYuJhx58jrOH4g7lxAA5wE/+b1bGlXQ9MYoQuNmKrRzEr2/eLJ84XAL/1KkWB8caEgXRu07yM
	cJIqgtd3tjhSjJS5SFY3PIst3ZjdAPXqIXHDru4WeXFm4FtLiuO2xOqaVngNHl/BkSLUvTo/NIw
	RJGNTZEzehglriPRDouR1dxIgtLcv4B1LydB+AVHrkdpSa/xNB2B3pp+8CfKc+E7HGi1Tm3tjHK
	gOng+50pda8SoW7BXf6Xot
X-Google-Smtp-Source: AGHT+IGNt3x1+qvnQdvPMrB8YbMOh25mEuFQD2Py5L6FbHFNPHpPfAZVVrBrzGdO5MKQniNEUyPgGA==
X-Received: by 2002:a05:6000:26d1:b0:3eb:9447:b97a with SMTP id ffacd0b85a97d-429a7e8e222mr2559278f8f.54.1761648829920;
        Tue, 28 Oct 2025 03:53:49 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:7f41:186a:1d61:ae59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd374e21sm191479545e9.9.2025.10.28.03.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 03:53:49 -0700 (PDT)
Date: Tue, 28 Oct 2025 11:53:44 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Enable use of all SMR groups when
 running bare-metal
Message-ID: <aQCguL11h6oa5Y4C@linaro.org>
References: <20250821-arm-smmu-qcom-all-smr-v1-1-7f5cbbceac3e@linaro.org>
 <aMAkJ7CfPQuhvhfm@willie-the-truck>
 <aMBJNzXpQTMg4Ncs@linaro.org>
 <d73e5026-ccb0-4a19-9742-099a0443f878@arm.com>
 <aMsJHheI6Y1V5q74@linaro.org>
 <aM0LZVudBKjWuVrT@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aM0LZVudBKjWuVrT@willie-the-truck>

Hi Robin,

On Fri, Sep 19, 2025 at 08:51:01AM +0100, Will Deacon wrote:
> On Wed, Sep 17, 2025 at 09:16:46PM +0200, Stephan Gerhold wrote:
> > I realize it is weird to allow non-architectural features like this, but
> > I haven't found any indication that the additional SMRs work any
> > different from the standard ones. The SMMU spec seems to reserve space
> > for up to 256 SMRs in the address space and the register bits, as if it
> > was intended to be extended like this later. That's also why it works
> > correctly without any changes in arm-smmu.c: the bit masks used there
> > already allow up to 256 SMRs.
> > 
> > What do you think?
> 
> Although it's all pretty ugly, I think we really only have two choices:
> 
>   - Teach the core driver code about all this and use an rmr-like scheme
>     to leave the upper SMRs in bypass
> 
>   - Hack it in the impl code as per your patch
> 
> The latter option is probably the most pragmatic (especially considering
> the need to handle the virtualised case differently) but I'd like to see
> what Robin thinks.

Do you have any thoughts for this?

The stream match conflicts that happen without this patch still exist,
I've been testing this patch for quite some time now and have never
noticed any issues.

Thanks,
Stephan

