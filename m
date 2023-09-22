Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CAF07AB6D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Sep 2023 19:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbjIVRIM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Sep 2023 13:08:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbjIVRIL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Sep 2023 13:08:11 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 178C3192
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Sep 2023 10:08:05 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38MDaeoM005045;
        Fri, 22 Sep 2023 17:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3nzGxZjogaVPWIKBf4APNnkahVT+rUtVmPuaI2pdNS4=;
 b=dEX6dyGucqzvHD9NoiNJx2fHQDnvP9i1YDapIhhOUbxy0f9DiiYhxreFpRbI7sQRxe5O
 4Z/GDvr9jyCLios2FOF5Aw+yjQay1YWm30eaomu8YZBuVsH7MtD8iqzLI777RjrKvvcJ
 t8wEl4nFx1I/uzzd9WfHZYOGLagbV3K1p1JLTDNyHhP54X/WmThGaJ8Vk+Jg3ro5ZSq3
 hpdPOb5nDlYX2KwXGSHhkZxhcW0XglXhmUpgCrvv/9MWv28h9riPerIuU8JiVLQ4qwgZ
 oQeUkd+EMTYrTvU6j9GfDbSuuxksHyhqsn3IrKKwzVb4Vf9/SiIZ+nWDUIz1FIAT/jvm pg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8u5n2knd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 22 Sep 2023 17:07:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38MH7wn2029331
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 22 Sep 2023 17:07:58 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 22 Sep
 2023 10:07:57 -0700
Message-ID: <ab9b2039-b746-9980-e28e-6a4eb9bbadeb@quicinc.com>
Date:   Fri, 22 Sep 2023 11:07:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] soc: qcom: smem: Document shared memory item IDs and
 corresponding structs
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>
CC:     <konrad.dybcio@linaro.org>, <linux-arm-msm@vger.kernel.org>
References: <20230915175907.17134-1-quic_jhugo@quicinc.com>
 <uk2rm42o7ndvg6rlhcw5zsmqp2c4a3ssqvbyhdigx6a7e3j2se@amf4mkeor34e>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <uk2rm42o7ndvg6rlhcw5zsmqp2c4a3ssqvbyhdigx6a7e3j2se@amf4mkeor34e>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BHEofqn8O4zuyY2fXnbu5Eby2QoJlwFk
X-Proofpoint-GUID: BHEofqn8O4zuyY2fXnbu5Eby2QoJlwFk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_15,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309220147
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/15/2023 7:37 PM, Bjorn Andersson wrote:
> On Fri, Sep 15, 2023 at 11:59:07AM -0600, Jeffrey Hugo wrote:
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
>>
>>   include/linux/soc/qcom/smem.h | 176 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 176 insertions(+)
>>
>> diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
>> index 223db6a9c733..2f8d1f3126a4 100644
>> --- a/include/linux/soc/qcom/smem.h
>> +++ b/include/linux/soc/qcom/smem.h
>> @@ -4,6 +4,182 @@
>>   
>>   #define QCOM_SMEM_HOST_ANY -1
>>   
>> +/* fixed items - these have a static position in shared memory */
>> +#define SMEM_PROC_COMM				0
> 
> Other parts of this interface are prefixed with qcom_.
> 
>> +#define SMEM_HEAP_INFO				1
>> +#define SMEM_ALLOCATION_TABLE			2
>> +#define SMEM_VERSION_INFO			3
>> +#define SMEM_HW_RESET_DETECT			4
> [..]
>> +
>> +/* Legacy communication protocol between "Apps" and "Modem" processors */
>> +struct smem_proc_comm {
> 
> This is already defined in smem.c, with the same name, but slightly
> different definition.

Unexpected, although I didn't look very hard.

My plan is to do this in phases.  First, gather all the information I 
can and put it in one place.  Then look at what we currently have in 
other committed drivers, and try to link those things up to this.  In 
many cases, I'm thinking we define the item here and have a reference 
comment to the implementation that occurs elsewhere.  All of that gets 
developed and hashed out before we commit a patch.

I think this addresses some of your further comments about overlap.

> I always envisioned that we would treat this as an smem-internal
> implementation detail and expose a function to invoke a proc command, if
> someone cared...
> 
> Does including it here in the client api definition make sense? Is the
> first entry in the smem_heap_entry list pointing to this data, even
> though it's part of the header?

I think having a function to send a proc command if someone cared makes 
sense.  I think keeping the struct in smem-internal and referencing it 
here for documentation purposes would be beneficial.  I don't think this 
needs to be in the client API for code to use.

Yes, smem_heap_entry[1] does point to this, even though its in the 
header.  Thats a quirk of the fixed memory items.

> 
>> +        __le32 command;
>> +        __le32 status;
>> +        __le32 data1;
>> +        __le32 data2;
>> +};
>> +
>> +/* Metadata structure for shared memory heap allocations */
>> +struct smem_heap_info {
> 
> This, and the next entry shouldn't be accessed outside the heap
> implementation itself...
> 
>> +        __le32 initialized;
>> +        __le32 free_offset;
>> +        __le32 heap_remaining;
>> +        __le32 reserved;
>> +};
>> +
>> +/* SMEM_ALLOCATION_TABLE is an array of these structures.  512 elements in the array. */
>> +struct smem_heap_entry {
>> +        __le32 allocated;
>> +        __le32 offset;
>> +        __le32 size;
>> +        __le32 reserved; /* bits 1:0 reserved, bits 31:2 aux smem base addr */
>> +};
>> +
>> +struct smem_version_info {
>> +	__le32 version[32];
>> +};
>> +
>> +struct smem_spinlock_array {
>> +	volatile __le32 lock[8];
>> +};
>> +
>> +#define FLASH_PART_MAGIC1       0x55EE73AA
>> +#define FLASH_PART_MAGIC2       0xE35EBDDB
>> +#define FLASH_PTABLE_V3         3
>> +#define FLASH_PTABLE_V4         4
>> +#define FLASH_PTABLE_MAX_PARTS_V3 16
>> +#define FLASH_PTABLE_MAX_PARTS_V4 32
>> +#define FLASH_PTABLE_ENTRY_NAME_SIZE 16
>> +
>> +struct flash_partition_entry {
>> +        char name[FLASH_PTABLE_ENTRY_NAME_SIZE];
>> +        __le32 offset;     /* Offset in blocks from beginning of device */
>> +        __le32 length;     /* Length of the partition in blocks */
>> +        u8 attr;           /* Flags for this partition */
>> +};
>> +
>> +struct flash_partition_table {
>> +        __le32 magic1;
>> +        __le32 magic2;
>> +        __le32 version;
>> +        __le32 numparts;
>> +        struct flash_partition_entry part_entry[FLASH_PTABLE_MAX_PARTS_V4];
>> +};
> 
> This information already exist in qcomsmempart.c, but with slightly
> different names.
> 
>> +
>> +/* SMEM_CHANNEL_ALLOC_TBL is an array of these.  Used for SMD. */
>> +struct smd_alloc_elm {
> 
> This is called qcom_smd_alloc_entry, in qcom_smd.c...
> 
> Regards,
> Bjorn
> 
>> +        char name[20];
>> +        __le32 cid;
>> +        __le32 type;
>> +        __le32 ref_count;
>> +};
>> +
>>   int qcom_smem_alloc(unsigned host, unsigned item, size_t size);
>>   void *qcom_smem_get(unsigned host, unsigned item, size_t *size);
>>   
>> -- 
>> 2.40.1
>>

