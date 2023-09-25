Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD7FA7ADE00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Sep 2023 19:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbjIYRuL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Sep 2023 13:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbjIYRuK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Sep 2023 13:50:10 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D04101
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Sep 2023 10:50:04 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3aca1543608so4515233b6e.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Sep 2023 10:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695664204; x=1696269004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LrNZUYK9GVon3CstC3PAw8y74HnTAoBSBfYauDl4OzM=;
        b=PLobzVaKliHwG+r2YWO73hENA1yrUAsyTU/h9lAFy5hCMYuhBPCLFuzyJDn0oVEo35
         2NuL8BcoSHqKwUDhJY1ahZePrb9yaJ7Hl6HYrxPCuVrQz7nNRmTHc6f6zFFSdu+Unw7G
         lpHY5BJz0LK1Kq0/TpHF7nyWypBj3pd07ViJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695664204; x=1696269004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrNZUYK9GVon3CstC3PAw8y74HnTAoBSBfYauDl4OzM=;
        b=lrY9J6+fGAi3FvOgrdl8i5ZI03ojEcAOm9fnrq7/BuZ43ZR4x9g49S/rW3cn7nhPj9
         g17Vxi6iJdyLcl6crWFFvWBH/anxRdJgAa7RlA4rck5pLDBQ3MbfbGRih4U9BgPQUSZq
         Qu5DTv4tQ5nn+AUYwqOdZ5fxUloIusYEBhi6oVc/Des5QfWrtuE+lzGGBIBDkzidf8TD
         dESIMeDOOoL8Y4MCuEwWQptybxLBix6zpNm5jwP/35gKCcXAvC/AajrKqvNo/8fwHka/
         ocMzhODHers3ahhg1R+CDMvf22bnOYiXJZNrn04IKdgsZgzPujGicY+2lZfTFazvR+pl
         2LPQ==
X-Gm-Message-State: AOJu0YzQMh1TqwVRsSc9JG/T0px6DwcQOT1kxZs2rXIla7qAyvtjX2Fc
        q8FDzNO7V6ahGLJrh5wLDb4oHQ==
X-Google-Smtp-Source: AGHT+IGie+Z/VwhJ6V3LKWh5OI/Dj3Px8pRaI7N33JgrgsWWDGZ81eWlnH9NeD8qxw1CQkfx2CSwHA==
X-Received: by 2002:a05:6808:351:b0:3ad:fcd4:275e with SMTP id j17-20020a056808035100b003adfcd4275emr9044080oie.35.1695664203734;
        Mon, 25 Sep 2023 10:50:03 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id j12-20020a63b60c000000b00577d53c50f7sm7143781pgf.75.2023.09.25.10.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 10:50:03 -0700 (PDT)
Date:   Mon, 25 Sep 2023 10:50:02 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Andrzej Hajda <andrzej.hajda@intel.com>
Cc:     David Airlie <airlied@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        John Harrison <john.c.harrison@intel.com>,
        Andi Shyti <andi.shyti@linux.intel.com>,
        Matthew Brost <matthew.brost@intel.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Emma Anholt <emma@anholt.net>, Evan Quan <evan.quan@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Xiaojian Du <Xiaojian.Du@amd.com>,
        Huang Rui <ray.huang@amd.com>,
        Kevin Wang <kevin1.wang@amd.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ben Skeggs <bskeggs@redhat.com>,
        Karol Herbst <kherbst@redhat.com>,
        Lyude Paul <lyude@redhat.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@redhat.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zackr@vmware.com>,
        VMware Graphics Reviewers 
        <linux-graphics-maintainer@vmware.com>,
        Melissa Wen <mwen@igalia.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, Le Ma <le.ma@amd.com>,
        Lijo Lazar <lijo.lazar@amd.com>,
        Yifan Zhang <yifan1.zhang@amd.com>,
        Prike Liang <Prike.Liang@amd.com>, Lang Yu <Lang.Yu@amd.com>,
        Tejas Upadhyay <tejas.upadhyay@intel.com>,
        Nirmoy Das <nirmoy.das@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        nouveau@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org, llvm@lists.linux.dev,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 3/9] drm/i915/selftests: Annotate struct perf_series with
 __counted_by
Message-ID: <202309251043.2D1F7D08@keescook>
References: <20230922173110.work.084-kees@kernel.org>
 <20230922173216.3823169-3-keescook@chromium.org>
 <b668d521-c8fd-1207-0a65-e1200e7ebb2c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b668d521-c8fd-1207-0a65-e1200e7ebb2c@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 25, 2023 at 12:08:36PM +0200, Andrzej Hajda wrote:
> 
> 
> On 22.09.2023 19:32, Kees Cook wrote:
> > Prepare for the coming implementation by GCC and Clang of the __counted_by
> > attribute. Flexible array members annotated with __counted_by can have
> > their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> > (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> > functions).
> > 
> > As found with Coccinelle[1], add __counted_by for struct perf_series.
> > 
> > [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> > 
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: John Harrison <john.c.harrison@Intel.com>
> > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: intel-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> I am surprised this is the only finding in i915, I would expected more.

I'm sure there are more, but it's likely my Coccinelle pattern didn't
catch it. There are many many flexible arrays in drm. :)

$ grep -nRH '\[\];$' drivers/gpu/drm include/uapi/drm | grep -v :extern | wc -l
122

If anyone has some patterns I can add to the Coccinelle script, I can
take another pass at it.

> Anyway:
> 
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Thank you!

-Kees

-- 
Kees Cook
