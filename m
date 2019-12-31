Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 133EE12D9B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2019 16:21:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbfLaPVM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Dec 2019 10:21:12 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:40736 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbfLaPVM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Dec 2019 10:21:12 -0500
Received: by mail-il1-f195.google.com with SMTP id c4so30396200ilo.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2019 07:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M7wDnYJLkdZ3OOSrLZqOeBqYHWkaMb/EXIdOIWi2ux8=;
        b=cbmWvu809wZwdtci+lKYzW4AhYVpnBdlWm0HloHr3t0MlPEoqkF+d3fd81CayHS+fh
         /A5cRX5GGeuxhJP503RVB9OZnzNuQCi33fmHjYSpw4ibMEb507/yR94QpjQCbTtvR4lI
         2ZR1pqe2d7rGSsTnq5T/ocPoKQjPUSsxO9bUua5KZW1NXDr+JCaOVDiiXIwU1Itc9Zu1
         A0XVdMFQvblvWdVT8PcxSdFkKxJ41sNrAYO4zptbeglWbEsFKtccfsBEa3PuoXrSgQEc
         96nk7odHY5j7Ts6/fRh/1njXnhM1uuPGX/TTkcTq0TmGb9jMorJph/R6weDxi8hEbJKL
         KKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M7wDnYJLkdZ3OOSrLZqOeBqYHWkaMb/EXIdOIWi2ux8=;
        b=qz0QXQHmwBuE8I6Wv5oqlAx5IGStV6V4/ObJ6TNgq33zWprLPctdgEDZs0aaKprusx
         dqMsWTk9fwzVZfitkBAZLRAEuB3n57chyu97fPizWAYNY3wUTLg+cceWfpCmSgX0FoNh
         uQdQQyAST/mYR4yRLZIv6DzT7rg0tX5SwkLpR9RyGR9ocYrsR2+4fwdwAm4e8va5RtAC
         qhnAn7OJgJM66o/wVzcm4uFrXmMf38oZMzgXPgSAPG8OdRClq77kkGxCn8cspL/Zl68C
         HYNSr3xEy4C9InibXFCdpatBoQ05xplAuXyvEXXaltFNiX1dwXqHpT2FuQVmzcOK+gVf
         mLYA==
X-Gm-Message-State: APjAAAV/w4NYo5H9GWOzFrhwVRWP1WBSq+kFEDNc0gxsgqTtCmOiR8N4
        asHbdkF8sO2dcl+AgSYyedDWJMP6pfyAX8v62/A2Mw==
X-Google-Smtp-Source: APXvYqy3MQrOnoaWbnV7vTPuZtjUUgc057hivbXdtKRtupkYm0cWiXJtUpFsHUEFrTtUPNyNYDJrHT3Sn1/xfTDTMZ0=
X-Received: by 2002:a92:5d92:: with SMTP id e18mr60949654ilg.75.1577805671148;
 Tue, 31 Dec 2019 07:21:11 -0800 (PST)
MIME-Version: 1.0
References: <20191230194102.2843-1-wambui.karugax@gmail.com>
In-Reply-To: <20191230194102.2843-1-wambui.karugax@gmail.com>
From:   Sean Paul <sean@poorly.run>
Date:   Tue, 31 Dec 2019 10:20:35 -0500
Message-ID: <CAMavQKLzkP6WKkxkNRYmvo7uhJFuvXjs_ryasFEMi3MeGMhaGQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: use BUG_ON macro for debugging.
To:     Wambui Karuga <wambui.karugax@gmail.com>
Cc:     Rob Clark <robdclark@gmail.com>, Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 30, 2019 at 2:41 PM Wambui Karuga <wambui.karugax@gmail.com> wrote:
>
> As the if statement only checks for the value of the offset_name
> variable, it can be replaced by the more conscise BUG_ON macro for error
> reporting.
>
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index c7441fb8313e..0fe7907f5a7d 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -315,10 +315,7 @@ OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
>  static inline bool adreno_reg_check(struct adreno_gpu *gpu,
>                 enum adreno_regs offset_name)
>  {
> -       if (offset_name >= REG_ADRENO_REGISTER_MAX ||
> -                       !gpu->reg_offsets[offset_name]) {
> -               BUG();
> -       }
> +       BUG_ON(offset_name >= REG_ADRENO_REGISTER_MAX || !gpu->reg_offsets[offset_name]);
>

Minor nit: This line is longer than 80 chars

Other than that,

Reviewed-by: Sean Paul <sean@poorly.run>

>         /*
>          * REG_SKIP is a special value that tell us that the register in
> --
> 2.17.1
>
