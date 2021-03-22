Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4B2343D77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Mar 2021 11:06:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhCVKG0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 06:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbhCVKGZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 06:06:25 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EF33C061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 03:06:24 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id j7so11840663qtx.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 03:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vf/5HgYx6LWwvoRolmFRVnyW/drpHUHdwRcor8lAHsI=;
        b=XVOcmJ7r0DPh1ZxYfLBycDBz3qxlIIuUKEf+v+uhgY4C6GZi4oEYfYWjGEXmHDgHsb
         mfFdFGy6b7eHFPq5dKE1q7+8DnOIuCnqX8Y19NhWGhe4zNGwTUiW/Gw0aIl0Atdo2e0X
         Q6kx6btW8emWFax+vll8Nnk6/Odi0fSZlaQY0i9YKUgtV+5ONYwU8YnPVoPmi1uW8zwV
         lFUCkMG6znf0yWbevL9u4rOG8dg+q2V3jCvH//saCRa4qh0Y/sWHN2myURnbTP2MZm6k
         U7/PtMPPiohnlmc6yUWPpTVce+n4oRRwceTgzomvFX+JJGKLb0JAUNXI3XTDghUvZRfI
         S36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vf/5HgYx6LWwvoRolmFRVnyW/drpHUHdwRcor8lAHsI=;
        b=VNjrbNzKFp7k5AIOAysxdUz9Hrx7dpJ4lBpzMllPoio3dPwWvH+f8+ul7B08zfG31s
         LQLGLWBknfPi35Mvnlvw4aoo17km00zdqeKVQrkUGKhzIr18DTqyJ4P0ZfE4dtMFra5e
         AM+fIP/MCvlELpRuwTy9CiLlzWluJzupmKrTofeS1iR9qOM1B1y1H3ZnA7Ah/YIOQq6e
         Dffn8Qi7TBS9Parkcimz69sxb3jpVhMegg8caj4u8ky9BKEuq5NNN79yFw1mlJB7thjj
         uDCGm7Z5TlTigdsRHaf85o0Yn00HWDh1wZOJKEVN4Vgn2m7qaThBeRY6zdSoIi9D+4A3
         Gx9Q==
X-Gm-Message-State: AOAM533lpU8AGDMoruGH/HtsmeWxqq7KxgeMrW6hYVtR9ffIMSLu0Vbt
        818Eykww81m4jPYS55o+h3n1VJzX4FHilIgfs2PQEA==
X-Google-Smtp-Source: ABdhPJy5OzPEN/ZreL80BJyspZAxdAp0hWlmc7hOE70IdwVB7+dOCQtCtyAAm2Z/jlDcWcWaXtC8NsxGc8KkmRZi6Ko=
X-Received: by 2002:ac8:1385:: with SMTP id h5mr8983260qtj.298.1616407583771;
 Mon, 22 Mar 2021 03:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210321174522.123036-1-caleb@connolly.tech>
In-Reply-To: <20210321174522.123036-1-caleb@connolly.tech>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 22 Mar 2021 13:06:12 +0300
Message-ID: <CAA8EJppgALn_A5CVO_RSzpef_aE5uSefdL37=JMFqS60hYgR-A@mail.gmail.com>
Subject: Re: (No Subject)
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 21 Mar 2021 at 20:47, Caleb Connolly <caleb@connolly.tech> wrote:
>
> Subject: v2: arm64: dts: sm8150: start populating qups
>
> The QUPs are rather sparse, lets add the zero-th and second qup nodes,
> the iommus properties for all of them and the i2c nodes.
>
> With this it's now possible to bringup the touchscreen on my
> device, and without crashing!
>
> Derived from OnePlus 7 Pro downstream kernel sources.
>
>         Caleb

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> Of note, I'm only able to properly test i2c17, as that's what my
> touchscreen is attached to. Enabling i2c18 causes my device to lockup
> during probe, I suspect those pins are used for some other purpose on my
> device.
>
> Changes since v1:
>  * Pick up Reviewed-By's from Vinod and Bhupesh
>  * Squash second patch into first
>  * Add iommus property to dt-binding docs for geni
>  * Fix i2c19 being mistakenly enabled by default
>
> Caleb Connolly (3):
>       arm64: dts: qcom: sm8150: add other QUP nodes and iommus
>       arm64: dts: qcom: sm8150: add i2c nodes
>       dt-bindings: qcom: geni-se: document iommus
>
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 549 +++++++++++++++++++++++++++++++++++
>  1 file changed, 549 insertions(+)
>
>


-- 
With best wishes
Dmitry
