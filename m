Return-Path: <linux-arm-msm+bounces-106046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KELOAyam+mm7QwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 04:23:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 608CE4D5A38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 04:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 233ED3032672
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 02:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0144E299931;
	Wed,  6 May 2026 02:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LNjvoxPF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fO4OcAC7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358482848A8
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 02:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778034184; cv=none; b=lbWXhSBUJ5YpVPX5XrZWzDg67GUqI0TR8bkawEWctFAn427PkkPpxOltKpBYYQVzv1i9pa4WwPVeM8qhZp4O1B7y2naJM1nlcUn+dD/0edrQlPq9b+4yHQJ3rj/qfwZEDbrI4qFFhwrUuoFuBNR89+Fly9WQVNhlg7lD4FEWa00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778034184; c=relaxed/simple;
	bh=bfAA/IYvcibhOQS614NPGEz53CX+MrHJUMuEN9noih0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eDDgO7Gmo54pLS7bb9vG24u6eAf2kj6ds7tSPqIPXz+LTCRE6bi9xNWwc7wJO4F5N5cioa1qlEu4NSQvCbP61V++1UzuxkUaSyFcBiqSAEyNDzLlvPn7ifV8D5A7c5MkcQUnmIJGfZO2k8QSl1OurigQ6bDKbIsqX2cYoarpjZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LNjvoxPF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fO4OcAC7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6460e7uT2446153
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 02:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OV3Qj8GhGhQEqya7HaO2NtX34E4ygEIKaVpqk/TFWfY=; b=LNjvoxPFNe6qtzLQ
	V58ADN4PDOk13DqWL5bottw3Dg2/WDZpjTG8au/aGvhqLvZb5k2RdXoQonH8TaZH
	Z4rCAuVcAesx8Jta9nJXxBZyIwpqGBZ/7s7LROy9nerzhKPGVtX0TlC790zC4rmx
	bbtQ8i/OoJJD5mAI6jv4Zytg+M39MEfBWjd3V3RO/ctGZiThwvPaYXAzdC6lUCZ4
	jplDqTzFR13WXKfwvALbu9urXdsNCZ2//3+jFz6WvkREsFxpvDIMKkOfTl039p2L
	Qi6b3W1LETQhduGPavkiEpix9ctInicR0e3CcUgTulO4mcLOUV5m5rYyE8Foa1sW
	OgTjtA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dykmht42f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 02:23:00 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso5992861eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 19:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778034180; x=1778638980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OV3Qj8GhGhQEqya7HaO2NtX34E4ygEIKaVpqk/TFWfY=;
        b=fO4OcAC7VPgjOCtNziJorVtrPuSa2J8g/Hja1Cl6W1LEiKDZrgIjB4d8DHlZ+z/WRA
         wgkgxY4umTlWnp7mHWSpyY5Ox938ob7eK2Mi9WhcstvP73xYwAcXaaZCSC1zWOBbtbiI
         lP+LrJTC/7208JKhaA1Hd+FHGPyVMggpE2j+UaFBmLDU48x54qXcT3/4fOEw91EeMT+A
         cEptTckKl+/SMoVgTuumP7gOfiqLPgJDEVpwzKDUZHnZE7qKocqj6sKcN0dDotUKfXdQ
         rY5Nf0NT6C6ISBQARC+GRxFSqxYnzrhhPeNt64HP0tHteiElM9l+CnoWB/0mXkBN+vpE
         OG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778034180; x=1778638980;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OV3Qj8GhGhQEqya7HaO2NtX34E4ygEIKaVpqk/TFWfY=;
        b=YAZM8kGn3T4FP3Q5sIk+Ok0kNufuZF7HKIfyTG6xxxTd9LGxifneXRxQpEd3+pMIfg
         fkhXlwDuCCfmu01+bnK1TfxI6fjctw7CiJ7qhJNykzSGgotcbG3o0BjgVQQ0JxK4sGOn
         FnDS5smQJRDywNm/5m+tIRVXeSq+sz+h0RQLqJYbvCtcgXIu95a89mXNIq62p+sGi79o
         7u36wwzpmEN/1IeJYRJ7p7bodtFKdWNpXN9mgjKKCQk39L6VESbg6oqlBhBj5ttoL27v
         0R89XVY+bcJq931CbSXLZ/k+hueyR2EAcCIlWfkD/3h0UyGyqH3OC92DJKU/SIY8+huI
         l7XA==
X-Forwarded-Encrypted: i=1; AFNElJ/7Rl5x0xI/+p+mgKR86ZU15QMXjOCBO1urGi0JfXSIxfrjjfwMTdmSeAYKhpZ0CXqPergzx4EXdFVaj5oO@vger.kernel.org
X-Gm-Message-State: AOJu0YzvSYJ5eM9fIjDR0vyUusRJM2gwNQQfvw5AylcHWs+rG3E8T9Lw
	dRCBOACDz9sn3ZBGCtf9pPDWqbBixqfSw1KF79jAntzeRQav0ksZdSdc2yf2MXARvEJk5QvpH4T
	Y+ypLRRBnsaZM1rxStLTKCr+fmil3DYbjjxzkhbmAjDDV1GiqE2EAnLhyM9KSHLVVeK5U
X-Gm-Gg: AeBDietNfPAaeIjmJnSDD5zW/lVNNWi8Hs0tnwyykxfVDJwpK/gA1oSVnVn1Kad/N1r
	yyVQL4o37TywV91LA9ia7EcihAg6wsJ4AoYX4QVhkdcdiV90HWlggwFgcZ0eG55utR/6StDpiq+
	lwUGUcz/HTCu10mUJ9JGlU80m++GOtvHVFI08PTMmQDtEnUQogRzB5ZJJwp6U1VO1hYIsXH9iye
	mZs0exOWXJhjezk/D27l2NzIs3sYRE7VN2yOJDWOgnLAljspiPeydDGClwYzFdiLeb06YJ6AYgA
	Ng39Bw88mO3X0RV1KkmfF1kD7oRURTbuENWRityPea3n/y0Cux6Mu4UZXRxxClCntN/i3X187Ui
	Fp8z8xP+totjqON4mnvx74uoV0YrzNR/2O7TOI6N6wS46Yc77OWN/VA3L4R/2Y56XjBVBvy4AiA
	ACUUsLbJjdZh/Pb6dFocgAD38Z
X-Received: by 2002:a05:7300:dc14:b0:2da:2ec2:64fe with SMTP id 5a478bee46e88-2f55034e591mr766927eec.24.1778034179790;
        Tue, 05 May 2026 19:22:59 -0700 (PDT)
X-Received: by 2002:a05:7300:dc14:b0:2da:2ec2:64fe with SMTP id 5a478bee46e88-2f55034e591mr766911eec.24.1778034179168;
        Tue, 05 May 2026 19:22:59 -0700 (PDT)
Received: from [192.168.1.2] ([122.177.244.255])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56cec58efsm1474615eec.2.2026.05.05.19.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 19:22:58 -0700 (PDT)
Message-ID: <53d75016-90a6-40e9-b6e9-a8fa35be8d2a@oss.qualcomm.com>
Date: Wed, 6 May 2026 07:52:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: dwc3: qcom: Modify interrupt handling for eUSB2
 Phy targets
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260505194242.1947891-1-krishna.kurapati@oss.qualcomm.com>
 <afpu6eF9lDy4KfTN@vbox>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <afpu6eF9lDy4KfTN@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X6Zi7mTe c=1 sm=1 tr=0 ts=69faa604 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=gcxQrtMV3QalbYpGlDk62A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IwQKT_gaWyQLzjA38ZYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: zmiligpjSPgT-jxYRsJYsGPQ6RtojR2y
X-Proofpoint-GUID: zmiligpjSPgT-jxYRsJYsGPQ6RtojR2y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDAyMCBTYWx0ZWRfXwBdWr+zGPmDV
 qUITHpa2zUQnsExgIhcgpyK5kPmKAmrkdeC+MjWV/w/ZcWjCtDOenGblQ9mf84MUJFp+jv0CL8P
 HVJL1neNGz1ZZap2dQkPwQwdO0zMDl6AN6N12TTVpA6n7wrxRmLpM3W7RberTfjbNL/kCBoGk7z
 sTZjPkiP6qyf2gVTACFYHsdV3ckoywpc9INJPv82BplSw7vcbKUPl+qkqDM4Ec4VRiKnGxyMUKW
 5IYfdDSmR4ZBwDicYqGnT8635jarf4ceuMQ4/fPRn9QIyry7Tuwgr8PPHqk/ztSxFLb5oDK8la4
 rZ9jSjRQj2sp+iWjf73nqVZkgiCqz25ZzOHarUizCxJ8KIOzkcNiJUDVVrIxnYY9/y9Y5ASS0A3
 0ivp9tpA1WsEPIfQexPRzksU3QbpDHLNOi8W2aLenX+YaPyqCqDZWqoNXv0/TWREUWQLAy+Zer9
 t/w7MikUpohGH6MY67w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060020
X-Rspamd-Queue-Id: 608CE4D5A38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106046-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[urldefense.com:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REDIRECTOR_URL(0.00)[urldefense.com];
	RCVD_COUNT_SEVEN(0.00)[7]



On 5/6/2026 4:09 AM, Thinh Nguyen wrote:
> On Wed, May 06, 2026, Krishna Kurapati wrote:
>> eUSB2 targets handle wakeup interrupts differently depending on device
>> speed when operating in host mode.
>>
>> According to the eUSB2 specification, remote wakeup signaling in host
>> mode is detected via different data-line assertions based on the
>> connected device speed.
>>
>> When a low-speed device is connected, the host repeater drives eD+ to
>> logic '1' upon detecting a K-state on the USB lines during remote wakeup
>> (eUSB2 specification, Section 5.5.14).
>>
>> When a full-speed or high-speed device is connected, the host repeater
>> drives eD- to logic '1' upon detecting a K-state on the USB line during
>> remote wakeup (eUSB2 specification, Sections 5.5.15 and 5.5.18).
>>
>> Since the eUSB2 PHY's "DP" and "DM" interrupt lines monitor the eD+ and
>> eD- line states, configure the wakeup interrupts accordingly
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Updated commit message
>> - added supported eUSB2 targets
>>
>> Link to v1:
>> https://urldefense.com/v3/__https://lore.kernel.org/all/20260502095616.666938-1-krishna.kurapati@oss.qualcomm.com/__;!!A4F2R9G_pg!eraeWXDT_mjR2i_3v-c7MelUNh1b4K59jTy1pNFh-YWpd9JQ3tUBDOC5L8JVTnPN7U_dLDtRB_qUKyyhoqjeEdZmipvmFXs1TO_61w$
>>
>> This patch was tested on Glymur.
>>
>>   drivers/usb/dwc3/dwc3-qcom.c | 99 ++++++++++++++++++++++++++++++++----
>>   1 file changed, 90 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index f43f73ac36ff..4fc0017c697c 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -60,6 +60,10 @@ static const u32 pwr_evnt_irq_stat_reg[DWC3_QCOM_MAX_PORTS] = {
>>   	0x238,
>>   };
>>   
>> +struct dwc3_qcom_platform_data {
>> +	bool			uses_eusb2_phy;
>> +};
>> +
>>   struct dwc3_qcom_port {
>>   	int			qusb2_phy_irq;
>>   	int			dp_hs_phy_irq;
>> @@ -85,6 +89,7 @@ struct dwc3_qcom {
>>   	struct icc_path		*icc_path_apps;
>>   
>>   	enum usb_role		current_role;
>> +	bool			uses_eusb2_phy;
>>   };
>>   
>>   #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
>> @@ -272,15 +277,21 @@ static void dwc3_qcom_disable_wakeup_irq(int irq)
>>   	disable_irq_nosync(irq);
>>   }
>>   
>> -static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom_port *port)
>> +static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom *qcom, int i)
>>   {
> 
> We should rename i to port_index or something more descriptive.

ACK.

> 
>> +	struct dwc3_qcom_port *port = &qcom->ports[i];
>> +
>>   	dwc3_qcom_disable_wakeup_irq(port->qusb2_phy_irq);
>>   
>>   	if (port->usb2_speed == USB_SPEED_LOW) {
>> -		dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
>> +		dwc3_qcom_disable_wakeup_irq(qcom->uses_eusb2_phy ?
>> +					     port->dp_hs_phy_irq :
>> +					     port->dm_hs_phy_irq);
>>   	} else if ((port->usb2_speed == USB_SPEED_HIGH) ||
>>   			(port->usb2_speed == USB_SPEED_FULL)) {
>> -		dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
>> +		dwc3_qcom_disable_wakeup_irq(qcom->uses_eusb2_phy ?
>> +					     port->dm_hs_phy_irq :
>> +					     port->dp_hs_phy_irq);
>>   	} else {
>>   		dwc3_qcom_disable_wakeup_irq(port->dp_hs_phy_irq);
>>   		dwc3_qcom_disable_wakeup_irq(port->dm_hs_phy_irq);
>> @@ -289,8 +300,10 @@ static void dwc3_qcom_disable_port_interrupts(struct dwc3_qcom_port *port)
>>   	dwc3_qcom_disable_wakeup_irq(port->ss_phy_irq);
>>   }
>>   
>> -static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom_port *port)
>> +static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom *qcom, int i)
>>   {
>> +	struct dwc3_qcom_port *port = &qcom->ports[i];
>> +
>>   	dwc3_qcom_enable_wakeup_irq(port->qusb2_phy_irq, 0);
>>   
>>   	/*
>> @@ -303,11 +316,19 @@ static void dwc3_qcom_enable_port_interrupts(struct dwc3_qcom_port *port)
>>   	 */
>>   
>>   	if (port->usb2_speed == USB_SPEED_LOW) {
>> -		dwc3_qcom_enable_wakeup_irq(port->dm_hs_phy_irq,
>> +		dwc3_qcom_enable_wakeup_irq(qcom->uses_eusb2_phy ?
>> +					    port->dp_hs_phy_irq :
>> +					    port->dm_hs_phy_irq,
>> +					    qcom->uses_eusb2_phy ?
>> +					    IRQ_TYPE_EDGE_RISING :
>>   					    IRQ_TYPE_EDGE_FALLING);
>>   	} else if ((port->usb2_speed == USB_SPEED_HIGH) ||
>>   			(port->usb2_speed == USB_SPEED_FULL)) {
>> -		dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
>> +		dwc3_qcom_enable_wakeup_irq(qcom->uses_eusb2_phy ?
>> +					    port->dm_hs_phy_irq :
>> +					    port->dp_hs_phy_irq,
>> +					    qcom->uses_eusb2_phy ?
>> +					    IRQ_TYPE_EDGE_RISING :
>>   					    IRQ_TYPE_EDGE_FALLING);
> 
> I would just use if-else and some local variable here instead of the
> ternary operator for better readability.
> 

ACK. Will do it for both the enable and disable calls.

>>   	} else {
>>   		dwc3_qcom_enable_wakeup_irq(port->dp_hs_phy_irq,
>> @@ -324,7 +345,7 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>>   	int i;
>>   
>>   	for (i = 0; i < qcom->num_ports; i++)
>> -		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
>> +		dwc3_qcom_disable_port_interrupts(qcom, i);
>>   }
>>   
>>   static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>> @@ -332,7 +353,7 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>>   	int i;
>>   
>>   	for (i = 0; i < qcom->num_ports; i++)
>> -		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
>> +		dwc3_qcom_enable_port_interrupts(qcom, i);
>>   }
>>   
>>   static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>> @@ -609,6 +630,7 @@ struct dwc3_glue_ops dwc3_qcom_glue_ops = {
>>   
>>   static int dwc3_qcom_probe(struct platform_device *pdev)
>>   {
>> +	const struct dwc3_qcom_platform_data *pdata;
>>   	struct dwc3_probe_data	probe_data = {};
>>   	struct device		*dev = &pdev->dev;
>>   	struct dwc3_qcom	*qcom;
>> @@ -624,6 +646,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>   
>>   	qcom->dev = &pdev->dev;
>>   
>> +	pdata = device_get_match_data(dev);
>> +	if (pdata)
>> +		qcom->uses_eusb2_phy = pdata->uses_eusb2_phy;
>> +
>>   	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
>>   	if (IS_ERR(qcom->resets)) {
>>   		return dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
>> @@ -838,8 +864,63 @@ static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
>>   	.prepare = pm_sleep_ptr(dwc3_qcom_prepare),
>>   };
>>   
>> +static const struct dwc3_qcom_platform_data dwc3_qcom_pdata = {
>> +	.uses_eusb2_phy = false,
>> +};
> 
> Do we need this pdata for non-eUSB2 targets?
> 
>> +
>> +static const struct dwc3_qcom_platform_data dwc3_qcom_glymur_pdata = {
>> +	.uses_eusb2_phy = true,
>> +};
>> +
>>   static const struct of_device_id dwc3_qcom_of_match[] = {
>> -	{ .compatible = "qcom,snps-dwc3" },
>> +	{
>> +		.compatible = "qcom,snps-dwc3",
>> +		.data = &dwc3_qcom_pdata,
>> +	},
>> +	{
>> +		.compatible = "qcom,eliza-dwc3",
>> +		.data = &dwc3_qcom_glymur_pdata,
>> +	},
>> +	{
>> +		.compatible = "qcom,glymur-dwc3",
>> +		.data = &dwc3_qcom_glymur_pdata,
>> +	},
>> +	{
>> +		.compatible = "qcom,glymur-dwc3-mp",
>> +		.data = &dwc3_qcom_glymur_pdata,
>> +	},
>> +	{
>> +		.compatible = "qcom,glymur-dwc3-mp",
>> +		.data = &dwc3_qcom_glymur_pdata,
>> +	},
>> +	{
>> +		.compatible = "qcom,kaanapali-dwc3",
>> +		.data = &dwc3_qcom_glymur_pdata,
>> +	},
>> +	{
>> +		.compatible = "qcom,milos-dwc3",
>> +		.data = &dwc3_qcom_glymur_pdata,
>> +	},
>> +	{
>> +		.compatible = "qcom,sm8550-dwc3",
>> +		.data = &dwc3_qcom_glymur_pdata,
>> +	},
> 
> Duplicate copy-paste issue?
> 

My bad. Yes.

>> +	{
>> +		.compatible = "qcom,sm8650-dwc3",
>> +		.data = &dwc3_qcom_glymur_pdata,
>> +	},
>> +	{
>> +		.compatible = "qcom,sm8750-dwc3",
>> +		.data = &dwc3_qcom_glymur_pdata,
>> +	},
>> +	{
>> +		.compatible = "qcom,x1e80100-dwc3",
>> +		.data = &dwc3_qcom_glymur_pdata,
>> +	},
>> +	{
>> +		.compatible = "qcom,x1e80100-dwc3-mp",
>> +		.data = &dwc3_qcom_glymur_pdata,
>> +	},
>>   	{ }
>>   };
>>   MODULE_DEVICE_TABLE(of, dwc3_qcom_of_match);
>> -- 
>> 2.34.1
>>
> 
> BR,
> Thinh


