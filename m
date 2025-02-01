Return-Path: <linux-arm-msm+bounces-46656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05760A24A6F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 17:34:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C57B7A039B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 16:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5061C5D44;
	Sat,  1 Feb 2025 16:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVCfhuZV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF7A1BBBD4;
	Sat,  1 Feb 2025 16:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738427670; cv=none; b=BQFeYUPJw1xxbQ8q0E1J46tDeWICMaj9U7W1Pf2UeSucFCWSmthZ38xAL5eoZiXF34xJzyg4RoZVgQRUWDW/eFslCJpkTqNB4qM6TIe/kjQYBPm/gfNZjF5I7HwB0m2ikXkvr7O75yx2lRjr3wl2x4VouG+9d9PMrJeuDTpOhLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738427670; c=relaxed/simple;
	bh=tDyhorXyf61KzIVLARtJ1pBbB+25Ayo/ggH84SDJlfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ASEYBex3vmPjiXWmm6sR4sqDO+htZdyEVCRQpSnAeXxCRTUpN/vocr8NjRJUtDw8sl8XzG7Q8QElEbW7WgcD46rAcfGhHQ29BIFe2hCXB9w16ZbfLE/Un6s/OogTfR3Jtzu8eWX2eMeGLioUFhsvqTM8TZmJE44IyfvcbzxPwrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVCfhuZV; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-219f8263ae0so55794965ad.0;
        Sat, 01 Feb 2025 08:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738427668; x=1739032468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rw5CDGeNAXHcIv9I05e+KmdzvvrpagDx33eTW7QaPk=;
        b=bVCfhuZVUAJhdmZE9eXcUN+YERXj8rGHskv1MZtFl+OchoWPWKlLMGJZmqRip27Dq1
         RAZeoJfGrT5ul4ikZP4xihpzqWC3/q75BLdsZlWenrXBQG9xbiNiDiTtUfAOqMkW77aA
         gwQNlt7T5Ey260AjFQ2L0X+6U5sLzEFfYbFJ7QROEEK8UUzs1dHCXGAC/o64MXo204aP
         Lxi8GI4bsBUq1z6nc+doY7qzSvfildaTxgKMZCorf1o5TrIaGYWkMrYdYus+i8kLvU3F
         PeiOVAeXGxuA2Tk/h4Gq0QembYIb45sTGluIC8J0F4ZaasBIObwHtjKd6BHkMCunOjAp
         5Pqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738427668; x=1739032468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rw5CDGeNAXHcIv9I05e+KmdzvvrpagDx33eTW7QaPk=;
        b=cu89l0Laf/MQfAdwyOebUK0NiUOMERNTA+cEtOO2mB72c3ckLdRfNBcafJGTSsEvzi
         i0jHbpPECL9OYmez8kU81gE+mFPCIMtPq8sRsqlVfYjscA6u5WLloqwSb7Zukh0RQC3Y
         HOjow8RHFXW4KD00yFNV8T6aM/ureRjjLVRKxeEH0s/Doqn7mdqYH17OVWNL10Jr8A3B
         1QNgu2Uvqg5KFSvrvxuK2LOcbxewu3Kr/2vnrJAALa9kDJ9TQ9+Ba9Xr05L2rV67UYfa
         oBKD3iwvmKkbYMpvlwPJugFDvGzczJUxXbt7EEniyADZkacgSx/O2TLcP4T7yPt8Y9Vo
         zZNg==
X-Forwarded-Encrypted: i=1; AJvYcCUByWVSzgtoMzz9dyLS30Sx+/3KsJW2D8XZiWme0UjrQA2lyjecFvpRTFOojbD5+7CRDYvTAk3+WREuHjc=@vger.kernel.org, AJvYcCVGwK3kW+y1tOcgATv0abAtHqYSeEyVBlic1vedtKE5xs7DCM7/NebiizRIyS7C3192Wa3j1vrgT2uutP1uUA==@vger.kernel.org, AJvYcCVtyvCPj+n15+XmzYP+y8rNQ0VHCqRWmQ/49seFbZ3Om/OKfww00p2Ke1vUgpLI/7lh+sSb36r9yQZaRpj/F2jMHnaUmQ==@vger.kernel.org, AJvYcCWVXJOvN5kH8jMl+Y3RVBDmT5Iz+gHioLd/xkTQXfnVFCTiTio7RAQDsoKfxE5pHX9c6an1eiONIIrS@vger.kernel.org, AJvYcCXICwEnIzPIaMFaNYsKe46JujbOhokeTH+vhc89PdJ9Q3134/kZ2gt5qY6oKr4pXmdSnjgyid09UwLzN9uK@vger.kernel.org
X-Gm-Message-State: AOJu0YzZx6mvtzhkyED0IJmxZJG5MransRVQsmbvbsfP+7gTLNPapO8V
	6AdOzLCeIyx/B4bFE2punkK31GIzh0LJKj4lqrwKpqSJsjLZeXTN
X-Gm-Gg: ASbGncvoNK/2EGwUZ1ie7Lfy9pz9Q2JIxYL2biHJp0FWDTBqXmkngSGar1Y/KLD59zs
	YrBiFo3kqXd7vFyUfYwBXlQYD9qv9OZDUSRgc7skno3NOpay0P/X3qll4vmW8Qod3WmMMcFT3TX
	qi+IEvWjoXARGXuRt38R8ttYmxjg8cV6tQWmPuyfYVYi+eWQ4idQooOrFNkrXgFC1jcQHIAZjw7
	d/+cv6kRGWxUYLGkwtyk3mXjxyGheU3SOJLmiTfHPPJ833wvvTTRKb1Qy/du70HxXQZ5vp/YWR0
	F8ev8YE9mY09+Rvj
X-Google-Smtp-Source: AGHT+IHYIyyhQyCr4zJPxBlGg+rtfSQqSyIltCCmOB3F05c1HfP75Mvwy2uLT513Sf7dOCP4Tekigg==
X-Received: by 2002:a17:902:ce91:b0:216:2259:a4bd with SMTP id d9443c01a7336-21dd7e08915mr223414495ad.52.1738427667889;
        Sat, 01 Feb 2025 08:34:27 -0800 (PST)
Received: from SC8280XP.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de331efafsm47660075ad.217.2025.02.01.08.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 08:34:27 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	bryan.odonoghue@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	jdelvare@suse.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	mitltlatltl@gmail.com,
	platform-driver-x86@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH RESEND v6 0/3] platform: arm64: Huawei Matebook E Go embedded controller
Date: Sun,  2 Feb 2025 00:34:13 +0800
Message-ID: <20250201163416.2774-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <018281e0-001a-4587-b775-a9df6e54f75e@oss.qualcomm.com>
References: <018281e0-001a-4587-b775-a9df6e54f75e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, Feb 1, 2025 at 11:35 PM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> On 1.02.2025 8:38 AM, Pengyu Luo wrote:
> > On Sat, Feb 1, 2025 at 5:20 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> On 31/01/2025 10:21, Pengyu Luo wrote:
> >>> This adds binding, drivers and the DT support for the Huawei Matebook E Go
> >>> (sc8280xp-based) Embedded Controller which is also found in Huawei Matebook
> >>> E Go LTE (sc8180x-based), but I don't have the sc8180x one to perform
> >>> tests, so this series enable support for sc8280xp variant only, this series
> >>> provides the following features:
> >>>
> >>> - battery and charger information report
> >>> - charging thresholds control
> >>> - FN lock (An alternative method)
> >>> - LID switch detection
> >>> - Temperature sensors
> >>> - USB Type-C altmode
> >>> - USB Type-C PD(high power)
> >>>
> >>
> >> Why are you resending?
> >>
> >> Previous version was only week ago and minimal time is two weeks. Plus
> >> its merge window, so this resend is unjustified.
> >
> > Sorry, I am still new to the process, I may have misunderstood something.
> > I sent it because I had got at leaset one reviewed tag for every patch
> > from the corresponding subsystem maintainer. Can I expect that there would
> > be no reviewing? All I need to do is wait for it to be applied.
> 
> Generally if people have a concern, they'll share it with you.
> It may be that one review is not enough, this is up to the maintainer.
> 
> You don't need to resend after you get new tags, the maintainer tools will
> pick those up when the patches are being applied.
> 
> Patches are generally not picked up by maintainers in the timeframe between
> stable vX.Y release and vX.(Y+1)-rc1, this is the time when Linus accepts
> code that has been sitting in the maintainers' branches for some time and
> getting build/functionality tested in linux-next over the previous cycle
> 

It is helpful, thanks for explanation.

Best wishes,
Pengyu

