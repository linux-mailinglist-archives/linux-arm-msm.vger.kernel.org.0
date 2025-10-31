Return-Path: <linux-arm-msm+bounces-79830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CD0C24001
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 10:05:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 20A414F267E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 09:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DBA032D441;
	Fri, 31 Oct 2025 09:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RvyQKB9s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z3ICPYX6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1805632D0EC
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 09:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901450; cv=none; b=R8kkpnNNYSynxmJvINb+R39MkfBPBFggToemt76RYs36Y3hzTz3kgjyF5ohrndtH1RExbVHvmlECC3wznRO26I21Iad9olq/nnoJzyyd7YAOxE8RLvBcoYquo9ocIvTgOuiKUNW5SxyXbsa7F/nrv9vySfYrJ4iSPE+TPIQdx2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901450; c=relaxed/simple;
	bh=EpE0vYozSbeuUIXYBCJ6TsBtRwwP6nKEN17giWBhw/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eamGX4jRlTZDcnvmmOHzMok9W2J0Y0DGQlHXfoLoaUYQV+/epQs3A9BKfgOZmJGZWaYX6ob5bsMt7fvZICjOvvkLfrd1zAsvv0L+jXkksIIz8CzZfR7iH3l09dwtvoaOk8XDNNwTadbXmWU59/e7308yf4cJwYpzPnS/plPf9Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RvyQKB9s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z3ICPYX6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V8TO2Q3808751
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 09:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UsyECife5ZqgTbXBdSnqYZhQvgBl/wBr/bQ/wyeCodU=; b=RvyQKB9ss8AdBjsR
	guvHVvJWM3NrVKGCrW/s//s/eI6DKTEcjUyLMjZ98s3rHG6NFpIu82lkj4FCwiFO
	wno8/B9HrIfKlHRIf4DaeTHn1pEh0zVLmTXMzAfGAkGDzNXEeYxee0osvHbNs5Lv
	b0bEMFk0Bl/SGPCLDm9WE4MfiKnZKl2cBs9O1Tx5dG7dH9Ccz2903CWzRCcUG2VP
	RRL475msQUxk1lce70LcZ9r6thx4LCgB1LOwLAu2M4DzhefqYWttppQbI7FxTkuu
	WziOMtoq6AD/Q0Kbwr/FLK2m98a7/6sJb1BIUphTNXk4s+qb/X5/LhfWypRHwuY2
	EYsSUA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a46vvba0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 09:04:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3409d852a5bso55657a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761901446; x=1762506246; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UsyECife5ZqgTbXBdSnqYZhQvgBl/wBr/bQ/wyeCodU=;
        b=Z3ICPYX6O1TJ2+cjkTOur7cM74ewAFYswmlqyS0NQ+g4yYLP0VbG4Qy2fNAGvQKJW6
         EBBS/YBaF+dY8lCsyFbghWZFvAARLKcWNEMWhcl1a7CWIFxl2CyPCZNOePFtpfKJgLtr
         JC4GaXFfVRqLNt19wFG+sTxNjoIe9/AZyyZ5nBipBQobbN9Le2tzINkqw6vb7dumIgHx
         fMjd5sEGS7PGYJwvF7oEfv6S2epCq4POTGaZLBGIBcu9Pf0piEgwjzgOHGhK8ktG9A7f
         2xNQ1VLV3AQb3l4xtfEBaDjV1sevYiAZwR88EdROYgx222HQPHpWE9b3TLnQVYgvfsDB
         PvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761901446; x=1762506246;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UsyECife5ZqgTbXBdSnqYZhQvgBl/wBr/bQ/wyeCodU=;
        b=TMB0N3QMkJvDL3+EQOliuqsHP4ycgAG4ltbLmhrd395z7aFKuqcyMdBljqxTcPOwZo
         n56D7Tk+nstijxtlcosStyBTqeWK0BZBrwh/Kr6WLbx5Tqtb+e8qp6kr0Ob7ZaIP1A6w
         E9ICIRHEDZ58oP/SvC9Hncnyfv5ANWVBbt0GgOixun/pEDnHsCfk0Ubcur+n41yw1ySn
         G4ZLv+neENVHBA3mKnDmIcShmPqIxgX/XSlHLS2B7dEtm/mUWc+9v2Ws0Tj+HUUVJcrz
         tOLFNKh8OGzod6ffIumgNpV2/uSBkOceJ9FyjMKMAN/1mMV0ub3Y10fe+k5lPoN16Bip
         7/0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTdgb0Fb+1EE90tADV7aiDT6V0o1+V5ksvmJZcd5ErH+OSfbIoL6fRaNiGVM9+Og5sguzJ07EqOYmqjdM3@vger.kernel.org
X-Gm-Message-State: AOJu0YyVULs7y6NWToQFha3wkDTtFyVk4tbAh0gJkTAOVrhzMkMJmkRT
	MdmsHvCZCLMMUGzhuTVkCRSHSrnQY9HcGoHmfCpkvqcXHEt2gDnIvt924LtcGzAC4mEfCHKnS/d
	pD6nubOtGgFGhbLowtbQDFyUutU3vL3oytWN1Niafb3zG+7ix8gnCSfZ0yKYOgcE90PYv
X-Gm-Gg: ASbGncs5xYOZPqriGwIu+7lHJX4row4XK9zaQf2KW8klJbFm2CRFguYx1yGE9HSG6zJ
	udw7NyoqR+A4uWHfcXiWGlpY0RX6ZoyFBJINmbg7ohthc4lOwoMiZPcU2rQCVbKjUOQcKFURPLz
	F4S4+4hGeEjM9TbqMT9WHP+PjU6qQOsfCQGtHRrjFMlP9nLT2II+Fy48bjlog6+JfNQGQuD/sWt
	W/Rw+HvQ4ocAxN8Rqof/FjKm/VFPVAFfku4jSGW6d4qGtTsJ0g0Efy4i2YHg5FWUrJ5VxIlzDWb
	Qc6+qSqaQIlalxMfDDKUo5yRQcNejwScs9T9tbRETrN7HB0WFAlD9xHm7XXZ3K65M5HZUqzfAmR
	/RaN2mZniXKcrhCFypSij+txT/WuevHUYOsIL6j//p1oR3r8HQVMOZYwN47qiuoF+
X-Received: by 2002:a17:90b:4b47:b0:32e:685f:ccd5 with SMTP id 98e67ed59e1d1-3408312aea9mr1969223a91.7.1761901446101;
        Fri, 31 Oct 2025 02:04:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGspl7dnc13rTZtbHg6u6vhMPS6axFdGojD5QHJBnlNzZ7vTeo7L84JnEP/0vcO7n93ilntng==
X-Received: by 2002:a17:90b:4b47:b0:32e:685f:ccd5 with SMTP id 98e67ed59e1d1-3408312aea9mr1969193a91.7.1761901445247;
        Fri, 31 Oct 2025 02:04:05 -0700 (PDT)
Received: from [10.133.33.57] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34091b48934sm1485206a91.0.2025.10.31.02.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 02:04:04 -0700 (PDT)
Message-ID: <c15f083d-a2c1-462a-aad4-a72b36fbe1ac@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 17:03:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul krishna Krishnakumar <Gokul.krishnakumar@oss.qualcomm>
References: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
 <20251029-knp-remoteproc-v2-4-6c81993b52ea@oss.qualcomm.com>
 <aQHmanEiWmEac7aV@linaro.org>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aQHmanEiWmEac7aV@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 54TJ8Einkha-ljo_MMsC7jXiZlLXh8vu
X-Authority-Analysis: v=2.4 cv=dK6rWeZb c=1 sm=1 tr=0 ts=69047b87 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=RvjEE2XbSPJyfKJsWL0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 54TJ8Einkha-ljo_MMsC7jXiZlLXh8vu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA4MiBTYWx0ZWRfX9AO5BZM+kV9f
 ogbxN8RuMU2RqtoKwZ/rGQBqPb5eAJzF7YfyzUYifbi18Za8bpqCSYEIz/m0HnIkkjoD14zwG4T
 ZF9oJFb8VxmL06bypG5u5DcNU1sJ15moCHrvjnGLa75WN+W5UfD3e736gm4584slPJIpb+ejyme
 tUoMSlvuISqARIhnDfUYr+j8XCQnEEqxAt/j6v37ErrMmbCxeLlPmGnirvvVHxe88iJ5Ncur+L9
 kS1gW1yu3T2dmBNiymQ6wrRUewErMN8QUBgPkAwS0qcngOofm/ZrjrCRMQGaH5R65UwpsTNNhqb
 qQyBpkY1IuLB1S9q9rvquZw+DREThSQTDNNlg5FK3pfA/KPEL4TewKMq+yL4KXpVJKqkN2mIrIT
 /N3labMIUf8tdh6O0Vc1WpmcJz5O4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310082

On 10/29/2025 6:03 PM, Stephan Gerhold wrote:
> On Wed, Oct 29, 2025 at 01:05:42AM -0700, Jingyi Wang wrote:
>> From: Gokul krishna Krishnakumar <Gokul.krishnakumar@oss.qualcomm>
>>
>> Subsystems can be brought out of reset by entities such as
>> bootloaders. Before attaching such subsystems, it is important to
>> check the state of the subsystem. This patch adds support to attach
>> to a subsystem by ensuring that the subsystem is in a sane state by
>> reading SMP2P bits and pinging the subsystem.
>>
>> Signed-off-by: Gokul krishna Krishnakumar <Gokul.krishnakumar@oss.qualcomm>
>> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  drivers/remoteproc/qcom_q6v5.c      | 89 ++++++++++++++++++++++++++++++++++++-
>>  drivers/remoteproc/qcom_q6v5.h      | 14 +++++-
>>  drivers/remoteproc/qcom_q6v5_adsp.c |  2 +-
>>  drivers/remoteproc/qcom_q6v5_mss.c  |  2 +-
>>  drivers/remoteproc/qcom_q6v5_pas.c  | 63 +++++++++++++++++++++++++-
>>  5 files changed, 165 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
>> index 58d5b85e58cd..4ce9e43fc5c7 100644
>> --- a/drivers/remoteproc/qcom_q6v5.c
>> +++ b/drivers/remoteproc/qcom_q6v5.c
>> [...]
>> @@ -234,6 +246,77 @@ unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
>>  }
>>  EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
>>  
>> +static irqreturn_t q6v5_pong_interrupt(int irq, void *data)
>> +{
>> +	struct qcom_q6v5 *q6v5 = data;
>> +
>> +	complete(&q6v5->ping_done);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +int qcom_q6v5_ping_subsystem(struct qcom_q6v5 *q6v5)
>> +{
>> +	int ret;
>> +	int ping_failed = 0;
>> +
>> +	reinit_completion(&q6v5->ping_done);
>> +
>> +	/* Set master kernel Ping bit */
>> +	ret = qcom_smem_state_update_bits(q6v5->ping_state,
>> +					  BIT(q6v5->ping_bit), BIT(q6v5->ping_bit));
>> +	if (ret) {
>> +		dev_err(q6v5->dev, "Failed to update ping bits\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = wait_for_completion_timeout(&q6v5->ping_done, msecs_to_jiffies(PING_TIMEOUT));
>> +	if (!ret) {
>> +		ping_failed = -ETIMEDOUT;
>> +		dev_err(q6v5->dev, "Failed to get back pong\n");
>> +	}
>> +
>> +	/* Clear ping bit master kernel */
>> +	ret = qcom_smem_state_update_bits(q6v5->ping_state, BIT(q6v5->ping_bit), 0);
>> +	if (ret) {
>> +		pr_err("Failed to clear master kernel bits\n");
> 
> dev_err()?
> 
>> +		return ret;
>> +	}
>> +
>> +	if (ping_failed)
>> +		return ping_failed;
> 
> Could just "return ping_failed;" directly.
> 
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem);
>> +
>> +int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev)
>> +{
>> +	int ret = -ENODEV;
>> +
>> +	q6v5->ping_state = devm_qcom_smem_state_get(&pdev->dev, "ping", &q6v5->ping_bit);
>> +	if (IS_ERR(q6v5->ping_state)) {
>> +		dev_err(&pdev->dev, "failed to acquire smem state %ld\n",
>> +			PTR_ERR(q6v5->ping_state));
>> +		return ret;
> 
> return PTR_ERR(q6v5->ping_state)?
> 
>> +	}
>> +
>> +	q6v5->pong_irq = platform_get_irq_byname(pdev, "pong");
>> +	if (q6v5->pong_irq < 0)
>> +		return q6v5->pong_irq;
>> +
>> +	ret = devm_request_threaded_irq(&pdev->dev, q6v5->pong_irq, NULL,
>> +					q6v5_pong_interrupt, IRQF_TRIGGER_RISING | IRQF_ONESHOT,
>> +					"q6v5 pong", q6v5);
>> +	if (ret)
>> +		dev_err(&pdev->dev, "failed to acquire pong IRQ\n");
>> +
>> +	init_completion(&q6v5->ping_done);
> 
> It would be better to have init_completion() before requesting the
> interrupt, to guarantee that complete(&q6v5->ping_done); cannot happen
> before the completion struct is initialized.
> 
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem_init);
>> +
>>  /**
>>   * qcom_q6v5_init() - initializer of the q6v5 common struct
>>   * @q6v5:	handle to be initialized
>> @@ -247,7 +330,7 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
>>   */
>>  int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>>  		   struct rproc *rproc, int crash_reason, const char *load_state,
>> -		   void (*handover)(struct qcom_q6v5 *q6v5))
>> +		   bool early_boot, void (*handover)(struct qcom_q6v5 *q6v5))
>>  {
>>  	int ret;
>>  
>> @@ -255,10 +338,14 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>>  	q6v5->dev = &pdev->dev;
>>  	q6v5->crash_reason = crash_reason;
>>  	q6v5->handover = handover;
>> +	q6v5->early_boot = early_boot;
>>  
>>  	init_completion(&q6v5->start_done);
>>  	init_completion(&q6v5->stop_done);
>>  
>> +	if (early_boot)
>> +		init_completion(&q6v5->subsys_booted);
>> +
>>  	q6v5->wdog_irq = platform_get_irq_byname(pdev, "wdog");
>>  	if (q6v5->wdog_irq < 0)
>>  		return q6v5->wdog_irq;
>> diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
>> index 5a859c41896e..8a227bf70d7e 100644
>> --- a/drivers/remoteproc/qcom_q6v5.h
>> +++ b/drivers/remoteproc/qcom_q6v5.h
>> @@ -12,27 +12,35 @@ struct rproc;
>>  struct qcom_smem_state;
>>  struct qcom_sysmon;
>>  
>> +#define PING_TIMEOUT 500 /* in milliseconds */
>> +#define PING_TEST_WAIT 500 /* in milliseconds */
> 
> Why is this defined in the shared header rather than the C file that
> uses this?
> 
> PING_TEST_WAIT looks unused.
> 
>> +
>>  struct qcom_q6v5 {
>>  	struct device *dev;
>>  	struct rproc *rproc;
>>  
>>  	struct qcom_smem_state *state;
>> +	struct qcom_smem_state *ping_state;
>>  	struct qmp *qmp;
>>  
>>  	struct icc_path *path;
>>  
>>  	unsigned stop_bit;
>> +	unsigned int ping_bit;
>>  
>>  	int wdog_irq;
>>  	int fatal_irq;
>>  	int ready_irq;
>>  	int handover_irq;
>>  	int stop_irq;
>> +	int pong_irq;
>>  
>>  	bool handover_issued;
>>  
>>  	struct completion start_done;
>>  	struct completion stop_done;
>> +	struct completion subsys_booted;
>> +	struct completion ping_done;
>>  
>>  	int crash_reason;
>>  
>> @@ -40,11 +48,13 @@ struct qcom_q6v5 {
>>  
>>  	const char *load_state;
>>  	void (*handover)(struct qcom_q6v5 *q6v5);
>> +
>> +	bool early_boot;
>>  };
>>  
>>  int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>>  		   struct rproc *rproc, int crash_reason, const char *load_state,
>> -		   void (*handover)(struct qcom_q6v5 *q6v5));
>> +		   bool early_boot, void (*handover)(struct qcom_q6v5 *q6v5));
>>  void qcom_q6v5_deinit(struct qcom_q6v5 *q6v5);
>>  
>>  int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5);
>> @@ -52,5 +62,7 @@ int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
>>  int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon);
>>  int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
>>  unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
>> +int qcom_q6v5_ping_subsystem(struct qcom_q6v5 *q6v5);
>> +int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev);
>>  
>>  #endif
>> [...]
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index 158bcd6cc85c..b667c11aadb5 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -35,6 +35,8 @@
>>  
>>  #define MAX_ASSIGN_COUNT 3
>>  
>> +#define EARLY_BOOT_RETRY_INTERVAL_MS 5000
>> +
>>  struct qcom_pas_data {
>>  	int crash_reason_smem;
>>  	const char *firmware_name;
>> @@ -59,6 +61,7 @@ struct qcom_pas_data {
>>  	int region_assign_count;
>>  	bool region_assign_shared;
>>  	int region_assign_vmid;
>> +	bool early_boot;
>>  };
>>  
>>  struct qcom_pas {
>> @@ -409,6 +412,8 @@ static int qcom_pas_stop(struct rproc *rproc)
>>  	if (pas->smem_host_id)
>>  		ret = qcom_smem_bust_hwspin_lock_by_host(pas->smem_host_id);
>>  
>> +	pas->q6v5.early_boot = false;
>> +
>>  	return ret;
>>  }
>>  
>> @@ -434,6 +439,51 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>>  	return qcom_q6v5_panic(&pas->q6v5);
>>  }
>>  
>> +static int qcom_pas_attach(struct rproc *rproc)
>> +{
>> +	int ret;
>> +	struct qcom_pas *adsp = rproc->priv;
>> +	bool ready_state;
>> +	bool crash_state;
>> +
>> +	if (!adsp->q6v5.early_boot)
>> +		return -EINVAL;
>> +
>> +	ret = irq_get_irqchip_state(adsp->q6v5.fatal_irq,
>> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
>> +
>> +	if (crash_state) {
> 
> crash_state will be uninitialized if irq_get_irqchip_state() returns an
> error.

Good catch.
Suggest to check ret result. If don't have fatal_irq available, then
just return fail on the attach and don't need to try crash reporting.

> 
>> +		dev_err(adsp->dev, "Sub system has crashed before driver probe\n");
>> +		adsp->rproc->state = RPROC_CRASHED;
>> +		return -EINVAL;
> 
> Ok, so the subsystem has crashed. Now what? We probably want to restart
> it, but I don't think anyone will handle the RPROC_CRASHED state you are
> setting here.

Agree. RPROC_CRASHED needed to be left for crash handler to set.

> 
> I think it would make more sense to call rproc_report_crash() here. This
> will set RPROC_CRASHED for you and trigger recovery. I'm not sure if
> this works properly in RPROC_DETACHED state, please test to make sure
> that works as intended.

Agree.
Suggest to have:
q6v5->running = false;
rproc_report_crash(q6v5->rproc, RPROC_FATAL_ERROR);

Test to be performed like:
Explicitly hack to always comes to crash_state here to see if it is good
to perform the crash recovery.

> 
>> +	}
>> +
>> +	ret = irq_get_irqchip_state(adsp->q6v5.ready_irq,
>> +				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
>> +
>> +	if (ready_state) {
>> +		dev_info(adsp->dev, "Sub system has boot-up before driver probe\n");
> 
> This message feels redundant, dmesg already shows a different message
> for "attaching" vs "booting" a remoteproc.
> 
>> +		adsp->rproc->state = RPROC_DETACHED;
> 
> What is the point of this assignment? You have already set this state
> inside qcom_pas_probe().

Make sense.

> 
>> +	} else {
>> +		ret = wait_for_completion_timeout(&adsp->q6v5.subsys_booted,
>> +						  msecs_to_jiffies(EARLY_BOOT_RETRY_INTERVAL_MS));
>> +		if (!ret) {
>> +			dev_err(adsp->dev, "Timeout on waiting for subsystem interrupt\n");
>> +			return -ETIMEDOUT;
>> +		}
> 
> This looks like you want to handle the case where the remoteproc is
> still booting while this code is running (i.e. it has not finished
> booting yet by signaling the ready state). Is this situation actually
> possible with the current firmware design?

This shouldn't happen during the initial boot stage, as far as I understand.

The current remoteproc is required by the bootloader/firmware before the
kernel even starts, so it shouldn't be in a state where it's still
booting at that point. If it were, the early_boot feature wouldn't be
necessary at all.

However, if the remoteproc is designed like in a second attempt to
attach—especially when RPROC_FEAT_ATTACH_ON_RECOVERY is enabled—then
it's possible this could occur(remoteproc is auto booting while kernel
is trying to attach with ready state check) as a corner case during boot-up.

> 
> I don't see how this would reliably work in practice. If firmware boots
> a remoteproc early it should wait until:
> 
>  - Handover is signaled, to ensure the proxy votes are kept
>  - Ready is signaled, to ensure the metadata region remains reserved
> 
> None of this is guaranteed if the firmware gives up control to Linux
> before waiting for the signals.
> 
> I would suggest dropping all the code related to handling the late
> "subsys_booted" completion. If this is needed, can you explain when
> exactly this situation happens and how you guarantee reliable startup of
> the remoteproc?


For the kaanapali specific remoteproc(soccp) with early-boot feature
here, it is rely on the rproc_shutdown/boot to recovery. And it should
be very corner case like bootloader/firmware bug to have such kind of
not ready state. Maybe we can simple remove the "subsys_booted"
mechanism, and only do a rproc_report_crash in this corner case.

> 
>> +	}
>> +
>> +	ret = qcom_q6v5_ping_subsystem(&adsp->q6v5);
>> +	if (ret) {
>> +		dev_err(adsp->dev, "Failed to ping subsystem, assuming device crashed\n");
>> +		rproc->state = RPROC_CRASHED;
>> +		return ret;
>> +	}
>> +
>> +	adsp->q6v5.running = true;
> 
> You should probably also set q6v5->handover_issued = true;, otherwise
> qcom_pas_stop() will later drop all the handover votes that you have
> never made. This will break all the reference counting.

Acked for all above comments you described and well understood.

> 
> Overall, this patch feels quite fragile in the current state. Please
> make sure you carefully consider all side effects and new edge cases
> introduced by your changes.

While for other edge cases and side effects, maybe Stephan can help on
have more details.

> 
> Thanks,
> Stephan


-- 
Thx and BRs,
Aiqun(Maria) Yu

