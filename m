Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4B169C7FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Feb 2023 10:53:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbjBTJxp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Feb 2023 04:53:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjBTJxo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Feb 2023 04:53:44 -0500
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9533E7293
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Feb 2023 01:53:43 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-536bbef1c5eso4993517b3.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Feb 2023 01:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wOWqn+EAZZ7317oUrwJbDkD6fh11WKF6IR6078s/7WA=;
        b=C5teJZbQONCsIOB7m95k7jDdFnGVQ8naBFmRn/Yo1vSkMj+oGLgej+3+l6EkEQPLv/
         3D2gCBwbofhplqppytAt/Do0xQq5AmDuSe5DQqoETdzkVebMMPomOP+J5KEfWP0+NPby
         uR4oW97Yy4hSec1DPhjNE4opOey3nJJRyE8MxVzhilxVGm/nVllDejDa6TQdwFq2sc5D
         n8lk4yAnun1mBMqRHBjWCaf0ZB1h1ubfQ5KdhTh1LTRCrt4pyEmsRAvdpfsg3bXSBkTa
         pWejfSl3M6TqGiD+ej+Rv8C/ZZJrepcdxFdSyiCBGxn50Z2+/pextqxrIehlW/xk/06/
         XXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wOWqn+EAZZ7317oUrwJbDkD6fh11WKF6IR6078s/7WA=;
        b=znn7TWPk2uEYlSbMjmN5BfFJdAW8rnNZpc+dwN68SEdzW1dLiyguk+idwuKJALAOXj
         R26Iu6k8auerKC3dyjN19e0fPclLxXBe3+2IQ6KYdetW/uEfqMlCcZ87L646EZoxDu1R
         2ATiQV1tC93fNimEiEEpJKTbLxYmFfDuzPSfccjp1jZ5RWOdMnU0zKu76tmfKLkMGkzC
         Cs91Xg3i3aQBExv5vR8P+XWqNx/i316l/Poz9aNErXGWIbNDqh5pllNo22A/haB/7y1W
         uTQaLtZH3OZ379mFYagGYCInu3WD35xmkj7r0etDnz8YZz0lC8utFA7ubcZGi9oiGQuq
         A2fQ==
X-Gm-Message-State: AO0yUKX9pUqn+ngRt+HVzAxKXc+oF1oC88dhp+gnMcDIp635RV5akley
        J5JOeUPbjOMR4kOkwk85GH+lYSvqmgKDa+x3pIhxdd8q322aGA==
X-Google-Smtp-Source: AK7set/2dwXd27/U0AMPCISzGm1O92AqYnl1I5+rauxbdw0/k5w5/se5XXm5tw7BKylzYbe6fJl/WoCPFr2mH7EUQXo=
X-Received: by 2002:a0d:c185:0:b0:527:3e8:5bab with SMTP id
 c127-20020a0dc185000000b0052703e85babmr358791ywd.306.1676886822812; Mon, 20
 Feb 2023 01:53:42 -0800 (PST)
MIME-Version: 1.0
References: <CAA8EJpqrHuTaN-bB6XoB7ZWNvfggNtMts3bBQwqMH8RpO1E3QQ@mail.gmail.com>
 <81448efc-5b77-5022-5b9f-3b5188509068@linaro.org> <875ybw513n.fsf@kernel.org>
In-Reply-To: <875ybw513n.fsf@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 20 Feb 2023 11:53:32 +0200
Message-ID: <CAA8EJpr4C=Rvq_uUVdC00KX70DMLcWHWuFOYfNn=fXzHdfXasg@mail.gmail.com>
Subject: Re: ath10k-firmware: WCN3990: Add board file for the Lenovo Yoga C630 laptop
To:     Kalle Valo <kvalo@kernel.org>
Cc:     ath10k@lists.infradead.org,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 20 Feb 2023 at 07:59, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > On 07/10/2022 15:22, Dmitry Baryshkov wrote:
> >> We'd like to ask for inclusion of the board file for the Lenovo Yoga
> >> C630 laptop. It is
> >> a WfA laptop using the Snapdragon SDM850 SoC.
> >
> > I noticed that you've updated the WCN3990's board-2.bin, but this file
> > was not included. Are there any issues with the submission?
>
> It's just that I haven't processed the pending ath10k board file
> submissions from the list yet, I do it quite infrequently.

Ack, thanks. I saw an update of wcn3990's board file in linux-firmware
and thus I wondered, what happened with this submission. Please excuse
me then.


-- 
With best wishes
Dmitry
