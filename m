Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D34FB1BE531
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 19:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726493AbgD2R2U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 13:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726530AbgD2R2U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 13:28:20 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5D11C035493
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 10:28:19 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id b24so1762899lfp.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 10:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gsj/DMCdq2iHsv9iEgXgXTTdBXXORDwu7caTzYP7OC0=;
        b=BrwJd7jHAjw/ndKeVTDpR19v/ATSbqBb1x/5jMBcAmWWLYzhUU0mhqocbwlSjelc+/
         TS+pjF4F06f6y7KRfVmNvULvilWng5nsq6/LOfIBTZVCduGAQDW9ErnXCy5dlYQxyN2C
         yKfSS8+yRr3IK2V9SY0WJCnKvhNO8YUy30oGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gsj/DMCdq2iHsv9iEgXgXTTdBXXORDwu7caTzYP7OC0=;
        b=LaxyaMdZ3hQiruPtuwvQvKkGaYYAFEDR6hvp8ZYcDOqFFAQGWLzUjcwlCzod1SoZzY
         XSXggEJCAnq9EYuhiUrxOoHinsnqHHYSGrytekPjei60tWoRycZGrKKyoonhR18+Zexs
         /zuB61g2BNch7eNPa2IggiL0NzrM7UxjNuhOHw6qN7g26VKfJ0+YyWxsyZyNzE4xQzS4
         Op/I8DtNrD5UI+PhObn+VXCuSTOm96Zg/y+7DBVbxqVkBBJBM3n5xjgqQ2eALuwxMrCR
         c9ijYQDPgre02+GlJ0iRD6l2hmUIjeJCaPsOH5eZ+rQZQkt88l7DwI75c0vlKPrvOcfd
         zfaQ==
X-Gm-Message-State: AGi0PubjaUjNuFTrrckR5z2JUCYPtwuDeZMo54sY/1W+WoLz1/6di6t1
        tl5078cWXqMt1xqHmiDAu4wDIeiTv5E=
X-Google-Smtp-Source: APiQypL3OTfqeIaFwrF4lG59JqWVzP9aYAVGiHaDS0HBR0sZAZjQDspjlYWLvOGw5vCILd1KG/PBJw==
X-Received: by 2002:ac2:4143:: with SMTP id c3mr23637112lfi.131.1588181297666;
        Wed, 29 Apr 2020 10:28:17 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id l8sm2623748ljo.5.2020.04.29.10.28.16
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 10:28:16 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id a21so3474508ljb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 10:28:16 -0700 (PDT)
X-Received: by 2002:a05:651c:449:: with SMTP id g9mr21840460ljg.278.1588181295980;
 Wed, 29 Apr 2020 10:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200415145110.20624-1-sibis@codeaurora.org>
In-Reply-To: <20200415145110.20624-1-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 29 Apr 2020 10:27:39 -0700
X-Gmail-Original-Message-ID: <CAE=gft5REvz+0JLHtEN1BXmvWzMxftdecxPedLizgS47x1Sq7w@mail.gmail.com>
Message-ID: <CAE=gft5REvz+0JLHtEN1BXmvWzMxftdecxPedLizgS47x1Sq7w@mail.gmail.com>
Subject: Re: [PATCH 0/2] Drop all accesses to MPSS PERPH register space
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Ohad Ben Cohen <ohad@wizery.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 15, 2020 at 7:51 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> 7C retail devices using MSA based boot will result in a fuse combination
> which will prevent accesses to MSS PERPH register space where the mpss
> clocks and halt-nav reside. Hence requesting a halt-nav as part of the
> SSR sequence will result in a NoC error. Issuing HALT NAV request and
> turning on the mss clocks as part of SSR will no longer be required
> since the modem firmware will have the necessary fixes to ensure that
> there are no pending NAV DMA transactions thereby ensuring a smooth
> SSR.
>
> Sibi Sankar (2):
>   dt-bindings: remoteproc: qcom: Replace halt-nav with spare-regs
>   remoteproc: qcom_q6v5_mss: Drop accesses to MPSS PERPH register space

I haven't tested things in the "production" fuse configuration yet,
but in my current configuration I've got a tree that's running the
modem well.

Tested-by: Evan Green <evgreen@chromium.org>
