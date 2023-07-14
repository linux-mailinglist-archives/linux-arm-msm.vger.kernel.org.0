Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB85753FAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jul 2023 18:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235323AbjGNQOk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jul 2023 12:14:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236281AbjGNQOe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jul 2023 12:14:34 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E21130DA;
        Fri, 14 Jul 2023 09:14:33 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36EF0l4I026819;
        Fri, 14 Jul 2023 16:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=4xZPpQEHTDmM84AwgfhhibgFOn4KDk1a3h8bMfKX0gE=;
 b=MqkW04/G5Gvq6N4LzY95TXuTNRKJQjE+0MZMcSaR5JuLZFwEst5QQgb1QBA/+Bz40Hsg
 X5r+SKeSNGKdyF7haVYRlTC+RSg1wKfmEjpeiR9gdozAHilDduc6SIe35Spr7bF92Zjk
 wiJ0vF5cO4WT070lLVPWpbhrRa7MzFqRKJZNPNljiWHyQx/UUmdiZrN8JUCnaDvZE/UH
 vHY5Pmh5dt+Z1GfqeRO59e+pHcu2AE+5+oEUj/nd0Vg3n78UpzcFapI5WUhWxZHFdHEM
 XXmr8T2PIsCoegZ3yBKCEyTFnQG6IKDA65A9p14t6ZbT9FYWsyNCcaW/1jir6FAXcL49 DA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rtpugt53h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 14 Jul 2023 16:14:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36EGEPRV003217
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 14 Jul 2023 16:14:25 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 14 Jul
 2023 09:14:24 -0700
Message-ID: <230c9ed2-9d4d-1116-c82e-f328beffdfb7@quicinc.com>
Date:   Fri, 14 Jul 2023 10:14:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 3/5 v4] accel/qaic: Add consistent integer overflow checks
Content-Language: en-US
To:     Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
CC:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <kernel-janitors@vger.kernel.org>
References: <ZK0Q7IsPkj6WSCcL@moroto>
 <77af5fda-e721-6c89-40f5-09acd2c8f63f@quicinc.com>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <77af5fda-e721-6c89-40f5-09acd2c8f63f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BW2jH8aTzSHbtKVEKScTqI8Hol3tVVpG
X-Proofpoint-ORIG-GUID: BW2jH8aTzSHbtKVEKScTqI8Hol3tVVpG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_06,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307140147
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/14/2023 5:44 AM, Pranjal Ramajor Asha Kanojiya wrote:
> 
> 
> On 7/11/2023 1:51 PM, Dan Carpenter wrote:
>> The encode_dma() function has integer overflow checks.  The
>> encode_passthrough(), encode_activate() and encode_status() functions
>> did not.  I added integer overflow checking everywhere.  I also
>> updated the integer overflow checking in encode_dma() to use size_add()
>> so everything is consistent.
>>
>> Fixes: 129776ac2e38 ("accel/qaic: Add control path")
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>> ---
>> v2: no change
>>
>>   drivers/accel/qaic/qaic_control.c | 14 ++++++--------
>>   1 file changed, 6 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/accel/qaic/qaic_control.c 
>> b/drivers/accel/qaic/qaic_control.c
>> index 752b67aff777..23680f5f1902 100644
>> --- a/drivers/accel/qaic/qaic_control.c
>> +++ b/drivers/accel/qaic/qaic_control.c
>> @@ -367,7 +367,7 @@ static int encode_passthrough(struct qaic_device 
>> *qdev, void *trans, struct wrap
>>       if (in_trans->hdr.len % 8 != 0)
>>           return -EINVAL;
>> -    if (msg_hdr_len + in_trans->hdr.len > QAIC_MANAGE_EXT_MSG_LENGTH)
>> +    if (size_add(msg_hdr_len, in_trans->hdr.len) > 
>> QAIC_MANAGE_EXT_MSG_LENGTH)
>>           return -ENOSPC;
>>       trans_wrapper = add_wrapper(wrappers,
>> @@ -558,12 +558,10 @@ static int encode_dma(struct qaic_device *qdev, 
>> void *trans, struct wrapper_list
>>       msg = &wrapper->msg;
>>       msg_hdr_len = le32_to_cpu(msg->hdr.len);
>> -    if (msg_hdr_len > (UINT_MAX - QAIC_MANAGE_EXT_MSG_LENGTH))
>> -        return -EINVAL;
>> -
>>       /* There should be enough space to hold at least one ASP entry. */
>> -    if (msg_hdr_len + sizeof(*out_trans) + sizeof(struct 
>> wire_addr_size_pair) >
>> -        QAIC_MANAGE_EXT_MSG_LENGTH)
>> +    if (size_add(msg_hdr_len,
>> +             sizeof(*out_trans) + sizeof(struct wire_addr_size_pair)) >
> 
> Can we have the entire size_add() on same line?
> 
>> +             QAIC_MANAGE_EXT_MSG_LENGTH)
>>           return -ENOMEM;
>>       if (in_trans->addr + in_trans->size < in_trans->addr || 
>> !in_trans->size)
>> @@ -635,7 +633,7 @@ static int encode_activate(struct qaic_device 
>> *qdev, void *trans, struct wrapper
>>       msg = &wrapper->msg;
>>       msg_hdr_len = le32_to_cpu(msg->hdr.len);
>> -    if (msg_hdr_len + sizeof(*out_trans) > QAIC_MANAGE_MAX_MSG_LENGTH)
>> +    if (size_add(msg_hdr_len, sizeof(*out_trans)) > 
>> QAIC_MANAGE_MAX_MSG_LENGTH)
>>           return -ENOSPC;
>>       if (!in_trans->queue_size)
>> @@ -719,7 +717,7 @@ static int encode_status(struct qaic_device *qdev, 
>> void *trans, struct wrapper_l
>>       msg = &wrapper->msg;
>>       msg_hdr_len = le32_to_cpu(msg->hdr.len);
>> -    if (msg_hdr_len + in_trans->hdr.len > QAIC_MANAGE_MAX_MSG_LENGTH)
>> +    if (size_add(msg_hdr_len, in_trans->hdr.len) > 
>> QAIC_MANAGE_MAX_MSG_LENGTH)
>>           return -ENOSPC;
>>       trans_wrapper = add_wrapper(wrappers, sizeof(*trans_wrapper));
> 
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

Pushed to drm-misc-fixes

-Jeff
