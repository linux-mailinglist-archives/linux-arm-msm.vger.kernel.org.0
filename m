Return-Path: <linux-arm-msm+bounces-103784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJtUNGdL5mkgugEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 17:51:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F37A42EA5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 17:51:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0D0193101684
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13DCA35C1B5;
	Mon, 20 Apr 2026 14:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KNSCQwRK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WoRnXbjT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C46935B64E
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 14:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776693797; cv=none; b=nouAECYgLtECyexhATSoHtB9B5z8HZD8LQu5RMkp8MwaeGnfQ0ymJk8xpJ8szD+SzXkFPuFL/IQDICD30heoUP3IYsXRT8F4j1k69bnmkx8F17TqxJ8s5Jf1mBj+6eqscVcTda2w2GBNJ5vNMYXB/kEfIBuqHIoJYOja+E2EXA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776693797; c=relaxed/simple;
	bh=MFjbkJTZcf0W5RN6m5rEwf61YAjBi4ZAenyKuAV8xLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IVAGx5tT/qmTZse5keD36HOF5RjRzIbDT68fDAGsX1tJVl/SJYhaNPlKP1Mg/PH+xAGahhJzqHBd2qB+4q7ziSi/09zjY25IYDiafuDzLddyGgn+NFCt01fC90r5faATrwQUonpZnrHCKjw6d5X5xuGD5TKDF2w6vuZhLmDIJLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNSCQwRK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WoRnXbjT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KBIdbV1599247
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 14:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qmwoyEYOD3qeVLU9J7onMjI6vup1YjLazMtiXioAv4k=; b=KNSCQwRKLR5tCprq
	ji6xxEgwvaDWbMmkITYQ0Z5gQnvVxx90rqTjCn18qoU9e7DRFbDTmd9XBoUAq99m
	rjOfGuzBT1ikoHlFJLpLPcxpx2rbcPPEI6g5vk2PMxSEO4i5lzN0NyFwKewvaTcH
	kcWZMVrKtWfL8atNIobs8ePKv9ddL74B78TyWkPyw8R67RPuIfKgaiGg1LI8LitW
	t453K+AiHNr5s3wPBACAVmUsj1F4jz4hanEb9kEw+NzB/9K4Z+CO0Ll+nNOkGoVX
	m1SXQKkW9lajC2AABAIir2LvQ2K6+jUSoCuCTIRYtqVN3VjLBk4lKJPpUpOG5DK0
	OxGqNg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfgnhrs5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 14:03:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2e06219cbso39042515ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776693794; x=1777298594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qmwoyEYOD3qeVLU9J7onMjI6vup1YjLazMtiXioAv4k=;
        b=WoRnXbjTO4Y1/xlj0tfIiOldWVh1PfeH9ETDoeKqCHFBLSsL9bpd+w0QxRtCh5elMw
         QQflJIfRSKkAUfbPL0GhkIpBVDZnH0/gXmY5SdY1JaTIinu52+4YFdcVQiq+ASI4KYOU
         essX+jFFbSSwuFrOMNdplpq1GXzNWvxOVGu0XFrDDWUsR8BY85cwXg5HM2djfTtELMdI
         PYbi5RlEzPtJsGNJnQ4zXoFgxpreBRaiSXW7cWPAB/hrUEpsSzinLeY032iepJJccOLD
         EDVVeYXBUcqZGhiiYgb7wLFWPwRhcqPgCvFFIuKMovmoRnRuustT4UnU8/I8bePJYbph
         NPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776693794; x=1777298594;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmwoyEYOD3qeVLU9J7onMjI6vup1YjLazMtiXioAv4k=;
        b=pHvKI2MHCbunur2gCzJF6lHI4l9+Afs2SnShABZCOYXIeAOWeN2RpNUzlrPJTp+owr
         pLoFF9DHEpr52G0Dnoe15beBpmgxa9FYMMMG3F0t30iipBa//b4fFZDjnrcdoHGUj5wV
         EhDivaA0cNjL+tdMiWZAPjU2TGUcJ5Kt6dabCTzOQYIG4Bnbx5JibT1LYQdQCI3fEi79
         aulUUAUl4N02NwPGJ/75VuJVSfqNt+2DVV+3TP/UYYhWihmk0rsDg6a54X+xGuj9WeCE
         PKalHXneTw8KfjpAqSL/QO+s4qHHYiw8hoC5EGDXLZz8Gc5c+qRPZlVWQmLoqlQfcfjd
         FfRw==
X-Forwarded-Encrypted: i=1; AFNElJ8neGHPmnSt8kGxzQFNt/wFAJHhikWILAQjNxnUsPD6ERvO9zNwxxEYdmqDEKJ9hBZJwLPgesv2EY/VV/ws@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5s/bQjKgDhBjatH+t1ysu3QY1ujHt9MpbKlG08WfAun5F+Kqj
	1kjXejK90iR8ZQR7nyJYJ5HP04V5PrkejZg2Ye1BdnXnM5UpgSUyoFU4BFToCCuRyWQ9I8ukfhj
	c4vzT0HLoGU5ZlZx3i/grxaJcu8er3heGnL+KpDP5PgptvS1HXSo10kqDqYtSkqTrrxpS
X-Gm-Gg: AeBDieuM5FOrCQUvbsOXM3NDG7wgF3w8frJ4qJKHm+VZ0dIfEuhw2IM6rnskPxfV8cv
	SK6pkfNIqRRi5rBB4av/ZvzzwpOHWDgPCfzRjCejTK336xWHNibQvglosHrPGjrU3QVG/+1R2fG
	tQ0aziRHBWC8ZvkJI4f4RLd5+p9FqYPNWLUkbvy5LKp0SO+2Gh+6Sf8ohn2VTr9MwJ6Stc9BCph
	gdN+4ww+lNJvL1M5oCWCjIqEoWrI9lTruIdBlPNG2zrsThH0AECwT5yvbhYxTW+X7kTKlDagIms
	j1eWXsjShkrYOGiIK4+Ph1hCjA6yJXVrgHmUAI+crO53S7pk9GlAP0dyGi3HAXyKMEYMm1CK2qx
	CWSiUpTNbO6iXuNWkw2ODRqTRaA2DxgrWCXuFCk4QNOOqIFR67QT1iO2OW9gitYtG
X-Received: by 2002:a17:902:ef11:b0:2b0:67cc:adc3 with SMTP id d9443c01a7336-2b5f9ec6e37mr132050655ad.14.1776693793819;
        Mon, 20 Apr 2026 07:03:13 -0700 (PDT)
X-Received: by 2002:a17:902:ef11:b0:2b0:67cc:adc3 with SMTP id d9443c01a7336-2b5f9ec6e37mr132049645ad.14.1776693793075;
        Mon, 20 Apr 2026 07:03:13 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa34ea7sm105061225ad.34.2026.04.20.07.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 07:03:10 -0700 (PDT)
Message-ID: <bab7f899-dc05-7c9d-aed5-fed1910aa32b@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 19:33:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 04/11] media: iris: Add helper to create a context bank
 device on iris vpu bus
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-4-7d3d1cf57b16@oss.qualcomm.com>
 <ie6dad3xewm25gdrqqne2fsroopu3jwgrqmu54sfzjliis6mo5@6qsgagvyynwx>
 <b0ba2172-3f66-c912-29e9-0a48b4480987@oss.qualcomm.com>
 <sqg2db63gsjg3cxfdfbmndhxibzlprgviarbcl4l6isza36nc3@ljgg23nkuooi>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <sqg2db63gsjg3cxfdfbmndhxibzlprgviarbcl4l6isza36nc3@ljgg23nkuooi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6qlbhdok8CYu8C_g3Wk_JarzN1JzsDCs
X-Proofpoint-GUID: 6qlbhdok8CYu8C_g3Wk_JarzN1JzsDCs
X-Authority-Analysis: v=2.4 cv=TK11jVla c=1 sm=1 tr=0 ts=69e63222 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=N0hD6JmQrVrYO7jJexcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEzNyBTYWx0ZWRfX9+AyJzAF1aFA
 ZU1l5qxyjKzkVJri09jRMlq9scGmpuq+wxDJWrjHk4OJ+w7qEOWS6EQZXgpxeK5JCtLCLk9qTEe
 UqbAeD9OH5kR/0Y/FGQ+jjv/+YA0mCndLesVPmaQlpO/3whWCtxHwMzVUl8Rmtv6wK0i4o/IOd6
 b/Neje7LTN+w81zDHQchZKFE2UN8H8eU7KCcXcUSdkFf/6BDP0B8y9xhXFsnlDEg/48zsn9q7R2
 aLgrTMdLXgRaEjLsW21uP9Q6HH53OplmXaPSx9Qe4Htxtojx4QPNpJm1CYJTMuNAowwjgVeJdbs
 P0aoTJLOSMro7xlLcIveT0Xy2FeBGTwDEgXTRV9yuBIXzTaSzMaMx607ya4mEAkxe01qCrajtju
 +SQJh2SRNRvr4O0VWs4m8rveSFfmN2lcYA/YSFXixCBoS/6xVAx7h41tHgVsAtZlorm44+yYwQz
 JC2Q0jGeZRnJG3wFluQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200137
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103784-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3F37A42EA5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/17/2026 11:53 PM, Dmitry Baryshkov wrote:
> On Fri, Apr 17, 2026 at 08:49:44PM +0530, Vishnu Reddy wrote:
>> On 4/14/2026 8:48 PM, Dmitry Baryshkov wrote:
>>> On Tue, Apr 14, 2026 at 10:30:00AM +0530, Vishnu Reddy wrote:
>>>> From: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>>>>
>>>> Add a helper function to allocate and register context bank (CB) device
>>>> on the iris vpu bus. The function ID associated with the CB is specified
>>>> from the platform data, allowing the bus dma_configure callback to apply
>>>> correct stream ID mapping when device is registered.
>>>>
>>>> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
>>>> ---
>>>>   drivers/media/platform/qcom/iris/iris_resources.c | 33 +++++++++++++++++++++++
>>>>   drivers/media/platform/qcom/iris/iris_resources.h |  1 +
>>>>   2 files changed, 34 insertions(+)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
>>>> index 773f6548370a..a25e0f2e9d26 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_resources.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
>>>> @@ -6,6 +6,7 @@
>>>>   #include <linux/clk.h>
>>>>   #include <linux/devfreq.h>
>>>>   #include <linux/interconnect.h>
>>>> +#include <linux/iris_vpu_bus.h>
>>>>   #include <linux/pm_domain.h>
>>>>   #include <linux/pm_opp.h>
>>>>   #include <linux/pm_runtime.h>
>>>> @@ -141,3 +142,35 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
>>>>   	return 0;
>>>>   }
>>>> +
>>>> +static void iris_release_cb_dev(struct device *dev)
>>>> +{
>>>> +	kfree(dev);
>>>> +}
>>>> +
>>>> +struct device *iris_create_cb_dev(struct iris_core *core, const char *name, const u32 *f_id)
>>> Please move into the bus code and make it generic enough.
>> Do you suggest to add a wrapper to pass the varying inputs to the generic
>> bus, something like this
>> struct device* create_and_register_device(dma_mask, parent_dev, *release,
>> dev_name,...)
> Definitely not the release function. The devname is also not that
> important. The rest, yes, you are correct.
>
>>>> +{
>>>> +	struct device *dev;
>>>> +	int ret;
>>>> +
>>>> +	dev = kzalloc_obj(*dev);
>>>> +	if (!dev)
>>>> +		return ERR_PTR(-ENOMEM);
>>>> +
>>>> +	dev->release = iris_release_cb_dev;
>>>> +	dev->bus = &iris_vpu_bus_type;
>>>> +	dev->parent = core->dev;
>>>> +	dev->coherent_dma_mask = core->iris_platform_data->dma_mask;
>>>> +	dev->dma_mask = &dev->coherent_dma_mask;
>>> Would you also need to set the of_node? See
>>> device_set_of_node_from_dev()
>> It might be needed for FastRPC as they are following sub node approach, Iris
>> does not need.
> Wouldn't it save you from passing it to of_dma_configure_id()?
Iris will pass parent device of_node, setting parent device is enough.
>>>> +
>>>> +	dev_set_name(dev, "%s", name);
>>>> +	dev_set_drvdata(dev, (void *)f_id);
>>>> +
>>>> +	ret = device_register(dev);
>>>> +	if (ret) {
>>>> +		put_device(dev);
>>>> +		return ERR_PTR(ret);
>>>> +	}
>>>> +
>>>> +	return dev;
>>>> +}
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
>>>> index 6bfbd2dc6db0..4a494627ff23 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_resources.h
>>>> +++ b/drivers/media/platform/qcom/iris/iris_resources.h
>>>> @@ -15,5 +15,6 @@ int iris_unset_icc_bw(struct iris_core *core);
>>>>   int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
>>>>   int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
>>>>   int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
>>>> +struct device *iris_create_cb_dev(struct iris_core *core, const char *name, const u32 *f_id);
>>>>   #endif
>>>>
>>>> -- 
>>>> 2.34.1
>>>>

