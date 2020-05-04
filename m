Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1AE1C495A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 00:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728049AbgEDWEF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 18:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727843AbgEDWEE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 18:04:04 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B57C061A41
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2020 15:04:04 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id k133so8085719oih.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2020 15:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HG81CHNe0QI0NTrcW8A+JoCmXNVDbes2uRrDzLgGKZ0=;
        b=awQyZcp56CR+knPRnNk21A1iejTvhrYFLChzm3D8lOIkwo5L29DDqfYpOQLytNd4Wl
         PZ0pw0oGfkICw4vK77z9xVA/P+4bMM/pOOWq1BfkSLu+gukAONxmc7l9395y0J94jMvb
         SEljtLDp8Rd+20G3yKC4Msa9QXUUPbIL3knX4W4l9rYfWcq4mwSz728aHXV8rT09nh1c
         u8+IB2oBb0mo0VcASnfmLUxm6hfZCTP6qL2c5S1/n8o7LSMhCNiQeCXOXjkhI7eaV0R/
         HoJQIi2Tw4NDoVlonxzmj/pbTjhdvw7jZhGkNMRNpDiaoSDvux9z59kPjqqzBXYxli6i
         9WKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HG81CHNe0QI0NTrcW8A+JoCmXNVDbes2uRrDzLgGKZ0=;
        b=TULNAktfEDhrNG6TkgiEJSY4VpreE90LKzqhIeacyZ4Qn/FQYuYTMfZlJZ4vJdhJdm
         mTX0dnBwKG9B0kBpOhOs14WT1w6r+gh1fii1RqIaNNV+Aq1Vt9ctmPnndMcODVZhoPAh
         wlhTC95JdCnc9tntciJdtsheFo1h9r5UXPraYJAUdFrC5xNRN6f48Br4375xegOAldbC
         kJXZkHSRI/U5M7oet9Y9kuPCDcV0YuGC6np6pimaJerXiO+PlH/cJ78NS9oHYUOH3qx+
         2nlG6LhLAvi6fnpeKV8+gsMtiQLno87UIvdPkof90QdB0/yq7l+4BSbImM/pzjocr0Ej
         crJA==
X-Gm-Message-State: AGi0PuZPIElT7+p7fU4ZrBzw4zfJ65ksn8u/T/op0L6oXnuTRsciUhIm
        PU1+1XmaWrO+JsEuRXGve2hQRxdA1thAje1p8wUbkg==
X-Google-Smtp-Source: APiQypKDHasungWQjMayXhFnYsz3plBUGmQGh5tJ355DQrIPVoVy/eOJEF75X4WbUqO6BDVWSC9QCDmuk+RxO75/Zhw=
X-Received: by 2002:a54:418f:: with SMTP id 15mr374635oiy.69.1588629843284;
 Mon, 04 May 2020 15:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200504202243.5476-1-sibis@codeaurora.org> <20200504202243.5476-8-sibis@codeaurora.org>
In-Reply-To: <20200504202243.5476-8-sibis@codeaurora.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 4 May 2020 15:03:26 -0700
Message-ID: <CAGETcx9=kfuG9WtaSxsDe_SM1Gewbn889eQ--3ui3H_rzm3BRA@mail.gmail.com>
Subject: Re: [PATCH v4 07/12] OPP: Add and export helper to get icc path count
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Nishanth Menon <nm@ti.com>, Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-arm-msm@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>, lukasz.luba@arm.com,
        Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 4, 2020 at 1:24 PM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Add and export 'dev_pm_opp_get_path_count' to get the icc path count
> associated with the device.

This is not related to OPP. You should add this helper function to ICC
framework?

-Saravana
