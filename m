Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3C62210ECF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2020 17:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731529AbgGAPOK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 11:14:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727007AbgGAPOJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 11:14:09 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C491EC08C5C1
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2020 08:14:09 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id o15so13466446vsp.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2020 08:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fPwKKf6uw9cQn3+zWKTcclwYDlrMRJsDVGhFtE0vfHQ=;
        b=GOek734hoxnUFdKwQZYks2y/teGU/5sM8hSU9kIAbXx+QXbNbn5TVbjpM6ZtvSQ4DH
         +8KPuA2Iy1rIASApRFHRSBsRDw7yq7+wflLU1wzlakISVX0ZrNiZlrYmk7Acb7X1WHzD
         VpP7A1Oq1bgTnZTQ3qcvk1+jl2XcUN+t4WHLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fPwKKf6uw9cQn3+zWKTcclwYDlrMRJsDVGhFtE0vfHQ=;
        b=mKRLbkwzPP75pOGRqnihJuFnT2RgpkmOhqVqAymCdUFdKOmgR4LCxIUBxkio26nhWM
         xd03OdP5NHoGvt4FaGe9a6KFPgahnBwzPh53DObPdhgdZYrM79+Z4OR4wS24yYF7dWDc
         ujck0LrLxqxRazFc5P//XRs/ia2ajX3EHbnO+dxwWFoF/OxEz6rJqBfEK5eNcQAt1o4S
         4mstCpe6yxhLm8kFOhVFJXSpDpv4w49zKTcoRI1/cTQP/yD7ZRW70gUta65oi1uOc2JZ
         zFIjEvUdFloA6xZdHly6rxwa+5g1ChCCyH6tvgfvjcuRkOj1oxGgdVvwpTUDIXT0CSlH
         G9Fw==
X-Gm-Message-State: AOAM532MSZbOI4iLZ2slbz2P9OvXr5eu8Bg30n8j2QSdpauRqsJytMCC
        vv5m0CtsOK/utGmszEw44BRsnU8MtuE=
X-Google-Smtp-Source: ABdhPJxOGKkqnzYE9S1Feun+xD9tw5U7Pt674phEs/DOUKJI8KO9oBckq/l+G2sa9L4udjH6szlVpA==
X-Received: by 2002:a67:13c2:: with SMTP id 185mr601356vst.161.1593616448680;
        Wed, 01 Jul 2020 08:14:08 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id d123sm1004861vke.43.2020.07.01.08.14.07
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2020 08:14:08 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id o15so13466400vsp.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2020 08:14:07 -0700 (PDT)
X-Received: by 2002:a05:6102:407:: with SMTP id d7mr19071366vsq.73.1593616447314;
 Wed, 01 Jul 2020 08:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200622144929.230498-1-dianders@chromium.org>
 <20200622074845.v4.3.I68222d0b5966f652f29dd3a73ab33551a6e3b7e0@changeid> <850240a0-a8c2-9bca-b17e-5452ce2f9c10@codeaurora.org>
In-Reply-To: <850240a0-a8c2-9bca-b17e-5452ce2f9c10@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 1 Jul 2020 08:13:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UcqYzrb_H3YJ=UGpRYMkNiRgG8_EaJazK-8+WCfK4msQ@mail.gmail.com>
Message-ID: <CAD=FV=UcqYzrb_H3YJ=UGpRYMkNiRgG8_EaJazK-8+WCfK4msQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] nvmem: qfprom: Add fuse blowing support
To:     "Ravi Kumar Bokka (Temp)" <rbokka@codeaurora.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, mturney@codeaurora.org,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, dhavalp@codeaurora.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        sparate@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        mkurumel@codeaurora.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jul 1, 2020 at 8:09 AM Ravi Kumar Bokka (Temp)
<rbokka@codeaurora.org> wrote:
>
> Hi Doug,
> I have tested v4 changes internally on target, if i am giving input as
> unaligned address, it's not throwing any error message.

You mean if you _read_ from an unaligned address, right?  Yes, this is
on purpose and by design.

1. It appears to work fine.

2. If we didn't allow this then we would break compatibility with
existing dts files and existing users of sysfs that want to read here.

-Doug
