Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23B9344B531
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 23:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239894AbhKIWQf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 17:16:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238006AbhKIWQe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 17:16:34 -0500
Received: from mx0b-00190b01.pphosted.com (mx0b-00190b01.pphosted.com [IPv6:2620:100:9005:57f::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BAC5C061764;
        Tue,  9 Nov 2021 14:13:48 -0800 (PST)
Received: from pps.filterd (m0122331.ppops.net [127.0.0.1])
        by mx0b-00190b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A9KiMMd022651;
        Tue, 9 Nov 2021 22:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=jan2016.eng;
 bh=RELr9g3430pk0P/l4UsUiNTAvTTaZIuuN/G3QKPrB40=;
 b=RoRJqoZODWMzVi3PhscKunJ3D9W1nnqVn6bPXcDoteGBtJtUpuhbmOC1AlT97ik8c9Ot
 J9NJGHgjhvgxvF3A5OtkmpGIoa+7cxaiBUVr4mGryzztkXxv+xCsLG/NSCBbmiKiqOiT
 tHDpTo+1eHec1Js/VuePF1fSdF4Y7mXf4QSIFjcbDDlFXDQY6fJKk7+86E8hN3me2e77
 2PAwTLMo7X+wny5024rDqA8j07cQIIx86YnJjAHCJT0F8QVslSw6LAUxkXGlJhwFBUkf
 AJu6gmiKhcNDz53zGcW+mnH2LJmLCiPr9RXj6wa/h4pBeimr3ko85YZLGr3mmlPPrP+0 Fw== 
Received: from prod-mail-ppoint5 (prod-mail-ppoint5.akamai.com [184.51.33.60] (may be forged))
        by mx0b-00190b01.pphosted.com (PPS) with ESMTPS id 3c7sxat0vb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 Nov 2021 22:13:14 +0000
Received: from pps.filterd (prod-mail-ppoint5.akamai.com [127.0.0.1])
        by prod-mail-ppoint5.akamai.com (8.16.1.2/8.16.1.2) with SMTP id 1A9M4cYV002810;
        Tue, 9 Nov 2021 14:13:13 -0800
Received: from prod-mail-relay11.akamai.com ([172.27.118.250])
        by prod-mail-ppoint5.akamai.com with ESMTP id 3c5qpbe9b8-1;
        Tue, 09 Nov 2021 14:13:13 -0800
Received: from [0.0.0.0] (prod-ssh-gw01.bos01.corp.akamai.com [172.27.119.138])
        by prod-mail-relay11.akamai.com (Postfix) with ESMTP id 43F9427976;
        Tue,  9 Nov 2021 22:13:13 +0000 (GMT)
Subject: Re: [PATCHv3 3/3] dynamic_debug: Add a flag for dynamic event tracing
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        quic_psodagud@quicinc.com, Marc Zyngier <maz@kernel.org>,
        gregkh@linuxfoundation.org, arnd@arndb.de,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mingo@redhat.com,
        jim.cromie@gmail.com, seanpaul@chromium.org
References: <cover.1636452784.git.quic_saipraka@quicinc.com>
 <3706af20bc64a320ff8f3ff8950738b988f4bdf5.1636452784.git.quic_saipraka@quicinc.com>
 <20211109104941.2d50eafc@gandalf.local.home>
 <f7c665b9-dc17-5a7f-de80-9fa0605721fc@quicinc.com>
 <20211109115951.1c2b5228@gandalf.local.home>
 <264b77dd-5509-60f9-248c-a93135b01aa9@quicinc.com>
 <20211109124046.2a772bcb@gandalf.local.home>
 <c5715db5-965b-c1f5-3e99-04caec3d4f2c@quicinc.com>
 <e037f449-9784-c78e-431d-43f035a9f49f@akamai.com>
 <20211109165104.176b4cf9@gandalf.local.home>
From:   Jason Baron <jbaron@akamai.com>
Message-ID: <55a9fe7b-5573-0f80-e075-758b377a6c47@akamai.com>
Date:   Tue, 9 Nov 2021 17:13:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211109165104.176b4cf9@gandalf.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425,18.0.790
 definitions=2021-11-09_07:2021-11-08,2021-11-09 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 suspectscore=0
 mlxscore=0 phishscore=0 mlxlogscore=776 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111090119
X-Proofpoint-GUID: qZ_VL_UCgyoOVZNiQN1fngiQ7U9Ely9n
X-Proofpoint-ORIG-GUID: qZ_VL_UCgyoOVZNiQN1fngiQ7U9Ely9n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-09_07,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=759
 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111090121
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/9/21 4:51 PM, Steven Rostedt wrote:
> On Tue, 9 Nov 2021 16:42:48 -0500
> Jason Baron <jbaron@akamai.com> wrote:
> 
>> Yeah there is a 'parallel' thread about adding the tracing ring buffer as
>> a 'back end' to the dynamic debug stuff over here:
>> https://urldefense.com/v3/__https://lore.kernel.org/lkml/20211105192637.2370737-9-jim.cromie@gmail.com/__;!!GjvTz_vk!GdVm3olk4hfEx6PjfDDPg4cIbtY60aeqP0IOwu1-S0qJRBZ-OuvC5I_stkqniA$ 
> 
> As the maintainer of tracefs, why am I not Cc'd on that thread :-(
> 
> I'll have to look at that thread later (no time now).
Agreed - that's my bad. I meant to add you earlier in the discussion...

> 
>>
>> The attempt there is more generic but I realize now that it is adding the
>> tracing to an 'instance' which is specific to dynamic debug which is
>> being created via: trace_array_get_by_name(). I would prefer to just have
>> it print to the 'main' trace buffer such that it's easier to read,
>> although I guess they could still be consolidated via timestamps.
>> Hmmm...I think there was a previous proposal to just add a single
>> tracepoint (that takes a string) to the dynamic debug layer that could be
>> called if a dynamic debug site is enabled for trace buffer output. Would
>> that satisfy the ftrace level filtering requirements that you are looking
>> for?
> 
> What we are looking at there is to pass the dynamic debug descriptor to the
> trace event filtering logic, where you could filter on information passed
> to it. For example, on a specific file if a trace event is called by
> several different files or modules.
> 
> -- Steve

Ok, Could this be done at the dynamic debug level as it can already match on specific files and line numbers currently?

Thanks,

-Jason
