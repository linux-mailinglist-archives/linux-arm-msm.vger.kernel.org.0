Return-Path: <linux-arm-msm+bounces-29424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDB595DA9E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Aug 2024 04:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C6FF1C21863
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Aug 2024 02:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC2F54C69;
	Sat, 24 Aug 2024 02:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GRbye5n4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9B4111AD
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Aug 2024 02:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724466196; cv=none; b=nxO7lQa78Ire8nDy7xT5qX941qc8VxV4FgOq1tMYNplLGxd7Ev453I7hPOWO+sYVVt1AE7uk9GikwC2qibG/LvIl23nzERI9KIPUGrsfobyck2NXoim22ChofhFs67ee62F4IJw7nCYv7tRWNDR3tPzBU126D+QDptJ+/W7Mk3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724466196; c=relaxed/simple;
	bh=i35o0zzTkuuLgSrNUQubaIIl4CJFgxIAVXBVtabL3fg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B50efVBI4XFsJTvivUssUVAlA2IuTh8j+83ylRj4IT5ai15hVW1YUcmD2bDIpVeDLez9JVsLlDvV2D4yBLAJ4hJIm8YUw8p/WEebL+/sWQhEmwJhUz8LldjvCNRuopKfyKoiZt7mgCD/MyI3mWHrz7grwQ/xURFPdwnPN90tGmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GRbye5n4; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ef2d96164aso24141591fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 19:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1724466193; x=1725070993; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O9zI+L5MCe2KlUtOy00sjP2H1MksZ4qDKvLS3+IXg5s=;
        b=GRbye5n4LZHBkrSg2DKD7k8YDwFYolwFrFctLmU3rfgAPZbLGqPt5O6zpNNkyXmnn+
         KP++T0mGb/4380WPGiPddF+a79fAAShZauahbvRVRhPjPuB6nrWQ7wdpDZjDa23AEQuV
         aeBI2kILp6Jq+FZ8KLx+TbU5QQVDBwW3BLA8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724466193; x=1725070993;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O9zI+L5MCe2KlUtOy00sjP2H1MksZ4qDKvLS3+IXg5s=;
        b=EAOWDbUkiXClRZnT8lVct2znnuOIjTe07pZ7bYkE5iBQvg+sUP8arUGwwXAQMVR2em
         F5GTR+nJWlCX/n/0jyHx5+7Bd1JzYlfv45843gvxUNQd+E2JRCyHAmgNMrXXqNcDPiKF
         P+pIjOMZpGKdRsuDpN4i2EXkXnRdQN/26hcBSGv9pIqK4r1SwBooY8/+6hoS7un4yUcG
         6C7n/pXxFq4i89lCYDfJNWIUlStEvBiNh4N0Kn8IoU3kvCS96KoPPGe0Xugav2gwIXnw
         cqkSmRqz72u4NKJoxH2fZFLc8A8Hk5XrBv4/xmsIRMR2kerB4hY7mBbwE4WMhSAqcDOB
         GwEg==
X-Forwarded-Encrypted: i=1; AJvYcCXr3uQjIlHyido1KtIcVpE9pbK+03Ab7V1hkNsSgl1W7wYBRuR092SuNv7uUEtmaFGU8AT08jZ5w9zwJdk3@vger.kernel.org
X-Gm-Message-State: AOJu0YxmUhq0c7ifAZ8F+bcQ+LeZfgClYF3+tkXS3IIh40KQOFommDmb
	UcyBRmKiaJMWrFBiThxnjY0DGG4CyDnE/Dmqx5qkarmOSovkvj1tf2bpHf5XHNK9rGd8gnA30cR
	EJDq4AQ==
X-Google-Smtp-Source: AGHT+IHKjvQnrr+jNIxYl8bJ6dEVkrSuIQd8RbZixUAYwnK6diVtb75A1N8Ie6fbFLP8erxLjmcGlw==
X-Received: by 2002:a2e:702:0:b0:2ef:29cd:3183 with SMTP id 38308e7fff4ca-2f4f57b7bdbmr23783521fa.48.1724466192163;
        Fri, 23 Aug 2024 19:23:12 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f4047c6741sm6206221fa.50.2024.08.23.19.23.10
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 19:23:11 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ef2d96164aso24141431fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 19:23:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDQfWNdFgxucGZbQsLG80HesuAzyvZwR4zCcrJGeb8MbmeNHKuNNoo1EuQ93OQmZ7MWrbk8QwkmRdWCU/y@vger.kernel.org
X-Received: by 2002:a2e:4611:0:b0:2f3:f054:684b with SMTP id
 38308e7fff4ca-2f4f5778f77mr20400311fa.29.1724466190574; Fri, 23 Aug 2024
 19:23:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240819-uncompressed-distro-packages-v1-1-c8accc8bc9ea@quicinc.com>
 <20240823105853.GC31866@willie-the-truck> <ZskWfKIZkThKpj9m@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <ZskWfKIZkThKpj9m@hu-bjorande-lv.qualcomm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 24 Aug 2024 10:22:54 +0800
X-Gmail-Original-Message-ID: <CAHk-=wjpXFOMq03cVq9XA+33QGALRzWV4mCND6dYpwAnXRqnmA@mail.gmail.com>
Message-ID: <CAHk-=wjpXFOMq03cVq9XA+33QGALRzWV4mCND6dYpwAnXRqnmA@mail.gmail.com>
Subject: Re: [PATCH] arm64: Allow packing uncompressed images into distro packages
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 24 Aug 2024 at 07:08, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> But the change also made it possible to install "vmlinuz.efi", by
> setting both options to =y. Was this intentional?

Absolutely. My arm64 config in fact has EFI_ZBOOT enabled.

IOW, the intent of that CONFIG_COMPRESSED_INSTALL was simply to make
"make install" do the same thing that "make zinstall" used to do.

I in fact initially limited the whole COMPRESSED_INSTALL question to
be *only* for when EFI_ZBOOT is enabled (because that was my
situation), and privately asked Will if maybe non-EFI people want it.
So the patch originally had

+       depends on EFI && EFI_ZBOOT

and I asked Will

  Comments? Do the non-EFI_ZBOOT cases also perhaps want this (ie
  "Image.gz" as opposed to "vmlinuz.efi")?

  I intentionally tried to make it as limited as possible, but maybe the
  non-EFI people would want this too?

and he thought that it would be better to just make this compressed
install question be independent of anything else, and literally just
boil down to "do you want 'make install' to do the same thing as 'make
zinstall' does?"

I have *no* idea about what the actual package manager case wants, though.

              Linus

