Return-Path: <linux-arm-msm+bounces-118655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5+x2EmmUVGoonwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:31:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E24987482B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:31:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Q+Jjp9n6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CQiOSKNM;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118655-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118655-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D190E30413AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFD336CDE8;
	Mon, 13 Jul 2026 07:27:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A1C3546C6
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:27:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783927634; cv=none; b=hMA4vySEHyJOmAU/6Z5GMLoi+llvVvI5tRsOGJ2/dQnKqTJqw/MolJByVdqPlnYPK9HZkQYfJ1cnN91/mKK0jvVJgUuvd0bktQucthYMutaxF/rApzp/qQm9aQcLAVKmtyqIwueoMgAh7GVHE8DfIhvgc5lfQ1RA8uOFUQIyqMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783927634; c=relaxed/simple;
	bh=rzmaf5Nx+QMbOMDy0JTb5Od0rGnZuwwsagTUEYpVYjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pFMWwVQxiguYmC6Om7EogVhcNDl0eAEeuzRzj9X4P75Ix1nrTbknjsf05LY1A0stKQM5aaj11SWwQlTjpo2gPexDE/ZJYSw8QgYidzFSjYjNIjWmaabhGiHcpAu7uFvjvSjtc+IUYWfQbeT34ZB+L8PalVW1HvvGjtRHgefjzBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q+Jjp9n6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CQiOSKNM; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NufU568062
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b7+R+IEwGTa+tW+AFP3lb1nudfQDALMgZxFV8QusXX4=; b=Q+Jjp9n6AOakwWLd
	sZb73+z9Vlt9Hd5YTvKP1ayCn3AUxjmfoWeWhr16oqG4wcLX4wPBoQJxZ7VaPslQ
	xerjjswTr8aBuBPkj9DhvFBmdAXV7dCwx5WF9AhAdU2HGF3cv0pLwyoG38OlK3OS
	uiE6PaRNG4fMNS14+xWC4u+QKMJm7t/uaHt+p8DPmBKl9yaCBsdhZBcM2Z1pRIWI
	8lYkuMfqL7p98q7qHUcIWhx0gNLVEg254J2d+wNAiHMqrKIxrpBOA1QKEsneXqCz
	FOZyAFA3MBm1Gz3g8/N21k5HZD41WMGxyqNFNMXhZHmThEOW9yvcpIhP89ZQVF5M
	NVmJMA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe914y41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:27:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8483e038efeso3126299b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 00:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783927631; x=1784532431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b7+R+IEwGTa+tW+AFP3lb1nudfQDALMgZxFV8QusXX4=;
        b=CQiOSKNMqdXn6gCwBhEA9Bxvstn+XUWChzVRiY65plgVrvRo7eQkW5ycVyip9r0jsp
         e1MQpFa1Q7xDC9kO9e4VllBSs0XDOMv6EJN/QuipqnvO/3VReug5UmVFxAwXdXaai+Nu
         rGOJq0s8pEDPeGh2MQToxWkca9+Jr89zl4cn9U0Rj0VYK8D5by6w2uvA3g063WBjbbOo
         WhoyPwC2ubaIIdu0SsQIy1fVIJr/GeF/zP5uqGEgzhRIEj/c3ckDGOo/kxvHwd0cEgdv
         dRhIRRYTXnxU1VLrnbiWpOQDUc2u/yyXfT6o5Rt7B5D5jPaOFFm0usBTJ6DmvDiATsTh
         Zh4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927631; x=1784532431;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b7+R+IEwGTa+tW+AFP3lb1nudfQDALMgZxFV8QusXX4=;
        b=EaZ+Pod4PDZXsHzexHHQL0eoyWB8wxq28MWNbOZYJOu3bm5Hp8eKM4yQw3qcrpTMQo
         19wmot7pVl3+cQaZOA099DiWEzJedVjmsJuc621nWWOyarJWf1tPgqQoY65zbMVb0kl5
         OVv2G6UIMJAQQRXMavrR2y4SzEFtxdeZ9II4LgBS6NKQXgeI6yvhbLDpGG6ZqvZVz7Ty
         Xs1kctCPNvPon16Hh/yCBLd+OuDRKlIrs7Vx0ZD4FCzCWHqK319aB7sCgq+vQid7wLBv
         l+7xWS5B2nwvq2jv9ekDEHYn+29vVozTn5y4YpJv7IKRcFAEh5xbBAbo5q8PA4VmdzeJ
         UWaA==
X-Forwarded-Encrypted: i=1; AHgh+Rpo1pXtpnAlydYzI3D+WBidJCNGGp9LzTWFmNb2SEfOQL39XCdB1ZP1xC/5qIJuomCCY6IwLh5EvC8YXgAd@vger.kernel.org
X-Gm-Message-State: AOJu0YxlPEKeunzZ3W1pW6s1V4IHpA/BbIFqOHQ5TbNi+j+BlyeUCxdv
	S1wLMTBvn5HXHg7UbbgxOH9dNdC+vy3VWbOjCviqVG05V1AGJpoRMyarIA24XbFoQ+qsSMMAAvu
	sFWG4BP6XFhZj63B7mGSFj8+BWnYUr+i2RO1/n0/79brvBdSCqWkM5lswKXCqzulLC9C9
X-Gm-Gg: AfdE7ckFYjN36jpOyVvR8XxZlVabpPe65dboTG+eEOsXQLVBUDG1mlndq/3nk4uDa+1
	zPhAMit2RuUeWDbyDdSF6N9CnxxjBxWXuOZxNzD/fpu87LiR34fZjQJhpIORNmfDqos4mzpuSPY
	FI8c+13RDwh8t3aRgACKI1YybyBpnnz24rt7Jqshq9QnL1ttxUV/Ng0pTG0ngUlx5me2Yx0CnCn
	jTRsHthorE2VrO2Ep5dWhIOP4bhDdY2XkE9yXmlRIMqstwz0777s9KoVGFLh1EFkzwKxvspQ4k5
	dTpMwTHEFips8GByMXgQr82jq0YkNdkdqYRbIm504vJfTEZnMu9uKoJdvVegPyZsJvoMK1opsRB
	9XJTLKVpf27zpnZROBmUTmaohf4GT7u6naSghIA6rEkE=
X-Received: by 2002:a05:6a00:a117:b0:848:824d:aff4 with SMTP id d2e1a72fcca58-848896fee6fmr6817091b3a.56.1783927630859;
        Mon, 13 Jul 2026 00:27:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:a117:b0:848:824d:aff4 with SMTP id d2e1a72fcca58-848896fee6fmr6817067b3a.56.1783927630381;
        Mon, 13 Jul 2026 00:27:10 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a15e36158sm2055595b3a.47.2026.07.13.00.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:27:09 -0700 (PDT)
Message-ID: <d8d0818f-4f3b-4efa-a89e-e304be91f3cb@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:57:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/7] bus: mhi: Load DDR training data using device
 serial number
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-5-3a78362c4741@oss.qualcomm.com>
 <ysumvduurfx5jq7r2eaa4ik24eqk5at24frvjl3zyif4wc4ojj@2bhq4vzuqlnw>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <ysumvduurfx5jq7r2eaa4ik24eqk5at24frvjl3zyif4wc4ojj@2bhq4vzuqlnw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a549350 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=BmEjwzUHSYKQsWGf9k0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NSBTYWx0ZWRfXw+XArgjfeMbh
 RegJMClTmOrEUGQGs+MAqUnNeiR4ohbrLuAULPoCKFtphA/NiEH5GwIJT+YHIhd55q5+am0c43A
 gW8MSB1mK6cAg3nnVsfn52tUQhfUCT0=
X-Proofpoint-GUID: B5ZSCfv0pK92WgF_6zdwPlopMDNZjBzK
X-Proofpoint-ORIG-GUID: B5ZSCfv0pK92WgF_6zdwPlopMDNZjBzK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NSBTYWx0ZWRfXyiIEi3AhJo+D
 ShVMo38cjlF34Yq6Tqc44cqXRR/nND+Z4gsOBUh7MW/K7e7TZX1js2Z+SdirBLI5ZtEtizSdDwW
 IP/8XTrNrXoQVCghMIuilfuotN456+J+bK0paF8BpKzcFR7EPn7eq5+0or81gX9tSlQr86IksQJ
 4rjIdCTOUaVBCHk1RqrRSGgNsyQ+MBJl7fCMmzqjuEZevC6VPeLiDFmIxASC5S0XlivI9PHTooa
 nN3hSl2NfBDlznOmaY5/AP30xhqc2bA+Qq5zAlyLk8IkQE4sh+SX0v07K/9g9xS18YsOyv9ef17
 vn4cYZ//9LKeSNHQlbLtWPIqoDsZ10T92TTkSGpnzpQmvY7TO93XDGL88/UAC0j5s7QG7B+/3jY
 zp6c0ZHPer0PMRldV+aGutYI3v9CZZPJdQ3KHLr03XphnxNMRSxr6nHdffzkemEIZSdvXgUkH9F
 7TBrVSDroTn6Pp7avZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118655-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:jeff.hugo@oss.qualcomm.com,m:carl.vanderlip@oss.qualcomm.com,m:ogabbay@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:mhi@lists.linux.dev,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E24987482B4


On 7/9/2026 11:51 AM, Manivannan Sadhasivam wrote:
> On Wed, Jul 01, 2026 at 04:07:39PM +0530, Kishore Batta wrote:
>> Devices may provide device specific DDR training data that can be reused
>> across boot to avoid retraining and reduce boot time. The Sahara driver
>> currently always falls back to the default DDR training image, even when
>> serial specific training data is available.
>>
>> Extend the firmware loading logic for the DDR training image to first
>> attempt loading a per-device image dervied from the device serial number.
>> If the serial-specific image is not present, fall back to the existing
>> default image, preserving current behavior.
>>
>> This allows reuse of previously generated DDR training data when available,
>> while keeping the existing training flow unchanged for devices without
>> saved data or for all other firmware images.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/host/clients/sahara/sahara.c | 25 ++++++++++++++++++++++++-
>>   1 file changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> index 9adbd84859073d8024ba2a5fcfa33897439d6759..b5ca6353540dc3815db6539e7424afdb749fd3f6 100644
>> --- a/drivers/bus/mhi/host/clients/sahara/sahara.c
>> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> @@ -59,6 +59,7 @@
>>   #define SAHARA_RESET_LENGTH		0x8
>>   #define SAHARA_MEM_DEBUG64_LENGTH	0x18
>>   #define SAHARA_MEM_READ64_LENGTH	0x18
>> +#define SAHARA_DDR_TRAINING_IMG_ID	34
>>   
>>   struct sahara_packet {
>>   	__le32 cmd;
>> @@ -226,6 +227,27 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   		return 0;
>>   	}
>>   
>> +	/* DDR training special case: Try per-serial number file first */
>> +	if (image_id == SAHARA_DDR_TRAINING_IMG_ID && context->fw_folder) {
>> +		u32 serial_num = context->mhi_dev->mhi_cntrl->serial_number;
>> +
>> +		fw_path = kasprintf(GFP_KERNEL,
>> +				    "qcom/%s/mdmddr_0x%x.mbn",
>> +				    context->fw_folder, serial_num);
>> +		if (!fw_path)
>> +			return -ENOMEM;
>> +
>> +		ret = firmware_request_nowarn(&context->firmware,
>> +					      fw_path,
>> +					      &context->mhi_dev->dev);
>> +		kfree(fw_path);
>> +
>> +		if (!ret) {
>> +			context->active_image_id = image_id;
>> +			return 0;
>> +		}
>> +	}
>> +
>>   	/*
>>   	 * This image might be optional. The device may continue without it.
>>   	 * Only the device knows. Suppress error messages that could suggest an
>> @@ -235,7 +257,8 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   				      context->image_table[image_id],
>>   				      &context->mhi_dev->dev);
>>   	if (ret) {
>> -		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
>> +		dev_dbg(&context->mhi_dev->dev,
>> +			"request for image id %d / file %s failed %d\n",
> Spurious change.
>
> - Mani

ACK. Will remove it in next version.



