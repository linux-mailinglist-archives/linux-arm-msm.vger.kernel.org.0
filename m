Return-Path: <linux-arm-msm+bounces-31795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 658AD979315
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Sep 2024 21:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 825DC1C20DF4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Sep 2024 19:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5880DBA49;
	Sat, 14 Sep 2024 19:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mwoO2yiw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8027F8BE8
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Sep 2024 19:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726340480; cv=none; b=u1NKfzBx4KuvVuJEYOD1A45iBrmWlOjNXcE5a0VfQunZcvSYZQLVEOkVlAmH4hMK8uPwOrO6cfhoSzsM0FRoWPoy8tZfXc0sgxA1OqUHihCYBn3JE92VKvhpta9JAptdZOig+Apiammv9Ry5euXunvMjhetWhztLMdIG0t4+Oh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726340480; c=relaxed/simple;
	bh=gESXMoLYu676V9JC1/oe9uVpVHGw4Zcxh+xv/+nPiDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FpndwC97rFJFd/8aQLvXacNblKpN3lTKMr0GMqcZdFs7QftA3YbfBwhVrlt3KIU8qYym/B/Fhm2PjwBgIwUfh9bzx0K3Q6baUxQB877zkzcCpHjNzayoHIA1KH/Ma8btvtEAqhz+wscr8pu0WdzfUh1onWW3IhnZfV+u72GNGkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mwoO2yiw; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6d5893cd721so15445717b3.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Sep 2024 12:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726340477; x=1726945277; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=szRf8lRJKxbqD9O4+nb1t2XKlx3NHKTDlt8GQW7inAc=;
        b=mwoO2yiwaEgQDHWw4E0/WMXphEOs/N2Zwwhvri3k+EVTIimyFL7aqpG/936fJE6epI
         GEk5YoXb/UD79k6d7OL91uDoOALPTh2F2Dni25qG4L4rlDskeZ0uf/bR4rLMCcrJ2JpP
         4TCvp5n0PlqFPatb2ePVx5CG2r6Z8poNZ7OxlzW/4ysQL+xScVzpgD9VB7hrv9es5mlv
         YqF0SgQYNAF1rJcscXNmHiozv0+ArixcRkNWjgyLjOX2Azi60tBeC/WNPs52PTTY4wjS
         irCWGDca4pBEeVuRPhGMSLbPaehORo8KNYdxYP6GnqRwql4TtiacbyZbFq5SqwyqIqE1
         wD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726340477; x=1726945277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szRf8lRJKxbqD9O4+nb1t2XKlx3NHKTDlt8GQW7inAc=;
        b=n2ii1gCAarKVOmy+UWtcjlpq+2BBNI1M2dlxinaMa1t21a0aRI6uTt2DFv/VccubdV
         KBYR++fjurr+lV5YOiAkqxdY5t0LVlyYlc0dX0ZlHJg+0C2It5t9zsEKgV4VuOJUddsQ
         ED/AlSkUEfIKmHrBe1rWmSoNRALO0PdicYJn6KIiOabQbkqAHSPf/P54vkqljv7qGxWw
         Qzy1RdJg6ypzSJOiGVymoxEnpO9XJBbbHoiYL45O3H0XuuORvP2w+xBDb/6u3nCi4FBh
         igBDnWMWbYuvGM8xe8TCOTq4qJNChhevIkVOfs9/R0Hp7PDC1xbTC7bSwmg96GWPzzNq
         vq0g==
X-Forwarded-Encrypted: i=1; AJvYcCX3xfIwUZ49nOEVo/DHRcnz3ztJtRPGmrdAObg2C7Y16DiJn6ErC/TahKPTaUOwtHurwebeUMsTZFoGEbf8@vger.kernel.org
X-Gm-Message-State: AOJu0YyuJBhuTA1OhtYrEeVX4twJyYYs7VxgzHW8fJqsLHnbb2fFfcS5
	73sSKZ0VtB7kHSYO9VaSocYgkGqBMyR+gIZMkCw8a6V3ABdo+15e+LlWRMLv9T66/GVS5LXBTIT
	qwMyzDfyvgdrFpGaQAyv6hz1+O5mz38j+oxfREg==
X-Google-Smtp-Source: AGHT+IEyYeRFoGFg+PQZzdMQWmRZS+OsYYPvqZS7eTZ0rRViLSlHvcgnUvYkbOyRGTduKJNxJdxfW0EtWNYfbuIuVIY=
X-Received: by 2002:a05:690c:7404:b0:6d6:3cd6:cddc with SMTP id
 00721157ae682-6dbcc59c056mr52949537b3.45.1726340477171; Sat, 14 Sep 2024
 12:01:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240912092457.1887906-1-dmitry.baryshkov@linaro.org>
 <ZuOnz1QcNZUVYPZZ@hu-bjorande-lv.qualcomm.com> <CAA8EJprNbt1FE-rqL_R+KVyVWHzZekTwfSYnedJYrODFtS6qbQ@mail.gmail.com>
 <ZuRcRVsEI1D7Cg8h@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <ZuRcRVsEI1D7Cg8h@hu-bjorande-lv.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Sep 2024 22:01:06 +0300
Message-ID: <CAA8EJppEWR6pXgucAXAfMrND_87wHRiYg9v3K94M+16XXTZtNA@mail.gmail.com>
Subject: Re: [RFC] Qualcomm RB3 Gen2 WiFi firmware pull
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Doug Anderson <dianders@chromium.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Sept 2024 at 18:37, Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
>
> On Fri, Sep 13, 2024 at 07:12:58AM +0300, Dmitry Baryshkov wrote:
> > On Fri, 13 Sept 2024 at 05:48, Bjorn Andersson
> > <quic_bjorande@quicinc.com> wrote:
> > >
> > > On Thu, Sep 12, 2024 at 12:24:57PM +0300, Dmitry Baryshkov wrote:
> > > > Hello,
> > > >
> > > > I'm planning to send the following pull request to linux-firmware, adding WiFi
> > > > DSP firmware for the RB3 Gen2 board. However before doing that I wanted to
> > > > check if it's fine with all affected maintainers.
> > > >
> > > > Qualcomm RB3 Gen2 board resets if it's used with the existing WCN6750 firmware,
> > > > most likely because of the differences in the TZ setup. This pull request adds
> > > > firmware specific to the qcm6490 / qcs6490 SoC family.
> > > >
> > >
> > > Given that this firmware runs on the SoC, isn't it device specific? Does
> > > it make sense to carry this under ath11k/, when it's expected to have
> > > the same form and distribution as the other remoteproc firmware?
> >
> > This is an interesting question. I think that having all WiFi-related
> > firmware under athNk makes sense. For example wlanmdsp.mbn files are
> > also stored under ath10k/WCN3990/ subdirs.
> > So do q6 and m3 firmware files under ath11k/IPQ*/.
> >
>
> I was under the impression that wlanmdsp.mbn (as being run in a
> protection domain) had lower security/signature requirements than the
> wpss.mbn.
>
> If wpss.mbn is not vendor-signed (in a real product...) then I have no
> concerns with keeping it under ath11k/

I think both are vendor-signed. On Pixel phones wlanmdsp.mbn is signed
with the Google certificates:

Certificate: C=US,STATEORPROVINCENAME=CA,L=Mountain View,O=Google\,
Inc.,OU=Android,CN=PixelRoot,EMAIL=android-cert@google.com
    Certificate: C=US,STATEORPROVINCENAME=CA,L=Mountain
View,OU=Android,O=Google Inc.,CN=Pixel2018CA


>
> > >
> > > >
> > > > @Kalle, I understand that you cannot and won't fully support this firmware set.
> > > > As a preparation to adding these files I moved existing files to the sc7280/
> > > > subdir and pil-squashed them.  It is a generic preference to use a single MBN
> > > > file instead of MDT + Bnn files. The mdt_loader detects the format without
> > > > using the extension, handles the differences internally and doesn't require any
> > > > changes to the driver or to the DT.  Could you please ack such a change?
> > > >
> > >
> > > I much prefer that we switch this to the single-file version, so I'm
> > > onboard with this.
> > >
> > > >
> > > > @Bjorn, @Konrad in the past we have pushed all WPSS / WiFi firmware to ath10k
> > > > and ath11k even if gets executed on the host.  I should have caught this while
> > > > reviewing DT changes.  This branch uses firmware name that isn't compatible
> > > > with the existing DT files.  Would you insist on adding compatibility symlink
> > > > or we'd better fix the DT files?
> > > >
> > >
> > > I think we have a limited user base of sc7280-chrome-common, so we
> > > should be able to fix up the DeviceTree, and avoid the symlink.
> >
> > I think we should keep the ath11k/WCN6750/hw1.0/wpss.mdt symlink,
> > that's fine. I was talking about adding the qcom/qcm6490/wpss.mbn ->
> > ath11k/WCN6750/hw1.0/wpss.mbn and the same for qcs6490 (just for the
> > sake of existing DT files) or it's fine to fix the DT files instead
> > and omit the symlink.
> >
>
> Perhaps I'm mistaken, but does WiFi work on those boards today? I'm
> inclined to just have us fix up the DT and avoid sprinkling the symlinks
> all over the place.
>
>
> I guess this shows that I need to start holding back on future
> firmware-name entries until the linux-firmware structure is known.

Maybe just for the cases where we don't have established practice.




--
With best wishes
Dmitry

