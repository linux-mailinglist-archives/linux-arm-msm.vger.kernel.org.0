Return-Path: <linux-arm-msm+bounces-31667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 144999777BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 06:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F79C1F25890
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 04:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76F431459F7;
	Fri, 13 Sep 2024 04:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ga+e1oE8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69332F34
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2024 04:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726200792; cv=none; b=QjM7t9RjT8ITZrxgACS6l79zh523jldb2C6N4IfmKCBJ/pli21GiKf8CCEIOKQ/HjWNCOeQWHa7aVkQTdkixhVRLuoxwnoTzUc/G24MuEkx300mpjxLf18VdmkN7s5JiGI4RgZOhn2dhPMf3SrazsZv4ZHW64hp50kyBTHxEQaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726200792; c=relaxed/simple;
	bh=3RHXD0JztOWgxmOfe3MqrQ03ez0C4dRKs8NyHIOX/gY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PAtm3cFRmkH7+JCT7ibYGdIzdenSZafIfR4BOFDwcD6Dke2kx+HDUkXNesIXawjjV4AFjMaCsXZ3KYXG3oL+UEC+xDPEtboW7Fb0jWtAq2P5jHMFzuenfoXGzJkLtKwMzgFpJBYk9jIvScS2HW/vVVC2Ps3HLdsVxLvGoLssMLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ga+e1oE8; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6d49cec2a5dso3943747b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Sep 2024 21:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726200790; x=1726805590; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ytV/cW8qP0AhnvyRSBmY1oJKJQJ5t2/DISr11I1TwTo=;
        b=ga+e1oE8hSQQ/mJamweJcHGzcoDDV0Q9Q5oMrIz59h0d3MafhFDEU3dipOIbwdT+5o
         kFpkldX+mrTxNZVz+bCcmVWqhElX5C+A0E3ONx5ngX5WATPvJjlVQS3D/yTdlVYWt3DJ
         sys5jUsJ9DAQF76zBySBzu6u42BY5fKm9k1hhuv9GHyJFQq8koOxqk7kNUgexaWK/Udj
         ATZxHR7dcuPdwbw/bEkcoEHHWJekT3DLEeQLQHEoW9lKImAo6cFLHriAfYQzDFauut4h
         tzvbhTOplURgHaXf4b9EQLd6n+TG4urJ2Ix7z3ab/aGjVKLHI/0qrasL7rNVwOuO6/Sj
         8G6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726200790; x=1726805590;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytV/cW8qP0AhnvyRSBmY1oJKJQJ5t2/DISr11I1TwTo=;
        b=oIFeOnp21RaPxIrWhLY1ZmzqLsO9AwGfvG98lS1oYxqkPjiHzSjZYp8nRMXFkgLGAt
         1K4LzR+P3DpBWIkqjdZWH4pN0OxoGxp1eFU2YdjMWYmNgQ7WDCAPLWGLE2XLuOyoqGN7
         Vfh+Wpf5Vvkz9Upg2nUUAC3Ta0aJZmo1784uaAXM5lyP5JhEOXrxfmGnMcQbqOeY+y+b
         3JO59yAdhGLqsd4UmR2Da1VUqbv7QcC6L9IjKrCGUY2FrAXVZZqLYmFTb/Ze35N2+dIM
         QWp1saOyPrUQ2T0tTDWSLumrVa0aCSbxeOYy3bWI6rgULvD7VxBtl2MZPspG7nL7/ivd
         KdUg==
X-Forwarded-Encrypted: i=1; AJvYcCVLCrPNGe1DKFrt9ItOUWU9x/iPonjSZVDuDXljOzwfVpYfjZNXhq8rQtqRg/5vveOSGl6BnMA/6/Vma7+h@vger.kernel.org
X-Gm-Message-State: AOJu0YxhF5B04F+B3QAASP2ZOXKLKyEwI8TV3XcJn35VVDJ+88wagvHL
	CcdH7JjlAGNfDo4elv95BOMsG601EO9f2Rhu1/TpzRx8E6J3l1PsB4NOZnIXGJMNXL5hMXly1cM
	HXGFlLo3DAGI2ji0VCwG+tb7dWIZZaGlRyqhhiA==
X-Google-Smtp-Source: AGHT+IGFIiFoLnoMrNLvrbA7W6LP9mmwF8lL4/E9ZOuU3zznDzmplHUCmfvd8R2Oa0TFB8WWqzp74sQZmTr6M95s1TY=
X-Received: by 2002:a05:690c:101:b0:6b0:e813:753b with SMTP id
 00721157ae682-6dbcc592e0cmr12578527b3.38.1726200789447; Thu, 12 Sep 2024
 21:13:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240912092457.1887906-1-dmitry.baryshkov@linaro.org> <ZuOnz1QcNZUVYPZZ@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <ZuOnz1QcNZUVYPZZ@hu-bjorande-lv.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 13 Sep 2024 07:12:58 +0300
Message-ID: <CAA8EJprNbt1FE-rqL_R+KVyVWHzZekTwfSYnedJYrODFtS6qbQ@mail.gmail.com>
Subject: Re: [RFC] Qualcomm RB3 Gen2 WiFi firmware pull
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Doug Anderson <dianders@chromium.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Sept 2024 at 05:48, Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
>
> On Thu, Sep 12, 2024 at 12:24:57PM +0300, Dmitry Baryshkov wrote:
> > Hello,
> >
> > I'm planning to send the following pull request to linux-firmware, adding WiFi
> > DSP firmware for the RB3 Gen2 board. However before doing that I wanted to
> > check if it's fine with all affected maintainers.
> >
> > Qualcomm RB3 Gen2 board resets if it's used with the existing WCN6750 firmware,
> > most likely because of the differences in the TZ setup. This pull request adds
> > firmware specific to the qcm6490 / qcs6490 SoC family.
> >
>
> Given that this firmware runs on the SoC, isn't it device specific? Does
> it make sense to carry this under ath11k/, when it's expected to have
> the same form and distribution as the other remoteproc firmware?

This is an interesting question. I think that having all WiFi-related
firmware under athNk makes sense. For example wlanmdsp.mbn files are
also stored under ath10k/WCN3990/ subdirs.
So do q6 and m3 firmware files under ath11k/IPQ*/.

>
> >
> > @Kalle, I understand that you cannot and won't fully support this firmware set.
> > As a preparation to adding these files I moved existing files to the sc7280/
> > subdir and pil-squashed them.  It is a generic preference to use a single MBN
> > file instead of MDT + Bnn files. The mdt_loader detects the format without
> > using the extension, handles the differences internally and doesn't require any
> > changes to the driver or to the DT.  Could you please ack such a change?
> >
>
> I much prefer that we switch this to the single-file version, so I'm
> onboard with this.
>
> >
> > @Bjorn, @Konrad in the past we have pushed all WPSS / WiFi firmware to ath10k
> > and ath11k even if gets executed on the host.  I should have caught this while
> > reviewing DT changes.  This branch uses firmware name that isn't compatible
> > with the existing DT files.  Would you insist on adding compatibility symlink
> > or we'd better fix the DT files?
> >
>
> I think we have a limited user base of sc7280-chrome-common, so we
> should be able to fix up the DeviceTree, and avoid the symlink.

I think we should keep the ath11k/WCN6750/hw1.0/wpss.mdt symlink,
that's fine. I was talking about adding the qcom/qcm6490/wpss.mbn ->
ath11k/WCN6750/hw1.0/wpss.mbn and the same for qcs6490 (just for the
sake of existing DT files) or it's fine to fix the DT files instead
and omit the symlink.

>
> But I'd prefer Doug's ack on that.
>
> > ---
> >
> > The following changes since commit 4a0367b33aeaa7fe1255a920d0e39f825b6985c1:
> >
> >   Merge branch 'rtl8852b' into 'main' (2024-09-11 11:00:41 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/lumag/linux-firmware rb3gen2-wpss
> >
> > for you to fetch changes up to fb8c67987c89b6f33fb787dfc6ff6e5e0f317f6d:
> >
> >   ath11k: add device-specific firmware for QCM6490 boards (2024-09-12 11:58:57 +0300)
> >
> > ----------------------------------------------------------------
> > Dmitry Baryshkov (2):
> >       ath11k: move WCN6750 firmware to the device-specific subdir
> >       ath11k: add device-specific firmware for QCM6490 boards
> >
> >  WHENCE                                             |  18 ++++++++----------
> >  ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn              | Bin 0 -> 7734064 bytes
>
> qcm or qcs?

qcm6490 as the main location, qcs6490 is symlinked via WHENCE file.

>
> Regards,
> Bjorn
>
> >  ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} | Bin 5819999 -> 7463728 bytes
> >  ath11k/WCN6750/hw1.0/wpss.b00                      | Bin 340 -> 0 bytes
> >  ath11k/WCN6750/hw1.0/wpss.b01                      | Bin 6848 -> 0 bytes
> >  ath11k/WCN6750/hw1.0/wpss.b02                      | Bin 10300 -> 0 bytes
> >  ath11k/WCN6750/hw1.0/wpss.b03                      | Bin 4096 -> 0 bytes
> >  ath11k/WCN6750/hw1.0/wpss.b05                      | Bin 164332 -> 0 bytes
> >  ath11k/WCN6750/hw1.0/wpss.b06                      | Bin 266684 -> 0 bytes
> >  ath11k/WCN6750/hw1.0/wpss.b07                      | Bin 1176368 -> 0 bytes
> >  ath11k/WCN6750/hw1.0/wpss.b08                      |   0
> >  ath11k/WCN6750/hw1.0/wpss.mdt                      | Bin 7188 -> 0 bytes
> >  12 files changed, 8 insertions(+), 10 deletions(-)
> >  create mode 100644 ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn
> >  rename ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} (77%)
> >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b00
> >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b01
> >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b02
> >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b03
> >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b05
> >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b06
> >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b07
> >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b08
> >  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.mdt



-- 
With best wishes
Dmitry

