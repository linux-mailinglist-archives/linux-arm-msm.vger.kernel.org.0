Return-Path: <linux-arm-msm+bounces-41514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9FE9ECF0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 15:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 590E1167E77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 14:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE1418A6DE;
	Wed, 11 Dec 2024 14:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z8Xwhc6X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDD11494CC
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 14:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733928808; cv=none; b=c0KzWIflvjg+aAwSmF3fTHyiZICORPQv8CDTMYo0njx/pcgItp5wBVljjLfivUZhAkrx3MvO4fINYgJSdr7idYMy/iFYLinkBaSDESfobKexnuA3CPq5TkxsPf25RHjUN6otjU5akZhRydkBpIjLYLmm12RuHP18oCZe/8fcEdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733928808; c=relaxed/simple;
	bh=71rnSn7wFVoD21U48pjt1zEn20evixs1VxJ1eb4i9XA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MjdNdjmuVyYqFgadTF4cHln3y5a1N78Z3Advt8x7rzpPXZ5fU6IMd8eYozPYNJrVI5ITHkOcwbIZWmyjt4wxWTazwrMpJkCdtfFlbxKW5ZbNJUvhLdkXU/ZBD7FefbMJkMUk0HmYhqwUOSL8iC/ipsbeAUnsSWeQsZBP2kt+2cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z8Xwhc6X; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-728eedfca37so805762b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 06:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733928806; x=1734533606; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ymW0qBk2uaFHFENJ06sbcJsCW5UbRGhhuFjHIPKzUxM=;
        b=Z8Xwhc6X+ORWsd1PyKMplb0d92snfxj6PPptVVhfmea0zGvD2n6gxMDxkWowoIXeJ6
         qlPLSLimbO3AT34yyqNAyyTyuOrai2tLhGHZIn9sbh6/9LOFCdTstLqQgkxm9A62t842
         XJDqlKq+Z/A6J1IKmK7KbmulBVVj7lmo/sadGJcOH5hRNkeowsjkn56Nj5aSgYgLwIUh
         y/gCNj+TRnZpPIb0HT1+QIy2r937bdQLR/s91YdC8oTo/xdPfVwtrUjIJ9IW2ZJx8uw2
         4Ej8B6T0h0uap5OeMSpvibuWCT7aZImfscHRJujE9RDdJg5FDGGfLdljzuYS2FHzR5f0
         qT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733928806; x=1734533606;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ymW0qBk2uaFHFENJ06sbcJsCW5UbRGhhuFjHIPKzUxM=;
        b=rmqLx7/IxdlrKxtckprfwmjETnHpGY7IrTjVFqsvgoSz8vV+LM81LfbcebNOGf6njf
         GVpX1YorQv1Nx3T2i5q8LT+ARADQ3UjO3F5KxlkBJf7S9Wft/lXxb7RaZo5x/s8cShNb
         VJxUegI4teNYP2XFUB6p7l0Ev/oDAHkl2OXkk/cJMe3Vh7Ion04TKRDD3kU77RrTwM8J
         SzE7Rsc5ZNVR3tj1oJU0nE4DwOhbKDKUk8v3tlsU/oB04sSFBmbiLiqbK9/PXrdVW9Kg
         o67JhWY/l8nkI4Y7WdgcTh9WwZKpi12L4uRnMTkYqbIfzimQQsDHf74UPoA1j2A65zM4
         xX7A==
X-Forwarded-Encrypted: i=1; AJvYcCXfFjxLlQ/Xo8a7AopPBM/JiUNl1knCYlKQqB5rOjT/93pSqFGlix4pGuG9epKYOxhX76qwJfQ9jB3j6AIi@vger.kernel.org
X-Gm-Message-State: AOJu0YygmrF38WQC8GNjyPNwAO+hgm0ULiRYNa/cZulEI2IcS6/c3fJ7
	WTBTEhj2O6Lq6SxDI63benYL5cScozW63mY3TjyyytSTtueKoI36YuZ0KbRdm1Ow6m4skcKQfHM
	=
X-Gm-Gg: ASbGncsAuDbf64u7oIRmGreetmMMaKfnbN//n9IMFDYhGvJn3lFyJgq/5+N/e0bb3Ui
	FS6lPlKhElc+ElxEe0pV9C7loZqprrvg2Xlx958BEc2bPSRPWUCDeJ4OL4HTQgkI1XCuDv9tUf/
	YMqy9w2TCjjLNzVatwOTJioPw7UaOKH7wErdZMw5Uc2TPeXnAnyiXCwlFp+iYYLDW8wsIv3NTRS
	dkL4fMh0te+sB7fW38ZjeXXl8qJwaI0tG+4UbI2v1Qaqg0/HFfhcFXapLF606A=
X-Google-Smtp-Source: AGHT+IFq2maYgX0r5WCfZcfI+e7jk/jBe+sBMf30hjHmbIonDMVLKoFqFD2DGiVukLa2oSKZQbvJiw==
X-Received: by 2002:a05:6a00:c8a:b0:727:3b77:4174 with SMTP id d2e1a72fcca58-728ed4b9fa7mr5561458b3a.23.1733928806217;
        Wed, 11 Dec 2024 06:53:26 -0800 (PST)
Received: from thinkpad ([120.60.55.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725f03a0ca4sm5205402b3a.113.2024.12.11.06.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 06:53:25 -0800 (PST)
Date: Wed, 11 Dec 2024 20:23:15 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: mhi resume failure on reboot with 6.13-rc2
Message-ID: <20241211145315.vaf7gbapieywcvau@thinkpad>
References: <Z1me8iaK7cwgjL92@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1me8iaK7cwgjL92@hovoldconsulting.com>

Hi,

On Wed, Dec 11, 2024 at 03:17:22PM +0100, Johan Hovold wrote:
> Hi Mani,
> 
> I just hit the following modem related error on reboot of the x1e80100
> CRD for the second time with 6.13-rc2:
> 
> 	[  138.348724] shutdown[1]: Rebooting.
>         [  138.545683] arm-smmu 3da0000.iommu: disabling translation
>         [  138.582505] mhi mhi0: Resuming from non M3 state (SYS ERROR)
>         [  138.588516] mhi-pci-generic 0005:01:00.0: failed to resume device: -22
>         [  138.595375] mhi-pci-generic 0005:01:00.0: device recovery started
>         [  138.603841] wwan wwan0: port wwan0qcdm0 disconnected
>         [  138.609508] wwan wwan0: port wwan0mbim0 disconnected
>         [  138.615137] wwan wwan0: port wwan0qmi0 disconnected
>         [  138.702604] mhi mhi0: Requested to power ON
>         [  139.027494] mhi mhi0: Power on setup success
>         [  139.027640] mhi mhi0: Wait for device to enter SBL or Mission mode
> 
> and then the machine hangs.
> 
> Do you know if there are any changes since 6.12 that could cause this?
> 

Only 3 changes went in for 6.13-rc1 and they shouldn't cause any issues. One
caused the regression with pcim_iomap_region(), but you submitted a fix for
that and other two were trivial.

From the log, 'mhi mhi0: Resuming from non M3 state (SYS ERROR)' indicates that
the firmware got crashed while resuming. So maybe you should check with ath12k
folks.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

