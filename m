Return-Path: <linux-arm-msm+bounces-90140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BEfDWvocWkONAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:05:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF2764329
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E8542720258
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 08:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1A9322A0A;
	Thu, 22 Jan 2026 08:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pbz1iPxa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NRxrEGhm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D6D2F8BDF
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 08:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769072360; cv=none; b=AVWioYbruDjLsFfeiB9IL6uR77nJmqaV0MiUejNGa+fG7O45AfO5HlIb1ywuYElzkHvzI8/3lr5uOMRaZmS/D8+oybXIR3PpT8ui0vOywUjwGSOUVQUufw68/Vt5DmThKBvRwBWMPzqNasKmDXtO/v/7AAZDIThC2s/OgFWHO/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769072360; c=relaxed/simple;
	bh=3lbPi/bsw4Cc3WZOQXzyvTxdHo6csw9mkEk8ZHixWx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e8WyVhXbRM2VmLwysl+X0vnsoXF8dYxM6/eiw9L+6x7E9Ylm8LhTnNj8A3A999KaokLtrEaZoS21Kg7S/NLv6R4xLj+7KFjOqeP7ydnrdEO0Sh6iRGKWYLJQKxZqoQGTknHWWV4iiOcAqnn64AJ/WBGe6a0O4YbDR0A2Dxy2Hec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pbz1iPxa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NRxrEGhm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M7x1u92276750
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 08:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CqVbn3OLR8tmVrU+l6rvOR1TWMyoigyowuSm5THHMRg=; b=Pbz1iPxaTE4GI4Gs
	Zm+n0a7sozcGDQOj3vyYcd3jCFG4ly/VDl979dj4prFlQif7qapLfKPWqwiNAsbO
	mY3df+dGaNBZ4m7ExLvMiVwlHaalTiy7NkU6E7S1GNkXyVVKshlN3eduS/AQdmbt
	jgnXe5p3uzO/dzboV2dof/C5Bb+K7tmO7g6YoRqZEuOh5AnscSiHknZ6RxOILVpM
	dqxra9V1cnZcN+s9i54PlMNRE2HKWjQ3D1PtK7xSXi1lTP57VImSt6OHppJ4dUve
	BnyOmZLsQnMYsjyy4uNFtSd4XunIdvrziugDJ2K6SQjYsuJnhbzGk34Mpzbi7dUX
	L61spA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7fasmn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 08:59:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c5454bf50e0so1279311a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 00:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769072355; x=1769677155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CqVbn3OLR8tmVrU+l6rvOR1TWMyoigyowuSm5THHMRg=;
        b=NRxrEGhmU42C1x5cMeybU8nKZeLtaZSlQsZSRpk7yABSyYowrEY/rzdCzDbgFI+rxb
         azkE4LBQH5mId2yGbiBEjnomJ0ngYdLsBZc3t66QbLMWmF5sIS+5OGTfnaStRXy1nDDj
         KmqMgFZAvag8hitCfgGWWCjx0GAC6pQltoJ+OUz9zKpKTIljPa88CMqFKLPK3e8nsiaY
         fTy91Md7GgbehCQolwD2T+oSyPt1Il54yIH6t6vUEbXQUQx9teSjkLrolJKHD9rqyCem
         qZ1O6ZeABqFlUstWJZr7NpQq1qUnxZIDe1uO6OlbuiAd6GZELdqltpjedVI/Hb6p0hu6
         kEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769072355; x=1769677155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqVbn3OLR8tmVrU+l6rvOR1TWMyoigyowuSm5THHMRg=;
        b=vh5ME3lZ9SrKUJmEKJCPqTkay1WjSj2hiIKoW0fKq3c9OdPhkF4v/0TZLyKBQvjWZ5
         Fo03o0b8dP3hSlDGxfeAZVlI/+80gKUcK+SmmZc2rtFxPae7GkichuxgDX9fvGP3l+u8
         /Tp9oJklZN7zVHSKiBjQaIcndQcijxc3jnUq+76AX2dPsE6uy7QOYbFXw2EImjgXdgcF
         eOdefXFCxE27wFQublcOH8gEX/mJHZGWWRF1SaBzgcm3QULHVeSJ8mXSC+T0FuUDxrrM
         ev6ALWK4nXCtAHMpEjhPei6J98SwWWokdTFqZMSwAWdcXuDEoiYN7vL4g3AGQvR4c2BD
         8NDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8z7XkcnFKZYyVjoQ/skGDtGWe3dNNGVqjkTelRjxSoNdnvRfYqTtbIEj6CctrRXsJ1ZQItYXFv3nk5rEf@vger.kernel.org
X-Gm-Message-State: AOJu0YxwXDrQv8qNGI5zkpLmbbhzmTUpaVIvFUlqLhavlu9BMTU/fvaC
	6/65jIdshFrA4PoplZkHN44Z4HinHywYEfPCQS0HxChawgyWec1pq0KzZAWdcGV2UlDSYeeS3dN
	Au1nbP5ZRmwQ0zSPueLnwf9JzLahNbreC81HgbbZJxww6KUSzJv3KCpftX9Gn6Eaadqfh
X-Gm-Gg: AZuq6aKygKe7180vNQZiUGwH457JVNEY/99OQhRabR+RXkZ+l+4W/LbLzmi1KFuc9nk
	JWf5lQHyG7i4U7fkLtOs36MrI4m5j40V/dqsfmM7hgpwfnNuspqOfVrKAM/QkefvCZ0AxNW/KOO
	xNX+0pvDLxweMCb1HuIMSvpRr3pOwsD1Gr7foPc+KfjdMGSYzymLym9STd45IOqabR/c/Mw3OKw
	0V4slennimrA/axID7YJUwGFHJ8kZu/bxFqa8vOBPC/TXLq43wPv11eqfFGLP6Q8lrgcr4Jh/la
	OaHgc1+MUzkPC0lqGi649WRZQIqOowiCGa2wPdyEY5U0NcntXQmeLGEoYEr05fiVMgIFeCtnyr7
	5fLygyh58jo4Twwn9nMjIEXvPXR0JTK6LSXkRKwlK2Q==
X-Received: by 2002:a05:6a21:62c1:b0:37b:98c3:4250 with SMTP id adf61e73a8af0-38e00c2c914mr19744985637.19.1769072355163;
        Thu, 22 Jan 2026 00:59:15 -0800 (PST)
X-Received: by 2002:a05:6a21:62c1:b0:37b:98c3:4250 with SMTP id adf61e73a8af0-38e00c2c914mr19744955637.19.1769072354680;
        Thu, 22 Jan 2026 00:59:14 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf264b9csm16483068a12.15.2026.01.22.00.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 00:59:14 -0800 (PST)
Message-ID: <98e0f3a2-2191-47cb-8c7c-e80f012c83b7@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 14:29:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] PCI: qcom: enable Link retain logic for Hamoa
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260109-link_retain-v1-0-7e6782230f4b@oss.qualcomm.com>
 <20260109-link_retain-v1-5-7e6782230f4b@oss.qualcomm.com>
 <woztsrvxwkgi34z3yop7nja6ojbxdboyzz5xpz4xlym75dtyja@iopi7hvw42v7>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <woztsrvxwkgi34z3yop7nja6ojbxdboyzz5xpz4xlym75dtyja@iopi7hvw42v7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Hrx72kTS c=1 sm=1 tr=0 ts=6971e6e4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=21QzX6uEHMqXofhgfOUA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA2MCBTYWx0ZWRfX8zhnDfgkh7nd
 B9ydCQt26wCDGZQvaJW8F97IAd7Dp6InkaCb49hQdbdlckHeLRhVBbR3WPfBTq0IGpJb/Mm6cbP
 gT49d6oI6A4DUAcJG50mlIGyi8JxUpmDggWqVveX1s11Z54ISYOrf0Jh3pUKi3OFJKFsndvAc3Q
 Fw3Tc7WbpErz0nZ5xp0T8aVic/sT6rpY48v8adjxtNAqcDV9qNYwmo5Z3lRg/BsWuWQ4IV80uX9
 62rWV+/dWTuzi839HKFcRMHWexewANE1pllIkWLbkvTqBqNQCby5fi+M/hDhShz4wb8FCbo6PIl
 K2BijXzWjbrMMw2M4vFUdMl94tkHvRIinnF8POwQyBDGdKq7BaTG0l9cHV3Mm/xWwopEmU4xlH8
 L/G4xI35O0I+URgoHBgBxnVws3yKm7CN/nQOZw0Se6B201DYkJ2zRFF9tBoKIvK6+5EYbFd9JAZ
 0GZUikTESzo4UEyYAQA==
X-Proofpoint-ORIG-GUID: sannyxeRMlX8-GNO2e4JA6UzOV0IJLH_
X-Proofpoint-GUID: sannyxeRMlX8-GNO2e4JA6UzOV0IJLH_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220060
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,pengutronix.de,gmail.com,google.com,vger.kernel.org,lists.infradead.org];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-90140-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5BF2764329
X-Rspamd-Action: no action



On 1/9/2026 6:39 PM, Dmitry Baryshkov wrote:
> On Fri, Jan 09, 2026 at 12:51:10PM +0530, Krishna Chaitanya Chundru wrote:
>> The Hamoa platform supports keeping the PCIe link active across
>> bootloader and kernel handoff. To take advantage of this, introduce a
>> specific configuration (cfg_x1e80100) with link_retain = true and
>> update the device match table to use it.
> Why are we enabling it only for this platform?
As mentioned in the cover letter we are not trusting every platform boot 
loaders,
which have initialized the controller to max speed. That is we are 
restricting them to
only for this platform.

- Krishna Chaitanya.
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/controller/dwc/pcie-qcom.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>> index bdd5bdb462c5f6814c8311be96411173456b6b14..975671a0dd4757074600d5a0966e94220bb18d8c 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -1531,6 +1531,12 @@ static const struct qcom_pcie_cfg cfg_sc8280xp = {
>>   	.no_l0s = true,
>>   };
>>   
>> +static const struct qcom_pcie_cfg cfg_x1e80100 = {
>> +	.ops = &ops_1_21_0,
>> +	.no_l0s = true,
>> +	.link_retain = true,
>> +};
>> +
>>   static const struct qcom_pcie_cfg cfg_fw_managed = {
>>   	.firmware_managed = true,
>>   };
>> @@ -2168,7 +2174,7 @@ static const struct of_device_id qcom_pcie_match[] = {
>>   	{ .compatible = "qcom,pcie-sm8450-pcie0", .data = &cfg_1_9_0 },
>>   	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
>>   	{ .compatible = "qcom,pcie-sm8550", .data = &cfg_1_9_0 },
>> -	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_sc8280xp },
>> +	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_x1e80100 },
>>   	{ }
>>   };
>>   
>>
>> -- 
>> 2.34.1
>>


