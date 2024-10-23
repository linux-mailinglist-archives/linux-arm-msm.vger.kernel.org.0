Return-Path: <linux-arm-msm+bounces-35628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA809AD5BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 22:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 458711F22827
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 20:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96D21A7259;
	Wed, 23 Oct 2024 20:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyqb1hC7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C5C13B59E;
	Wed, 23 Oct 2024 20:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729716389; cv=none; b=ZFT4LhMfvIDuLZTe47tRspopwHeRYcZzz9DL8VVmF2fy8yJweeb49KJcyg2lHuuGrUNZqNf+Kd6uNXSm6fZ8phyv4/A7VwjudyUWsX0iiGifCqfD05mI4uvcAmikiOBGrsLcyaPGoKHznWU7yQEhlGzCfioSTaz4e0/7qgf8fGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729716389; c=relaxed/simple;
	bh=VE5faDGuulpA16bqytPHh+8rqbJzyZavDCJhycCNVO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MOqcrri0jkiEKX0vhqcp51V3oLB7ZgLILUHr4ExM/AnU5OcxlmWM5ST9lTkDdBE30Oq6ETDZ0ttzxw1A2xx3IZa4BQApIOUtwqcrXpYZFaB+JBw8KgorVNKbRVjXTavacXl7YsoJGKfAGds8fWDFys1sVjbZpHL1+VdRkAReKOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyqb1hC7; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-8323b555a6aso7846839f.3;
        Wed, 23 Oct 2024 13:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729716387; x=1730321187; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Q9Fmtv1jhqmPQxhPj7GzThFbrtRvvOEog4jX1mozHs=;
        b=eyqb1hC72NFyfzMwHYUNq8DdyinYXmcxlRxwGnmynvprDG6Qf2QMtGAmac/7PlR467
         ExQc5DXbcTS9d63kbrt0641s9KgdWBSDuPEXQXRqohJExHb6nMQ5hIsI+y38vQL4C/Wz
         P7jsvoOJlH9D/HhE/jnWvlKxjnU7kt9TwvyMbSUvwO1TWVJ20kv93y3NEbjy3IdJsHTl
         SfqTf4l93CTYItlz+oCKcDGmk5g+zGzgcXYaW8f6qwkyRleQHgTD6ZvbAxW+5O6TODf5
         xpbKPOSiRJ9iHRlR661kND/EUvs78Gfto2L/alBQs1MnorFx17KYf8Pk/ieExfizJZiA
         2U1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729716387; x=1730321187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Q9Fmtv1jhqmPQxhPj7GzThFbrtRvvOEog4jX1mozHs=;
        b=PMT5stGCpQalMbEsfFG03JW5C4sNzxoHFZF4X6q1AL9dNr8S8rcuFEEYYMJIF7z3Mf
         qac4tQ81D2t1lblOHbDf5bAl8Ykl93CgsRPr5qELRu4G3MkGukqxTav8nDUu/RFCtjPU
         HaH9fENVNIRKWj3lt9UrUuj5XG3+Vi9F4uCwOUxbGgnBX9gY8CEY1MbGuMdN4YvBPQv6
         mXi1fb8Ovs7B682F8jdVCguaTHFYgGD2rIvT4qEbAsdLAsZEct8RKC9Tjn3QSZXPksmY
         YYoktMMPnfYm1zXkhKI3VIDUnAAna+fhcziQZ6gFIb7AmhKiy2YS31T6Q8AH129yCnn/
         iGEw==
X-Forwarded-Encrypted: i=1; AJvYcCWhwUpE9+DeHWduz6w0y6CpXlfGM26NeLbWjd2eHISs+6hURBtYuLeBDim5G+vKhslpRQ90+mPZ35zC9kIf@vger.kernel.org, AJvYcCWzRe0+GVMFMYiXxNmuFK+yiEyXAnVIjp15obAa579VwxbdAxM4xpzDxAXSWXl3As7uJz+br2J+E9uXWBwikg==@vger.kernel.org, AJvYcCXD204IZOl6qjv30H+P826HqFVNJ0jJxojme+PFGwAXQWoVawRkJ8I6qbdauvavHenSLPo51mAE+xMn@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Tc5eBfnOfita/tGP3V78E/jOJ9En/+Cj3y6JX0nR7NkaEg9R
	nDQo0uFiKjCdoOw0DZR1ijO2DnkLTlsIe68YkFhZoh+pj6kb32oofjCzfat8vFojNLZYUwo2mTv
	M+M4W4CBAIAP6mb7EVKGhMw+C1II=
X-Google-Smtp-Source: AGHT+IHoQOEizYcj7tAixtp4PTHw4bzgJdfZ39CRrv3g6b0UEB4bcHATl1XYABgvefhFHa8Sg1I3z+Hc0eB/FkZBbQU=
X-Received: by 2002:a92:ca0a:0:b0:3a3:40f0:cb8c with SMTP id
 e9e14a558f8ab-3a4d59bbc12mr49771975ab.17.1729716387128; Wed, 23 Oct 2024
 13:46:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240911073337.90577-1-quic_sibis@quicinc.com> <f67d0fcd-4940-a57a-0e11-b98ed29cd09d@quicinc.com>
In-Reply-To: <f67d0fcd-4940-a57a-0e11-b98ed29cd09d@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 23 Oct 2024 13:46:15 -0700
Message-ID: <CAF6AEGvgnW5VTZYFzwiMChB4-2cShmBvMcfgQVbcCiOgH6e3Yg@mail.gmail.com>
Subject: Re: [PATCH 0/2] X1E001DE Snapdragon Devkit for Windows
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org, 
	robh+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	conor+dt@kernel.org, abel.vesa@linaro.org, srinivas.kandagatla@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 4:07=E2=80=AFAM Sibi Sankar <quic_sibis@quicinc.com=
> wrote:
>
>
>
> On 9/11/24 13:03, Sibi Sankar wrote:
> > Add initial support for X1E001DE Snapdragon Devkit for Windows. X1E001D=
E
> > is the speed binned variant of X1E80100 that supports turbo boost up to
> > 4.3 Ghz. The initial support includes the following:
> >
> > -DSPs
> > -Ethernet (RTL8125BG) over the pcie 5 instance.
> > -NVme
> > -Wifi
> > -USB-C ports
> >
>
> Hi All,
>
> With the X1E Devkit cancelled and with no firmware updates promised for
> it perpetually, please chime in and let me know if you still want to get
> this series and rest (external-dp, usb-A ports, sd card slot and 3.5 mm
> Jack) merged and have it supported upstream for the folks who already
> received it!

(a) would the firmware update situation have been _that_ much better
if it wasn't cancelled?  And (b) we do have dts upstream for other
canceled boards.

My $0.02 is that it is still useful

BR,
-R

> -Sibi
>
> > Link: https://www.qualcomm.com/news/releases/2024/05/qualcomm-accelerat=
es-development-for-copilot--pcs-with-snapdrago
> >
> > Sibi Sankar (2):
> >    dt-bindings: arm: qcom: Add Snapdragon Devkit for Windows
> >    arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for Windows
> >
> >   .../devicetree/bindings/arm/qcom.yaml         |   6 +
> >   arch/arm64/boot/dts/qcom/Makefile             |   1 +
> >   arch/arm64/boot/dts/qcom/x1e001de-devkit.dts  | 813 +++++++++++++++++=
+
> >   3 files changed, 820 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> >
>

