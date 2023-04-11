Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24F686DDEAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 17:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbjDKPAW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 11:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjDKPAV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 11:00:21 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D7EE40DD
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 08:00:20 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-2efbab42639so250800f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 08:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1681225218;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=awm8MnBZWQeYrHUa4M70YpMyHvHuMHPUMhFQBi9C4Bs=;
        b=SICKFl4fIBpQpsKbkE9BdElOQjHEiHx3kHG2ZpeFU+bwc0N6XkEwp5EqpejRXs2/wn
         G5vNH/shTCUFDs0PlKSVCnpaoHBMwB6yfp5YNYcpRXn3WVPd5YJIEl6utXp0Tm8K1+DD
         8sEXsSlPE9RyNnOi9dBpyUbGjL8+sN2t9E5oY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681225218;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=awm8MnBZWQeYrHUa4M70YpMyHvHuMHPUMhFQBi9C4Bs=;
        b=WjhpuA5Xx/7P2v+gVmkzPGQCnPLA+pqKP54vDF9RNJsO9PgAgjHN9I9XUIgzMSL9Cp
         Ps9PHUSOM4B6vwgXnEyww4YikyHDf/Y0ei8GKMF2PJgDpBXoVwWLgg8uO1dHOIdNCVV6
         D9G7nmCrs9kDrtpbyBx/WSFHzOWcqF3NZGj5FlNiDF83RJhVdHlMX1OgWCGJQ20YsiKj
         Jqv77JuBAtFRT9/ZrSSOO7SS0BiS5J8AUZf0pU1UNFXn/5INCHAdAD9udmfjEhubTy9K
         /VlKy4LPVoJz4UuTkCXhL2QP7RlekdP2BzAILF/AX/QpNsqnhtrOuScQiW+2efZL0+YY
         tmLg==
X-Gm-Message-State: AAQBX9dGGS17WSwEdbtuXNZgGFQPXw+pC1l3yjfk9p5AjBfJHnTEjmjq
        6JNNYDnt7tULBBZyUuh+q3ashQ==
X-Google-Smtp-Source: AKy350anHcfa5UPIMiYKDsfon+Km4Zw9suTE5cOz1tp9k5ddtyzZTjEgWevnHU65JXD7zT5U9kbwiA==
X-Received: by 2002:a05:600c:3b06:b0:3f0:7652:dbb8 with SMTP id m6-20020a05600c3b0600b003f07652dbb8mr7993397wms.2.1681225218636;
        Tue, 11 Apr 2023 08:00:18 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id s9-20020a7bc389000000b003ef64affec7sm17176942wmj.22.2023.04.11.08.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 08:00:11 -0700 (PDT)
Date:   Tue, 11 Apr 2023 17:00:09 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: Re: [pull] drm/msm: drm-msm-next-2023-04-10 for v6.4
Message-ID: <ZDV1+T9n4HCPnfUM@phenom.ffwll.local>
References: <CAF6AEGvwuj5tabyW910+N-B=5kFNAC7QNYoQ=0xi3roBjQvFFQ@mail.gmail.com>
 <ZDU2ASmAWEL0yjrc@phenom.ffwll.local>
 <CAF6AEGsLnPempzs1nCEKc4hNF54A_e5eG0gi92hyMd-y3_b3Sg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGsLnPempzs1nCEKc4hNF54A_e5eG0gi92hyMd-y3_b3Sg@mail.gmail.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 11, 2023 at 07:55:33AM -0700, Rob Clark wrote:
> On Tue, Apr 11, 2023 at 3:27 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > Konrad Dybcio (18):
> > >       drm/msm/adreno: Use OPP for every GPU generation
> >
> > This had a minor conflict with refactoring from drm-misc-next, I went
> > what's in your pr. Please double check I didn't screw up, but at least it
> > compiles :-)
> 
> Hmm, am I looking at the wrong thing.. the conflict I'm seeing is with
> drm_gem_lru (and looks to be correctly resolved)

Yeah that one was trivial. Unfortunately git does not report anything if
you only keep one or the other branch entirely in your resolution, so the
only way for you to see the conflict is to re-create the merge :-) Or at
least my git foo isn't good enough for a better way ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
