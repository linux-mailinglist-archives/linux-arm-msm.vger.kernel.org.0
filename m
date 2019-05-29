Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD3A2E66C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 22:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbfE2Ur1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 16:47:27 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:43478 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfE2Ur1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 16:47:27 -0400
Received: by mail-ed1-f67.google.com with SMTP id w33so5678682edb.10;
        Wed, 29 May 2019 13:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PEb0b1EqOFVao/VpttYj8pRTc5EZTx8yOH2gisVAS1I=;
        b=Et+YWjaIZ8Z6R1kYSWwUvURblSTgQo8QuDL8xhvF2V+tJmeLBpi7vu/dRuvThEj72b
         XlL9YIcGTFeXTw+DUbAqbzGncHo9iPLpSNcpmUvefhrRTPFAzWt2l/1UclfAMWorPLVE
         7inuhdE5vc0eqRX/fT3laeX6jp0uPRkLyOMrARD+fmc60dfNmPMNzX4COnkqyAsjPV+o
         JIHNXUgCNE5xuxRcFxa9nCpiCiMq7bE8uTC5mp0LMS+5r3BsMp/GkTuzfpEviQBc27dm
         nDMCGisXEBJKLUZoDsncrujueOPw7+729wYAdthpXUxm1qFEiH/TXU3Qah2+WU9LVi6f
         oSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PEb0b1EqOFVao/VpttYj8pRTc5EZTx8yOH2gisVAS1I=;
        b=ZvJLDtcfilTMvzbRPMdzzj25DptHrfJcOTiC81m05RaY02wPalxbTufqnBJx4umNSW
         QgOx2z52LOOGhquL0Vle4aFTVeQO6jdLBYN1lPZAOKPVYxn/tXYRRbtM1lnO4HCdW/ab
         YmT+HH8SP8+zEKxPwvxZz2wVzeu9o8zhcrrVmygBWSxkn0xTa803sLRbhhOvHYlDNkdb
         cBmdlckLkdkWGAgZIkreupEPLH3l/CY+J/FcE8r+Zbkdg6WLV/whzMFWOWUj1NIAu9oN
         jFnQIej12zyvW4V1u8PUJ1mVForKKGjG4YqigZXUC5UH3UsdSU7smUUGxDLuDwGXWVVx
         Xkcg==
X-Gm-Message-State: APjAAAWJ6pEVySBTrWc4Wf9AMyNEjRYym+UaA0Q/XUZQ4BHO3AnJLbQW
        iDNYVrxWGXcgqqdrMN7Sg0hH8Cytuk+noi0cCLw=
X-Google-Smtp-Source: APXvYqx14X0H5f2xOK8QIwCicWxWrh881A89gewt51xGVzujShI/t3Vkxpwk6YpKf2Fkbc5MtE4bMNOJim/O1z9mDhk=
X-Received: by 2002:a17:906:724c:: with SMTP id n12mr157037ejk.164.1559162845256;
 Wed, 29 May 2019 13:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190529152022.42799-1-jeffrey.l.hugo@gmail.com> <20190529152022.42799-2-jeffrey.l.hugo@gmail.com>
In-Reply-To: <20190529152022.42799-2-jeffrey.l.hugo@gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 29 May 2019 13:47:12 -0700
Message-ID: <CAF6AEGuELkPf0KSFK1mBpfjFr27m64NtCZ817pkcf1kGB6vT7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] a5xx: Define HLSQ_DBG_ECO_CNTL
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

thanks, I've pushed this one to envytools tree

BR,
-R

On Wed, May 29, 2019 at 8:20 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> ---
>  rnndb/adreno/a5xx.xml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/rnndb/adreno/a5xx.xml b/rnndb/adreno/a5xx.xml
> index ae654eeb..16203512 100644
> --- a/rnndb/adreno/a5xx.xml
> +++ b/rnndb/adreno/a5xx.xml
> @@ -1523,6 +1523,7 @@ xsi:schemaLocation="http://nouveau.freedesktop.org/ rules-ng.xsd">
>
>         <reg32 offset="0x0e00" name="HLSQ_TIMEOUT_THRESHOLD_0"/>
>         <reg32 offset="0x0e01" name="HLSQ_TIMEOUT_THRESHOLD_1"/>
> +       <reg32 offset="0x0e04" name="HLSQ_DBG_ECO_CNTL"/>
>         <reg32 offset="0x0e05" name="HLSQ_ADDR_MODE_CNTL"/>
>         <reg32 offset="0x0e06" name="HLSQ_MODE_CNTL"/> <!-- always 00000001? -->
>         <reg32 offset="0x0e10" name="HLSQ_PERFCTR_HLSQ_SEL_0" type="a5xx_hlsq_perfcounter_select"/>
> --
> 2.17.1
>
