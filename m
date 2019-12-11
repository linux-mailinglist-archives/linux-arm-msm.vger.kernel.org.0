Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B26511A4E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 08:10:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbfLKHKC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 02:10:02 -0500
Received: from a27-187.smtp-out.us-west-2.amazonses.com ([54.240.27.187]:51972
        "EHLO a27-187.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725800AbfLKHKC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 02:10:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576048201;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=mHGxYoR3gp9GoBg7R0dzI6EbViXJjFdJH4ruGbJEZe4=;
        b=NFaAqNhiPEil+aOAw6cfAQctKv/L+e+MdQ11a0qE8QpTOJOsqxUb4uVy/Aej7WWi
        xhPCVoII9S55oOp94IyCWpkHPye9DgU0eZ/u40w+YSJJ8aRYl5cewx9sqJTRamuqV1V
        +So8jsjG6Bj/McTy3MhApzGC54ZSBKp/hvcLND2o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576048201;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=mHGxYoR3gp9GoBg7R0dzI6EbViXJjFdJH4ruGbJEZe4=;
        b=CY4tcMHV5B/bxG3Nf9CtXVbHryYS/DILj1pyvMtoOv1SgeYqDwE0wbFBWwozhosH
        tGvNknAz0qNyF0yyBDp+ppAGss7Z8QMseT4iRf0ZNgT/RlLNk8yPXTUIxC4kIQtjekw
        i0/dBs14ODZGSrHwyCWmp57B+bbn3E48W0wZl2fI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 11 Dec 2019 07:10:01 +0000
From:   saiprakash.ranjan@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 0/3] Add DT nodes for watchdog and llcc for SC7180 and
 SM8150 SoCs
In-Reply-To: <20191211070216.GF3143381@builder>
References: <0101016ef3391259-59ec5f0a-2ae7-45a8-881e-edc2d0bf7b26-000000@us-west-2.amazonses.com>
 <20191211070216.GF3143381@builder>
Message-ID: <0101016ef3cb0d1d-73403d51-8cd5-4220-ac31-39f05134c9b8-000000@us-west-2.amazonses.com>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2019.12.11-54.240.27.187
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-12-11 12:32, Bjorn Andersson wrote:
> On Tue 10 Dec 20:30 PST 2019, Sai Prakash Ranjan wrote:
> 
>> This series adds device tree node for watchdog on SC7180 and SM8150.
>> It also adds a node for LLCC (Last level cache controller) on SC7180.
>> 
>> Patch 3 depends on the dt binding change to LLCC node name:
>>  - https://patchwork.kernel.org/patch/11246055/
>> 
> 
> Series applied
> 

Thanks Bjorn !!

--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation

