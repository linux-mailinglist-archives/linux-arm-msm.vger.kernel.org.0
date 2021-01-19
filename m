Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD972FBA34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jan 2021 15:56:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390977AbhASOqJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jan 2021 09:46:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405166AbhASLGH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jan 2021 06:06:07 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1198C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jan 2021 03:05:20 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id m6so12027454pfk.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jan 2021 03:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4TOzYyZIin/yiRGi1ie9o6/CbIyjNQOy95/3SVEBU9A=;
        b=uExiI/2TzOCWPI0pjBTK0TdMIUfxRWt8KPMbORnS5c9XO68eyPvKDWJwxuopER796L
         vURhfaHxKLDrdEPMFkOr9D58bDFAGeSBZqyZoZFnV8Ds7wkLh1pLnTtIRfKzC3SNrIG8
         4yP6GQFO22QzekfpAs4U1eCA1618km+cf6i7I1xDcH3U66TWqpFoSnJURTiEhgICz/DU
         PNnFj2qdBYVwZw3IYfwhM3DmNJJsRyPbxgsnldEdXpXHVPwmlxWQ3gmqbfaoayhgLuzv
         3XIncpgMG7FADLMlh68SnARce4hUuVnnPuu2JPftCXyp7Mk01bVkT2woy+Zvbj/1lR5b
         eoIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4TOzYyZIin/yiRGi1ie9o6/CbIyjNQOy95/3SVEBU9A=;
        b=NxLFxrmfXBIFfDuTHQfZx8gBVzZ96xXnWelszyBzXXtq21nLpyRf74YshGxoba2AOY
         IBNIXTdJmjWclZ7QEh4FkeqNR7PzilnWD7Fs5RehI/Pg+dhG60idzysJcO5Zxk8g39MX
         /axRQPhKsDG399pO/THApBOnbhTKPep13F2I4krY30iws3xbQmNUE6MhH9Ua4KoHxHoM
         PEqqODPtW209ynxLzrz0FbyD9+hb6Z1CztMydm/g18dirhYaq8KL9Sd17qCGwqOMDLjO
         UfSyfj0aMNxJsquMQmEVa9ZKy6LTzU5ArWkiwlf9PiDSq5uimP/MJF4FIA/bJw7dnvu3
         88eg==
X-Gm-Message-State: AOAM533L2Pa+yQ8PWAM7slpANU+l7B1MaU+Fz50KGhaC8Adk/Z8s6klj
        AD/S+lU1exjSHQio5txzGXrdfA==
X-Google-Smtp-Source: ABdhPJypZ7g85maNn/Fq9wWXClDnT5wovR1kfqNu7P4AWwxVkN+tY7vWNWWbv+l/0xEltuRgBAxuTA==
X-Received: by 2002:a62:a508:0:b029:1ba:621:ff29 with SMTP id v8-20020a62a5080000b02901ba0621ff29mr707798pfm.44.1611054320340;
        Tue, 19 Jan 2021 03:05:20 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id a5sm18186189pgl.41.2021.01.19.03.05.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jan 2021 03:05:18 -0800 (PST)
Date:   Tue, 19 Jan 2021 16:35:16 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, parashar@codeaurora.org,
        Linux PM <linux-pm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: i2c-qcom-geni: Add support for
 'assigned-performance-states'
Message-ID: <20210119110516.fgbbllyg7lxwwfdz@vireshk-i7>
References: <20201224111210.1214-1-rojay@codeaurora.org>
 <20201224111210.1214-4-rojay@codeaurora.org>
 <YAGqKfDfB7EEuZVn@builder.lan>
 <6bfec3e6-3d26-7ade-d836-032273856ce2@codeaurora.org>
 <CAPDyKFqF0NE3QRAEfiqj5QOXXH2om4CpyyeudeqoovANfvjsaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFqF0NE3QRAEfiqj5QOXXH2om4CpyyeudeqoovANfvjsaQ@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19-01-21, 12:02, Ulf Hansson wrote:
> As a matter of fact this was quite recently discussed [1], which also
> pointed out some issues when using the "required-opps" in combination,
> but perhaps that got resolved? Viresh?

Perhaps we never did anything there ..

-- 
viresh
