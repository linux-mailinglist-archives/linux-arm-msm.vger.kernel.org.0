Return-Path: <linux-arm-msm+bounces-113847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9dciNRtANWpaqAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 15:11:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4F26A5FF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 15:11:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="YhDzh1u/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NQcjDlPb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113847-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113847-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42EBA300ECB1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 13:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3355237E316;
	Fri, 19 Jun 2026 13:11:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C575A368294
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 13:11:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781874712; cv=none; b=pKhkP8XnhMcFhcyTfJlpTrpQmHDn5XgsTAslX3J+/ZAdeGedjNVl4ifOaxuTrFdyOzKSuIQOUDRf39B1RsbC9iw3c6QsNdOrd4UglTCjkVkTCUZurBvy3WkuP8xrKkL3hs7zw3bPuo+fnma0aoMtSx9I4sLcHoRiMEDxCont57I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781874712; c=relaxed/simple;
	bh=rV8w+b1ETZv2QN0XAg1ZP/q3v4ysXMEHONDN++Z9/eU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HEjXsNj23I8op6WTclIrfR9Kh/0lzLMPIYRallJPSA0kC8WrKcj8Z4qJOHgiJswHOCg5Jq5CXo1XQp3tMjGXt26rC5/tWFZztd9dcmKfjIrg4oTfZRk6CZ4onLYHdCcbB4uGG9He4u8MA6xVVvE6TUt9VngrTmhLnR91+HFzFac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YhDzh1u/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQcjDlPb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JDBnAr758296
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 13:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iR4N4bYPaDBbDr8EPSt8Vv149QQporsbBPhVmBjvKk4=; b=YhDzh1u/DX2ScARI
	+7uyZCHm7I7/USzofbrw8WWCjyanL1ePGFpVvan9J9rH3M4GiZTG6G4jJbXFzVR1
	Apsy0IS8tJiZxXayP8FKGVkcaBHpOiPhWmnyYtt3ghzY5TyKdNVEjYDDhnqaU641
	LA7CsHq60Gb+o6GHC0fWSAnMdm6bNBPUVLD3OuRhtWBgQlIH6fUiMACyJK+J56qM
	CfYRpZ9hnRKpeBqVCZhs0w3/ZaBngVBk09Y8stII+nTZ+gx3cdWlWwhPrXWNcB4N
	OlSFGjmbBdCsGAliB6BNnrdjG3YE0K/1BioGReuRUG6HTztSrE3rb8LS1Y3+ieay
	vIHaeA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ew5hp85kw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 13:11:49 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-72991fd8beeso109350137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 06:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781874709; x=1782479509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iR4N4bYPaDBbDr8EPSt8Vv149QQporsbBPhVmBjvKk4=;
        b=NQcjDlPbT7prGkwz1WmdcZUukRqNT3hOAa0suvpf8IxzPUZk9/8WjNiUPBnx+EgY5o
         k86BjJroNDFxlLFDzjRvpWTMzks8BhpQPRRXv0KLkTHScHEhDqwYnAxYBidIUCKmJjWm
         U/xxmNpt+ZI/iGTE+lhaozRwojLBs+QNzhjLL455oFtjRvhll2A+Hc1yLOBypyiDYwGu
         8ttztIjS6HjtznRI3jxzHkRFqpo4sNNPPM29qkNLJ0hqKWUf9HNawrLtQU6qmfMBV+kQ
         eBhDe899sCSKZaRmEQMPX0l7lPg8lP2Mhsb773SkEDRa+3zls80YbsTaTRUJ3Y3OFAQF
         w7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874709; x=1782479509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iR4N4bYPaDBbDr8EPSt8Vv149QQporsbBPhVmBjvKk4=;
        b=AVwOSolARTwtvjyXQ1Go435hAuPk0NlYtueedsQ66FPbT6OA7xUmqPMatYq/qEIWNQ
         l5IwasBTgF5kBOPQlx1As2jhsZNWZKmM9HSV/qrcH0x9gCqKJQO83DKCqHFYZMqEAFig
         /z2KszwtQPyeQLD/vLxS1eep+uxeRUo7sLycDn8Mkm3U+YdIXzlpMzJYxXyRi3flhRST
         anjU+NvUxY3ID3rUb00kx55NsrJhMCLyo+sg8RE5tcib+FOSLf1Ngt54syjG9tKcu54k
         RHFJif3vi42TGjltg9rbhMLk7kpymIjwW9seM8TzxXwTMYz1laVXq7LOy/zI9OuoD1BJ
         8MDw==
X-Forwarded-Encrypted: i=1; AFNElJ9wtkOVHIK1G2n/5A8GY1bNyx2xShiC6fVXAP5sp8c1Ll+FaTFUOn7LRDZI0KCqQGj2enB7INFU46V6ZWcT@vger.kernel.org
X-Gm-Message-State: AOJu0YyvQ1oYY2Knsa0E/FD5NeX5tgPcyOtqzq7Z5wY/GvbRrykhl4dd
	AQLm8499k069q4Sbv5o26ld9bbanfhgKS6mqncD4yHN9KI+C4B4efwljBq+wlLnalsJsNza+1yr
	APfs+2+GZHDcM/w1EQtiMH5nADjErgzj7vpHcA6ccrpRQpo94lUl0UUwr6R/62qih8tFz
X-Gm-Gg: AfdE7cmAVgoduvZlioPvHnhHKwmhekw4Gbcd2uDjS1yPCYL0oFNUMuPrml+omdO2RxG
	0bvF5NLX5aZPSduFak4NoWaUFm7kiSwVgyBZtS3XkeSKuliOfLeXcWqVVJ5DJRRjLEacao+IpJl
	+mBNNXJTTc8Li/OqCstHm1znYn98q1zTL2RNORTe2uDHNFO9NwrnYhfUN3gSdt86b844nLG4USK
	Lghs5jtPFkm2QNoRV6PZ5Nyf6TM4l4oTkDdeyjGqT769QYfFXJSDZ2GmXUMGols0DhXUn5fgwiN
	VJ54Gon04urg4ZHKSIxurK9uocsmZ6+MMs35BurFuYZM6HP3YsjKNjZonLqRMK7/gkxpiFAure8
	qiAnJSQg7wecW1SVWcyqxKumCznWZu+DesHs=
X-Received: by 2002:a05:6102:3311:b0:726:c60b:e9d3 with SMTP id ada2fe7eead31-72b16170536mr153063137.3.1781874708866;
        Fri, 19 Jun 2026 06:11:48 -0700 (PDT)
X-Received: by 2002:a05:6102:3311:b0:726:c60b:e9d3 with SMTP id ada2fe7eead31-72b16170536mr153044137.3.1781874708367;
        Fri, 19 Jun 2026 06:11:48 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a8490b104sm88203066b.14.2026.06.19.06.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 06:11:47 -0700 (PDT)
Message-ID: <e8a752c0-db26-46f7-ad5d-19b00e0c30c1@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 15:11:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64: dts: qcom: sc8280xp: set GPI DMA channels
 according to DSDT
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
 <178040480680.1778078.1165164069560552075.b4-review@b4>
 <bc4644a6c1e30a99f1ed5d967c64ba7f5da77fbc.camel@iscas.ac.cn>
 <178073773007.397244.9871455646149843167.b4-reply@b4>
 <7ecda3d0f91b0d96bcec44ddf485ed5146788220.camel@iscas.ac.cn>
 <178073918523.417326.15121723011916371966.b4-reply@b4>
 <1c33b1dd7d187b17b21b17339a4f1990e59d2f77.camel@iscas.ac.cn>
 <CAH2e8h7y9PivdMh-h78VSqMf8i2vSR2fvVaO0P1eYBT8qgEdUA@mail.gmail.com>
 <bd5ad1b53eb009377d0ee492b0e007e45d36f6a1.camel@iscas.ac.cn>
 <12a8cc4f-3c45-471b-8a0c-f7473cefa190@oss.qualcomm.com>
 <926a0fe9224d73e0f5e3f58f3769c6247b1cabd4.camel@iscas.ac.cn>
 <7ac67f89-c6b4-4e0c-8eec-1e5c757777ce@oss.qualcomm.com>
 <ab5c5f53-4119-4bbe-88ac-e2933bf6f8d8@oss.qualcomm.com>
 <cd1910faf5b7b20d9154798b05449fe30cb1cba1.camel@iscas.ac.cn>
 <5621f70b-984e-4a65-add8-a9bf42e6c0c2@oss.qualcomm.com>
 <9434068bd7e69c92fed5382bff2479d4fc0e4bf4.camel@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9434068bd7e69c92fed5382bff2479d4fc0e4bf4.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Lao8ppYZqlwcM_vB4hKBdyneCb6GXU5z
X-Authority-Analysis: v=2.4 cv=aOHAb79m c=1 sm=1 tr=0 ts=6a354015 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=fGO4tVQLAAAA:8 a=6gIg4Y3sYP9ApIHZztMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: Lao8ppYZqlwcM_vB4hKBdyneCb6GXU5z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDEyNCBTYWx0ZWRfX2g7WdKknTwab
 eYQq0pIiAdtrkYlvCToyjNuBwu52gqkcmx6NaYgK40biT/CUyJ58eG86eTVlBwq7tcZcLmoZb1e
 5k+Z+GdMcCP22rCfJ8X6+aNUAvbMfZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDEyNCBTYWx0ZWRfXzFDANqryrU9U
 RkyWMvv0GN4Tlr0MnAl9jJ/6eCXlievAVoOMohJ7wNJGibn/UjdbVqph+S/1m85nGqXE+e/QBH2
 ZBgflaZTVRTIRtn10/ZK6BGyEmH37UoIKN4OUI5zRd/pZnL7mll/XjAge6GltTlThQ8sBUB9J4S
 eOe3PeWoY2xU1n0olcHhle1FYJb+MXG3VegS7pOd1UoJAtpfvRXi1EsNp7aUi3zYH2/cg1cyuIz
 SE8op3rH07EVOmP0/PoDwejgk7+aUsSL+sL+yDAmGS0S/UHItVg+KLxNYp0JFPoGCD3Huy2IoZY
 K6q+mxsERmIH+mQo0/JB+OAq8D2A0wvWFhDU9d1D39Kx3Oj5zQnh38YU+jmEzmmU+1QPyn5Yxlh
 lw0ETiE3Cq2zohA2b0CJemXvKtL8Mp6Mtr8JU13KN/3n5tjDzwBJonFbWH/+jcUFZtn9mlPTAb5
 cmi0+wLNVGXq97BkjFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113847-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,iscas.ac.cn:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FREEMAIL_TO(0.00)[iscas.ac.cn,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:zhengxingda@iscas.ac.cn,m:mitltlatltl@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D4F26A5FF6

On 6/19/26 2:50 PM, Icenowy Zheng wrote:
> 在 2026-06-19五的 14:27 +0200，Konrad Dybcio写道：
>> On 6/18/26 12:34 PM, Icenowy Zheng wrote:
>>> 在 2026-06-18四的 11:05 +0200，Konrad Dybcio写道：
>>>> On 6/18/26 11:04 AM, Konrad Dybcio wrote:
>>>>> On 6/9/26 5:54 PM, Icenowy Zheng wrote:
>>>>>> 在 2026-06-09二的 14:23 +0200，Konrad Dybcio写道：
>>>>>>> On 6/7/26 10:49 AM, Icenowy Zheng wrote:
>>>>>>>> 在 2026-06-06六的 21:51 +0800，Pengyu Luo写道：
>>>>>>>>> On Sat, Jun 6, 2026 at 9:21 PM Icenowy Zheng
>>>>>>>>> <zhengxingda@iscas.ac.cn> wrote:
>>>>>>>>>>
>>>>>>>>>> 在 2026-06-06六的 17:46 +0800，Pengyu Luo写道：
>>>>>>>>>>> On 2026-06-06 17:28:35+08:00, Icenowy Zheng wrote:
>>>>>>>>>>>> 在 2026-06-06六的 17:22 +0800，Pengyu Luo写道：
>>>>>>>>>>>>
>>>>>>>>>>>>> On 2026-06-02 21:21:27+08:00, Icenowy Zheng
>>>>>>>>>>>>> wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>> The magnetic keyboard (USB HID) can't be
>>>>>>>>>>>>> connected
>>>>>>>>>>>>> somehow,
>>>>>>>>>>>>> others
>>>>>>>>>>>>> are
>>>>>>>>>>>>> fine, such as the spi touchscreen (not upstream
>>>>>>>>>>>>> yet),
>>>>>>>>>>>>> which
>>>>>>>>>>>>> utilizes
>>>>>>>>>>>>> DMA definitely. My config is here
>>>>>>>>>>>>> https://pastebin.com/SdjuyJYk
>>>>>>>>>>>>
>>>>>>>>>>>> Is this a defconfig?
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Yes.
>>>>>>>>>>>
>>>>>>>>>>>> BTW it seems that CONFIG_ASYNC_TX_DMA needs to be
>>>>>>>>>>>> selected
>>>>>>>>>>>> too
>>>>>>>>>>>> for
>>>>>>>>>>>> exhibiting the problem (because there should be
>>>>>>>>>>>> "public"
>>>>>>>>>>>> GPI
>>>>>>>>>>>> DMA
>>>>>>>>>>>> consumers to trigger the stuck/reset).
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Is this still necessary? I checked the fedora
>>>>>>>>>>> discussion and
>>>>>>>>>>> your
>>>>>>>>>>> GPI
>>>>>>>>>>> DMA fix. And GPI DMA is only for the QUP-supported
>>>>>>>>>>> peripherals as
>>>>>>>>>>> the
>>>>>>>>>>> binding mentioned,
>>>>>>>>>>> devicetree/bindings/dma/qcom,gpi.yaml
>>>>>>>>>>
>>>>>>>>>> The devicetree without this fix seems to be still
>>>>>>>>>> incorrect,
>>>>>>>>>> because
>>>>>>>>>> with the device tree fix even if the GPI DMA driver
>>>>>>>>>> misbehaves
>>>>>>>>>> the
>>>>>>>>>> system won't be stuck (although it will iterate all
>>>>>>>>>> GPI
>>>>>>>>>> channels
>>>>>>>>>> and
>>>>>>>>>> then fail to function at all).
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Back to the start. You said some GPI interfaces aren't
>>>>>>>>> available
>>>>>>>>> to
>>>>>>>>> HLOS, your mask is 0xb(0b1011), so I use 0x4(0b100) did
>>>>>>>>> a
>>>>>>>>> quick
>>>>>>>>> test,
>>>>>>>>> and spi6 consumed it, no stuck or reset. Could you give
>>>>>>>>> me
>>>>>>>>> a
>>>>>>>>> unavailable channel?
>>>>>>>>
>>>>>>>> I think channel 0b10000 of gpi_dma2 could be an example?
>>>>>>>>
>>>>>>>> It seems that 4 channels are tried on gpi_dma2 before
>>>>>>>> hang on
>>>>>>>> my
>>>>>>>> gaokun3, but as gaokun3 has no known serial access, it's
>>>>>>>> possible
>>>>>>>> that
>>>>>>>> 0b100000 or 0b1000 is problematic.
>>>>>>>>
>>>>>>>> (The reason gpi_dma2 is checked first is because it's the
>>>>>>>> GPI
>>>>>>>> DMA
>>>>>>>> controller with the smallest address)
>>>>>>>>
>>>>>>>> BTW I just took the values from Windows DSDT, which is
>>>>>>>> quite
>>>>>>>> conservative.
>>>>>>>
>>>>>>> So, with DMA_PRIVATE set, is this series made redundant?
>>>>>>
>>>>>> I assume technically the trustzone is still protecting some
>>>>>> channels,
>>>>>> although the system stuck issue is fixed.
>>>>>>
>>>>>> This series should still be relevant, although not so
>>>>>> emergent.
>>>>>
>>>>> So now we're down to the case of the TZ reserving some of the
>>>>> GPI
>>>>> channels (presumably for locked down/TZ-driven QUPs) crashing
>>>>> the
>>>>> device on access, is that right?
>>>>
>>>> i.e. now, is requesting these channels through (wrongfully)
>>>> enabling
>>>> the devices in DT the only remaining concern?
>>>
>>> Yes, I think so; although I think few devices will use GPI on these
>>> devices (usually only one or two SPI controllers according to the
>>> DSDTs).
>>
>> IIRC there's a configuration table that lets OEMs decide which ones
>> should fall under the secure umbrella (although most never seem to
>> change the defaults).
> 
> Ah then what's the default value?
> 
> Radxa Dragon Q8B seems to have GPII0-5 enabled for all GPI controllers

This matches what I can find in the default config

Konrad

