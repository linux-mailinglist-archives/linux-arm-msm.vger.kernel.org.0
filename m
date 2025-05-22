Return-Path: <linux-arm-msm+bounces-59072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0627EAC1223
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A914317F1F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 17:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB196189F43;
	Thu, 22 May 2025 17:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TuQbo669"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CF3189F57;
	Thu, 22 May 2025 17:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935200; cv=none; b=QZRIn69KVlXlKLA4i3kmqULhI3C5FitWFhzfeBiMtKLXexVmbX/SISqzah4MLybkiK87FRWJVOjbW0+buMZgFFc6SkfpqQhhN0uJxWKqJIo8NGhMmb+iT/pF5W1EuAf4F21ChPBTHXWvjd7lJan8CLQsemd2vTJvO6UuJrKaNwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935200; c=relaxed/simple;
	bh=yZCuz5KOY1Rb1fNXfa6wWyj8KY6lp+00rvWft2KvMXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mw0boUg/DlrUOShgVuWNIZ2Xrxx+CYN7ooq99PBPia8/BvADr75BrcsNZK7KTSOipSKXmzJv2L1hw/DIUMU+INmRPZSQtdZ2h/Fmp56ZS64sdTWvVkU6HVHB9QLhmakbCXzojjeJ75ZdwQTdau9NqWXOPBdI28eCkczLsvERPPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TuQbo669; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3da73998419so23726315ab.0;
        Thu, 22 May 2025 10:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747935198; x=1748539998; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZCuz5KOY1Rb1fNXfa6wWyj8KY6lp+00rvWft2KvMXY=;
        b=TuQbo6696CY8NBPB0hvjNLxtcWM2lWzsU3RdicaLITitPZyRukagfLeuV5gCOZltov
         qQWYtl7UFVtaRWqMp+ygUKTfZ3W+nPr+Fq8nt4yKpEMOS2olz5Gdo9gss+qnWZ0aQuas
         mGyXR5L6TFmLv+Hr4iUqpNUUC5NyDgYZoxmjS6948Ou/SYcSv26zPNVAPzFPsjsSs72R
         QfrduBihio/Pd8WsMN62qTzu426rxkoRaT9q8KwUz/X7dDQeb2jrfSYGhG9TFog2fKYz
         TynWu2QSpkibjKUyJuAyy2YxyzgszuyKQYfvZC8jpeMy1nbB71keycWXA6gc9Q9fLGVz
         iNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935198; x=1748539998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZCuz5KOY1Rb1fNXfa6wWyj8KY6lp+00rvWft2KvMXY=;
        b=lePV30YmhrqJo8Dojf1IxH/vVWS8qCWYugqZXqtdxkVB/G1ZdLU0Qb+YQcboG+jHv5
         df6nLWFwDw3madS/i2+S3U/tNsFgdzAaQLbP6CToBaQZLxr8SUckdI8dNHlq/3dB8ycG
         BSzvqojhB4mnma8oGRRGcBzjYR2dJ6ffzkL9cWM62exA2R4LE/EV7w3xoO2Qt/m4PXIG
         LIpR3MGJLW+lhyhAv2F2VQWdsnKv+1LFOIdPWwAD5thiw4fIK2Xmxo6zFDMhr98raq+C
         LFr7U5CL/Mx6P7khXGLF51AlWy7F6DHo0NziNf4hn4kCgQxD6WBD0E9cfHwIN4mYJXxd
         Y+Pw==
X-Forwarded-Encrypted: i=1; AJvYcCV7F/DaxnuR3VOsxaP9sYET5qySe2D1SqzuojvGKL6qZG60iIbhAKZVt1nxGs7T7bK+QklWEdOS8y5yl9wPaw==@vger.kernel.org, AJvYcCVbbXjboI5l5akfqOemR9w0dn47ml8JBPswDp560bZCisp4TrNNUjOba6wymiMkk2YpaHA8rXW6qzPN@vger.kernel.org, AJvYcCWj7xAAGmBZtShjDBOuIpinL7karbLeEGfg0awwAOCiyiSFywUfE2XXYIjhKZVZJpIwdjpp983arLCV8MQe@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0teSJWBxIKqjH71rogh0JLoRbXSe/qM9Ae7KuyQ7MeVwcRm1H
	TJSI7SWNzsywp1uuIKFwSO9r4OgpSGH01BVU5KgdsVnLlKG74O863ekBGqCLLNyBnoc2onQd9H2
	/koj3betF8g4oKyx+OxopC4fZ10AS07Y=
X-Gm-Gg: ASbGncuXkgDW1Ddp8d86VpDnkBNgxdGWok39pEVVZE420WLbvtXkg0RW/6G0xxdY+f9
	Ikpie3147tYgyeZu6pI78WxInMVbHze2zo/bcMi+cQf+m6ZYQIO71j64eekNzJbW0v3Rhb2eb8r
	cCqeLThc+1BqV/O5dVSzMkBrIw0VSGneIymf9cHuuewujUyzgXx6a5MR/mN0IjXMs=
X-Google-Smtp-Source: AGHT+IGLp6jF0fhMnnPkzroRSH4KvzmG+rg6/iwrv7HqLvxi39A0Z4DM4iu66szWb0Bixn5K8nL7y4V/mVjNTnq5TMk=
X-Received: by 2002:a05:6e02:349c:b0:3da:7176:81bf with SMTP id
 e9e14a558f8ab-3db8434a2afmr267633515ab.21.1747935197989; Thu, 22 May 2025
 10:33:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
 <20250430-topic-smem_speedbin_respin-v6-2-954ff66061cf@oss.qualcomm.com>
 <13cd20c6-f758-45ff-82d1-4fd663d1698c@linaro.org> <886d979d-c513-4ab8-829e-4a885953079a@oss.qualcomm.com>
 <b838f9bd-0537-4f8d-b24b-d96700d566c8@linaro.org> <98a4ad20-c141-4280-801e-015dafd1fb39@oss.qualcomm.com>
 <a26213ec-808f-4edf-bb0d-ab469ee0a884@linaro.org> <281ab1b6-498e-4b29-9e15-19b5aae25342@oss.qualcomm.com>
 <63105bce-6b8e-4b99-bca1-3741f27ea25a@linaro.org> <892fc1eb-efd3-4fb6-9110-2df3349960a6@oss.qualcomm.com>
 <b989522d-bd41-4d76-91a9-3cf680214003@linaro.org> <f5734944-1ed2-4acc-a015-0c638c331bbe@quicinc.com>
 <d73c6151-91bb-4c96-ad2a-972ad392624b@oss.qualcomm.com> <1903ee8a-f819-4a4d-baee-90f35e0da290@quicinc.com>
 <584a9e49-5106-4053-9f42-e1e176618eea@oss.qualcomm.com>
In-Reply-To: <584a9e49-5106-4053-9f42-e1e176618eea@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 22 May 2025 10:33:04 -0700
X-Gm-Features: AX0GCFu7DKioivEGx1jU548joNSO1hiW2h8Q7AIKCB6hRmaGrivAyhudL8VYukI
Message-ID: <CAF6AEGs0sUfdER+GuygnupituPpVygms-Sc4hw1nYUFwCXC_=Q@mail.gmail.com>
Subject: Re: [PATCH RFT v6 2/5] drm/msm/adreno: Add speedbin data for SM8550 / A740
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, neil.armstrong@linaro.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 9:03=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/11/25 11:51 AM, Akhil P Oommen wrote:
> > On 5/1/2025 9:23 PM, Konrad Dybcio wrote:
> >> On 5/1/25 11:29 AM, Akhil P Oommen wrote:
> >>> On 4/30/2025 10:26 PM, neil.armstrong@linaro.org wrote:
> >>>> On 30/04/2025 18:39, Konrad Dybcio wrote:
> >>>>> On 4/30/25 6:19 PM, neil.armstrong@linaro.org wrote:
> >>>>>> On 30/04/2025 17:36, Konrad Dybcio wrote:
> >>>>>>> On 4/30/25 4:49 PM, neil.armstrong@linaro.org wrote:
> >>>>>>>> On 30/04/2025 15:09, Konrad Dybcio wrote:
> >>>>>>>>> On 4/30/25 2:49 PM, neil.armstrong@linaro.org wrote:
> >>>>>>>>>> On 30/04/2025 14:35, Konrad Dybcio wrote:
> >>>>>>>>>>> On 4/30/25 2:26 PM, neil.armstrong@linaro.org wrote:
> >>
> >> [...]
> >>
> >>>> This behaves exactly as I said, so please fix it.
> >>
> >> Eh, I was so sure I tested things correctly..
> >>
> >>>
> >>> Konrad,
> >>>
> >>> iirc, we discussed this in one of the earlier revision. There is a
> >>> circular dependency between the driver change for SKU support and the=
 dt
> >>> change that adds supported_hw bitmask in opp-table. Only scenario it
> >>> works is when you add these to the initial patches series of a new GP=
U.
> >>>
> >>> It will be very useful if we can break this circular dependency.
> >>
> >> Right. Let's start with getting that in order
> >
> > Another complication with the socinfo is that the value is unique for a
> > chipset, not for a GPU. So, it won't work if we keep this data in GPU
> > list in the driver.
> >
> > Downstream solved this problem by keeping the PCODE/FCODE mappings in
> > the devicetree.
>
> Hmm.. that actually does not sound very bad.. it would allow for e.g.
> new bins to appear without having to replace the kernel.. great for
> backwards/forwards compat
>
> Rob, WDYT?

Not against having it in dt if the dt maintainers can be convinced..

Alternatively, there is the optional machine string in adreno_info.
We've used that in a few other places where speedbin mappings are
different for multiple SoCs using the same gpu.

BR,
-R

