Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46E193B4A80
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jun 2021 00:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbhFYWS4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 18:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhFYWSz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 18:18:55 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7757C061766
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 15:16:34 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id 13-20020a17090a08cdb029016eed209ca4so6372005pjn.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 15:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cKLeDqgF/d1wJHQRtqrvqm49xREPWVE19Y0DcivdW5Y=;
        b=RobRa4t1Af2CzwsffYwDgaErvkEdEIQFb9MZ+PvejHsSQemqHPPP76bPWtgu8bkhwG
         qVfcsD6FoT/fMuOLFSVsms4+7aW5uIm22Dv9bPEcGBz8igDDfXyBYOArWNxiS/+JbZEm
         R0y1y4NiStCGfZTwfKj4eXMlmM8W7f3XXtNRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cKLeDqgF/d1wJHQRtqrvqm49xREPWVE19Y0DcivdW5Y=;
        b=msRmNt7XJrmCWHuuVFGt+idI3S7NRGKiU/jxGNLH9TlnRtgHm4Pmb873vrynsP15WE
         5C25tVjIa/08ysqI4DfjrEt4kd4P9eoUNNDHyjZy0Y9xdRaJuO+eDHbXacEVGt70yzqZ
         KvEvBmRNOjmRkrZ9+i6ufn8rY+oK2VhBR/H3wvC99io7eUVOBheATUUfXrT79U2Dg4X4
         BxMcn0pCjChxpv0a5QV4kLGTSXMtlBNNb/8rsYpFTuDFBusgXFo0Oig7QHnb6wwUfMj7
         Hb31ELKYng4fhxry/oE6rUIm3KtuuEGfGFg9w6Wp9bfi1NpCsjkze0yJIwuj6GFlJdTU
         aXcg==
X-Gm-Message-State: AOAM532YJyFafHWD/uXhrk2f6suiejrNcLnUsODjppTnHqfT+hh8UbZs
        zvfKQFQpDrlGTLP831YTja1kNw==
X-Google-Smtp-Source: ABdhPJzHeSkIAfh/79eXGw5+RiWEALb/cU5J9NAouA8tQ8MroXGzl3useRdbITo/FmYnxWAoXVTLkw==
X-Received: by 2002:a17:90a:b792:: with SMTP id m18mr13547916pjr.140.1624659394313;
        Fri, 25 Jun 2021 15:16:34 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:cc13:a7dd:f4b5:2160])
        by smtp.gmail.com with UTF8SMTPSA id n69sm6950280pfd.132.2021.06.25.15.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 15:16:34 -0700 (PDT)
Date:   Fri, 25 Jun 2021 15:16:32 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        swboyd@chromium.org, ulf.hansson@linaro.org, rjw@rjwysocki.net,
        agross@kernel.org, ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v3 13/13] dt-bindings: soc: qcom: aoss: Delete unused
 power-domain definitions
Message-ID: <YNZVwOab7cX58TOI@google.com>
References: <1624560727-6870-1-git-send-email-sibis@codeaurora.org>
 <1624560727-6870-14-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1624560727-6870-14-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 25, 2021 at 12:22:07AM +0530, Sibi Sankar wrote:
> Delete unused power-domain definitions exposed by AOSS QMP.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
