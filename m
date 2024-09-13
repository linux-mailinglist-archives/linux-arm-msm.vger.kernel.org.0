Return-Path: <linux-arm-msm+bounces-31763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 976359785AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 18:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DDE11F24D6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 16:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594C15644E;
	Fri, 13 Sep 2024 16:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GdKD+pc8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC84852F62
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2024 16:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726244622; cv=none; b=H2w2HZ0epSRP1HKLA2J8rcU90mp4BUGKTg2AKd2Ih6SqHDpocsFid6Xks9LADfpz1rorqwClz8SOfx0vnYoSbzGVmJFRTK3W/RVp+TZj0G/H2s7XShglMXuYN17qeo7L2OSGGdlruNLX5gXOLgP6BzpzgYNznZFMdxli4wHHSXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726244622; c=relaxed/simple;
	bh=CSPBqxfop0vKlwZoZSNBFsPOfmpObWndV9PqKAstImo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rx3RU17auUSQySGzOeC4zWtyNyOi7bxoag9jpFkFccVxeWvrhvkjHmXRSAeA0D7ysRO1SYWyu53IKwkFZKJYy1dXBzf6avQZgHz7NoiDoqWyile0F2OlivQwEd4gUL+zOogaecDRA46RGxTrIMV4oEFJqV4XJEfIuWRmP9PGqw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GdKD+pc8; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4582a0b438aso18250011cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2024 09:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726244618; x=1726849418; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0ue1UIXLhYSPozfX3gRLbEnC77zpspRA67c7dICmis=;
        b=GdKD+pc8ioqELvq+XJWX1ZfzEq8YM33fR46nXCTNo/NIx/a7uwOIJAadc49EqQgrCT
         hqfXuN+zHcnsotmw9J53Uvq3EK3/G/zje1E4b6c3OKYloWN4D7lGxtZPgRbsrF/bH2k/
         FKPn6f0mBkshQ1GodQ9Y3MgdCiMwLnaMEw/KM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726244618; x=1726849418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0ue1UIXLhYSPozfX3gRLbEnC77zpspRA67c7dICmis=;
        b=uMbw8+W7lFj1MwREB3jYwEEGF2pilrE4FEkdUbCAC8BIztAwla5fhhFGQ5FV+iRht2
         iI9+vEoPEUO0H6+AtIeD31mv8MW4ckrlHVrhBJ8Ql+KIYGrBKS8vUKggGLHUtoZdhkUq
         f6wiGee5iDLAvZ2Y9Euo7fNhxXN8xzrbJEsc+hY5AxJAM3PDVF9mPPOpO8Ld6j8Reiwx
         UuBhHUtkhq4F1W8rhFUCoUBo+HZxf2SeUEguZCOsoOGAsj1x7gTUKzzu5EsdSISHmRV+
         yFBfoTJUA3yxBai74cvWARFIGmG3xUXiz24wn+CWQdGfsEuiat/YTbRd9JyGdY9jlID/
         dP4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUn5mDSVxWFxzPPY8CRM0T3wXpzUCCPSIlKXpVRcCri34ePCv/udqgWBBdqS/THVyTeIST7nyhOXnebGLrz@vger.kernel.org
X-Gm-Message-State: AOJu0YzFu5QNYfkbPBR5DUM5Y7g3BrgpztibvrK4TzEfx/EwkTF1nBAb
	QsXsi+gFlv/fCt/Kg1+fPc5Rms1oe3HPAnyRzHSjsC2/z80eGLpsLB65BY1OD1rD79UAQWdMM2A
	=
X-Google-Smtp-Source: AGHT+IFpHsArDTHKDZbo5YJbrpz2NiMygmbwHCf4hw6zR8PxHTs056VuSV3BGO7h4NdSVeIUwQRRZg==
X-Received: by 2002:ac8:5f87:0:b0:453:5f05:2ba3 with SMTP id d75a77b69052e-458602bb10emr130146671cf.8.1726244618226;
        Fri, 13 Sep 2024 09:23:38 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45822d435cfsm66812371cf.0.2024.09.13.09.23.37
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 09:23:37 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6c35357cdacso15610756d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2024 09:23:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXBAOuKienXDPWLpuQYIi8O5X56ZWstK18NhrNQuyZhHZUoCOOlW1aWHhy3lL9CFU7dDbjLWjSjs939FO9t@vger.kernel.org
X-Received: by 2002:a05:6214:4197:b0:6c3:5ebb:9526 with SMTP id
 6a1803df08f44-6c573582959mr90511496d6.29.1726244616451; Fri, 13 Sep 2024
 09:23:36 -0700 (PDT)
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
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 13 Sep 2024 09:23:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WJWy7mVvnhB5HWwJWBLfA9UjyPpA1FSybVs8QDmXBFhg@mail.gmail.com>
Message-ID: <CAD=FV=WJWy7mVvnhB5HWwJWBLfA9UjyPpA1FSybVs8QDmXBFhg@mail.gmail.com>
Subject: Re: [RFC] Qualcomm RB3 Gen2 WiFi firmware pull
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 13, 2024 at 8:37=E2=80=AFAM Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
>
> > > > @Bjorn, @Konrad in the past we have pushed all WPSS / WiFi firmware=
 to ath10k
> > > > and ath11k even if gets executed on the host.  I should have caught=
 this while
> > > > reviewing DT changes.  This branch uses firmware name that isn't co=
mpatible
> > > > with the existing DT files.  Would you insist on adding compatibili=
ty symlink
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
>
> > >
> > > But I'd prefer Doug's ack on that.

As far as I know you can count the number of users of sc7280 Chrome
taking your shoes off. It might just be Abhniav and Jessica at
Qualcomm. I think they do care about WiFi but they could probably
handle a device tree fixup as long as you let them know. Certainly
there aren't any devices in the field.

-Doug

