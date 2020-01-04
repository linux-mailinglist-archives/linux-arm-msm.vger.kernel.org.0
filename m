Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14290130490
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2020 22:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbgADVO4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Jan 2020 16:14:56 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:45804 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgADVO4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Jan 2020 16:14:56 -0500
Received: by mail-il1-f196.google.com with SMTP id p8so39349638iln.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jan 2020 13:14:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=l6WjYhwErffAfIJqKX4almlPavimz+egXrq1mO0xKZc=;
        b=HA8vue3qYNBm3QqS3RJjtV5+vjl0T4rmye0LJqiSoBd+KeCQeSsWgrn8E7IufkDy7f
         FfxZAqnI9+e9fJhlHb1PanTXz46On6FDX5t1H6Lng4XR+5rjNZXs1f2yFbbHVqCh0bvT
         efQbyoqlrD9vX4uuf0Tc0pCtvQlYIZRLxyHYgzIeBEIl5gkK6W4pBWdP2hs5i43VeqdE
         U0ekXma+GXvhr96CsFSsfRf/VEcppX7qiWvJR9Cq05LQca/1lhr5L+egCbJPrYf29OGc
         mFBgNZujUdFdfr6+YpvMLdnq43Nw2ICH2osq9RLBnuOlUCdXBp1gwzpWxp+BSx6j7TpV
         NhbA==
X-Gm-Message-State: APjAAAUYAfkg0PJjmDpYG5QfJXo9tUOdVudeVidFqotlzIadoORknG/m
        FHWvwqbKZas7yT/2b0KGBY1KkNI=
X-Google-Smtp-Source: APXvYqykPz9VW5xlRCJKklT7htqUvS6exJ8ZK8yRWFURb7tUVoVjAN0qfTLCz9TCULMxeXg2pAXLFg==
X-Received: by 2002:a92:5b49:: with SMTP id p70mr78779041ilb.209.1578172495177;
        Sat, 04 Jan 2020 13:14:55 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id t88sm22297434ill.51.2020.01.04.13.14.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2020 13:14:54 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a3
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Sat, 04 Jan 2020 14:14:53 -0700
Date:   Sat, 4 Jan 2020 14:14:53 -0700
From:   Rob Herring <robh@kernel.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        rnayak@codeaurora.org, swboyd@chromium.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        dianders@chromium.org, Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: power: rpmpd: Convert rpmpd bindings
 to yaml
Message-ID: <20200104211453.GA26611@bogus>
References: <20191220064823.6115-1-sibis@codeaurora.org>
 <20191220064823.6115-2-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191220064823.6115-2-sibis@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 20 Dec 2019 12:18:22 +0530, Sibi Sankar wrote:
> Convert RPM/RPMH power-domain bindings to yaml.
> 
> Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../devicetree/bindings/power/qcom,rpmpd.txt  | 150 ----------------
>  .../devicetree/bindings/power/qcom,rpmpd.yaml | 170 ++++++++++++++++++
>  2 files changed, 170 insertions(+), 150 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/power/qcom,rpmpd.txt
>  create mode 100644 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
