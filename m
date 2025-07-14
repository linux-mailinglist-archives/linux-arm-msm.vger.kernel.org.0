Return-Path: <linux-arm-msm+bounces-64870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 317A4B04820
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 21:56:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BC794A298B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 19:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0398C232379;
	Mon, 14 Jul 2025 19:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KWxzTZ29"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F3D58210
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 19:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752522992; cv=none; b=pfGhZpcd7jchgngnpXcs+qxJjNHly19DH0WL7Z5aEbENDpnbuURMSMjdgS3NnlLa8O67gwryiCxV5JxGZbmCL7Ey//EhpIR8Zf6Y0jzXkysoQMC+3Zsvz8FoJqzxYW/tWN41HBtxkTIGr3CjJMIc+P7dxQobxhUxOkn44D1GRa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752522992; c=relaxed/simple;
	bh=fsY0jmWeabMaOs7WYAbvvKt/bg2MxbBb0lqnAAU/TKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FEi1wMDhw/Ud6FkVAM61KYYXC3WBvo9GNmp7t5BwotvQHv3iEN+NgKEOUO5VOjnPpVbAcbrjInejpCRjlO8UgudPgenAcP4Xlk0fNqMiINUOdiryBOAhHwVMnfm20f6kze6ER/xqXxyE+RCXumKpwtdeYAX2DYERpFjf9zUAz+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KWxzTZ29; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23508d30142so49503865ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 12:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752522986; x=1753127786; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e05D0/DQz0T/VtfT27OBXGtPxndXar2Bry+kzVT5CP4=;
        b=KWxzTZ29ftXFohsr//Jcfc2gTJ24FmBIu73DsJeXwOg5UNNcnhnpQK8Vn9wOOwwLMS
         ok2IDXFxUu1yfSb231yjXC559lnnu+bbBzdy3dimPZhst5imwW1h+i2mUiJLW6MCYuUv
         5zK9uMierXYtJj4K2bkEsub27RIWgJewwQkMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752522986; x=1753127786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e05D0/DQz0T/VtfT27OBXGtPxndXar2Bry+kzVT5CP4=;
        b=JlNtBIq0Zlu+dXJnmvXhzL2zDe45I4lX7lJ/INsnmJYTsip9XBzAgolDk3isZkmW+d
         ELASoDj7gT2EVVtcbFQ7npO9UNWs0vL4ET7n8px7GM6ypEHT12ZyGO4PQw6KxGM0f5hH
         8cVt3cal+2DJOw3jPap/lXiuSrWX09cvqewEibYo0bw/317EfDsO41AcA08FWA1votlO
         7WWZqjGt8/ldvtFMxUx6VeSyxkNLYyVZ+Vk/qUiNWtcfVBEK9cHEB6jttQP4/PmeIgU0
         qm7Xre7XLmgGrdg/povqITN+i9eDQJ4a8lZra3UrnMYFYVwTxOZk2trS0X+JiqPb3f90
         jlUg==
X-Forwarded-Encrypted: i=1; AJvYcCVeFDUGSV5mvQG0mxaxTjU8zT4Ch91b8wQL17UQ1okoUDPQmuy3I1pjksJqYscV0SlbR9K1hwSvw07ceHbl@vger.kernel.org
X-Gm-Message-State: AOJu0YwPt5auj/Ipfa+hlXwD/2SNppjiTM8aCkhXL7O+xKBh0eUBPJeL
	2OqCfW45xg7inPIsVy+h+ERkcHgp6PJir44MgjZLFSAg4yGEtFzE8X2JaeRWG+ZCemObpXHF4Gb
	/ijU=
X-Gm-Gg: ASbGnctMP4+UmsqvWwEwUpIVnuowu7Vc5ABz/23+FA8sa8Toybyb69LodoRG+jU2Upo
	8qCmoJ9MoSQBfC2e/EtOCOfi7TdOOzjU7p27bCDKUY0EqX7IAR54dsPBtXTgPTZE2kv7WZ//S2E
	C2Yno941u6KjWB1p/BkxeTpyWkq8kCNvo8WiET0WGc2PGStGY2DN9DIfJ+nnLrk3wSgNn/WEpkR
	wAhgNprEa6U0kaxKN88IYts6FtrDVKAlygmPGUM7ST+UKqHa8KJXTGITOqOxQXgyFFjRN62uZEh
	N6PRKyfJm336qlhOhv+Toau/fOYnF0Po/25Lw2WxC/fUXc0zfNYQqe+kZG7yW/v51dz95W3uFxA
	/ni0FBJDf8bwgig4/i9Gzi8yi91vkKMHOuG3iZLB8h37uEgI9eEz0nn54HI/IEg==
X-Google-Smtp-Source: AGHT+IEzUYcCNKIyQcT2PTstjFwgQfl7jbYZ18bpnHTeXdUob0M4vqmwIUpnke+vrkJateEMaZwr4Q==
X-Received: by 2002:a17:902:ce8b:b0:23d:d9ae:3b56 with SMTP id d9443c01a7336-23dede55e7cmr249686875ad.22.1752522985834;
        Mon, 14 Jul 2025 12:56:25 -0700 (PDT)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com. [209.85.216.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4322e92sm102741315ad.128.2025.07.14.12.56.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 12:56:21 -0700 (PDT)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3137c20213cso4500499a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 12:56:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWlD9L3KKl4PBKKOQq+EORqStEia35B+YD01bV2vwr+rQXlLn9rjs4jScpHAj2bFcEI0IpdyOBcyH6N1PI+@vger.kernel.org
X-Received: by 2002:a17:90b:1b0c:b0:312:f88d:260b with SMTP id
 98e67ed59e1d1-31c4ca8484dmr22759292a91.14.1752522980950; Mon, 14 Jul 2025
 12:56:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
 <92314f06-e6a8-4882-a31c-914438d7761d@oss.qualcomm.com> <CACSVV01AUOp7vZ7kLt+gwxvfv4CYLtAQg6MhUccygbi1NpVJMg@mail.gmail.com>
 <aaaa42ed-989e-43ee-8d45-2908f52e8584@oss.qualcomm.com> <d323ceed-19e2-4b17-b97e-0833f132be16@oss.qualcomm.com>
In-Reply-To: <d323ceed-19e2-4b17-b97e-0833f132be16@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Jul 2025 12:56:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VV_xvcWwdpi88wSYWXyftUP5eP-SQVkgEBRQgfwDN+zg@mail.gmail.com>
X-Gm-Features: Ac12FXxRHKFdz1WEnIQ737ze8ocdQTtdcG6dsifTSijome0hozAkI0iK1xwhErU
Message-ID: <CAD=FV=VV_xvcWwdpi88wSYWXyftUP5eP-SQVkgEBRQgfwDN+zg@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: Remove sdm845/cheza jobs
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, rob.clark@oss.qualcomm.com, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	Helen Koike <helen.fornazier@gmail.com>, Vignesh Raman <vignesh.raman@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 30, 2025 at 9:15=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> On 6/30/2025 9:26 PM, Konrad Dybcio wrote:
> >
> >
> > On 30-Jun-25 15:46, Rob Clark wrote:
> >> On Mon, Jun 30, 2025 at 3:34=E2=80=AFAM Konrad Dybcio
> >> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>
> >>>
> >>>
> >>> On 29-Jun-25 15:58, Rob Clark wrote:
> >>>> These runners are no more.  So remove the jobs.
> >>>>
> >>>> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> >>>> ---
> >>>
> >>> Do we have anyone using cheza at all anymore then?
> >>
> >> Probably not
> >
> > Adding +Doug +Akhil +Jessica, if we don't have any users, we may
> > get rid of it upstream, as it never made it to the outside-outside
> > world..
> >
> > Konrad
>
> I am not aware of anyone using Cheza boards within Qcom. So it is fine
> with me if you plan to remove the DT bits.

As far as I'm aware, anyone at Google who had a cheza gave it to Rob
to put in his lab. If Rob says nobody is using it then I'm 99.9%
certain that nobody at Google is using it anymore. There were a very
small number of external developers who were given a cheza prototype
but I can't quite imagine any of them still using it.

-Doug

