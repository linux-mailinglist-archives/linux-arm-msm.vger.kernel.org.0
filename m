Return-Path: <linux-arm-msm+bounces-117001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wLBzO0kETGpiewEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:38:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F735715144
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:38:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oyAoY2mD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OApJb2F8;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117001-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117001-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D89EF31146FF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 18:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4222C41613F;
	Mon,  6 Jul 2026 18:11:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0393F88AA
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 18:11:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361501; cv=none; b=nVCRSlK29orilmn8fKwq3JJjiKxC8T9b/NB6woNXEDFCdvKRKQTCUj18Pf0bA67ZasuGZioxnzWHPiizbhf9Y0Y4KFfSA7aN2UobPY3+brErKNT+rxdtn6e4UYTmnoDWjbnsYTkkBH4K4No4nVZO5KoqWoqlXPCNWoR/ir++GHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361501; c=relaxed/simple;
	bh=U4koz++ZA06ISm8vxFqnVpmFyDBe9iaAT7D7rWX0oR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eO4sDJ3w/lc0JUEyTTN33mbNYA/xLDTSBXAltCDdfXTAbk7pBZpsl99FULKnbH+GupKvWqsnLwoAct836boCRzP6QwWw9oSiqmf4BMlsQm6GhaxKNomNKQIB2IoXeiW3gFme1CGoZ132MYYiTkpvltfPV7Ph+pdcZMzHy5VaYbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oyAoY2mD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OApJb2F8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF9jx900738
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 18:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AdPbV9YRxG+cQo4afaZFPHUjWAQxmA2bvmATYgT6CTo=; b=oyAoY2mDnXL/VX8Z
	EBod0XnqCv7UgO1YwDq1XxWWC5SMRyo0RZF/U1lU6Igva/NONMIpSecUBdw+9xKC
	ujlK2eyCwPYcM5RE+IBvDP0AbFpbH6LsMftZY+CXk9Opnw9K+npEdRFjnLD2GlzH
	a8eHyq/q3yCaR//x8mS3bEGHi4Tykxv4CkT68rJoCiv6yf6Su9Nx4lGy0kFJimhd
	peP4f+JzySIWAQjy2gXu+DmbElL3DsGAEUO+fGeTfyRhnwQwsDy4fC4C3dgK6Vju
	5dW/qVhBTz40Qr2iPGQvhBnLe70lCcQ5BaaNikIIXQxrTVr85EByRRBhYRKM1Bxy
	WcUULw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7jwjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 18:11:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so10212085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783361498; x=1783966298; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AdPbV9YRxG+cQo4afaZFPHUjWAQxmA2bvmATYgT6CTo=;
        b=OApJb2F8bKGFA/EkasjNmPflbo5Zu2uz1eaeQX1/Y8XsgeBsnD+KCv7uOJ+eBBv4ZL
         LbRyHxyeVB3TlahzLDpaCpx+Fgm4h0Wp8Wv4SlLA20isbtJnhyPwzIOxbF1RgA+OR2zt
         QVPgvCQXdozjwWaVaLHZEcNsc0J01vK2CzCB2q68OXAIIXlaXM2qyBWEWrXC/368dnD0
         fTK2BcUNFekO1JuWlYAV7ZA5nSFbgsZhPc+3vRvXoQPJxfiwARjA2bmHUB3WAJYbgtyR
         6VgKw9w8GDixskyx71VLYCXHWFozePEscrru7a5BehTJJsJzSr5EldtcT8KcJycy2OzZ
         N/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361498; x=1783966298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdPbV9YRxG+cQo4afaZFPHUjWAQxmA2bvmATYgT6CTo=;
        b=j7c4fFehgCA7HPqK78pMts/6e1AcEwlIiJ+CGpx4R1LgQwwnMPH8a5WZOkNLJEhgxx
         dluUqAW9Lo1UmbWuSQkj58GKNJB8bk1M1AduJ4was+k9lgpZiEmJXstvYsJeUNc4g+0J
         d5NqgTlvnQRu8AseqxBB5sVzmENvvM9/KZcFOLSHYqwLWD0affz8LpjYSBa1r5CW267q
         nx8vBM/0/aT6xOdlfctEarrPzb86T9LeSacb9QXAGicXHUmRVbTR3ThWjMO5lwzVVplZ
         fHq20eNpMY7YWx3SKylOGtmNJ+o7nxt3AGEpsjjwJa9YhNHEo0w2senXzIvTrXE9eTYs
         Gapw==
X-Forwarded-Encrypted: i=1; AHgh+RrIb90NNQkWXqH/sa/gCzQ2V6tk7cJLMsXfox3FoYLrP3YNBsUNpOt2mxWAYCnfV04g47W7pp5O+OmAabUI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1+kSdGASTUNTvHTLdjnvLcg5VFrIG1reP9y8sPIJ3XaCzisSB
	cvNHGPi6AZCvEiIEbGhAGcs0BQ/b/hcx/eaP7IjWaMnRtHenYM8S0Savp6Z5Rx7/7CEAgOOJDVW
	9BliVPy1LFSNMvosyEHnf7BRzRpasc3Q9nlKbR1OXD3ER79lBawRlujvztIV3shcOeWZB
X-Gm-Gg: AfdE7clZ1ceDueiM8Q8slHTyD0GDIEbWG6dQGxK7gfWW9ZhZIkcK2JJF8Js4RrHb5wB
	a7AkB5+Uqa1cAtJffa8GH1aB9989Pqohuit0HC4qjnrBtQiIb28LgE7NDyL2Hvdh6ln/FnnGkpO
	XgPl877pL38ODTPzkcAeb66C9GL7YK1F1ile2/kqEVBMBoWIvEm1tceVrZz+o7uEit1Wg3RLhke
	5W94Ks1JhFB0MnysVWIAQwjA1an/Wj6xfD+sjCcOecS7mgKQN5cX1Jr22b2vqnPFQBkmITs3+xz
	vCjo4ycmqAAvpXX5UNYa1nNAF+WQuGtpPRJX5bIgSp6uitngxRg9RPw27/rxjPxVDYUNjmf16Uw
	1884Wljqa71l02laHaeQ53tEUPo647W0fUmwqK8CSFhg0HQIxadIhv8/1dpqvbZDBITa4sSJ5og
	==
X-Received: by 2002:a05:620a:3944:b0:929:7356:2e51 with SMTP id af79cd13be357-92e8b29ea49mr2107013385a.11.1783361498262;
        Mon, 06 Jul 2026 11:11:38 -0700 (PDT)
X-Received: by 2002:a05:620a:3944:b0:929:7356:2e51 with SMTP id af79cd13be357-92e8b29ea49mr2107006285a.11.1783361497659;
        Mon, 06 Jul 2026 11:11:37 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8f1sm26585575f8f.3.2026.07.06.11.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 11:11:36 -0700 (PDT)
Message-ID: <1aca8d60-8e39-4532-9095-a5260bba76ac@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 20:11:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD device
 type constants
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-1-3882189c1f83@oss.qualcomm.com>
 <977711ef-c1fb-4735-b82a-4ca2f4797f51@oss.qualcomm.com>
 <8ad14017-bce7-485e-9677-9cbf8ecb2742@oss.qualcomm.com>
 <yvggh2zs6qkuyuzvwydkecswnjoyba2d7t27br6xpk6d2csp53@i25g6okdktz5>
 <10a346d8-fbb1-4142-a650-507c3917b8f6@oss.qualcomm.com>
 <dv4n4ntnfvhouv23asgshgs7wcolkmqs7lbuni52maexo4s44x@4bqhf33x4fr6>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <dv4n4ntnfvhouv23asgshgs7wcolkmqs7lbuni52maexo4s44x@4bqhf33x4fr6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4MyBTYWx0ZWRfX8uTrBxccOBrU
 COfAk39XZEa/B0E4Mq+Hxc+mA5h3hxiJByk0TkpgabvQDSQY6ueYhsIGRseSEyPuKvaHfa+Wjhu
 mcXw3ppSUFqT3YTlUWjSLBc8/HbsAyp0emja7ZgECi5HuA0dxxDSUPOxv/b5emGSKCiNpZXz6ox
 R8unJCnzVr8sxeyhc025EfqTMezuH5nBdt/8fdsnvVTzjHLHsoMnRnn27LBK5Mcs4UIgRm4bibH
 lmuLZ5YsONDDuQiXIYxc2QdKBNBB6KbSTINLBPr/V/AAesT8upOKdmhKTc3fSfoLI32OCx+fZEU
 CVkK5coaxVzMQW/byHv8ndNheVkTrnZ+7fYVe+XdF7OrMAVbazHt7WHEaxdMk2HW6hY2TMwLBkI
 Ve9bMrlxH4+nM9h5yZgehAZJjYEB+ytk++yLgO/7JuHVzxXurva8TjZkVJnLgU4++V9FVvJemY9
 nIfWaoKDUU8zpMv/x/w==
X-Proofpoint-ORIG-GUID: 3_h7dINbsXpwAQCnI3LVAlWbQ1a5wIU5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4MyBTYWx0ZWRfX0MfDbBln7RFp
 cO+V56v5ETBqZVNsWnpQM7Y9O7seMIy0o5MKxX9bOgZsDTorGj5aKUrpHr2dFdSWRE0ucguEaXP
 ShdaI4NWYxGUBZj1rOyhpadglzoTaq0=
X-Proofpoint-GUID: 3_h7dINbsXpwAQCnI3LVAlWbQ1a5wIU5
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4befda cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Q9Cl1ItI0dfYaDPAyAEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060183
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117001-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F735715144

On 7/6/26 19:47, Dmitry Baryshkov wrote:
> On Mon, Jul 06, 2026 at 07:03:18PM +0200, Daniel Lezcano wrote:
>> On 7/3/26 17:42, Dmitry Baryshkov wrote:
>>> On Fri, Jul 03, 2026 at 07:43:39PM +0530, Gaurav Kohli wrote:
>>>>
>>>>
>>>> On 7/3/2026 1:23 PM, Konrad Dybcio wrote:
>>>>> On 7/3/26 7:03 AM, Gaurav Kohli wrote:
>>>>>> Add Device Tree binding constants for Qualcomm Thermal Mitigation
>>>>>> Device (TMD) types used by remoteproc-backed thermal cooling devices.
>>>>>>
>>>>>> Qualcomm remote processors expose thermal mitigation endpoints
>>>>>> through QMI. These endpoints can be registered with the thermal
>>>>>> framework via the `#cooling-cells` property on the remoteproc node.
>>>>>>
>>>>>> The QMI TMD protocol identifies devices using string names (for example,
>>>>>> "pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
>>>>>> `#cooling-cells = <3>` requires numeric device id in the form:
>>>>>>
>>>>>>      <&phandle device_id min_state max_state>
>>>>>>
>>>>>> Define common TMD device index constants shared across currently
>>>>>> supported platforms. If a future target requires a different mapping,
>>>>>> additional target-specific constants can be introduced while preserving
>>>>>> existing DT ABI.
>>>>>>
>>>>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

[ ... ]

>>> Why are you using only those TMD devices?
>>>
>>>> More constants can be added as needed.
>>>
>>> Kodiak is one of the supported platforms.
>>
>> What would be the benefit of having more than thirteen cooling devices
>> declared in the thermal framework and having only a couple of them mapped in
>> a thermal zone ?
>>
>> I agree there are more TMDs but if they are unused for the moment, why do we
>> need to add them ? Can we do that incrementally ?
> 
> That's what I am trying to understand: why the implementation uses only
> the selected two devices, if the modem on Kodiak supports others. How
> can we find out, which TMDs to use on other devices.

My understanding is that is an initial thermal setup. Gaurav will add 
them step by step while setting up all the thermal zones instead of 
sending a big patchset. And TBH, that will be much easier to review.

