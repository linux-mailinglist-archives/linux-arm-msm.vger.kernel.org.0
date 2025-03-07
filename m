Return-Path: <linux-arm-msm+bounces-50642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E509BA56D0B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 17:04:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE8C73AB4FC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 16:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF4421B8F8;
	Fri,  7 Mar 2025 16:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TS9U3aBe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6FA21859D;
	Fri,  7 Mar 2025 16:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741363337; cv=none; b=oHgyp8/IeQpPfWmIlujrNHlF8DWSfalvJqi3kt2cIyZCe5dgmV0GbZhsizdQVnvJuOj3ctaZQKbpLOkx3BUxGlQFWCDO/rOPXeN2I3xIpD9WfOxAWtEfvndGCo1hRLxDRkzWjAJSnoXinwg1MpjUOJ703GIAyDvC62ANN3wIoiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741363337; c=relaxed/simple;
	bh=BhZ669RDCvEQNbBp9DY5zD6yLlidw7BIUyaEO4uWSz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iaBWU58wMT3xEJXOYVAEGmNtqDf3A2uu+PY4WsmrxF4fDfQ0SYJuaq7Ndj1yhxuPYgIleXuGG0DihEo232M+R/nfO9dMAHURqcDBFByf1bpBIH+bgioX9/viYKMjOQS907YV8Y+VLTr5E4fK2PGiSgxrx62NyWXi2JvPW4W7RC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TS9U3aBe; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3d4496a34cdso745205ab.1;
        Fri, 07 Mar 2025 08:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741363335; x=1741968135; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVsyz1X8pF/UhiAV/Z073Ao8xGKbObCJlDlkeRzrTBg=;
        b=TS9U3aBeDni3n4FrQ8cudBXtqGlwTwMRd49zZ/YBW1uRjtO3F4TYBWGDmuJ1V9gW0k
         hqYTECKJvxOPqrCek+8cn07a32wovOyBPLvQiuLZ4fFhvyq/NX/tG/4xe0EBVi/vBDjY
         9yHtKdxRrH7SiLSA6HCe81UMHsbq9JVG5vuZQb4bvAvORqDglUnHMuXzwlvUKvoecJA3
         79rwye0SHJ+TNIVnu//uKCuN17HUrGWL0+ZTMTLZDOsdFQu6uB9v1t1rEQwKrDNy50gd
         OVJtrlVIYmKkBakbfizYOt1HsdmBtT8h+teaV7Er2p7Kh0QtiEv570x1Zz7yc8ub5FCS
         9Zyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741363335; x=1741968135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zVsyz1X8pF/UhiAV/Z073Ao8xGKbObCJlDlkeRzrTBg=;
        b=LWoje7M1BEgjalCtZvdow+jgJOWUFGmuUINSICPF3x3QB8CMpuoPYqSUFc8AgQwnni
         Gg49X7woQmpTIFqGklKsflwfp4rbn/9tycAtnNeZwIX2cTotyB9MlHp46p+jvuecgHHk
         tqufzfsxgAu8PhERkT/amTpHDdqfefQlh2QkZzuT9sxrxDx2SzrY77wgDaxXdbtJF4ij
         Z0hKTe+1IIbI4g31sXaCJKeFChL0mf1kT+do6HX0oxVuWo5W+txOx1usQ44t+l5t3eVi
         ihfh1g6mSavzBCShk4OOlopobHsDMEX5mX9vytc7sriuehC7d68KlIgbm4BEkhI/Arkg
         RB5w==
X-Forwarded-Encrypted: i=1; AJvYcCXSrh4bXx+56h0iHnq4hzkt3B+0xESxCSu2nhWaFjF+3HVne3JQ2FMjeMlCiJcEEyXTwbR5RfmtnNTFeI8g@vger.kernel.org, AJvYcCXlyIxsfCLQsLd0VYIzrnAY56lb+ybZ512umc5WlBAjMk7U8ErFOyTi844JuI579XVD/m4+gMxc3sMQ2fBu@vger.kernel.org
X-Gm-Message-State: AOJu0YwxJw5OGrcKFBqelihgTI1KvU9a3AD7YbomZwqo8el5QWX06dYX
	DwVaqWdKmORAfX1W3pUi8uI38JmnOlsZ30Mvki04R3fsp0GzE0cbt31v3ubWgbRZ2lENwFnb+nG
	khzbgcWzfhxpM97fJIiPGas/+y/Y=
X-Gm-Gg: ASbGncvT5+RrpNS0t4atkh4Vgb0aR/dJvNg4DdP1lf0M/NNS2lu9dbvx9LsrDK6cS5q
	eIcVIB4qE7ElnR9e9tCFP7hBZAh2jvxOcp+evkKhBf2LCL8UqkqEZKerkyUe+xr972ZQvJ9vb8l
	hG4Vvtd5NpWygzpYmwmD+wtEu28w==
X-Google-Smtp-Source: AGHT+IFlkDW45FjSDAY+/ujHbVYjPbC1fh1mEzuM9PpJ16/kKaBDf0mhpfF9ANclH9gXqm1ANKhVG4ZNcoYusoyEbhs=
X-Received: by 2002:a05:6e02:378e:b0:3d3:fa64:c6ed with SMTP id
 e9e14a558f8ab-3d44196906cmr43897455ab.7.1741363335404; Fri, 07 Mar 2025
 08:02:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306-dpu-fix-docs-v1-0-e51b71e8ad84@kernel.org> <20250306-dpu-fix-docs-v1-2-e51b71e8ad84@kernel.org>
In-Reply-To: <20250306-dpu-fix-docs-v1-2-e51b71e8ad84@kernel.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 7 Mar 2025 08:02:03 -0800
X-Gm-Features: AQ5f1JogM8GsN2MKzzbZAGFQDWsOKSeDlUzXfnTI4N4-lIOpp7hgcVHhMEdveAk
Message-ID: <CAF6AEGvdaOTTVnmSw3DV9584-du=Bh6NF7mD5vt4FLyi0B1Nkw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dpu: correct struct dpu_encoder_virt docs
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 12:22=E2=80=AFAM Dmitry Baryshkov <lumag@kernel.org>=
 wrote:
>
> Fix a typo in struct dpu_encoder_virt kerneldoc, which made it ignore
> description of the cwb_mask field.
>
> Fixes: dd331404ac7c ("drm/msm/dpu: Configure CWB in writeback encoder")
> Signed-off-by: Dmitry Baryshkov <lumag@kernel.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_encoder.c
> index 0eed93a4d056beda6b54c0d20f027a53c84f67db..0637be07eb293041a350161b3=
9a6276eb44bfb42 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -140,7 +140,7 @@ enum dpu_enc_rc_states {
>   *                     num_phys_encs.
>   * @hw_dsc:            Handle to the DSC blocks used for the display.
>   * @dsc_mask:          Bitmask of used DSC blocks.
> - * @cwb_mask           Bitmask of used CWB muxes
> + * @cwb_mask:          Bitmask of used CWB muxes
>   * @intfs_swapped:     Whether or not the phys_enc interfaces have been =
swapped
>   *                     for partial update right-only cases, such as ping=
pong
>   *                     split where virtual pingpong does not generate IR=
Qs
>
> --
> 2.39.5
>

