Return-Path: <linux-arm-msm+bounces-2259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6EB7FB912
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 12:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BDF41C212EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 11:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823E74F1F5;
	Tue, 28 Nov 2023 11:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XHlvLrYe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B6471B6;
	Tue, 28 Nov 2023 03:11:07 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AS7uDwU024766;
	Tue, 28 Nov 2023 11:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8FAXkWBYrPSRqEtAkv6xAs3TFZ59ygYPE3QmyZ9OgR8=;
 b=XHlvLrYewL0MmOJRO9fmZv/DRBopVJ1iTwXGmYMoXDTqFw5fsQW7IjqR1N21VvSTn+FC
 B594bcUgUbNzbDEOcDQpQB1flUeRtBQQOuAf0f78+SiK0iSiE1Fw6c0+wfN0e96nYoP+
 frQ3e9y1Uj+lx0SWeFbE6tDwDG4OfATSPxybAvRnlbvCeY8FPVshYIaSGTuxA1sJdtjH
 AjSoizvrp45XRv3BMLyNVT9AJf6jlMOWhwxYNAhGPZcb37YaVdKr5o1L456seL+jST15
 ojXs1i8H/XTHesXnSJCC5xL+mLvNI5ebhKjdticu/FuYBvZkAeXyrB9g1JLnyge2xFU7 VQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3un586saud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 11:10:40 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ASBAdGV013802
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 11:10:39 GMT
Received: from [10.214.66.81] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 28 Nov
 2023 03:10:28 -0800
Message-ID: <49c883aa-0f5d-2e5f-adbb-c6793417cb89@quicinc.com>
Date: Tue, 28 Nov 2023 16:40:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Patch v6 11/12] pstore/ram: Add ramoops ready notifier support
Content-Language: en-US
To: Pavan Kondeti <quic_pkondeti@quicinc.com>
CC: <corbet@lwn.net>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <keescook@chromium.org>, <tony.luck@intel.com>, <gpiccoli@igalia.com>,
        <mathieu.poirier@linaro.org>, <vigneshr@ti.com>, <nm@ti.com>,
        <matthias.bgg@gmail.com>, <kgene@kernel.org>,
        <alim.akhtar@samsung.com>, <bmasney@redhat.com>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <kernel@quicinc.com>
References: <1700864395-1479-1-git-send-email-quic_mojha@quicinc.com>
 <1700864395-1479-12-git-send-email-quic_mojha@quicinc.com>
 <3636dc3a-b62b-4ff9-bdc3-fec496a804b7@quicinc.com>
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <3636dc3a-b62b-4ff9-bdc3-fec496a804b7@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: duB5Ntv4qgny-VadpK28Oy0mFwNCHF5v
X-Proofpoint-GUID: duB5Ntv4qgny-VadpK28Oy0mFwNCHF5v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_10,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 impostorscore=0
 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311280088



On 11/27/2023 3:40 PM, Pavan Kondeti wrote:
> On Sat, Nov 25, 2023 at 03:49:54AM +0530, Mukesh Ojha wrote:
>> Client like minidump, is only interested in ramoops
>> region addresses/size so that it could register them
>> with its table and also it is only deals with ram
>> backend and does not use pstorefs to read the records.
>> Let's introduce a client notifier in ramoops which
>> gets called when ramoops driver probes successfully
>> and it passes the ramoops region information to the
>> passed callback by the client and If the call for
>> ramoops ready register comes after ramoops probe
>> than call the callback directly.
>>
>> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
>> ---
>>   fs/pstore/ram.c            | 77 ++++++++++++++++++++++++++++++++++++++++++++++
>>   include/linux/pstore_ram.h |  6 ++++
>>   2 files changed, 83 insertions(+)
>>
>> diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
>> index a6c0da8cfdd4..72341fd21aec 100644
>> --- a/fs/pstore/ram.c
>> +++ b/fs/pstore/ram.c
>> @@ -22,6 +22,7 @@
>>   #include <linux/of_address.h>
>>   #include <linux/memblock.h>
>>   #include <linux/mm.h>
>> +#include <linux/mutex.h>
>>   
>>   #include "internal.h"
>>   #include "ram_internal.h"
>> @@ -101,6 +102,14 @@ struct ramoops_context {
>>   	unsigned int ftrace_read_cnt;
>>   	unsigned int pmsg_read_cnt;
>>   	struct pstore_info pstore;
>> +	/*
>> +	 * Lock to serialize calls to register_ramoops_ready_notifier,
>> +	 * ramoops_ready_notifier and read/modification of 'ramoops_ready'.
>> +	 */
>> +	struct mutex lock;
>> +	bool ramoops_ready;
>> +	int (*callback)(const char *name, int id, void *vaddr,
>> +			phys_addr_t paddr, size_t size);
>>   };
>>   
>>   static struct platform_device *dummy;
>> @@ -488,6 +497,7 @@ static int ramoops_pstore_erase(struct pstore_record *record)
>>   }
>>   
>>   static struct ramoops_context oops_cxt = {
>> +	.lock   = __MUTEX_INITIALIZER(oops_cxt.lock),
>>   	.pstore = {
>>   		.owner	= THIS_MODULE,
>>   		.name	= "ramoops",
>> @@ -662,6 +672,68 @@ static int ramoops_init_prz(const char *name,
>>   	return 0;
>>   }
>>   
>> +void ramoops_ready_notifier(struct ramoops_context *cxt)
>> +{
>> +	struct persistent_ram_zone *prz;
>> +	int i;
>> +
>> +	if (!cxt->callback)
>> +		return;
>> +
>> +	for (i = 0; i < cxt->max_dump_cnt; i++) {
>> +		prz = cxt->dprzs[i];
>> +		cxt->callback("dmesg", i, prz->vaddr, prz->paddr, prz->size);
>> +	}
>> +
>> +	if (cxt->console_size) {
>> +		prz = cxt->cprz;
>> +		cxt->callback("console", 0, prz->vaddr, prz->paddr, prz->size);
>> +	}
>> +
>> +	for (i = 0; i < cxt->max_ftrace_cnt; i++) {
>> +		prz = cxt->fprzs[i];
>> +		cxt->callback("ftrace", i, prz->vaddr, prz->paddr, prz->size);
>> +	}
>> +
>> +	if (cxt->pmsg_size) {
>> +		prz = cxt->mprz;
>> +		cxt->callback("pmsg", 0, prz->vaddr, prz->paddr, prz->size);
>> +	}
>> +}
>> +
>> +int register_ramoops_ready_notifier(int (*fn)(const char *, int,
>> +				   void *, phys_addr_t, size_t))
>> +{
>> +	struct ramoops_context *cxt = &oops_cxt;
>> +
>> +	mutex_lock(&cxt->lock);
>> +	if (cxt->callback) {
>> +		mutex_unlock(&cxt->lock);
>> +		return -EEXIST;
>> +	}
>> +
>> +	cxt->callback = fn;
>> +	if (cxt->ramoops_ready)
>> +		ramoops_ready_notifier(cxt);
>> +
>> +	mutex_unlock(&cxt->lock);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(register_ramoops_ready_notifier);
>> +
> 
> Can you please elaborate on why do we need this custom notifier logic?
> 
> why would not a standard notifier (include/linux/notifier.h) work here?
> The notifier_call callback can recieve custom data from the
> notifier chain implementer. All we need is to define a custom struct like
> struct pstore_ramoops_zone_data {
> 	const char *name;
> 	int id;
> 	void *vaddr;
> 	phys_addr_t paddr;
> 	size_t size;
> };
> 
> and pass the pointer to array of this struct.
> 
> 
> btw, the current logic only supports just one client and this limitation
> is not highlighted any where.

I could work on it, was not sure if that will be helpful
for other users .

-Mukesh
> 
> Thanks,
> Pavan
> 

