Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67B641BE537
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 19:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbgD2R2b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 13:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727082AbgD2R2b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 13:28:31 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95A38C035494
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 10:28:30 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id e25so3507201ljg.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 10:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j+bhAjh3kEPe5rhA7N5uvkCllfy/hLGyq+oBhmOHYbU=;
        b=UiSosEQy6INj2bIHG8ig4VR84YQDNNRhqfPUK25HSOUkn3sxK154B1MgEtJuwsK4Ob
         FEZJxfWbWaza4aH01LDnf5eRbFw4y7ikJBpcDGb5MxkvOGn8NEusYxHUFXdC6S9uXsPs
         tbduqCWkETnP4Zn8LmODzu0MYPsSOGt/viMP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j+bhAjh3kEPe5rhA7N5uvkCllfy/hLGyq+oBhmOHYbU=;
        b=H1YdlIEghjF43ofq/IW+zUL5tVmuONxDBP8+IVqEDDYuK4z8t7JDxcodTzRtD7kXWg
         3F5qTtyLLnQl/dx8clTgLJFOvv0J9S5uvcZFfUAZFMgK610IlURqWy7cOMqrxTGjn7S9
         xq0ZKYUC/vdmD81LB3fMu+d7aAwisyC8cQK469AbJjGlfu9QBmxFpTj/aF7gjdVCrphO
         SMqLQbwSnRSraWTPVfN7bwViG3iiVRwNFzmmAdo2tg21IO+FXrSK48ep6Sbc4ER/sPSP
         KJPuB1to1g/TmUiapzZxHVTL2XDr0DbDcrmuFAIu9ObyUxK5mrWfagWXiI2r/mA9ifcO
         yfxA==
X-Gm-Message-State: AGi0PuYhSMbM9JjbznZL7AvX0Ebubk4lkwP1W5/0srYzH3LyGse3RULa
        GXmOJJmZahHJTi+tCbr8vaA//TZ+J9A=
X-Google-Smtp-Source: APiQypJ8CYHiRXiA+gIP7iQPbHb7fG6wk4Gbhphy6SAcgUZnO4vzkJg51Oi32V4XwbGWBG5v9OVjhg==
X-Received: by 2002:a2e:8603:: with SMTP id a3mr22036264lji.153.1588181308198;
        Wed, 29 Apr 2020 10:28:28 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id v2sm2579495ljv.86.2020.04.29.10.28.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 10:28:27 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id f18so3456873lja.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 10:28:27 -0700 (PDT)
X-Received: by 2002:a2e:8e22:: with SMTP id r2mr21251699ljk.286.1588181306650;
 Wed, 29 Apr 2020 10:28:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200415071619.6052-1-sibis@codeaurora.org> <20200415071619.6052-2-sibis@codeaurora.org>
In-Reply-To: <20200415071619.6052-2-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 29 Apr 2020 10:27:50 -0700
X-Gmail-Original-Message-ID: <CAE=gft4y4-X=RDfi78a8WNb57S=-EKFu6VOa5M9bRsFqVZ8m0Q@mail.gmail.com>
Message-ID: <CAE=gft4y4-X=RDfi78a8WNb57S=-EKFu6VOa5M9bRsFqVZ8m0Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] remoteproc: qcom_q6v5_mss: Remove unused
 q6v5_da_to_va function
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org, Ohad Ben Cohen <ohad@wizery.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 15, 2020 at 12:16 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Remove unsed q6v5_da_to_va function as the mss driver uses a per segment
> dump function.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

I tested both patches (successfully), but for some reason this is the
only one related to this series in my inbox.

Tested-by: Evan Green <evgreen@chromium.org>
