Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6D340B7AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 21:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233640AbhINTNj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 15:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233470AbhINTN2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 15:13:28 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F09C0617AA
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 12:11:58 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id n27so743172oij.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 12:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=BSSwT7oxjsgFOMu+1NGwhgQtpViayCWoOwG64CMoBRk=;
        b=hDSs206v3195Y560qB95htiH1r7XdiqlWoYYGIMmZKsme0wdt3U7Hl0DEmzORETQAl
         oY7mro96c7tw05FWPje4aYkbJ+sv5WycBN3Nw5uuG+YACDPdMvZNHwpOSPLMWJ5tSv7Q
         K57nIq7SsAR9mAnQlW2a/GH3wsihNJPESaOnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=BSSwT7oxjsgFOMu+1NGwhgQtpViayCWoOwG64CMoBRk=;
        b=JYFdbTi5AhE7glPxu7fYbk+igquWRxSJhSMWv3VDbEvyJ8vwp3tnvysikwER+Ob4eJ
         4nXV8JvfrWxIZr2USi2w9HfpX0SlhuuMD+CEcuY93ft6advfNeSg1FsFBP/HcecKuYZL
         ylJ8D2WmMsQ11N8byqIcCYSwuVCiBK1ZguypxWkIU2CmqlMVgj8bhj6lGcSif7/6RPgs
         62Fk54niA1+beA3JFwltQ+/5wbV6WS9uxbEgj9JtoQ+/zQ0F9/m96gM6GVdgZpTuaOng
         OV+3KhjR/R3x4vxSohqbWkTM596NoVB9ptYVrN41NKfi5wqsaNi361crwGGEo2O92U+b
         6IlQ==
X-Gm-Message-State: AOAM531dQ0kFsLqR24D1JsegK+lxr2l9E/5Qnt0MU3Nd8MdRLy3UuYZA
        XXHvBB/2fWDHHIUMvbLpYbuj8uNmVA3qypDba54Wtw==
X-Google-Smtp-Source: ABdhPJxj/G3bL5HF0hTnBTg2JQFv34CpmMFfj/HJPwzL7skUSH+a239+sjhTD9p4IGQVFNxccYFtNL83KeC+Bp7Fvi8=
X-Received: by 2002:a54:4419:: with SMTP id k25mr2725351oiw.32.1631646717560;
 Tue, 14 Sep 2021 12:11:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 14 Sep 2021 12:11:57 -0700
MIME-Version: 1.0
In-Reply-To: <20210909135838.v4.1.I1116e79d34035338a45c1fc7cdd14a097909c8e0@changeid>
References: <20210909210032.465570-1-dianders@chromium.org> <20210909135838.v4.1.I1116e79d34035338a45c1fc7cdd14a097909c8e0@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 14 Sep 2021 12:11:57 -0700
Message-ID: <CAE-0n53Pp1F5dZRk98WT5+K9jz_XpMkKUvYAs_suZFaOE0K39w@mail.gmail.com>
Subject: Re: [PATCH v4 01/15] dt-bindings: drm/panel-simple-edp: Introduce
 generic eDP panels
To:     Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linus W <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        Steev Klimaszewski <steev@kali.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2021-09-09 14:00:17)
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-edp.yaml b/Documentation/devicetree/bindings/display/panel/panel-edp.yaml
> new file mode 100644
> index 000000000000..6a621376ff86
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-edp.yaml
> @@ -0,0 +1,188 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-edp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Probable (via DP AUX / EDID) eDP Panels with simple poweron sequences

Should that be "Probeable" or "Probe-able" or "Detectable"? It's not
about statistical probabilities right?
