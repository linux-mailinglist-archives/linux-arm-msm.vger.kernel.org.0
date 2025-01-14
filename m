Return-Path: <linux-arm-msm+bounces-45005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBA2A10600
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 12:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7514B3A8536
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 11:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D542361FC;
	Tue, 14 Jan 2025 11:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YE4mRKe+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6246F2361FE
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 11:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736855833; cv=none; b=KknOh7xgTKkNi/K8FzRKr3EPYSw8yTYobph5/n1z+N1NlUuWOr7o+6XbZLuBo5ERogqywH+Uj0MvFzhei8X1y+peRSVDEAz0iiiaAQPqBAfRL2k3O2llZOVCqw9I93T0aY5fmgNSz8ujrBCAVK9toAhzQs/L87p1TdvoqmvO4Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736855833; c=relaxed/simple;
	bh=5G2f9XKd4/ykSkperkOR/W6hV7lPOMtaZS3ChSif5Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLYPBMnBe2iirvYKpfOWAimvXF/y5Bc2bQUfZhjkf5QmTqr1wHUvfzW5enLcfKKdB2RpEIPMeic6hZ2HbR6hgs9VB7E3xSOhiY96gsisEaQrtjavpHDCT2dgz86p2apQI9FKOUYylm2vxxRETJy4sN3guO5ruu8RsS4lzxSxpV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YE4mRKe+; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5401c52000dso5476539e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 03:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736855829; x=1737460629; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EG2bE0DIBD2yet8T8gsGufzhGOyOI+URLPnHO/LFp1s=;
        b=YE4mRKe+s0g64YO5RfPxIYYp4ixEs5G2iLc/TTL6gnKHabFLGMyjtYdEashW7mmzAG
         Q37ON58DlMX5jThiYg/RfWTp/XziVvHdfjCZrbSTYUf0BiOVBae8eujrj9Mnk2SLVcQg
         MH1wO2SZfcSYLQv/sb24YRZlaRAl5zA0aP0kKKdgTlDcFOMakE1K6BzqHaxYg1XCVeY2
         dIZ3fYkcL70W303Atoy+Mm7uMtpkzT8yvxHlF/v9yTu9aZGXGihLFMJbfhNvpLinlupC
         MX/cFjdfZe3PIPFdsYn2hrAeupC7mQorRPaQUILyH25PqR/pq6LdMgb5wWsInzGU3Gj2
         KX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736855829; x=1737460629;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EG2bE0DIBD2yet8T8gsGufzhGOyOI+URLPnHO/LFp1s=;
        b=Stvht+JIwktU46DT99+QnT/7zwKTjG/VdhNRVFE002PgK0uie1UuEZZU5Y+aSNDoSl
         d58hA0GoEubZsCAf5R0jnlt8SAuf6lPK3Oo9yPW6HEhyRbPwqKruCFtJHTE5opcTAQzr
         rkjYY8GrE6w6lfIekOp3Tg2xGfo7OkGa7hH8oKORWhsZ9gaCEAVSLcrd3uTCbovB/8/V
         iHjhZf7VcrMypvbO921DcgtX7DfZZS866D3h4RIiQSeknr4/TyD4FuZroHzTb7jxqn6D
         NbiHJC1iwJ7XvOPA/wX9ijnZNC4S7ChrCpE6LZIkko9DGP1VYBIvoBHzJPrF8L+4cNIf
         do6g==
X-Forwarded-Encrypted: i=1; AJvYcCUxzbqWA97TPZvRNVcyMLOKZeBObZxhr6ihkvodC1ueho4RqqQrN5IryyENoL7m0JcH9btPZ0jsckFvhVzI@vger.kernel.org
X-Gm-Message-State: AOJu0YwsWc01QVraICeWZ1icIF49r7Th47YkPZF76ecHlmUgeIbs92TQ
	EjfIlpps5khuB8jnLIoJVRh0+wWXrVkuDuDhcMu1GFK7Zux7FMns0MMA73eBn7U=
X-Gm-Gg: ASbGncsZDIZ1DiAr089jY3Qx685hZguInp1h6k9eDwIPzGyIKcvZZgQVjlxWg8/zeYx
	mCxeMZidtbBgilTtneIlbMt7cU14DcLIrdrDLf9jVZ1hc4X3e3pW+KZoIJWCMtXiMWfrAPrRjKn
	ZTsa+xa6p1qciDfZf4EjCn69iotAsLL5W/NWDJp6UnV2eSp7neNONZZTBSNmowq/WkqYT64t9WB
	9t7dfEidnHo1TuUpmVjTtontBLg6EkbMHGzagNovj749qx7Vs7uAvQ+Btd2rCmV+gE0ekqMvcOb
	maG1gof+JDKDG78BfqPSlUOoIWuqHpAUJ1tW
X-Google-Smtp-Source: AGHT+IGYKaEENsM+ETIIS6i2qNffuQ5PleDdqYyQPQbL0nmR7gJPI/hRo+s9dTmtKsyiRgreA72Kjw==
X-Received: by 2002:a05:6512:39d0:b0:542:297f:4f64 with SMTP id 2adb3069b0e04-542848162e6mr8758502e87.43.1736855829458;
        Tue, 14 Jan 2025 03:57:09 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be53e70sm1694560e87.64.2025.01.14.03.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 03:57:09 -0800 (PST)
Date: Tue, 14 Jan 2025 13:57:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 0/2] ARM: implement cacheinfo support (for v7/v7m)
Message-ID: <pu5lqb6l57r34fo23lbsfxmyejmfv5zga5dzf6yo5ay3wkerof@lcopwojovhnx>
References: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org>
 <CACRpkdbfckBBW5W5sEvz1LwzdOvTKi_fi7tDu+9nPeKumYkPeA@mail.gmail.com>
 <lkxm6m2u25o4qfvpja7qsldqm7zjxejkn6d5qihyxbg2zvntwh@icvun74e6rll>
 <y74nrynys7srlwmtfzpjwklfkw33vijrnefjm3iyngn2y35mlz@joqsk74rwl2l>
 <CACRpkdZ1Joi+UW6EQuatx3Z0P0o+HULjwXB9vaAWOJxdBsNO8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZ1Joi+UW6EQuatx3Z0P0o+HULjwXB9vaAWOJxdBsNO8Q@mail.gmail.com>

On Mon, Jan 13, 2025 at 04:07:36PM +0100, Linus Walleij wrote:
> On Fri, Jan 3, 2025 at 6:55 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> > On Thu, Nov 07, 2024 at 04:34:36PM +0200, Dmitry Baryshkov wrote:
> > > On Thu, Nov 07, 2024 at 02:55:55PM +0100, Linus Walleij wrote:
> > > > Hi Dmitry,
> > > >
> > > > On Mon, Oct 14, 2024 at 3:55 PM Dmitry Baryshkov
> > > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > > Follow the ARM64 platform and implement simple cache information driver.
> > > > > As it reads data from CTR (ARMv6+) and CLIDR (ARMv7+) registers, it is
> > > > > limited to the ARMv7 / ARMv7M, providing simple fallback or just
> > > > > returning -EOPNOTSUPP in case of older platforms.
> > > > >
> > > > > In theory we should be able to skip CLIDR reading and assume that Dcache
> > > > > and Icache (or unified L1 cache) always exist if CTR is supported and
> > > > > returns sensible value. However I think this better be handled by the
> > > > > maintainers of corresponding platforms.
> > > > >
> > > > > Other than just providing information to the userspace, this patchset is
> > > > > required in order to implement L2 cache driver (and in the end CPU
> > > > > frequency scaling) on ARMv7-based Qualcomm devices.
> > > > >
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > >
> > > > I added my review tags to the v2 patches, can you put them
> > > > into Russell's patch tracker?
> > >
> > > Done, 9432/1 and 9433/1, thank you!
> >
> > These patches are still in the patch tracker in the "Incoming" state.
> >
> > Russell, Linus (and Sudeep, Ard, Arnd), is there anything blocking them
> > from being accepted?
> 
> I added my Reviewed-by, perhaps rebase them on v6.13-rc1 so
> Russell knows it applies cleanly? (It's pretty straight-forward to
> supercede a patch in the tracker.)

Done, let's hope they finally get picked up by Russell.

-- 
With best wishes
Dmitry

