Return-Path: <linux-arm-msm+bounces-26017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D610E92F701
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 10:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C5EAB21526
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 08:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A116013D504;
	Fri, 12 Jul 2024 08:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BCluSOK8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6174EB5E;
	Fri, 12 Jul 2024 08:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720773425; cv=none; b=ps6AzbkcdKX5UK+JUUyvdcJ4yycmXbeqfZQSVLJI+3z2cRzoHCrAoTRwsnEqZErKBkfAyL/kJ9Jp6lZ3XOOYpbZolVgjXaRlbUsJfw0tZHfC1mGTOHcTWx4RhTrR5lNfSCb1lbe41SPQTM8W/63ahUQpGh9XfJPqBZqbWc952i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720773425; c=relaxed/simple;
	bh=u1jwDm6+J9qBbHh2AzVRjr2MkiVFWEb9adHPWot3rtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NjRvToUcqyCqK1olRZVBAkOXGbOj+b/Pesvx1iJ5c3jc+KioVEUJU92W88EQC51si22POf7SIIShEIqwl4B91BXXWiKzBlIIDGXhhi6rQBkE6SgDHA6u/I0YjXhQY9wbWXe0oJtR4DCVBMT324/uVpKgNB1rRyq91MifPK2wMHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BCluSOK8; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-78006198aeeso1112274a12.1;
        Fri, 12 Jul 2024 01:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720773423; x=1721378223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6/K6Rg0AJds2+EOH8gU+mdzqML6uDxTreH95296T/VY=;
        b=BCluSOK83iFYNxE7zIoKFZsxrmUwg8dsmmTogsaD4Pb6Xh1gGgceGdvPHOh0YQjIWR
         uSQk6uqqUFaIHAa8d/a37Q85fJWh4vGSYUBklMQPGMl8M+LrtaHnuO58VtYXDGdmK1qR
         Hk6b4f5L3A43+wpRuaVNuHlh5NGU6mhYuseLGBiTeW9/8Ep2xOGk9FSJjx129L0rVX99
         mzsatQxlv5dkGJ2+KChRQyOPoo/kS5oyglfUWSuuWmv0uEwr3NRT2qMriKD0S/GzTZgC
         3d8g79LG4Js/w9kWHUX6TxndEd2AK24u7XE+GZW/SNzUzYqU2W9aju00mZWtjuZqi431
         iojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720773423; x=1721378223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/K6Rg0AJds2+EOH8gU+mdzqML6uDxTreH95296T/VY=;
        b=RxggYbny0JBIMODpnNM0i8Mvf3PGOTCojl9SGdqE+CZN22I1ynr66HsPIo4fcGiXMM
         EKrx/L0lc87HeoCXHm087dKb52XCbOLXxAiHh58LkHYnLA3B2m0pBVMt8U/QJlR0vVGh
         CkuVQt4cF0anzNT7gax2NgogKO9elf9Tl0Dv/3i4d+uyQKv6J4oR51YXO7Co9gGengA7
         Itqu7f2EQ9+cjt0ul59jRwmuirA8+IZB6ShCYtTaV51BtWEKdXUGrvPyO0+pFKzuaVt9
         cKx+9QqshbGb0+tQoGwl904fkwceE+0kp3MSdlJRW69Fz8w8GMMmSoUflmeyz1GrmUyT
         4fdg==
X-Forwarded-Encrypted: i=1; AJvYcCUFD2Xxl7wupsxSKgngO0wtT8VvzP0OL3PQioztepKy8mSA2slBb409bIZhTpS1MPaBQounCgteUIgY5DWlTzY2raQCPP6/E2WwAuzf/qJ5I3JJ2hFsi0Qy7v+MzCKHrI7ZjUckOKGUNh8WrA==
X-Gm-Message-State: AOJu0Yx7/mt69v1vAmTwH+0COuoURKxtXf6Tzm2UdDObsyBLF4e6OmL1
	CqKnicPyL/p++k7GTS6Y5IlWG3azdbx/jCJ/Rs2Aq0/syUPMLKsYYSN51fan
X-Google-Smtp-Source: AGHT+IGaRh2bvKEOkEB2r8f4cfdEqTjTRug/+2s29ujo+XnLZCxb+IuZW9BGK8xpzVV54cMlFkx+fw==
X-Received: by 2002:a17:90a:e288:b0:2c8:e189:f94c with SMTP id 98e67ed59e1d1-2cac4d345bamr3230277a91.11.1720773423466;
        Fri, 12 Jul 2024 01:37:03 -0700 (PDT)
Received: from bnew-VirtualBox ([2405:201:3020:7812:62ae:9a8b:a942:6b7f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-77d5edcdec1sm5423569a12.6.2024.07.12.01.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 01:37:02 -0700 (PDT)
Date: Fri, 12 Jul 2024 14:06:57 +0530
From: Ankit Agrawal <agrawal.ag.ankit@gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/clocksource/qcom: Add missing iounmap() on error
 when reading clock frequency.
Message-ID: <20240712083657.GA182712@bnew-VirtualBox>
References: <20240710110813.GA15351@bnew-VirtualBox>
 <2a3561cc-c6b3-4823-b488-fc8ebc53e1a6@linaro.org>
 <20240711054934.GA37910@bnew-VirtualBox>
 <793b70b2-d6c1-4e4b-96a5-8a257837eafb@linaro.org>
 <069282eb-d891-4537-bdc0-85de17b5e61f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <069282eb-d891-4537-bdc0-85de17b5e61f@linaro.org>

On Thu, Jul 11, 2024 at 10:13:38AM +0200, Konrad Dybcio wrote:
> On 11.07.2024 10:11 AM, Konrad Dybcio wrote:
> > On 11.07.2024 7:49 AM, Ankit Agrawal wrote:
> >> On Wed, Jul 10, 2024 at 01:54:01PM +0200, Konrad Dybcio wrote:
> >>> On 10.07.2024 1:08 PM, Ankit Agrawal wrote:

[...]

> 
> We should probably also check if msm_timer_init() succeeds and unmap
> if that fails.. we can just check the return value of that function
> and if it's non-zero, call iounmap

Sure. I have updated the patch accordingly. Please find version 2 of the
patch here: https://lore.kernel.org/linux-arm-msm/20240712082747.GA182658@bnew-VirtualBox/

Thanks!
Ankit

