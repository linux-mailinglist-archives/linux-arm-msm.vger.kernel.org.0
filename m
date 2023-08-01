Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13E3176BF1E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Aug 2023 23:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbjHAVUc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Aug 2023 17:20:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230481AbjHAVUb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Aug 2023 17:20:31 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F59EFF;
        Tue,  1 Aug 2023 14:20:30 -0700 (PDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 371LAtVt017173;
        Tue, 1 Aug 2023 21:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=06FF4IOyXvcgEdQyC3mIxkaA4a6M/S3jL0iZP3Xs0zQ=;
 b=Rz1CZ6SuBmFRKkOaXFVDrLiYy/Hd6qsaBwTZVWxSO7OUxoN7Av8IKYqobCpfeEqNNLqm
 D8V32/2C7NulDywKR73gwxt8gyCN2eHSCKUG1AKZqAKW5o0a1PM5nHH+ziRbIONuFESe
 FvsMYNX5aB9v9hO/Wc5p8rlu8OGcLG/VZ+Xv07AzXT5OVGPPCzV2g1PRmWDZKTJnnMDv
 bhGb63IbJ0TFgu0Jn/Fn6/9il2b1H0V0JYCL8DLi1SGqpXt6VCNKAjbt3hu8xtMnJ+4e
 Q3eR5GyYFA3WEwaT10UBxYHLMncOAWrkWCmvwgjx6OhtIWNff6CkUow5nESb67Vq2quB 6Q== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s760c0gkp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 01 Aug 2023 21:20:07 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 371LK6IF015115
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 1 Aug 2023 21:20:06 GMT
Received: from [10.110.58.131] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 1 Aug
 2023 14:20:03 -0700
Message-ID: <d2dac772-af7f-6539-499a-d9980d224e67@quicinc.com>
Date:   Tue, 1 Aug 2023 14:20:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [RFC] memory pressure detection in VMs using PSI mechanism for
 dynamically inflating/deflating VM memory
Content-Language: en-US
From:   Sudarshan Rajagopalan <quic_sudaraja@quicinc.com>
To:     "T.J. Alumbaugh" <talumbau@google.com>,
        David Hildenbrand <david@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Mike Rapoport <rppt@kernel.org>,
        Oscar Salvador <osalvador@suse.de>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "will@kernel.org" <will@kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
CC:     "Trilok Soni (QUIC)" <quic_tsoni@quicinc.com>,
        "Sukadev Bhattiprolu (QUIC)" <quic_sukadev@quicinc.com>,
        "Srivatsa Vaddagiri (QUIC)" <quic_svaddagi@quicinc.com>,
        "Patrick Daly (QUIC)" <quic_pdaly@quicinc.com>
References: <DS0PR02MB90787835F5B9CB9771A20329C4C09@DS0PR02MB9078.namprd02.prod.outlook.com>
 <CABmGT5HiH8OM_F6K7VQj9vj1ZnSvVowwJ_d4EVox5-JDL3Eh5w@mail.gmail.com>
 <50f979aa-37a6-db4b-465d-1dc0a27c2dfc@quicinc.com>
In-Reply-To: <50f979aa-37a6-db4b-465d-1dc0a27c2dfc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5Pd5W_i9tOsA8EbyrFrvN-TimLFMiZRf
X-Proofpoint-ORIG-GUID: 5Pd5W_i9tOsA8EbyrFrvN-TimLFMiZRf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-01_19,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=915 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2308010190
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,NULL_IN_BODY,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 1/23/2023 3:47 PM, Sudarshan Rajagopalan wrote:
>
> On 1/23/2023 1:26 PM, T.J. Alumbaugh wrote:
>> Hi Sudarshan,
>>
>> I had questions about the setup and another about the use of PSI.
> Thanks for your comments Alumbaugh.
>>> 1. This will be a native userspace daemon that will be running only 
>>> in the Linux VM which will use virtio-mem driver that uses memory 
>>> hotplug to add/remove memory. The VM (aka Secondary VM, SVM) will 
>>> request for memory from the host which is Primary VM, PVM via the 
>>> backend hypervisor which takes care of cross-VM communication.
>>>
>> In regards to the "PVM/SVM" nomenclature, is the implied setup one of
>> fault tolerance (i.e. the secondary is there to take over in case of
>> failure of the primary VM)? Generally speaking, are the PVM and SVM
>> part of a defined system running some workload? The context seems to
>> be that the situation is more intricate than "two virtual machines
>> running on a host", but I'm not clear how it is different from that
>> general notion.
>
> Here the Primary VM (PVM) is actually the host and we run a VM from 
> this host. We simply call this newly launched VM as Secondary VM 
> (SVM). Sorry for the confusion here. The secondary VM runs in a secure 
> environment.
>
>>
>>> 5. Detecting decrease in memory pressure b  the reverse part where we 
>>> give back memory to PVM when memory is no longer needed is bit 
>>> tricky. We look for pressure decay and see if PSI averages (avg10, 
>>> avg60, avg300) go down, and along with other memory stats (such as 
>>> free memory etc) we make an educated guess that usecase has ended 
>>> and memory has been freeb ed by the usecase, and this memory can be 
>>> given back to PVM when its no longer needed.
>>>
>> This is also very interesting to me. Detecting a decrease in pressure
>> using PSI seems difficult. IIUC correctly, the approach taken in
>> OOMD/senpai from Meta seems to be continually applying
>> pressure/backing off, and then seeing the outcome of that decision on
>> the pressure metric to feedback to the next decision (see links
>> below). Is your approach similar? Do you check the metric periodically
>> or only when receiving PSI memory events in userspace?
>>
>> https://github.com/facebookincubator/senpai/blob/main/senpai.py#L117-L148 
>>
>> https://github.com/facebookincubator/oomd/blob/main/src/oomd/plugins/Senpai.cpp#L529-L538 
>>
>
> We have implemented a logic where we use the PSI averages to check for 
> rate of decay. If there are no new pressure events, these averages 
> would decay exponentially. And we wait until {avg10, avg60, avg300} 
> values reaches below a certain threshold. The logic is as follows -
>
> usecase endsB  ->B  wait until no new pressure event occurs (this 
> usually happens when all usecases ends)B  ->B  once no new pressure 
> events, run check for pressure decay algorithm that simply checks 
> exponential decay of averages goes below certain threshold -> once 
> this happens, we make educated decision that usecase has actually 
> ended ->B  check for memory stats MemFree etc (here we actually take 
> memory snapshot when pressure builds up and new memory gets 
> plugged-in, and compare memory snapshot when pressure decay ends, that 
> way we know how much memory was plugged-in before and check if MemFree 
> is in that range so that we get to know previously memory that was 
> added is now no longer needed) ->B  release remaining free memory back 
> to Primary VM (host).
>
> The reason why we check for exponential decay of averages is it gives 
> a clear picture that memory pressure is indeed going down, and any new 
> sudden spike in pressure will be factored into increase in these 
> averages and it can be observed. Rather than sampling the pressure 
> during every ticks where you might miss the sudden spikes if the 
> sampling time is too wide.
>
> Another cool thing of using averages is you can calculate how long it 
> will take for pressure to decay from {avg10XX, avg60XX} -> to 
> {avg10TT, avg60TT} where avg10TT,... is the set threshold value. So 
> you can sleep until this time and then wake up and check if averages 
> have reached the threshold values. If its not, that means a new 
> pressure event would have come in and suppressed the decay. This way 
> we don't have to do any sampling of pressure every ticks (saves CPU 
> cycles).
>
>> Very interesting proposal. Thanks for sending,
>>
>> -T.J.

Resurrecting this thread to mention that we have sent the source-code of 
the userspace dynamic VM memory resizing daemon that was discussed here 
to upstream as RFC. The patches are sent as is and we will be merging 
into Github or CodeLinaro after gathering all review comments.

https://lore.kernel.org/linux-arm-kernel/cover.1690836010.git.quic_sudaraja@quicinc.com/T/#t

Alumbaugh, David - I would be glad to get your thoughts and comments on 
this since this topic would be of interest to you both.
