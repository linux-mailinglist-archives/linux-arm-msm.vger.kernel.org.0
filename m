Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC303180A54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 22:24:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbgCJVYR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 17:24:17 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44418 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgCJVYR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 17:24:17 -0400
Received: by mail-ot1-f65.google.com with SMTP id v22so14656889otq.11;
        Tue, 10 Mar 2020 14:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rMyvrlYZi90RciaFxgPs3D8g4aAObdM9SGu5DftceKE=;
        b=cgIgBxLRL/GFWT9irabvR6mhZSuiifVGLFHa0o2Pqmwr6KlT8kheK++6YSA5QRl2J5
         ZfmGIcgrNqEMwWPoaxq7HELLh2mBfRF1v2kEqj0yZGtbp+FQIeUdy9jcv/8Hz5d7qyMo
         PmgMnDq/Jcc7QYpjlch7jUZc+kogKpdodwu0OvQKK7DxfMOugaxtJOrZZ+zPlvCeHlU3
         E+vm4pENvpwP48VI+umx7Q1iecO7yUzWJ52nYIeXvS1WbiZigb0bgHPWau9NPD3uX8AT
         lNSpnl6aP72EQbZHDSpNM76UIoGH7VLviJgkO5lIBbN4Jp6lXPly3vixmIW9SWaJFNx8
         VHJg==
X-Gm-Message-State: ANhLgQ3ELFG9v5iSsQQOCA5NKLufGE0tCd2BAdJ71MHWeyW6axnvdeSm
        CKacKCWxZNHI5RsZI4lLuw==
X-Google-Smtp-Source: ADFU+vtT87O6/ValNU4002+zt2OEhm5ILV3CuQ5fOpNSeg++uHyZmwRVAgClROx/DQRGEWTFq1ZeEg==
X-Received: by 2002:a05:6830:2391:: with SMTP id l17mr16179319ots.339.1583875455228;
        Tue, 10 Mar 2020 14:24:15 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n6sm1655079otk.75.2020.03.10.14.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 14:24:14 -0700 (PDT)
Received: (nullmailer pid 22188 invoked by uid 1000);
        Tue, 10 Mar 2020 21:24:13 -0000
Date:   Tue, 10 Mar 2020 16:24:13 -0500
From:   Rob Herring <robh@kernel.org>
To:     Vara Reddy <varar@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, seanpaul@chromium.org,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        robdclark@gmail.com, abhinavk@codeaurora.org,
        nganji@codeaurora.org, jsanka@codeaurora.org, hoegsberg@google.com,
        aravindh@codeaurora.org, dri-devel@lists.freedesktop.org
Subject: Re: [DPU PATCH v4 1/5] dt-bindings: msm/dp: add bindings of
 DP/DP-PLL driver for Snapdragon
Message-ID: <20200310212413.GA13839@bogus>
References: <1583367028-19979-1-git-send-email-varar@codeaurora.org>
 <1583367028-19979-2-git-send-email-varar@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583367028-19979-2-git-send-email-varar@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 04, 2020 at 04:10:24PM -0800, Vara Reddy wrote:
> From: Chandan Uddaraju <chandanu@codeaurora.org>
> 
> Add bindings for Snapdragon DisplayPort and
> display-port PLL driver.
> 
> Changes in V2:
> Provide details about sel-gpio
> 
> Changes in V4:
> Provide details about max dp lanes
> Change the commit text
> 
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> Signed-off-by: Vara Reddy <varar@codeaurora.org>
> ---
>  .../devicetree/bindings/display/msm/dp.txt         | 252 +++++++++++++++++++++
>  .../devicetree/bindings/display/msm/dpu.txt        |  16 +-
>  2 files changed, 264 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dp.txt

Sorry for the moving target, but bindings have moved to DT schema format 
now.

Rob
