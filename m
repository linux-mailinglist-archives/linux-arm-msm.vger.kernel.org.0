Return-Path: <linux-arm-msm+bounces-89416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 78970D32DCE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 15:50:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD54C30A9A51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 14:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07435346E4E;
	Fri, 16 Jan 2026 14:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rxm/VcE3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917D039341F
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 14:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768574554; cv=none; b=undNMU7QgwtA9hYBNNxRujH2v+hAp3hg89TOGvR7/lVaoMNk+/dJN13Dp5Dn7jHci8IKlL1VibVBrzagaq6Xu6J3x+s1XXiJeUaUvDaH+tNXKwSwndTTXQMZP2mJjXNIhgzHIHBlgKsgddMp4ciarcRBK/OdKSvYYlULuqiIwds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768574554; c=relaxed/simple;
	bh=KX2IErmnbLgLJTuS0TqC6Ce02SpKwHVKEysgCsr18GE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XVrFjuWUSzLpCNC0DlZpY3iQWhgR/D8jQLj0NP/i/RKxIirhkFlTuK00oZWb7Su1ckzqDOJeVHD6wE8E3FXNlsPw6gvD314UFPN85L6WqHQxiueYZM6FdP61zMVCiJaT2xhcOJqWn8X1vGY28aZkenx8iKk+Fy7OOJlP3pMI9r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rxm/VcE3; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78e6dc6d6d7so21674847b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 06:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768574552; x=1769179352; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0Wu6AiQkkS9+nilzgzJB3rMYTbS0yo7XGq1n41xVt8=;
        b=Rxm/VcE32t8SMJh3xjpZeY8t3pVt4CmxUbjEl9LWH+rgZso13cQ4bCS/kVpVtLkxRX
         yZu9GEelMDIa2tDnC8ycKTSELBaHkpwR8hQc8EpGiL7nbAJvCZy9z3tMFVnLdN71Fuo+
         q1euxx3NAmv0hvfssy6YGSuQh4KAz1Mu+JlIKR30bMhkUUXAJvWfdOVdulfQCcgITKD9
         M1Nc4bX4RnSvlcgk2OdktrtHUmKb75SNVnEhBNzLJz9s5+bTLvB0SK0Cqt4CGC1sYFr6
         ZiFoeRkR+ywalXaRESedd8XycHDuK89wOJYd+z5M1mPtkSUOao/TkO7AHw3zZu53oYpQ
         eB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768574552; x=1769179352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y0Wu6AiQkkS9+nilzgzJB3rMYTbS0yo7XGq1n41xVt8=;
        b=bNYFKyFgahnXD4hH3jCA/mKhghSR5fNwLMj+eoYptUadEA/Z9ubp8URT2AK/ll+Vz3
         b2aUe9Jx7KHnLq2yimXSRpKjA4QM2hQ/ftuULuB/OF6mx2Annxm/AbfXmhQ+eDYhEAMF
         es70rjP7OfTXPF4HYScDuAOkWNYZYtEYYzNbDs76sqGmehU3xwhJrGnYh+bi4q83zgYf
         59lV4QTAZCAzYOMqAMT94gd3Ot0zaB/5o3WdsIR+qoa7JvrZkN7Bey9JcXUW2dEAagVa
         xUUrciZlIF/wj2IC/TFel/YTQ6NyLM744osljoO69OS2hCJ0rl8AdsdF/5oBLNuLRpK4
         EU4g==
X-Forwarded-Encrypted: i=1; AJvYcCU0yuI1QEtoYNrjAk83HBMIEJLfXawsYc5HxndOniin8LrSoeKlkDbnB6qVWV15ncGb1IMuJvWzk49MRCZ7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Zj1ZHNdC2HAyEwJU0Vq8xArUxfq7T/uxEowDuq7P/lyjNPm7
	/gfSx1sk1r72dPriuvKQBOg3rbrR1YRkp14iy2PRjjGIP4ST13QsAoCPe6Fq5U5QEdFDqvQ38xK
	my/smrARvVTHgLavTpyofYBEadlg8iJE=
X-Gm-Gg: AY/fxX6ktpAsHRT0joi2Q/a6sU+oclllhG7sb6iv2A136fbpAeO7PySkCKslgmkpwuO
	dkxN5k+zeBTxjpUd1Gj6OuYuGjmDQC3LrNZIZXQhDPenLhkuHGyMuCgIgZl/eUk1e3s3KhLfVZB
	2wnTf1xOrtsBqAK6ONrosBmCLKuBk7gkT6GynIFkHhtellbOs/T+Yvl1OgN9debShj9JbUaGSEG
	qF96CLD59wBiwwRymgQMsH3hd9XZnbDqw8Edyv7HGR15CF/+AkNEDJawA3NWFDuuNsVA1snYnFc
	Ork/OpYlYqv29RrAV6UHrDUcDNuFw4s+wsvfb5nKkJ+4CYBf8FiW7rXaVuoQq67kXH4I
X-Received: by 2002:a05:690c:6609:b0:792:7828:b709 with SMTP id
 00721157ae682-793c66f4bd6mr24042237b3.22.1768574551609; Fri, 16 Jan 2026
 06:42:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107033924.3707495-1-quic_shuaz@quicinc.com>
 <CAMRc=Mce4KU_zWzbmM=gNzHi4XOGQWdA_MTPBRt15GfnSX5Crg@mail.gmail.com>
 <212ec89d-0acd-4759-a793-3f25a5fbe778@oss.qualcomm.com> <CAMRc=MdoUvcMrMga6nNYt8d-o8P-r3M_xY_JHznP3ffmZv8vkQ@mail.gmail.com>
 <96472b7c-9288-4f81-9673-d91376189a18@oss.qualcomm.com>
In-Reply-To: <96472b7c-9288-4f81-9673-d91376189a18@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 16 Jan 2026 09:42:20 -0500
X-Gm-Features: AZwV_QhPiDz6MueN4sUXp8m2kkBxLdWM5NMAxLszIhWWEfsuGtFDaz5gEkCX6YU
Message-ID: <CABBYNZ+5ry0FWFSgOskw60jja9mE6WG5AwOi2pKxrkzqMn9bkQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Fix SSR unable to wake up bug
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Shuai Zhang <quic_shuaz@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shuai,

On Fri, Jan 16, 2026 at 4:48=E2=80=AFAM Shuai Zhang
<shuai.zhang@oss.qualcomm.com> wrote:
>
> Hi Luiz, Marcel
>
> On 1/16/2026 5:20 PM, Bartosz Golaszewski wrote:
> > On Fri, Jan 16, 2026 at 9:37=E2=80=AFAM Shuai Zhang
> > <shuai.zhang@oss.qualcomm.com> wrote:
> >> Hi Bartosz
> >>
> >> On 11/7/2025 11:37 PM, Bartosz Golaszewski wrote:
> >>> On Fri, 7 Nov 2025 04:39:22 +0100, Shuai Zhang <quic_shuaz@quicinc.co=
m> said:
> >>>> This patch series fixes delayed hw_error handling during SSR.
> >>>>
> >>>> Patch 1 adds a wakeup to ensure hw_error is processed promptly after=
 coredump collection.
> >>>> Patch 2 corrects the timeout unit from jiffies to ms.
> >>>>
> >>>> Changes v3:
> >>>> - patch2 add Fixes tag
> >>>> - Link to v2
> >>>>     https://lore.kernel.org/all/20251106140103.1406081-1-quic_shuaz@=
quicinc.com/
> >>>>
> >>>> Changes v2:
> >>>> - Split timeout conversion into a separate patch.
> >>>> - Clarified commit messages and added test case description.
> >>>> - Link to v1
> >>>>     https://lore.kernel.org/all/20251104112601.2670019-1-quic_shuaz@=
quicinc.com/
> >>>>
> >>>> Shuai Zhang (2):
> >>>>     Bluetooth: qca: Fix delayed hw_error handling due to missing wak=
eup
> >>>>       during SSR
> >>>>     Bluetooth: hci_qca: Convert timeout from jiffies to ms
> >>>>
> >>>>    drivers/bluetooth/hci_qca.c | 6 +++---
> >>>>    1 file changed, 3 insertions(+), 3 deletions(-)
> >>>>
> >>>> --
> >>> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>    Just a gentle ping. This patch series has been Acked but I haven=E2=
=80=99t
> >> seen it picked up by linux-next.
> >>
> >> Do you need anything else from me?
> > I don't pick up bluetooth patches, Luiz or Marcel do.
> >
> > Thanks,
> > Bartosz
>
> Could you please help clarify this?

There were no Fixes: or Cc: Stable in your changes to indicate they
need to be applied to the currently RC and stable trees, in which case
it will only be merged to next-next at a later stage.

If that is not correct then lets us know if that needs either a Fixes
or stable tag so I can send a pull request immediately.

>
> Thanks=EF=BC=8C
>
> Shuai
>


--=20
Luiz Augusto von Dentz

