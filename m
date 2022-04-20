Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 273DE50933F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Apr 2022 00:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345330AbiDTXBl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Apr 2022 19:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbiDTXBk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Apr 2022 19:01:40 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE7217046
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Apr 2022 15:58:51 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id s21-20020a0568301e1500b006054da8e72dso2126453otr.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Apr 2022 15:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=D/sEi/2+cVqpCIq91LcVmWCZlF+pWsMqa17bfCQo3OU=;
        b=hCDsogPxydJMDkQ7gKztLKAEpi3v1TiAqC/NcA4UkhO4iJYHUO6SZDdqSxQwpv2H5j
         B0ZNeLFb4y3Bjtm7hPANo7XuEBdttK8x00YkOmhPzTxB/oeoUYgssEUDBzHanAgDxhOC
         x3fBBNGIdyLbaTTGWNeT9EySdGmM5ZGB6VmPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=D/sEi/2+cVqpCIq91LcVmWCZlF+pWsMqa17bfCQo3OU=;
        b=GltOBlO/qNDq+IvYHXohznxQqj2/JTe2jnZ8TF2QayrckwIGzZBLl9PScHiefV+w10
         RvAWx6ZGodzOUQN6B9pOlR2ze/4RKF+6uMp/FM6nTIYh3o12undlYy8OO/WedENJxasO
         IJfF0HKjChaEgWZVWmW5784XVfqbzaKwkmXCfWy3Lf74q7dM6AxCdhan3NyV3UenLgzt
         YRaDI5+3PSjJHy/CcgEgcPHK8qJOYIvHPZ9X8B1u9pStWjtMsXD/aBRmna6jtj9qnUQw
         Rti/rN9Ty8Ly2szoag4tZ+4Bz0rCPqyYW/mqKbkaXk8ezuGdI8nWwvfhLYQU6ZaLTRkA
         TQ5A==
X-Gm-Message-State: AOAM532ih5VcaWynaeyZtz4iiEntYYaZrlvIy6gafUm05uMHvhRFZDnC
        1rZ0ER1nQwaJG3cGXPYqGT9OS5BH+wpa69e7B+o+cw==
X-Google-Smtp-Source: ABdhPJxVwjd5x5zLGqJQIHe9mf25daLALtOL8ozyt8Hvub9dABrVZsKj8sNwp81VZNO9erWnf6HfF7+CU1PIT/aikfw=
X-Received: by 2002:a9d:b85:0:b0:5cb:3eeb:d188 with SMTP id
 5-20020a9d0b85000000b005cb3eebd188mr8524679oth.77.1650495530519; Wed, 20 Apr
 2022 15:58:50 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 Apr 2022 15:58:49 -0700
MIME-Version: 1.0
In-Reply-To: <02d31565-4ae4-a319-30b0-76a6e4917f6f@quicinc.com>
References: <1649280493-4393-1-git-send-email-quic_khsieh@quicinc.com>
 <625ce8a0-4e25-5513-5599-c1cdebf5a3a5@linaro.org> <09fd563f-4a2c-f670-51c2-0e5ff023816d@quicinc.com>
 <CAA8EJpqzucFGf8ndDi2LZqtKiOt_w=_h1oPAUNVCdmUyh_3+zA@mail.gmail.com>
 <2039ef97-4fdb-bffe-1e02-18ae79c18be4@quicinc.com> <27bb2732-b322-75b0-3883-773e6eb4b1b9@linaro.org>
 <02d31565-4ae4-a319-30b0-76a6e4917f6f@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 20 Apr 2022 15:58:49 -0700
Message-ID: <CAE-0n51F+S4a2mQoyWa-TpJcd73hstm2Sh1uO+4T_75UaWQASQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: enhance both connect and disconnect
 pending_timeout handle
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org,
        daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
        bjorn.andersson@linaro.org, quic_abhinavk@quicinc.com,
        quic_aravindh@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-04-15 17:06:48)
>
> On 4/14/2022 4:34 PM, Dmitry Baryshkov wrote:
> >
> > I'm not sure how should the driver react if the client doesn't disable
> > the output, but then the sink gets reattached?
>
> I do not know that either.
>
> But it should not happen as long as framework response to uevent.

In talking with seanpaul@ it sounds like we can update the link status
to BAD with drm_connector_set_link_status_property() and then put it
back to GOOD when the link is re-established. This way userspace will
know it needs to retry the modeset. Does that help here?
