Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 088654B7D44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 03:21:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245757AbiBPCCK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 21:02:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245754AbiBPCCJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 21:02:09 -0500
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B13A7CDC2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:01:57 -0800 (PST)
Received: by mail-oo1-xc2d.google.com with SMTP id r15-20020a4ae5cf000000b002edba1d3349so876040oov.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=6Wmbu3EJTHz1mNI3CkkV4P0E8zKS2lBcLvhz8h1rG/s=;
        b=kE+NAUbJwM+UndQVoL3vCSB0zGnXd2EIJtE1hcSIeXu8C+PBIO/aeF1Gm0Td2qWuw4
         XYYdOl/rc+lvtXjcBK1uZNOAaKiJVHEObDo/QCjOJDF7HZOLrkpFeY6at9diZvEDsPTC
         6fMp3v7z7u2FUh6HdKHKhFpNni6FLI06GdY0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=6Wmbu3EJTHz1mNI3CkkV4P0E8zKS2lBcLvhz8h1rG/s=;
        b=0HkQZ11TwUj6X38i/pC5KIH2wUIPTsRM5+b60rqp2HoRKX4icUVynLQHYuaXE2kmhQ
         exb+D8WOt7U6iZcUJygaR0pq0/GuRgpLYBKg3hdgJrCszxxDnykvxiFEMpROAwhqYScx
         X24VqY/eB2YHgUFrq2xhkwxIJuLmxx0szFM3T7MgqVx5WCpJh48shkH0WoQuZwhe00ZO
         GatkrGqjF9PFIP/I+ApFs69UYPpS+ngTrfTZA7cUeG5ctajgJSghRTzx0tNhlp0Z3pTV
         82IhwQv02zSyDxgJ14KK2LxOmYX61Apn2UgPyc8G/ekXhp8LcBZbaM4z8FVIwvQPjFQk
         qqUQ==
X-Gm-Message-State: AOAM533gmlhGeJcD2334CjWwp3zNlMv7FZJHleJ1iJl1FW+zCh5N77J1
        DrJLFi+mLpE6lozVtjZhiRJxllp92zk2gCm0BmNOjQ==
X-Google-Smtp-Source: ABdhPJwyPrbG3vOYY4Y2pjmlb3uTOssMjvoo873FPyIiobvt4UggvDXlixGwmrkAC22KDEsUvZPcsCX7qtF8dAKGDzo=
X-Received: by 2002:a4a:d58b:0:b0:319:8746:ac3e with SMTP id
 z11-20020a4ad58b000000b003198746ac3emr208922oos.1.1644976915579; Tue, 15 Feb
 2022 18:01:55 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:01:55 -0800
MIME-Version: 1.0
In-Reply-To: <20220215145306.3470924-1-dmitry.baryshkov@linaro.org>
References: <20220215145306.3470924-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 15 Feb 2022 18:01:55 -0800
Message-ID: <CAE-0n51aBW9NZWqH4FQsK7_Uif1JtbORdrVXVz1p10c-b+Mb2w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: drop unused access macros
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-02-15 06:53:06)
> The access macros BLK_foo are not used by the code, drop them.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
