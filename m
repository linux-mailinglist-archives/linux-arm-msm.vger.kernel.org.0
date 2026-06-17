Return-Path: <linux-arm-msm+bounces-113627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +9ujKQeVMmq72QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:37:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDD4699C68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:37:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V9pl7CED;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BkUhbifj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113627-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113627-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9CF57300C838
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944E63C09E5;
	Wed, 17 Jun 2026 12:32:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AED93F0ABE
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 12:32:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781699551; cv=none; b=gdNbQPPJSaudDXusxE0iSA55+7sO5FPzBoufUHW0sBwWLhpZPpSsxn7IZajc7lDPB0WcIK5iHOB4/i4cZdnXUCkfCoVa9WFZ5wtGQztfjRUrLCNgp3OqbffI1OXp26mxwT7R062syzNZyh2V05eJg8OGwDkhjIdSpG7yI0gteDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781699551; c=relaxed/simple;
	bh=eImam8Oulaaub6runznnBN0u0zV1LYUj7oObPpei2uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XTTJcExzvLJTp+EUw+zIX5FdHzTdjqD3bPbKMjS3S24lEoUQP/9+s+Yykun/MNY5s3+8IMVo1vm1IJhhmMt0htdOxvsn+TEjvrhnXIU5Nxr2i+NJQXEg2LvSR9hC+NitHwIPJI9wE6U3nj/XKWhd1xchLJOy/3UA3oB2DPmBj/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V9pl7CED; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BkUhbifj; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UXTN2217643
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 12:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a5iNzxVd33WkrbtRaqNOqht3QFH5J10MzySisKluWjQ=; b=V9pl7CEDHUG+gqsz
	pBQ6DkR/9/2Pt4Pv/aVkQmnPE4LbLqdEb50YNmjq6H1Tn5JvG+f4GmX+ZhWLtNg8
	0MZGFymJ7oG1sS4wyfLjomZ1G3iXLGzaG9jSPPbdGquXQ+SW6hG0Bz2jd8E9D0wW
	YFjcA1SFJktbPuDr8Aa1H7EXQbyIBkGh4sEaa1VNQ7eqeIae48ue2+N2sz0fXP6e
	GjDKOQ2mAvcrRN20CfEmoa3h/AjC9UiVCtfsKzGzqvZD9y4997JQnJtIWwnwB2au
	h34lAn98jUnU3C9ESoHljHnquz5F+VRlx/Gp0xNb2a34ZHlIY8MpdaN4Yjew5upn
	6Mrzdg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueerb5my-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 12:32:29 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7270ec494f6so1759137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 05:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781699548; x=1782304348; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a5iNzxVd33WkrbtRaqNOqht3QFH5J10MzySisKluWjQ=;
        b=BkUhbifjs7duvvmQEVb10liu9INJvF6Hi6YYbVeU0AX+yBOTx36QkOg8RsiDLRvsTU
         Dr2MsKSFDnNz2e4cAZ5YsNnE6LDy017XBMBcX17C39c2792spt6zxygsyrcqAzeSdFyi
         gKH8rSh5zLSld9yXKjhmId1UbSibAkXwZAjUD2JPmHH2jAMBY0cYR8+Jssow0F7PRcVL
         0MuPKyi6yVK2OAt0XZ+V6TnHiRta/IWkvNLh1Fwj9wKoOlt5vfzggrgL6+8WA+/WRciS
         x7hehD4rjnaHntAilpRAgBgxUt+TyKF1z/5HOezCqhakQmuu4hxHGU7TeRd0DS8kxarx
         5p9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781699548; x=1782304348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a5iNzxVd33WkrbtRaqNOqht3QFH5J10MzySisKluWjQ=;
        b=EPGc6eg6Ll5FC84sJMHzZ78pwRUHBbmnJ2UWA8wqVWopTQgq2puQ1/4OxKfwQIrNDi
         IANeXmf7hjDsQrrupBs4ql5iUe5Y4OP0MCZTcoilKkZHCy9NA70Q9e+2tVxXPIj1xjYX
         YY4ggQwadcC1WnocGlmeYTAL/RFKih8c3p3oLDTPWd918G4dx2oWCUeJZfvRZ7f+5+5O
         U2E/OtLLEW+VDSaWkIeoKa1XM/+Mpul3YYU/aniURgq29Gax77c3sI46q9R9oRITaPNA
         5WJmTOjHr9IwDESrunKj+lf9j8nI4fai4HLxLxjkgrMTMpumthtTWUCIQ3XCuUHQlE4C
         bu+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/Uvb653b1MUjmy5mVdzj+ol4rEC358QI1fryRLTIA4N/vFRatYoRngY3c1oAPk9nR37cqjiJ60nnTHyn4f@vger.kernel.org
X-Gm-Message-State: AOJu0YwV36WwTt5y5oiYg3ueOFV4lYd33MjAWXgJTOrwoRDwCkKBj5FZ
	YJTKQH43LwB4/0u5gfgsVpj1spYzmKRR0kXZKTggPvBgUHUGvGhTa+t7RuLC5OpVPjXpMXoXK0g
	Tno+Zq9TDCHplRKBXZIDdiekUEPylojfn4CW1HaDVnYekt6POrJ/ZZyUIlhN1w6AelLOD
X-Gm-Gg: AfdE7ckshYvVzCKHTycrmjPZe3UUMcVTb9O0q69PaQOinYcuWTokto1etk4+RUz0AF8
	5Nn5iF9rJM7FxhyohrtAKcLWagNsUm2ErkdETmPenXuJAo/ZP0x3ICiL8VB0AFPNMdXxwxgt54F
	07OS9cPmufkT24L3+awhcQZu+IysZNVj731pGLOKzmenKzFknBT6MxkDrk3hjkK1uUBGYa1nlN6
	yO5YJlbjY2UAdndkmSIYnKqiy9Yfb6rQU+u0VaNC4pLTysP31nx7GOlcpCLvq4aXwX8T5BqA/it
	ItOhTGtm9TPbKVOuLeh+d28D0DbeFWhktrQPL1jmwVWnOmKGf5zbGbbIu5Zl9VuXzULUMH0eyQl
	nK0qCUtrOwb48JIZGd/m5nBivemWmv9lGiwU=
X-Received: by 2002:a05:6102:a50:b0:632:5db8:f656 with SMTP id ada2fe7eead31-7246c894f83mr620492137.4.1781699548528;
        Wed, 17 Jun 2026 05:32:28 -0700 (PDT)
X-Received: by 2002:a05:6102:a50:b0:632:5db8:f656 with SMTP id ada2fe7eead31-7246c894f83mr620470137.4.1781699548137;
        Wed, 17 Jun 2026 05:32:28 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c06607d10f7sm63121766b.10.2026.06.17.05.32.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 05:32:27 -0700 (PDT)
Message-ID: <285a7d06-cabc-405a-9414-dac0dfa1736a@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 14:32:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <7f1e46fb-15e3-4638-9930-8abc1dd5a778@oss.qualcomm.com>
 <fcf93e0f-a2f0-4070-86ec-8a34e9344b76@kernel.org>
 <ec65893d-873a-4a62-b0e2-5008b2130545@oss.qualcomm.com>
 <3cbcaf8c-357e-42d2-91c1-9d1a32c55ed0@oss.qualcomm.com>
 <ae43a691-4879-4bfa-8c7c-1be16945480c@oss.qualcomm.com>
 <9a31bb29-75d7-42fa-b8a8-4155cf85cadf@oss.qualcomm.com>
 <hebyboondtxyyetwuwggoiysurz335xzn7asf6yit3qrexap3x@kngk2m5xum3x>
 <93e7251c-c75d-4e43-9ae2-bf485af58de3@oss.qualcomm.com>
 <mp2hl67rupxrssa43dcy36m3dwatlxsu7n27l7qdqsguo5i3bp@bo6sdzxglxt2>
 <dcdfe9f4-aeec-4d85-92a1-a42592fe11c8@oss.qualcomm.com>
 <4gs664zboaqgpok33x7bgorfmhh3f2fahjkt4jjl6fbzpwixnm@hxzz2xeogd4k>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4gs664zboaqgpok33x7bgorfmhh3f2fahjkt4jjl6fbzpwixnm@hxzz2xeogd4k>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDExOSBTYWx0ZWRfX6k+48xNhtrAD
 k0AYh2In1RIHVvY54+mhUPHrDl4bRiKHP+LyURc6pPIeB4NoCNIQvk7iSZ21GuDo2Awc1FEd1gC
 +2SHFQWrpFM0CXv9FihYHLvsR20UBRM=
X-Proofpoint-GUID: JdoIS6KQSWMB6FrhJYs5KsBcGKyhb3yJ
X-Authority-Analysis: v=2.4 cv=d4fFDxjE c=1 sm=1 tr=0 ts=6a3293dd cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bGR7GFRD2bAmefyIwN8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDExOSBTYWx0ZWRfX3s/KiHjMDM0v
 Y6GEnUMwAjTeEY2jtnjKTrG+RbmyfdCYFa0mjDAGvyjP3GyZCsnXwMHVAPy6zedkrc1Cm4LqXFN
 9HWc6IA2sEWDYLUzvi7x54TyowygfGOQKkPHEMacKwVRXZOP+KuWe9AkKYfMDruGysS3W3hB7Gy
 ZkkqS74vXAOQ7K5B37NJxP3v8EZh5lLATZlXrQWI4g/ovMnWSyt5icQ7mpUYJ887298eZPktGn8
 411w10n5rm7HKUSuAGFNX8xwO0ycbMBgKjoIYdGOdfgNTMLJI5Llzh3rs0s2tT4Urodb4UI4G0k
 uKnskCHkJkRAmpwLbkFVhK6OfcAqZgsM7qqU0bMK8vdl0ayPSDWZsUiUN9G3yWoovawoOGTQaQ8
 whHU2iPgjkWcRiC8L6l5r+khk0JlYjOHOuEHeWS02wQlz0e1fEfgz7bWWbRahnZu2x4FPTyvGkH
 gC3RjsvCEBxtaLRhEug==
X-Proofpoint-ORIG-GUID: JdoIS6KQSWMB6FrhJYs5KsBcGKyhb3yJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170119
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
	TAGGED_FROM(0.00)[bounces-113627-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:daniel.lezcano@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:krzk@kernel.org,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EDD4699C68

On 6/16/26 12:15 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 15, 2026 at 05:33:15PM +0200, Daniel Lezcano wrote:
>>
>>
>> Le 15/06/2026 à 17:14, Dmitry Baryshkov a écrit :
>>> On Mon, Jun 15, 2026 at 04:33:38PM +0200, Daniel Lezcano wrote:

[...]

>>> I was thinking about something like:
>>>
>>> #define QCOM_TMD_DSP	0
>>> #define QCOM_TMD_PA	1
>>
>> Ah ok, it is correct if:
>>
>> tmd-names = "dsp", "pa"
>>
>> Or
>>
>> #define QCOM_TMD_PA	0
>> #define QCOM_TMD_DSP	1
>>
>> tmd-names = "pa", "dsp"
> 
> I was more inclined about having the standard indices for the standard
> mitigations.
> 
> BTW, I checked, which mitigations are being returned by the DSPs. Few
> examples, just to provide some context.
> 
> SC8280XP, X13s:
> 
> TMD service: instance=0x01 (adsp) node=5 port=9
>   1 mitigation device(s):
>     [ 0] cpuv_restriction_cold    max_mitigation_level=1
> 
> TMD service: instance=0x53 (slpi) node=9 port=9
>   1 mitigation device(s):
>     [ 0] cpuv_restriction_cold    max_mitigation_level=1

So, are we converging towards something like:

-- include/dt-bindings/...
/* Common indices for all devices */
#define QCOM_TMD_FOO		0
#define QCOM_TMD_BAR		1

-- qcom_tmd.c
static const char * const mitigation_map[] = {
	[QCOM_TMD_FOO] = "mmw_skin1_dsc",
	[QCOM_TMD_BAR] = "cpuv_restriction_cold",
};

...

static int qcom_tmd_retrieve_avail_mitigations(...) {
	data = qmi_get_data(...);

	while (data.tmd_list++) {
		// mark available on this rproc
	}
}
?

Perhaps split from a global index space to DSP-specific indices
given Dmitry's list that reveals there's a lot of variability?

Konrad

