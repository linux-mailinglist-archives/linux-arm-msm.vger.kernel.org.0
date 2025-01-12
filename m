Return-Path: <linux-arm-msm+bounces-44818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BDDA0A732
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jan 2025 05:23:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB5467A2E25
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jan 2025 04:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5C9535D8;
	Sun, 12 Jan 2025 04:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V7/hYADb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB45AEEBB
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jan 2025 04:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736655812; cv=none; b=mmYiuUdi0nXK60p9jkHcaCq0PpCGFv9sJOFig/N7thi+GMZ+5K5W0PDaKMzpu6phyx5FtJDNUOqWnkxPtcjD/RwG+Fkqzpzdb0vnDi4Lje3NyFyFDHsv6eO2LwD1r9eH4lxHzWu2rZ45rxJgfGt9yIDGxALwZgjHmXijIPQlFUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736655812; c=relaxed/simple;
	bh=36RubHS3Cnm6huMkfjDsiWl/nxjNKQeCb1t+02PapzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rETMNrF/ynL2a5LsEOie6wkEkGHSuOkaLIG8Hu8nEDxby+IqsGaGX0wTTvjKYUB4IScrObEwLaVJ8jG8t/PwdG6vvoAqX0ntEg6soa2/6VQpdJywkbMLCb0IT4/cGZ8ucHLqVW1QLO4qvn0wUVGO/llKUl7cUEPxJj3o1OcC1K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V7/hYADb; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2eed82ca5b4so5458764a91.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jan 2025 20:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736655810; x=1737260610; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o1iD5FXnr9tRagISbCiZ6n33Qv7hNVSaezl59sxw848=;
        b=V7/hYADbVUoisWJjXgfkHYGi9d0jHjpTC3nJZUap0To20zcAM8SnphgMrdZsmvh4F2
         duPwzRogXWQTrCGWNufByM8A/WB7sQUJJrOSpXle8tspZxH62SEwRT/rEcXt3s4vRf8J
         j5qUsiH4gnOiguwR1xsNict/vBVXCGzxi4jF2vtnIUKfpItv5QHuA93iGrqtDNqWy9rx
         3++vsrpwOYd1vap4HzANvCPuEcYO+RljiV78rD0cDCmRVlx+x0tvWh9PLRgeq3PmIRhg
         B3isps/g4U4L8rHLXuWH/E1AMq96DD5OmpmyTJjuZquchoSu2ysEJZxT5gLEXMyDNEol
         uu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736655810; x=1737260610;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o1iD5FXnr9tRagISbCiZ6n33Qv7hNVSaezl59sxw848=;
        b=m5AjMlGM0s+j+dh2zDpSkgBZ4svmZUNoCwiQxarJ1mf+10IBihhK7PftUXiui4tv2X
         +iOuFg9Tf44iR1wRGIa2RCCpKlYrAfHs8FiMkVrUYLWlPFljztVEYLyX7euP/3V8WexS
         5r5YKvZEHCJA8GEXRy6/4x7xep9H186s4n65uAoadDUPgAWmkiAPsM8HkskUaHLJGjVs
         8Cf71q7UUfQsDZqqbACrEfQA+KTRRA6WBtRn1YN05N5m5pnQhGRicoobT+bMsS1y7b+W
         8ZAQeBEDw1pDlkokwM+zpDeSfm+wghDNpo9cI9XJOE+TCCPTbniI8MKyznnSFHxqk+Kh
         30Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ+VtNsvev3L0Mr+8eomFU9FvPbrZBSBmDFRl+9V6wioqAmWX06NhY4u7qDVxkaL3RUue/iz2cPgi6eMQx@vger.kernel.org
X-Gm-Message-State: AOJu0YwzADadF11DlsYIjBzy4Eowg/xvFc+uKXCSXdcmMidnAK/P9ok9
	0AiqFQMr8HxEeL6CIWEPdgz5jlBkTsdx9CbF0UDTNaiSvZzZb1Xso6U/93wkjQ==
X-Gm-Gg: ASbGncvBIlN9XhphtuVFgplp1HBGmIeGdbQHwm8MU6aQ42/vptzkgue/SueuKV1Rs1I
	SlCWVt8zig0K3cScJRVkwEhyUtG53rqLik/JZk3fsIiXb/RLRnn8vJWqNUFbWceDl+JcFFJyxB0
	UxyQ+d0naQUqv6Iu4ASYlIOJMAiOnXvJ53DZMzTN9Jgm6bgSxv/Hqilgl6GpTj3YVTDo1ovMYID
	2lxJEvdvItuXNJ92nzAUaiBY4hAQKRq+Xa0UXRIIDLrTCZG9LzR4co4fno19XYTr9gN
X-Google-Smtp-Source: AGHT+IF3OEz850HbSNTcnLpGcYOvuZZBOpakiqJoF5m/TvFHKLFMjvbB2UauZ+EQoabKlqDmh0L6kA==
X-Received: by 2002:a17:90a:da8e:b0:2ee:b0b0:8e02 with SMTP id 98e67ed59e1d1-2f5490ac09cmr22992308a91.28.1736655810070;
        Sat, 11 Jan 2025 20:23:30 -0800 (PST)
Received: from thinkpad ([117.193.215.92])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a2872a3sm7694399a91.16.2025.01.11.20.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 20:23:29 -0800 (PST)
Date: Sun, 12 Jan 2025 09:53:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>
Cc: mhi@lists.linux.dev, Johan Hovold <johan@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] bus: mhi: host: pci_generic: Recover the device
 synchronously from mhi_pci_runtime_resume()
Message-ID: <20250112042323.kn7xlgyf3olpcavf@thinkpad>
References: <20250108-mhi_recovery_fix-v1-0-a0a00a17da46@linaro.org>
 <20250108-mhi_recovery_fix-v1-2-a0a00a17da46@linaro.org>
 <CAMZdPi9KiLczjETLwJG_9krn_z=Og0uZhYuajPeZYoBHanxMiw@mail.gmail.com>
 <20250108160211.6dok3zcn2qaoj3lp@thinkpad>
 <CAMZdPi_OPXGkrT_4iyLF-698TPUgHu=Y5M-wVRq=kx6RWH4bVw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMZdPi_OPXGkrT_4iyLF-698TPUgHu=Y5M-wVRq=kx6RWH4bVw@mail.gmail.com>

On Thu, Jan 09, 2025 at 09:50:55PM +0100, Loic Poulain wrote:
> On Wed, 8 Jan 2025 at 17:02, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Wed, Jan 08, 2025 at 04:19:06PM +0100, Loic Poulain wrote:
> > > On Wed, 8 Jan 2025 at 14:39, Manivannan Sadhasivam via B4 Relay
> > > <devnull+manivannan.sadhasivam.linaro.org@kernel.org> wrote:
> > > >
> > > > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > >
> > > > Currently, in mhi_pci_runtime_resume(), if the resume fails, recovery_work
> > > > is started asynchronously and success is returned. But this doesn't align
> > > > with what PM core expects as documented in
> > > > Documentation/power/runtime_pm.rst:
> > > >
> > > > "Once the subsystem-level resume callback (or the driver resume callback,
> > > > if invoked directly) has completed successfully, the PM core regards the
> > > > device as fully operational, which means that the device _must_ be able to
> > > > complete I/O operations as needed.  The runtime PM status of the device is
> > > > then 'active'."
> > > >
> > > > So the PM core ends up marking the runtime PM status of the device as
> > > > 'active', even though the device is not able to handle the I/O operations.
> > > > This same condition more or less applies to system resume as well.
> > > >
> > > > So to avoid this ambiguity, try to recover the device synchronously from
> > > > mhi_pci_runtime_resume() and return the actual error code in the case of
> > > > recovery failure.
> > > >
> > > > For doing so, move the recovery code to __mhi_pci_recovery_work() helper
> > > > and call that from both mhi_pci_recovery_work() and
> > > > mhi_pci_runtime_resume(). Former still ignores the return value, while the
> > > > latter passes it to PM core.
> > > >
> > > > Cc: stable@vger.kernel.org # 5.13
> > > > Reported-by: Johan Hovold <johan@kernel.org>
> > > > Closes: https://lore.kernel.org/mhi/Z2PbEPYpqFfrLSJi@hovoldconsulting.com
> > > > Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > >
> > > Note that it will noticeably impact the user experience on system-wide
> > > resume (mhi_pci_resume), because MHI devices usually take a while (a
> > > few seconds) to cold boot and reach a ready state (or time out in the
> > > worst case). So we may have people complaining about delayed resume
> > > regression on their laptop even if they are not using the MHI
> > > device/modem function. Are we ok with that?
> > >
> >
> > Are you saying that the modem will enter D3Cold all the time during system
> > suspend? I think you are referring to x86 host machines here.
> 
> It depends on the host and its firmware implementation, but yes I
> observed that x86_64 based laptops are powering off the mPCIe slot
> while suspended.
> 

Then the default behavior should be to power down the MHI stack during suspend.

> > If that is the case, we should not be using mhi_pci_runtime_*() calls in
> > mhi_pci_suspend/resume(). Rather the MHI stack should be powered down during
> > suspend and powered ON during resume.
> 
> Yes, but what about the hosts keeping power in suspend state? we can
> not really know that programmatically AFAIK.
> 

Well, there are a few APIs we can rely on, but they are not reliable atleast on
DT platforms. However, powering down the MHI stack should be safe irrespective
of what the platform decides to do.

Regarding your comment on device taking time to resume, we can opt for async PM
to let the device come up without affecting overall system resume.

Let me know if both of the above options make sense to you. I'll submit
patches to incorporate them.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

