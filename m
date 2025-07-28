Return-Path: <linux-arm-msm+bounces-66944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FE8B1449E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 01:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA3FE7AD9CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 23:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465D0230981;
	Mon, 28 Jul 2025 23:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GOITPeLp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C64D19A2A3;
	Mon, 28 Jul 2025 23:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753744321; cv=none; b=KlHfSAfMYYh/QDppEoZHyJRRaGBnIPx26LZjsMpwA8Pw1qb1M/T4TtaYNdzhJUmmndVJWdokGlJ6tb48auorbpoU3mP8oS92dbUQ/BwbRsks6Qw66wK1HGZP1Bz+PYsWJytOjCZfZXCDkrbanY6Sz8LEymu6Hi1iXhatvFETFhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753744321; c=relaxed/simple;
	bh=gjKEY1wMUHdwVBcIOQwmZX2+uynU1Ak1WzwLGpkV+jE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EZbS2zQ4VUk2BZKDglOd/eoSvt0b1wuJOTwoQDnmF4IEY7iaogoLmuEmD3Gote9QIXKV6CpkTlU0deghYIa85flkpdBMd8+BP9N3FyQe+ttN9JAt0Fc/mV069FtPUn34mV7qYDLJXuEo1LCkIC9GxXH3VKctYW0g+uwYR/vNNJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GOITPeLp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SLFoPY005230;
	Mon, 28 Jul 2025 23:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KyoOcGxXNGeXgq7en0e40Ys/MxkT2Z/iZVJRTbzMOJo=; b=GOITPeLp9eJfNjPv
	F97XyCHia5c4KWAI7nW/DeOxga734cYFEyYC4r4DKhwQjzIAzhzhAOateaRHaMJJ
	JDXvD/zov8pxlsxZEujWUJxH7K07edBJmWGU1T/9/bdiuu+nDN9/ZiE/1o8+MtK2
	3+OQn7ZegGmToc1k2Wjjq0CaOayo8FnCc/8JmT/DxjehHQdpT5yMxVB1xqJZrPAY
	OJDfkFc5t8HXzSBMVFl7xjONSh+2iLRNrQ7Ho/XkfuhMUTbOBud3suFpUjxPQJVz
	5ckFvhjpM7u1JFtjSOJxLsKMNVSdHAMuk5s2+PkbGeWmuEg6ofMfX3s5wG18EzZI
	welVxw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nytxahv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Jul 2025 23:11:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56SNBmhZ007474
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Jul 2025 23:11:48 GMT
Received: from [10.216.41.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 28 Jul
 2025 16:11:44 -0700
Message-ID: <0f480187-f0b8-482f-8b43-ed9bd454ec5b@quicinc.com>
Date: Tue, 29 Jul 2025 04:41:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v3 3/3] ufs: core: delegate the interrupt service
 routine to a threaded irq handler
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche
	<bvanassche@acm.org>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250407-topic-ufs-use-threaded-irq-v3-0-08bee980f71e@linaro.org>
 <20250407-topic-ufs-use-threaded-irq-v3-3-08bee980f71e@linaro.org>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <20250407-topic-ufs-use-threaded-irq-v3-3-08bee980f71e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ObramPjYe1CiLyM0QKlH9rx_RNyNaIdv
X-Proofpoint-ORIG-GUID: ObramPjYe1CiLyM0QKlH9rx_RNyNaIdv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDE3MCBTYWx0ZWRfXytTX4fOAtbkD
 Nm0u1TKVI/ObIw9E3S77k0kNWYeI1n0D600XWGygUjZIBCuym54PAVDN14HNVp/nbBPHGtecsx6
 DaJkqLRAaQmWjNZXn6lexNUYcLvtqjLqkkEZagMTFEW8aWId9gWDuc1QAsf40zBY4hOv4gkiFkA
 S0WS/rCryX+L7OWdOxaBntxtjZML3EBoTIoi2zvUk7ZMuB29QidZ96ziICFZxQ2pVtOkKxSvpwF
 5lQJNjSZ7a0z823B/mgfwn3uoWUHfA1DMTfOe/gzj5upKnMGB4uSYqGjUN+WlW3p7HUxa/NMYPM
 a+NGUcLy8gyRHvq9pjq5I8odkI2rhw0olTeJzFcxbTKSId4kYoFqFM/7ZR3WsjSBXkOrE+8/r3y
 iUakceXkWh6i87zSrLdSRj4U2z2AJKNp1n4mV47MKSsHB5qRRf5Hjk6OlpcHBhNyYH2f0jGW
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=688803b5 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8
 a=TlRnFm9hCiVe0nWb_skA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_04,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280170



On 4/7/2025 3:47 PM, Neil Armstrong wrote:
> On systems with a large number request slots and unavailable MCQ ESI,
> the current design of the interrupt handler can delay handling of
> other subsystems interrupts causing display artifacts, GPU stalls
> or system firmware requests timeouts.
> 
> Since the interrupt routine can take quite some time, it's
> preferable to move it to a threaded handler and leave the
> hard interrupt handler wake up the threaded interrupt routine,
> the interrupt line would be masked until the processing is
> finished in the thread thanks to the IRQS_ONESHOT flag.
> 
> When MCQ & ESI interrupts are enabled the I/O completions are now
> directly handled in the "hard" interrupt routine to keep IOPs high
> since queues handling is done in separate per-queue interrupt routines.
> 
> This fixes all encountered issued when running FIO tests
> on the Qualcomm SM8650 platform.

Hi Neil,

I tested this change on both SM8750 and SM8650 using the upstream kernel 
with MCQ enabled locally. I also validated it on the SM8750 downstream 
codebase. In all cases, enabling MCQ mode led to boot-up issues on these 
targets.

The root cause was that in MCQ mode, the Interrupt Status (IS) register 
was not being cleared in the ufshcd_intr function. This resulted in 
abnormal behavior during subsequent UIC commands, ultimately causing 
boot failures.

To address this issue, I’ve submitted the following patch: [PATCH V1] 
ufs: core: Fix interrupt handling for MCQ Mode in ufshcd_intr.

I also have plan to get the performance number with SDB and MCQ mode 
with these change. I'll update the thread once i get the number.

Thanks,
Nitin

> 
> Example of errors reported on a loaded system:
>   [drm:dpu_encoder_frame_done_timeout:2706] [dpu error]enc32 frame done timeout
>   msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.20.1: hangcheck detected gpu lockup rb 2!
>   msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.20.1:     completed fence: 74285
>   msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.20.1:     submitted fence: 74286
>   Error sending AMC RPMH requests (-110)
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/ufs/core/ufshcd.c | 30 +++++++++++++++++++++++++++---
>   1 file changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 7f256f77b8ba9853569157db7785d177b6cd6dee..b40660ca2fa6b3488645bd26121752554a8d6a08 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -6971,7 +6971,7 @@ static irqreturn_t ufshcd_sl_intr(struct ufs_hba *hba, u32 intr_status)
>   }
>   
>   /**
> - * ufshcd_intr - Main interrupt service routine
> + * ufshcd_threaded_intr - Threaded interrupt service routine
>    * @irq: irq number
>    * @__hba: pointer to adapter instance
>    *
> @@ -6979,7 +6979,7 @@ static irqreturn_t ufshcd_sl_intr(struct ufs_hba *hba, u32 intr_status)
>    *  IRQ_HANDLED - If interrupt is valid
>    *  IRQ_NONE    - If invalid interrupt
>    */
> -static irqreturn_t ufshcd_intr(int irq, void *__hba)
> +static irqreturn_t ufshcd_threaded_intr(int irq, void *__hba)
>   {
>   	u32 last_intr_status, intr_status, enabled_intr_status = 0;
>   	irqreturn_t retval = IRQ_NONE;
> @@ -7018,6 +7018,29 @@ static irqreturn_t ufshcd_intr(int irq, void *__hba)
>   	return retval;
>   }
>   
> +/**
> + * ufshcd_intr - Main interrupt service routine
> + * @irq: irq number
> + * @__hba: pointer to adapter instance
> + *
> + * Return:
> + *  IRQ_HANDLED     - If interrupt is valid
> + *  IRQ_WAKE_THREAD - If handling is moved to threaded handled
> + *  IRQ_NONE        - If invalid interrupt
> + */
> +static irqreturn_t ufshcd_intr(int irq, void *__hba)
> +{
> +	struct ufs_hba *hba = __hba;
> +
> +	/* Move interrupt handling to thread when MCQ & ESI are not enabled */
> +	if (!hba->mcq_enabled || !hba->mcq_esi_enabled)
> +		return IRQ_WAKE_THREAD;
> +
> +	/* Directly handle interrupts since MCQ ESI handlers does the hard job */
> +	return ufshcd_sl_intr(hba, ufshcd_readl(hba, REG_INTERRUPT_STATUS) &
> +				   ufshcd_readl(hba, REG_INTERRUPT_ENABLE));
> +}
> +
>   static int ufshcd_clear_tm_cmd(struct ufs_hba *hba, int tag)
>   {
>   	int err = 0;
> @@ -10577,7 +10600,8 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
>   	ufshcd_readl(hba, REG_INTERRUPT_ENABLE);
>   
>   	/* IRQ registration */
> -	err = devm_request_irq(dev, irq, ufshcd_intr, IRQF_SHARED, UFSHCD, hba);
> +	err = devm_request_threaded_irq(dev, irq, ufshcd_intr, ufshcd_threaded_intr,
> +					IRQF_ONESHOT | IRQF_SHARED, UFSHCD, hba);
>   	if (err) {
>   		dev_err(hba->dev, "request irq failed\n");
>   		goto out_disable;
> 


