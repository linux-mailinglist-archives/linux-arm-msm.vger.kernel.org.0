Return-Path: <linux-arm-msm+bounces-42684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4C09F67FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 15:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C6A77A032A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 14:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C051B0405;
	Wed, 18 Dec 2024 14:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pHinmipk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8CF15853C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 14:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734530958; cv=none; b=qs5NmG6fMveEX1hUMJvLTnBX0gZoF8+a7U48A6R5Op4Om8af0tVvIr1doZwmrMD3cXKBtp23BKvEvAovHLphjVQnDVRbp73E/AUD5FB8E0xNjmGj/27WCooeRY0m/qNHA6dMSHrrmEeGionxw9eu+AsS2fDg0tj1GWY4lrLQhz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734530958; c=relaxed/simple;
	bh=ab/BzWY6jox/poZbbozr+CLHkFTcOIWwb6vP6tJ3K78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/HPv7p+6xxvZZ/AZ/7UUicKTUU0xdQZ+ofBxPZ1ltkxQco2qhcPmcwFtVSHiGtJJBXOLK3h8P76QnJ/hv77ZLjHreDXGZSmIRXGrFv2p1RFi/hkPR7Qvjh2tbAbPBTPoywLi+v8sY/BpE3CRt+Giz+f1S/ajFZe+Ry9vNWP4No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pHinmipk; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7ea9739647bso4001959a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 06:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734530956; x=1735135756; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X/Mv6Gl1ZnKmi5pkQYAmxfhejMR6LdMzdSDhbu9FQsw=;
        b=pHinmipkL5SgPKohwvTbfU0SSvZ17ZSvEPmHI7AIObBcGxpmwVjkwyPkNMjqedeYmh
         N0COgfCdg8yPEP0Q0Rat2T7mSYYFBS8FZ84arM51M8QAqHAcWyM7AUi61FIY51U5YOHr
         jTvkuP+Gt9cGSLOw/JAF4UD3jWS3WXjPQGqoIlbGzMc3xsQTU/UqImr2bRixoM5qH6PS
         MvoW9spsYan9G8FPVN6HAvj9iUmqL7E2UuEIYITWlcq8bYjp0Bh8m6ehi5UiljSf/22T
         QT5kHXb7XrgpXPWjLqZ5GaWdsmegqsHrBPo4X1U65esUagT3sZ3lrIk0R2MFhfszkQ6f
         ozWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734530956; x=1735135756;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X/Mv6Gl1ZnKmi5pkQYAmxfhejMR6LdMzdSDhbu9FQsw=;
        b=m28P8eIuAPGjVJyBo8/a5ix+9o6Iy/np79vlPc4eyZ+9a6xu7CvUXttjx0mr77+TEK
         q/r3NMMy3gXwr9KcP041nq0I9ap9obeBBKbz3OafEMv+TMin2iyGkkuYNCf8+9ymVdmn
         jow8/nGsXkvxUVcJmxR9SHyQbGH204MKdUMegnP0fJs3z6LWbjCzdEAHdKZ4tWXbgKGN
         M9RAnkE9pCgaEznmqe0lvO0yeu6yfbNxWBCNZb4Z7a+4fXJDzH27j/miUF/Xl2A0S3EP
         Ue9jbCgnLHTX2ndGZZ2m9BCpvZqNEdvPRpyue960AtDh/DWQBGnOfZEGzgNcfVAPNZB5
         vHoA==
X-Forwarded-Encrypted: i=1; AJvYcCUN1+SPqUK8LBH++yzk/5P3Dt+QHIHfmFI6tZpWfztM6O4PghgbufQOZGi46BSovAaS9J1KoOx+nvBwzfcR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+06+pTiz+PmruhHNVOXmCd4wJILK6HQ9aJxmvhEmV2RWX9qlQ
	wHg4PiWQ2jc3tADH66dwHLy8kKmw/IxVWX9fk3pAriulq0O6rH+Cdi48bIc/EA==
X-Gm-Gg: ASbGncv4aC2cyBhwT/mqgSVPkcrcfIKfRlRogIvQv1dJ1ERktkYFGa+hyEmABLxTGR9
	zEYRgqV7NtacUP9y025XC3HIfMtOuWvWDP4TMNCV1cQlJc2sw2/4PdZ4LWbKbt9Uhmfymtk1u1N
	onqZhqaKpfQnuiceuX+ZHcpt5BYKXcuD6NGCha3e0FgW+/wMic2NKvCoQaa22zPS303TC6ELVeW
	9o6OkdE2N129eC2z4PeOknsoJjvwC0C5HMYCzLAN+t6BB9jYR+fV1yYzfeOY45/NPWK
X-Google-Smtp-Source: AGHT+IH5xzquXkfFb3lF+nm5lz7tueo/hHvx4LOhJ/KLOsglCvaRpW0x6iDimmd/UdbW7dAmaOMPGQ==
X-Received: by 2002:a17:90b:3508:b0:2ea:2a8d:dd2a with SMTP id 98e67ed59e1d1-2f2e935559cmr4099678a91.27.1734530956490;
        Wed, 18 Dec 2024 06:09:16 -0800 (PST)
Received: from thinkpad ([117.213.97.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2eda27344sm1446032a91.34.2024.12.18.06.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 06:09:16 -0800 (PST)
Date: Wed, 18 Dec 2024 19:39:10 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Loic Poulain <loic.poulain@linaro.org>
Subject: Re: mhi resume failure on reboot with 6.13-rc2
Message-ID: <20241218140910.ysovysnvns26vbmd@thinkpad>
References: <20241211145315.vaf7gbapieywcvau@thinkpad>
 <Z1mp3_ArzL-GLr3D@hovoldconsulting.com>
 <20241216074021.kwoid2747o7piquv@thinkpad>
 <Z2ApCU3DAxKS7Y9k@hovoldconsulting.com>
 <20241216141303.2zr5klbgua55agkx@thinkpad>
 <Z2KKjWY2mPen6GPL@hovoldconsulting.com>
 <20241218113830.efflnkxz7qu24xux@thinkpad>
 <Z2K53-As8w4IH06U@hovoldconsulting.com>
 <20241218123019.py57s4r3takm2fs6@thinkpad>
 <Z2LUNo--8YpLO6kD@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z2LUNo--8YpLO6kD@hovoldconsulting.com>

On Wed, Dec 18, 2024 at 02:55:02PM +0100, Johan Hovold wrote:
> On Wed, Dec 18, 2024 at 06:00:19PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Dec 18, 2024 at 01:02:39PM +0100, Johan Hovold wrote:
> > > On Wed, Dec 18, 2024 at 05:08:30PM +0530, Manivannan Sadhasivam wrote:
> > > > On Wed, Dec 18, 2024 at 09:40:45AM +0100, Johan Hovold wrote:
> > > 
> > > > > I've tracked down the hang to a deadlock on the parent device lock.
> > > > > 
> > > > > Driver core takes the parent device lock before calling shutdown(), and
> > > > > then mhi_pci_shutdown() waits indefinitely for the recovery thread to
> > > > > finish.
> > > 
> > > > Thanks for tracking the deadlock. I think we should use pci_try_reset_function()
> > > > instead of pci_reset_function() in mhi_pci_recovery_work().
> > > > 
> > > > If the pci_dev_lock() is already taken, it will return with -EAGAIN and we do
> > > > not need to worry in that case since the host is going to be powered off anyway
> > > > (and so the device).
> > > 
> > > That may work. But note that I've now also seen this deadlock during
> > > suspend (i.e. when the device is not going away). The
> > > pci_try_reset_function() should avoid the deadlock here too, but we'll
> > > end up in funny state.
> > 
> > Hopefully, recovery_work() started by mhi_pci_runtime_resume() would be able to
> > reset the device.
> 
> But that's not going to happen as that reset is what is currently
> causing the deadlock and which would simply be skipped if you switch to
> pci_try_reset_function().
> 

mhi_pci_runtime_resume() will queue the recovery_work() and return. So I was
hoping that by the time pci_try_reset_function() is called, the lock would be
available.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

