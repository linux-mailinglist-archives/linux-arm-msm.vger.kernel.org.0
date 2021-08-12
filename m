Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 672FF3EAADB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 21:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233650AbhHLTXH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 15:23:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbhHLTXH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 15:23:07 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CBB0C0617AD
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 12:22:41 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d1so8619598pll.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 12:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Qb+FI0jSCsZyHH1Ia4kbzXwLXCw4sowjg/unRazGFOw=;
        b=j8cQMpokfQuLRgHm07RR5lcnPohAYewhPt1EspVbwh4WNHr7GGQvDm3kmECAFwxwW8
         jhbPlSAsren8SdoC+d8S8uO8TfchuQSUWI0bK9y+pjIJBSt5nSr77a9k+j+Tq1b1NGAS
         tTE9TMfvEPFduwrbXRQDM01A2S6J85S2QCkPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Qb+FI0jSCsZyHH1Ia4kbzXwLXCw4sowjg/unRazGFOw=;
        b=GLBdZR6QPyTjr/3QkwnbFcH2PFN7yhK1X7n+y/ZYNDyUScB/jGY3mD/h4ea6YvuA3m
         EELkPpNvld757E6QbnuX+xBvm63uRcsFW/tZpvdpi0jfx8d8JMZzns4dBSCUD3i/I9aE
         isd0e7KNK9wGldwvdUREFv0jzcneeDNXgf/OJ4Qxaq7tG6QRGZMGsHL03T1oLtvHy6cj
         ybedRm6zA4tRrJAqwVuYmcreRq8kjhFWC3w48LPm+DFHvHVdaLE6zNe25xroRkd8VWXL
         32NiGw7/g799IuXDE2SW3TDrCf+5LiteRjYLg5EXNYRvjTWvzg41yv2wF4WwA8+5WB1Q
         v9xw==
X-Gm-Message-State: AOAM531q/0oqXcRiAiMSO+xOkVg/zPdxDInyu8FGYUEJlEHfsvcVFTJN
        cT1r6FMfMyK+q6CFCRsIIMn9jQ==
X-Google-Smtp-Source: ABdhPJwPH80t5d7F/jYCYlTC6qaJ9oXn39f+IjkD6biu7WuSZq9ZoVowWfDG6IADtOsKsh6cCUYT5A==
X-Received: by 2002:a05:6a00:1c71:b029:3e0:4537:a1d4 with SMTP id s49-20020a056a001c71b02903e04537a1d4mr5590743pfw.1.1628796161176;
        Thu, 12 Aug 2021 12:22:41 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:6683:43e5:ba4c:d76c])
        by smtp.gmail.com with UTF8SMTPSA id j22sm4434963pgb.62.2021.08.12.12.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 12:22:40 -0700 (PDT)
Date:   Thu, 12 Aug 2021 12:22:39 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajesh Patil <rajpat@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org
Subject: Re: [PATCH V5 6/7] arm64: dts: sc7280: Configure uart7 to support
 bluetooth on sc7280-idp
Message-ID: <YRV0/8qtlMyVSDRI@google.com>
References: <1628754078-29779-1-git-send-email-rajpat@codeaurora.org>
 <1628754078-29779-7-git-send-email-rajpat@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1628754078-29779-7-git-send-email-rajpat@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 12, 2021 at 01:11:17PM +0530, Rajesh Patil wrote:
> Add bluetooth uart pin configuration for sc7280-idp.
> 
> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
