Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B1FE7AB637
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Sep 2023 18:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232332AbjIVQnK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Sep 2023 12:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232469AbjIVQnJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Sep 2023 12:43:09 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 940791A6
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Sep 2023 09:43:02 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38MEtrCX016331;
        Fri, 22 Sep 2023 16:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=5/UGOBVNc9dht0GchwTL0OmnJStwfENOUdq4/YE4Oqg=;
 b=KA+YtDWUevMJFgoHFYK8Tu733YYQ1X5bhcxpM4Qy4CvGGMdKwALhGNxTGbhXXHBE5m4j
 Hnyyftlop+tgrHeCbaQlai3XehkyTMCYO2QMyDfSzv/JXlvLY7VRZ3f04GiWw7yWfHA0
 6IAAt2IdNfi2bnKfSkI5iHv8Ase5/LadexEMkPB9E84liNBhU1TyLC0vHUGm4jFrVIa8
 sIBQDY5iU7vErWrJa+5pbtDySnleRPdjbhpbA6h6yMb+aCGcz9eAztulgbS3HJ3TlOMI
 ULMlVBMKT4HR9/Jeaf6xRrXHu+ZzY2A2q1k8vCecU2EqJpovHNMJb0bne8HoBy6HPq9w Rw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8u5n2hkj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 22 Sep 2023 16:42:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38MGgus1007688
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 22 Sep 2023 16:42:56 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 22 Sep
 2023 09:42:55 -0700
Message-ID: <1f26d36b-432d-ec9b-0c80-7a7df084a192@quicinc.com>
Date:   Fri, 22 Sep 2023 10:42:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] soc: qcom: smem: Document shared memory item IDs and
 corresponding structs
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, <andersson@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>
References: <20230915175907.17134-1-quic_jhugo@quicinc.com>
 <66676866-d0d7-44c1-9170-aff687ac452c@linaro.org>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <66676866-d0d7-44c1-9170-aff687ac452c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 85nM_Pbg82H-ucIXgd4bUsfID87jaITv
X-Proofpoint-GUID: 85nM_Pbg82H-ucIXgd4bUsfID87jaITv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_15,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=867
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309220143
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/15/2023 12:09 PM, Konrad Dybcio wrote:
> On 15.09.2023 19:59, Jeffrey Hugo wrote:
>> Shared memory items are assigned a globally unique ID and almost always
>> have a defined structure which is stored in the shared memory.  Document
>> assigned IDs and corresponding structures.
>>
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> ---
>>
>> Konrad, before I get too far into this, I was hoping for some early
>> feedback since this documentation is a request that you made.
>>
>> Please let me know if this is aligned with what you were wanting.
> This is super nice, I'll just leave you with a few nitty
> code-style pointers.
> 
>> +/* fixed items - these have a static position in shared memory */
> Meaningless but eye-pleasing - comments should start with an
> uppercase letter
> 
>> +#define SMEM_PROC_COMM				0
> In many places like this where we essentially have a firmware
> interface, it is customary to go like this:
> 
> #define FWNAME_CALL_SOMETHING_FOO	(magicval1)
> struct fwname_something_foo {
> 	[...]
> };
> 
> #define FWNAME_CALL_SOMETHING_BAR	(magicval2)
> struct fwname_something_bar {
> 	[...]
> };
> 
> This makes matching the call/function/whatev name with what
> it expects/returns easier for a typical human
> 
> [...]
> 
>> +/* Legacy communication protocol between "Apps" and "Modem" processors */
> The comments explaining what this does are a great addition, I
> think in the spirit of that previous suggestion, they could go
> like this:
> 
> /* blah blah blah yes yes yes */
> #define FWNAME_CALL_SOMETHING_FOO	(magicval1)
> struct fwname_something_foo {
> 	[...]
> };
> 
> /* blah blah something something */
> #define FWNAME_CALL_SOMETHING_BAR	(magicval2)
> struct fwname_something_bar {
> 	[...]
> };
> 
> 
> [...]
> 
>> +/* SMEM_ALLOCATION_TABLE is an array of these structures.  512 elements in the array. */
>> +struct smem_heap_entry {
>> +        __le32 allocated;
>> +        __le32 offset;
>> +        __le32 size;
>> +        __le32 reserved; /* bits 1:0 reserved, bits 31:2 aux smem base addr */
> If we have an integer split into bitfields or similar, something
> like this would make it both readable and usable in code:
> 
> struct smem_heap_entry {
>          __le32 allocated;
>          __le32 offset;
>          __le32 size;
>          __le32 reserved;
> #define SMEM_HEAP_ENTRY_BASE_ADDR GENMASK(31, 2)
> #define SMEM_HEAP_ENTRY_RESERVED GENMASK(1, 0)
> };
> 
> [...]
> 
>> +#define FLASH_PART_MAGIC1       0x55EE73AA
>> +#define FLASH_PART_MAGIC2       0xE35EBDDB
>> +#define FLASH_PTABLE_V3         3
>> +#define FLASH_PTABLE_V4         4
>> +#define FLASH_PTABLE_MAX_PARTS_V3 16
>> +#define FLASH_PTABLE_MAX_PARTS_V4 32
>> +#define FLASH_PTABLE_ENTRY_NAME_SIZE 16
> Similarly having such magic values under the corresponding struct
> member would make things more obvious
> 
>> +
>> +struct flash_partition_entry {
>> +        char name[FLASH_PTABLE_ENTRY_NAME_SIZE];
>> +        __le32 offset;     /* Offset in blocks from beginning of device */
>> +        __le32 length;     /* Length of the partition in blocks */
>> +        u8 attr;           /* Flags for this partition */
> Comments like this are welcome too, particularly where things
> are "very not obvious", like here where length is in blocks
> and not bytes.
> 
> But if we had something like "u32 flags" followed by a bunch
> of defines, that's self-explanatory.

Thanks.  This all makes sense to me.  Will incorporate this feedback as 
I go.

-Jeff
