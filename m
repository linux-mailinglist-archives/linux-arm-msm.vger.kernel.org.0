Return-Path: <linux-arm-msm+bounces-24018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 927FD915682
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 20:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C459E1C21909
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 18:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7679C19F48B;
	Mon, 24 Jun 2024 18:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pm3rRqf8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01DE182B2
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 18:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719253783; cv=none; b=QO0NfHoQ415XwhA3iXAlNADvDTQ1IUlJZY8sW6i7q7aHDylylV4DDA3Tk8Q5adgKb8kon/cuwMtM74QpY02g99s6dpyLL9C79rlFzQfw4vA4MvtdRrRtJKx96yo4zb8skFZE3QtH81g2Tz9dkpfnvQM4IM3VqO3b2A694MQaXZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719253783; c=relaxed/simple;
	bh=Qgn2Wkdy6QwalA/3YDmWgCQfvk4VPbRwD7ut8BFk39g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mdC0mPM7jGmYmjslMChac4W6XgL+aVBTaOcI2p44KVhE0gbgzb/udK+mIp4VEri0A1YYJ8nAwM2sSqjNrwqkc4EDmyDBgSeRWGnbsDytDE/pM/TgMdY3gbehWD5MUEXFjQROevU9HUQ23Loh7GWwSt6r1IiMXH5308mIwgFxoNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pm3rRqf8; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dff26b612a9so4018261276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 11:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719253781; x=1719858581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LhXqZUvyqszLAu7XlxiAnvME4lRodnY/xefXRaxr4MQ=;
        b=pm3rRqf8A+yZEgjA0uk85jFvvFBP3Cx4A8aebjzi1CaYLN7WTSqZD7x8tdh/H53ozP
         xVtOGGzxHX6aODjcqlMNEVmMxL1066FhD1vVGea0AE99OiKqITQ6yMu+Wf1ekV+se3dR
         at5N1lg5P7QdgwbhHJMweV5NIHes0GuhBfmaaG7iqWKGXEuefnjAfUMHNSQ7/DHluBFq
         OGAt43f+XVKlMyDU5xozwRvYo69ivkXxn9NXpce64EqA1W5a6XxcX7Xub7itdR9zWa4g
         KtoeYxQvpInr1e4vsFF0TVuAp4e7EnH955fvtrPqryhYaYOXuZAX29iSkgwoWQvMcSPb
         DuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719253781; x=1719858581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LhXqZUvyqszLAu7XlxiAnvME4lRodnY/xefXRaxr4MQ=;
        b=xTmdXIJP272MzZGmb3hj9gnRoLZa0Hz0nHQ4CsQz/FoYaHhVYrfbvo0QEk0ky2PVEE
         eRsSPYgE1HXLGJNur61JOHTEcRZmyd4ZiRb+oZtavoGfWop/B02Zq2BGSNIsB+iaeXvY
         wF0UJgiftfHE4yiFu2k2ycDBSmZdv5YCCH5n8hUThyXjf8wHTtwWLIhxlHG7cYCjzD+W
         wLZXzT+9u4QKuCH4lj8aGLfrd8zCza5J0QTaWIlnk+BPZGaMSN/tjrutoziqCvhZmpEd
         pjkvcA2a8XjcWnVFoJr4LOIt5mbL3SqVCi15bLhNLWeGFW6ZnJQJ7MKTKORNs9z7SvCe
         dT/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHSzshCp3wuLZD0wnsYiXae0QoDOcOaYRdAYb8ynSMzP6Ili/h4+iZNmzbpbdq+DI3ppT6SZ0cMS/rTuz7pi8Cs3zDo7vTHZ5gDk3WaQ==
X-Gm-Message-State: AOJu0Yxcpt8VBGYgwcJkTHZM+r+KdL+GLUCHnwr+aY+nmBg48XnOJ1yd
	tG/2UIoTXiLsD6uyzD8qYL7pR1ntpI1DkEHOTEVrUWl1K7pA3E5mMcRz4x17mqw6JJdECwDHA/h
	LATMt+RAJoAvA6WQaDWTRb43ATLDnDX4RhZi4tQ==
X-Google-Smtp-Source: AGHT+IGRR45bMY/Dfxg34mvEMoB8iP9e/vkOf8+sAlGSMAuUXK5p2yj3dI4Hui4b9KGao2e70E2PefnNyNhV2mnho0c=
X-Received: by 2002:a25:d805:0:b0:e02:c7c9:732d with SMTP id
 3f1490d57ef6-e0303fea29amr4282913276.60.1719253780908; Mon, 24 Jun 2024
 11:29:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <64ec16b9-c680-408c-b547-5debae2f7f87@freebox.fr>
 <dkmtnizbuyswyvocczjfgmhsuedawliabycig4urw42a65hu3j@jglxzumuzamd>
 <a9e4dba6-2317-4b6f-968f-d607937f5157@freebox.fr> <CAF6AEGtvHzF-KNyMwmysz7idLYE7XuXhDnBLdQFFhEdgYo6oqQ@mail.gmail.com>
 <CAA8EJpqCmu+TPmdCxwa84s+15inmdi6SeR5XQRVey56RKqdRuQ@mail.gmail.com>
 <717ee43e-41f5-4940-b404-c348812c84c9@linaro.org> <D25HTBIFDM42.2W1WGS8HKTHTF@fairphone.com>
 <CAF6AEGvwCXj7=_A=f+A_G9k=1LSSjcrsHB0GN83Z2OKg0eWjMA@mail.gmail.com>
In-Reply-To: <CAF6AEGvwCXj7=_A=f+A_G9k=1LSSjcrsHB0GN83Z2OKg0eWjMA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 21:29:29 +0300
Message-ID: <CAA8EJpquKb0r=ZDABU0F+PGR1PKNTiKELbGe1-4Wd2pVEzVUNg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: log iommu init failure
To: Rob Clark <robdclark@gmail.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Marc Gonzalez <mgonzalez@freebox.fr>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, MSM <linux-arm-msm@vger.kernel.org>, 
	freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>, 
	Bryan O Donoghue <bryan.odonoghue@linaro.org>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
	Arnaud Vrac <avrac@freebox.fr>, Bjorn Andersson <andersson@kernel.org>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 24 Jun 2024 at 20:59, Rob Clark <robdclark@gmail.com> wrote:
>
> On Thu, Jun 20, 2024 at 11:48=E2=80=AFPM Luca Weiss <luca.weiss@fairphone=
.com> wrote:
> >
> > On Fri Jun 21, 2024 at 12:47 AM CEST, Konrad Dybcio wrote:
> > >
> > >
> > > On 6/20/24 20:24, Dmitry Baryshkov wrote:
> > > > On Thu, 20 Jun 2024 at 20:32, Rob Clark <robdclark@gmail.com> wrote=
:
> > > >>
> > > >> On Thu, May 30, 2024 at 2:48=E2=80=AFAM Marc Gonzalez <mgonzalez@f=
reebox.fr> wrote:
> > > >>>
> > > >>> On 16/05/2024 10:43, Marijn Suijten wrote:
> > > >>>
> > > >>>> On 2024-05-15 17:09:02, Marc Gonzalez wrote:
> > > >>>>
> > > >>>>> When create_address_space() fails (e.g. when smmu node is disab=
led)
> > > >>
> > > >> Note that smmu support is going to become a hard dependency with t=
he
> > > >> drm_gpuvm/VM_BIND conversion.. which I think means we should never=
 get
> > > >> far enough to hit this error path..
> > > >
> > > > Does that mean that we will lose GPU support on  MSM8974?
>
> And display support as well :-/
>
> Note that GPU should be disabled by default without smmu.. you can
> override with modparam, but please don't.  It is incredibly insecure,
> you might as well make /dev/mem world readable/writeable.
>
> Is simplefb an option on 8974 or 8226 to keep display support?

Not in a longer term, I still hope to push HDMI PHY/PLL support for
MSM8974, which means dynamic resolution support.

>
> BR,
> -R
>
> > >
> > > Yeah, that was brought up on #freedreno some time ago
> >
> > Also on MSM8226 which I also care about...
> >
> > Anyone at all knowledgable on IOMMU would be very welcome to help out
> > with IOMMU support on these two platforms (and anything else that
> > old?) in any case, since me and some other people have looked at this
> > (on and off) for years but haven't gotten to any stable or usable point
> > unfortunately.
> >
> > Regards
> > Luca
> >
> > >
> > > Konrad
> >



--=20
With best wishes
Dmitry

