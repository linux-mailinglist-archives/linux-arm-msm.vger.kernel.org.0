Return-Path: <linux-arm-msm+bounces-84108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAE0C9C39E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 17:36:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C30A53482B6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 16:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141CC28314E;
	Tue,  2 Dec 2025 16:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxTt5X55";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kjZG7uiO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F337279792
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 16:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764693394; cv=none; b=pdPmh0l0rHuSgMzImzEt2CUL5JOPkvIajSQlB0dS69iumQS5iJmfQUjhemqdYSxqrKWZIqOjtO5jyEJVcNmnWN5dw1w9waos8lh28qu/5Kpcxr6eBA8vF/Ixm0XWZCVxdu0EqDoNpMRpaVPM0j/V+Gt1MMezIglf6CkPpklS8wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764693394; c=relaxed/simple;
	bh=M4+nISs1laQN5yabC5vnIz3Qz04WXy5+MmyJD+7yeTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MdXE4TNYONl9dD5XdJ1F8fj+ZyD+3Pe6rljyZQIHu6feHfeLe0TUXqgLR6pJgQJKWPpsIEtHIjXqkxJL4RMOthuIM52sqbKu8BVSVflqBW3pgWNm1PLK8P/SHto5KyUV+TU+n80F/PK+acQF89uA/AL2kw5a3IHLaA95zkM9R/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxTt5X55; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kjZG7uiO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2GWCVC3191757
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 16:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lBrRMxsqKdSUAVkz5FQHuVSzqzwszXxIw9LahdnMclI=; b=LxTt5X55WEdgz8sK
	yEfrf1S7AXqhpvoClWWMOinRM/8ABolgLeKhi/CPQ/WhzsRxmT7/v71f4S+m2l4a
	mcMcjsbgpItwORbRy+xwCRqP2eVoJe/mN65scNPUPd1YzOxTjKu2WLYhEzJ6YL+2
	qxQ0MFikGF6oCPvx1RL458LDKWi68nVr310HIbKc+YdohtpAl7fRz4Eu5HSorGlC
	Lh57uqDUCBJuERT6PUayJ8xS3pcwAQuj2fhKm0uBE3E0HfdhinZXt9DyKXWPZSvQ
	ea0dSMQnD8lwp2DpHXP7tyoVKFE/ltJQDqQgEtcK0Bd17QLOk9QTaiI4+qMgaQtS
	uhmaog==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at3qjg0eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 16:36:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-340c261fb38so8310595a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 08:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764693391; x=1765298191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lBrRMxsqKdSUAVkz5FQHuVSzqzwszXxIw9LahdnMclI=;
        b=kjZG7uiOogGQlk0jcKwf4h2uij1xO5twv1jicDZIHCeYQbeP9ssZz8mCQwkJ4X3NFD
         +gwKou2psH0DLfekpKSdw5lCePj1exC0BJli4WGC+MHH61MyZlI178fAYD1cvDVF/FsP
         ovsP2+VXg4SvE4gHasmurwaNWwWOSgH0Z3D7LUNEm6pb58CY1yV7BnP+XkQmHi1Ip5ul
         xJkT3gPWGIC8B0uyLX27PfM6Ca7Zz4VFKE1mJXE8wTfSe9yceyBXwGb08kdSRJ+c/9Yt
         kJcJiDAxxJ/XkuMfu3U3dQsmv9pH8pLM4KJtAyyfCb/rIXiuHhSGyHbXfE9SObO3fO6T
         a36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764693391; x=1765298191;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBrRMxsqKdSUAVkz5FQHuVSzqzwszXxIw9LahdnMclI=;
        b=QwMpcVUkR8jZcCQm1gJNZqEuTbMwU1QmBPdaytT0o3/K6c6amdePw1chDxvS7w/iWv
         KnnVDDJ7P7ykAiLmaanIoJ7yoMcRecpNoSOpr4ubQruqI3j4BM4CopGncHhAAIDiUyeB
         iGb9wUZbwHMQXqf98010seMht5Zl5asKpplhuvH1r/mn39p1wQNVOtkWZBh/XK6NrJ06
         gX1IDzxAZ92l7XMj99yo2qsaLD6ccNhbEdiYglxjsOAA1ICVqVx8JyhcbRSDrdhLOX4H
         VUp8Si4bPWGuI5MwqGP+f0iryXW/sGLC2Sxfj4Dl0Ksc+kysiTVv8gYA78Ksnrp3nPRo
         f+Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVOQzPkFKCMPjIwypa35yIoMK1oXhxhJ2bNPz0EQDACdBrpkejJbjGZCr+Jhpct6T+3VxTE4tggjxZVI8aK@vger.kernel.org
X-Gm-Message-State: AOJu0YypP5s4yKitMDr4wy1G7vs3iOSRaFuFYPKjcNbzecNSibgD00aM
	qp85+4Y8KWpa3CHeND0dHvhnHXCP/GAkAIxUrHdAYOKAyURisig4tLCeyuZJ77MijwtwaR1vJbv
	r5JT91Z1etsLIXlEvGh4wgPOX6vkH+7H25APxbGqU8ILZ7s2rZFcVZAe/Xdnt/2nYvHHE
X-Gm-Gg: ASbGncsRTIRnNjj+g0fJxXWmZuJVeyc/kA2HvNlrcaqtVnwliOxZpZl2XNJN6gxFNBZ
	7QYCiFoPOItx379w9PekmGJtNKSJpnSIbwGZEi89pxGRo9snmDdt0lC+OMMvELFZtqjy9NJ/VJS
	WP2rYy2cPIv72BRuXQAVXIRrC4ZRaVpdCLtY91DDiunBzxr3puk63bTnNngnPz4Z06tJmPEbQvn
	5iY1omC73g89ZGUV0Ro5rnX/xFll/g+23pSzr1bswiAG/MKyM9nJprSL78uJEywTnk4X8ArESdi
	4HaaXut1PmyamISjHwdfOESEmBqBFl7kiPtBCehiKAd9SXlG6krZth+hDLtotphYLg6Rr+/apxL
	QCnM993dVzHk1/HYEl/nbrG4JFnaufenHERPr39VecGE=
X-Received: by 2002:a05:6a20:e210:b0:342:f0cf:a248 with SMTP id adf61e73a8af0-3614ecbf142mr49459173637.23.1764693390485;
        Tue, 02 Dec 2025 08:36:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFY6zCyMmu616Er/EV1uwHO4Rbc5WrO+68UhTunSUWniVsEFXpJGSJOr8LpD+p05eQ+G8Otlw==
X-Received: by 2002:a05:6a20:e210:b0:342:f0cf:a248 with SMTP id adf61e73a8af0-3614ecbf142mr49459133637.23.1764693389740;
        Tue, 02 Dec 2025 08:36:29 -0800 (PST)
Received: from [10.216.21.13] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f080cf1sm17668205b3a.46.2025.12.02.08.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 08:36:29 -0800 (PST)
Message-ID: <e4c58df3-253f-7acf-0bb9-e0f6535bab50@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 22:06:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v10 1/3] firmware: qcom_scm: Add API to get waitqueue IRQ
 info
Content-Language: en-US
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251130-multi_waitq_scm-v10-0-5a5f2f05a417@oss.qualcomm.com>
 <20251130-multi_waitq_scm-v10-1-5a5f2f05a417@oss.qualcomm.com>
 <20251202114332.wlc2vdd2phslndek@hu-mojha-hyd.qualcomm.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20251202114332.wlc2vdd2phslndek@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDEzMSBTYWx0ZWRfXzH0rcCzLR6ao
 Olrxr4ibMIIZn05zxJSeOJmvDkPQ8sG8JK0UBcPVyHJAKctOHrzQD7ae4o/WAWQEo8E1Zk3qWRl
 t3XXnbPZNWBqxR5s/S2ZjMiLuSalgn0obS6C8FeRuE3U0QwwaOzmoGCDLkZVdX0vk2r1640/dqy
 wRnZLlluiLbEqaFEOpBDiWSzAED1lwimkNsaPKa5iVmzRbJrE3aEl7eD2oIrgtnoebP0o6GgSmA
 rcK0iNBLZUOjRpE8kA+MtUh5mkAZErzHJpNjHyB36r+5Ta/ttQrkS1IWlMfuBipeafMgLklluKA
 AFlE/VCyTi9255JKflm/lJ/KNuPZRTw+cGtVez5K/qrTz81GusqIagUPnMnwLSiBCPIqd2f0Ugx
 D7wGK7/lAGQmrgGiRBOS69MX3PhLmw==
X-Proofpoint-ORIG-GUID: PVbusLPIfdFP9VYjj00jWJyyYd9QkIee
X-Authority-Analysis: v=2.4 cv=QohTHFyd c=1 sm=1 tr=0 ts=692f158f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vqJ_s0uZOpJGGF1HFZkA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: PVbusLPIfdFP9VYjj00jWJyyYd9QkIee
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020131



On 12/2/2025 5:13 PM, Mukesh Ojha wrote:
> On Sun, Nov 30, 2025 at 08:11:02PM +0530, Shivendra Pratap wrote:
>> From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
>>

[SNIP..]

>>
>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>> index e777b7cb9b127944fe112f453cae9cbc40c06cae..79ab1707f71b0157835deaea6309f33016e3de8c 100644
>> --- a/drivers/firmware/qcom/qcom_scm.c
>> +++ b/drivers/firmware/qcom/qcom_scm.c
>> @@ -29,12 +29,18 @@
>>  #include <linux/reset-controller.h>
>>  #include <linux/sizes.h>
>>  #include <linux/types.h>
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> 
> At most places, where this header is used there is a line feed
> before it, if the header before it is not from dt-bindings.

Ack.

> 
>>  
>>  #include "qcom_scm.h"
>>  #include "qcom_tzmem.h"
>>  
>>  static u32 download_mode;
>>  
>> +#define GIC_SPI_BASE        32
>> +#define GIC_MAX_SPI       1019  // SPIs in GICv3 spec range from 32..1019
>> +#define GIC_ESPI_BASE     4096
>> +#define GIC_MAX_ESPI      5119 // ESPIs in GICv3 spec range from 4096..5119
>> +
>>  struct qcom_scm {
>>  	struct device *dev;
>>  	struct clk *core_clk;
>> @@ -2223,6 +2229,55 @@ bool qcom_scm_is_available(void)
>>  }
>>  EXPORT_SYMBOL_GPL(qcom_scm_is_available);
>>  
>> +static int qcom_scm_fill_irq_fwspec_params(struct irq_fwspec *fwspec, u32 hwirq)
>> +{
>> +	if (hwirq >= GIC_SPI_BASE && hwirq <= GIC_MAX_SPI) {
>> +		fwspec->param[0] = GIC_SPI;
>> +		fwspec->param[1] = hwirq - GIC_SPI_BASE;
>> +	} else if (hwirq >= GIC_ESPI_BASE && hwirq <= GIC_MAX_ESPI) {
>> +		fwspec->param[0] = GIC_ESPI;
>> +		fwspec->param[1] = hwirq - GIC_ESPI_BASE;
>> +	} else {
>> +		WARN(1, "Unexpected hwirq: %d\n", hwirq);
>> +		return -ENXIO;
>> +	}
> 
> line feed after } would make it look better..

Ack.

> 
>> +	fwspec->param[2] = IRQ_TYPE_EDGE_RISING;
>> +	fwspec->param_count = 3;
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_scm_get_waitq_irq(struct qcom_scm *scm)
>> +{
>> +	struct device_node *parent_irq_node;
> 
> after desc ?

ok.

> 
>> +	struct qcom_scm_desc desc = {
>> +		.svc = QCOM_SCM_SVC_WAITQ,
>> +		.cmd = QCOM_SCM_WAITQ_GET_INFO,
>> +		.owner = ARM_SMCCC_OWNER_SIP
>> +	};
>> +	struct irq_fwspec fwspec;
>> +	struct qcom_scm_res res;
>> +	u32 hwirq;
>> +	int ret;
>> +
>> +	ret = qcom_scm_call_atomic(scm->dev, &desc, &res);
>> +	if (ret)
>> +		return ret;
>> +
>> +	hwirq = res.result[1] & GENMASK(15, 0);
>> +
> 
> redundant line feed ?

will remove. thanks.

> 
>> +	ret = qcom_scm_fill_irq_fwspec_params(&fwspec, hwirq);
>> +	if (ret)
>> +		return ret;
> 
> Line feed needed here after return or } ?

will add it.

thanks,
Shivendra

