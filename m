Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1745B2132B0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2020 06:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgGCET4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 00:19:56 -0400
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:34926 "EHLO
        out30-44.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725294AbgGCET4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 00:19:56 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R851e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01422;MF=tianjia.zhang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0U1XckQJ_1593749988;
Received: from 30.25.178.169(mailfrom:tianjia.zhang@linux.alibaba.com fp:SMTPD_---0U1XckQJ_1593749988)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 03 Jul 2020 12:19:51 +0800
Subject: Re: [PATCH] drm/msm/dpu: fix wrong return value in dpu_encoder_init()
To:     Markus Elfring <Markus.Elfring@web.de>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Chen Tao <chentao107@huawei.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Drew Davenport <ddavenport@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>,
        zhengbin <zhengbin13@huawei.com>
References: <1c338c4c-c185-0b37-eabb-1072a6502ec0@web.de>
From:   Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Message-ID: <87c184ee-dfe7-03dc-e3c9-27996c57d6cd@linux.alibaba.com>
Date:   Fri, 3 Jul 2020 12:19:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1c338c4c-c185-0b37-eabb-1072a6502ec0@web.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2020/7/2 22:04, Markus Elfring wrote:
>> A positive value ENOMEM is returned here. I thinr this is a typo error.
>> It is necessary to return a negative error value.
> 
> I imagine that a small adjustment could be nice for this change description.
> 
> How do you think about to follow progress for the integration of
> a previous patch like “[RESEND] drm/msm/dpu: fix error return code in dpu_encoder_init”?
> https://lore.kernel.org/dri-devel/20200618062803.152097-1-chentao107@huawei.com/
> https://lore.kernel.org/patchwork/patch/1257957/
> https://lkml.org/lkml/2020/6/18/46
> 
> Regards,
> Markus
> 

This is the same fix, please ignore this patch.

Thanks,
Tianjia
