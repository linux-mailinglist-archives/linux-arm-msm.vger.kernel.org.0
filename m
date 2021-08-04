Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71FC93DFB25
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 07:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233620AbhHDFiA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Aug 2021 01:38:00 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:50914 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbhHDFh7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 01:37:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628055467; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=XdIMy/+KYlx0LiNJkuSBANk6R6Hn89TlHZhiYcNm2Ec=;
 b=Jm3wOcOW1OOipmbbrxXGALsRbePLc0DGCz0DFVp68fC6eXhDh4VhjKiHa6bFUDmHm0Efa/tO
 IqNBhKZKmSPEg2jn1egeoyvqSfLpBlXVYOWRiev2Px0EbPkXqNH9sULKu/NNgtJQgAefG1Mu
 F3QLoU+zGZ7UmhYJDqrc/bxhXmk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 610a27a6041a739c46d95bff (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 04 Aug 2021 05:37:42
 GMT
Sender: kalyan_t=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A9293C43217; Wed,  4 Aug 2021 05:37:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kalyan_t)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BDDD1C433D3;
        Wed,  4 Aug 2021 05:37:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 04 Aug 2021 11:07:40 +0530
From:   kalyan_t@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, mkrishn@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, rnayak@codeaurora.org,
        stable@vger.kernel.org
Subject: Re: [Freedreno] [v2] drm/msm/disp/dpu1: add safe lut config in dpu
 driver
In-Reply-To: <CAE-0n52+PvNpz5uqf3O_NsfQ4q2taeZmdSdoM3fGDLp5aQVj-A@mail.gmail.com>
References: <1627987307-29347-1-git-send-email-kalyan_t@codeaurora.org>
 <CAE-0n52+PvNpz5uqf3O_NsfQ4q2taeZmdSdoM3fGDLp5aQVj-A@mail.gmail.com>
Message-ID: <b6aca5dda4e100694a3d8cb39cfc650d@codeaurora.org>
X-Sender: kalyan_t@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-04 01:43, Stephen Boyd wrote:
> Quoting Kalyan Thota (2021-08-03 03:41:47)
>> Add safe lut configuration for all the targets in dpu
>> driver as per QOS recommendation.
>> 
>> Issue reported on SC7280:
>> 
>> With wait-for-safe feature in smmu enabled, RT client
>> buffer levels are checked to be safe before smmu invalidation.
>> Since display was always set to unsafe it was delaying the
>> invalidaiton process thus impacting the performance on NRT clients
>> such as eMMC and NVMe.
>> 
>> Validated this change on SC7280, With this change eMMC performance
>> has improved significantly.
>> 
>> Changes in v1:
>> - Add fixes tag (Sai)
>> - CC stable kernel (Dimtry)
>> 
>> Fixes: cfacf946a464d4(drm/msm/disp/dpu1: add support for display for 
>> SC7280 target)
> 
> This is wrong format and commit hash
> 
My bad, i'll fix it right away
- KT

> Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for
> SC7280 target")
> 
>> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
>> Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org> 
>> (sc7280, sc7180)
