Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDCD06D001A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 11:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbjC3JrZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 05:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbjC3Jq5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 05:46:57 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74F378A6D
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 02:46:21 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id j7so22726040ybg.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 02:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680169578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xmf4KluG7S4v5uDGa2+BLs6ltj4TZB+1o0aJASQSOQw=;
        b=vVb5l1v4m4wjbO8U7AUqqFUk1Gu/g0kfn9LLEJKhee21SD8fNp5cFCodGYSDNFcCqf
         gpoh1hYchAtQb9hq+7kNFWLuPhTkb0U5ga9SjY6XVjSCIBA7Fe61TNa6cTCZVRHKq6pz
         TWLBudl5ztNNAYyg5w/Yzj3k4ZLG5FrEB2NggP187wWW+ewZszJ6X821CTlEKaiERCR+
         DKYBCjfSKArSwUlRS/0zxryZc1G0i83F+vbZLv9MH2jeHNZC1RtR/LxR4mdQBQhiSI0A
         SFAK6V9MBXNBvf2Th3XA7+U9/8FkOdQTWtWURDBKk+xn/Zb62kSHHQogy/Zgg1UTD+j2
         Kcvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680169578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xmf4KluG7S4v5uDGa2+BLs6ltj4TZB+1o0aJASQSOQw=;
        b=zaeO+RZ8VIs/yxHdpYMbsnggCIcYRv6kHKWbJWh85l+Nf7Mp11HBm5p2ArHAdrvkSB
         vhv29HiGeMMcK8ykjLCP0YsK0SXMysnl+HOoHIVfR8HbmhDnJvDFaDPwweEyQIJh/Pi0
         9mfIMu1A+ThNmQNLfZZIRBUdJSlWiDU5OOncE11hW3C12BssNVP4gifYTQi8XiWypiD3
         L1HVDB6GKBToeWzlhZxNPknvCg5uCRHTBJungL5PattId8N9WtfW6qBQ+QZE05Ck67AD
         M2jdpT6R9gWyu+3dJKXuC6dVFH7bCjv1h+bY13dCZYQuPam+gkeOHdylX3e0MG2iBXUJ
         0wYQ==
X-Gm-Message-State: AAQBX9dGWwYuUYrF4TXl94CSIZ1QiWpZjTjQK3j2DOeyuYSyPFV9Dncy
        sDvBOPAkKlFRHkxuIoU5XEDG0llfYpOqLpy1THCPt+v6+OniwNFe
X-Google-Smtp-Source: AKy350b25TKNX7LWY6kffjMjteju8c3Wk+7BpFOOlJ9BIgRcXEmR4R10+7PyamjASoryl8edb19Ysr4/N8lgH/tLRUQ=
X-Received: by 2002:a05:6902:1201:b0:b6c:4d60:1bd6 with SMTP id
 s1-20020a056902120100b00b6c4d601bd6mr15558336ybu.9.1680169578520; Thu, 30 Mar
 2023 02:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230330074150.7637-1-tzimmermann@suse.de>
In-Reply-To: <20230330074150.7637-1-tzimmermann@suse.de>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 30 Mar 2023 12:46:07 +0300
Message-ID: <CAA8EJppVCKojseqV8CSpMh2Drqsk0jtH9Mza2PQq9LtN-2Ue1w@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm/msm: Convert fbdev to DRM client
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 30 Mar 2023 at 10:41, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Convert msm' fbdev code to struct drm_client. Replaces the current
> ad-hoc integration. The conversion includes a number of cleanups. As
> with most other drivers' fbdev emulation, fbdev in msm is now just
> another DRM client that runs after the DRM device has been registered.
>
> Once all drivers' fbdev emulation has been converted to struct drm_client,
> we can attempt to add additional in-kernel clients. A DRM-based dmesg
> log or a bootsplash are commonly mentioned. DRM can then switch easily
> among the existing clients if/when required.
>
> I did the conversion from similar experience with other drivers. But I
> don't have the hardware to test this. Any testing is welcome.

Thank you for your patches! It was on my to do list for quite a while,
but nobody had time to work on it.

>
> Thomas Zimmermann (6):
>   drm/msm: Clear aperture ownership outside of fbdev code
>   drm/msm: Remove fb from struct msm_fbdev
>   drm/msm: Remove struct msm_fbdev
>   drm/msm: Remove fbdev from struct msm_drm_private
>   drm/msm: Initialize fbdev DRM client
>   drm/msm: Implement fbdev emulation as in-kernel client
>
>  drivers/gpu/drm/msm/msm_debugfs.c |   6 +-
>  drivers/gpu/drm/msm/msm_drv.c     |  21 ++--
>  drivers/gpu/drm/msm/msm_drv.h     |  12 ++-
>  drivers/gpu/drm/msm/msm_fbdev.c   | 168 ++++++++++++++++++------------
>  4 files changed, 118 insertions(+), 89 deletions(-)
>
> --
> 2.40.0
>


-- 
With best wishes
Dmitry
