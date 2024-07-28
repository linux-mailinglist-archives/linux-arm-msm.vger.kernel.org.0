Return-Path: <linux-arm-msm+bounces-27147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEE293E58A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jul 2024 15:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED212B218BB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jul 2024 13:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA0231B86C2;
	Sun, 28 Jul 2024 13:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FsjW0xvy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C9F3FB1B
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jul 2024 13:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722174071; cv=none; b=g91jJMItUYeaSk3jVHWc1aqPRrFHc3e82OoBLuaZpY/LuBZbd2CvV1hSLA0hM9FAmmPNQ0FZiMsF/62gTMVW6N4wH1+xhTNbz3RsGyPpiNhf5yiDQAAAXJ8T7I42cy7g8Bif+zgm8U8N1g9Ln4zAz2feutzSE6r2te0N3ZazVbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722174071; c=relaxed/simple;
	bh=J4LjWnWwimI/QNsP3a6ashFHADmIU9OsSn/Qiqg9sFg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=BrRTGOsGxe4orqn8IUjIJd2bX3P1gmzUwZugnJIvBwwkzHZyxUOzS4iS60jm5wv3qdUouqBCaZSPr/QyLrNfx9MExOlsTcPv7WkTsfc7TQwDqJdm85Lr9JYw52LvukHKgyvgjOt7PdwIyLRRFXKMw8mYbgG7ZsoyLv0Qt7OVEWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FsjW0xvy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46SDApuu002454;
	Sun, 28 Jul 2024 13:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	znW6PwV+C5J35j7vx1akVLZulFkd1vSy7SdpiY4eVYc=; b=FsjW0xvyJknbl4oo
	7T1XXvvt6fgqrXnw2NmR66qTiWI6ffVtRw8NpYh6zYPwXH8vqCQQwj9dIS3uBBxK
	QXY62+4qD6HsSxkDMoRepCkN3YfHxeUXGn69vdrGEkVL+Rt0viYtneCo2ADicH4d
	qOu8TmB8fKg7DLMioEA0/p/Nle713WIQamlpaVAwL2mRkaZUA5gNxiEnyI1rog77
	hGOmRf+qgvSzDvuYsB4F3AOglIWLIzMVJqD6o4kdQYhq0Y8Uq0FjstV/o8GwOAvu
	dKvE4+/BGEixegtI52GJVwkQqyhIXlWq3QMe6pkRYzDdmVJetMiA/Cq741L9YC7E
	JL1e1w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mt2khuar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Jul 2024 13:41:06 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46SDf6Nh021969
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Jul 2024 13:41:06 GMT
Received: from [10.216.18.81] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 28 Jul
 2024 06:41:03 -0700
Message-ID: <8b9c7b81-5a4f-4576-9e4e-1bfce6644e59@quicinc.com>
Date: Sun, 28 Jul 2024 19:11:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gokul Sriram P <quic_gokulsri@quicinc.com>
Subject: Re: [PATCH 1/6] drivers: bus: mhi: Added shared-dma-pool support for
 mhi_dev
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_gokulsri@quiconc.com>
References: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
 <20240718061344.575653-2-quic_gokulsri@quicinc.com>
 <5bf07c79-4dd2-57d8-91f1-4cd4970185d4@quicinc.com>
Content-Language: en-US
In-Reply-To: <5bf07c79-4dd2-57d8-91f1-4cd4970185d4@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TmIV7uGn0E1XvsgZkJTiNLaE_Z8llcSB
X-Proofpoint-GUID: TmIV7uGn0E1XvsgZkJTiNLaE_Z8llcSB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-28_10,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407280100


On 7/18/2024 9:47 PM, Jeffrey Hugo wrote:
> $SUBJECT looks wrong
>
> On 7/18/2024 12:13 AM, Gokul Sriram Palanisamy wrote:
>> When using default memory for coherent memory allocation without
>> reservation, memory gets fragmented after several mhi
>> register/unregister cycles and no coherent reservation was possible.
>>
>> Client driver registering MHI shall reserve a dedicated region as
>> shared-dma-pool for mhi to help avoid this situation. On boards
>> which doesn't reserve this memory, it will continue to allocate
>> memory from default memory.
>>
>> DMA pool is reserved for coherent allocations of size SZ_512K
>> (mhi_cntrl->seg_len) to avoid fragmentation and always ensure
>> allocations of SZ_512K succeeds. Allocations of lower order from the
>> reserved memory would lead to fragmentation on multiple alloc/frees.
>> So use dma_alloc_coherent from mhi_cntrl->cntrl_dev for allocations
>> lower than mhi_cntrl->seg_len. If coherent pool is not reserved, all
>> reservations go through mhi_cntrl->cntrl_dev.
>>
>> Co-developed-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
>> ---
>>   drivers/bus/mhi/host/boot.c     | 19 ++++++------
>>   drivers/bus/mhi/host/init.c     | 51 +++++++++++++++++++++++++++++++++
>>   drivers/bus/mhi/host/internal.h | 26 +++++++++++++++++
>>   include/linux/mhi.h             |  5 ++++
>>   4 files changed, 91 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
>> index dedd29ca8db3..ca842facf820 100644
>> --- a/drivers/bus/mhi/host/boot.c
>> +++ b/drivers/bus/mhi/host/boot.c
>> @@ -303,8 +303,8 @@ void mhi_free_bhie_table(struct mhi_controller 
>> *mhi_cntrl,
>>       struct mhi_buf *mhi_buf = image_info->mhi_buf;
>>         for (i = 0; i < image_info->entries; i++, mhi_buf++)
>> -        dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
>> -                  mhi_buf->buf, mhi_buf->dma_addr);
>> +        mhi_fw_free_coherent(mhi_cntrl, mhi_buf->len,
>> +                     mhi_buf->buf, mhi_buf->dma_addr);
>>         kfree(image_info->mhi_buf);
>>       kfree(image_info);
>> @@ -340,9 +340,9 @@ int mhi_alloc_bhie_table(struct mhi_controller 
>> *mhi_cntrl,
>>               vec_size = sizeof(struct bhi_vec_entry) * i;
>>             mhi_buf->len = vec_size;
>> -        mhi_buf->buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev,
>> -                          vec_size, &mhi_buf->dma_addr,
>> -                          GFP_KERNEL);
>> +        mhi_buf->buf = mhi_fw_alloc_coherent(mhi_cntrl, vec_size,
>> +                             &mhi_buf->dma_addr,
>> +                             GFP_KERNEL);
>>           if (!mhi_buf->buf)
>>               goto error_alloc_segment;
>>       }
>> @@ -355,8 +355,8 @@ int mhi_alloc_bhie_table(struct mhi_controller 
>> *mhi_cntrl,
>>     error_alloc_segment:
>>       for (--i, --mhi_buf; i >= 0; i--, mhi_buf--)
>> -        dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
>> -                  mhi_buf->buf, mhi_buf->dma_addr);
>> +        mhi_fw_free_coherent(mhi_cntrl, mhi_buf->len,
>> +                     mhi_buf->buf, mhi_buf->dma_addr);
>>     error_alloc_mhi_buf:
>>       kfree(img_info);
>> @@ -452,8 +452,7 @@ void mhi_fw_load_handler(struct mhi_controller 
>> *mhi_cntrl)
>>       fw_sz = firmware->size;
>>     skip_req_fw:
>> -    buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev, size, &dma_addr,
>> -                 GFP_KERNEL);
>> +    buf = mhi_fw_alloc_coherent(mhi_cntrl, size, &dma_addr, 
>> GFP_KERNEL);
>>       if (!buf) {
>>           release_firmware(firmware);
>>           goto error_fw_load;
>> @@ -462,7 +461,7 @@ void mhi_fw_load_handler(struct mhi_controller 
>> *mhi_cntrl)
>>       /* Download image using BHI */
>>       memcpy(buf, fw_data, size);
>>       ret = mhi_fw_load_bhi(mhi_cntrl, dma_addr, size);
>> -    dma_free_coherent(mhi_cntrl->cntrl_dev, size, buf, dma_addr);
>> +    mhi_fw_free_coherent(mhi_cntrl, size, buf, dma_addr);
>>         /* Error or in EDL mode, we're done */
>>       if (ret) {
>> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
>> index ce7d2e62c2f1..c1e1412c43e2 100644
>> --- a/drivers/bus/mhi/host/init.c
>> +++ b/drivers/bus/mhi/host/init.c
>> @@ -8,9 +8,12 @@
>>   #include <linux/debugfs.h>
>>   #include <linux/device.h>
>>   #include <linux/dma-direction.h>
>> +#include <linux/dma-map-ops.h>
>>   #include <linux/dma-mapping.h>
>>   #include <linux/idr.h>
>>   #include <linux/interrupt.h>
>> +#include <linux/of_address.h>
>> +#include <linux/of_reserved_mem.h>
>
> NACK.  Not all platforms that use MHI have devicetree.
>
Got it. Removed this patch. This can be addressed from client driver 
that need this feature.

Regards,

Gokul


