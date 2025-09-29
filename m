Return-Path: <linux-arm-msm+bounces-75500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F398DBA8E30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 12:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BAD714E0F89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 10:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361872FBE08;
	Mon, 29 Sep 2025 10:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9pUKzNH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327C62FBE04
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 10:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759141790; cv=none; b=np5Qaaw77s5HhmcGNhRWFSUuKLARUzxNDcBBCUvuRMr1AF5yFbaOFP4/nKNY15B+zBxWmydFt9hWhR652dC9IYBjuq+HLN5JDaN7cr5GOXvtyffZAVcbX7RCtdE3WZHIV8ZeJzWEUGyKuGWyPwuzMa6KTWSrNoUIvn6yw8XsHz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759141790; c=relaxed/simple;
	bh=+RmVL+Ttxc3WgY+MhH6l5j792SQXH1m/NGDcrTAvOQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z0g6oAB/geUxtpf980UgrofMCfT2Fz1UJ+ozWvSj5dJ6FoCsnuRB98Bb5AyaPSIyuovjyJEHtaPPXTlW+Llu0TEueqBRFMNAls+UXFyAMrGmZYhy1v4TNhhRoEeBTqj6U25Q935AHy7Pz9tqYdUZYhVlsU3etNDLtHm/b5mpI2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9pUKzNH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58TAGhri027018
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 10:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Jl/YbGHod6H4gxvxtuge3GhMM7f7IzE2kDVcUT2TJk=; b=P9pUKzNHLwOkIxW6
	SOXyZzTpWX0hMDFyBmE9MX8dUg76M53DzJAWygAI78/rhT7Tlu0BgU3dGIJ8TJA1
	IBxb8U7TCr6mT4SJLQPo82CuJcgcxuS0iGyJt6D9JJleJsRhRjIN5DCU2VTa4JqH
	qUAxWicft8d54e2icHxgZCEKhEhrVeDOrcT13vwKQMht1KNK7F/X0tJl+4EwmNzd
	IJP1lICFv736AMFaMF9VXi4HxtYC7+OPFRA1KAa7+tKuKwCmmde2eRhkU7+CgHFE
	SLCOD2rboRlqMDPtQl9pEAp2YZ8e/3ibodF0wRj3ARy7A9h2BGikONA9YBcodunp
	WX/9QA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hcm95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 10:29:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32edda89a37so4141544a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 03:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759141786; x=1759746586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Jl/YbGHod6H4gxvxtuge3GhMM7f7IzE2kDVcUT2TJk=;
        b=RQsQSNxcYecmUsGkBCbYfLoBnKjHU3FZi3VJ3MvIwOR1W8+XE0Ri6EmW6IKEJ8qewa
         rGNBhVHJu/CT2t3VJO/ouUmzuH2i0zFpJFkdYKmfVhJ2YW99EhtbajbEfesuUGM1P2H/
         XFehVl1rpxp01Rtmr+ze/zsoY6SStS3FcyjrzBnjbWrTIjwKvN9CFRYCLBx3gtv3MDfb
         oGbPx50+MSo+chvG/0fKiRn5AjE/P5+ZUSEpJy7O8iUpV4trRfKSDR8OcfA1TKfaGY4j
         DODwIxgra6gmvMkcjJWYRPP4ux6Fqy31MFY9sWEDVud48QW6Rlfzl6Sm0fCqbcBDoXFh
         WUgg==
X-Forwarded-Encrypted: i=1; AJvYcCVgLDX6LUUs6+B9ziMGSirCTH915F0PJeRfgTBj0kA0yg4TSCt8Kkm3GzIr+ZQ1PVDaa2EYzFkaZCi/RYZ7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5WDPq3U1SP49kI5viJghgJ9/PJKtaf6GWVyyCujUIjM+N9x7G
	h+XTndcqRAYm3Z3mYrvykroQ8qpHQxEf+Z4yL2EZxUsolleFA8dvzpq5g1zVmCJyDnpp9S67SBs
	xrMP9rD+Mpns2SzPgRYy/n4VOp77VdpI2dr+l+2W/lg918kVEhHxDkbKrEBlGRBJZhep9
X-Gm-Gg: ASbGncs5XyiSNBgMh4o4Mp/Hesj3N6cMmD1sgpbAmCaEsx0fIyyAFFZ2CEH71XCh3Ir
	bAQUDVATLByHeAznQbgP+flAp08+cwQWcuLthORvXeqh6jibWVzLl/H/2iS5cQrlZ9seYfS0djK
	JN8koLCUkcdLdeDUMEeY2f36EpQvmwIXKOR6Rgek5h38OcpGQ37TlYfwxW95ATr2Esxjz9whtvs
	wUwWoH1ROgo5N1RObBIBOR+4dwR/MzlaitaToXFVkvNWg1Yv9OywtXTalRfMNPVcwX5qa89oXRj
	wv7xeRkK2m8jKQ+yBT9AgpwsifkX/qs47Ogd6CzJUl1MVjQIrg15OM7Xk4fuGGU9EF98U/CUi0K
	3J+bhJEXfx3TXiQA2mTTX7f4yiUaPM2zxmE8=
X-Received: by 2002:a17:90b:4f47:b0:32e:9daa:7347 with SMTP id 98e67ed59e1d1-3342a242c87mr16765206a91.7.1759141786203;
        Mon, 29 Sep 2025 03:29:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHI0jg54adph62Y0WTwdiWbSUCOJJEFVQ+otQunh6fcYFPBXKEPRaek5Gs2ggnDJAtjUi2Z1A==
X-Received: by 2002:a17:90b:4f47:b0:32e:9daa:7347 with SMTP id 98e67ed59e1d1-3342a242c87mr16765170a91.7.1759141785589;
        Mon, 29 Sep 2025 03:29:45 -0700 (PDT)
Received: from [10.133.33.234] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-338387099d6sm806051a91.10.2025.09.29.03.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 03:29:45 -0700 (PDT)
Message-ID: <9fabc028-e6e1-449e-8de1-6215163cd3d5@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 18:29:37 +0800
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
 <0bc11a0f-826e-4d57-ab59-abae71685f1e@oss.qualcomm.com>
 <qzd3lgtld7febadsupxhjds47omsw5232vgts3ubqedmusew2o@xboj26mkbbm6>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <qzd3lgtld7febadsupxhjds47omsw5232vgts3ubqedmusew2o@xboj26mkbbm6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX2URM7iUd2NJz
 iCEqcXtaa696ZybaGJloMH8RiewPi0quLcRD2PWgQH7oX9lBL8Pz1Re31GXkrpXAYxuA6NRys7u
 ceh3Jz5gMHr/U7wrh4munstukMhgnSyyedPfZl24qF3F9ZRXfqaBljvtFnAHokSBe/oUgczW8rD
 G6s/IR8aLJ35rSQPb9/zH0IJHG4j4eoO72EIAYh5T/l+kiXFc0y+lViV5Ko/juQsG9EDXPI8D7n
 +bcPm2pnMvGhwBtGfYQv2pAbCyDHTi1v4h+nB8j3Pe7+ZoMwLqnNu29+VjVNXI7b6o85NASlsRb
 IA9kQ/g4TcKYJOJu/ym+lxlKN+2Fufqn4+qBQtIJom67w9/d0gUW1a6BnUTw4QoN2jLKY1Swotn
 3XZNVrVevnZZma+t3z+EJ+4QVb4bSg==
X-Proofpoint-GUID: M1Ac2vSCzJh04v6FfS7wgJy_l8iScr4K
X-Proofpoint-ORIG-GUID: M1Ac2vSCzJh04v6FfS7wgJy_l8iScr4K
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68da5f9b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=iPKkQtU763l47-xHpucA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_04,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041



On 9/29/2025 5:35 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 29, 2025 at 02:42:10PM +0800, Jingyi Wang wrote:
>>
>>
>> On 9/25/2025 11:04 AM, Dmitry Baryshkov wrote:
>>> On Wed, Sep 24, 2025 at 04:37:26PM -0700, Jingyi Wang wrote:
>>>> From: Gokul krishna Krishnakumar <Gokul.krishnakumar@oss.qualcomm>
>>>>
>>>> Subsystems can be brought out of reset by entities such as
>>>> bootloaders. Before attaching such subsystems, it is important to
>>>> check the state of the subsystem. This patch adds support to attach
>>>> to a subsystem by ensuring that the subsystem is in a sane state by
>>>> reading SMP2P bits and pinging the subsystem.
>>>>
>>>> Signed-off-by: Gokul krishna Krishnakumar <Gokul.krishnakumar@oss.qualcomm>
>>>> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>>> ---
>>>>  drivers/remoteproc/qcom_q6v5.c      | 89 ++++++++++++++++++++++++++++++++++++-
>>>>  drivers/remoteproc/qcom_q6v5.h      | 14 +++++-
>>>>  drivers/remoteproc/qcom_q6v5_adsp.c |  2 +-
>>>>  drivers/remoteproc/qcom_q6v5_mss.c  |  2 +-
>>>>  drivers/remoteproc/qcom_q6v5_pas.c  | 61 ++++++++++++++++++++++++-
>>>>  5 files changed, 163 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
>>>> index 4ee5e67a9f03..cba05e1d6d52 100644
>>>> --- a/drivers/remoteproc/qcom_q6v5.c
>>>> +++ b/drivers/remoteproc/qcom_q6v5.c
>>>> @@ -94,6 +94,9 @@ static irqreturn_t q6v5_wdog_interrupt(int irq, void *data)
>>>>  	size_t len;
>>>>  	char *msg;
>>>>  
>>>> +	if (q6v5->early_boot)
>>>> +		complete(&q6v5->subsys_booted);
>>>
>>> Where do we clean this flag? I think you current code breaks restarting
>>> of ADSP. Once the ADSP is brought up, the flag should be cleared and
>>> further handling of the ADSP should follow the normal flow.
>>>
>>
>> q6v5->subsys_booted can not be cleared now, it is only checked in the 
>> qcom_pas_attach callback, so the bootup process will not be infected, 
>> we have tested shutdown->bootup process and it runs as expected.
> 
> I was more interested in clearing the early_boot flag.
> 

Sure, we can clear it in the stop callback.

>>
>> Thanks,
>> Jingyi
>>
>>
>>>> +
>>>>  	/* Sometimes the stop triggers a watchdog rather than a stop-ack */
>>>>  	if (!q6v5->running) {
>>>>  		complete(&q6v5->stop_done);
>>>> @@ -118,6 +121,9 @@ static irqreturn_t q6v5_fatal_interrupt(int irq, void *data)
>>>>  	size_t len;
>>>>  	char *msg;
>>>>  
>>>> +	if (q6v5->early_boot)
>>>> +		complete(&q6v5->subsys_booted);
>>>> +
>>>>  	if (!q6v5->running)
>>>>  		return IRQ_HANDLED;
>>>>  
>>>> @@ -139,6 +145,9 @@ static irqreturn_t q6v5_ready_interrupt(int irq, void *data)
>>>>  
>>>>  	complete(&q6v5->start_done);
>>>>  
>>>> +	if (q6v5->early_boot)
>>>> +		complete(&q6v5->subsys_booted);
>>>> +
>>>>  	return IRQ_HANDLED;
>>>>  }
>>>>  
>>>> @@ -170,6 +179,9 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
>>>>  	if (q6v5->handover)
>>>>  		q6v5->handover(q6v5);
>>>>  
>>>> +	if (q6v5->early_boot)
>>>> +		complete(&q6v5->subsys_booted);
>>>> +
>>>>  	icc_set_bw(q6v5->path, 0, 0);
>>>>  
>>>>  	q6v5->handover_issued = true;
>>>> @@ -232,6 +244,77 @@ unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
>>>>  }
>>>>  EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
>>>>  
>>>> +static irqreturn_t q6v5_pong_interrupt(int irq, void *data)
>>>> +{
>>>> +	struct qcom_q6v5 *q6v5 = data;
>>>> +
>>>> +	complete(&q6v5->ping_done);
>>>> +
>>>> +	return IRQ_HANDLED;
>>>> +}
>>>> +
>>>> +int qcom_q6v5_ping_subsystem(struct qcom_q6v5 *q6v5)
>>>> +{
>>>> +	int ret;
>>>> +	int ping_failed = 0;
>>>> +
>>>> +	reinit_completion(&q6v5->ping_done);
>>>> +
>>>> +	/* Set master kernel Ping bit */
>>>> +	ret = qcom_smem_state_update_bits(q6v5->ping_state,
>>>> +					  BIT(q6v5->ping_bit), BIT(q6v5->ping_bit));
>>>> +	if (ret) {
>>>> +		dev_err(q6v5->dev, "Failed to update ping bits\n");
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	ret = wait_for_completion_timeout(&q6v5->ping_done, msecs_to_jiffies(PING_TIMEOUT));
>>>> +	if (!ret) {
>>>> +		ping_failed = -ETIMEDOUT;
>>>> +		dev_err(q6v5->dev, "Failed to get back pong\n");
>>>> +	}
>>>> +
>>>> +	/* Clear ping bit master kernel */
>>>> +	ret = qcom_smem_state_update_bits(q6v5->ping_state, BIT(q6v5->ping_bit), 0);
>>>> +	if (ret) {
>>>> +		pr_err("Failed to clear master kernel bits\n");
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	if (ping_failed)
>>>> +		return ping_failed;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem);
>>>> +
>>>> +int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev)
>>>> +{
>>>> +	int ret = -ENODEV;
>>>> +
>>>> +	q6v5->ping_state = devm_qcom_smem_state_get(&pdev->dev, "ping", &q6v5->ping_bit);
>>>> +	if (IS_ERR(q6v5->ping_state)) {
>>>> +		dev_err(&pdev->dev, "failed to acquire smem state %ld\n",
>>>> +			PTR_ERR(q6v5->ping_state));
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	q6v5->pong_irq = platform_get_irq_byname(pdev, "pong");
>>>> +	if (q6v5->pong_irq < 0)
>>>> +		return q6v5->pong_irq;
>>>> +
>>>> +	ret = devm_request_threaded_irq(&pdev->dev, q6v5->pong_irq, NULL,
>>>> +					q6v5_pong_interrupt, IRQF_TRIGGER_RISING | IRQF_ONESHOT,
>>>> +					"q6v5 pong", q6v5);
>>>> +	if (ret)
>>>> +		dev_err(&pdev->dev, "failed to acquire pong IRQ\n");
>>>> +
>>>> +	init_completion(&q6v5->ping_done);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(qcom_q6v5_ping_subsystem_init);
>>>> +
>>>>  /**
>>>>   * qcom_q6v5_init() - initializer of the q6v5 common struct
>>>>   * @q6v5:	handle to be initialized
>>>> @@ -245,7 +328,7 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
>>>>   */
>>>>  int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>>>>  		   struct rproc *rproc, int crash_reason, const char *load_state,
>>>> -		   void (*handover)(struct qcom_q6v5 *q6v5))
>>>> +		   bool early_boot, void (*handover)(struct qcom_q6v5 *q6v5))
>>>>  {
>>>>  	int ret;
>>>>  
>>>> @@ -253,10 +336,14 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>>>>  	q6v5->dev = &pdev->dev;
>>>>  	q6v5->crash_reason = crash_reason;
>>>>  	q6v5->handover = handover;
>>>> +	q6v5->early_boot = early_boot;
>>>>  
>>>>  	init_completion(&q6v5->start_done);
>>>>  	init_completion(&q6v5->stop_done);
>>>>  
>>>> +	if (early_boot)
>>>> +		init_completion(&q6v5->subsys_booted);
>>>> +
>>>>  	q6v5->wdog_irq = platform_get_irq_byname(pdev, "wdog");
>>>>  	if (q6v5->wdog_irq < 0)
>>>>  		return q6v5->wdog_irq;
>>>> diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
>>>> index 5a859c41896e..8a227bf70d7e 100644
>>>> --- a/drivers/remoteproc/qcom_q6v5.h
>>>> +++ b/drivers/remoteproc/qcom_q6v5.h
>>>> @@ -12,27 +12,35 @@ struct rproc;
>>>>  struct qcom_smem_state;
>>>>  struct qcom_sysmon;
>>>>  
>>>> +#define PING_TIMEOUT 500 /* in milliseconds */
>>>> +#define PING_TEST_WAIT 500 /* in milliseconds */
>>>> +
>>>>  struct qcom_q6v5 {
>>>>  	struct device *dev;
>>>>  	struct rproc *rproc;
>>>>  
>>>>  	struct qcom_smem_state *state;
>>>> +	struct qcom_smem_state *ping_state;
>>>>  	struct qmp *qmp;
>>>>  
>>>>  	struct icc_path *path;
>>>>  
>>>>  	unsigned stop_bit;
>>>> +	unsigned int ping_bit;
>>>>  
>>>>  	int wdog_irq;
>>>>  	int fatal_irq;
>>>>  	int ready_irq;
>>>>  	int handover_irq;
>>>>  	int stop_irq;
>>>> +	int pong_irq;
>>>>  
>>>>  	bool handover_issued;
>>>>  
>>>>  	struct completion start_done;
>>>>  	struct completion stop_done;
>>>> +	struct completion subsys_booted;
>>>> +	struct completion ping_done;
>>>>  
>>>>  	int crash_reason;
>>>>  
>>>> @@ -40,11 +48,13 @@ struct qcom_q6v5 {
>>>>  
>>>>  	const char *load_state;
>>>>  	void (*handover)(struct qcom_q6v5 *q6v5);
>>>> +
>>>> +	bool early_boot;
>>>>  };
>>>>  
>>>>  int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>>>>  		   struct rproc *rproc, int crash_reason, const char *load_state,
>>>> -		   void (*handover)(struct qcom_q6v5 *q6v5));
>>>> +		   bool early_boot, void (*handover)(struct qcom_q6v5 *q6v5));
>>>>  void qcom_q6v5_deinit(struct qcom_q6v5 *q6v5);
>>>>  
>>>>  int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5);
>>>> @@ -52,5 +62,7 @@ int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
>>>>  int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5, struct qcom_sysmon *sysmon);
>>>>  int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
>>>>  unsigned long qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
>>>> +int qcom_q6v5_ping_subsystem(struct qcom_q6v5 *q6v5);
>>>> +int qcom_q6v5_ping_subsystem_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev);
>>>>  
>>>>  #endif
>>>> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
>>>> index e98b7e03162c..1576b435b921 100644
>>>> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
>>>> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
>>>> @@ -717,7 +717,7 @@ static int adsp_probe(struct platform_device *pdev)
>>>>  		goto disable_pm;
>>>>  
>>>>  	ret = qcom_q6v5_init(&adsp->q6v5, pdev, rproc, desc->crash_reason_smem,
>>>> -			     desc->load_state, qcom_adsp_pil_handover);
>>>> +			     desc->load_state, false, qcom_adsp_pil_handover);
>>>>  	if (ret)
>>>>  		goto disable_pm;
>>>>  
>>>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
>>>> index 0c0199fb0e68..04e577541c8f 100644
>>>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>>>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>>>> @@ -2156,7 +2156,7 @@ static int q6v5_probe(struct platform_device *pdev)
>>>>  	qproc->has_mba_logs = desc->has_mba_logs;
>>>>  
>>>>  	ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc, MPSS_CRASH_REASON_SMEM, "modem",
>>>> -			     qcom_msa_handover);
>>>> +			     false, qcom_msa_handover);
>>>>  	if (ret)
>>>>  		goto detach_proxy_pds;
>>>>  
>>>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>>>> index 55a7da801183..99163e48a76a 100644
>>>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>>>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>>>> @@ -35,6 +35,8 @@
>>>>  
>>>>  #define MAX_ASSIGN_COUNT 3
>>>>  
>>>> +#define EARLY_BOOT_RETRY_INTERVAL_MS 5000
>>>> +
>>>>  struct qcom_pas_data {
>>>>  	int crash_reason_smem;
>>>>  	const char *firmware_name;
>>>> @@ -58,6 +60,7 @@ struct qcom_pas_data {
>>>>  	int region_assign_count;
>>>>  	bool region_assign_shared;
>>>>  	int region_assign_vmid;
>>>> +	bool early_boot;
>>>>  };
>>>>  
>>>>  struct qcom_pas {
>>>> @@ -430,6 +433,51 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
>>>>  	return qcom_q6v5_panic(&pas->q6v5);
>>>>  }
>>>>  
>>>> +static int qcom_pas_attach(struct rproc *rproc)
>>>> +{
>>>> +	int ret;
>>>> +	struct qcom_pas *adsp = rproc->priv;
>>>> +	bool ready_state;
>>>> +	bool crash_state;
>>>> +
>>>> +	if (!adsp->q6v5.early_boot)
>>>> +		return -EINVAL;
>>>> +
>>>> +	ret = irq_get_irqchip_state(adsp->q6v5.fatal_irq,
>>>> +				    IRQCHIP_STATE_LINE_LEVEL, &crash_state);
>>>> +
>>>> +	if (crash_state) {
>>>> +		dev_err(adsp->dev, "Sub system has crashed before driver probe\n");
>>>> +		adsp->rproc->state = RPROC_CRASHED;
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
>>>> +	ret = irq_get_irqchip_state(adsp->q6v5.ready_irq,
>>>> +				    IRQCHIP_STATE_LINE_LEVEL, &ready_state);
>>>> +
>>>> +	if (ready_state) {
>>>> +		dev_info(adsp->dev, "Sub system has boot-up before driver probe\n");
>>>> +		adsp->rproc->state = RPROC_DETACHED;
>>>> +	} else {
>>>> +		ret = wait_for_completion_timeout(&adsp->q6v5.subsys_booted,
>>>> +						  msecs_to_jiffies(EARLY_BOOT_RETRY_INTERVAL_MS));
>>>> +		if (!ret) {
>>>> +			dev_err(adsp->dev, "Timeout on waiting for subsystem interrupt\n");
>>>> +			return -ETIMEDOUT;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	ret = qcom_q6v5_ping_subsystem(&adsp->q6v5);
>>>> +	if (ret) {
>>>> +		dev_err(adsp->dev, "Failed to ping subsystem, assuming device crashed\n");
>>>> +		rproc->state = RPROC_CRASHED;
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	adsp->q6v5.running = true;
>>>> +	return ret;
>>>> +}
>>>> +
>>>>  static const struct rproc_ops qcom_pas_ops = {
>>>>  	.unprepare = qcom_pas_unprepare,
>>>>  	.start = qcom_pas_start,
>>>> @@ -438,6 +486,7 @@ static const struct rproc_ops qcom_pas_ops = {
>>>>  	.parse_fw = qcom_register_dump_segments,
>>>>  	.load = qcom_pas_load,
>>>>  	.panic = qcom_pas_panic,
>>>> +	.attach = qcom_pas_attach,
>>>>  };
>>>>  
>>>>  static const struct rproc_ops qcom_pas_minidump_ops = {
>>>> @@ -760,7 +809,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>>>  	pas->proxy_pd_count = ret;
>>>>  
>>>>  	ret = qcom_q6v5_init(&pas->q6v5, pdev, rproc, desc->crash_reason_smem,
>>>> -			     desc->load_state, qcom_pas_handover);
>>>> +			     desc->load_state, desc->early_boot, qcom_pas_handover);
>>>>  	if (ret)
>>>>  		goto detach_proxy_pds;
>>>>  
>>>> @@ -774,6 +823,16 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>>>  	}
>>>>  
>>>>  	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
>>>> +
>>>> +	if (pas->q6v5.early_boot) {
>>>> +		ret = qcom_q6v5_ping_subsystem_init(&pas->q6v5, pdev);
>>>> +		if (ret)
>>>> +			dev_err(&pdev->dev,
>>>> +				"Unable to find ping/pong bits, falling back to firmware load\n");
>>>> +		else
>>>> +			pas->rproc->state = RPROC_DETACHED;
>>>> +	}
>>>> +
>>>>  	ret = rproc_add(rproc);
>>>>  	if (ret)
>>>>  		goto remove_ssr_sysmon;
>>>>
>>>> -- 
>>>> 2.25.1
>>>>
>>>
>>
> 


