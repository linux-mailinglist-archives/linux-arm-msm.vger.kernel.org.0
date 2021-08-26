Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5D73F8FF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 23:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243644AbhHZVCf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 17:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243640AbhHZVCe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 17:02:34 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF0C8C0613D9
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 14:01:46 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so475156pjc.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Aug 2021 14:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eaEOFUvxAPmXM8YqjP9hrSbXI6bvOJzogOXXHMDAi9Y=;
        b=kh5LnsgUcKg/RvMIIzNT3fv4UD2swPDy7glvvQYE0ZB8hjzNwGEJ9FAnb+qH7eQ2Lf
         Uw6ey7PjUjaTDM1RGQeUrJ4eLdFcvGwAxC/y97lHAEs1ukzs4EqXQA9Y0K+tjIbH4gb0
         pjtj5cMK2g1pa9S3lZy7gZ75v/ENCr6QCENHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eaEOFUvxAPmXM8YqjP9hrSbXI6bvOJzogOXXHMDAi9Y=;
        b=Sm0p6K7+0u9SUSfYtiEb7naL1YL0Nt7vpOg+6AGPd3OKRSWSMaPd+ELbKmug0YLFX2
         gxymS+hycEmwo3iBTlPzU1bOrhNNPIWmA9ZW6+VwCxvHqTyBEG4hj9jJ9CWT8+ASfIdw
         TC1Ih+00rwKmTSQXt02Iha0qQnedWPtDaTmDl+07NUszl7GYrR/uiEDVSZ3CnvPYJg+Y
         d0vzKGM85FS14OQf8eTZOVAlZasYQwG9LfbDp2uFLK6vFY8sqicim+yodj3DDiDORtt3
         p4Ag3Tw1PF+0C+lCZjb3CElsRpoihidxnOHz6yCNYz11zASkwZSynsObEtsZrqA2OvR2
         JVPQ==
X-Gm-Message-State: AOAM531DsQc2zSU+Rl0WjeMAgy4iajfvdyh/fDYGhvTMQNQyr34/cxvP
        mDpoFbPduimCGT3Ga+jrCzziLQ==
X-Google-Smtp-Source: ABdhPJxlBshtNEiT2wxuAMODJVNJvZKjjqbFwuV5Epe2WvhKQXV+AW7NuuyXydGv7EM8R2PMxKesCA==
X-Received: by 2002:a17:902:c402:b0:12d:b2fe:f0f1 with SMTP id k2-20020a170902c40200b0012db2fef0f1mr5214913plk.9.1630011706372;
        Thu, 26 Aug 2021 14:01:46 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:bd0b:bcb8:ebdb:c24d])
        by smtp.gmail.com with UTF8SMTPSA id r14sm3825563pff.106.2021.08.26.14.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 14:01:45 -0700 (PDT)
Date:   Thu, 26 Aug 2021 14:01:44 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajesh Patil <rajpat@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, sboyd@kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: Re: [PATCH V6 4/7] arm64: dts: sc7280: Update QUPv3 UART5 DT node
Message-ID: <YSgBOP/hMob3Ff+4@google.com>
References: <1629983731-10595-1-git-send-email-rajpat@codeaurora.org>
 <1629983731-10595-5-git-send-email-rajpat@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1629983731-10595-5-git-send-email-rajpat@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 26, 2021 at 06:45:28PM +0530, Rajesh Patil wrote:
> From: Roja Rani Yarubandi <rojay@codeaurora.org>
> 
> Update the compatible string as "qcom,geni-uart".
> Add interconnects and power-domains. Split the pinctrl
> functions and correct the gpio pins.

You could say that uart5 was formerly treated as special
(dedicated debug uart) and that the change removes this
specialness and makes it look like any other UART.

> split the pinctrl functions to match with SoC dt

The message should say that this is about the 7280-idp

> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>

The change itself looks good to me, the above are only nits to improve
the commit message, so:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
