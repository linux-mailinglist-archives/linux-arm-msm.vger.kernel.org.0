Return-Path: <linux-arm-msm+bounces-103456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNheAbBQ4Wl5rwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 23:12:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9138D414CE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 23:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7AE903020810
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 21:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9177C38C2D8;
	Thu, 16 Apr 2026 21:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ecrk59d5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KWwPnziY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCED235C197
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 21:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776373930; cv=none; b=TNv+K0x387wwRYdYQHysvoHGmxs/1VGkDrWXqRGGMk/0kW1kAsSjsuERLPeuzOwH1B7D+9TQkohmDslIh8RAYIy72g4XXzVgB/OxH7zqHDuwM4cDNZoAShKI6FWA/Kr5TvAOsRI+9L692F/m9E6PyqOUq1kOOJ6n5h2I0Ntx4gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776373930; c=relaxed/simple;
	bh=FJkUwqRHEeG+aLXauJFYxp+UWM/0dmyCImU8tbjawAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kw1nHbAdh12KzE+V7y0IMd+wVJ6OXZnf0aizBCbRpF/MR2IvmMu8jXtXgs7y7GT1EOHl6ntKZzqeJQLzBTeMf0eSt9X2e0Z2RNu1IjvBdIRWCkSqfkQrXiYe7R/XAG83ZQsM+i6NSmSKofbOI9NVRzi8KBGqsyaP/hSvwaQIwIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ecrk59d5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KWwPnziY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GIPhsU1668258
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 21:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZQrUO1RbQ+KeXUWWqT0bDLIHCPNave+6l+mFpjuOTDg=; b=ecrk59d5vOyJkoss
	g7Ven1mL+JLFnaZFaMbbbWZz1588e6ZXGW91168mUd7KtT9fdwP+/1/r+EQVjSRv
	dL568nd7eCokykiU5WQj2qf+3rJrFLqDVc0AN2cKk6JqVUGAuDmPH2KbcdfhNIT0
	kmRJE8sYnSqcWSvbjtXdcuP8ZLOscwTm5PSwIMYY7jLIxIb+Di/x0AeeIrlZ9G7U
	X//k9bzoQWwkI6ctALrFFx4y4kCcNYY/6DVOVSvrUoFWnu8d0f/nw8R3YUUWTUwQ
	4fETo91qNF9NB/2bFeCziVcUC5T23znIOsKE2NIZAss0FjKp6mb/iRI9acEtB+Fn
	mRzoqQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtd936w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 21:12:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b34223670so1772411cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 14:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776373927; x=1776978727; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZQrUO1RbQ+KeXUWWqT0bDLIHCPNave+6l+mFpjuOTDg=;
        b=KWwPnziYcVMk01SLUA89y87bgsFOuodojZ2yiv0xTUIIy41UNO6cRxS1bIz7W+rt1p
         MflM6v2vj31wr02jNcusjWLOzgmcVOWA+cp+iWf/iI/I9Wd3RFeRGU9qft+Bg+qjVutx
         6aoGGcjgxsTyb4+aID744CZheRh2ZAtAnTbhXaFQGPCUFBTvWduDW0QHuXdsDeIegmCP
         S19e/HSrMLm/y85EEjWKJszsmg9PRtHpfMHET12EWYJv1zGcqh87LE3aGXL74hUXeuUj
         r2XLtaQ5bV0iVAmm3KrAh1SwDfe5K+O9FGaisphZp1/NoelcSDWHFvClxOytK8pUC35w
         ea8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776373927; x=1776978727;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQrUO1RbQ+KeXUWWqT0bDLIHCPNave+6l+mFpjuOTDg=;
        b=tQ9GOq8LdcitrZ/3D7RHz5X5yNvQVK2SWXxPicAYh8JM8z3yjq2GDrpBRD2ZXhgl5Y
         ns19xd/Ou5UdlLls1FznLh1uK/ztfGxN3+JPsAqyew0wg7omC7Aez8BErYT3MYcaxoqk
         lGf3lrjNHPllqco3ke7Zbp+r7Ayrv49TXag7RdWlCidAJfMJTg+58T98l8zT+HShVEBP
         VXXjB1M4JG0kbuAPXFqOtJfDHAp9EecjqWsBWEEmmzZ30unMXupdCneK9GB25gtOzAXI
         bu9ckkeyCLh+CjAsleUDHOjBkdR9FUskwEAhWYZ0Zbg/I8z2UpPqn1GoFaQREvBBef1d
         8B+g==
X-Forwarded-Encrypted: i=1; AFNElJ/+FM0tBrEQtuzH301Ssb9mH6Go2/IFAeYkeog+uRWjlNtrGcpW51gOn6NeH9egIP0qg4dUTvGJ97ggYP6A@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd9SHoDQZiTzcJ0svJyFT69LiLhRsfP2l9g5eDULcEFG01IOKh
	tW6tDmIDC5l8K6OqN959xF+CuTekTg83xaYsJtEceByYHFFn0P6jaBX+tyUpfC0x+ShoBDkia7e
	k+nokRvT5k/YeX20Oyg3Y7qv7Ed0SP9yISh3a4PvC19lxvvbiozQh/2CVFMUsax+S4h+i
X-Gm-Gg: AeBDiet9Rui9tBVKb4vRVqtB+1PLmQEOKJ432ys+7wv4CXSQ3xqKWfCs6Sgf0RKhxwe
	dKkq68KQgo5OSHMfihemqh7usN5fKsj0eYKiuafI4a46/ngPizBpgLrG760LEB2ZafUo8y58xje
	CLH4EUsCVaqvdtew5jVLqCml19Od/Qr+e87nc/QqCxlt4V9p5CsZpvwcU7N7nYeE+Z3ELl6xiby
	0e6mrVskc6WqDD+zcKU0h0F41ozQ5438lGUi16XfC0X0kFqEgC5oIj86q6q6/SG/sVvJ/8iHEUT
	eiW87lc+TXfcOQR7tmQEgnN9RQ1NFpkHfHaRYG7mDwFYF7xpn22Y0qBQVENDc2aiLYS8VgnuOA8
	E90LqCh3NbMHazvcM/vWqVcAZOxpT8eoMNYMMwy05o5zMkIBjzlS0W5J0gsontGAOvLq05xsTvb
	5lPddJ0liRH9C1NYhTjFY=
X-Received: by 2002:a05:622a:5a13:b0:50d:ea46:7eb3 with SMTP id d75a77b69052e-50e36b640d9mr644421cf.26.1776373927095;
        Thu, 16 Apr 2026 14:12:07 -0700 (PDT)
X-Received: by 2002:a05:622a:5a13:b0:50d:ea46:7eb3 with SMTP id d75a77b69052e-50e36b640d9mr643881cf.26.1776373926621;
        Thu, 16 Apr 2026 14:12:06 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:cf08:980b:ccbc:54fd? ([2a05:6e02:1041:c10:cf08:980b:ccbc:54fd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead35c026sm16472441f8f.15.2026.04.16.14.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 14:12:05 -0700 (PDT)
Message-ID: <f46ef4af-1c05-4473-9226-901d3393ea89@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 23:12:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 4/4] thermal: qcom: add support for PMIC5 Gen3 ADC
 thermal monitoring
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org, lumag@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org,
        daniel.lezcano@linaro.org, sboyd@kernel.org, amitk@kernel.org,
        thara.gopinath@gmail.com, lee@kernel.org, rafael@kernel.org,
        subbaraman.narayanamurthy@oss.qualcomm.com,
        david.collins@oss.qualcomm.com, anjelique.melendez@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com, rui.zhang@intel.com,
        lukasz.luba@arm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        cros-qcom-dts-watchers@chromium.org, quic_kotarake@quicinc.com,
        neil.armstrong@linaro.org, stephan.gerhold@linaro.org
References: <20260130115421.2197892-1-jishnu.prakash@oss.qualcomm.com>
 <20260130115421.2197892-5-jishnu.prakash@oss.qualcomm.com>
 <addDTiI8MB2b_AzJ@mai.linaro.org>
 <12d683aa-44c2-4e2d-8459-78ba9f2ab61e@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <12d683aa-44c2-4e2d-8459-78ba9f2ab61e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDIwMCBTYWx0ZWRfX/25ZDV5fbzOG
 qaoFTphkiFi+VLXpEEvIEZwcM2yedCfPD+WvCNnuVAU2zjZiROgWJB0tSEpT8nqJh+t8FzV7o1T
 kolCCt9+52YZ5pdPe9BgddbsWVZCC5nnX1XhB/LHs3ASa1aR6OBdfjAwsJtHrAiNATU+03lWb1/
 gRDDQOtATQCwtfF9/Y+PxSTXjOzwIK7pygHP51cAObq7Dh7Jow6ENY22DEXJEgGb9GvD8uREL+B
 Dhd2KM373rDJULnPumsYT9AvDdrrE4fHsm1KsQUPXIhd45LAohWiQuuCISq53eulhA+iRZkMOPV
 xSub2yIoE5/jKQwkWM3Rd58T5jKPQ5P/FI1+41jdZytIgS6IAfSC6qyns+RLYOXN11sHa9dkHue
 tdDYlRx3BcGVdbhKDNAFXhM2dEXSKeanWOGXl7Gyp07X8dbyzeQzfeS8e3ppTYSiI8vEAgaifZu
 c4rstTMrSB2V/vLETLg==
X-Authority-Analysis: v=2.4 cv=avuCzyZV c=1 sm=1 tr=0 ts=69e150a7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=JbLAaTClA-xbCA27GrMA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: iS6JDw4EwmZGrvtI6a4e1wOAuY3KRIjf
X-Proofpoint-ORIG-GUID: iS6JDw4EwmZGrvtI6a4e1wOAuY3KRIjf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160200
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linaro.org,gmail.com,intel.com,arm.com,vger.kernel.org,chromium.org,quicinc.com];
	TAGGED_FROM(0.00)[bounces-103456-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9138D414CE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/16/26 10:05, Jishnu Prakash wrote:
> Hi Daniel,
> 
> On 4/9/2026 11:42 AM, Daniel Lezcano wrote:
>> On Fri, Jan 30, 2026 at 05:24:21PM +0530, Jishnu Prakash wrote:
>>> Add support for ADC_TM part of PMIC5 Gen3.
>>>
>>> This is an auxiliary driver under the Gen3 ADC driver, which implements the
>>> threshold setting and interrupt generating functionalities of QCOM ADC_TM
>>> drivers, used to support thermal trip points.
>>>
>>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 
> ...
> 
>>> +
>>> +static irqreturn_t adctm5_gen3_isr(int irq, void *dev_id)
>>> +{
>>> +	struct adc_tm5_gen3_chip *adc_tm5 = dev_id;
>>> +	int ret, sdam_num;
>>> +	u8 tm_status[2];
>>> +	u8 status, val;
>>> +
>>> +	sdam_num = get_sdam_from_irq(adc_tm5, irq);
>>> +	if (sdam_num < 0) {
>>> +		dev_err(adc_tm5->dev, "adc irq %d not associated with an sdam\n",
>>> +			irq);
>>> +		return IRQ_HANDLED;
>>> +	}
>>> +
>>> +	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_num, ADC5_GEN3_STATUS1,
>>> +			     &status, sizeof(status));
>>> +	if (ret) {
>>> +		dev_err(adc_tm5->dev, "adc read status1 failed with %d\n", ret);
>>> +		return IRQ_HANDLED;
>>> +	}
>>> +
>>> +	if (status & ADC5_GEN3_STATUS1_CONV_FAULT) {
>>> +		dev_err_ratelimited(adc_tm5->dev,
>>> +				    "Unexpected conversion fault, status:%#x\n",
>>> +				    status);
>>> +		val = ADC5_GEN3_CONV_ERR_CLR_REQ;
>>> +		adc5_gen3_status_clear(adc_tm5->dev_data, sdam_num,
>>> +				       ADC5_GEN3_CONV_ERR_CLR, &val, 1);
>>> +		return IRQ_HANDLED;
>>> +	}
>>> +
>>> +	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_num, ADC5_GEN3_TM_HIGH_STS,
>>> +			     tm_status, sizeof(tm_status));
>>> +	if (ret) {
>>> +		dev_err(adc_tm5->dev, "adc read TM status failed with %d\n", ret);
>>> +		return IRQ_HANDLED;
>>> +	}
>>> +
>>> +	if (tm_status[0] || tm_status[1])
>>> +		schedule_work(&adc_tm5->tm_handler_work);
>>> +
>>> +	dev_dbg(adc_tm5->dev, "Interrupt status:%#x, high:%#x, low:%#x\n",
>>> +		status, tm_status[0], tm_status[1]);
>>> +
>>> +	return IRQ_HANDLED;
>>
>> This ISR routine should be revisited:
>>
>>   - no error message inside
> 
> I'll drop all the error messages, but does that also include the debug print at the end?
> In addition, the print for conversion fault is ratelimited and may be useful as it
> indicates a possible HW issue, can I keep that?

It is not a good practice to put an error message in the ISR. If the 
conversion fails, then the thread blocked on the read will timeout and 
then show a message.

>>   - use a shared interrupt to split what is handled by the ADC and the
>>      TM drivers
> 
> I'll make the required updates in the main ADC driver and this driver to share the first
> SDAM's interrupt.
> 
>>
>>   - do not return IRQ_HANDLED in case of error (cf. irqreturn.h doc)
>>
> 
> I'll replace IRQ_HANDLED with IRQ_NONE at places where errors are returned.
> But in the case of conversion fault, I think returning IRQ_HANDLED may be
> more appropriate because we do handle it by clearing the status, to
> allow subsequent conversion requests to be sent.
> 
> What do you think, is this fine?

It is a good point.

Actually, if get_sdam_from_irq() or adc5_gen3_read() fail, they will 
return without clearing the interrupt flag, so we should potentially end 
up in an infinite loop.

So the status should be cleared at the end with IRQ_HANDLED. IRQ_NONE 
returned if it is for another subsystem.

If you think there can be a significant number of errors in the handler 
may be you should add statistics but later in an additional series if it 
makes sense.

[ ... ]

>>> +	adc_tm5 = prop->chip;
>>> +
>>> +	if (prop->last_temp_set) {
>>> +		pr_debug("last_temp: %d\n", prop->last_temp);
>>> +		prop->last_temp_set = false;
>>> +		*temp = prop->last_temp;
>>> +		return 0;
>>> +	}
>>
>> Why do you need to do that?
>>
>> The temperature should reflect the current situation even if the
>> reading was triggered by a thermal trip violation.
>>
> 
> This logic is needed to handle a corner case issue we have seen earlier.
> In this case, the ADC_TM threshold violation interrupt gets triggered ,
> but when get_temp() is subsequently called by the thermal framework, the
> temperature has fluctuated and the value read now lies within the thresholds,
> so the thresholds do not get updated by the thermal framework and the violation
> interrupts get repeated several times, until there is a get_temp() call
> which returns a temperature outside the threshold range.

Oh, that's clearly an issue with the thermal framework, not the driver.

> In order to avoid this issue, when the interrupt handler runs, we find the actual
> temperature read in ADC_TM that led to threshold violation by reading the ADC_TM
> data registers and we cache it and return it when get_temp() is called in the flow
> of thermal_zone_device_update(). Any subsequent calls to get_temp() would
> return the actual channel temperature at the time.
> 
> This is only done to avoid delaying thermal mitigation due to temperature
> fluctuations. Do you think this needs to be changed?

I think it is an interesting problem certainly impacting all thermal 
sensors. It should be fixed in the thermal framework itself if possible. 
Just drop this portion of code and let's handle that correctly in the 
thermal framework.

[ ... ]

>>> +	dev_dbg(adc_tm5->dev, "channel:%s, low_temp(mdegC):%d, high_temp(mdegC):%d\n",
>>> +		prop->common_props.label, low_temp, high_temp);
>>> +
>>> +	guard(adc5_gen3)(adc_tm5);
>>> +	if (high_temp == INT_MAX && low_temp == -INT_MAX)
>>> +		return adc_tm5_gen3_disable_channel(prop);
>>
>> Why disable the channel instead of returning an errno ?
>>
> 
> This is the convention we follow in our existing ADC_TM driver at
> drivers/thermal/qcom/qcom-spmi-adc-tm5.c. If both upper and lower
> thresholds are meant to be disabled, we disable the channel fully
> in HW to save some power and it can be enabled later if this API
> is called for it with valid thresholds.
> 
> Is it considered invalid in the thermal framework to try to disable
> both thresholds? Should I both disable the channel and return some
> error from here?

Well, if the channel is disabled, then the temperature sensor of the 
thermal zone is disabled, consequently the thermal zone is disabled from 
a HW POV but enabled from the kernel POV.

Why not add the 'change_mode' ops and then disable the thermal zone (+ 
pm_runtime) ?

[ ... ]

>>> +	/*
>>> +	 * Skipping first SDAM IRQ as it is requested in parent driver.
>>> +	 * If there is a TM violation on that IRQ, the parent driver calls
>>> +	 * the notifier (adctm_event_handler) exposed from this driver to handle it.
>>> +	 */
>>> +	for (i = 1; i < adc_tm5->dev_data->num_sdams; i++) {
>>> +		ret = devm_request_threaded_irq(dev,
>>> +						adc_tm5->dev_data->base[i].irq,
>>> +						NULL, adctm5_gen3_isr, IRQF_ONESHOT,
>>> +						adc_tm5->dev_data->base[i].irq_name,
>>> +						adc_tm5);
>>
>> The threaded interrupts set the isr in a thread and from the thread
>> handling the event, there is a work queue scheduled. Why not use the
>> top and bottom halves of the threaded interrupt ? Hopefully you should
>> be able to remove the lock.
> 
> Yes, I can use the top and bottom halves of the threaded interrupt as you
> suggested. But what exactly do you mean by removing the lock?
> 
> If you meant the mutex lock used in this driver, we cannot remove that.
> This is because the ADC_TM driver needs to write into several registers
> shared with the main ADC driver for setting new thresholds, so we
> have to share a mutex between the drivers to prevent concurrency issues.

When using a workqueue tampering with registers while an interrupt 
handler is doing the same, the lock is needed.

But if the workqueue is replaced by threaded interrupt, the lock *may* 
not be needed because the design may prevent race conditions.

That may be not true in this case, I did not investigate deeper in the 
code to figure it out. Let's see the next version

> I'll address all your other comments too in the next version of this patch.

Thanks

   -- Daniel



