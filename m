Return-Path: <linux-arm-msm+bounces-43819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 959B1A003D0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 06:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6959D162EC2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 05:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF50E5588E;
	Fri,  3 Jan 2025 05:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xYUOQg9B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7D41B808
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 05:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735883754; cv=none; b=IbiKGMa2IEpditL+U00Jimrr6fBxgrznXi1L1N+RuAOrmZiWSt9iqQr5HLNIARf6D4a+NmoNVsM41etFClkErIb1ar2U9VUP+RMcXoxHC4YcZ0uvVdPq5NxrKIZ8n/Mnnoy8iOyUk/PksQNVBvf4+ij402Xfh2BUjpU9qedwLPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735883754; c=relaxed/simple;
	bh=hee/kgTG8ZfR5t71a37sonQEZ5DkrK6QYkS1bik/gxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WySQPkrGwv2CVLTGsIjciNfD2FrE7I2ofws04f9k/K8KwWNY9IE9TyijYqm62OKnWhV2MO0QFdQIr+TRJL+prYMMT4Sr3BFIJmY1NeFHnTb3+fUkNGKIw+vUXwoX2CdL0Vmx+eCSxBhlArBl1Zm0k71K/DWS6/anZvEb0TIgG9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xYUOQg9B; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-304d9a1f198so8905971fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jan 2025 21:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735883751; x=1736488551; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8TNsIZyk5Im66QqQVkpCl5sYDDDKsswwbUK+aNtF7KE=;
        b=xYUOQg9Bep/jEJk/3BR2OpIlrIhm4I2eugNjd8N9fYcFRXo/sDXFRtzQyPVTp60kA8
         G05dacG/C8yW8YDL/0hqoYHPBBIpnErP2m0o+oYthv5R51V8X8yzNYwXyEdIPMgLj7GE
         6nRvCR528CIUvBH3IV6bkzoIVhr9eT2VdWsKO0kHiJBXzX2Gx66XAh3Br+Wz/OFViihk
         0p5DIPB1HrH6bcFD5bOgagGSFA4EpwES//Gm/Z6XCyUfV0OZoXUePlcFT4Vbf+vzTpEJ
         WHf6iqjRv4eU1v51UAryiD2KdFyAqMus5Ir2SdA5BXgl8ig1FnLBeAeD42KMmWU3FbZm
         EX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735883751; x=1736488551;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8TNsIZyk5Im66QqQVkpCl5sYDDDKsswwbUK+aNtF7KE=;
        b=DX45Gfu1HgSxBfEftNCqLcS+n6nk5SSCbofDvJkeZ18Xr74drpBUdncPE/z9KzsP72
         rqq11kbGejz3uwilM+Nt3WZLT3UFZN+dHgVJe4KwpyOReW81qAgW10hTyKWjTGfpxV6W
         PBSsS5ZNHIPAmhl2fdjIa4QdAnii0Abk5sh+jht4sSxpX4j7Tj7QTuqNsL+IYEnnUvLT
         ZEQM8t8+FeeQYqvn8da4vTC0QxyuZolW5Lr0WaTrIq/RwDFeLIQMdVDY+R53+JwYCA7M
         6hxQ6L6Xwc7UND9j2xfXaKn1+wVhMNfYDpbtlfshcLxcJCNCP+b1lG1L3NXiN0gJptdr
         Pk3g==
X-Forwarded-Encrypted: i=1; AJvYcCWBpF84KHrwXD88z5ynUchFhucmJPkRGXQKi8iroHYq6jU/USksTpSB4qy8laNpBdhnivtWK8KktpbaGovo@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3r/z3hbJ+vgxgYLL0y+udPBmpHEoJ2CjlmZ/YGZUykhKGQIuw
	KEQY4FWKOSkpCzwP3hp5pFhPjfRBN6wTEGD4d+2PXmgmkVeSUUAxs379xduTb2E=
X-Gm-Gg: ASbGncvPwOjl9HQ98PLdXhbRe/cqsjy6jMJLe63/0To2KPjbGWqWm5xVTrWH2GcI4CW
	IzD/pjwSpGH4DezDgkjsRcDlIsAxj2kUEpyLKlXvcA6l7Wu/3UZwyuexYYQJk9bbxV5olYYib8z
	Sjv1qBHyKiMz7wV1zXnRSEsyjd/akEqESZIxaQGPiZjuzxLX8YdAJRI0R1F1YTy15EQ85wxJ+vV
	7WwEeyS4NYChmNldpsmlvXwKejWPxFMKPMEOspIgYdtpKi/5REC76UUVE5ka7MP0OsTOaeCRnEf
	KPb6O0rd+rRYXnDwtTzRWmroJGhQyOFLxEKL
X-Google-Smtp-Source: AGHT+IFd8JD4I8sVveMannF81lqmEODVNWfMUqiYkHdf8QJydpiXFJoP8OozGkhJGA83xU2uw5LYtA==
X-Received: by 2002:a05:651c:542:b0:302:3610:a50f with SMTP id 38308e7fff4ca-3046860efacmr177251481fa.30.1735883750994;
        Thu, 02 Jan 2025 21:55:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b096026sm45044071fa.118.2025.01.02.21.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 21:55:49 -0800 (PST)
Date: Fri, 3 Jan 2025 07:55:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 0/2] ARM: implement cacheinfo support (for v7/v7m)
Message-ID: <y74nrynys7srlwmtfzpjwklfkw33vijrnefjm3iyngn2y35mlz@joqsk74rwl2l>
References: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org>
 <CACRpkdbfckBBW5W5sEvz1LwzdOvTKi_fi7tDu+9nPeKumYkPeA@mail.gmail.com>
 <lkxm6m2u25o4qfvpja7qsldqm7zjxejkn6d5qihyxbg2zvntwh@icvun74e6rll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <lkxm6m2u25o4qfvpja7qsldqm7zjxejkn6d5qihyxbg2zvntwh@icvun74e6rll>

On Thu, Nov 07, 2024 at 04:34:36PM +0200, Dmitry Baryshkov wrote:
> On Thu, Nov 07, 2024 at 02:55:55PM +0100, Linus Walleij wrote:
> > Hi Dmitry,
> > 
> > On Mon, Oct 14, 2024 at 3:55 PM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > 
> > > Follow the ARM64 platform and implement simple cache information driver.
> > > As it reads data from CTR (ARMv6+) and CLIDR (ARMv7+) registers, it is
> > > limited to the ARMv7 / ARMv7M, providing simple fallback or just
> > > returning -EOPNOTSUPP in case of older platforms.
> > >
> > > In theory we should be able to skip CLIDR reading and assume that Dcache
> > > and Icache (or unified L1 cache) always exist if CTR is supported and
> > > returns sensible value. However I think this better be handled by the
> > > maintainers of corresponding platforms.
> > >
> > > Other than just providing information to the userspace, this patchset is
> > > required in order to implement L2 cache driver (and in the end CPU
> > > frequency scaling) on ARMv7-based Qualcomm devices.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > I added my review tags to the v2 patches, can you put them
> > into Russell's patch tracker?
> 
> Done, 9432/1 and 9433/1, thank you!

These patches are still in the patch tracker in the "Incoming" state.

Russell, Linus (and Sudeep, Ard, Arnd), is there anything blocking them
from being accepted?

-- 
With best wishes
Dmitry

