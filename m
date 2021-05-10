Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7EDA377C33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 May 2021 08:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbhEJGSz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 May 2021 02:18:55 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2669 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230140AbhEJGSy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 May 2021 02:18:54 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FdrPn6m1jz1BKlN;
        Mon, 10 May 2021 14:15:09 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.72) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.498.0; Mon, 10 May 2021
 14:17:45 +0800
Subject: Re: [PATCH v2 0/1] drm/msm/dpu: Fix error return code in
 dpu_mdss_init()
To:     Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20210510031606.3112-1-thunder.leizhen@huawei.com>
 <9109a395-099b-ed14-4433-d4bf6dbf5cef@cambridgegreys.com>
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <0bb32dc4-b47e-25e8-70a6-fe9bf2c5078f@huawei.com>
Date:   Mon, 10 May 2021 14:17:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <9109a395-099b-ed14-4433-d4bf6dbf5cef@cambridgegreys.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2021/5/10 14:01, Anton Ivanov wrote:
> On 10/05/2021 04:16, Zhen Lei wrote:
>> v1 --> v2:
>> According to Anton Ivanov's review comments, detele the unnecessary local
>> variable initialization "ret = 0".
>>
>>
>> Zhen Lei (1):
>>    drm/msm/dpu: Fix error return code in dpu_mdss_init()
>>
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
> I do not recall reviewing this.

Oh, Sorry, the two e-mails next to each other. I lost sight of them.

> 
> I think you got the wrong Anton Ivanov - I maintain UML so the previous revision hit someone's else inbox.
> 

