Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36FC33E970B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 19:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbhHKRwE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 13:52:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbhHKRwE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 13:52:04 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53DAFC061765
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 10:51:40 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id d10-20020a9d4f0a0000b02904f51c5004e3so4308889otl.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 10:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=2DfNuz5O7Mpdzge58x7dhXEmqV1KbsWUVKw3z3NErkw=;
        b=KegjHwRhqP0eyTIjTxdo+VQWrHOjxNclssYbN0gYdv+UXtuPfpLohCE61Br2R0f0xS
         sVV35sxF3U+OMySclqVD79ydUWjUvGcKMnapmPU/O6z0A22kYnk00cKWLKFDpniF2zh7
         YgjtJ2yV4YWL/DTcfHaijEnuQsELdmlb8846E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=2DfNuz5O7Mpdzge58x7dhXEmqV1KbsWUVKw3z3NErkw=;
        b=QPVl5/7ufr+gkIbZtjrUC8RfZnCJUrMdfXc9npt8o8XBY/dBr8pGB8xDuLqINkB2DY
         k8kKWflJMsDNRqdOqo2jBzmZGls8ypfuPHFtW5NyY46OXai6xGeisobjhLVFPo+8rRbE
         bU170ofeND1ULa+CLHiaTFS5Nn/sfIKKPGPHM0/S0fXnCqpO6DbhMQm70pl3BASUpFwz
         XlvMjFHig+w42DK7NX+GPV4IR+RhvlmWhn1gbWhvLM2Twy6HR+73SHHclRAo04fZ60qW
         tv+xeOV0/27hkC0nN1YCDOie2Fl1qSX3VQaWNSYM2pxFW9R2bb/ANXJk661Ak00AWqlD
         kEuQ==
X-Gm-Message-State: AOAM533Hmt8prE+OsGa2la4RI0K/HKiJBh6tzRKdmJpgdl6nhyc1uXVv
        VHA/mA3xDueHVtISs7pTx4GpK10JzZBrHTf5JtkPVw==
X-Google-Smtp-Source: ABdhPJxP4Vj/nnRZByQ6ppiULeaZtVP0wwSMf/t1xhztsfuKaN7WpnJStix5REbZv/OdPm2wJyTwoly2glhXlLB7PX4=
X-Received: by 2002:a05:6830:1490:: with SMTP id s16mr120971otq.233.1628704299752;
 Wed, 11 Aug 2021 10:51:39 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Aug 2021 10:51:39 -0700
MIME-Version: 1.0
In-Reply-To: <1628691835-36958-1-git-send-email-akhilpo@codeaurora.org>
References: <1628691835-36958-1-git-send-email-akhilpo@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 11 Aug 2021 10:51:39 -0700
Message-ID: <CAE-0n51i2OcQ5G=nDXyOQwYoT4j3iyRKu8r-YYotmqTNfaBzhQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: sc7280: Add gpu support
To:     Akhil P Oommen <akhilpo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Jordan Crouse <jordan@cosmicpenguin.net>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Akhil P Oommen (2021-08-11 07:23:54)
> Add the necessary dt nodes for gpu support in sc7280.
>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
