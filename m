Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8209E1D592B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2020 20:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgEOSj3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 May 2020 14:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbgEOSj2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 May 2020 14:39:28 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB07C05BD0A
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2020 11:39:28 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id u5so1388428pgn.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2020 11:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=phaOl4UmRtsq7El/zXDiXXLmxp5U/M6vGOmuvPTWkEw=;
        b=XsNVU5IShN9fJKPkoBVuH+Y35AROQc4c4/lXaeXGlGS94mJJcFgEnq1I5NwLej/D/J
         o8cLPSHHchNGnwn6sT6S7OWZlGdC1O5VdQ3NCw4NrrEyCMDodE2BLoQ1px5PTXhTDzKN
         4iDIb8k0OE1A4S7K0K1zWbBp4Smr2GqOlkhj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=phaOl4UmRtsq7El/zXDiXXLmxp5U/M6vGOmuvPTWkEw=;
        b=nfTHJblelkiSfCsAAk4AMNuQrlhB4nBf5L8LQx3/M7/mXDgeXkoYr01I+9U4I9RQaM
         V36EdRZfaVmvlz/IlRu5ZM/r1WEeFnYg9UV103+18lZ0AC4scR4dAVT8gP8WCp0qEZjA
         2fLFxsWXp/2LFKABD4Dwm7/CySS3CdSPp2EwsyNJwYEKj00o59NEZ7Ev/4MB2wJ5VNF4
         FkaMhvYYJb3cckdEWwlZS7ngLegtIrHcM3YVZcYm/AwJ9sNR3lv+fP7kB+fEH/i8ve9n
         GoA+eZWqn/ycRMGMlX5bxNufoy8nlgID7PWzuptNYg7G6Jf5/nnljSfNRQr6Azh+L0g2
         SMaw==
X-Gm-Message-State: AOAM531cyjc0kRmMzj82K+L7ECAIllNUxmCsRoyrMo9a1M2NWeZ5TkT/
        4dAyYrv7EHL4SjhhQ43zfI5eZQ==
X-Google-Smtp-Source: ABdhPJzoos6SroEbTwNgchhW8pq9WTD4Qe0ecUkShREHdGCuNK6bU3WSbJHL54SN3cHNcpk6GH5a2Q==
X-Received: by 2002:a63:3449:: with SMTP id b70mr4570122pga.289.1589567968230;
        Fri, 15 May 2020 11:39:28 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id j35sm2232570pgl.74.2020.05.15.11.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2020 11:39:27 -0700 (PDT)
Date:   Fri, 15 May 2020 11:39:26 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v7 2/4] dt-bindings: phy: qcom,qmp-usb3-dp: Add dt
 bindings for USB3 DP PHY
Message-ID: <20200515183926.GZ4525@google.com>
References: <1589510358-3865-1-git-send-email-sanm@codeaurora.org>
 <1589510358-3865-3-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1589510358-3865-3-git-send-email-sanm@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 15, 2020 at 08:09:16AM +0530, Sandeep Maheswaram wrote:

> Subject: dt-bindings: phy: qcom,qmp-usb3-dp: Add dt bindings for USB3 DP PHY

The subject is misleading, this patch doesn't add the binding for the USB3 DP
PHY, but factors it out.
