Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28D8C3EEE16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Aug 2021 16:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239975AbhHQOHi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Aug 2021 10:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239137AbhHQOHh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Aug 2021 10:07:37 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 611F6C0613C1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Aug 2021 07:07:04 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id l36-20020a0568302b24b0290517526ce5e3so17613730otv.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Aug 2021 07:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MjrWqg5iL7My1Sr03I7/kUapdaKKEVG8PdV3gZ9eQ5c=;
        b=UAdw8iIf1KQ4XcA+YoXbiW2WnCf0aZvDhdzhGq6fdomVH2hQy6KaDEj3vfMHfALYv6
         TQpDbwuyoIKzh3hHatjWC2nJf9moQprUZ2tg4YEEqzp0MgLOa9hAhk/tzSDVL/eHIa+K
         AoqUgTV2lsAhSg8mt9FbUfK2nAgufws5OC++v03zH4Mzp3nPolTqZYC17k2JCsBaqqp0
         1pNRlPEZhNBxqDufiX2TiEAwa48cot/TPWXIcOiSizQH6GGJhGjZyr4KN+nvPN8Ci5ye
         z/mFkx04yvnmll+D0yTg0FHXOYXHEYLG3QM7swAErrb+wfe6X7k42bqTVmBCJoYERvZC
         RSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MjrWqg5iL7My1Sr03I7/kUapdaKKEVG8PdV3gZ9eQ5c=;
        b=KMhOolxtvuXyZKd/2Qfc/lVmnvMMjPNfhHY4bKWauL1GHwRRzgV//gsnroUFm0zKgJ
         nfodYfMneTR9ySVDUMfMjwDFRbHxFwfsTfcuiZ3Gd7jSVe9vUFcf4RWfHQMDPk/dh8HO
         onwAZaV9DbbZX4HHVG38+kQ+ekOdh8EN+ml3rAjTuhv3EzWR/WLuQ/WV3z+1qnNt6ImZ
         5TNqhBk5prJLxagCTY6IZ1UBfO/oqueRWGm/6LuYEmU3HQ01ysOXwxuR6nMR3krYIfow
         KELVrNdY0uLRARjncCJDCoLN6vRaEPLJZ3wdP6cJM6Ju+he/gPAYr9rpCVAsWapqq8/s
         ygBA==
X-Gm-Message-State: AOAM531MchqM0qK4z2vePdMgW3R/HM0qyDRNRz8iBAwmPnGE5CYmDt0T
        SyTR3H4faeNuAVViI1zT7p/lbA==
X-Google-Smtp-Source: ABdhPJxgbrZTySfGDM1CDSbpZKb3negyXgjIKPfl8i3ksWXyLl4lrCduMCUTEPkrjtnienG26pp+7A==
X-Received: by 2002:a05:6830:110a:: with SMTP id w10mr2663999otq.291.1629209223152;
        Tue, 17 Aug 2021 07:07:03 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m16sm438399oop.3.2021.08.17.07.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 07:07:02 -0700 (PDT)
Date:   Tue, 17 Aug 2021 09:07:00 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Thara Gopinath <thara.gopinath@linaro.org>, agross@kernel.org,
        rui.zhang@intel.com, viresh.kumar@linaro.org, rjw@rjwysocki.net,
        robh+dt@kernel.org, steev@kali.org, tdas@codeaurora.org,
        mka@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [Patch v5 1/6] firmware: qcom_scm: Introduce SCM calls to access
 LMh
Message-ID: <YRvChF0j2NOsDuK3@builder.lan>
References: <20210809191605.3742979-1-thara.gopinath@linaro.org>
 <20210809191605.3742979-2-thara.gopinath@linaro.org>
 <19659756-4716-4c5b-949a-58d362dcee22@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19659756-4716-4c5b-949a-58d362dcee22@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 17 Aug 08:17 CDT 2021, Daniel Lezcano wrote:

> On 09/08/2021 21:15, Thara Gopinath wrote:
> > Introduce SCM calls to access/configure limits management hardware(LMH).
> > 
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> 
> Hi Bjorn, Andy,
> 
> do you mind if I pick this patch along with patch 2/6 ?
> 

Please do!

Regards,
Bjorn
