Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3D02852B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Oct 2020 21:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgJFT4I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Oct 2020 15:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgJFT4I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Oct 2020 15:56:08 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7F7C0613D2
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2020 12:56:08 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id 7so8587018pgm.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2020 12:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=S8eSQwblG7magE2M9UvC+xcdzDuh3S8sxyEB62q5+1g=;
        b=le2hYmKsGwWNwVqNSwcjcTPzO5cuY3xEgiwXqiqs192Il24k51QSXPpXRaiTi9YzF7
         2rBNS7UVXRPw2mq8UkJlXkVOvAku8ULLpb07fQ1mR+Fwur0ESSIQ9O+PH5yKC5ribbg3
         v4wUZBgjAY/3AoLBWgI0Q8yNTwQiYsny962Og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=S8eSQwblG7magE2M9UvC+xcdzDuh3S8sxyEB62q5+1g=;
        b=cDHUA4Go895dDjNUx3APlZKnljIih0RDWuylxAloiGCOMJR2NqKJtwh4MAPdSHMPJZ
         joNVGZVE5/ZPDB5825C89JuY+K7I18zewhIhWjx6Lkq9zQY2lX98T7l8jBOT0wXYQocJ
         JQefjWbnT9PI4g+HNlFimM8qz4X4kV80j7qpXwZQwnLh6BhUKec7XlCk4+MDFloBeClz
         oTCf6inW7hSKdfY8H0jEFCc6r8fNrh/ZsVyPxFBCjsZPYKqJcd1s4xyDp6tAoLpzV9Qt
         p/+x+TnNihiMN5XB8FVjYuwM+hXUdMI7bHwIKTBn5wW/AO7tCEU2IyqXl3f6xmbisykk
         y1sQ==
X-Gm-Message-State: AOAM530LJFuNXeCXrj7XBnU5ED9+yH2EHdtSTY5hfR4B4alt0sTyFfNv
        ZDDXuTpCIK/xJvTKzgLL3uZHs8KC6EZ7VA==
X-Google-Smtp-Source: ABdhPJwLqp/q9FllU9TkkqAftGyryDVyYi90GLXXKp/ilS3muE/yICdKxs6V2hpbi0Ht/CoKeIQ94g==
X-Received: by 2002:a63:dc04:: with SMTP id s4mr3793212pgg.123.1602014167858;
        Tue, 06 Oct 2020 12:56:07 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id j19sm4524361pfi.51.2020.10.06.12.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 12:56:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <717f90f2-4148-9fc0-c772-13f101f916a8@codeaurora.org>
References: <20201003222652.32671-1-khsieh@codeaurora.org> <717f90f2-4148-9fc0-c772-13f101f916a8@codeaurora.org>
Subject: Re: [PATCH v2] drm/msm/dp: add opp_table corner voting support base on dp_ink_clk rate
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
To:     Kuogee Hsieh <khsieh@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run
Date:   Tue, 06 Oct 2020 12:56:05 -0700
Message-ID: <160201416564.310579.6502664088674731743@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2020-10-06 00:31:41)
>=20
> On 10/4/2020 3:56 AM, Kuogee Hsieh wrote:
> > Set link rate by using OPP set rate api so that CX level will be set
> > accordingly based on the link rate.
> >=20
> > Changes in v2:
> > -- remove dev from dp_ctrl_put() parameters
> > -- address review comments
>=20
> This needs to go below '---' and should not be part of the
> change log.

In drm tree they put this above the triple dash.

> > diff --git a/drivers/gpu/drm/msm/dp/dp_power.h b/drivers/gpu/drm/msm/dp=
/dp_power.h
> > index 76743d755833..7d0327bbc0d5 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_power.h
> > +++ b/drivers/gpu/drm/msm/dp/dp_power.h
> > @@ -102,6 +102,6 @@ void dp_power_client_deinit(struct dp_power *power);
> >    * methods to be called by the client to configure the power related
> >    * modueles.
> >    */
> > -struct dp_power *dp_power_get(struct dp_parser *parser);
> > +struct dp_power *dp_power_get(struct device *dev, struct dp_parser *pa=
rser);
> >  =20
> >   #endif /* _DP_POWER_H_ */
> >=20
> > base-commit: d1ea914925856d397b0b3241428f20b945e31434
>=20
> ??
>=20

This commit is in linux-next as d1ea91492585 ("drm/msm/dp: fix incorrect
function prototype of dp_debug_get()"). Seems fine.
