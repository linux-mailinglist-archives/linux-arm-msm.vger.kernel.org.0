Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A820F349C3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 23:29:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231129AbhCYW3O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 18:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230486AbhCYW2t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 18:28:49 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB049C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 15:28:48 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so3304470pjb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 15:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=3+XIXDw2KD36Jj9k8kQt3oLJ3qOWy4mgRHMmfppVNMs=;
        b=SfenOcMVlZh+rpAImM9x3QpuhHbZjUchAAzX0oLxZlqxEF8qWlJ8A/K2Ib3XAWORN/
         VA0mRtcUgUjaD/uOxpzfGya3TFp3VT4UnYw6BV2Zo+nvMh4iZ+HpI1jPApVNVRRtNjQm
         jWJXezO+kYWxFnelT6Ft9VEkisauFZdpA1hNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=3+XIXDw2KD36Jj9k8kQt3oLJ3qOWy4mgRHMmfppVNMs=;
        b=knLkL6pCBQKjsefkipnKUXC1hdAz+ZUDhPodL4HWp1HhR9wOCRkaC+Ihq4+6DYACKJ
         fkVLXUMjNplGJ4sZFTQMH3zMaguw/nkJFasYVFq9rB5YkHroIa4NYm+Ry89qm2Zur6qk
         8Ia0Kgn+F5+fO9GNvytkW7g9iZyr2ps39dxmg7tmyS0we3TMqoAEe6Hm0VuJdo1sy+yo
         z+CInUCFWQ4BJtrldl+oszru1Vj7dMyQv+LkY1zQ3UGGR4XZyPIqF1kxm54+ZVR3MJ61
         wkzDrxlsLX4wZB5IdrrhVEWUc1MtfPBaAEnRshHBjedxLW71H81za6SjXtMYlq9upnEh
         GxmA==
X-Gm-Message-State: AOAM532QOBYrwVTmWTOGhnw7wI5JsyOtZ47DnVYTIwuUedG7foph4q+N
        ELSPEUgMUXb8ZSfULVZYElVH2A==
X-Google-Smtp-Source: ABdhPJxhdZwiP5Nsd5WNkle4PByRMGgdPkvQgMvr6Z2T3PE9CYx3qQn8Yyh+0mJ4q0zaCsEWcVyNMw==
X-Received: by 2002:a17:90a:64c7:: with SMTP id i7mr10565274pjm.95.1616711328387;
        Thu, 25 Mar 2021 15:28:48 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:18a3:238:26c5:1521])
        by smtp.gmail.com with ESMTPSA id o13sm7187212pgv.40.2021.03.25.15.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 15:28:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7729c93d-5b9d-8a5f-870a-2b2414c26a72@linaro.org>
References: <1616673661-20038-1-git-send-email-mkrishn@codeaurora.org> <1616673661-20038-2-git-send-email-mkrishn@codeaurora.org> <7729c93d-5b9d-8a5f-870a-2b2414c26a72@linaro.org>
Subject: Re: [PATCH v14 2/4] dt-bindings: msm: dsi: add yaml schemas for DSI bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     kalyan_t@codeaurora.org, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org,
        khsieh@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Date:   Thu, 25 Mar 2021 15:28:45 -0700
Message-ID: <161671132598.3012082.10334649474045103929@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2021-03-25 06:27:38)
> On 25/03/2021 15:00, Krishna Manikandan wrote:
> > Add YAML schema for the device tree bindings for DSI
>=20
> Just a notice, that this removes assigned-clocks/assigned-clock-parents=20
> properties that are currently defined (and used e.g. by my patchset).=20
> However I do not think this should stop this patch series from being=20
> accepted unless there are other changes requested. I can readd necessary =

> properties later.
>=20

I suggested we drop standard properties from the binding. The
alternative is to add them and then we can decide if they should be
optional or required. I suppose if it was required then it would be more
explicit and not surprise anyone who's writing the DTS.
