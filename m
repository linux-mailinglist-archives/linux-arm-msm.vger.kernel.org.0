Return-Path: <linux-arm-msm+bounces-24861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CA891EF34
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 08:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 159581C232D7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 06:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9659D82D68;
	Tue,  2 Jul 2024 06:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="blQHnHqQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C98347C2;
	Tue,  2 Jul 2024 06:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719902362; cv=none; b=gRPPht+G2Bp1PQkIOba7PS3GjYjouthGgfU2SeIkNDAcW7VwL/e0GsDdrPYHLSXPYP8EReHy5rWXrTm39la5PPZLeVL3qCCh0dNzO/pDPFOOBOnQGEreq1dEG1vDFC398h7EwEd5injxriYq+8UV/88xBgj8Oa6idQVQ4E2xIQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719902362; c=relaxed/simple;
	bh=vn5YWUS6RydoYKJs+yOfeo/iZTPzfs2PzZAP0GAyLmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hZ/RbfLEjeNpa6D9NN87OKH05CZiLkfxTXZf5JADgmLgraEH7z7T6hxXXM2oeq/BbooVN3xXKbUpm/XBNJAZI+ui9MUaRG7sYwPtRudzi7VcyDmqWlWUjsEFoDPFlRa6fDCJh/DSXfkZ3C3r6ISWPEdlmsn8gE9e2BL/q/84j5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=blQHnHqQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 461LFxEF002531;
	Tue, 2 Jul 2024 06:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bc0FbBCjop0mDDwTTnWmvB20qL8T+RaItfFuUos6ofs=; b=blQHnHqQxJkXkmfz
	SUZhqAnvWjONAzDqRI7MAFFTE00irORQkSM5EfyeJAHKywyJzv7IWyHHpz/ivwGm
	G/cLQ4A1rdeL3EZFjZ2I86gQpBp85lKe5GQdavEnr/BumAhFwJdnsSr02qsa+DF0
	hVHmDdc6bNU9ZubhrPnKqadBZ3zqTnJCbxXMOn8oupDKywKkws8EUeUaoXEFZIT0
	TAv2A07kvwjngW8EGI9t2fnPB47lkw5P3aZC4vrhqo2wY1NgTRnv6U6y0LZddXAS
	Ex2mT+FxtCQOe23M2VxO0epqYPUlD6QWXyW8MBk1XqCpR5DEzDGV4ZTfornPhLMW
	VevlFQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402bj862rw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 06:39:16 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4626dGXp004878
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Jul 2024 06:39:16 GMT
Received: from [10.217.238.102] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 1 Jul 2024
 23:39:13 -0700
Message-ID: <4a5c0b88-d4be-4dd2-9bce-981f093737aa@quicinc.com>
Date: Tue, 2 Jul 2024 12:09:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/2] soc: qcom: smp2p: Use devname for interrupt
 descriptions
To: <quic_bjorande@quicinc.com>, <andersson@kernel.org>,
        <quic_clew@quicinc.com>, <mathieu.poirier@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <quic_deesin@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>
References: <20240627104831.4176799-1-quic_sudeepgo@quicinc.com>
 <20240627104831.4176799-2-quic_sudeepgo@quicinc.com>
Content-Language: en-US
From: Sudeep Patil <quic_sudeepgo@quicinc.com>
In-Reply-To: <20240627104831.4176799-2-quic_sudeepgo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5q_d6UxEzsm5-MhTxHB8iMtugursaPH9
X-Proofpoint-GUID: 5q_d6UxEzsm5-MhTxHB8iMtugursaPH9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_02,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407020048



On 6/27/2024 4:18 PM, Sudeepgoud Patil wrote:
> From: Chris Lew <quic_clew@quicinc.com>
> 
> When using /proc/interrupts to collect statistics on smp2p interrupt
> counts, it is hard to distinguish the different instances of smp2p from
> each other. For example to debug a processor boot issue, the ready and
> handover interrupts are checked for sanity to ensure the firmware
> reached a specific initialization stage.
> 
> Remove "smp2p" string from the irq request so that the irq will default
> to the device name. Add an .irq_print_chip() callback to print the irq
> chip name as the device name. These two changes allow for a unique name
> to be used in /proc/interrupts as shown below.
> 
> / # cat /proc/interrupts | grep smp2p
>   18:  ...      ipcc 196610 Edge      smp2p-adsp
>   20:  ...      ipcc 131074 Edge      smp2p-modem
> 170:  ...  smp2p-modem   1 Edge      q6v5 ready
> 178:  ...  smp2p-adsp   1 Edge      q6v5 ready
> 
> Signed-off-by: Chris Lew <quic_clew@quicinc.com>
Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
> ---
>   drivers/soc/qcom/smp2p.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> index a21241cbeec7..696c2a8387d0 100644
> --- a/drivers/soc/qcom/smp2p.c
> +++ b/drivers/soc/qcom/smp2p.c
> @@ -16,6 +16,7 @@
>   #include <linux/platform_device.h>
>   #include <linux/pm_wakeirq.h>
>   #include <linux/regmap.h>
> +#include <linux/seq_file.h>
>   #include <linux/soc/qcom/smem.h>
>   #include <linux/soc/qcom/smem_state.h>
>   #include <linux/spinlock.h>
> @@ -353,11 +354,19 @@ static int smp2p_set_irq_type(struct irq_data *irqd, unsigned int type)
>   	return 0;
>   }
>   
> +static void smp2p_irq_print_chip(struct irq_data *irqd, struct seq_file *p)
> +{
> +	struct smp2p_entry *entry = irq_data_get_irq_chip_data(irqd);
> +
> +	seq_printf(p, " %8s", dev_name(entry->smp2p->dev));
> +}
> +
>   static struct irq_chip smp2p_irq_chip = {
>   	.name           = "smp2p",
>   	.irq_mask       = smp2p_mask_irq,
>   	.irq_unmask     = smp2p_unmask_irq,
>   	.irq_set_type	= smp2p_set_irq_type,
> +	.irq_print_chip = smp2p_irq_print_chip,
>   };
>   
>   static int smp2p_irq_map(struct irq_domain *d,
> @@ -617,7 +626,7 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
>   	ret = devm_request_threaded_irq(&pdev->dev, irq,
>   					NULL, qcom_smp2p_intr,
>   					IRQF_ONESHOT,
> -					"smp2p", (void *)smp2p);
> +					NULL, (void *)smp2p);
>   	if (ret) {
>   		dev_err(&pdev->dev, "failed to request interrupt\n");
>   		goto unwind_interfaces;

