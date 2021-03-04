Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13BAD32CE9B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 09:39:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236125AbhCDIiV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 03:38:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236131AbhCDIiK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 03:38:10 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FC2FC061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Mar 2021 00:37:30 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id h4so18410440pgf.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Mar 2021 00:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=keh6OiRMgDYdb2Jzt12hTBHP6AvsQSIJUPBUhidAE5E=;
        b=q0rmadOj3+os+jAn+FFEx2+UnH86CtD/4Mw0Fx0bhYACOOADZLOy9w9orLYUuh0SoT
         075x376LmAqhfGRWhbIcflFuuOtO28qSXSJXkN2YhxZcsuhYitwmPwTlfQ7tGoRExiKj
         t4Hkmcg+6rd+UVx5P3BDfOMUxhmCI6/PErw2AAB17pYLEh0cLmLy2B8N+1vm7HoagBPw
         TzEW/RfjlB+2RlL4C2onY9vI4hAv40TpbEqU+o+8Hv6x1/5BRzmAT9AhVeG54Fta4OY/
         SQPQEV/UfapL994gVfHMx1mJ17G8+hVQfKhZ17xdPAijCEOtmf4nS4+sdEXlxv/jd6lz
         yaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=keh6OiRMgDYdb2Jzt12hTBHP6AvsQSIJUPBUhidAE5E=;
        b=qdvhCWIyl5xxVbw0PkUAolIft8a5L6RepOo4oO9TDzmpjKfs7U5e6pOzxc414YX7h6
         8LWWlYZ5+OYvdUdz0EJnMW2JNY301vtK6ASFDh6p46zCsCrFOT3cTs0UC9uONHwLSyBx
         8gH9wJIvJJqfHNaga014Fx0AOahiVFsXc6vZGwcL6SqI4XASLgH1Q4RfmIOVbPW4X8wD
         yF4qZa+YsruiGJbgfWFhw2cxRJn9lNYFxKes+znHQ0TM3fHgObn+L+vEQtPlPiUTgGjf
         W5D7bv6mMJLThprsF/jCq2ZjlkX/U+LH+rUXdUN0bRfduStcuAMkruAhsGlT/1IYQL88
         XNZg==
X-Gm-Message-State: AOAM532Qc8XuohLb6IdiWaLTzjqrec03CExAHtPsPZAu4fQTZVZ5lgvY
        gSRdb5CSZ2R7IzL1O85SAZPlnXePzJVBg43uBZ2Qkw==
X-Google-Smtp-Source: ABdhPJxADAz1pIyFAKke1f6Dq/YG/J8D4tBhi0KWLFosqYQFUcv///dPEIuKgJ913D6vRXuDgkv1wxwLMbxv+n2LRNs=
X-Received: by 2002:a65:6a02:: with SMTP id m2mr2699051pgu.443.1614847049718;
 Thu, 04 Mar 2021 00:37:29 -0800 (PST)
MIME-Version: 1.0
References: <1614208985-20851-1-git-send-email-bbhatt@codeaurora.org> <1614208985-20851-5-git-send-email-bbhatt@codeaurora.org>
In-Reply-To: <1614208985-20851-5-git-send-email-bbhatt@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 4 Mar 2021 09:45:08 +0100
Message-ID: <CAMZdPi8dk24Taq4GNvdFdE93-xUnAceTa-kuN2dOsmsnKko+vg@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] bus: mhi: core: Update debug prints to include
 local device state
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?Q2FybCBZaW4o5q635byg5oiQKQ==?= <carl.yin@quectel.com>,
        Naveen Kumar <naveen.kumar@quectel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 25 Feb 2021 at 00:23, Bhaumik Bhatt <bbhatt@codeaurora.org> wrote:
>
> Update debug prints to include local device in the BHI interrupt
> handler. This helps show transitions better between MHI states.
>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
