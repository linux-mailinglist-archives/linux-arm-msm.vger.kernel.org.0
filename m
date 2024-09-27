Return-Path: <linux-arm-msm+bounces-32665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA943988392
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 13:58:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A957B1F24EFC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 11:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACA718A6DC;
	Fri, 27 Sep 2024 11:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OAQWbnn7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFFB18A6D9;
	Fri, 27 Sep 2024 11:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727438279; cv=none; b=RoZtrIGWrbCLQr4rmuzcioyz27eXucwErC2S0+lKwQhP/OUGHwjMjmjhabjAa7v2UYN5vvUwMpnCCxHTM1FSsWuX8P6un0/6XQkKPJsv1CcUA6uBhFkqnINODTUzSVgzJ6qzL/2+q0VtviNEbqAsf8hZQy23bSLlvC3z9hAtkKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727438279; c=relaxed/simple;
	bh=OFvMn4GwvKADxI17/MHAKauBHsI2ZCvbRnSqWFXPevw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JclU7FqQj9zAzPnDO9taQxd2o+9lvm8ghN/hUtJEWfIpRb0AkD15idldN7xqxKxW+Z3eXAFihthwENb+/l5+0w1LyVmdwnNR6PCAPeh8sdWAnxQr6oRHE1Swx0RGDOGjwXMv7OOjqy+N2bzc/Ik4uz9a9S0/l5bTlF+CMGPXtg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OAQWbnn7; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2db6e80555dso376317a91.0;
        Fri, 27 Sep 2024 04:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727438277; x=1728043077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/00YoVmyxoQD04QF3B+FPA5cgwCGWAPgMWHF0NDU/mM=;
        b=OAQWbnn7pTpY/EQbG5C09/sChWtgtM2VRSWXQ5Xv7MNffsrx/SjOZIoU5tbRZM56cv
         TIphql2SnHz5qWkiiRbfBYQE/YwHYHl+Wfic0ojBVLEuR3kvWbApeNNjzeQa1vsGk2r6
         p2u9nWmzhlHNBoV4GuGbmqI+caJ1QsC2GlbZB1rf7t/IfSLnVTHNqaIQBlGtUIDZv5Bc
         VuLHWQRu/qdbzqkdizCljUBwZxKBdAGKa4gXQa9uTsM9Tyl+Hqpw4jmj6+psjN0pA77o
         pvCKOTPGsgHjbPITWQDHqSSXFIHrNSNoCtG1sApIHA01nWak1YejV46B6JOKtSM4yg3R
         HDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727438277; x=1728043077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/00YoVmyxoQD04QF3B+FPA5cgwCGWAPgMWHF0NDU/mM=;
        b=Fu+HwK04J3/87EO4Z3PPCvNqJI6r/UUKsXHvoFrdztudns8MLpZUM0qNdvgFCyMPC8
         QtOiAvhSJ9T8iIwTKk/CkVBbKMMVToWZVwBtdr5J7n4nlS79K8MLA/IrRtRBpeEV+zrY
         5pAj77Vv8Qgxv8Ya3NJpCldnFZvtrhQl4pM4p8mHMQUgRWB/4HCS+peLKAkE+YFnCj8w
         QZU+RFpaHnHUlXJrAzbFAQw/qqEi9cKbp9XjyfMOlQvo3vru/f/PDZ26Hs1AHsDAvMf2
         qS2ZS/wr/h/D+KGPZi6jKwXtgC3fno4eMomETg/sQjU5YCXAsViy/rjp8ReBYgxJWdaZ
         9TAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/dTySIbtApQoPoFqYxaePvJadWIOLP2rip99FJDqnGAFmGydMuJiAHK8iU+CJhq9a95ARV878mE8a76Am@vger.kernel.org, AJvYcCVDOrqhJieQXNy8NWRj3BjrmmE6y23Tv4T97p2g9EkDCVmOo0BfPHYcAIOw91lp+zwZ31WIor865Sf75o5n@vger.kernel.org, AJvYcCXEd6HRFbhgYVx2F6nXxWWVXJ4NOa5H7VNoExHvOxNKbQafYiFRCn63CZ0dXNvbZm7dWbGnkMHeUfr7@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi8LR+jhUr0sh+2YlcF7CQ68PqsKuI8d4/XRnWhX1gNh6GoomY
	AHDGHrwMDNLn2nFZY7scItqXdXTG0aQ4Jwnlnme/v7T6bQfgdAXRXDp4FppSMBVly85NgV7E+wu
	fCd2G2/ynYT5sMBfJKwoQsn5/4Xk=
X-Google-Smtp-Source: AGHT+IFMYD0OH+mms5PX41lPPzr/Ohq/r9pchznWtwGPOOpsDLVNm08dDIYqmANikx8KUubtMRcg72JLma6cxaU0Aik=
X-Received: by 2002:a17:90a:68ce:b0:2d8:e7ef:7d23 with SMTP id
 98e67ed59e1d1-2e0b8d7c62cmr1427986a91.4.1727438277454; Fri, 27 Sep 2024
 04:57:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com> <20240926-preemption-a750-t-v6-4-7b6e1ef3648f@gmail.com>
In-Reply-To: <20240926-preemption-a750-t-v6-4-7b6e1ef3648f@gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 27 Sep 2024 12:57:46 +0100
Message-ID: <CACu1E7HEZztQ3bctuVdrwLCVY2oJ_01AyeKdwCuuB6gmsPurpg@mail.gmail.com>
Subject: Re: [PATCH v6 04/11] drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In the future, the right thing to do is open a mesa MR with just the
register changes and then copy the file from mesa once it's merged,
because all of the XML files are supposed to flow from mesa to keep
mesa and the kernel in sync. I've opened a mesa MR [1] based on this
that will hopefully get quickly acked and merged.

Connor

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/31422

On Thu, Sep 26, 2024 at 10:17=E2=80=AFPM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> Add missing bitfields to CONTEXT_SWITCH_CNTL in a6xx.xml.
>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/=
drm/msm/registers/adreno/a6xx.xml
> index 2dfe6913ab4f52449b76c2f75b2d101c08115d16..fd31d1d7a11eef7f38dcc2975=
dc1034f6b7a2e41 100644
> --- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
> +++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
> @@ -1337,7 +1337,12 @@ to upconvert to 32b float internally?
>                 <reg32 offset=3D"0x0" name=3D"REG" type=3D"a6x_cp_protect=
"/>
>         </array>
>
> -       <reg32 offset=3D"0x08A0" name=3D"CP_CONTEXT_SWITCH_CNTL"/>
> +       <reg32 offset=3D"0x08A0" name=3D"CP_CONTEXT_SWITCH_CNTL">
> +               <bitfield name=3D"STOP" pos=3D"0" type=3D"boolean"/>

This bit isn't set to 1 when it's stopped, it's set to

> +               <bitfield name=3D"LEVEL" low=3D"6" high=3D"7"/>
> +               <bitfield name=3D"USES_GMEM" pos=3D"8" type=3D"boolean"/>
> +               <bitfield name=3D"SKIP_SAVE_RESTORE" pos=3D"9" type=3D"bo=
olean"/>
> +       </reg32>
>         <reg64 offset=3D"0x08A1" name=3D"CP_CONTEXT_SWITCH_SMMU_INFO"/>
>         <reg64 offset=3D"0x08A3" name=3D"CP_CONTEXT_SWITCH_PRIV_NON_SECUR=
E_RESTORE_ADDR"/>
>         <reg64 offset=3D"0x08A5" name=3D"CP_CONTEXT_SWITCH_PRIV_SECURE_RE=
STORE_ADDR"/>
>
> --
> 2.46.1
>

