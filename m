Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF59036862C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Apr 2021 19:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236795AbhDVRpo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Apr 2021 13:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236670AbhDVRpm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Apr 2021 13:45:42 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41412C06138B
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Apr 2021 10:45:07 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id u15so15355034plf.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Apr 2021 10:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=a/ccmlK2SC2bFrmvJC8izkh8L57aGgHSLoN7bzusakc=;
        b=XBThIrflRQA3fgbEWX8gOjDQIuHreDNWe3wFiwgDIEWqE846XRJL+Amq1Wqsu+BUVP
         dllJKnRrsSYGsSQR7TLehlrcw1PeqX73rVmr66wC7bXwXkuHP2SUfviOg4RisDHxPEUb
         ffgqf7oc0PCVSEDXQ/BLKsfVlvnktjo1sMQJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a/ccmlK2SC2bFrmvJC8izkh8L57aGgHSLoN7bzusakc=;
        b=jXEbXyq+d7zAVjNuTHCmN59t+ZwjdL4mIkrThFBNrpA+rl8j2UiHuECB6O4RbKdaAO
         MDNSBKD4ma+V4EG8FcbRnhS+kgGDL11EuPLpZPkJB2n1yODELjscnGlF7DFOaZTEw4BI
         Tl0ybTB7DSAisBkXddf1pYYqTdkY0mWQSWAe0wt8UIdW8G2XCJfGNTR/IAFa5mdV7Aue
         J+LP1PWEzNLbhxPWu6x9BAvv1oNTtWjv/YnniqO3Vh17XcVZaBcR1Unrpi3R2a7Kh2o8
         voaxGKDic2CbgorzImejc3+f1qEhIGWEK9WmPnH/kyPmFHfbBbKUsmu8AsUSjZt/5shs
         45oA==
X-Gm-Message-State: AOAM531DYI3tv3TOh1o9eSlZSSCRoFjlHiIZrZPQYLdcyWu4mxihlM9x
        O/DKEOfauTbtk0m8ie3X45ehUg==
X-Google-Smtp-Source: ABdhPJzBjWu8RWw2bEU+LvfjTh9NYw4eIo6vp5pvYVW7q6jfIzHVgRHbByOj8TQ64v427KWpqBDA6Q==
X-Received: by 2002:a17:902:ce85:b029:eb:46e1:2da2 with SMTP id f5-20020a170902ce85b02900eb46e12da2mr2687plg.38.1619113506760;
        Thu, 22 Apr 2021 10:45:06 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:acff:4f9f:d039:23ff])
        by smtp.gmail.com with UTF8SMTPSA id i18sm2640082pfq.59.2021.04.22.10.45.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Apr 2021 10:45:06 -0700 (PDT)
Date:   Thu, 22 Apr 2021 10:45:05 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajeshwari <rkambl@codeaurora.org>
Cc:     amitk@kernel.org, thara.gopinath@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, robh+dt@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sanm@codeaurora.org
Subject: Re: [PATCH V1 2/2] dt-bindings: thermal: tsens: Add configuration in
 yaml
Message-ID: <YIG2IckKRBHqzpu3@google.com>
References: <1619005442-16485-1-git-send-email-rkambl@codeaurora.org>
 <1619005442-16485-3-git-send-email-rkambl@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1619005442-16485-3-git-send-email-rkambl@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 21, 2021 at 05:14:02PM +0530, Rajeshwari wrote:

> Subject: dt-bindings: thermal: tsens: Add configuration in yaml

This subject isn't really useful. The fact that the format of the
binding is yaml is irrelevant here. What is important is that you
are adding the compatible string for the SC7280 to the TSENS
binding. This should be reflected in the subject.

Also this is patch [2/2] and patch [1/2] adds DT entries with the new
compatible string. The binding should be defined before adding new
entries, hence the order of the patches should be inversed.
