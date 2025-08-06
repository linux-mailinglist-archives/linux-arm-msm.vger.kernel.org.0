Return-Path: <linux-arm-msm+bounces-67819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0CDB1BDFF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 02:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB2B5627F7C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 00:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01837288D6;
	Wed,  6 Aug 2025 00:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lqa7HURT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D8D13FEE
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 00:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754441154; cv=none; b=mNDfI9b8FyCB2ITxJPLTTN46fTLzjtJhaT/8dSmidb7t9o4mqaALyzAokgG2sXmYGbrrUrzQkN1ihh5nAiAJaiMgseYDEd4IJs6A1YBGHDYdVXlrnlt5q6pexF1MX8h7cYGLb+9PHgI/lEYvxpVe+qpWbz5OiVeWC2hJbowl/og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754441154; c=relaxed/simple;
	bh=GtJ9hkeudm0oq8iwmb8yoRxVECyeFoP9SFq1UVixiGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NieBXZFkx+j+yEiCJh10MbxuJFJo1UP1HdR8XdnP927ZrYukLVw+ipjWZ90ycVg9lrroW0JVf776aXYcS3yIvPqpNGfEJ4qUDq9OlZYeUYnTomX5X5fkZXn2YEpstcshe8IDT2iNvHUo8wq/dY92ZUJwoJOSvuuBrco2ibcarks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lqa7HURT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575I2l31015615
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 00:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0iF7VyAktj1df9uStQYVjfJ1tKq1t1jAnCoxG1j63Og=; b=Lqa7HURTFNlxNvtI
	M604CNroFqhwQv0SyDPFVLfZjZH5SG4e57qqdzE90SJ3n+r8o3a+i0lNiSs2QIYY
	JjCJRG3YpDGS7fpIKLueHnO1EXpK55ZjvyDoV01RhdhRJtXV8CriqXlLzqXOVGZP
	HLyJPLyzOA4IhSS9KQeNuOSvAJXpy9HgnVsBhPpE2Yiq6F2UXn+RlsOPrJDL3mox
	7eZQ6itChPlZUuPH1QbAsSZ66ixdbnVY+rK9KCez3GouHkPD+72jGiGa+cHtyqqk
	NhufmR9S3gGJi2LssloDK61t4Gbi5MfeZCNO+0Nsbt1lcFHwdKyZKiWBx7GMkryi
	grprMg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpvxrvs2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 00:45:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23fe984fe57so69227855ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 17:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754441151; x=1755045951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0iF7VyAktj1df9uStQYVjfJ1tKq1t1jAnCoxG1j63Og=;
        b=g8LjH0GcfyGZkOC9We8arKW/WSoYq2krq/eWJldTjCrT13189R6x9caFobT0CHth4U
         nXSxbkmXkTRHS8zHjKWwi6TPCSKtbez2stpSl2s2kEu77CtSg22bUR2gPrIZn//XIqAF
         Jm5GcrnTDo3zaW0zl8s4MD0of9b4fErZ/6/VARi5uH5ia87g5qUR4bXd6WI0mJRkzIUX
         Kjhg7oFunwQ53QNr0jffl4qHA+um2lOBxmVrmb2c9gvq6U/2oyWSZtnVxv8XA2+OdNz5
         G408HMZ2yWXsZkEDDrdtPo79zh3MejKP3uZ4KMGa94uIAFffWje2YWpdn2zjmbHTy36D
         yHvg==
X-Forwarded-Encrypted: i=1; AJvYcCWDdKvzdHkYRsGU3QVY6EO9Vq87cCjUfqvlmX7xLyj3CZrTjc/r0SXvqgRe3isjW1gDv1+fVWorZnyfRHhb@vger.kernel.org
X-Gm-Message-State: AOJu0YxbKXFujSVYRCsaOV58zW6eoprT6SxMWx4Ebi9414xYWFrcVndN
	Ne4mpyalrv9OU3vNTuQ03TpMuQUDLhS7/J+ZeRJMy4/Pt+daaDwUvWOn2UiVOClKlq8nfjAbXDd
	Z4fIwNK24Z3uzZawiN4OjGJSyS9/SuqDnjTU6lD3k1x6ngAZDXjVEv1zxn2Gf+K6CNcyY
X-Gm-Gg: ASbGncsVk+GRo9qGovFx+vAjgT0xLvCCvb1B2T2e5z/5KhvaWtV47LezOigd+kB8ZU6
	k0TpTxzxamDqGYtRKDundvjOiRni4thEHFE7P8oZXlCsUCodCU6p3Qh4qWDJVInz2JTz3uUG4nK
	4TaSpGzL/FcLIAR8i24zpEfl/qKgM3PJuv6S2B0yqo08qPUlbmV5ReDYwasrretrG+DzQ6Qkk1t
	0AertA1ykG0FLS675GEIlEwI3CMi9icKVZSSa8TWXAu9vB9c4FkkWjZahBXYDsuMJhfFlyF3y6a
	1Ba2R1hePpq3uKhY8t7BPxk1P0hCBSOckABlZisLxkaFX12BWLSwthYIgdU79Pf4h96RdF8lHyD
	M2pazQyCffAJZTAYjjJoIvRFQ
X-Received: by 2002:a17:903:120f:b0:240:8369:9b9d with SMTP id d9443c01a7336-242a0a90da9mr9569445ad.9.1754441150812;
        Tue, 05 Aug 2025 17:45:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvEEsM420ujNnosuNHEbFJFINBlZS10U2Hkuy33LauXmSRAro+5w56Hd5w+DB2dVJIMtSXIQ==
X-Received: by 2002:a17:903:120f:b0:240:8369:9b9d with SMTP id d9443c01a7336-242a0a90da9mr9569215ad.9.1754441150382;
        Tue, 05 Aug 2025 17:45:50 -0700 (PDT)
Received: from [10.133.33.195] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63f0ba97sm18047477a91.29.2025.08.05.17.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 17:45:50 -0700 (PDT)
Message-ID: <d7960d95-d076-4c0d-929c-421480f330d4@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 08:45:44 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/10] coresight: tmc: add create/delete functions for
 etr_buf_node
To: Mike Leach <mike.leach@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
 <20250725100806.1157-5-jie.gan@oss.qualcomm.com>
 <CAJ9a7VgOTfDHG+nrEUQ5+fxrcCd+ZaWWnxt_F8kavbHP38QCVw@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <CAJ9a7VgOTfDHG+nrEUQ5+fxrcCd+ZaWWnxt_F8kavbHP38QCVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwMCBTYWx0ZWRfX/miy36IBxC/A
 YPKz84kOwHgD2tdtRnzZK+ZSRXVaieFWJ/pMJc+sUjYUe1BPhcvn//lqXncZlVTDP1hWUuXSlDR
 tjC2ljNyoUMYgFLesO5M/zPziBtFapVy5kp+t9pBbeCZDC9e3hgLMOWRtpjBNXwc6jYBRH0GUMw
 9WuOL8rDicBXNcRdpa/KXNR4sBjX7qMwvN2unwSMDhtfIjWrpSaBAK0PEVQZpDXNu2RZMG5PF6f
 IHeHkckGMJxRgDhidrgN1a/xejWVuxCofZ7Kc+hvPC+8y46ZYclFul7SL2gJEXECA8VF0724lck
 JOuaT3xxtCWJ90uiroRJF0Xxwvqod6LD7ueRrUGxyCReqp5fbyWAwnN7kqK53Qt+gct14fNRJN+
 28es4WtTRx0BH192RRLpusk3gkCqQCS7Bk8DrLiTXsv++UGClHHWh9KJrieg/gdxtOK5SmP6
X-Proofpoint-ORIG-GUID: 7AOfzqu-dUCuZOd1vaq-UXqb9M112A5S
X-Proofpoint-GUID: 7AOfzqu-dUCuZOd1vaq-UXqb9M112A5S
X-Authority-Analysis: v=2.4 cv=U5WSDfru c=1 sm=1 tr=0 ts=6892a5c0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=_2nvVlcBbLE0w9leeUgA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508060000



On 8/5/2025 6:27 PM, Mike Leach wrote:
> Hi,
> 
> On Fri, 25 Jul 2025 at 11:08, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>
>> Create and insert or remove the etr_buf_node to/from the etr_buf_list.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../hwtracing/coresight/coresight-tmc-etr.c   | 65 +++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-tmc.h   |  2 +
>>   2 files changed, 67 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index b07fcdb3fe1a..e8ecb3e087ab 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> @@ -1909,6 +1909,71 @@ const struct coresight_ops tmc_etr_cs_ops = {
>>          .panic_ops      = &tmc_etr_sync_ops,
>>   };
>>
>> +/**
>> + * tmc_clean_etr_buf_list - clean the etr_buf_list.
>> + * @drvdata:   driver data of the TMC device.
>> + *
>> + * Remove the allocated node from the list and free the extra buffer.
>> + */
>> +void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
>> +{
>> +       struct etr_buf_node *nd, *next;
>> +
>> +       list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
>> +               if (nd->sysfs_buf == drvdata->sysfs_buf) {
>> +                       list_del(&nd->node);
>> +                       kfree(nd);
>> +               } else {
>> +                       /* Free allocated buffers which are not utilized by ETR */
>> +                       list_del(&nd->node);
>> +                       tmc_free_etr_buf(nd->sysfs_buf);
>> +                       nd->sysfs_buf = NULL;
>> +                       kfree(nd);
>> +               }
>> +       }
>> +}
>> +EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
>> +
>> +/**
>> + * tmc_create_etr_buf_node - create a node to store the alloc_buf and
>> + * insert the node to the etr_buf_list. Create a new buffer if the
>> + * alloc_buf is NULL.
>> + * @drvdata:   driver data of the TMC device.
>> + * @alloc_buf: the buffer that is inserted to the list.
>> + *
>> + * Return 0 upon success and return the error number if fail.
>> + */
>> +int tmc_create_etr_buf_node(struct tmc_drvdata *drvdata, struct etr_buf *alloc_buf)
> 
> This list handle function pair look a little asymmetric. Is it not
> possible to change this to tmc_create_etr_buf_list(struct tmc_drvdata
> *drvdata, int num_nodes)
> so that one function creates all the nodes, and another destroys them.
> 
> In the logic that decides between using multi buffer or single buffer
> you can then use  a construct such as:
> 
> if (single_buffer)
>        drvdata->sysfs_buf = <alloc sysfs buffer>
> else {
>       tmc_create_etr_buf_list(drvdata, 2);
>       <switch in avail buffer to drvdata->sysfs_buf
> }

The lsit handle function pair definitely looks a little bit asymmetric. 
I will consider the suggestion in next version.

Thanks,
Jie

> 
>> +{
>> +       struct etr_buf_node *sysfs_buf_node;
>> +       struct etr_buf *sysfs_buf;
>> +
>> +       if (!alloc_buf) {
>> +               sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
>> +               if (IS_ERR(sysfs_buf))
>> +                       return PTR_ERR(sysfs_buf);
>> +       } else
>> +               sysfs_buf = alloc_buf;
>> +
>> +       sysfs_buf_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
>> +       if (IS_ERR(sysfs_buf_node)) {
>> +               if (!alloc_buf)
>> +                       tmc_free_etr_buf(sysfs_buf);
>> +               return PTR_ERR(sysfs_buf_node);
>> +       }
>> +
>> +       sysfs_buf_node->sysfs_buf = sysfs_buf;
>> +       sysfs_buf_node->reading = false;
>> +       if (!alloc_buf)
>> +               sysfs_buf_node->is_free = true;
>> +       else
>> +               sysfs_buf_node->is_free = false;
>> +       list_add(&sysfs_buf_node->node, &drvdata->etr_buf_list);
>> +
>> +       return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(tmc_create_etr_buf_node);
>> +
>>   int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>>   {
>>          int ret = 0;
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
>> index 52ee5f8efe8c..3cb8ba9f88f5 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>> @@ -461,5 +461,7 @@ void tmc_etr_remove_catu_ops(void);
>>   struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
>>                                     enum cs_mode mode, void *data);
>>   extern const struct attribute_group coresight_etr_group;
>> +void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
>> +int tmc_create_etr_buf_node(struct tmc_drvdata *drvdata, struct etr_buf *alloc_buf);
>>
>>   #endif
>> --
>> 2.34.1
>>
> 
> Regards
> 
> Mike


