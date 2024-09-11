Return-Path: <linux-arm-msm+bounces-31533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA10975AFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 21:44:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 964261F219F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 19:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98BB11B86C7;
	Wed, 11 Sep 2024 19:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oPUhtJgW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5A91885A8
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 19:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726083895; cv=none; b=F2Y0rqCnhEuwQEoxgo2VzXhaaZODu5Bmf1mQnflBo50XZY0syRv7ZkzqIXqtug3GoMs6reeXeUxRicR2FrdTzpwBHn95hpAdZAj09FzWcqxdbUsWM1ceD1EjwdgWEzQSLXq3QinISxeOWVZskckGZKh03kyFoVSgsx0qPHEMa4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726083895; c=relaxed/simple;
	bh=iX2/6uqDcu3Mpbov1GZGhyrk+ldXJe7rjOmo7wN9xJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rurKlh5r7or3BbJi3jdvDOD7zqfvqeB0qugJovtl4H6Vw/duC6Unu8Q/BnDXEBSV5jXw0xi4xqS+v/xqIHqmxcZhFbrPU5Ki966wlcYE6BVN43bYYxuy3yqVrpEP8zSlFzFhcmXwm8JB5GpLdQG4qxHSBYc0lvMyaLbcRvjxZgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oPUhtJgW; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5356bb55224so227298e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 12:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1726083891; x=1726688691; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iX2/6uqDcu3Mpbov1GZGhyrk+ldXJe7rjOmo7wN9xJE=;
        b=oPUhtJgW72DFsvcxfq6qTOPY0jHHEWS8f4ks64qhgoJ8lMlHAVswyCnKjUn4c/igfT
         5feHCXzYY/6BeLRQdevNMao+CQQZ/bEsKKZomZRSEQB01NWSIbQNvDaHU3zLMg7M5yzp
         QhKj0PST/jScP0IZQl/HnEKsx//2x/vbzjM+dUIAr4JFzn4QkQjKpVdjxXLxai/2Dqu6
         So1kabDRZIUUb8hCRYccTu5ORC7IIdSrzd2YlGquSHk4UhuWqDJZRRYUibNjwUIiTAWD
         vk0zh6Zv0LdPtEFEWuWpvo46o1hcaT932+rBGyiXhGqDD0L3vXr0zVa8jykQjYRxVmaV
         8Mqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726083891; x=1726688691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iX2/6uqDcu3Mpbov1GZGhyrk+ldXJe7rjOmo7wN9xJE=;
        b=crZLcZ08rTKSikp2nmEMBg3OmBatCjrc+/haxVQgdrAyHeqdJOiCQqmx0YwpS2W7wR
         ri6vV10CyHWg4+wAfSSOzdlW4QiWywXDVjsVKs6wmMksegUpqI6k61Sk14+uiMG0K7RZ
         f8YS2QUZUBhbTfSxWiTbo4Z4HotRQekVxLnK4s5bf9LCmMU1eCwwoVpqONXcEvYEeSIJ
         xVOvwhSDL8AdDSusOGzKflRIP+QaYCIyhdrtTVoArbvtvkyLq9Ozm8UNuC3uq4j70k3g
         o/hxE6xh306Snaswc+AlcyLW4bFDfKRN280CWAUHTBjCe0emQIqHvEaqmiL7SAHa3UtO
         3FzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlm88kNdpukPeWxiaRbqPbCY6vavBrBSa280+AH1a1aXnXdRTBgkSIp0UXox/0arqp1lMmHRtKjE5yMPiv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Y6cdcIj3SwZxYvIDpziaYFtSEoHKaVmKdkmpmlDopN6wTyn+
	QNiqo/olEeNR2pyCK7i+L+mvmBit9Mj/wQZauQ7cSWre9tD05XIJBG65Co/mfmYWhKlb1sM3bTA
	Oh3PjQb8w8TVj4OezQCcytZhzU/Qwi1CFcoVBvg==
X-Google-Smtp-Source: AGHT+IHJe7IBf1mnGcxNjZMLDWuTxex6Xp388Wa37v4XPXlkFAFCtyeaIqHtO6tuKDzt+nOMAZu2BIytbGtgjmmufEg=
X-Received: by 2002:a05:6512:224f:b0:52f:c13f:23d2 with SMTP id
 2adb3069b0e04-53678fbf051mr343572e87.25.1726083890589; Wed, 11 Sep 2024
 12:44:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909-tzmem-null-ptr-v1-0-96526c421bac@linaro.org>
 <20240909-tzmem-null-ptr-v1-2-96526c421bac@linaro.org> <20240909131842193-0700.eberman@hu-eberman-lv.qualcomm.com>
 <CAA8EJpqSKbKJ=y0LAigGdj7_uk+5mezDgnzV5XEzwbxRJgpN1w@mail.gmail.com>
 <CAMRc=MefTjz=h6jzE5vE-yaHnyM601Ts8XYZqEYnOsidfQEavA@mail.gmail.com> <8d9fde52-2582-499f-a971-e9aa46b23fa2@gmail.com>
In-Reply-To: <8d9fde52-2582-499f-a971-e9aa46b23fa2@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Sep 2024 21:44:39 +0200
Message-ID: <CAMRc=Mf110U72BtFT7ewQhB_+-Da1NNZ0kNNQOA2dx9QQ2-iHg@mail.gmail.com>
Subject: Re: [PATCH 2/2] firmware: qcom: scm: fall back to kcalloc() for no
 SCM device bound
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Elliot Berman <quic_eberman@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Andrew Halaney <ahalaney@redhat.com>, 
	"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 8:01=E2=80=AFPM Rudraksha Gupta <guptarud@gmail.com=
> wrote:
>
> > I'm wondering about how to approach an eventual refactoring and I'm
> > thinking that for platforms that are known to have DTs out there
> > without the node, we could exceptionally instantiate the SCM device
> > when the module is loaded? And then modify the driver to require the
> > provider to have an actual struct device attached.
>
>
> I'm happy to help test these changes if you'd like!
>

Thanks! In any case, this series should still be merged to not break
existing users (even if the kcalloc() fallback will be removed once we
do the refactoring).

Bart

