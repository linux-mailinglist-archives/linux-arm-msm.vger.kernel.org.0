Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C45D374823
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 May 2021 20:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234140AbhEESoq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 14:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbhEESoo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 14:44:44 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE2FBC061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 May 2021 11:43:46 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id z1so1780237qvo.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 May 2021 11:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xCaYprLSbNEdDL+9pgV9awJ0GDvBneLu+CkgeXpmcjo=;
        b=FckFAAM0urXrxgm4fZ3T+9B51HbBjhE9phC8kF9WEf0AxlYqXQYF4gUqgg3gKGPXt1
         C58jWi0p7CyV/Soar5QXSuXV3TPtTU0jTn232BvM9aejBgoWBg+FggCt6xSbmlvVq+Nc
         BI9aquKT1voy8GA4j3AP3FUrYdmfqEpvFKbMWQ70HWWO27v1ivhhJQ1iObIzhHWS48FI
         rBu3YT/nsa4qOuq65AC4jd+5j13aHS1++z6it3g2QAqGNoEpSZIUvkUNNiV1yPVKF5Ik
         C8EGFv6fA1I0E7Lg0iRb1cGEvtBe2fWtIpNPmbY+0iJhES0jRYt9ndYmZCBMOl670zGN
         hxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xCaYprLSbNEdDL+9pgV9awJ0GDvBneLu+CkgeXpmcjo=;
        b=DepMNtSWBt/h1tR56nJjBQK/FEjGcrZTsNkg+e2niftH2aF4vTyNaZBtD/TfQxMl90
         DIx89/riUXZ+mUpxHYU3bMTlO6BlUOJ1DilHF2F+ewsUgT2Pf6Wyl2eCfefKSend2cpU
         AzXJEZ9f0U+M+YF5sYixG3Tw9QNED7UBi3NDKyFLUyYkfXaiZ3KTemgh5I74CnK9LoiX
         YlOhu7JpeemR1RwE/sX44Zr0jyUVPVNj8a9qOnFvZRqFvr7VQiU7Yfk0eyjqCJU4xbEC
         IzG+d+m1sg4e8kpy15F+LowltQKWnje01bMun4KfkrMB0Qhf71KSOtr3GPcveZafADy+
         h6WA==
X-Gm-Message-State: AOAM531O10ywtfEz2XuAlFydfUw0Vzz+P6RNiniFIf5LqhLeo0QnQqW6
        F+jZ2hMY4mN32AZGsErEOsyXjfoYqfhe4+mQy3fG9Q==
X-Google-Smtp-Source: ABdhPJxjAtmlJGOviymK04xz3wUlKBRHnG7TAUVt1XCsQ9vh284EoCTjeYLM2e/U6Gp547e3Fx1btrfrtvH1aKOTIoI=
X-Received: by 2002:a0c:e183:: with SMTP id p3mr423632qvl.4.1620240226108;
 Wed, 05 May 2021 11:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <CALAqxLXsLcA=r1x6hXxLx3aVA-8=RG5qd+yj+sKEFiaWPUzkSA@mail.gmail.com>
In-Reply-To: <CALAqxLXsLcA=r1x6hXxLx3aVA-8=RG5qd+yj+sKEFiaWPUzkSA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 5 May 2021 21:43:34 +0300
Message-ID: <CAA8EJppTgQSFvNcA4vEf1rSDeH0ec7nj3YHDA4DUgiJ5OPciOg@mail.gmail.com>
Subject: Re: Regression: arm64: dts: sdm845-db845c: make firmware filenames
 follow linux-firmware
To:     John Stultz <john.stultz@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vinod.koul@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        YongQin Liu <yongqin.liu@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi

On Wed, 5 May 2021 at 09:20, John Stultz <john.stultz@linaro.org> wrote:
>
> Hey Dmitry, Bjorn,
>   I wanted to raise a regression I caught in the merge window on db845c.
>
> I was seeing troubles with audio and while there are a few other
> pending fixes needed, they did not seem to work for me. So I spent
> some time bisecting things down and found the problematic commit was
> 7443ff06da45 ("arm64: dts: sdm845-db845c: make firmware filenames
> follow linux-firmware").
>
> It seems for systems using the old firmware filenames, this will break
> dependent devices on adsp_pas and cdsp_pas nodes.
>
> Now, obviously updating the firmware files in userland should resolve
> this, but it adds the complexity that we can't just replace the
> firmware files because older LTS kernels will look for the old names,
> while newer kernels will look for the new names. We can add both files
> to the system images, but then there is some confusion on which
> version of the firmware files are being used where.
>
> So yes, we should align with linux-firmware file names, but I think
> more care is needed for this sort of thing as it has the potential to
> break folks, and this isn't the first time around we've had similar
> firmware name changes break us.
>
> So I'm working on fixing this by including both filenames in userland,
> so we probably don't need a revert here, but *please* maybe take more
> care on this sort of change.

Point taken.


-- 
With best wishes
Dmitry
