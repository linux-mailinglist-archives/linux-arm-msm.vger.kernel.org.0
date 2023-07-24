Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B35275F93D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jul 2023 16:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbjGXOFE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jul 2023 10:05:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231191AbjGXOFD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jul 2023 10:05:03 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65EDCE5A
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 07:05:01 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4R8hhZ6vmBzVjqv;
        Mon, 24 Jul 2023 22:03:26 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 22:04:57 +0800
Subject: Re: [PATCH v3 3/3] drm/komeda: Fix IS_ERR() vs NULL check in
 komeda_component_get_avail_scaler()
To:     Liviu Dudau <liviu.dudau@arm.com>
CC:     <airlied@gmail.com>, <daniel@ffwll.ch>, <robdclark@gmail.com>,
        <quic_abhinavk@quicinc.com>, <dmitry.baryshkov@linaro.org>,
        <sean@poorly.run>, <marijn.suijten@somainline.org>,
        <neil.armstrong@linaro.org>, <sam@ravnborg.org>,
        <quic_eberman@quicinc.com>, <a39.skl@gmail.com>,
        <quic_gurus@quicinc.com>,
        <angelogioacchino.delregno@somainline.org>,
        <james.qian.wang@arm.com>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>
References: <20230714014820.2186203-1-cuigaosheng1@huawei.com>
 <20230714014820.2186203-4-cuigaosheng1@huawei.com>
 <ZLpc4Yt39SjbGA-T@e110455-lin.cambridge.arm.com>
From:   cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <5e4a5fe8-3695-c4d0-d81d-9766fc938243@huawei.com>
Date:   Mon, 24 Jul 2023 22:04:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <ZLpc4Yt39SjbGA-T@e110455-lin.cambridge.arm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.110.176]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> If you're going to update the other patches to use IS_ERR_OR_NULL() please do so
> here too. You can keep my R-b for that change.

Thanks for taking time to review the patch.

I have update the patch set and add this change to v5.

On 2023/7/21 18:24, Liviu Dudau wrote:
> Hi Gaosheng,
>
> On Fri, Jul 14, 2023 at 09:48:20AM +0800, Gaosheng Cui wrote:
>> The komeda_pipeline_get_state() returns an ERR_PTR() on failure, we should
>> use IS_ERR() to check the return value.
>>
>> Fixes: 502932a03fce ("drm/komeda: Add the initial scaler support for CORE")
>> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
>> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
>> ---
>>   drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
>> index 3276a3e82c62..e9c92439398d 100644
>> --- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
>> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
>> @@ -259,7 +259,7 @@ komeda_component_get_avail_scaler(struct komeda_component *c,
>>   	u32 avail_scalers;
>>   
>>   	pipe_st = komeda_pipeline_get_state(c->pipeline, state);
>> -	if (!pipe_st)
>> +	if (IS_ERR(pipe_st))
> If you're going to update the other patches to use IS_ERR_OR_NULL() please do so
> here too. You can keep my R-b for that change.
>
> Best regards,
> Liviu
>
>>   		return NULL;
>>   
>>   	avail_scalers = (pipe_st->active_comps & KOMEDA_PIPELINE_SCALERS) ^
>> -- 
>> 2.25.1
>>
