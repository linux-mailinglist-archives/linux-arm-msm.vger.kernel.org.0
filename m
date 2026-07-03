Return-Path: <linux-arm-msm+bounces-116252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qPY6Ged+R2ouZgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 11:20:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 467E17008F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 11:20:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LBwReXtB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=G1F8VE7t;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116252-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116252-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A6E87301477F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 09:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADE03B27C5;
	Fri,  3 Jul 2026 09:20:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470663B102F
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 09:20:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783070419; cv=none; b=N20U4cjv/9p99i7AIVLvQY8VUNcGJ5o7fKtNQuLw3d23KcB9Ssn/PaHU2qV17wlIGqKuP1wZt75fvvZeE4zu5Bf2azaY9gKErZ0xJ2K/Cl9fzn6KljX6pz64gYpLWSI57mM5jGEoZ02bZ9c9DLeFRMLQe4lYXD6/EiBU7LppJys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783070419; c=relaxed/simple;
	bh=SInzcmPHMyawTK6c/5nfvrH+VklBNXrN3daWxDv60fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kyBleMD0xbwCUsjEaGIQVGwL/wYvXNq0A0jrbrNCuPmtTUb7LOetjI0RpgIYuR0RwQTKhrNiweblgR51hv4FgSaV5Z9vmu6Xwixl0oz6F8AHiYHQQ0QbJnqsHBWAbjvq+01pSKyg57ZIvaYMmfpTx0jxSBggdcB9Sl/jkp9LnWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LBwReXtB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1F8VE7t; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637Zp7m3410199
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 09:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hQtmr+j8o6eeTBOLKctC/1KMmbnUFU7wJ0fv38TVJTE=; b=LBwReXtBR7ctHxYX
	BiAIamsMZpf6SEA0ETGaIQJdWEN4a3wCSWpB9x+QC7WWbOcA8xFJfdx8VkGfpBE9
	LR4+FyZFRX0WeRZQKoOiNYRZ4VPDBL+5yZz11KgWzrPYUn6JfJnHktDFzCkFGVjO
	SKpQmu2Wa/hv8s/6FDyaS1PYydTvgoBv/+ymkMZb8LMsmTqF1/ZFIYgeDHy7Yd8w
	lwzkeClh91u/L2oMDJqVnHlIxL8wAdzi6olt2WzoZnFgkbnSysQc8XVN3KhqWDtb
	9uAB5Bsmy1bYLkjjX8fOgU2PjDyykz2+XXBDMhjjq5kDz10CyX+PFAzr3ZnBfX3T
	u4jbPw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u30ckd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 09:20:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ca0481106cso5598825ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 02:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783070415; x=1783675215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hQtmr+j8o6eeTBOLKctC/1KMmbnUFU7wJ0fv38TVJTE=;
        b=G1F8VE7tzTO6Zj/I/dy7NajL/9V6PPchjESG9ZOnboigGt51Ia2Bvp7jHKnteonFaT
         0auBM8X/wJjLNLmbHWtYCDdILkTOZWksBSGE5fJE6YSnTk6H2Xb5lKLaeM56KpQp196N
         ikR6NLmoqaVl6fwYWkP99GZiurqBVkXnsDmlm66bE6tvglkKVunJX0X21mPQqBvRmSPJ
         OZn+0o2x6VqbvldnMTOUpFg67jGUjBH72MGz5MJ5hNwLMSo1OaLgSKgN15NSDBqZkeNS
         vQRc0P61ijLgJeMfTXZ2kD6xZrFUYa6qmQ0DOeTeTx85HhvPrxqm9aQGKV9IFMgQoEhj
         vWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783070415; x=1783675215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQtmr+j8o6eeTBOLKctC/1KMmbnUFU7wJ0fv38TVJTE=;
        b=onJQPuJQA8Z4cdh7wyH0DHTIuF13IPHOIHMgoDIcN/VBuTXsZVRFmFdvSeayVBUkIi
         hdradYeEAlKa0yNQpY4q7cyHxbTniTFWizxY2a79J3O5GRZPXeMoCqMOHxRDqUbAByOH
         tu7Ee2EtOA9/CYXEhEW1ltu4jYAiCEjMMbzacZMHlm3SEBrWALfP8kCXYEcEWV5lzL0A
         u5IIbms1x0VPImOnPWQtAD0BHR4+RUMsSTimxzfXUOeVWZUylaZ5d+dhM3x4wk/wYEnl
         zciE+Ziqd/95Ui7A77mDsA6XEiNxTTb/42HPdjAjXv3PtVq+amkyCIKUA6HQZmElmoUS
         qZGg==
X-Gm-Message-State: AOJu0YyF+B5L55WMQZ4zmpZsfIk2IzrI+fZL+O93ZiWvPT3fIXJpVAvr
	V+vrmEL7a0k+ihXmUwy6A66kaLxx3xMkPch+b8rPPxOIsCBpZ43G+2+bHf1f47s6JDvmmITbmup
	LiEIG/xGNmh9asUjrUZMSNWJ4jcL0xhveq4wGTX+NVNoF96jKp3hYoe6WvMxe//wNiKI0
X-Gm-Gg: AfdE7cknhS9sSLbjri2aoU6KzHXU7aOQrfGvU8e8F8IXg0wZ3p5bE5Chhs2qgXQ1HJs
	wlz9irLe9dMjw7TcvKNlIO/3sxl8Yf7vTWzPWoqF8as/Pkf0sZeqlo0QQaMtmMNf14K/orGK8EJ
	I1CDGpojX8wd6rddQNFbbXyrgNX4/kfQ/6C3ail2JadmYWcY/mdqHZ8doX2EixYHeIkhloKUv0y
	h4j/TPkV4KXF+ka/G1/EqRel8wWUc/SN2P4W4sc4n3eyj+QnC9blIhaR/ikXA09v1a+RgtIUncU
	3sWL/VzKKrIJYtkNGTgPnIq19ULw68a73ZP7lcIOMl1jfBFJUwBjTvQbZB9/n3zVv0ciHXsGWpf
	PrJZpas8c3GlOuzT1SOXYnWgFaxPyyqJu+2ZLQyt0
X-Received: by 2002:a17:902:d4c8:b0:2c9:bd3b:34f with SMTP id d9443c01a7336-2ca911f344fmr96592345ad.35.1783070414900;
        Fri, 03 Jul 2026 02:20:14 -0700 (PDT)
X-Received: by 2002:a17:902:d4c8:b0:2c9:bd3b:34f with SMTP id d9443c01a7336-2ca911f344fmr96591945ad.35.1783070414411;
        Fri, 03 Jul 2026 02:20:14 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b41c364d5sm12798365c88.14.2026.07.03.02.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 02:20:14 -0700 (PDT)
Message-ID: <8a538dd5-ab36-4826-929c-8ad16d652728@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 14:50:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] irqchip/qcom-pdc: Configure PDC to pass through
 mode
To: Thomas Gleixner <tglx@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-5-4d8e1504ea75@oss.qualcomm.com>
 <87echoqd7d.ffs@fw13>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <87echoqd7d.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aPmdx_JUdOguj5xQgd9FUYvNwd2I9hGh
X-Proofpoint-ORIG-GUID: aPmdx_JUdOguj5xQgd9FUYvNwd2I9hGh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4OCBTYWx0ZWRfX3PlSB/Qr4OCO
 WDJreHIKHgjIFm2B7SVgvmZl7teIOIVtfVEh2XQqhi8pf9NL6g0+udGAt0JayRGjRYvVf0NCeP5
 U8PhCGvSxvHQuRwXKnQde6dNnrby2dE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4OCBTYWx0ZWRfX4dAnNJQw2zgJ
 DmYrRgY68Tnz8ktGazOxlynsdOwzWrhKbcn2rsiqRuntve9Kr1dQ5EgW/pQGEsHyEBovRZ2i2RQ
 nd6j8aN+d+8JDznHUxp/Tli/JReFkTQKJcd4/RWpkRp4UsPz5u6ctXsERtPODdgchSDj7JP0/mI
 x1m/Z/KCq2LHFyQIm7EP1cSSkV7KPH4877a3Wq1pGU8BvIX52QOgdTMyzKbGZctVICfKwp851Dd
 cP4iIO++zoCMtQUuDXwPznYeuYWQGFDR02q6i4YBn+7CzDoTOq5PhJbEhoEb3S0KhpVdHo6YC/Z
 QQJqOq1vFANxL8Zsw2fS5MyyRbY28OBG6slW04oqNjyJ3bqGuuadE/bmhzDV84kWrhSnqtQwz00
 J2fAzMy1e1CTfrMf6o8GHAOl3xSGrUOq1qAVhhsFc1xNePa3aNMq1J+aRlQ2qxzeqTxJ/lq28Fv
 yXucsbCjeTdNeQi11+g==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a477ecf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=OtCtuEUk8598TF12AxYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116252-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 467E17008F7



On 6/30/2026 8:37 PM, Thomas Gleixner wrote:
> On Tue, Jun 16 2026 at 14:55, Maulik Shah wrote:
>> All PDC irqchip supports pass through mode in which both Direct SPIs and
> 
> All PDC variants support pass .. ??

Yes, It should be all PDC HW variants supports...I will update in v4.

> 
>> GPIO IRQs (as SPIs) are sent to GIC without latching at PDC.
>>
>> Newer PDCs (v3.0 onwards) also support additional secondary controller mode
>> where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
> 
> latches the GPIO interrupts and sends them to GIC as level type interrupts.

Sure, I will update in v4.

> 
>> still works same as pass through mode without latching at PDC even in
> 
> SPIs .. work the same as pass-through mode ....

Sure, I will update in v4.

> 
>> secondary controller mode.
>>
>> All the SoCs so far default uses pass through mode with the exception of
> 
> SoCs ... use pass-through 

Sure, I will update in v4.

> 
>> x1e. x1e PDC may be set to secondary controller mode for builds on CRD
>> boards whereas it may be set to pass through mode for IoT-EVK boards.
>> The mode configuration is done in firmware and initially shipped windows
>> firmware did not have SCM interface to read or modify the PDC mode.
>> Later only write access is opened up for non secure world.
> 
> .. for the non-secure ..
> 

Sure, I will update in v4.

>> +/**
>> + * qcom_pdc_gic_set_type: Configure PDC for the interrupt
>> + *
>> + * @d: the interrupt data
>> + * @type: the interrupt type
> 
> https://docs.kernel.org/process/maintainer-tip.html#struct-declarations-and-initializers
> 
> I'm sure I pointed you to that document before.

Yes, missed this place to follow. I will update in v4.

> 
>> + *
>> + * All @type are forwarded as Level type to parent GIC
>> + */
>> +static int qcom_pdc_gic_secondary_set_type(struct irq_data *d, unsigned int type)
>> +{
>> +	enum pdc_irq_config_bits pdc_type;
>> +	enum pdc_irq_config_bits old_pdc_type;
> 
> Chapter before the above ...

I will update in v4.

> 
>> @@ -449,8 +628,13 @@ static int pdc_setup_pin_mapping(struct device *dev, struct device_node *np)
>>  		if (ret)
>>  			return ret;
>>  
>> -		for (int i = 0; i < pdc->region[n].cnt; i++)
>> -			pdc->enable_intr(i + pdc->region[n].pin_base, 0);
>> +		for (int i = 0; i < pdc->region[n].cnt; i++) {
>> +			if (pdc_pin_is_gpio(i + pdc->region[n].pin_base) &&
>> +			    pdc->mode == PDC_SECONDARY_MODE)
>> +				pdc->clear_gpio(i + pdc->region[n].pin_base);
>> +
> 
> Requires guard(irqsave)(...)
> 

Yes, added in v4 within pdc->enable_intr().

Thanks,
Maulik

