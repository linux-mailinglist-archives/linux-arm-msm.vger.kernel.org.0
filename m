Return-Path: <linux-arm-msm+bounces-59926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9528EAC95E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 21:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1E9FA42D3C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 19:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EABD720E330;
	Fri, 30 May 2025 19:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NkPsHNvm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577D4BE5E;
	Fri, 30 May 2025 19:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748631812; cv=none; b=O8M/8j9+NEh8YhCWw6W7dW5pPCqJinXQZ5J9QX6gEBoQyYrIYNR2AW2yFi4mwmDunzpEFQDIk7pG6d1Igw2ySdzTK/DDZ3/0p8EHchBXT22UjOjKdeX+fmJJOLpQyLeUsi9y1QIYHUXMUYu9tDubJKJz2rTjAVu3/BLV/nn7BJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748631812; c=relaxed/simple;
	bh=4vbQ5jCAW+jtK9mrlFfnJQg4whCgQlT1OkkWoaglvgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P4XNxSpohyvBk+uPwpmKzrzNkg3uvzPwfUQTfAjJ3KVhPbRA3/usOm8Zp4v8NLzFbAM48uJ84s2CK3YP+UUwwm6hEK5YnLWazNbOhavJwYFfsEhNLmbkc2uXkps9itQLRn0c3Q4Ad06kfenJtDU4bsO5xhAFSETwPzYNTGb2YXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NkPsHNvm; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3dd7553c7e3so7592995ab.3;
        Fri, 30 May 2025 12:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748631810; x=1749236610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWbYSIdO62OOJiQnecBL9sTo7G5vpYkrti7/TBlHzU8=;
        b=NkPsHNvmx6/16LPpfho26rTeaOI55PbRkTxfxtNI5hLji1i+3dLpW5TkIimanlY9aY
         XeXeYcUmFPN2oukMV2pslYe9x0KF8iQ33NA5rscQM7ePHifCCPry4M1cQjh0ynRoJmPQ
         /pw4+3tzzudMrjbNiZWnkU515YrfIklCz9pv9frDpL4XZCUznrh2ZxgRE0xsHBnsFr9E
         pGFh70DVxO7KZIuRArkpM42kljoiT701qQZzfZ/3GphG2jaM/r29G6LWSYOINKc6unA1
         A0QcLNo9jM/Lsic3jqCq9Hw9CR/iheJGVTUmm3K3VoxTlxOvwUhSRr6ljww4E8j8d8Vj
         W0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748631810; x=1749236610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWbYSIdO62OOJiQnecBL9sTo7G5vpYkrti7/TBlHzU8=;
        b=NM3k29u+YgDkBs0XsXG8PUGLwnPp9iQK1RQKXlrJidQ0dJNXMhS/CRdAlM6wW0gy0o
         S9hHiW//f1Jt/uC5MtmSAjC8RS2oy9Zh0ZvRzZC6IHja5trEkxazPWkMcpFwb/5S2E6c
         aYWSZeqztB4hsCxb+agPaKmaT9/xnlpdvT3+5RBitTrqpAaVdAD7WgLoItsRCWN3zwdo
         kLfk8OA1To9Iu0g+lMPSGE7I4TOy6WfEOQHrx+UPlXDkI6CHiwSSKM1oKvPNylXXZYPH
         CxRzddNEbyFYB7l40D5bBsxHqbAao6qKqWVIm/Yr/OQep9RECQ7Fw6xTAE2OtXR/8nuQ
         psEg==
X-Forwarded-Encrypted: i=1; AJvYcCULuoZJQ+AZj8AumO0sVWgj5llKdZV6hbluLpx2Gv4R17l50gZk1Wrfk1h7ydfwIEAA2MNKpHLaXe7Rqm44jA==@vger.kernel.org, AJvYcCUiJYa7XV8ipKrnWlJEczTqoZZHcSsSg6d62HgKxTv1ZDRzRFjQwiA3UJvJaLG40XXiasaGOLldEWIwSjy2@vger.kernel.org, AJvYcCXCfWJ+81JURWNLhMT9Hd90iysBfvhckaXeOOo9x/pf30tCYyt2dgWomZ0fZxqKmsyTBmJhJDwsMaUa@vger.kernel.org, AJvYcCXQmvp4jH3Hvde8GYjkM7JvCaj0yosGlopqwZVuXjxn6GAt5KRx2BJrq6Dswp4XwW5lLtdn4t+IG50f@vger.kernel.org
X-Gm-Message-State: AOJu0YzZN++owd11BqJeUx39+Pt+/CDGNTh9OrlqVAWLwLIYs1Ar7+vh
	axyjnXIOGg809dkwBUyfMesVlbUvfujtL+n5pdFkilmcQsC8ZCnucpw+dtWmCMNBOTi08Nrtvyj
	5qOsCGzysLL5L4nPQqLp/GhUqw0YR+9I=
X-Gm-Gg: ASbGncts2ul4tsR6ZMZ4X1uHU1F7V9bGHs8UfRaJ9UKKPyVEOW0kRBKeRSiqky3r/ti
	0uAcaf5lpMBLbf1CcR+aX9x137OyeYJjr0zpdcbwe4iMdaW38HpMLPuDIayyrgXazaydt9y2qZj
	OKHCICYMfLUsGfcKPJMOhwhqg25jXcKBGt3HzR4ET0EJQMeVpDgRdJLSlAos/V9TmTV8Zw1RXjJ
	rM=
X-Google-Smtp-Source: AGHT+IH2zORH2vRySz0CN9TNdgBEf5yVzy1SECE5QTG2S2acXnAdLOUPR0LiQ0ef8xzgUUWbKZrn52sT/HqDiLS85eE=
X-Received: by 2002:a05:6e02:184e:b0:3dc:7c5d:6372 with SMTP id
 e9e14a558f8ab-3dd9c9ae2abmr31711735ab.7.1748631810172; Fri, 30 May 2025
 12:03:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-5-2c1e6018d3f0@oldschoolsolutions.biz>
 <g7vlyqma6ow6tdsaqt2rfwvblxqwbqlwmoueio7i4vqvjy76kw@5bz4g33pq4t7>
 <CAMcHhXoYkQru_0n5siMGGkTcHu8yWRZWfT4ByiD8D0ieZHF+wQ@mail.gmail.com>
 <vwoixgdyjjzcjlv4muwrzv7wztnqyidtj7ghacgkjg6hgkkyl7@ji53bhiltaef>
 <CAMcHhXqDFuo+x99KOK0pQFj-FyTdQoZS_JvehNE2AC_JSoQ2gQ@mail.gmail.com>
 <rvyfkow43atquc64p6slck6lpfsot67v47ngvfnuhxqo222h6k@kdvbsmf3fwsr>
 <CAF6AEGvr_foMVwaE_VSVWLT50cbGi8i3UGwo2e=rORD-1JmTmA@mail.gmail.com>
 <152f5150-30b0-400c-9816-13e4710a4156@oss.qualcomm.com> <kbmqr7gjkd72hgorbhbwb7ttvmecfbb6pg72st7zwt5ogxju6p@itycxk6vriy5>
 <CAF6AEGsTtEA=So1CDhvg8H5+Z-RJ9OnhgSzDoa+zkWSPO3cvnA@mail.gmail.com> <CAO9ioeWk1-dUQYDS1oQNc-QaRu5MG_C=JRx6RPiFE-OQjB7g3g@mail.gmail.com>
In-Reply-To: <CAO9ioeWk1-dUQYDS1oQNc-QaRu5MG_C=JRx6RPiFE-OQjB7g3g@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 30 May 2025 12:03:18 -0700
X-Gm-Features: AX0GCFuyrh8MEvD6KG3oIYX8kJg14cADV2Gw-IJWO2LGxnsfrU4hztAz5uwEVuA
Message-ID: <CAF6AEGtvvu=cBqtYUm1k6+N0L26sRz6nehOmC=5OxxZMvTngog@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, jens.glathe@oldschoolsolutions.biz, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Kaehlcke <mka@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Douglas Anderson <dianders@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
	linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 10:42=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, 28 May 2025 at 19:50, Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Tue, May 27, 2025 at 11:18=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Tue, May 27, 2025 at 12:55:06PM +0200, Konrad Dybcio wrote:
> > > > On 5/26/25 5:28 PM, Rob Clark wrote:
> > > > > On Mon, May 26, 2025 at 1:36=E2=80=AFAM Dmitry Baryshkov
> > > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > >>
> > > > >> On Sun, May 25, 2025 at 09:43:36PM +0200, Aleksandrs Vinarskis w=
rote:
> > > > >>> On Sun, 25 May 2025 at 15:33, Dmitry Baryshkov
> > > > >>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > >>>>
> > > >
> > > > [...]
> > > >
> > > > >> Yes, please. Don't set okay status for the GPU until it gets ena=
bled.
> > > > >
> > > > > Drive-by: Shouldn't the dtb describe the hw and not the state of =
the
> > > > > linux kernel's support for the hw?  Ie. if bad things happen if w=
e
> > > > > describe hw which is missing driver support, shouldn't we fix tha=
t in
> > > > > the driver.
> > > > >
> > > > > (In the case of the GPU there is the slight wrinkle that we don't=
 have
> > > > > a gpu-id yet so there is no compatible in the dtb yet.)
> > > >
> > > > My two cents are that it's okay to enable it, at least in this case=
..
> > >
> > > That would most likely make display unavailable as DPU driver uses GP=
U
> > > as one of the components.
> >
> > Hmm, perhaps we should allow the gpu to probe, but just fail to create
> > priv->gpu, similarly to how we handle missing firmware?
>
> Ack from my side. I'd also like to remind you about my split-GPU-from
> display series.

True.. although if possible it would be nice to not depend on extra
non-default config for this scenario.  So I'd prefer to fix it in
addition to your series, but have been a bit short on time for the
last few days ;-)

BR,
-R

