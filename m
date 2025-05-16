Return-Path: <linux-arm-msm+bounces-58235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA41ABA220
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 19:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75C621C01508
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 17:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECA12749DD;
	Fri, 16 May 2025 17:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h0BEcgse"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B458D22B595
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 17:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747417392; cv=none; b=EaQJratQlMD2Gq56SuL1ii6kWDu+t7CVr+fP/fOYNnIdR8/mdxgikcFo/gDmabq7Dy+m9PVjrxccEC+XFE0GbJX+an0apQFiCsA18WL/0yawwhZzWD7Feo5uCHlCRJzheZR5opiC26oGO+N302jrztb8gYgRjNthfSP7zrRVDOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747417392; c=relaxed/simple;
	bh=sBay1aenEjXfkacn+ZY+Cr1OwhROHPoxGk23mUtmbX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n/LXIcdLDz9iehSnzMxU0lh/a1hFQ2Crdy+4AquSkuSG8xoWBVNXpDfSNsBKCMCIP6vfq1LinL6HNkTCfF2r9+5KMVFCdBWAnp4+AczZQ5zbw+ElgmnTOV/GSAtD1z7F9wPknuqVY//55xKXUbNjVWPFBMysJaGATQKG/6vJdPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h0BEcgse; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b1f7357b5b6so1602211a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 10:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747417387; x=1748022187; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KFX83QNItwP0IuJnpM+8MJlz755t87bEyDF8uRue2k=;
        b=h0BEcgse+4Yczf20cCnqEAvOb8fv6in2JMEMEcO7gK72AGJcKaRHgkjWJk8cG8acM+
         LUV3+NLy/aacexnlAhd9UTLJIkAY5t/CNuuaTeX8LpLrymc/AxKJAp8EerIb30ju54FM
         zkUbtcTcuvS+KnA2f34bSFvC4FLwV15N23P6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747417387; x=1748022187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KFX83QNItwP0IuJnpM+8MJlz755t87bEyDF8uRue2k=;
        b=VGBh1w36oIFSLJwONlM/iP/nMwrBr9qP//lr0Zxe8Q4ybb9luRVIVhRBEwMH7kug3/
         yXzRpzbf5VNCArAnw0V/v1QmUITPa5P9ht4oJktoaBOxCav2J+9ICXdiCAQ0er5eMslI
         TLVXV3SdtfGMYfVBQH9yyqixb2vmPg0GSLoPzGjwaPQbGSoi+iqZyxhYGiCRnoVivEMZ
         saKnjiGNZagyKQ2ZxvtVIHV7LtXyI6/LTifUCl3Nd0otgkMlByFrI5EWKkq1GaXjEls4
         OsYJ7tDhDy/K/0f1nNl0eZ3b7UPkIWoV5dTr5UpijHl0fLz+Wwtu0jcE+utoOL5DHMN5
         4+Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVKNtnYOzHjw1q2qN8r0QpjFwG/a/EXtnIFJZzZAjNDXT3ipLvqr802JTJI3Ltsd8hurIvYUIZ2g56LSUzj@vger.kernel.org
X-Gm-Message-State: AOJu0YyyCEP71zfQDJkuIC4PbHGXn80i5Jt0tD8N+f8eR/a8ZM09E8Lm
	8irAprD/2q47tzgC9WmylUMmbKFDVfildO/PGtfZ/zjglsmiEPllOpi0lTn/5y3HT8qzcAJLsly
	FK4Q=
X-Gm-Gg: ASbGncsvNrdmzsCdrBD/vGgQNcCg44DetfOGnOcCipXXVzn4eMbrAofN9sQnxB/7Rxf
	wnOAwbTdhe2dk4CXB6cK6FN+Q0tM+i2o2rue4EIpXt53CILmsLsAcpst1qP9V4b2lSqddXwuZ05
	j6i9VgAfXGBi0opGSHaJcmOHtfada1HRHvKaWVUhJQ5OBK9gsCkJEzo6UxiNM7bFpTYACbhc0Im
	L32F7wu1liTkGQ0Y3W+MuApxZtb7BbEmjGCeR4dgJ5GK+U1izmI0yJN7zJ2NTZOMT51oDylhZXP
	oLb602Vb7qlYDxDad1eaSXwqKXVTdhhhneuiYJyswQFqX4Is2+iv/SxXE9C47o3m0C9I1vphctQ
	VRYlVZW9CdJ1i761yVB8=
X-Google-Smtp-Source: AGHT+IGy1qxG0QfDvcBAStn3wbmTxTsOxNgpJJylpWn5APPq+b2SCRMPMSUukTHs+HjlCxPSbm4UMw==
X-Received: by 2002:a17:903:2f4c:b0:21f:522b:690f with SMTP id d9443c01a7336-231d45af194mr56714395ad.46.1747417387406;
        Fri, 16 May 2025 10:43:07 -0700 (PDT)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com. [209.85.210.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4eedb3csm16951985ad.259.2025.05.16.10.43.05
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 10:43:05 -0700 (PDT)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-741b3e37a1eso2693792b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 10:43:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXAR5nSHfw36wnKyGe2g9HhXCekDbPsG2XklfIo/LCHTyCRljuM72H89PLcjjkDmNa1SaNUYhFf3V3EtfoX@vger.kernel.org
X-Received: by 2002:a17:903:3d0f:b0:231:7e15:f7a with SMTP id
 d9443c01a7336-231d453469cmr47600355ad.27.1747417384710; Fri, 16 May 2025
 10:43:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515211110.8806-1-robdclark@gmail.com>
In-Reply-To: <20250515211110.8806-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 16 May 2025 10:42:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VhOhGHnHZKBmzFKAFG-WnGhWRyqPm=FwK5mxUJ-ChWGQ@mail.gmail.com>
X-Gm-Features: AX0GCFsvr22QrX8yE42n8nz9bH4x0JASq7vWnUdqtPzSrItPo7-Ymzm-4RYVtfc
Message-ID: <CAD=FV=VhOhGHnHZKBmzFKAFG-WnGhWRyqPm=FwK5mxUJ-ChWGQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add BOE NV133WUM-N61 panel entry
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 15, 2025 at 2:11=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Add an eDP panel for BOE NV133WUM-N61, which appears to be a 3rd panel
> option on the lenevo x13s laptop.
>
> edid:
> 00 ff ff ff ff ff ff 00 09 e5 64 09 00 00 00 00
> 16 1e 01 04 a5 1d 12 78 03 55 8e a7 51 4c 9c 26
> 0f 52 53 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 74 3c 80 a0 70 b0 28 40 30 20
> 36 00 1e b3 10 00 00 1a 5d 30 80 a0 70 b0 28 40
> 30 20 36 00 1e b3 10 00 00 1a 00 00 00 fe 00 42
> 4f 45 20 48 46 0a 20 20 20 20 20 20 00 00 00 fe
> 00 4e 56 31 33 33 57 55 4d 2d 4e 36 31 0a 00 7d
>
> datasheet: https://datasheet4u.com/pdf-down/N/V/1/NV133WUM-N61-BOE.pdf
>
> v2: Actually get the panel name correct in the table
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next

[1/1] drm/panel-edp: Add BOE NV133WUM-N61 panel entry
      commit: 3330b71caff6cdc387fdad68a895c9c81cc2f477

