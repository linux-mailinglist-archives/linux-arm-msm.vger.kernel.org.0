Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC9303DFC41
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 09:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235941AbhHDHoB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Aug 2021 03:44:01 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:37293 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235807AbhHDHoA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 03:44:00 -0400
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MfZ9C-1mmkN10BpI-00g3KV; Wed, 04 Aug 2021 09:43:47 +0200
Received: by mail-wr1-f54.google.com with SMTP id c9so1120354wri.8;
        Wed, 04 Aug 2021 00:43:46 -0700 (PDT)
X-Gm-Message-State: AOAM532RJZ/Iz//sqZxUJ/XIaRDbw0HPuR8UnFrT2eqq3041TfJuGHK5
        2c42i/WRD82wx0bW1SL9onFpUCpUAir4Ys4i7oo=
X-Google-Smtp-Source: ABdhPJyunqosCIflc5vvvynoT6hdGMCnplHeTZXsuPA8UnSjopVy4WA6W8LG+8a5SLNVnF2AQBvVhxHXr2nSTm0xejk=
X-Received: by 2002:adf:fd90:: with SMTP id d16mr28680284wrr.105.1628063026717;
 Wed, 04 Aug 2021 00:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210802145321.1153989-1-arnd@kernel.org>
In-Reply-To: <20210802145321.1153989-1-arnd@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 4 Aug 2021 09:43:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2R4EVY9=K3UB2+z7mssNCrSf3BrGW95BwR+qw1SLOm-w@mail.gmail.com>
Message-ID: <CAK8P3a2R4EVY9=K3UB2+z7mssNCrSf3BrGW95BwR+qw1SLOm-w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/gpu: fix link failure with QCOM_SCM=m
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     John Stultz <john.stultz@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Kees Cook <keescook@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:vXMHY/nrtN/3gOBb2V7u+wSazxaz2q42Xdu8YzxXshlrtEcew1s
 8IHrMXLR0g1giWnqd8SffsCxIwsLE1eeh6/D0TphmpmlVVO0EQMuiqAD1+H+G/szlbtdoqA
 m1+DUFRcw352/6cX+27iZhhyTWx+OZvq7MaKeC6dbskHpiXY7r6OWnLcCPt0QxVKaQy4Q2g
 dZfHGVEqPtS85e5h9EWZw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:mcRO33EVP6A=:7IJ1iRsUiciNf4re1XCpTD
 e/aauj6zlQ+DLiSSzwMh2eyuE3xh+oFP0iYm/IboXRQX48flawU7e4dmI9eF57E7m38nYLeX/
 1uwWh6Yg6YVW+5ZBFmt+U5yeQCYS1B46rrCL3H2fzzCLGj1Kf9ZEVIbRNLuj8YnYJIFh6kL42
 weuzGjHDqJcRoarV+0IPYD37Ui2/F4MKH6+IV0EW9tjMs8o+iARANAr1oADU/UfVDmRjNl20q
 5zTM8KJNe2huMM5dQ8wq8woUybQ4uCjZQjVF0JePG9a5p0WDG7ZwcFEJND7TGXOmq0zg4y2BN
 N4rSlEKtwqGgsPGiTKcvitI188Hs++QFg/aHiT2AJirHPRuCeisCj/cdkKihJBHE3vbyYdGSi
 4A3Ag+/SKwnm+8NhoYMiM6+6Zt8RHJ8wxHoRW0z4ZBb58D/rPvAgvrYufo6sO2DW/F9QduRMx
 G+T/UauTaT69i8SGDimAcggxPVzHeIf131pzNqOTOxyZuh5XwEBHqRaso+dlMG5Cr2YBMTbc5
 gYEvun5ynpV2IAQg/1XFaB1VsrOzYi5pxnqXGAGDMk25hcxw6h6a7L4Aufnt005Ml9rX/pRm8
 pyMFkq9vs46a5vjebV/VOUCIo64V1DCpb/kOkbQ+VimXlUip1fgiX37QESCNPLS989qleCVbp
 dJ4WkvUzIKAAMfeZBIphwQWfxvo+ZeXRFh6UqoIfuZeXkf+27f8ivumtu+uMC+RKWlcE0+kBH
 OvQgaajLuItWXMEmC+tk8Z1qlg37AG6UAGoCcMysmir871sRFVAr1PVLCENnZdXjIjsrnHXbd
 Bm9clJUjOVoheBvHGwV66Y3RhdCZUYh25bQcJNEFAkR40ht/nC+00mAAHZ4grA/amWNY5/ulG
 37VgtORsSxQBGnzI++b29ZQOr3Mao/KQbNnZO8u0rf0w5RTuLUYPZ/IaYldJtxnEpe8iVR8hu
 mzsc4w1Y4S3Ku/g2mGNetMgCfczcs7XMkvgbRISqktuv1b+qzq0o3
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 2, 2021 at 4:53 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Another missed dependency when SCM is a loadable module
> and adreno is built-in:
>
> drivers/gpu/drm/msm/adreno/adreno_gpu.o: In function `adreno_zap_shader_load':
> adreno_gpu.c:(.text+0x1e8): undefined reference to `qcom_scm_is_available'
> drivers/gpu/drm/msm/adreno/a5xx_gpu.o: In function `a5xx_hw_init':
> a5xx_gpu.c:(.text+0x28a6): undefined reference to `qcom_scm_set_remote_state'
>
> Change it so the dependency on QCOM_SCM and QCOM_MDT_LOADER can be
> ignored if we are not building for ARCH_QCOM, but prevent the
> link error during compile testing when SCM is a loadable module
> and ARCH_QCOM is disabled.
>
> Fixes: a9e2559c931d ("drm/msm/gpu: Move zap shader loading to adreno")
> Fixes: 5ea4dba68305 ("drm/msm/a6xx: add CONFIG_QCOM_LLCC dependency")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Oh, this is still wrong, for two reasons:

> ---
>  drivers/gpu/drm/msm/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 52536e7adb95..69fbfe4568b2 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -9,14 +9,14 @@ config DRM_MSM
>         depends on QCOM_OCMEM || QCOM_OCMEM=n
>         depends on QCOM_LLCC || QCOM_LLCC=n
>         depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
> +       depends on QCOM_SCM || (QCOM_SCM=n && ARCH_QCOM=n)
> +       depends on QCOM_MDT_LOADER || ARCH_QCOM=n

* Only QCOM_SCM has become user-selectable, but QCOM_MDT_LOADER
   is still meant to only be selected by its users, so we cannot depend on it
   here

* There are two other drivers that have the broken 'select QCOM_SCM if
   ARCH_QCOM', we have to fix them all at once.

         Arnd
