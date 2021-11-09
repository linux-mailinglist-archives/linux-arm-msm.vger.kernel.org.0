Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF9544B513
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 23:01:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244584AbhKIWEO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 17:04:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237422AbhKIWEN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 17:04:13 -0500
X-Greylist: delayed 1084 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 09 Nov 2021 14:01:27 PST
Received: from mx0b-00190b01.pphosted.com (mx0b-00190b01.pphosted.com [IPv6:2620:100:9005:57f::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 924DFC061764
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Nov 2021 14:01:27 -0800 (PST)
Received: from pps.filterd (m0122331.ppops.net [127.0.0.1])
        by mx0b-00190b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A9KiWFQ022625;
        Tue, 9 Nov 2021 21:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=jan2016.eng;
 bh=3F6HDk8WamXxphKl6vnpWuI/OS9Xs+67dcB7yy8TZbE=;
 b=Ix7xEBr5IoHlHe0xaUmjCWCa6NG9Vef3Qt6l683EYaSuDqb655RwffmNutLjWCX6UL4x
 AakVvhg+CEt7Aa3ZmRlHdiybIaSD+Sqrgmqvl62sS2m1VRlpxkq0jCyHqZXV4ZZ/LRCo
 L7k8J8o9+o92tLk28PJlnxT0m0i4UVoWXKjxaDlMnXzFxHAJd/a53lq88RwEUToq/CDs
 E1vCYp+rovYIHvYYRXt3q2XtiwT0OK5yGTYdz6q4NI9YH8l/T6iuGzZx11Ts2pbldl3g
 bgBBOEYo75EmURf+5v7ieS6ERB2jnDLWFwIgIc7XnUwk4PG5fDdvPttCmRnCHaZlpsQg qQ== 
Received: from prod-mail-ppoint1 (prod-mail-ppoint1.akamai.com [184.51.33.18] (may be forged))
        by mx0b-00190b01.pphosted.com (PPS) with ESMTPS id 3c7sxasnax-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 Nov 2021 21:42:49 +0000
Received: from pps.filterd (prod-mail-ppoint1.akamai.com [127.0.0.1])
        by prod-mail-ppoint1.akamai.com (8.16.1.2/8.16.1.2) with SMTP id 1A9Lcwof005358;
        Tue, 9 Nov 2021 16:42:49 -0500
Received: from prod-mail-relay11.akamai.com ([172.27.118.250])
        by prod-mail-ppoint1.akamai.com with ESMTP id 3c5n1y6e5y-1;
        Tue, 09 Nov 2021 16:42:49 -0500
Received: from [0.0.0.0] (prod-ssh-gw01.bos01.corp.akamai.com [172.27.119.138])
        by prod-mail-relay11.akamai.com (Postfix) with ESMTP id A175F2796F;
        Tue,  9 Nov 2021 21:42:48 +0000 (GMT)
Subject: Re: [PATCHv3 3/3] dynamic_debug: Add a flag for dynamic event tracing
To:     Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Will Deacon <will@kernel.org>,
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
From:   Jason Baron <jbaron@akamai.com>
Message-ID: <e037f449-9784-c78e-431d-43f035a9f49f@akamai.com>
Date:   Tue, 9 Nov 2021 16:42:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c5715db5-965b-c1f5-3e99-04caec3d4f2c@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425,18.0.790
 definitions=2021-11-09_06:2021-11-08,2021-11-09 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111090117
X-Proofpoint-GUID: ekkWLSWwcoimFzJmOvpXGBHkRhpIu8-j
X-Proofpoint-ORIG-GUID: ekkWLSWwcoimFzJmOvpXGBHkRhpIu8-j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-09_07,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 spamscore=0 clxscore=1011 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111090118
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/9/21 12:49 PM, Sai Prakash Ranjan wrote:
> On 11/9/2021 11:10 PM, Steven Rostedt wrote:
>> On Tue, 9 Nov 2021 23:00:11 +0530
>> Sai Prakash Ranjan <quic_saipraka@quicinc.com> wrote:
>>
>>> Ah that's a very good idea, descriptor does contain the module, file name.
>>> We can probably even pass the module name,file name as string from the
>>> descriptor itself to event?
>>> Perhaps we can do that for all trace events and not just this trace
>>> event? Just like the trace event name displayed
>>> with trace events, perhaps have file name,module name displayed when
>>> dynamic debug is enabled? Filtering by
>>> filename is pretty useful since most of these usecases in debugging will
>>> be with respect to some driver or subsystems.
>> If we add this for all events, it would require a lot of changes to all
>> users of tracepoints, as it would require adding a new parameter to the
>> callbacks.
>>
>> We could add a flag in the registering that states that the callback is OK
>> for it, and it passes that data as well.
>>
>> Let me look into this for a bit. I may not have something this week, but
>> we should look into this more before adding little hacks that do this one
>> at a time like this patch.
>>
>> -- Steve
> 
> Sure, thanks for the help and review. I can skip this patch adding support for dynamic event tracing
> till we have something concrete as the previous patches doesn't depend on this.
> 
> Thanks,
> Sai


Hi,

Yeah there is a 'parallel' thread about adding the tracing ring buffer as a 'back end' to the dynamic debug stuff over here:
https://lore.kernel.org/lkml/20211105192637.2370737-9-jim.cromie@gmail.com/

The attempt there is more generic but I realize now that it is adding the tracing to an 'instance' which is specific to dynamic debug which is being
created via: trace_array_get_by_name(). I would prefer to just have it print to the 'main' trace buffer such that it's easier to read, although I
guess they could still be consolidated via timestamps. Hmmm...I think there was a previous proposal to just add a single tracepoint (that takes a
string) to the dynamic debug layer that could be called if a dynamic debug site is enabled for trace buffer output. Would that satisfy the ftrace
level filtering requirements that you are looking for?

Thanks,

-Jason
