Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A94B717754A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 12:33:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728461AbgCCLdB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Mar 2020 06:33:01 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:40347 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728311AbgCCLdB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Mar 2020 06:33:01 -0500
Received: by mail-ua1-f68.google.com with SMTP id t20so969595uao.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2020 03:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jJ/XV2usCbxItuxEMH0XzvQohk58MuRc/TCdKnge5Ms=;
        b=jrZNGq8mHiKGxago1Y0w61XHNZ69z5yL/vRklU2RUrUlT1l04s3o1HTS/pJS3iKfLy
         U2XMJxcr+VDosSHrFasFV6MNshoOFxJmjy2XKEvrMBjQoWXpu9S1P0qWN0fBqogVkvjN
         Zt5EfAIOAe8LJBY4GaTzY+PuiDS83rpOuxyAAvfEGpmAs2kv9yagnFCToj9HfXemCWl0
         ghBIxt1/cZYywR641ndZA4YXziBtL/ODq5JHK+lxKk9CBIIsGgBn7XZVewTjHJzQSQQQ
         LXFXo1k7M4/tYmE0phGJdcqF2ha10XioTTct5NRQTyq3cnFuNxscpBc7vbFy/aAH7Yoo
         8AVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jJ/XV2usCbxItuxEMH0XzvQohk58MuRc/TCdKnge5Ms=;
        b=UOBFE4cH3kJNqEU9jgKtplq2AGvirk7X61rYPKYcFvbA1iZ9kgVkTLZdxDB/YIBX3Y
         nWBq63BrU9PatvKAGEWI+S6npnYN2wOy08djpP95iTMBLMAN3nKrmKdTqvpLxdwEehB1
         MlSXFiKOXsLpXrVgZwRkhb+f1iXnCMUzvJNBIXHBUECSIML+XLtRJzXL621IiJKVQ26o
         vsqCD5krbKfvYy0yC9bpcx6P7TgwCvA8vXlwguMa/+wdgVDTlQEauYIMSCJyArEeI488
         X/0YxKpCCwJPGJXzHrA7hJKBuseRaz3Bton5fMke2MYTdHs/+bpYkn6iANIIxvYomShQ
         ygDw==
X-Gm-Message-State: ANhLgQ1LeQhpKh0xMURZcBQrVOX+cyTY+hg9LiCgGGnsH8E7jc6hOLr1
        rD3fheg3Qr18B8tlX8iUNra4GgzLbA/Yo6I/UmJBj72s
X-Google-Smtp-Source: ADFU+vvCOZEB1IBzeQKCkx6+4afvyQ0UKXW5F91HHzefz5Aood5oq3IPnTEmdiCHkodr93n+ajeziwa36SEJk1q3kzA=
X-Received: by 2002:ab0:634c:: with SMTP id f12mr2464856uap.48.1583235179522;
 Tue, 03 Mar 2020 03:32:59 -0800 (PST)
MIME-Version: 1.0
References: <1583226996-24747-1-git-send-email-rkambl@codeaurora.org> <1583226996-24747-2-git-send-email-rkambl@codeaurora.org>
In-Reply-To: <1583226996-24747-2-git-send-email-rkambl@codeaurora.org>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Tue, 3 Mar 2020 17:02:48 +0530
Message-ID: <CAHLCerMsFBye12zgadZRq-69m=NkuuHfNZCrsr+grZzWOSxuWw@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: sc7180: Changed all sensor values
 Thermal-zones node
To:     Rajeshwari <rkambl@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        sanm@codeaurora.org, sivaa@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 3, 2020 at 2:47 PM Rajeshwari <rkambl@codeaurora.org> wrote:
>
> To enable kernel critical shutdown feature all sensors threshold values
> should be 110C to perform shutdown in orderly manner and changed trip
> point from hot to critical.

IMO, we should keep the hot trip at 90 so we can potentially use it
for notifications via the ops->notify callback in the future.

Just add a new critical trip section to all these non-CPU thermal
zones if you want to trigger the orderly shutdown when one of them
reaches the threshold.

> Signed-off-by: Rajeshwari <rkambl@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 52 ++++++++++++++++++------------------
>  1 file changed, 26 insertions(+), 26 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index d068584..55fd156 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1952,9 +1952,9 @@
>
>                         trips {
>                                 aoss0_alert0: trip-point0 {
> -                                       temperature = <90000>;
> +                                       temperature = <110000>;
>                                         hysteresis = <2000>;
> -                                       type = "hot";
> +                                       type = "critical";
>                                 };
>                         };
>                 };
> @@ -2007,9 +2007,9 @@
>
>                         trips {
>                                 gpuss0_alert0: trip-point0 {
> -                                       temperature = <90000>;
> +                                       temperature = <110000>;
>                                         hysteresis = <2000>;
> -                                       type = "hot";
> +                                       type = "critical";
>                                 };
>                         };
>                 };
> @@ -2022,9 +2022,9 @@
>
>                         trips {
>                                 gpuss1_alert0: trip-point0 {
> -                                       temperature = <90000>;
> +                                       temperature = <110000>;
>                                         hysteresis = <2000>;
> -                                       type = "hot";
> +                                       type = "critical";
>                                 };
>                         };
>                 };
> @@ -2037,9 +2037,9 @@
>
>                         trips {
>                                 aoss1_alert0: trip-point0 {
> -                                       temperature = <90000>;
> +                                       temperature = <110000>;
>                                         hysteresis = <2000>;
> -                                       type = "hot";
> +                                       type = "critical";
>                                 };
>                         };
>                 };
> @@ -2052,9 +2052,9 @@
>
>                         trips {
>                                 cwlan_alert0: trip-point0 {
> -                                       temperature = <90000>;
> +                                       temperature = <110000>;
>                                         hysteresis = <2000>;
> -                                       type = "hot";
> +                                       type = "critical";
>                                 };
>                         };
>                 };
> @@ -2067,9 +2067,9 @@
>
>                         trips {
>                                 audio_alert0: trip-point0 {
> -                                       temperature = <90000>;
> +                                       temperature = <110000>;
>                                         hysteresis = <2000>;
> -                                       type = "hot";
> +                                       type = "critical";
>                                 };
>                         };
>                 };
> @@ -2082,9 +2082,9 @@
>
>                         trips {
>                                 ddr_alert0: trip-point0 {
> -                                       temperature = <90000>;
> +                                       temperature = <110000>;
>                                         hysteresis = <2000>;
> -                                       type = "hot";
> +                                       type = "critical";
>                                 };
>                         };
>                 };
> @@ -2097,9 +2097,9 @@
>
>                         trips {
>                                 q6_hvx_alert0: trip-point0 {
> -                                       temperature = <90000>;
> +                                       temperature = <110000>;
>                                         hysteresis = <2000>;
> -                                       type = "hot";
> +                                       type = "critical";
>                                 };
>                         };
>                 };
> @@ -2112,9 +2112,9 @@
>
>                         trips {
>                                 camera_alert0: trip-point0 {
> -                                       temperature = <90000>;
> +                                       temperature = <110000>;
>                                         hysteresis = <2000>;
> -                                       type = "hot";
> +                                       type = "critical";
>                                 };
>                         };
>                 };
> @@ -2127,9 +2127,9 @@
>
>                         trips {
>                                 mdm_alert0: trip-point0 {
> -                                       temperature = <90000>;
> +                                       temperature = <110000>;
>                                         hysteresis = <2000>;
> -                                       type = "hot";
> +                                       type = "critical";
>                                 };
>                         };
>                 };
> @@ -2142,9 +2142,9 @@
>
>                         trips {
>                                 mdm_dsp_alert0: trip-point0 {
> -                                       temperature = <90000>;
> +                                       temperature = <110000>;
>                                         hysteresis = <2000>;
> -                                       type = "hot";
> +                                       type = "critical";
>                                 };
>                         };
>                 };
> @@ -2157,9 +2157,9 @@
>
>                         trips {
>                                 npu_alert0: trip-point0 {
> -                                       temperature = <90000>;
> +                                       temperature = <110000>;
>                                         hysteresis = <2000>;
> -                                       type = "hot";
> +                                       type = "critical";
>                                 };
>                         };
>                 };
> @@ -2172,9 +2172,9 @@
>
>                         trips {
>                                 video_alert0: trip-point0 {
> -                                       temperature = <90000>;
> +                                       temperature = <110000>;
>                                         hysteresis = <2000>;
> -                                       type = "hot";
> +                                       type = "critical";
>                                 };
>                         };
>                 };
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
