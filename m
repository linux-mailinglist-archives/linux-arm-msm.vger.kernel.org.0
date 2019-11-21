Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1834105282
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2019 13:58:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfKUM6c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Nov 2019 07:58:32 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34512 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfKUM6c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Nov 2019 07:58:32 -0500
Received: by mail-wr1-f66.google.com with SMTP id t2so4331738wrr.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2019 04:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WVDdCVAVvfXUp96b+K4Bvi3DKiAcKkcFAJ8o78jw2lM=;
        b=ic9y14j/LXfCo79jPngoZmQbRUfN0Q3R5fsdc4ajFRalLImGXWYQmf9VN++QZhsaqx
         qM2/JbjvBQgMiotIcd9ioWZtvcpKjXJZONp9s5TEdxJDvl4dDL5/MeWTRocuL1ON98gF
         7GuWIvzHOUwc2FSe+zv7aEEIpEf8lxNcaxsJfsCWb34VlY4xHgOE05SAeE2OePqEDgmS
         uQvr5t8pf6ORHki3ciSn9WjMwMj249Wn642XWv5FW/O2IF+t+te65gnkyLWcXqOoyS4k
         8TvX8CTp2Sx5cbeZNqF0Otat3rjY/uvM6dyXAWQAK5Lf2AtKT28X2z3v8zNhu6yc2SQ9
         I5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WVDdCVAVvfXUp96b+K4Bvi3DKiAcKkcFAJ8o78jw2lM=;
        b=STDK1xK8i5BT83cXMcEIUBOc0bhzVKuxvvNuuWU8XBmIQxa82TB9G9EEDEYMI0MGBv
         v2ow2oWFI5+kD7SlXB90ei5WG2BQ7lukwHwAjYlur70IKpYyPPfSLNHq8/rokkMV/4wm
         1+rxP7Oibj17z148SJAQOWhBZvXlst6D7zgXExm08mdchzu9ZnV+zancsb21RHCCB3IP
         qwfjLN/5Eksxb+NeQm8GtY6O3PYykpSKhV220MowZC5SZiB41s2PABvHKVi1AR5C+64j
         EHlsH8nSmSYYN7eJ2wm/fNgR8D5lfemb6dATZaVmPpvMT4S+CV6KIk4/2A2jp0D/81RN
         D8PQ==
X-Gm-Message-State: APjAAAUJdHAP3nSkaHlwMoUzDaPV/UIml1x9MWTRVQ+46pHav8jaTAlC
        eFl7J6I0if9hJDEz2THC3scafA==
X-Google-Smtp-Source: APXvYqwIRQHfyZsDMcJvT7grkZ/0cjkEQe8IGAt/tMfssMA3K3x/CJMLxU41zRVNRGuqHGIiZGRjGQ==
X-Received: by 2002:adf:fecf:: with SMTP id q15mr5143405wrs.75.1574341109518;
        Thu, 21 Nov 2019 04:58:29 -0800 (PST)
Received: from [10.44.66.8] ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id w19sm2746143wmk.36.2019.11.21.04.58.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Nov 2019 04:58:28 -0800 (PST)
Subject: Re: [PATCH v3 2/2] interconnect: qcom: Add OSM L3 interconnect
 provider support
To:     Evan Green <evgreen@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        David Dai <daidavid1@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
References: <20191118154435.20357-1-sibis@codeaurora.org>
 <0101016e7f30ad15-18908ef0-a2b9-4a2a-bf32-6cb3aa447b01-000000@us-west-2.amazonses.com>
 <CAE=gft5jGagsFS2yBeJCLt9R26RQjx9bfMxhQu8Jj4uc4ca40w@mail.gmail.com>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <534d80fb-249d-ce18-86c0-1a1bc4f98c03@linaro.org>
Date:   Thu, 21 Nov 2019 14:58:27 +0200
MIME-Version: 1.0
In-Reply-To: <CAE=gft5jGagsFS2yBeJCLt9R26RQjx9bfMxhQu8Jj4uc4ca40w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Evan,

On 11/19/19 00:42, Evan Green wrote:
> Hi Sibi,
> 
> On Mon, Nov 18, 2019 at 7:45 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>>
>> On some Qualcomm SoCs, Operating State Manager (OSM) controls the
>> resources of scaling L3 caches. Add a driver to handle bandwidth
>> requests to OSM L3 from CPU/GPU.
>>
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  drivers/interconnect/qcom/Kconfig  |   7 +
>>  drivers/interconnect/qcom/Makefile |   2 +
>>  drivers/interconnect/qcom/osm-l3.c | 284 +++++++++++++++++++++++++++++
>>  3 files changed, 293 insertions(+)
>>  create mode 100644 drivers/interconnect/qcom/osm-l3.c
>>
[..]
>> +static int qcom_icc_aggregate(struct icc_node *node, u32 tag, u32 avg_bw,
>> +                             u32 peak_bw, u32 *agg_avg, u32 *agg_peak)
>> +{
>> +       *agg_avg += avg_bw;
>> +       *agg_peak = max_t(u32, *agg_peak, peak_bw);
>> +
>> +       return 0;
>> +}
> 
> Georgi, I wonder if it's a good idea to make a small collection of
> "std" aggregate functions in the interconnect core that a driver can
> just point to if it's doing something super standard like this (ie
> driver->aggregate = icc_std_aggregate;). This is probably fine as-is
> for now, but if we see a lot more copy/pastes of this function we
> should think about it.

Sure, thanks for the suggestion! Will submit a patch for this.

> 
>> +
>> +static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
>> +{
[..]
>> +
>> +static int qcom_osm_l3_remove(struct platform_device *pdev)
>> +{
>> +       struct qcom_osm_l3_icc_provider *qp = platform_get_drvdata(pdev);
>> +       struct icc_provider *provider = &qp->provider;
>> +       struct icc_node *n;
>> +
>> +       list_for_each_entry(n, &provider->nodes, node_list) {
> 
> There was a comment on one of the other threads that we've been
> copy/pasting this snippet around and it's wrong because it doesn't use
> the _safe variant of the macro. So we end up destroying the list we're
> iterating over.
> 
> Georgi, did you have a plan to refactor this, or should we just change
> this to be the _safe version?

I have fixes that convert this to the _safe variant (for stable) and also
factor this out into icc_nodes_remove() function. Will post them.

Thanks,
Georgi

> 
>> +               icc_node_del(n);
>> +               icc_node_destroy(n->id);
>> +       }
>> +
>> +       return icc_provider_del(provider);
>> +}
