Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADCC04D227F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Mar 2022 21:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349290AbiCHU0P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Mar 2022 15:26:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242196AbiCHU0P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Mar 2022 15:26:15 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D31B50E1D
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Mar 2022 12:25:18 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id i5so508722oih.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Mar 2022 12:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=oDPDk3UmBsVk40ec9UZG1guo+bgLJlbyhqOvTa87J18=;
        b=ZEU3s/iBsPE/dcbZEncVtRdgyz4R+oUlZ8IFZd75aCfzqlFSkSNyCjKiT+LTsfYBHl
         Cm9iCylS8NjPhmqGyLleWV/AlIuLHWBBjfRO9YzBSGOiL+HUUoYiriTtZCjxZs0k6RSS
         JHDC2KWjdYFrWraKvKeVS8XH3ypl7yOLBoubU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=oDPDk3UmBsVk40ec9UZG1guo+bgLJlbyhqOvTa87J18=;
        b=LiomUHXfR+2alRfCQYbxT6TMaxas1empfLJjlrIsjiUBesEZ9Cuc3/+3HY42uLP42S
         JK813bNDSaH1PPM8O7WSKPUjKQHMFMBPvDeuYHBItCu/+TNy3T+gVu9Gn1IjciBvehLD
         1FNBrEPPxlsw+prwmbI3SPfY+UTsp0LXE7K5u6WN8Gytarcw5YeWPBmwE3rDdAUWZ5ZT
         nZcA8VCGhyIPyiCGlW3nN4ZFtEMobZ7z0Y2scDRP4nmVoUCpAWPBy+WXPjG/f79tKfuF
         lYJUnkyMbU7SmSBZAOVlriJPqwKVlpmyu/T88LXmdjZV9vS5SlOUeiNZ1N8VG5y94qOe
         qMbw==
X-Gm-Message-State: AOAM531dCOVq0bsUlMQX9qldQLJHm0uCnCHte/xMtCuV4lmMea23qhaD
        7MrWde9NKwr91vYIpIzlszget4rbqq9CU0v+Tn7ggw==
X-Google-Smtp-Source: ABdhPJyfkvCfjSZ//u1fwsUJLWTGqZE5hW7zbIbFOcJy9M5AYS6WsphZTeYWH38/SUWdTsorovwAZS/YNjiEUrd/bVU=
X-Received: by 2002:a05:6808:220d:b0:2d4:99cb:3849 with SMTP id
 bd13-20020a056808220d00b002d499cb3849mr3846554oib.63.1646771117701; Tue, 08
 Mar 2022 12:25:17 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Mar 2022 12:25:16 -0800
MIME-Version: 1.0
In-Reply-To: <20220307133105.GA17534@kili>
References: <20220307133105.GA17534@kili>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 8 Mar 2022 12:25:16 -0800
Message-ID: <CAE-0n51by--BL=+12LtVKRY500Y_c4tZHai--bVvMERGNaUg-g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: fix cast in adreno_get_param()
To:     Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Rob Clark <robdclark@gmail.com>
Cc:     Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dan Carpenter (2022-03-07 05:31:05)
> These casts need to happen before the shift.  The only time it would
> matter would be if "rev.core" is >= 128.  In that case the sign bit
> would be extended and we do not want that.
>
> Fixes: afab9d91d872 ("drm/msm/adreno: Expose speedbin to userspace")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
