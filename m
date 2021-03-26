Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 031F4349E88
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 02:19:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbhCZBSl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 21:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbhCZBSM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 21:18:12 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80DFDC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 18:18:12 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id a22-20020a17090aa516b02900c1215e9b33so3451264pjq.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 18:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=5ts/RtyuvkHpm/aA3JGUt0XeKOCBsewX4r2/UWxoyMk=;
        b=C2Hp3QTw+at15Yc0qkvzRwnuupxjw7MHsXDJcalOSP7wGEYiPYxIvuPCc3Yr+73uSs
         cgqCeUcenmI0nmkWDh8ffPJOGE4kaYM9BU8LMlONV1KuH9dK86blW4LWs5PrvHdqIP2i
         z3r2kWduHkrjU205YLglHR5krdVQipu0sahUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=5ts/RtyuvkHpm/aA3JGUt0XeKOCBsewX4r2/UWxoyMk=;
        b=doe55ELqjXdMQrManV7qfoAS8v0N7kpcmsfM3hRwOdf/vNNsJKFg9EmSFpcD5UDDRZ
         GPwwifGnbUBCxY69wR1D9N0ml0gUjxaQr6CFJ9i8xZN/Q/hKwkQ3Yo1kE8sUBYY7H/3U
         xGju71Of3mB7y+bfN6ZIcSVETzsxr2Ol566OiroNE0UM4tB5ngu9RKouOD0uVRaz3/Hk
         sHtvvOPVb5Xa8gRf/LiZeH0UV0kIq/ephPJiVTJ+p4I7MvzVuBf/KjKTRNllKHvoZaHz
         t+cdMfyXy1ww/MvlYZbj/YKkVUFGZlSpnVkeoYC6jNDbHLUZ+aAzP1IxXha+lhiipIri
         rNxw==
X-Gm-Message-State: AOAM530LNZk407ebzKkEVkXqelE23ClohhQktrh2MiAl2t5U+wYcy3SP
        i/wU/SYvnqEnWoAAe82ihLNYwQ==
X-Google-Smtp-Source: ABdhPJzQbzhz8f8RBWBsiitzK/bL5vn/22BaGgSH1dFDjUggPfNgRexnbKOxTQvknlSNauRW7o3Eag==
X-Received: by 2002:a17:902:d486:b029:e6:f007:706 with SMTP id c6-20020a170902d486b02900e6f0070706mr12760096plg.83.1616721492156;
        Thu, 25 Mar 2021 18:18:12 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:18a3:238:26c5:1521])
        by smtp.gmail.com with ESMTPSA id cv3sm6790946pjb.9.2021.03.25.18.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 18:18:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1614971839-2686-3-git-send-email-abhinavk@codeaurora.org>
References: <1614971839-2686-1-git-send-email-abhinavk@codeaurora.org> <1614971839-2686-3-git-send-email-abhinavk@codeaurora.org>
Subject: Re: [PATCH 3/3] drm/msm/dp: delete unnecessary debugfs error handling
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, tanmay@codeaurora.org,
        khsieh@codeaurora.org, dan.carpenter@oracle.com
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        dri-devel@lists.freedesktop.org
Date:   Thu, 25 Mar 2021 18:18:10 -0700
Message-ID: <161672149027.3012082.2392067140198433025@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Abhinav Kumar (2021-03-05 11:17:19)
> Currently the error checking logic in the dp_debug module could
> pass zero to PTR_ERR and it causes the below kbot warnings:
>=20
> drivers/gpu/drm/msm/dp/dp_debug.c:378 dp_debug_init()
> warn: passing zero to 'PTR_ERR'
> drivers/gpu/drm/msm/dp/dp_debug.c:387 dp_debug_init()
> warn: passing zero to 'PTR_ERR'
> drivers/gpu/drm/msm/dp/dp_debug.c:396 dp_debug_init()
> warn: passing zero to 'PTR_ERR'
> drivers/gpu/drm/msm/dp/dp_debug.c:405 dp_debug_init()
> warn: passing zero to 'PTR_ERR'
>=20
> Debugfs functions are not supposed to be checked in the normal
> case so delete this code.  Also it silences the above Smatch
> warnings that we're checking for NULL when these functions only
> return error pointers.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Nice cleanup!
