Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9D506D12E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2019 17:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbfGRPbM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jul 2019 11:31:12 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:44822 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727687AbfGRPbM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jul 2019 11:31:12 -0400
Received: by mail-io1-f66.google.com with SMTP id s7so51989117iob.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2019 08:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aKCPVJWUs1Jjo618+zN06BNfCZDhzZnUlux4ybl+pq0=;
        b=Sm2v261v5xekTmZUZ6N0X1DwSi7Qx28ytpUwnL6RR4/HA9RM1I1uHbxQ5Tr2RsDxnF
         uHfozpBvobDMz50HATWjhVmujLg+klkHLJ9pvtoaL0bSj4Xbwt0hy+2s95Bt9PrLwjHP
         9WrW9oAO56vn4LHlOWXQZlyF01y48G0k5vnVYgdbvDJLuIe7VXgftZScWAzSwPg4upTL
         MB0EMRjd0/GafWtn+YldSQCyNyizBD/TzUOX5f+PsG2DaEIfWwVFdiK2B/TZ6sY4lWjl
         Qi26tf9hfQYQ+MtdpFd3yi9DfJfOtWqxINoykwaPsPDhZbGjJpNY3h2J1aupKeY6xiGH
         YSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aKCPVJWUs1Jjo618+zN06BNfCZDhzZnUlux4ybl+pq0=;
        b=efBbbItHvYWjjiY7yU8iRtpezbWTVMn8nLyrlwJy2M4w2lDRy30VA3x2qIbZ5IzVwO
         cdkTbaa9HJntF/Q5AL8OyT3tYBXfreQQqgu/MRL/Yv41hUQ3R5dXiWkOdzCNgvQSYfoZ
         42J4IuGQzeJXIk0svssY9fE47zwZFP2ZQnx9cZJhMPHmDWDVeUPs8g7E719GJyk3F2JF
         AN1A8YzqzIQcAg9WiCns0DJUBVR0hb9/6ap0/ZzLgpdySTmHEOfPhyWHYvcdoWB+bQk8
         Yf1OghZGD5hxVtpwcz1KJWOIciZYqt2GbDd1FlgRSoM4+qmTfS6QjyqJFbQZwUZRTvK/
         OEHA==
X-Gm-Message-State: APjAAAVB2kj0gPjYiE9JzUhyQS/WXWp57SaXTdL5VzKyM6GAj56UT4Is
        sOeF+O5G/aicdOrlrKpBnpB0vERDyEbvLmt6Bk7GGg==
X-Google-Smtp-Source: APXvYqzG2U1bPJ/OOAVgRh5Mkg7P6+I1KqVOXN4mBoflGrY+UlQJR3tPL8mnMgJRePKuw3SKg/qvS4IJ79JZmTu478c=
X-Received: by 2002:a05:6638:517:: with SMTP id i23mr48290113jar.71.1563463871438;
 Thu, 18 Jul 2019 08:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <2fa725fbc09306f1a95befc62715a708b4c0fad0.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <20190717170050.GB4271@xps15> <f28d9c8f-017c-c990-2f00-0ef5a62f3b40@codeaurora.org>
In-Reply-To: <f28d9c8f-017c-c990-2f00-0ef5a62f3b40@codeaurora.org>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Thu, 18 Jul 2019 09:31:00 -0600
Message-ID: <CANLsYkx9X36OJmczNK1255y8fKJfkyVq1zyQUDihqMewcU6Kxw@mail.gmail.com>
Subject: Re: [PATCHv8 3/5] arm64: dts: qcom: msm8996: Add Coresight support
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Leo Yan <leo.yan@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Mike Leach <mike.leach@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 17 Jul 2019 at 23:47, Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Mathieu,
>
> On 7/17/2019 10:30 PM, Mathieu Poirier wrote:
> > On Fri, Jul 12, 2019 at 07:46:25PM +0530, Sai Prakash Ranjan wrote:
> >> From: Vivek Gautam <vivek.gautam@codeaurora.org>
> >>
> >> Enable coresight support by adding device nodes for the
> >> available source, sinks and channel blocks on msm8996.
> >>
> >> This also adds coresight cpu debug nodes.
> >>
> >> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> >> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> >> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >> Acked-By: Suzuki K Poulose <suzuki.poulose@arm.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/msm8996.dtsi | 434 ++++++++++++++++++++++++++
> >>   1 file changed, 434 insertions(+)
> >>
> >
> > We've gone trhough 8 iteration of this set and I'm still finding checkpatch
> > problems, and I'm not referring to lines over 80 characters.
> >
>
> I only get below 2 checkpatch warnings:
>
> If you are talking about the below one, then it was not added manually.
> It was taken automatically when I pulled in the v7. Should I be
> resending this patch for this?

That depends if you want David and Andy to pickup your patches - I am
sure they'll point out exactly the same thing.

>
> $ ./scripts/checkpatch.pl -g 2fa725fbc09306f1a95befc62715a708b4c0fad0
> WARNING: 'Acked-by:' is the preferred signature form
> #14:
> Acked-By: Suzuki K Poulose <suzuki.poulose@arm.com>
>
> WARNING: line over 80 characters
> #154: FILE: arch/arm64/boot/dts/qcom/msm8996.dtsi:763:
> +                       compatible = "arm,coresight-dynamic-replicator",
> "arm,primecell";
>
> total: 0 errors, 2 warnings, 440 lines checked
>
>
> -Sai
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
