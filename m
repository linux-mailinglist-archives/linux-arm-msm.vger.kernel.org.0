Return-Path: <linux-arm-msm+bounces-102911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aC/INqqz3GlVVgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:13:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 509863E9A9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46AE130209D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 09:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9376D3AD53D;
	Mon, 13 Apr 2026 09:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ncBPZl42";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KKZod9xH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412C93815DB
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071130; cv=none; b=tVd9La7iqHtXC2pOtj+MRlG0nliNLrheWNVEOH1268/aBlJunceJMBnioIeZBCIohiHYYpCJ9DVZgeFV84mzLkhQOj9R+L3T7CTA0hfKUwd1K2ogMuvKfevSG6o2mKh4YqxgHmfWymkmcC5Dau4RDUApxurq11Gb+OMN2k8kSB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071130; c=relaxed/simple;
	bh=XUSWjMqY1TcVj/lT9b3VTx7DlNhLHwV3UnSmPKiLVH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IrMtEfsXGX7kzjt9sGDFjAZjLfuKys0/akGgFMxly3gXSyE6unTEno+ALWs7WRV9kW7jwweoe1OVfqKrLofZy2PJreEAzXwPMoMCARyCeG2dy8fkhO5Z4v9qrsEX6rQKcPNF/eY7PJHGSgwvgOAvIHmLF6oSO5lsZgUpT/7b+/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ncBPZl42; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KKZod9xH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D66Eju2154386
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X5iNUwt3gQbVraQOHa8N/Wm3vJZe0sjOtQUigB7egSg=; b=ncBPZl42vKT0s68i
	YjZ2sTRDO+TtXN2sVm07lZYm+vdcxWR8JTayAgAtKS46DeK0k1NZuyOzT8j0Yljs
	J0Z87KhGON0fVjyWpfDLyiNrTZ/50vJTpC4CWa64U8NzqZK6jbjmROZyxbzV+53Y
	nV5HUrQLiK73lWGhSTWWTZDD1f7p0I5f9Dr6HLT4F7Cfm5Vjxqrrw/Q+wRVXCeNo
	YImpEQIX6DUbDAG71sMqROrYnUnlhwxsomWhIah7w2NaEtahAJg8iHrebk2WhmRO
	qGhfpZAl9RWzoWREmyhUj8/8+WclYO3XxU9pi8EqUy3Ft+iBhdJqbG4Aoy0bFg2z
	oXUqpw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffk6mk0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:05:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c76b0e04285so1750088a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 02:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776071128; x=1776675928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X5iNUwt3gQbVraQOHa8N/Wm3vJZe0sjOtQUigB7egSg=;
        b=KKZod9xHtaTYssWf5CSGR1ZCNiA8f7bimhqBDW4M3yODNlPuO+pCkwbSzpa92nif7y
         jOmJClaVjNHbHL+3PU+6NRImg1Fx8qL90bS1Ue4rj/q5f6Z4CDitpOxxV+8MjA24C/UT
         ETDel7pVb+ZKe/ATFqPaspJov54JXTnUz+CpZVCClY+HckQ6m03fDUMh9H1IJl5a90uV
         9TIV+n+tXq6mjgp+fvlDNzW0CDgJ3TR8MhuqRPSrVIlnAfs0haAKTrDbwdt5BO8h8Mbs
         S4Lo0zXmY78kEnsxshVFpcwZPi+212wFqHnTtTnlPEA9+LYiMKM1tDP1v2M34kC2vC5b
         ylWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071128; x=1776675928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5iNUwt3gQbVraQOHa8N/Wm3vJZe0sjOtQUigB7egSg=;
        b=QlKrCGanrrNVJlhPMVacBFs0hiwo/TgpKVvCeitc0MAOEGkpbWsfnrZXM6fMs8pIBI
         8tgGwq6i/vZ6C2YOyElmjzwnN5ZYmtXr5QwIyTEdYzFXTEkctoDTO3R533VfQ6LTh7Es
         ad4IyKuWAP+dXzjv4n5cfQaNfo7LLtP/hczIbMrjEWooiqYP6k9rumFBZbH6COTeDhJr
         IA+NAUk1gD+XwOddmxtP+0/7W9F/D1/yUeCQi6R2vJdUEokHrlyJ221ZjWBq8Aoo/7EZ
         wT89GirSRplU7mgvQN5TwCT7gFA0gtoYMoI84i6RbmaRxwCKS8F7/Ndqur9nllcEqBuh
         q7+w==
X-Forwarded-Encrypted: i=1; AFNElJ/CnnI/6ESA41PxL7wZzmUVR/aF3gAPofhqJS7tCrWaf6J3DEIRfA/AF9l+3StfsHjXffOFkU4nm7cSW9Rv@vger.kernel.org
X-Gm-Message-State: AOJu0YzccMNQXERw8JYWntsrmEVa/tcMNgUvAzp1Il+sbrAenOtiPSeb
	+SsHjeONlLxz303KV+CwEUI0r3Re53AJTfKMZBGj/hVCllJYHLHjBpRaJztsQ9i8Wg8ZRF7TWaP
	3od06gzWSKH+fu/Y6YtrhD/Dw1KIArJEO76V2lwhTtPkdGJgXbtA+hOL9cg91SgmjMlEC
X-Gm-Gg: AeBDiesTGY6C6TA1i4aFYsjweQVxkHDCVbK/xonii2pus5nuBLdQlyV3mZiMaiFA92m
	sG/bwc/QPO2Jlg1TRWEhuXXi43WzAP4bJ5IFascXARle3lOZpL/lU7hcVEpd+lLsWsPEstLi2Pi
	1EagC0inZCop1ek5kwJBIEBfDfENP8YfaTTzkExAoCZKP/XINDJplrdD+CxZADrUMne8P9PMDeP
	2OveMC/cuTiR0loTTQbSoT+r1TNJ/zgKXr1LK2Bm94STn7QN4Kb7O4pBX+jKuaGE/hAYL+sWplF
	3157IGbylc0DXGPtoBQkUhXkI9Ta1PyRQgbUZkjKGW24vDuMiECPi9/8Oxp+aLyvZkM6gLe+jnt
	FFjeKs8wvy2QgxK5n05DH+ICk+BTa+HFfRm/AR+ZE4VuCauoEqeQLmjg=
X-Received: by 2002:a05:6a20:3953:b0:398:7eea:50a0 with SMTP id adf61e73a8af0-39fe3da99c8mr14281945637.18.1776071127865;
        Mon, 13 Apr 2026 02:05:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:3953:b0:398:7eea:50a0 with SMTP id adf61e73a8af0-39fe3da99c8mr14281886637.18.1776071127179;
        Mon, 13 Apr 2026 02:05:27 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79218fc7e7sm9366906a12.10.2026.04.13.02.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:05:26 -0700 (PDT)
Message-ID: <62078c92-ab6e-46ca-85b6-ff02b8b4cdf3@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 14:35:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/9] bus: mhi: Capture DDR training data using command
 mode
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-7-47ad79308762@oss.qualcomm.com>
 <031702af-5976-438a-841a-48e95f41eb03@oss.qualcomm.com>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <031702af-5976-438a-841a-48e95f41eb03@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4OCBTYWx0ZWRfX+dMSOZdHY64+
 FSzJJ+3/xrth0G3azJocJa0VTv6D3pOfA3jei1YvIdw+/fRv5WK0jexnqIs/nTlT7hkfDlll4rU
 6leHkpPpfMXFKYk7NsKF1rKHK0qaZ8f+YFWBFdxDvtUuILFusseywLk8Asd+2WeQ4SaQZQmANud
 9PCK5QqdIElrM6bbVv4FB+NTir0KPmhHh+WGH2o+aMrAqWPUdN7PIQcPuVkiPLS/oq4WEmwn5N3
 yniHH3DrfSKjqIVxfM+v9nldqFEdpFQuvJukXKQssGP081Aa3LpQHXUwSBl+fOCJ/wG8mkDuPkP
 NPLx36wdate4Sgz62KwDUOaxwQ0rU9BoW/YrBTkAQXKSqNKz7/Y4awQL/UijusjR/2/87D0xp3+
 cCf5YZcvMW0j8wRERbTiDPhtRLMsAF7OZFKCwmkZsv2gpWu/6pb1KBl/xeHn3wHR42j3Fp4AIla
 YlgzUCywiw2EhoQrSdQ==
X-Authority-Analysis: v=2.4 cv=YM2vDxGx c=1 sm=1 tr=0 ts=69dcb1d8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VNyJVnxpnutqXYa9aisA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: iT3JZO8jVLPde7hLYwoYzTh7ID7B2BKY
X-Proofpoint-ORIG-GUID: iT3JZO8jVLPde7hLYwoYzTh7ID7B2BKY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-102911-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 509863E9A9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/10/2026 2:57 AM, Jeff Hugo wrote:
> On 3/19/2026 12:31 AM, Kishore Batta wrote:
>> During early boot, devices may perform DDR training and produce training
>> data that can be reused on subsequent boots to reduce initialization
>> time. The sahara protocol provides a command mode flow to transfer this
>
> Sahara

ACK. Will correct it.
>
>> training data to the host, but the driver currently does not handle
>> command mode and drops the training payload.
>>
>> Add Sahara command mode support to retrieve DDR training data from the
>> device. When the device enters command mode and sends CMD_READY, query
>> the support command list and request DDR training data using EXECUTE and
>> EXECUTE_DATA. Allocate receive buffers based on the reported response
>> size and copy the raw payload directly from the MHI DL completion
>> callback.
>>
>> Store the captured training data in controller-scoped memory using 
>> devres,
>> so it remains available after sahara channel teardown. Also distinguish
>
> Sahara

ACK. Will correct it.
>
>> raw payload completion from control packets in the DL callback, avoiding
>> misinterpretation of training data as protocol messages, and requeue
>> the RX buffer after switching back to IMAGE_TX_PENDING to allow the
>> boot flow to continue.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/sahara/sahara.c | 328 
>> +++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 320 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/sahara/sahara.c 
>> b/drivers/bus/mhi/sahara/sahara.c
>> index 
>> 0a0f578aaa47ab2c4ca0765666b392fb9936ddd5..c88f1220199ac4373d3552167870c19a0d5f23b9 
>> 100644
>> --- a/drivers/bus/mhi/sahara/sahara.c
>> +++ b/drivers/bus/mhi/sahara/sahara.c
>> @@ -5,11 +5,14 @@
>>    */
>>     #include <linux/devcoredump.h>
>> +#include <linux/device.h>
>> +#include <linux/device/devres.h>
>>   #include <linux/firmware.h>
>>   #include <linux/limits.h>
>>   #include <linux/mhi.h>
>>   #include <linux/minmax.h>
>>   #include <linux/mod_devicetable.h>
>> +#include <linux/mutex.h>
>>   #include <linux/overflow.h>
>>   #include <linux/sahara.h>
>>   #include <linux/types.h>
>> @@ -60,8 +63,16 @@
>>   #define SAHARA_RESET_LENGTH        0x8
>>   #define SAHARA_MEM_DEBUG64_LENGTH    0x18
>>   #define SAHARA_MEM_READ64_LENGTH    0x18
>> -
>> +#define SAHARA_COMMAND_READY_LENGTH    0x8
>> +#define SAHARA_COMMAND_EXEC_RESP_LENGTH    0x10
>> +#define SAHARA_COMMAND_EXECUTE_LENGTH    0xc
>> +#define SAHARA_COMMAND_EXEC_DATA_LENGTH    0xc
>> +#define SAHARA_SWITCH_MODE_LENGTH    0xc
>> +
>> +#define SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST    0x8
>> +#define SAHARA_EXEC_CMD_GET_TRAINING_DATA    0x9
>>   #define SAHARA_DDR_TRAINING_IMG_ID    34
>
> Why is the indentation of this line messed up?

ACK. Will correct it.
>
>> +#define SAHARA_NUM_CMD_BUF SAHARA_NUM_TX_BUF
>>     struct sahara_packet {
>>       __le32 cmd;
>> @@ -97,6 +108,19 @@ struct sahara_packet {
>>               __le64 memory_address;
>>               __le64 memory_length;
>>           } memory_read64;
>> +        struct {
>> +            __le32 client_command;
>> +        } command_execute;
>> +        struct {
>> +            __le32 client_command;
>> +            __le32 response_length;
>> +        } command_execute_resp;
>> +        struct {
>> +            __le32 client_command;
>> +        } command_exec_data;
>> +        struct {
>> +            __le32 mode;
>> +        } mode_switch;
>>       };
>>   };
>>   @@ -163,6 +187,7 @@ struct sahara_context {
>>       struct work_struct        fw_work;
>>       struct work_struct        dump_work;
>>       struct work_struct        read_data_work;
>> +    struct work_struct        cmd_work;
>>       struct mhi_device        *mhi_dev;
>>       const char * const        *image_table;
>>       u32                table_size;
>> @@ -183,6 +208,24 @@ struct sahara_context {
>>       bool                is_mem_dump_mode;
>>       bool                non_streaming;
>>       const char            *fw_folder;
>> +    bool                is_cmd_mode;
>> +    bool                receiving_trng_data;
>
> You already spell out "receiving", spell out "training".  I don't 
> recall seeing "trng" before so it seems like a really uncommon shortform.


ACK. Will correct it.

>
>> +    size_t                trng_size;
>> +    size_t                trng_rcvd;
>> +    u32                trng_nbuf;
>> +    char                *cmd_buff[SAHARA_NUM_CMD_BUF];
>> +};

