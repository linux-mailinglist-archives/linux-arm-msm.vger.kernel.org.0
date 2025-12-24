Return-Path: <linux-arm-msm+bounces-86471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31681CDB58F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 05:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 991C1301B2D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 04:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D31242D88;
	Wed, 24 Dec 2025 04:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lptUDiMD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J72xlBg5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D90A2BDC27
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 04:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766551412; cv=none; b=iEz6vxIaulzfnByHsAIz++hxkyzhB/u/aFWmoPWUZR5Xd3sNxuFQWUymwPLuGpWRCYQ9SImhOiPAO2zOLAC1J6Xy8Pyj0DqsLMCEnVwRlZZu2U7tbXjEuLegdBfevAoLS+KSDAbp7D4mq146+yEYjj+ic20r+0P9FsbUvGdtcv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766551412; c=relaxed/simple;
	bh=7AnAY1VSKRpLhFsr6vc0i3JglJIfczIn7APLeqeEZQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OW4jyhwLRSvsIRlWdngWHtU6P3XvhfLBBW9ILTUJI5ng0x9mDXO1KCMEebMfPMxirCrDJHXwq9nO/F2JVLOC2NkitOTfbbJICarHMvGq4rN/fzQ6+iIGVo0phvo2BZi84g0+MCxiwLV/RBxzRkF0jjtQIRFXNfWwOarMm4WAKLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lptUDiMD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J72xlBg5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNL0v9r700440
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 04:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/NKX/57tYYBCmkhefEDajLW0SWz9CgJw4SMyS6Hgi3A=; b=lptUDiMD8lWvBeu0
	OzkHjgLNGwbPOmWjlYj670wIGUXDFMgOm2/iVryRX5cASMdgkjfMLBYdLd5hb4Tt
	jJEensK4SuRIecb+F5JaPP8R16vytpGSOqyBwCCtbkXq3vETxUJHAQE2Rsu6COO4
	8GwUG834w8LYbXl/drMvCMXHCoKDP1BCYMFclswbkZ9CFpOq0L9JKtBkQCFOjeZq
	ymGYM0TujPWCRgHUpUgOWNefx5puFOkTaSc8YkeQ17a50/gyqg7Da+eR0OBRN9cK
	zqYkEexns+3HcoS3LYS9h1ndi+UcJkcUExrwkOsimZgw45WBQOz2Tl5kDr8ep++i
	nvM/Vw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jtmjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 04:43:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7d481452732so10943463b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 20:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766551408; x=1767156208; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/NKX/57tYYBCmkhefEDajLW0SWz9CgJw4SMyS6Hgi3A=;
        b=J72xlBg5AJmtqNjZV2c3LcUwRrLip8/essbTt/WccSiXjwZzJIN6dlM6VO+s/Ix6Iw
         p52AGXQmuPaH9I/jVb1Z5wMSD1EO7gerU3Szm1wJub5QxP5B5Tecv/xHH/tif5578Cfn
         1WHfHM8wXSyv+VVXPcq8742w64nlvWJ70BDAU0LjpN5ZwlZIK1sXNybNTPrRXG67nFJL
         KmUNjw/20IR3qavJE5UJukGPMvEd5wX5WBAQ1mPBiIhehbjqh49NFYqtAwkZFQWl81yj
         YR9/TiOcrZtNEs7cyvuLlAkEdw2VH5POrE234jtTTD4GGxskbC0TYOfveMpvUSs93H1C
         0lLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766551408; x=1767156208;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NKX/57tYYBCmkhefEDajLW0SWz9CgJw4SMyS6Hgi3A=;
        b=JFgEfvX9Ng9yGfCoKB9iOh5CPBH1pL1WXH0N93ZG7rO3NGabD6zUJWQJp0+Z3sp2hR
         86TYHdW3igIjJTfT9uBoFluXyLQFYUpkOrUvQJd6bL5DVfvwx80iDnIqvGfZVjhdwp9S
         v+QOLAYJtkOiUof3UkY0avMki6NvkQkR8YlCHKm2pn7ukj3oR7AIF35vRwyzx3039Gs1
         a5Fory2Udq7j5E2M6fDiQkZ834UmAldzcRKGktfOAIKaq+diEJGgCh0iiehWaC3UHjgi
         jqOPFbCMCHEbvI+8hnRO8jhSQdIKgBlqyNeqzkqJIHuocHbDSE7p4dAi+obMIypVNdFk
         3J+g==
X-Forwarded-Encrypted: i=1; AJvYcCWev9l+YRsQibgqkvq9ByIIQ+DSmQhpxi8/o1dHvpHC8S4zZgMatcfbVNyVNvlNQJarZhygW+cvnzQKo7UR@vger.kernel.org
X-Gm-Message-State: AOJu0YwrFq4Wx5ieASzz8E+BtfK543BhJpqn/BOusMMwYd9VNNJREbHx
	IpccHdV155SQyfuqs0s0NG5C0OdVkzKYOvyAgGufLL9yqprchCfh2EYrXdPMlcZUjflGg+oMsRZ
	/AbmDnoFRgsxvbKMEnj4R8LxydKds7nBuO1wzWl/XO6sjZOaKvuM9hNoH0RfaJVZwBj8F
X-Gm-Gg: AY/fxX66vifw/ouerxK1QufeK0P1NqKJiSy+SLZEYw4nKu37kX2Lz7aQbo5VrFx1CPk
	479+ed3K7jrGfkkUWpuYlyWG3P8hDO8t/IbsmffGbU2MPuTKlxJCujuMrzBvxml+gTF4pq1KREJ
	l7Q+t6KILDuMRxAaAL/6/uSZdw4BI4i7YEQXkJIKur8vMQrLrobjR1IogQX9B2oGs3fhfyQySg7
	O3UZTbhGe7P8NseJMKTqg8eF3ia1cmiU0gDr+QuwDXdDJr6jQc6Givrk1+b9Qqqf2ZuZhksrG+h
	KodA3nvIdDGWStAWGWDo/nZrnKMWeDKStHnDEZhwF6cA7uLZDTe9Sw6T8/bas4P6PDGt+i17myX
	Ewv02P9Mj7SsETEd4ss30CK/0WKe/f2ZwEH3rZ3aM+6aT4E6Xkn/SX+8O3kf9wh75zvjSCJbur/
	BiiALG
X-Received: by 2002:a05:6a00:8d8e:b0:7b8:3549:85f9 with SMTP id d2e1a72fcca58-7ff64eca979mr14445114b3a.30.1766551408202;
        Tue, 23 Dec 2025 20:43:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvc4FrnFMsQMIBE3qVedvVFkxoaNx3NeqcjjCZI3I6L2rFmIE9Yn6mBYWW9e5zltIVhIzrsA==
X-Received: by 2002:a05:6a00:8d8e:b0:7b8:3549:85f9 with SMTP id d2e1a72fcca58-7ff64eca979mr14445098b3a.30.1766551407668;
        Tue, 23 Dec 2025 20:43:27 -0800 (PST)
Received: from [10.133.33.224] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e88c8f0sm15536300b3a.62.2025.12.23.20.43.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 20:43:27 -0800 (PST)
Message-ID: <51e0665b-42c4-4084-8019-9fbeaefb5b56@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 12:43:20 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] remoteproc: qcom: pas: Add late attach support for
 subsystems
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
References: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
 <20251223-knp-remoteproc-v3-4-5b09885c55a5@oss.qualcomm.com>
 <aUsUhX8Km275qonq@linaro.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <aUsUhX8Km275qonq@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAzNiBTYWx0ZWRfX6ErpF31cGvpk
 BYVj88/0H2cbveAyCMduL2f9MyEVCumcSBzjkPO3OuJ27zQtFzUVzg35MICMYIXCw6O/cEQplj3
 EqxtZqnRdg9iiUciQBs6+dHaRPJxYDnU9Soio4kR3MB82qFxBlfLTjRAMXRD8GwgcKY9rRknpue
 TLYyF0GPUpQq3DyqSvRbDmgdpPr38F0gdmpYq4ja+7LEDJmcV0e/FxH2RQ6fbdwu03ZBSk+QnBx
 lDnMIeq5tRkngf+FZlID1Qu65eXR0LKBA0G90VPXpToB+nTRwG51t40fh3kpgJD82fcaO/WxsWZ
 wdxLZMoRU0wkbfdGv8aTILNRG+5HT95SK/qkytUmRhLD85THXhClaLcJLPDLOPLb1wWFduyDRet
 zPpKdBbBavGY5etptsFmafjb6iqYXqF9PhoDTO57INq0//pls22qqudAmIA2205v/Qpt+B56APD
 QbfH4ivcI63eYdWAI2w==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694b6f71 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=xPClpbL46aL21xVsldcA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 50kc-cNXDZIf9VaAYu8W90JaEWkQ1fFJ
X-Proofpoint-ORIG-GUID: 50kc-cNXDZIf9VaAYu8W90JaEWkQ1fFJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240036



On 12/24/2025 6:15 AM, Stephan Gerhold wrote:
> On Tue, Dec 23, 2025 at 01:13:50AM -0800, Jingyi Wang wrote:
>> From: Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>>
>> Subsystems can be brought out of reset by entities such as bootloaders.
>> As the irq enablement could be later than subsystem bring up, the state
>> of subsystem should be checked by reading SMP2P bits and performing ping
>> test.
>>
>> A new qcom_pas_attach() function is introduced. if a crash state is
>> detected for the subsystem, rproc_report_crash() is called. If the
>> subsystem is ready either at the first check or within a 5-second timeout
>> and the ping is successful, it will be marked as "attached". The ready
>> state could be set by either ready interrupt or handover interrupt.
>>
>> If "early_boot" is set by kernel but "subsys_booted" is not completed
>> within the timeout, It could be the early boot feature is not supported
>> by other entities. In this case, the state will be marked as RPROC_OFFLINE
>> so that the PAS driver can load the firmware and start the remoteproc. As
>> the running state is set once attach function is called, the watchdog or
>> fatal interrupt received can be handled correctly.
>>
>> Signed-off-by: Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
>> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  drivers/remoteproc/qcom_q6v5.c      | 87 ++++++++++++++++++++++++++++++++-
>>  drivers/remoteproc/qcom_q6v5.h      | 11 ++++-
>>  drivers/remoteproc/qcom_q6v5_adsp.c |  2 +-
>>  drivers/remoteproc/qcom_q6v5_mss.c  |  2 +-
>>  drivers/remoteproc/qcom_q6v5_pas.c  | 97 ++++++++++++++++++++++++++++++++++++-
>>  drivers/remoteproc/qcom_q6v5_wcss.c |  2 +-
>>  6 files changed, 195 insertions(+), 6 deletions(-)
>>
>> [...]
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index 52680ac99589..7e890e18dd82 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> [...]
>> @@ -434,6 +440,85 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>>  	return qcom_q6v5_panic(&pas->q6v5);
>>  }
>>  
>> +static int qcom_pas_attach(struct rproc *rproc)
>> +{
>> +	int ret;
>> +	struct qcom_pas *pas = rproc->priv;
>> +	bool ready_state;
>> +	bool crash_state;
>> +
>> +	pas->q6v5.running = true;
>> +	ret = irq_get_irqchip_state(pas->q6v5.fatal_irq,
>> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
>> +
>> +	if (ret)
>> +		goto disable_running;
>> +
>> +	if (crash_state) {
>> +		dev_err(pas->dev, "Sub system has crashed before driver probe\n");
>> +		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> 
> Have you tested this case? From quick review of the code in
> remoteproc_core.c I'm skeptical if this will work correctly:
> 
>  1. Remoteproc is in RPROC_DETACHED state during auto boot
>  2. qcom_pas_attach() runs and calls rproc_report_crash(), then fails so
>     RPROC_DETACHED state remains
>  3. rproc_crash_handler_work() sets RPROC_CRASHED and starts recovery
>  4. rproc_boot_recovery() calls rproc_stop()
>  5. rproc_stop() calls rproc_stop_subdevices(), but because the
>     remoteproc was never attached, the subdevices were never started.
> 
> In this situation, rproc_stop_subdevices() should not be called. I would
> expect you will need to make some minor changes to the remoteproc_core
> to support handling crashes during RPROC_DETACHED state.
> 
> I might be reading the code wrong, but please make sure that you
> simulate this case at runtime and check that it works correctly.
> 

Recheked this part, current path has some issue on recovery and subdev handling.
As in current code, rproc_report_crash is called in the ISR/callback, it may
take some effort to call it in this attach path.


>> +		ret = -EINVAL;
>> +		goto disable_running;
>> +	}
>> +
>> +	ret = irq_get_irqchip_state(pas->q6v5.ready_irq,
>> +				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
>> +
>> +	if (ret)
>> +		goto disable_running;
>> +
>> +	enable_irq(pas->q6v5.handover_irq);
>> +
>> +	if (unlikely(!ready_state)) {
>> +		/* Set a 5 seconds timeout in case the early boot is delayed */
>> +		ret = wait_for_completion_timeout(&pas->q6v5.subsys_booted,
>> +						  msecs_to_jiffies(EARLY_ATTACH_TIMEOUT_MS));
>> +
> 
> Again, have you tested this case?
> 
> As I already wrote in v2, I don't see how this case will work reliably
> in practice. How do you ensure that the handover resources will be kept
> on during the Linux boot process until the remoteproc has completed
> booting?
> 
> Also, above you enable the handover_irq. Let's assume a handover IRQ
> does come in while you are waiting here. Then q6v5_handover_interrupt()
> will call q6v5->handover(q6v5); to disable the handover resources
> (clocks, power domains), but you never enabled those. I would expect
> that you get some bad reference count warnings in the kernel log.
> 
> I would still suggest dropping this code entirely. As far as I
> understand the response from Aiqun(Maria) Yu [1], there is no real use
> case for this on current platforms. If you want to keep this, you would
> need to vote for the handover resources during probe() (and perhaps
> more, this case is quite tricky).
> 
> Please test all your changes carefully in v4.
> 

Thanks for your detailed review, the handover resources was indeed
neglected in the design, we will re-evaluate this part.

> Thanks,
> Stephan
> 
> [1]: https://lore.kernel.org/linux-arm-msm/c15f083d-a2c1-462a-aad4-a72b36fbe1ac@oss.qualcomm.com/

Thanks,
Jingyi

