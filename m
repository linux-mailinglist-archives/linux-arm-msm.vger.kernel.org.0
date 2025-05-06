Return-Path: <linux-arm-msm+bounces-57018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14562AAD0CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 00:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B8971B68D39
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 22:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 766B37261E;
	Tue,  6 May 2025 22:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVj88w+7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21B64B1E60;
	Tue,  6 May 2025 22:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746569475; cv=none; b=JNBR8PWN2AQx+NSQy5Gk7/Qy6V80iAoMQm2n3nH53iq5+etqrZy5eDluk9lYKtJOcTfXyJWL4hH5UD0YxfIejA/ljvSiaMzcgOJGuE9wgv/Ow3GhUN9vATRikEoFgYahEysAtGfu5AA5yW27M5gEp5ha98PotXUdFPAaai1rVHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746569475; c=relaxed/simple;
	bh=ppABvYjSHr1u3RAd5WDk5Ck3j+vSUbQA3E3wAPBq27U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UGZkBo5ayo+wp44jTnnfmm0KtUHZTIrEoAxAWlMR9Bt4oZjW1jXxI37giBMfPaGe2ufyQxfK130xFyw6u+ZOuryLztlAiWud6oU55u6B/+jFi9z4Wcy6KkN9vX1g3/Ca3e5JWSivy95w55us6DJA8QaZygfb0c17pKl71kAC0x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVj88w+7; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-afc857702d1so5986276a12.3;
        Tue, 06 May 2025 15:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746569473; x=1747174273; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jiSvSLX5ynbADc4+bICsh2gisZmTrKBlbGfFrdRzhQ0=;
        b=bVj88w+7kXK0Bke67SgjXHSo0+p+CRserfz2b01yjyAxd5FEhZ5R0TjDXmUFlmewdr
         4UF3HoZPxWkFSdJiSeNZpgV3vb2kZnh4frKogyZYY0Pu7PtbQ2OlyAw5TCUHYemoDptd
         RCDJiaISh4JTtvSpP/REU8Mfx79f0SDZyfk+zft18+n9+JuDz0zPAjJSGJtILj7gGGRo
         TE16aI3GixeCvXURZMlKWmIynTQo+WY9CIUE8Yb1pgjXd4IEqpLaWp1KoZYuCQuIa7Jv
         buquCl5LUv3hgs1g2us+nuGaiflU/vr4g8HBv3GuAlPCTvpJ3bCUhLLY3YoaL8Ghv0x7
         22pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746569473; x=1747174273;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jiSvSLX5ynbADc4+bICsh2gisZmTrKBlbGfFrdRzhQ0=;
        b=QX7vRzebJsqwc9uTRKi7ol4L1eGTpLN+CoisCkpij+dc3LxJjtWqaL/tYievEshBxw
         JKrCtFX3z+6Dyei0LkHjh7IBvk5dzNhlkQ4p32q6473zeXW16jAuaYqAu267Y6HAWIrL
         I6teqok//frOjA7hxocH0ecyaCXCy6b+HJaFSKLVQFDEnKSSz62L4R6rXAJzj/2sXWbD
         227TGTr/mOUEDMXHwKKM3dxg5eGlzvhrcmPcuGgZLHc9+pf26eKLeOBbqbLPxRwD1lFn
         qBAJ9twu9hmWxTo6YmknsI/Yhdj/faDMvmea8zTfKlhtN84fldbdRLh8GMP2/6/KIxPY
         /idg==
X-Forwarded-Encrypted: i=1; AJvYcCV7dxj6/a6SEp74eV8cmWA1zyghJbY3Andx3x1Ws2QtDK4L2/Y2uMxk0OCHIn+6e5ATGjkn/dEFhWe/WaCP@vger.kernel.org, AJvYcCVWS2aokx54DCY9Ov8UbNaC29m8RwWdtQvDS8OHE4qZEd4GNER/562aUQ6Bk1FdMFzSDn1p3fw9fu/uTDYK@vger.kernel.org
X-Gm-Message-State: AOJu0YxeF/Bsel0fQ2lsRVjm66636BzjkBRHyFSh+9VlNIkNMevKWVRT
	qO2XUG35UGBoxV/OqdD5K3yZjwLLGfWKPaEiWQipF+CWbKpskcdE464jSFcweaRpsFSAJZh5ds4
	azxtfBCrSz8Y6glcuBiZDvhMh4mzKbw==
X-Gm-Gg: ASbGncs/kdrtkNuCPAa7a4lL8EG50UK+76gkaX7rSC6UiBWEEhYlfj5o0zo06+HmZRJ
	AboBQoTUeNXHbeTLQ+TE1ihDLJ+Ht4ffe0MhCKF9kate6VJzTbg7vAThqV2PvCXa2kwzcghsnyB
	JL6m7YsJfnnmABdsdn/YIcj1xhjMqs+03EQ4Bw90D9hCV82AiK6Ibu1CYS9vtQnI/Y0g==
X-Google-Smtp-Source: AGHT+IGeqsTTkiGAn1oeKcFKrRs71LkDCoLaCE01JpenyN0p/QfIT5UajvlNK/QC/WepzvGC6dhbtI4G3rw4KXubyYU=
X-Received: by 2002:a17:90b:384f:b0:309:e351:2e3d with SMTP id
 98e67ed59e1d1-30aac19ca51mr1929083a91.12.1746569473068; Tue, 06 May 2025
 15:11:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-dpu-sar2130p-no-split-display-v1-1-b619c0fddea5@oss.qualcomm.com>
 <k4npgl5v3qqdzqytiwesqgs3v362mr27mtvzfbvp6ugm3mn4qr@dxquxscqjqme>
In-Reply-To: <k4npgl5v3qqdzqytiwesqgs3v362mr27mtvzfbvp6ugm3mn4qr@dxquxscqjqme>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Wed, 7 May 2025 01:11:02 +0300
X-Gm-Features: ATxdqUFQr1aPwld24RZIIP4EOvP7dGz-MtbCTD8ExU9Lsw9E0oP0KebNjeXg098
Message-ID: <CALT56yMSnnwjETD6zXV3xk=YDHd1H4kuHCkzL8xi7c0w5nDcYw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from SAR2130P
 CTL blocks
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 17:36, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2025-05-06 15:53:48, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <lumag@kernel.org>
> >
> > Follow the changes in the commit a2649952f66e ("drm/msm/dpu: remove
> > DPU_CTL_SPLIT_DISPLAY from CTL blocks on DPU >= 5.0") and remove
> > DPU_CTL_SPLIT_DISPLAY from the CTL blocks on the SAR2130P platform.
> > Single CTL is used for all interfaces used by a single path
> >
> > Fixes: 178575173472 ("drm/msm/dpu: add catalog entry for SAR2130P")
>
> This was probably more of a "developed and merged in parallel" problem than a
> faulty patch, because a2649952f66e was merged first. Regardless:

And I unfortunately completely forgot about this chunk when merging
the SAR2130P support.

>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

