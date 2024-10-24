Return-Path: <linux-arm-msm+bounces-35751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA28D9AF5B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 01:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DBFB1F22645
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 23:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D2E21832D;
	Thu, 24 Oct 2024 23:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uA8s2lPt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0704208968
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 23:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729811276; cv=none; b=AnOQsj22dvamBHTQgr+nMpL6oyA94XlXPlkLty1Gm9Dl2pGazDpA+AiMPwFqQbzkpuwgsjwVc1v4a3wLqFXe7uuuecKYoyM6Qz/WwtYMQaaj/fTWVm4GHTIItWqwUKlVBcbRE/xNonN+Otwhe0TNwrNA0+x3CkCxG9xgjtsVj6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729811276; c=relaxed/simple;
	bh=DVn+SYk+Tjqw0iTy0Q3POl4+sdohk99Vj0R+qOJJ1tM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FU1sl0/8+28VJEe63L/PeBBfpHQcFQ2fkM0gjcIwNjZ4PPfmw76vncbvoVc61rHzbSQubNNWF0k6dkkyBCsrwox+NHPu8FDFld8az6BV+vap/S69WneS20JwXz+P2u3xIjviSA4EEh+47xRCrbyQ+PS7VL6HD6LrQWEAB/rnITY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uA8s2lPt; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e377e4aea3so13133477b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 16:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729811274; x=1730416074; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zd00M3Nfh2EArviVNHmKQJ9PrDOqZudLClGyoklHFFQ=;
        b=uA8s2lPtt7CxA1RbthIpkzDUNyv8+xp6VAIABipueeeNxC49n7DiDQlYdmpW/jQheT
         XpgduRJv/LUJ8+WGRm22rGeF4FypzLWm5kF3Mbb9tGF70QsASoir/Zh2/W8jSXmBbGQ3
         h9IokpTySpYxui+ifwUdnndnTJWlBLoXZC+/djWW3CVFDIHXhaE4/kSivJth+Fe08PHP
         4N96iX4rhv7RVu7X3JReUivnqux+tYtJENx72pvN6QZqh5GNl4N6v/p1XXEYFjVLxfIw
         2k2xoyIn1QGXR5imCtSmsQ7gkUlfX0xD5pZJoqetC2gxYXYVp6M2zImjabpW/yum/TII
         uIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729811274; x=1730416074;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zd00M3Nfh2EArviVNHmKQJ9PrDOqZudLClGyoklHFFQ=;
        b=SCJVOXd5fVq3KjupH//8ccRKIIyaMO+YTLfHA+bX3FKsDlAfvhsFoLzrwP6J5/shgc
         0kMIz/FUHOGcD30gWEByjuSKZA0DVRrWE9z1FC2zfasGJdVsrB/nyvoBZf+A2dP94IcH
         0h0Qi2k0DWCLb5LbqFKq4qTIi3j2NlocDCt/4v6bv+jx3SHaSwbsV/pmb0RMoT0rhE19
         lTy/P2uB1Wo39tRlkiDj3orlW9ZwguXJ7FhKOdxTqyLsqIFSeMWrsv7O139n2hXAM0N4
         sUCO46zAwD/X+m6ETacRhjYiugEhSTpnK6OSxcgkBsGLpamRrOKZirgv1EILGYNTFbRC
         GEnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmvCVAwpgWGdsXkzM8FziuBLPMT4EeIB9/YzYfRl59eJOJRYfTfvDr6in/iI9ulMONA6r1NdiCoZwuwp6m@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk31mj3novITvAjobASrRpVh8JJUWI/X3VWsTCOCtyi13fFcGw
	zu2FHYNHyfl7k5cdS5EBiOFOcGfpihKxl3LtB/hNASGf7/2zjtd2cCsxYejcXV7JWXgCik/O6i8
	JHoiIr+lfHimYMCmUS1vPIQSmXaWKJmpKVAyWvQ==
X-Google-Smtp-Source: AGHT+IF814lTmaAdxP7QG+WjWHddmoT0eNmGaeikt22gW0jXgl1lCMcHZj3wSxBIOfK0gG522vtucnFBiJQutSiPhTA=
X-Received: by 2002:a05:690c:93:b0:6c3:7d68:b400 with SMTP id
 00721157ae682-6e7f0e3e428mr83305447b3.10.1729811273927; Thu, 24 Oct 2024
 16:07:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241006135530.17363-1-quic_spuppala@quicinc.com> <20241023213134.GC3736641@google.com>
In-Reply-To: <20241023213134.GC3736641@google.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 25 Oct 2024 01:07:18 +0200
Message-ID: <CAPDyKFo05Hyw9gdEBx7zQq_6P58ittHHsZQLuqmeR1AChyHSHw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] Avoid reprogram all keys to Inline Crypto Engine
 for MMC runtime suspend resume
To: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>, Eric Biggers <ebiggers@kernel.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	quic_rampraka@quicinc.com, quic_nitirawa@quicinc.com, 
	quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com, 
	quic_neersoni@quicinc.com, quic_gaurkash@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Oct 2024 at 23:31, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Sun, Oct 06, 2024 at 07:25:28PM +0530, Seshu Madhavi Puppala wrote:
> > Crypto reprogram all keys is called for each MMC runtime
> > suspend/resume in current upstream design.
>
> Is that correct?  I thought that similar to what is done for UFS, the key
> reprogramming happens only after the MMC controller is reset.  I thought that is
> different from a runtime suspend.

Looks like Seshu is not really worried about the host's runtime
suspend, but the card's runtime suspend.

Perhaps there are some out of tree code involved here that makes use
of MMC_CAP_AGGRESSIVE_PM, which is what allows the card to be runtime
suspended?

>
> If it's in fact triggering more often, maybe that is what needs to be fixed?

We could extend the runtime PM autosusend timeout for the card, if
that makes sense.

Kind regards
Uffe

