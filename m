Return-Path: <linux-arm-msm+bounces-47937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E413DA34BAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 18:21:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE2511885CD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 17:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64DE616FF37;
	Thu, 13 Feb 2025 17:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2eU5WM/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BC328A2B3;
	Thu, 13 Feb 2025 17:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739467188; cv=none; b=sjSA4wks0XFRDdXJsznGyu5VYzlUB0h5kLTBGUM01vHFYqCvvsHsDY1BayWylFMLYccD0e4r8cR+N548jt2r979vY+sZEVdJaYpDGx+PIZl+IqKkFm2slXFEkEAYUZe4M7xWE/8vHzVbDv2bw+Mwctvstv3yQxiZz7nc8d2M/Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739467188; c=relaxed/simple;
	bh=Bm4i25adIjcurhFNxqJaA0QU/KW7QorJTeiX3Rr0sNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1xxZHK58yC+suwJMYEPW7UGP1d3UrlAOljYCHeaGHMF/7gSiRnEDlaRMrLqvDTpnuhvU2sfFt/M7hG/5BsbNLrxPeOw4KU1hOwajMr58P6XaMP7XK5CQE26xa0zAiXs5zrySOxZsXnxMiWuRpMG8TA4uws9+B6hQOZxEbwzulo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2eU5WM/; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3d14811cabfso3633485ab.1;
        Thu, 13 Feb 2025 09:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739467186; x=1740071986; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bm4i25adIjcurhFNxqJaA0QU/KW7QorJTeiX3Rr0sNU=;
        b=e2eU5WM/0OWGTZGwsoi6ZPMTPfwBVuFo2WmnD0agaYBxYGS/Xe5CEsT1RgGrw3CjF7
         oKvxgdTTFlgi4qBflMgJn4u0zRKz5J4RMAWp9v9xw8xeVNHwuXYKp2cpSX2bzrFxogxl
         A43FXG0S5I+kgMdGEt16yFYYxYqEhEduD3puTJJFHiphgj+ZEWtaALjz0OpwTHUARzyk
         uZsuY7AV/ikj2CJMBVsl6RzxPs1L3fabdjm2B3Z8Hd1drniDkT2HIj0hOTALY6XJGVpx
         rM/8wAmziJzybXDVwm/aGCyZ+Gx9RWx/Eihn0qImTobeQ+2bPjFwAe+KmnEKYhOMsgjs
         ecDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739467186; x=1740071986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bm4i25adIjcurhFNxqJaA0QU/KW7QorJTeiX3Rr0sNU=;
        b=s9dVPhJLrRg61HB4hpj83CrZaPPpMA06j4bJdlyrEuypWY7ORvZ9jV9b5aFPq1YvWE
         gQqf7uztnillEqEuD4XCrLJVeae3SV9s71N2wCkDsIilyy/3O27Gqx7YCAiUmt41IfK/
         lWEvMmVIVGRZSivjLtzDmdkDrhaAoUs/qF64HrlNIMprnV2pj/XV+322JCU9gCkQdaye
         p5jEz8dNWYFy/ylGhkWrlwNx7fOvILmYBsRKHOsdp0aBl7Z98k58KqI4O/bvJCSo+O4W
         Id+b3FykCE3IbLvBrPOe0lkV8pWhI6agahlqxJkOjxBbqXve/msJZiDVkN1cc2JzVP1h
         pCzA==
X-Forwarded-Encrypted: i=1; AJvYcCW/MR4vaYwF4DibHnoZiKyDtYzJ2VQD+bqnvuIvujPni8xLK6txTq4woIQBJhy9I/mRjQWn1uJtMaRSP/di@vger.kernel.org, AJvYcCWKG44oagmbN9avd7PPhywepotK4mB5mqhxKr59UPGouP7tGcQ9IwxzdtPLTqv6cDhpr2jiZcNyhvI78YCWAQ==@vger.kernel.org, AJvYcCXei0cwacAtxp4iLVw1qAIOJvTk94Ev1SwDyPeq+OW+/S5+Fri40F8dXwzBJrF+hNTQp8cCFrfbb7zo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6PpoRbweKti7uRIRVo7G1KsudAMdkftGRsaKWKbKSoBGJrOWD
	6xfaDiEyBds4yMJhB15wxSmfSC1nEcMP1P09RFyzY+PLEo9bs1755YTjxK7STPW56h47kK897Sk
	jNTjo87XhMqL8H2eOWnor1bu/kZk=
X-Gm-Gg: ASbGnctBpzksuEq4uo+Tp64WLHRbnGWF96gbSwWJpCjUmt3XWyuP5rzZsc6hPKU5IWW
	jh5b2GLixLuxhwrrpHAUfce5IJHhKfsHFN01wcdFOfq0JtzMn5On5R+NVnMpKcZ3PjE5JoKzUmL
	FAJ27rJvgCFjYwR3SWaLG/kJvxLWs=
X-Google-Smtp-Source: AGHT+IGqHQH12TvcCqVq+sp2eFfkb9EhVfx2l+V4o6YoWca7+UnyXerhK5x+zq5ExbjI4QLtlq14D5tMNCuvWBn0ZEY=
X-Received: by 2002:a05:6e02:1548:b0:3d0:10a6:99be with SMTP id
 e9e14a558f8ab-3d17bf4afbamr65658425ab.12.1739467185761; Thu, 13 Feb 2025
 09:19:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
 <20250213-a623-gpu-support-v1-1-993c65c39fd2@quicinc.com> <2bfaa1ce-0233-456d-ba2e-5b14533f3812@oss.qualcomm.com>
In-Reply-To: <2bfaa1ce-0233-456d-ba2e-5b14533f3812@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 13 Feb 2025 09:19:31 -0800
X-Gm-Features: AWEUYZnDTxYvSDBQbxqoooRBQlXE-HeDdCw08AnRZ1CWeRcQsd7VBQ4oaCG1vUE
Message-ID: <CAF6AEGv6q59dpktR-zR7+4nuz05HMrY7givk8-E4rwCyJ0zNjQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/msm/a6xx: Fix gpucc register block for A621
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Caleb Connolly <caleb.connolly@linaro.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>, 
	Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 8:36=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 13.02.2025 5:10 PM, Akhil P Oommen wrote:
> > From: Jie Zhang <quic_jiezh@quicinc.com>
> >
> > Adreno 621 has a different memory map for GPUCC block. So update
> > a6xx_gpu_state code to dump the correct set of gpucc registers.
> >
> > Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > ---
>
> So GPU_CC is outside what we consider GPU register region upstream..
>
> And I've heard voices (+Caleb) lately that we should get some clock regis=
ter
> dumping infrastructure..
>
> So while I'm not against this patch fixing a bug, perhaps we can get rid =
of
> dumping GPU_CC here in the near future

but we'd still want this to end up in the gpu devcoredump...

BR,
-R

