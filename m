Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F14572C58E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 16:59:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391130AbgKZP7A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 10:59:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390011AbgKZP67 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 10:58:59 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABDAAC0617A7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 07:58:59 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id b23so1318650pls.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 07:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ArsWYhh7f+27HV9EfUhP0m1tD+zYaD7GlznzldJ9F4I=;
        b=qkgO/YHM9SJ9lb/WijGe2BdY1DVH88O5AtF3faucYDQ8TYkcbqOzQTCWxifYWLa3q1
         6Ki5v41y79OfUaSurPWtuMlyNawO1kAIFm/60YRU75MxNagNMuW500eS1Hrg6yzArMms
         7Wsl4cCoPZ1v+qYGDsv4qQv990QZf/ueTK8pcvuafTWBJAlY/qSvcvWjJixfroANpQ2R
         zd/YKErGVmu+T8hYfp0KrohuaEsDzGfkC+dweKZBfYwlcwATvLxeOn1UY/zXTzB/0+eZ
         ca2fqQ7adxN9DjMSyyau1HxA5dj3kuAKj9T7tYLqftRciAK8OobxSGLVDhu+zxotrKew
         ST3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ArsWYhh7f+27HV9EfUhP0m1tD+zYaD7GlznzldJ9F4I=;
        b=g0BCuwAQ4cvy1SCNqHqW4J9UNOArEbvYjt/XseKKDiwMdEHpYsmkv0ASVTu3NcdP7Z
         PK3Y5PjClEuClNTnamZCnVB+Sd8UM0gkRKtShQKxls9p6pz8C03ySp9q8alLcSO0ju8V
         /bEl4+J+9VG+Oa77jekb5pXtzhSAu3M5Tcixh1VPuW5Hj8QBR4YGX62nQ7NrFb+Ckt3o
         bEQNC5wagdIc0n4FHW4lRm81U5Hj3QNjdTmR0BVwjT/g+ZZNdBDyCfTx1eNxmqkGOnCO
         VEBNmNPYkTQCq35iGWn7EGfXzztWIaLXdK58s6ewBjpldQWoq79f39SUhxWhhsdUp7gq
         mRPQ==
X-Gm-Message-State: AOAM5336pigqGOE/4VmpXs92aDRG8WIDze0fCIzFfCrPAk5/lzkC4BF7
        oT19HZCUQVbEJ7mNGvUPkv+uwvp0bTXEFbIUY+S4Uw==
X-Google-Smtp-Source: ABdhPJx9f4dK6XH0f++SfF0aQFUZVMuGEnw8DvRJTuLbgcRd+HWd2/f9IMdxZl832s0RNv5AiGw1lIt75eMZumYH9c4=
X-Received: by 2002:a17:902:7d94:b029:da:53c:f7cb with SMTP id
 a20-20020a1709027d94b02900da053cf7cbmr3153103plm.69.1606406339266; Thu, 26
 Nov 2020 07:58:59 -0800 (PST)
MIME-Version: 1.0
References: <20201126145321.18269-1-robert.foss@linaro.org> <20201126150334.GC51288@thinkpad>
In-Reply-To: <20201126150334.GC51288@thinkpad>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 26 Nov 2020 16:58:48 +0100
Message-ID: <CAG3jFysosSVGfLzAvERS=GaEz8J8SJwh7roS5twG6-7meErKdw@mail.gmail.com>
Subject: Re: [PATCH v1] i2c: qcom: Fix IRQ error misassignement
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks for the review Mani.

On Thu, 26 Nov 2020 at 16:03, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Thu, Nov 26, 2020 at 03:53:21PM +0100, Robert Foss wrote:
> > During cci_isr() errors read from register fields belonging to
> > i2c master1 are currently assigned to the status field belonging to
>
> s/correctly/incorrectly

I don't think there actually is an error in the comment.

>
> > i2c master0. This patch corrects this error, and always assigns
> > master1 errors to the status field of master1.
> >
>
> This patch fixes a legitimate bug. So there should be a fixes tag!

On it, fixed in v2

>
> > Suggested-by: Loic Poulain <loic.poulain@linaro.org>
>
> Reported-by?

I'll add both in v2
