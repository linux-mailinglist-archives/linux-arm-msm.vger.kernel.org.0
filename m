Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C20D371E9D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 May 2021 19:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbhECRbD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 May 2021 13:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231305AbhECRbB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 May 2021 13:31:01 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD260C06138F
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 May 2021 10:30:06 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id q10so4145880pgj.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 May 2021 10:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jWzhi2zJ8QN9mSWyZTkhFGCiJ3B7Eli+Yq7rhPsrtl8=;
        b=YWivDl/2rA5CzZXn7pjub/QE14DiLxcR2lzR4bqsictGqmYq10rQFiRyuSQck+u6aq
         fXF0x3iFDVJO1LQZiJCrvgSiFz0sJkX2zzdPeVL0Rg5bX9M2EUBJvTvFbCW3+Ard7yac
         FHBkuIJ5ECMQDLx6EX3rl/iMfN2moe1jPEJQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jWzhi2zJ8QN9mSWyZTkhFGCiJ3B7Eli+Yq7rhPsrtl8=;
        b=WP3Bk8pBGXaQtR629GnPpuDNneDLzNUe/N7XiEy7SdNyEKu7AMMch9QDzVrrxE1U95
         wgEdYjZO8NlIRjlNOOntnFR9lYSeVaPJ/JJZDi8rdWLOXne823rDTJuKl/Sk5n4DtIXd
         vVpPamsRXBVVPOmmLP0rnA5UgEI41he+6eq+9OOn9R9lyDdStXj2OxwhakkgbyS85q9h
         RbCVUYEFouoUX9iCoTxzkeyMegbKF4ZFN5GSGDNnEE7IqnTbuBbAyqdGaYyDy6D+2IyR
         3Nak4Qnr87x4vxuSif5oy1Z2P0cN18Axv8ZD8kb4fn7EC3oP2XXioMGdStr4F8qMZm7f
         AVaw==
X-Gm-Message-State: AOAM533ru/GfaAOc63UDkVZfdBsKulYkWN1KnZdvi7MRT5y4X2kiEWqF
        vlHti1CdAGmSgP67sLg01QKAiA==
X-Google-Smtp-Source: ABdhPJzh+lAXWgJbbdyJimK23CcnkdklMj5z5T0uqClRFOn+OZr4spX76DButcID3DsU/TAff1GaWA==
X-Received: by 2002:a63:86c7:: with SMTP id x190mr19614887pgd.194.1620063005716;
        Mon, 03 May 2021 10:30:05 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:8584:3fd:2adf:a655])
        by smtp.gmail.com with UTF8SMTPSA id n6sm155198pgq.72.2021.05.03.10.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 May 2021 10:30:05 -0700 (PDT)
Date:   Mon, 3 May 2021 10:30:04 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajeshwari <rkambl@codeaurora.org>
Cc:     amitk@kernel.org, thara.gopinath@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, robh+dt@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sanm@codeaurora.org, manafm@codeaurora.org
Subject: Re: [PATCH V3 1/3] dt-bindings: thermal: tsens: Add compatible
 string to TSENS binding for SC7280
Message-ID: <YJAzHEdRYQ4FX0e1@google.com>
References: <1619778592-8112-1-git-send-email-rkambl@codeaurora.org>
 <1619778592-8112-2-git-send-email-rkambl@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1619778592-8112-2-git-send-email-rkambl@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 30, 2021 at 03:59:50PM +0530, Rajeshwari wrote:
> Adding compatible string in TSENS dt-bindings for SC7280.
> 
> Signed-off-by: Rajeshwari <rkambl@codeaurora.org>

Please make sure to cc reviewers from earlier revisions and to
add tags like my 'Reviewed-by' from v2.

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

