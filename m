Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2031A8C7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 22:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633131AbgDNUax (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 16:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2633129AbgDNUat (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 16:30:49 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD288C061A10
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 13:30:48 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g32so425218pgb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 13:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=fSEFHqlQPWjh+eO1zQvk6FlxgyhPbRWA0nRwzXY+ICo=;
        b=DI0GDNcWCaSKUzojr44APUQ2g87h7tlXam1IW/LVnZhwiGN7iX2KJtlZI5R+UiNDfu
         DZF+uvx/5gEssBaQxrGn4yJQ3UomR6yu12eYC9INAa7bhWe6L3xj6e4qV1jmHXr+apyW
         1Br2PWFOsLPo73h3of8BD4ggO6KRXWFIckqv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=fSEFHqlQPWjh+eO1zQvk6FlxgyhPbRWA0nRwzXY+ICo=;
        b=lwjpRe087rhBF/OvEmQKwyrkEfNl7K22NqTtilqWV9pc9xELJnBQa2UD7ISg/5TC9p
         PG2mKkZ53HgnbvW4IJ0KUyNBMtEKMSfuKzcqC9nv0yV/PpNYefWUVgv5fgVzS/KXE63P
         pSQr5nzdhCNj3GT9ubc10Cd92ysut0VYBimwFh8wckqcuCuTIJf1AVwFjk9bAs9WGxgz
         /ZRsNczJuZVvsllXFi9X9WY2BFlHr2raIyezOAdhQBLGfOvyecPg6XCdWE/6Dimgsr9V
         rAVF7fHk14k658R1Fm6fGi9ZK9DrRIht4xL9NJ69bOYToBEcMP/iQuhqnUGzXWzsAhJn
         uZGw==
X-Gm-Message-State: AGi0PuacrELbLfP9bxOcdbwTmdrpvI+F6DgtIAeVas+p7OwNrB6dKjKL
        Z0bzutn73asposAGNK9nS/hm6FWrPhQ=
X-Google-Smtp-Source: APiQypK7j30AyIlG7FThLusdHeZXiMK6nQsQdNpWtZSQ6V+9S0RcjrpG2nccWcW5xJlP3E2y/EjX+A==
X-Received: by 2002:a62:27c2:: with SMTP id n185mr24066849pfn.203.1586896248214;
        Tue, 14 Apr 2020 13:30:48 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id m3sm11025978pgt.27.2020.04.14.13.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 13:30:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1585718145-29537-2-git-send-email-sanm@codeaurora.org>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org> <1585718145-29537-2-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH v7 1/4] dt-bindings: usb: qcom,dwc3: Introduce interconnect properties for Qualcomm DWC3 driver
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Date:   Tue, 14 Apr 2020 13:30:46 -0700
Message-ID: <158689624666.105027.3280804524840557421@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2020-03-31 22:15:42)
> Add documentation for the interconnects and interconnect-names
> properties for USB.
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
