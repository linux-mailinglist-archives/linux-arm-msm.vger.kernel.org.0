Return-Path: <linux-arm-msm+bounces-57466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEA2AB17CC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 16:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A38C189996A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 14:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 445D3231853;
	Fri,  9 May 2025 14:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mktN58gS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8001225405;
	Fri,  9 May 2025 14:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746802383; cv=none; b=RoMX+V8Fr6kNB+DLJDmoznLONsWvP0U3vb/latelLWyUxfVZppfgcDjaXnKobvWL9Alliwfq3I2hJfWYqAdZpnI08PIzfIEH/XH+Mw+cjN0pUWkx4fdgcP5wmWed5/+Fb3yI5lgcw/C2wb0HA4MyNSX5SDhEePh55w9Cww+jSio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746802383; c=relaxed/simple;
	bh=+rxbByUDk8aWnHNgzHLW6dECRjoJFMK9UM6OVD8v+Xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qw3sSP/aLMzWqE8nun2tWbPxxfgXjw03W/XGEtg6iIwP3lDycU7NV96W/vIkCpkDOO5uik331R24t/70DMwKbn02JgRa/O7/CGF1wrv6VqEt6g6iP4+7AUmTg1HDTQ8SNcHB4U48ia79RFHrxY6EX14xC7DKv4+EvZxkoS73VsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mktN58gS; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b07698318ebso264503a12.2;
        Fri, 09 May 2025 07:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746802381; x=1747407181; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rxbByUDk8aWnHNgzHLW6dECRjoJFMK9UM6OVD8v+Xw=;
        b=mktN58gSVcFvttX+9xlp07/EEQJDRfC++I5+AVK8zDWE3TITy6TAonnOgIDY5M+JtA
         qzJ6eoFYcUdDxhOgPLFH3+Py9JFewjXFm8jvXmxVFwzWpSQSphyMMMpGr7lhL88mB8hq
         HLAoXGDmmx5IEVFz3qqibuvDEaRQ9cKN5qRZ1cu38cngDevgIlWDmLf3VPUdmR4mQh7v
         tQXqBbK9q73Zni4kp4857ckZYGlxMw6s02klaFWqm5cDeJJzXUd1Yby4PP5HOK0Xaasi
         WHPwe0w1Xu9nePamqxD/0vp46M7B4EIAySY+0kq0BucJYo9kInNak8C7WFxea1+8OnYC
         MLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746802381; x=1747407181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+rxbByUDk8aWnHNgzHLW6dECRjoJFMK9UM6OVD8v+Xw=;
        b=DRMVXQj3qksCn0u/fmCb3Y+ps/6wDTxve2SfpzQHbDQAY8G96Toq3VF1dGeX+5ZFZr
         llV2ISPddonevHj/XdSdxXnBfTkB/YkU9kSeqItkazmRtx5/Ia+Thd1/PY0qXveqRCSw
         2tVWeBpPhWWyVVpvc2rOdYonae8GYALA9Dxsseu3esk91EWxE4U370tDgyo4uY+QIZ4m
         GyRpus3Yp06wvHnjo0DXEbaKKFgtnzO2UEajErzzQ2PJN5c31CoeXzEnVZ/skELRTRBZ
         ttJKKzmmizxMYU3fPc6ZOb6bKr+ZEhxEqMF5v5r2MKHGYt/ZUela0kt2K/kCGA8g2/g7
         rRZg==
X-Forwarded-Encrypted: i=1; AJvYcCUavEPa0FdcJ56iil9Mf19vlqkseFTUzNC51GmZIhWaB3GLsD1zudrMVC7Par61xJihNMHBkXKYjXs8vr5X@vger.kernel.org, AJvYcCV0UvNgVD61BnUC7JXlQ+PQ59vDX1pvxAWRvZ02xx3xXA05sQUc9xFu44V4SICiyKhe0hDcayni76Pef583@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvqe31ZQpn4JQP0gcsinL2vCno2v4nM4NfRsiyH/54w0bnrBq+
	hPv4UQsdvPOzMB0n8fBjNEGtRFiVrY9odt1BHM3SxGctkJMEfnSsQ6Cy5+J8sQFzjpbcH5rX46x
	MoAeQ2Gro1tKGbFZiDYwscaNH1eQ=
X-Gm-Gg: ASbGncsugoFmGQK/wCW09GYyrOSlGxQUGCXD942STlpiE4uUcrDLqNjOYgB5amwoRf6
	bzwwFTtwvlVUdiYlANrHOi3KDzLZhzyp56zTnrvzYuLS22033na54ESjzBLpigj6oAs09Jqykue
	IjR4OuHBDQEKLO4E9Lt4v9jwVGOVoJMLxO
X-Google-Smtp-Source: AGHT+IGid2gLml23kAy5JozTRzpOaIiTgbiZSQS9UGrMDQLCun2YHqZxUOx848O/tx+F/rBCo9iZAuD/WYolOsp7HdA=
X-Received: by 2002:a17:902:e94d:b0:22e:6ea8:8a07 with SMTP id
 d9443c01a7336-22fc9087803mr20059425ad.9.1746802380873; Fri, 09 May 2025
 07:53:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-10-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7EFK7dzR=hm-J58jz77pMxn2SoJVrfQvV0RHiESi1mkzA@mail.gmail.com> <c4921bf8-5eb5-458e-8afa-eeb86d5b5f34@oss.qualcomm.com>
In-Reply-To: <c4921bf8-5eb5-458e-8afa-eeb86d5b5f34@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 9 May 2025 10:52:49 -0400
X-Gm-Features: ATxdqUE5coNf8D2sY3OL3JNiiVLl1uKE6rRwgQNy_gcoY6h_rxUnCjyB9CqZysk
Message-ID: <CACu1E7HYdq2a3phPoXHwDYXGQX6G36hCiyu1LMpyY6G+M4HuWg@mail.gmail.com>
Subject: Re: [PATCH RFT 10/14] drm/msm/a6xx: Stop tracking macrotile_mode (again)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 8:45=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/8/25 8:33 PM, Connor Abbott wrote:
> > On Thu, May 8, 2025 at 2:14=E2=80=AFPM Konrad Dybcio <konradybcio@kerne=
l.org> wrote:
> >>
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> SC8180X (A680) and SA8775P (A663) require a write to that register,
> >> while other SKUs are fine with the default value. Don't overwrite it
> >> needlessly, requiring the developer to read the value back from
> >> hardware just to put it in the driver again, introducing much more roo=
m
> >> for error.
> >
> > I'm not sure I understand that last sentence. The original reason I
> > always wrote it was that for host image copy we need to know the value
> > of macrotile_mode, so again the value exposed to userspace must match
> > what's set in the HW. We can't read the value from the HW and send it
> > to userspace, because userspace queries this when creating the
> > physical device during device enumeration and we really don't want to
> > spuriously turn on the device then. That means the safest thing is to
> > always program it, guaranteeing that it always matches. Otherwise we
> > just have to hope that the default value matches what we expect it to
> > be.
> >
> > I know you're copying this from kgsl, but kgsl doesn't expose the
> > macrotile_mode to userspace. I expect that HIC was added afterwards
> > and only works via hacks there (if it's even supported at all on the
> > relevant SoCs).
>
> Alright, I think I'll include it in the common UBWC config (even though
> it only concerns the GPU), as IIUC it may differ between platforms
> implementing the same GPU SKU
>
> Konrad

It most definitely does not concern just the GPU. It determines the
way tiles are swizzled within a macrotile so it also has to be in sync
between blocks.

Also, as said in the comments it's introduced with UBWC 3.1, so you
could turn this into another getter based on the version if you
introduce UBWC_3_1. In a future where we have proper modifiers derived
from this config struct instead of the current lie that everything is
the same, it would save us a bit.

Connor

