Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3186C4F5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 16:22:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231589AbjCVPWa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 11:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbjCVPWa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 11:22:30 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7403466D03;
        Wed, 22 Mar 2023 08:22:26 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32MDpjCh021258;
        Wed, 22 Mar 2023 15:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=qGTfLIc3drovlUBC/EyUNv5R9vD4u38xW+/xnKXdUgM=;
 b=YC2pJxuqps3W4JpZOfK/euOn+gIU+/528CsVZ1J7vhizACrjDT48DvpcdIo/Z3T7VTaV
 pXM6QR7csr6/7Zxov6fpBBnOAdc8D4GmbZwOqQgJ8AVf+1inc1R5/3HR2OdUdjF9o3iT
 d3ycl4Hdz1POG9e/4IWb8Px+jUxBx7jBqDB0fKU8Aj1wN6bbCQWBsaF/mducXJApSvkW
 G6ygXKPehccUjo1XeU7xLvpvFoBhFfbgecLjmyGX4otEcJZeqh3DERYt0zY5KXmB29K5
 7O3rUHrAkZdz6mhmPtjWMWrT/fMGp4NUaET7QWzOJlPqbRIGOVndnx8ICeqHTPHSNNY4 3Q== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pfdm4kevu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 22 Mar 2023 15:22:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32MFMFbN007425
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 22 Mar 2023 15:22:15 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 22 Mar
 2023 08:22:14 -0700
Message-ID: <0c297244-823f-9516-8708-d9b3cf1b22f9@quicinc.com>
Date:   Wed, 22 Mar 2023 09:22:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v4 1/8] accel/qaic: Add documentation for AIC100
 accelerator driver
Content-Language: en-US
To:     Bagas Sanjaya <bagasdotme@gmail.com>, <ogabbay@kernel.org>,
        <airlied@gmail.com>, <daniel@ffwll.ch>,
        <jacek.lawrynowicz@linux.intel.com>,
        <stanislaw.gruszka@linux.intel.com>
CC:     <dafna@fastmail.com>, <dri-devel@lists.freedesktop.org>,
        <quic_pkanojiy@quicinc.com>, <quic_carlv@quicinc.com>,
        <quic_ajitpals@quicinc.com>, <linux-doc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com>
 <1679325074-5494-2-git-send-email-quic_jhugo@quicinc.com>
 <ZBmxl0sFH5PBG36H@debian.me>
 <aa2ee071-952b-f8b5-bfcf-53cef99478be@quicinc.com>
 <ZBqGj+gyl4c5Yz7E@debian.me>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <ZBqGj+gyl4c5Yz7E@debian.me>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tjjCl4FJxx2c8aMpfpc7eQrzmPurUgAw
X-Proofpoint-GUID: tjjCl4FJxx2c8aMpfpc7eQrzmPurUgAw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_12,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220110
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/21/2023 10:39 PM, Bagas Sanjaya wrote:
> On Tue, Mar 21, 2023 at 03:52:11PM -0600, Jeffrey Hugo wrote:
>>>> +
>>>> +Request field descriptions:
>>>> +
>>>> +| req_id- request ID. A request FIFO element and a response FIFO element with
>>>> +|         the same request ID refer to the same command.
>>>> +
>>>> +| seq_id- sequence ID within a request. Ignored by the DMA Bridge.
>>>> +
>>>> +| pcie_dma_cmd- describes the DMA element of this request.
>>>> +| 	Bit(7) is the force msi flag, which overrides the DMA Bridge MSI logic
>>>> +| 		and generates a MSI when this request is complete, and QSM
>>>> +| 		configures the DMA Bridge to look at this bit.
>>>> +| 	Bits(6:5) are reserved.
>>>> +| 	Bit(4) is the completion code flag, and indicates that the DMA Bridge
>>>> +| 		shall generate a response FIFO element when this request is
>>>> +| 		complete.
>>>> +| 	Bit(3) indicates if this request is a linked list transfer(0) or a bulk
>>>> +| 		transfer(1).
>>>> +| 	Bit(2) is reserved.
>>>> +| 	Bits(1:0) indicate the type of transfer. No transfer(0), to device(1),
>>>> +| 		from device(2). Value 3 is illegal.
>>>> +
>>>> +| pcie_dma_source_addr- source address for a bulk transfer, or the address of
>>>> +|         the linked list.
>>>> +
>>>> +| pcie_dma_dest_addr- destination address for a bulk transfer.
>>>> +
>>>> +| pcie_dma_len- length of the bulk transfer. Note that the size of this field
>>>> +| 	limits transfers to 4G in size.
>>>> +
>>>> +| doorbell_addr- address of the doorbell to ring when this request is complete.
>>>> +
>>>> +| doorbell_attr- doorbell attributes.
>>>> +| 	Bit(7) indicates if a write to a doorbell is to occur.
>>>> +| 	Bits(6:2) are reserved.
>>>> +| 	Bits(1:0) contain the encoding of the doorbell length. 0 is 32-bit,
>>>> +| 		1 is 16-bit, 2 is 8-bit, 3 is reserved. The doorbell address
>>>> +| 		must be naturally aligned to the specified length.
>>>> +
>>>> +| doorbell_data- data to write to the doorbell. Only the bits corresponding to
>>>> +| 	the doorbell length are valid.
>>>> +
>>>> +| sem_cmdN- semaphore command.
>>>> +| 	Bit(31) indicates this semaphore command is enabled.
>>>> +| 	Bit(30) is the to-device DMA fence. Block this request until all
>>>> +| 		to-device DMA transfers are complete.
>>>> +| 	Bit(29) is the from-device DMA fence. Block this request until all
>>>> +| 		from-device DMA transfers are complete.
>>>> +| 	Bits(28:27) are reserved.
>>>> +| 	Bits(26:24) are the semaphore command. 0 is NOP. 1 is init with the
>>>> +| 		specified value. 2 is increment. 3 is decrement. 4 is wait
>>>> +| 		until the semaphore is equal to the specified value. 5 is wait
>>>> +| 		until the semaphore is greater or equal to the specified value.
>>>> +| 		6 is "P", wait until semaphore is greater than 0, then
>>>> +| 		decrement by 1. 7 is reserved.
>>>> +| 	Bit(23) is reserved.
>>>> +| 	Bit(22) is the semaphore sync. 0 is post sync, which means that the
>>>> +| 		semaphore operation is done after the DMA transfer. 1 is
>>>> +| 		presync, which gates the DMA transfer. Only one presync is
>>>> +| 		allowed per request.
>>>> +| 	Bit(21) is reserved.
>>>> +| 	Bits(20:16) is the index of the semaphore to operate on.
>>>> +| 	Bits(15:12) are reserved.
>>>> +| 	Bits(11:0) are the semaphore value to use in operations.
>>>
>>> What about bullet lists?
>>
>> It doesn't feel like the above fits into a bullet list structure.  Do you
>> have an example reference, or can you transform a small section of the above
>> to illustrate what you are thinking?
>>
> 
> Oops, sorry for suggesting the wrong construct.
> 
> Definition lists fit in this case, since there are request fields along
> with their individual descriptions. For bit lists, bullet lists should
> suffice.
> 
> Here is the illustration diff:
> 
> diff --git a/Documentation/accel/qaic/aic100.rst b/Documentation/accel/qaic/aic100.rst
> index 7ed95bb164bbeb..4d438fd8121451 100644
> --- a/Documentation/accel/qaic/aic100.rst
> +++ b/Documentation/accel/qaic/aic100.rst
> @@ -308,67 +308,79 @@ A request FIFO element has the following structure:
>   
>   Request field descriptions:
>   
> -| req_id- request ID. A request FIFO element and a response FIFO element with
> -|         the same request ID refer to the same command.
> +  req_id
> +      request ID. A request FIFO element and a response FIFO element with
> +      the same request ID refer to the same command.
>   
> -| seq_id- sequence ID within a request. Ignored by the DMA Bridge.
> +  seq_id
> +      sequence ID within a request. Ignored by the DMA Bridge.
>   
> -| pcie_dma_cmd- describes the DMA element of this request.
> -| 	Bit(7) is the force msi flag, which overrides the DMA Bridge MSI logic
> -| 		and generates a MSI when this request is complete, and QSM
> -| 		configures the DMA Bridge to look at this bit.
> -| 	Bits(6:5) are reserved.
> -| 	Bit(4) is the completion code flag, and indicates that the DMA Bridge
> -| 		shall generate a response FIFO element when this request is
> -| 		complete.
> -| 	Bit(3) indicates if this request is a linked list transfer(0) or a bulk
> -| 		transfer(1).
> -| 	Bit(2) is reserved.
> -| 	Bits(1:0) indicate the type of transfer. No transfer(0), to device(1),
> -| 		from device(2). Value 3 is illegal.
> +  pcie_dma_cmd
> +      describes the DMA element of this request.
>   
> -| pcie_dma_source_addr- source address for a bulk transfer, or the address of
> -|         the linked list.
> +      * Bit(7) is the force msi flag, which overrides the DMA Bridge MSI logic
> +        and generates a MSI when this request is complete, and QSM
> +        configures the DMA Bridge to look at this bit.
> +      * Bits(6:5) are reserved.
> +      * Bit(4) is the completion code flag, and indicates that the DMA Bridge
> +        shall generate a response FIFO element when this request is
> +        complete.
> +      * Bit(3) indicates if this request is a linked list transfer(0) or a bulk
> +      * transfer(1).
> +      * Bit(2) is reserved.
> +      * Bits(1:0) indicate the type of transfer. No transfer(0), to device(1),
> +      * from device(2). Value 3 is illegal.
>   
> -| pcie_dma_dest_addr- destination address for a bulk transfer.
> +  pcie_dma_source_addr
> +      source address for a bulk transfer, or the address of  the linked list.
>   
> -| pcie_dma_len- length of the bulk transfer. Note that the size of this field
> -| 	limits transfers to 4G in size.
> +  pcie_dma_dest_addr
> +      destination address for a bulk transfer.
>   
> -| doorbell_addr- address of the doorbell to ring when this request is complete.
> +  pcie_dma_len
> +      length of the bulk transfer. Note that the size of this field
> +      limits transfers to 4G in size.
>   
> -| doorbell_attr- doorbell attributes.
> -| 	Bit(7) indicates if a write to a doorbell is to occur.
> -| 	Bits(6:2) are reserved.
> -| 	Bits(1:0) contain the encoding of the doorbell length. 0 is 32-bit,
> -| 		1 is 16-bit, 2 is 8-bit, 3 is reserved. The doorbell address
> -| 		must be naturally aligned to the specified length.
> +  doorbell_addr
> +      address of the doorbell to ring when this request is complete.
>   
> -| doorbell_data- data to write to the doorbell. Only the bits corresponding to
> -| 	the doorbell length are valid.
> +  doorbell_attr
> +      doorbell attributes.
>   
> -| sem_cmdN- semaphore command.
> -| 	Bit(31) indicates this semaphore command is enabled.
> -| 	Bit(30) is the to-device DMA fence. Block this request until all
> -| 		to-device DMA transfers are complete.
> -| 	Bit(29) is the from-device DMA fence. Block this request until all
> -| 		from-device DMA transfers are complete.
> -| 	Bits(28:27) are reserved.
> -| 	Bits(26:24) are the semaphore command. 0 is NOP. 1 is init with the
> -| 		specified value. 2 is increment. 3 is decrement. 4 is wait
> -| 		until the semaphore is equal to the specified value. 5 is wait
> -| 		until the semaphore is greater or equal to the specified value.
> -| 		6 is "P", wait until semaphore is greater than 0, then
> -| 		decrement by 1. 7 is reserved.
> -| 	Bit(23) is reserved.
> -| 	Bit(22) is the semaphore sync. 0 is post sync, which means that the
> -| 		semaphore operation is done after the DMA transfer. 1 is
> -| 		presync, which gates the DMA transfer. Only one presync is
> -| 		allowed per request.
> -| 	Bit(21) is reserved.
> -| 	Bits(20:16) is the index of the semaphore to operate on.
> -| 	Bits(15:12) are reserved.
> -| 	Bits(11:0) are the semaphore value to use in operations.
> +      * Bit(7) indicates if a write to a doorbell is to occur.
> +      * Bits(6:2) are reserved.
> +      * Bits(1:0) contain the encoding of the doorbell length. 0 is 32-bit,
> +        1 is 16-bit, 2 is 8-bit, 3 is reserved. The doorbell address
> +        must be naturally aligned to the specified length.
> +
> +  doorbell_data
> +      data to write to the doorbell. Only the bits corresponding to
> +      the doorbell length are valid.
> +
> +  sem_cmdN
> +      semaphore command.
> +
> +      * Bit(31) indicates this semaphore command is enabled.
> +      * Bit(30) is the to-device DMA fence. Block this request until all
> +        to-device DMA transfers are complete.
> +      * Bit(29) is the from-device DMA fence. Block this request until all
> +        from-device DMA transfers are complete.
> +      * Bits(28:27) are reserved.
> +        Bits(26:24) are the semaphore command. 0 is NOP. 1 is init with the
> +        specified value. 2 is increment. 3 is decrement. 4 is wait
> +        until the semaphore is equal to the specified value. 5 is wait
> +        until the semaphore is greater or equal to the specified value.
> +        6 is "P", wait until semaphore is greater than 0, then
> +        decrement by 1. 7 is reserved.
> +      * Bit(23) is reserved.
> +      * Bit(22) is the semaphore sync. 0 is post sync, which means that the
> +        semaphore operation is done after the DMA transfer. 1 is
> +      * presync, which gates the DMA transfer. Only one presync is
> +      * allowed per request.
> +      * Bit(21) is reserved.
> +      * Bits(20:16) is the index of the semaphore to operate on.
> +      * Bits(15:12) are reserved.
> +      * Bits(11:0) are the semaphore value to use in operations.
>   
>   Overall, a request is processed in 4 steps:
>   
> 
> Thanks.

Ok.  This is making sense to me.  Thanks for the clarification.  I'll 
give this a try.

-Jeff
