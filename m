Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 797FD24907C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 23:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbgHRV7j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 17:59:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726845AbgHRV7h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 17:59:37 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AC1AC061389
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2020 14:59:37 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id u128so10628727pfb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2020 14:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=LBK59hoC/QeRiJTHTK+5CDgO+Kpr6UH6snOINOdNcEc=;
        b=dOK2BsUAC+X5cn4UBcaTivDHVHteQhdCDednUL3JgbPE0LOySnHHNp+kxYp4Lv5hFv
         OZtGYvKkoFMin6uNX1fpS5sMdOvPh43Y+szX4VYbJ3utQ2drqua2Q3lYg1+/t+WC0OSP
         Vr0/W/jEqyXLCcSw9VpAABGrGf+ZxjFwXWtYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=LBK59hoC/QeRiJTHTK+5CDgO+Kpr6UH6snOINOdNcEc=;
        b=FI2g/RodERXxEkYjvlR0MKkE+nkcB11z3zT1Flc0qHSN5qQ9nX+eWzn2OHbwjAYvNU
         WBZx0O/iy1bbnrw/jBDx64Op1sR7wtC+UUUUAW/36XYn4QzcRsTe093jBuWEmpPYBm7a
         d95wW5eHCYV4xL0ZrwMtEYpQZ4EzBxTBQNaoJZkWsP7osdCZNXBwOn5h2XbBpiLfztbO
         E7pVtN2s8mkzlZvrjug953q/1ZnAk96v75q+sbTU7D14Ro/AdT9fP3Z7LsDVS6uO05Ma
         HE6qvu4+HVhwX1XDxYKhuVrOfTMMv2aDMvzE4viMOHFkO5ncLp+hvrDSsqSwx6VelIMu
         W0Jg==
X-Gm-Message-State: AOAM533vehnimAVrDmc/9U82VGnPaxWIy8rxC7v9tTREoLlVIl9Sgw9a
        ODLMQfIPUUTARNgVFetHxKsKuw==
X-Google-Smtp-Source: ABdhPJyS57EcdCietirtZsste3Gi4BbiPyYRBoBbKZ4T/VQNq4avYwEZDBCDdLGtQZOv+9ZD6nUmKQ==
X-Received: by 2002:a63:ab43:: with SMTP id k3mr13655112pgp.426.1597787976692;
        Tue, 18 Aug 2020 14:59:36 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id x28sm26049746pfj.73.2020.08.18.14.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 14:59:36 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200818211546.559-1-khsieh@codeaurora.org>
References: <20200818211546.559-1-khsieh@codeaurora.org>
Subject: Re: [PATCH v3] drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Guenter Roeck <groeck@chromium.org>
To:     Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run
Date:   Tue, 18 Aug 2020 14:59:34 -0700
Message-ID: <159778797494.334488.5009772006048435758@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2020-08-18 14:15:46)
> add event thread to execute events serially from event queue. Also
> timeout mode is supported  which allow an event be deferred to be
> executed at later time. Both link and phy compliant tests had been
> done successfully.
>=20
> Changes in v2:
> - Fix potential deadlock by removing redundant connect_mutex
> - Check and enable link clock during modeset
> - Drop unused code and fix function prototypes.
> - set sink power to normal operation state (D0) before DPCD read
>=20
> Changes in v3:
> - push idle pattern at main link before timing generator off
> - add timeout handles for both connect and disconnect
>=20
> This patch depends-on following series:
> https://lkml.kernel.org/lkml/20200812044223.19279-1-tanmay@codeaurora.org=
/t.atom

There's a v11 of this series. Can you rebase again?

>=20
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> Signed-off-by: Guenter Roeck <groeck@chromium.org>
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>

And fix this SoB chain to be proper with Co-developed-by tags and your
tag coming last as you're the sender of the patch.
