Return-Path: <linux-arm-msm+bounces-42217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C5D9F1B9D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 01:56:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80E9D188EDC7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 00:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E51216415;
	Sat, 14 Dec 2024 00:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JVDOjCnn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD62E6125
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 00:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734137632; cv=none; b=t5ansoODXS1Fdoqhm0vKHuB1DAemly9J5CA1VAtydNml/6j210juv+WNE7PGxWGBRlZFRSlShXXU2APgPZwfm/cZHvtcK0dyhWIj3kVCg1GacMREuc9IwM28iI0a9W9NubRmVMPbzLFkqOmlqopq/4AT8y7v4boHNPKu76mwA1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734137632; c=relaxed/simple;
	bh=Q5cd0cjWyJ6Gcpn2MCFi80hTQsy0Q72Z9blKAZtUJPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R6ts+Xp018LoEG2aTDt8IxeAexjRqxzeiKTQVpGgF6enw7237poGH3+h4sawGwFK6Sq1RESohGCgxXseWNjWSjpAI+CakVO/lFjnrZoaaZN+14H/BDMGPM+kHK60Rp5B6By8SngcXN7y4MncB0elPMQH2tIZDODOndMz0i9DF9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JVDOjCnn; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30036310158so19855561fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 16:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734137628; x=1734742428; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5cd0cjWyJ6Gcpn2MCFi80hTQsy0Q72Z9blKAZtUJPM=;
        b=JVDOjCnnjd7ppNBDmkTE58MhHZ8TgnjBtPNBCPbn0Zc2IFw+qEVXHhXFKKPN67yuiN
         9jcYssue/d2z7U7yGX1XX8jnsKFXmgTJ24D2bIWlOaqZqiPeqcZ9Nz9Mp9vTTTJvH/mb
         w7ouYAvl2m92dor0uf/UWcoxaBDscJXv+7TYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734137628; x=1734742428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q5cd0cjWyJ6Gcpn2MCFi80hTQsy0Q72Z9blKAZtUJPM=;
        b=KbxkLh1CUZEGHVZ8MjXaxhxL0kC9iFI8sYw1dwYUX1NCsKNdlnlsNRGnW0Jwi4NujG
         tvazApD8kWEfM77VlKe9Q1xx+vFYjKflvlK3y/FUzTae2jst8c/j7ZZQizW0FoB/0V/s
         cVuROTynjMuFMbVLGSOwtTP4wAj22oc5uQFrALBG+tZ/lSyXWgj11CMH/3nzOa8n/8FE
         v0QkbAugCZsTfu8YQC422GyBDYktuUJk/wM/kshPQNtcshqCCrHQZgUy7h5pwhq/f8d+
         j6QrSrZV28q8TBDXDiCDoW953ZQ30oNYGEMmcig1tTio/eQjZ42aF9d+nk5trBeOES7E
         OoIA==
X-Forwarded-Encrypted: i=1; AJvYcCXjt15dvyytPWrqRDU2z/LknRiTyG45rjgGGZmr3KcnPbAdLHRcxoG7QeAXljK2vNGAZ8Qr8A10S2GUeeuu@vger.kernel.org
X-Gm-Message-State: AOJu0YwTwMtrqmbJY6DTbnmTHpROPqGtykQV9WI1IpQBqqfghI+XgJRE
	4gUfBuQL+VoHyKSfpGHnE+Cm6Yg2GEGnVKbKmB8M6DXdCHqHYAMc2NgakpwxdoIAOY/39Sx9wOf
	ktIKI
X-Gm-Gg: ASbGncuhRvl8pCOP4C4FDBUItQmieIvYlQzW+468HBWzA8S3KKl7C4NrGTn0ddH5JRo
	e2mx5/zgLlZs6+rUGgXjw+SYW4hP2/1vs0jDNZwnky1p8GWfmNuFZXS3lsDFo29x2bh0Kvlmu0V
	CUVbk/jKWj6hbborUM71cthvpYLrdLaNv1DSZPiG1HQ9mw2gdQj/3/vbTzTtx2JSHcmyetMuwXI
	KLgGNEzKgIcRUMtnrBqYgDucKLoO6qmgQEVQjrORvZufv71cvezys0TV4rVQYqC8IaAYEpXlPc7
	faeXSUDhyqi6blbY/WBJ
X-Google-Smtp-Source: AGHT+IE2LWFIflCA9htmf+yf2sG/ae5YLPlGNXocIjNtxXZFrX7ONaa4ZSGu9ZeGGHYjycymzikNGA==
X-Received: by 2002:a2e:be91:0:b0:302:3abc:d9e2 with SMTP id 38308e7fff4ca-3025459b69dmr17469701fa.29.1734137627936;
        Fri, 13 Dec 2024 16:53:47 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3034401d432sm733111fa.12.2024.12.13.16.53.46
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 16:53:47 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53e3a227b82so2183896e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 16:53:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUiaN0Rz04yvXtHOuV7w+ekZtFd6YxR8UmPMrgd8XBilLht0NRRZYoYjmgdnXT0fwEOBl5YyzdA7CEoWYoE@vger.kernel.org
X-Received: by 2002:a05:6512:3088:b0:540:2111:db71 with SMTP id
 2adb3069b0e04-540905a6fd4mr1322255e87.42.1734137626438; Fri, 13 Dec 2024
 16:53:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209174430.2904353-1-dianders@chromium.org>
 <20241209094310.6.I722621804be859e4ae4b7479ce191c5e3367b37c@changeid> <tx7vtur7yea6ruefrkpkccqptahgmxnsrudwdz5uzcfxnng25b@afrr5bmdk2xa>
In-Reply-To: <tx7vtur7yea6ruefrkpkccqptahgmxnsrudwdz5uzcfxnng25b@afrr5bmdk2xa>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Dec 2024 16:53:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XxL=HjA8pgpQjY8AQAkJns3H0BMV8nO9jKUxiuu2vKqA@mail.gmail.com>
X-Gm-Features: AbW1kvYcJpO0sSHq-EaRR9tcdt8oe3PTBnA6qFnauBDoIBqVcERtioVBqqLZdLw
Message-ID: <CAD=FV=XxL=HjA8pgpQjY8AQAkJns3H0BMV8nO9jKUxiuu2vKqA@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: errata: Add QCOM_KRYO_6XX_GOLD/PRIME to the spectre_bhb_k32_list
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Julius Werner <jwerner@chromium.org>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, Roxana Bradescu <roxabee@google.com>, 
	bjorn.andersson@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 9, 2024 at 3:09=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, Dec 09, 2024 at 09:43:16AM -0800, Douglas Anderson wrote:
> > Qualcomm Kryo 600-series Gold cores appear to have a derivative of an
> > ARM Cortex A78 / ARM Cortex X1 in them. Since these need Spectre
> > mitigation then the Kyro 600-series Gold/Prime cores also should need
> > Spectre mitigation.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > Yes. I know. This patch DOESN'T COMPILE because
> > MIDR_QCOM_KRYO_6XX_GOLD and MIDR_QCOM_KRYO_6XX_PRIME are not
> > defined. Those value needs to come from Qualcomm or from testing on
> > hardware, which I don't have. Qualcomm needs to chime in to confirm
> > that this Spectre mitigation is correct anyway, though. I'm including
> > this patch so it's obvious that I think these cores also need the
> > mitigation.
>
> SM8350 (Kryo 680) identifies itself as 0x41/0xd44 (Prime), 0x41/0xd41
> (Gold) and 0x41/0xd05 (Silver)

Wow, all standard ARM cores. OK, I guess we can drop this patch too then. N=
ice!


-Doug

