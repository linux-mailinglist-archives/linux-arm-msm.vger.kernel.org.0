Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25882225C51
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 12:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728077AbgGTKB4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 06:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728007AbgGTKBz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 06:01:55 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AA5AC061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 03:01:55 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 1so8815278pfn.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2020 03:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IBVdyP/pegZa7dgnXrwm5PyIQ+8xTCyFcnvPtdN5UVI=;
        b=uEn13EOKkQKFmK34APcGHbkL6i0Bc78BZn67EQvfn41Fc9a/MMheX8xL7adrdOlRhe
         hA2C2jqTAw/OZQy5HoNYNIepnDobJJplfM9mycMWrip+JIS2XLNFGzIzAkuRh7ZUhaG8
         y3q1VEXw7Cn2jnWMWlkYLFIpb7vCyn0pJ33WI7EQYk3hsxdmVtgX94P5euF9A6tqDoUy
         fwdDQqX4/TzfjC/i4+SRlySFWwVcW1jE+qt8KCTytCVjIiEMnvJzZtfSBYFKDvA8QMk1
         h9tKOxaoLTZRumfefxVu+hY8zE/HdKWaHTcyuBxVMhuwcc6fx/+CCeheDEyf3gKcMOxQ
         qvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IBVdyP/pegZa7dgnXrwm5PyIQ+8xTCyFcnvPtdN5UVI=;
        b=o6BN5nS3jQyI3eZp381N8xLdBj2O/csti4Ah6RnSWrZCjGehMY3ufrh4N4ZXtjFByY
         OESPa6an8bQDQtdVX1LDJIPohKcrn1VFlDdECLY/4l9smCVlRrpgfPDGuwkPP08LVWaL
         MTsE73FyplLz0hqIS+rSOuvALWoWACTg1mRO/Ju5pPT5yWB1pRtjm0th1LPq1xAZWyED
         zctr/Odz972Xdlydolj+nlNcVrcy+SBApl6XFQLf+/TuGlfz87VmNJxJcdF7l51i7cvR
         V6ES7fxi38+Pkx0e63S6br26LAijataEhT6Cp+zxnIlTT4q7DI1zWhFH/v/EpoVHnD3/
         gohw==
X-Gm-Message-State: AOAM531eVurwhSnNv5qJ5Ee+I5OF9xuSwBmhZGoLoxFlj0PeBn4DRxDP
        6gFwoCwnOYmmW8QNMbclFGkpLQ==
X-Google-Smtp-Source: ABdhPJzhEikt8tP6/CpS6b+B437wPhrsq9S5Jz+w2SuVdMMdAy5NITpEubsktWnoJlAezd0lmVwv8A==
X-Received: by 2002:a62:cd89:: with SMTP id o131mr18638388pfg.195.1595239314908;
        Mon, 20 Jul 2020 03:01:54 -0700 (PDT)
Received: from localhost ([223.179.133.67])
        by smtp.gmail.com with ESMTPSA id g8sm14821824pgr.70.2020.07.20.03.01.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jul 2020 03:01:53 -0700 (PDT)
Date:   Mon, 20 Jul 2020 15:31:31 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
        saravanak@google.com, Sibi Sankar <sibis@codeaurora.org>,
        Jonathan <jonathan@marek.ca>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 0/6] Add support for GPU DDR BW scaling
Message-ID: <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu>
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15-07-20, 08:36, Rob Clark wrote:
> I can take the first two into msm-next, the 3rd will need to wait
> until dev_pm_opp_set_bw() lands

You can base that on a8351c12c6c7 in linux-next, I will make sure not to rebase
it anymore.

-- 
viresh
