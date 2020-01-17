Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B83E2141278
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2020 21:48:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729740AbgAQUsL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jan 2020 15:48:11 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:36481 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729663AbgAQUsL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jan 2020 15:48:11 -0500
Received: by mail-vk1-f194.google.com with SMTP id i4so7025476vkc.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2020 12:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0kvYoN4fXranoTX+Qa5a0sJ3/lj3Hn7yx+pDCue4/XE=;
        b=k5d/i0E8CkSojnVTZut2knWfj21OwOXmdo8M42Tg7VctwZXbTz4V/giKwj5QPWrtND
         5lOgNmPuGjz/W9R+Rgl1Ed1GeyFLknOE8yyOucUTpUTfCFTa0Ej0N3Uu52sgf5B5uFF0
         LKSmm921h73ejQAO7KNBMDsqVHZBI0Bgkn5e82q3JZPCa2904XduX8eOA3UXQ0o0Iolz
         fwNhnpiaNL2MTEsqW9Pq05ZTmOEeKXEHpihRitgcsMhci1bd9WdzZmsBhwW198PAtMU1
         dGgPKK4Ac2bpqOVnmEAMbh+abS13iZ5jFWrhOzktZdlFDOombq44J05cjnUbE/RgQpz1
         6D7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0kvYoN4fXranoTX+Qa5a0sJ3/lj3Hn7yx+pDCue4/XE=;
        b=V/Xv1GN2qWLTzEondVWFMfEdFw9YDPDyjS5LN3wZ1skP19IlRFLjBt1QpgstzfrYme
         /6eepsJ1omxFILQshe1tu2O/dQgf4dT10SStFASZ6sF3jFnBlO06InYyzO6o1WPePPBd
         rrvdMPs3mO0mlge+Fs4/u6sIq8L5rlRuHEcsDztrXyL7KNGoxmW2fcu/kbE2eOPSY2Th
         TQkm2fNiyNI1upk8u6Vzub9OeV8ZhwR6JG66RUcaZRdldmZiatMWglYMTyL2Eu/Jioa0
         Jk4ltTqXeulVrXRmiCf0qiaV/jlCyC972FbNaM8BaEQu7ZDpdZbSZe5mgrCmLB05oFfb
         lskg==
X-Gm-Message-State: APjAAAWbsvKkoZvAZ7vIXJGgtT0vIEArmkCaawG2JeaC5XYWUPcOwgPL
        gKMv/O1baDvONv6CtRsSja84i9P+ntqfqSoTf1QB0Q==
X-Google-Smtp-Source: APXvYqz+kmGzGuNvOvVxhPATYhmcnsL6GJHTgKQ9ubRXxPOlN1Q7ZFiZ1Z8r9MVbFsMAsMjwDFzboW2Vqzv8b8zV5ew=
X-Received: by 2002:a1f:5e54:: with SMTP id s81mr25168776vkb.78.1579294090074;
 Fri, 17 Jan 2020 12:48:10 -0800 (PST)
MIME-Version: 1.0
References: <20200115205649.12971-1-brian@brkho.com>
In-Reply-To: <20200115205649.12971-1-brian@brkho.com>
From:   Kristian Kristensen <hoegsberg@google.com>
Date:   Fri, 17 Jan 2020 12:47:58 -0800
Message-ID: <CAOPc6T=bfEt3=VbzAQGtFi01oDgcxgrZLkMb4QWO1WWEou3_Ww@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/msm: Add the MSM_WAIT_IOVA ioctl
To:     Brian Ho <brian@brkho.com>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        hoegsberg <hoegsberg@chromium.org>,
        Rob Clark <robdclark@chromium.org>, jcrouse@codeaurora.org,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 15, 2020 at 12:57 PM Brian Ho <brian@brkho.com> wrote:
>
> This patch set implements the MSM_WAIT_IOVA ioctl which lets
> userspace sleep until the value at a given iova reaches a certain
> condition. This is needed in turnip to implement the
> VK_QUERY_RESULT_WAIT_BIT flag for vkGetQueryPoolResults.
>
> First, we add a GPU-wide wait queue that is signaled on all IRQs.
> We can then wait on this wait queue inside MSM_WAIT_IOVA until the
> condition is met.
>
> The corresponding merge request in mesa can be found at:
> https://gitlab.freedesktop.org/mesa/mesa/merge_requests/3279
>
> Changes in v2:
>     * Updated cleanup logic on error
>     * Added a mask
>     * 32 bit values by default

For the series:

Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>

> Brian Ho (2):
>   drm/msm: Add a GPU-wide wait queue
>   drm/msm: Add MSM_WAIT_IOVA ioctl
>
>  drivers/gpu/drm/msm/msm_drv.c | 61 +++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/msm_gpu.c |  4 +++
>  drivers/gpu/drm/msm/msm_gpu.h |  3 ++
>  include/uapi/drm/msm_drm.h    | 14 ++++++++
>  4 files changed, 80 insertions(+), 2 deletions(-)
>
> --
> 2.25.0.rc1.283.g88dfdc4193-goog
>
