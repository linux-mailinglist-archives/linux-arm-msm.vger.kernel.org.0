Return-Path: <linux-arm-msm+bounces-75477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A880BA827E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 08:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68F7B189BC10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 06:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6352BE635;
	Mon, 29 Sep 2025 06:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvW/N6NH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464B5239E63
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 06:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759128141; cv=none; b=eZiE03V/E4ez7dXtMW/V07BvVle00nO0QqNGlSdchjnhbnwDgKT9ysTkc0ph8wMJMFjZVt9J9XcnbSEtzuHhqfmbwDLf1Gp5G0FHNSEsu6q4m0FOy6QrBjIha2cN+PzuhDevDmSckFyLTajZd1reQ9GHG0GygAgx0Lvys/itSBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759128141; c=relaxed/simple;
	bh=CthzcmmcLwbu6o/tTp7wdB5rtanKx2uM8ydwxTK6rqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fMQIZ2njX3ICCDMx6f/mp8aqDQ4anLe/wS6ZyVvt8ZhBWI0sx1HDjg8INNwx7NveAiPBR2GsbJUIUn1o8Lz40auSQtjY/9d7AkMrkzzGRSQwN9XGmp9WS3uYnPRkdiNIS7XjkkFwfYQFfeV8nEqWufMWRRzMhmeyecOx7amNZ00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvW/N6NH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SMvkkV028043
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 06:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EW1sLacukgph1jhS3JBJRhwDdXG84nHHId1z1haafVs=; b=kvW/N6NHaxM1UyBD
	YyzvXqYiDxZ5Kc1gsFOIW0Pqzvfuv33LyygOCf/Pe0YBUy63rf9qVT5hkH0jrPh2
	AAD/2ITa1YTrh5PQeXF8vThphCgyqZhJCg7enNWJyyd99WXlTAqYHzgkS987j1jz
	cnld4x4FBC/QjYWtE8V6wJr4zhplGIFBER4OpCGOH4cHhxiTKsjgtAScSAwgj/F0
	K7d1gHIEtkPGrIv3KTLu05u5/RH3iJKPgu58SH0a4mWr2H3ASJ8i9ouU3QTigoLm
	egyKCuaFuQzo/PvTlSIZAmAbpl4QoclVDBTeELn5aZ5BxnEtOpu3KaDL9Ij1oAew
	ZwwEzA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5m6ne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 06:42:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-783c3400b5dso675621b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 23:42:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759128137; x=1759732937;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EW1sLacukgph1jhS3JBJRhwDdXG84nHHId1z1haafVs=;
        b=tx7VAuPH+PHs+0rJDVIm2dF+BcPispEaeAou4EjDdBdlLhWe9b4NI/PfMJj+G4Qf/n
         NMejE0I9Y6Zze5i8+/kx/AqalctQYo5SEB2nyUltP4K63SrA27obb6rOa3OFlKHQDnsd
         EmNR2b1bpNbN6u85aHYUVYIuV4TcbxCvExeKmVHSg5w8qHjbBTB+kqFyrE5KAW1st7kJ
         OiN7OpBaEWX33Zgxn+R2+ds9XRmSktQahx7Epehqd9H1ZHwJ4iGYisUlRydCFChw2Igb
         e9k3tU0KGD0cAgO08ykKPF70XUQZLSY83LeRKeKL5wM5ctflVme/PCL0A33aH+MPWKQi
         Q+0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW76P9x9OC4eDWL5Hl11CCTrJmaVUMLcySNSKBDGCHnjNJbOEVyHK/+yVD1By57oRgBSTtirDn3gcsrHQ55@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1C2gTQjVvqvDPb5g1JpK7tsmEK2Yr4xiaNu0D2/2wPmrkKf7Y
	m0mUGE6iuYDRYIQaGNhTdKYXP709F+Vh5/8MUETFuebdzDTWt1cf9NMOYKgy0QLxDDloxlT6+wn
	lhpVRz82C8O5lFXxA1j2FlGicVn+X1/hLSQ7HPJu5qRe2PlDzZqk8/tzHHfQwTw5X2ARO
X-Gm-Gg: ASbGncvgGVgRrhaLFbkFL5z7eX4ktRrd8r/bmZdjg+5qnBGV+WzeYdosWey2DDg5XRZ
	8bq0UIloB15djKQl/PtGbdSh1Fj6cTXe+vHtlvGu1WLiXWOLhsbEMpU8aK0GE9ldqh92m0MPPKD
	XO2weh1eX4ivb9upeBx6pXVkP/tuDCD+C/AbAmt2oZDyF3gT1Ah0oJW5f4tHgRXLEIcfBH4jsXe
	Dc2PUdD79RGq2fYC1abTETRhR+fMyvXtawvHF/YqbNy1xk7LB3pltXHOKjWUbpMKc8LRXpNj+zW
	wt1idT9rvKsjRoiv6c4bkr41B7Uw9TZGrvGfMu5P/n9boZAe7nl+tgVsLNR66O/CW0bOdApLd0C
	1DJWO9+SWg/MEK5xduXZWS3AsXEqd4nj6S/M=
X-Received: by 2002:a05:6a00:218c:b0:781:1f6c:1c59 with SMTP id d2e1a72fcca58-7811f6c1e7cmr10340676b3a.26.1759128136584;
        Sun, 28 Sep 2025 23:42:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXt5wS7PzvON2L7XB8uZ1QVQOUJ9ywPslg8pI/gmOMw2lTsy37Xo5wg3GqT8VzlJ8VC8XVxw==
X-Received: by 2002:a05:6a00:218c:b0:781:1f6c:1c59 with SMTP id d2e1a72fcca58-7811f6c1e7cmr10340639b3a.26.1759128136054;
        Sun, 28 Sep 2025 23:42:16 -0700 (PDT)
Received: from [10.133.33.234] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78126ae02dasm5069592b3a.21.2025.09.28.23.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 23:42:15 -0700 (PDT)
Message-ID: <0bc11a0f-826e-4d57-ab59-abae71685f1e@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 14:42:10 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Gokul krishna Krishnakumar <Gokul.krishnakumar@oss.qualcomm>
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
 <20250924-knp-remoteproc-v1-5-611bf7be8329@oss.qualcomm.com>
 <aprekcmyp4ttmjgu6nsvoqlvmazi4vvxmsyydjcdpmnhuvl5uk@dylpjrehmd5w>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <aprekcmyp4ttmjgu6nsvoqlvmazi4vvxmsyydjcdpmnhuvl5uk@dylpjrehmd5w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6e1YEMvBysOx89xwH_HF8ROZWFg9x90K
X-Proofpoint-ORIG-GUID: 6e1YEMvBysOx89xwH_HF8ROZWFg9x90K
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68da2a4a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=RvjEE2XbSPJyfKJsWL0A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX1mzS0W4/8CFo
 8aSPOjnlVbZKoljPD1oThGVF33GVUzaEk++c/cwAxavmvr7NzNX776Jcr/2zKYgoED5bpcZroHd
 w/1BKHpqtm0ef3rymhy1RF+wP3i4582L2/wNXi6UjHCifDhnqSeYUskqT2FHxEdb2rGPVq47852
 6Aw+/titUl3li5HPBZ1D/SIUmYFChMNr6lwRiejTmJT+6lU/BaNyGchCxF6Vzvib5u0etKMpR0R
 mmi735vErq1j8iln/C1ptCnjmJyNr0+76TydQ8errQilM2IAOHDUI40+2LgggwV1s/uAgzfUvPV
 grXKawvyZNGFOCw1nBEAx667kpux6dsL3aw3LPefpYXNI2i9QobKr4qNYtMXsFQT4SCvlqLV9Pm
 sk+xl64f2Zk0QUezvCl5waXSs+vE2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018



On 9/25/2025 11:04 AM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 04:37:26PM -0700, Jingyi Wang wrote:
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
>>  drivers/remoteproc/qcom_q6v5_pas.c  | 61 ++++++++++++++++++++++++-
>>  5 files changed, 163 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
>> index 4ee5e67a9f03..cba05e1d6d52 100644
>> --- a/drivers/remoteproc/qcom_q6v5.c
>> +++ b/drivers/remoteproc/qcom_q6v5.c
>> @@ -94,6 +94,9 @@ static irqreturn_t q6v5_wdog_interrupt(int irq, void *data)
>>  	size_t len;
>>  	char *msg;
>>  
>> +	if (q6v5->early_boot)
>> +		complete(&q6v5->subsys_booted);
> 
> Where do we clean this flag? I think you current code breaks restarting
> of ADSP. Once the ADSP is brought up, the flag should be cleared and
> further handling of the ADSP should follow the normal flow.
> 

q6v5->subsys_booted can not be cleared now, it is only checked in the 
qcom_pas_attach callback, so the bootup process will not be infected, 
we have tested shutdown->bootup process and it runs as expected.

Thanks,
Jingyi


>> +
>>  	/* Sometimes the stop triggers a watchdog rather than a stop-ack */
>>  	if (!q6v5->running) {
>>  		complete(&q6v5->stop_done);
>> @@ -118,6 +121,9 @@ static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
>>  	size_t len;
>>  	char *msg;
>>  
>> +	if (q6v5->early_boot)
>> +		complete(&q6v5->subsys_booted);
>> +
>>  	if (!q6v5->running)
>>  		return IRQ_HANDLED;
>>  
>> @@ -139,6 +145,9 @@ static irqreturn_t q6v5_ready_interrupt(int irq, void *data)
>>  
>>  	complete(&q6v5->start_done);
>>  
>> +	if (q6v5->early_boot)
>> +		complete(&q6v5->subsys_booted);
>> +
>>  	return IRQ_HANDLED;
>>  }
>>  
>> @@ -170,6 +179,9 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
>>  	if (q6v5->handover)
>>  		q6v5->handover(q6v5);
>>  
>> +	if (q6v5->early_boot)
>> +		complete(&q6v5->subsys_booted);
>> +
>>  	icc_set_bw(q6v5->path, 0, 0);
>>  
>>  	q6v5->handover_issued = true;
>> @@ -232,6 +244,77 @@ unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
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
>> +		return ret;
>> +	}
>> +
>> +	if (ping_failed)
>> +		return ping_failed;
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
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem_init);
>> +
>>  /**
>>   * qcom_q6v5_init() - initializer of the q6v5 common struct
>>   * @q6v5:	handle to be initialized
>> @@ -245,7 +328,7 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
>>   */
>>  int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>>  		   struct rproc *rproc, int crash_reason, const char *load_state,
>> -		   void (*handover)(struct qcom_q6v5 *q6v5))
>> +		   bool early_boot, void (*handover)(struct qcom_q6v5 *q6v5))
>>  {
>>  	int ret;
>>  
>> @@ -253,10 +336,14 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
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
>> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
>> index e98b7e03162c..1576b435b921 100644
>> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
>> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
>> @@ -717,7 +717,7 @@ static int adsp_probe(struct platform_device *pdev)
>>  		goto disable_pm;
>>  
>>  	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem,
>> -			     desc->load_state, qcom_adsp_pil_handover);
>> +			     desc->load_state, false, qcom_adsp_pil_handover);
>>  	if (ret)
>>  		goto disable_pm;
>>  
>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
>> index 0c0199fb0e68..04e577541c8f 100644
>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>> @@ -2156,7 +2156,7 @@ static int q6v5_probe(struct platform_device *pdev)
>>  	qproc->has_mba_logs = desc->has_mba_logs;
>>  
>>  	ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc, MPSS_CRASH_REASON_SMEM, "modem",
>> -			     qcom_msa_handover);
>> +			     false, qcom_msa_handover);
>>  	if (ret)
>>  		goto detach_proxy_pds;
>>  
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index 55a7da801183..99163e48a76a 100644
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
>> @@ -58,6 +60,7 @@ struct qcom_pas_data {
>>  	int region_assign_count;
>>  	bool region_assign_shared;
>>  	int region_assign_vmid;
>> +	bool early_boot;
>>  };
>>  
>>  struct qcom_pas {
>> @@ -430,6 +433,51 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
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
>> +		dev_err(adsp->dev, "Sub system has crashed before driver probe\n");
>> +		adsp->rproc->state = RPROC_CRASHED;
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = irq_get_irqchip_state(adsp->q6v5.ready_irq,
>> +				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
>> +
>> +	if (ready_state) {
>> +		dev_info(adsp->dev, "Sub system has boot-up before driver probe\n");
>> +		adsp->rproc->state = RPROC_DETACHED;
>> +	} else {
>> +		ret = wait_for_completion_timeout(&adsp->q6v5.subsys_booted,
>> +						  msecs_to_jiffies(EARLY_BOOT_RETRY_INTERVAL_MS));
>> +		if (!ret) {
>> +			dev_err(adsp->dev, "Timeout on waiting for subsystem interrupt\n");
>> +			return -ETIMEDOUT;
>> +		}
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
>> +	return ret;
>> +}
>> +
>>  static const struct rproc_ops qcom_pas_ops = {
>>  	.unprepare = qcom_pas_unprepare,
>>  	.start = qcom_pas_start,
>> @@ -438,6 +486,7 @@ static const struct rproc_ops qcom_pas_ops = {
>>  	.parse_fw = qcom_register_dump_segments,
>>  	.load = qcom_pas_load,
>>  	.panic = qcom_pas_panic,
>> +	.attach = qcom_pas_attach,
>>  };
>>  
>>  static const struct rproc_ops qcom_pas_minidump_ops = {
>> @@ -760,7 +809,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>  	pas->proxy_pd_count = ret;
>>  
>>  	ret = qcom_q6v5_init(&pas->q6v5, pdev, rproc, desc->crash_reason_smem,
>> -			     desc->load_state, qcom_pas_handover);
>> +			     desc->load_state, desc->early_boot, qcom_pas_handover);
>>  	if (ret)
>>  		goto detach_proxy_pds;
>>  
>> @@ -774,6 +823,16 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
>> +
>> +	if (pas->q6v5.early_boot) {
>> +		ret = qcom_q6v5_ping_subsystem_init(&pas->q6v5, pdev);
>> +		if (ret)
>> +			dev_err(&pdev->dev,
>> +				"Unable to find ping/pong bits, falling back to firmware load\n");
>> +		else
>> +			pas->rproc->state = RPROC_DETACHED;
>> +	}
>> +
>>  	ret = rproc_add(rproc);
>>  	if (ret)
>>  		goto remove_ssr_sysmon;
>>
>> -- 
>> 2.25.1
>>
> 


