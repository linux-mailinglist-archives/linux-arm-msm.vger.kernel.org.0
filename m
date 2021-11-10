Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBC4544C9FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 21:04:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbhKJUGt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 15:06:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbhKJUGs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 15:06:48 -0500
Received: from mx0b-00190b01.pphosted.com (mx0b-00190b01.pphosted.com [IPv6:2620:100:9005:57f::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 925D6C061764;
        Wed, 10 Nov 2021 12:04:00 -0800 (PST)
Received: from pps.filterd (m0122330.ppops.net [127.0.0.1])
        by mx0b-00190b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AAHNt9Z016267;
        Wed, 10 Nov 2021 20:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=jan2016.eng;
 bh=0QZf4HQX7jtlOGARvRVFXjZAU2DrV+22O8nO5mxMSIY=;
 b=EtkXDd8kR+mGtVF6R+9eSYSh26TtahzhXCoHBgy1wxGNsvv2x7kh0R47E3UXQxvOi5sl
 FR3SWj3gCh4ziNNMqF2dPjQx2I3L7Bqva7feLYHf4xcqVsflXdUflrt4PDNLsIxHM7Kt
 tXgOZ35ckbK1vJu/K8QfLkODYq7XwEZA3HIJiz8QPfiBXTry5f5pacxt63/h98Mjdqry
 D5T9uhZ1JWmAdFn/ndXsLH0Ws8mICDyviViIRrAsDtOvVWc68brErbGxLXxfqIHc7XA0
 JoufXHjnnjNEYf5095i9P8O/zAOwzKhYxA539O0yX8KqXyS7Mr8t/QwhnnljWeP2EAPD XA== 
Received: from prod-mail-ppoint2 (prod-mail-ppoint2.akamai.com [184.51.33.19] (may be forged))
        by mx0b-00190b01.pphosted.com (PPS) with ESMTPS id 3c8f8ef6jv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 Nov 2021 20:03:24 +0000
Received: from pps.filterd (prod-mail-ppoint2.akamai.com [127.0.0.1])
        by prod-mail-ppoint2.akamai.com (8.16.1.2/8.16.1.2) with SMTP id 1AAJpsTs006737;
        Wed, 10 Nov 2021 15:03:23 -0500
Received: from prod-mail-relay10.akamai.com ([172.27.118.251])
        by prod-mail-ppoint2.akamai.com with ESMTP id 3c82mj9j9h-1;
        Wed, 10 Nov 2021 15:03:22 -0500
Received: from [0.0.0.0] (prod-ssh-gw01.bos01.corp.akamai.com [172.27.119.138])
        by prod-mail-relay10.akamai.com (Postfix) with ESMTP id 796B3480BC;
        Wed, 10 Nov 2021 20:03:22 +0000 (GMT)
Subject: Re: [PATCHv3 3/3] dynamic_debug: Add a flag for dynamic event tracing
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        quic_psodagud@quicinc.com, Marc Zyngier <maz@kernel.org>,
        gregkh@linuxfoundation.org, arnd@arndb.de,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mingo@redhat.com,
        jim.cromie@gmail.com, seanpaul@chromium.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
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
 <55a9fe7b-5573-0f80-e075-758b377a6c47@akamai.com>
 <20211109172848.304b1c19@gandalf.local.home>
From:   Jason Baron <jbaron@akamai.com>
Message-ID: <43eeb71b-7a06-1dcb-3ae4-1eca31883df2@akamai.com>
Date:   Wed, 10 Nov 2021 15:03:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211109172848.304b1c19@gandalf.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425,18.0.790
 definitions=2021-11-10_08:2021-11-08,2021-11-10 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 mlxscore=0
 mlxlogscore=972 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111100096
X-Proofpoint-GUID: hibD0ujbGJkr1-gYS7ht7Rdacj-SHODu
X-Proofpoint-ORIG-GUID: hibD0ujbGJkr1-gYS7ht7Rdacj-SHODu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-10_12,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1011 priorityscore=1501 malwarescore=0
 mlxlogscore=918 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111100097
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/9/21 5:28 PM, Steven Rostedt wrote:
> [ Hmm, should add Mathieu in on this discussion ]
> 
> On Tue, 9 Nov 2021 17:13:13 -0500
> Jason Baron <jbaron@akamai.com> wrote:
> 
>>> What we are looking at there is to pass the dynamic debug descriptor to the
>>> trace event filtering logic, where you could filter on information passed
>>> to it. For example, on a specific file if a trace event is called by
>>> several different files or modules.
>>>
>>> -- Steve  
>>
>> Ok, Could this be done at the dynamic debug level as it can already match
>> on specific files and line numbers currently?
> 
> Not sure what you mean by that.

I was just trying to say that via dynamic debug one could enable all debugs in a kernel source directory as in your example below via:
# echo "file drivers/soc/qcom/* +p" > /sys/kernel/debug/dynamic_debug/control

So if we are just looking for a printk here, one could just use pr_debug(). Or if we want that print to go the tracing ring buffer we have been
discussing how to add that as a 'backend' for dynamic debug as well.

If we want to use tracepionts, then yeah I think it's going to require adding the file, line, module data to each tracepoint site. I think this is
probably done via the tracing macros and then that could be filtered on, but yes that's going to add bloat.

The proposal here seems to be a mix of things - use the file control that dynamic debug already has to match on file name and then enable a tracepoint
that is behind it. That seems overly complex?

Thanks,

-Jason

> 
> The idea was that this would only be enabled if dynamic debug is enabled
> and that the DEFINE_DYNAMIC_DEBUG_METADATA() could be used at the
> tracepoint function location (trace_foo()) by the tracepoint macros. And
> then if one of the callbacks registered for the tracepoint had a
> "dynamic_debug" flag set, it would be passed the descriptor in as a pointer.
> 
> And then, for example, the filtering logic of ftrace could then reference
> the information of the event, if the user passed in something special.
> 
>  # echo 'DEBUG_FILE ~ "drivers/soc/qcom/*"' > events/rwmmio/rwmmio_write/filter
>  # echo 1 > events/rwmmio/rwmmio_write/enable
> 
> And then only the rwmmio_write events that came from the qcom directory
> would be printed.
> 
> We would create special event fields like "DEBUG_FILE", "DEBUG_FUNC",
> "DEBUG_MOD", "DEBUG_LINE", etc, that could be used if dyndebug is enabled
> in the kernel.
> 
> Of course this is going to bloat the kernel as it will create a dynamic
> debug descriptor at every tracepoint location.
> 
> -- Steve
> 
