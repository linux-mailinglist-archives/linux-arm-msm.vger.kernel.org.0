Return-Path: <linux-arm-msm+bounces-103408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFEWAkjX4GlymgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:34:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BD340E469
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:34:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AF1A53018B5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D333B8BC7;
	Thu, 16 Apr 2026 12:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIZa+0gv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L9qd3PET"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BAB3A6B79
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776342777; cv=none; b=Qi9vrIDSoEQpYVK60RdVzgPVNcft1SlHjSqyfaAh9SFrL4NeT27Kdp0D+ZVKDCo9oVuywHSrQIYX8P6Mex/uNJKxvKaCzXmCrnLujVHwNqPmnSaBn0uz1z3uQDnT9sFow8TNBuPEultYCUYj1vXPoxPH2VAJ3akZ85tWObf/Usg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776342777; c=relaxed/simple;
	bh=cwE1pKm5PJA5sW7aqFj52asvuoc1NO8t4F4Tt0GXABo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+MBKJh/JlWVNGsvkKwYrosW1Zrjn3wrZWNUnqYUBBe9qnloUMMVsiCdYTIOfnWZmSvZbfpJhJWBTb7EmVCiiqEO6M1wcAOnHUg//CAf6nlcZ/v8h/i9871Fb79rlTIil4ef8AJbfTgXugl7wkMhz2wYBhfVgyfA/aoK29Dqtzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIZa+0gv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L9qd3PET; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GCPigI1668112
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+j9Ne7osd79sCPFakjkyiz6R7TFYBWznjRj3B5Vnuc=; b=gIZa+0gvPJBkOEcr
	ZYMkHmJruDbYYrXt+yCctRix3Go4E5tFyvdg5NUzTFD2aAUMSfzxE2+YfYIrE/fH
	B2ukGpSh4uL0p17gcBzjPVwjHL61E3Fj7Kgk27ZFcjO4766fVxqBDQ1Yic2pAgv6
	3cNzjYAieVQyRafmrQG/xa8KU3gKv7xWZ4GVXx4JLzcfYvO0Lep49I4WeLHASDz4
	GlCgA9j7LDe8jbjsiDlxTiG45rv+VvSAabr5RHiSTUXfX/WZYAFXcr8I/5hxbfgK
	Uap9lIEGm93G/qekm2ayqA0O3Tmjel86Fv+1FOJjjbARH3dN50E4XK+CX/rv6txe
	GIpT6Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtd91a8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:32:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b461b36990so45836425ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 05:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776342774; x=1776947574; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+j9Ne7osd79sCPFakjkyiz6R7TFYBWznjRj3B5Vnuc=;
        b=L9qd3PETJ95rGd66B0MgPlXowC2bto48AS4lo8ut++puzWWn2s2uTzxfs803wInJxx
         YEbPk0YyR6J6TQfg9Zfpu8ciYEUjUH4jrp1OFKxsojPPGziPb8UYqpWXHbotw5bdCk/j
         +aOdyiFxLoFjdQFN/ceDGPkECulbaQxiKHIRNznhxkg1qmnCpIwpPiiDbEgib62kApri
         xu+AHcm3fib9UYe0hTyIW+R27roPd6YmP4C5Tz2EVi38zqy8R8952x6ZMLTMBhrnky4W
         zYZAC3/DayiYoeN9DRPrLUQU0J73RBtLxMS8LgZPlTw7KJVdoqJa5j3QH05clPzSAYnf
         +lQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776342774; x=1776947574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+j9Ne7osd79sCPFakjkyiz6R7TFYBWznjRj3B5Vnuc=;
        b=k4GYTMKddanm31s9ziRkkZL8GOBTW/mcVil6JvltIbRNFI95GSgu31371T69oPHRtQ
         IMlejH4sShJTl6ra3Shgz/W3kfp0d9tYvzB5BQEAo11dxae6I0afmbjNRnkU0CwOd1kQ
         temJwcZQ2s2rz7OsDT9VUTxLSBorI5vyuqYLgqf9hO2dhnj3OJMi70At1X87Y1BwWGV6
         lwmzPyTqEujkUpDuMZr2oVg+s7R7EXp8nd4Ak3GVbb1J5uApsRka2BD1+ZHAmJDPDMJC
         4Zgn8E9qYeFwhZoQlKi574HesgrQjuVsYS45gQBm/FMYc3ODoaEK246xUq7KD/Vik088
         QZnA==
X-Gm-Message-State: AOJu0Yyn+RrmGmYJgfAINu5nQdluEh9txCgiU5iDzwSuQCrtyoVyuR6X
	/ioq6LiorXB9Vve+kpfloM+DBF/P+z3dbcUgGpO3+rJ+eJsW0mAzcFJ/sq91kjZl58NQEc28avK
	Fe9zDEWICPmiNnFdsO4Z5sbb0tYBMpeuhkMaL6pXsFSLT2piT/aJwyIAF2I8yYu3GnOgD
X-Gm-Gg: AeBDieu6ogMV5U7A3RQDvShi9Qv1noPVec77p1qna0NHhFAS09RvfobEw3khhxispGw
	4gLgH8P1GrqMvdvnNut7XYBU/X2bCaTPCQ8JivumLHvXyo/z16GyM2ZtEyjcLs7ut7O2qE3vwvw
	IziMYSZlcOOnZT6YqQs1cWMvLs6IyVtI2wOdhmSicXY8RlFj1ynOwhen3gcoY9cU1hXf+VQQzxG
	26GVf/nQE8nvGWToCiOm8CqGnaTs5oXlwz6SEk/h7ywOzZlywVVBSnTQOgi4Oeoq5LQvMnoPhIx
	hLT/NvjA8N05/45Z0eRH0y8ZkI26W9jiAMiXPuPoNUjgQlvJuxx8AXf6vsekcsZZ2TOiRCZ1BId
	7fKJPt74H4gVGEDtBw8Y8qQzx8aJQp9HgPO55WUnHlQ5OKvL1Fw==
X-Received: by 2002:a17:903:98c:b0:2b4:5b1a:d09c with SMTP id d9443c01a7336-2b45b1ad1ddmr181277435ad.15.1776342773447;
        Thu, 16 Apr 2026 05:32:53 -0700 (PDT)
X-Received: by 2002:a17:903:98c:b0:2b4:5b1a:d09c with SMTP id d9443c01a7336-2b45b1ad1ddmr181277225ad.15.1776342772961;
        Thu, 16 Apr 2026 05:32:52 -0700 (PDT)
Received: from [10.219.49.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4782a93c7sm49156115ad.62.2026.04.16.05.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 05:32:52 -0700 (PDT)
Message-ID: <9963cee3-cd65-4583-b21e-0ac4eaca9bf2@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 18:02:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] pinctrl: qcom: lpass-lpi: Switch to PM clock
 framework for runtime PM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
References: <20260413122233.375945-1-ajay.nandam@oss.qualcomm.com>
 <20260413122233.375945-2-ajay.nandam@oss.qualcomm.com>
 <0975d136-0013-425b-a465-08f07efcefc7@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <0975d136-0013-425b-a465-08f07efcefc7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExOSBTYWx0ZWRfX5YmOqoVW8JH3
 kmjMfPnyfCsq9EQNyjJ4cdFYYfX9z729v3wx0VW15mSETR8rOoBWL1gLqBfEFEkO1juNoQG7Oyo
 HmJxx9Ag+moR7yE8oMddqZwtNFa31QnGqrQXsBKAKxlPGMob/HphwB4xtUCIiPrDaSCVmsVPZBk
 F++3i0xswmD5ebYuNXQotlsqCCFiwpLGJ6GfvprX9beW2PYykGEl7hZ3zN/Ndsu7bOZBBxz4nPR
 53KI5XEvkNyNqXbfWNdWvMBmHeEKraDrXenksZGlmK3M9VquZun7jqSdGtGehJYwRWlN7Zxy9uZ
 PllCZDtfD30Ex4gjAfGfPeWKxLSnUv9yoakMeTUgZkW0wnLjmDKUVAxWr6PtyyPSblhTsK/zqAD
 MWC3YoAsNZlnu3Wijm2GJQqJSDuDF2Zohuoi4NPTfMNORXrQdb3mGzL9VueVStOQAe+Kp19alxm
 s+as3ZC/fAxwgdXvt9w==
X-Authority-Analysis: v=2.4 cv=avuCzyZV c=1 sm=1 tr=0 ts=69e0d6f6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3rPMQvdw1QVwHz-kkGoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 2LBVg0bYJQXY6YY9nM03CTdoBUNFszIT
X-Proofpoint-ORIG-GUID: 2LBVg0bYJQXY6YY9nM03CTdoBUNFszIT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160119
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103408-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F3BD340E469
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/14/2026 2:07 PM, Konrad Dybcio wrote:
> On 4/13/26 2:22 PM, Ajay Kumar Nandam wrote:
>> Convert the LPASS LPI pinctrl driver to use the PM clock framework for
>> runtime power management.
>>
>> This allows the LPASS LPI pinctrl driver to drop clock votes when idle,
>> improves power efficiency on platforms using LPASS LPI island mode, and
>> aligns the driver with common runtime PM patterns used across Qualcomm
>> LPASS subsystems.
>>
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c      | 36 +++++++++++++------
>>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.h      |  2 ++
>>   .../pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c   |  5 +++
>>   3 files changed, 32 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> index 76aed3296..6d50e06ef 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> @@ -14,15 +14,16 @@
>>   
>>   #include <linux/pinctrl/pinconf-generic.h>
>>   #include <linux/pinctrl/pinconf.h>
>> +#include <linux/pm_runtime.h>
>>   #include <linux/pinctrl/pinmux.h>
>>   
>>   #include "../pinctrl-utils.h"
>>   
>>   #include "pinctrl-lpass-lpi.h"
>> +#include <linux/pm_clock.h>
> 
> Please move it up, together with other non-local includes
> 
> [...]

ACK, will correct in the next version

Thanks
Ajay Kumar Nandam

> 
>> +	pm_runtime_set_autosuspend_delay(dev, 100);
>> +	pm_runtime_use_autosuspend(dev);
>> +	pm_runtime_enable(dev);
> 
> devm_pm_runtime_enable() will let you drop the manual disablement below and
> in .remove()

ACK, will switch in the next version.

Thanks
Ajay Kumar Nandam

> 
>>   
>>   	pctrl->desc.pctlops = &lpi_gpio_pinctrl_ops;
>>   	pctrl->desc.pmxops = &lpi_gpio_pinmux_ops;
>> @@ -539,20 +540,33 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
>>   	return 0;
>>   
>>   err_pinctrl:
>> +	pm_runtime_disable(dev);
>>   	mutex_destroy(&pctrl->lock);
>> -	clk_bulk_disable_unprepare(MAX_LPI_NUM_CLKS, pctrl->clks);
>>   
>>   	return ret;
>>   }
> 
> [...]
> 
>> --- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>> @@ -139,10 +139,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>>   };
>>   MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
>>   
>> +static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
>> +	RUNTIME_PM_OPS(lpi_pinctrl_runtime_suspend, lpi_pinctrl_runtime_resume, NULL)
>> +};
>> +
>>   static struct platform_driver lpi_pinctrl_driver = {
>>   	.driver = {
>>   		   .name = "qcom-sc7280-lpass-lpi-pinctrl",
>>   		   .of_match_table = lpi_pinctrl_of_match,
>> +		   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
> 
> I believe SoCs other than kodiak also require this change to avoid
> regressions.

This patch is currently limited to SC7280, where the runtime PM behavior
has been validated.

Based on this feedback, I’ll revisit the series and extend the same
runtime PM support to the other LPASS‑LPI SoC drivers that share this
block, so the behavior remains consistent across platforms and avoids
potential regressions.

Thanks
Ajay Kumar Nandam



> 
> Konrad


