Return-Path: <linux-arm-msm+bounces-117183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NbmaDh23TGpfogEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:21:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A76D3719053
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:21:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OwR7a2IU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Xe420YBT;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117183-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117183-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A0C61303F443
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 08:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6325F314D15;
	Tue,  7 Jul 2026 08:20:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7DA30E828
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 08:20:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783412415; cv=none; b=UKCTCNxXuqsRUCchjrHMQcYt4b3Fb1daDhYdQO/YYewm7QqvNL3PH6YNMwkQdzfAeE8efbi072EzB8zxAbEZvKikfbYH1guSTPB2ZyQm1GY5rcMoIlda8exsbWvXzOpU380E7V3h1zUXqYWlXhPOgTFwswKbN8v6+pEP9O/IgKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783412415; c=relaxed/simple;
	bh=n5OeMK1bQ8yHLqI/ZoKerpO3/6fLbnwqt2JRjj+RJ4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DSp1rAUm2c8Z/Z3Jmje3gnxNxug9KGQ5UH1H4kzElyGIMXI2mLZQmZ3ZKBoCg086g4LOTg9fcJnX8J9HEzWwQjQ7FXgyJ5ZdadLvIyP9o5OpIYJsBStvojqeCDfJ1C1AEs1OxSDlJNzeWw2LFmlOmdr6fBq/b06Aw4IMpDjfapY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OwR7a2IU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xe420YBT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DlHI3138657
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 08:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ajiWotAS1acnmFOssC6CEZcKuC/BL6UhgNsm6/8ZsA8=; b=OwR7a2IU4grZsFRg
	tJ10AyJ767+wHooZigQqyP7lwpzdi3QdLvIFSI4IvL3agnXL0xvBSDDMx7nbEbDe
	w046s+2s6XOJwzSDHgfaVnQDNoc/rmfbOQDjlje9RH1Ypz8ZJ5fSr4cEIzKCUtLP
	bEJiKt9Ysv42GJY9bXE/vKCxsfnAFfLK7UvWZ5Zjx20ZA1cmi6kdWRvE0MWwUQAo
	GlZaKUAFocOyJw1gCeyHUG9jpPzXc4tBApLe4hOpkB9ujldJD3nEAy30/fcub8k7
	x9Mc2WAvq+QuwW0j+jldxp+LNsSrO2+wBXd1+2MEmrkf5boAOistFdWg93RmPguL
	b9R5ig==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t158y71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 08:20:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a23afcbso39603401cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 01:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783412412; x=1784017212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ajiWotAS1acnmFOssC6CEZcKuC/BL6UhgNsm6/8ZsA8=;
        b=Xe420YBTDB8ViKFq1iQ2h0qKaMYnSJJsk3XX0UvTMV/M8watLhvVPQ2T8O2utH3qk7
         1pNp1pO3pTWRbzkNeRx9E0z9G75WsGJfKZkXmRJDLiQlaaF9hYWm7tHfUdvhem1eS/2p
         n6Zr9KerH5ltE/O7VdRGo0TeOXoifP6jHXgjkhqijyrkDKQYuxj043wH4ZEKw7AK8zgJ
         nUs+xP1IeqfClqR+BxeW+LkM7PqjUcsDuSXpP2VgH1+rQa08RzU+K/eG5Ii4ax/z+xp8
         k2p0b052WNVKF4nQbQkmdYk7Ii5bK7uk2i8ORCPOETgHfugKBChzGwWlAoHgwxHKqzhZ
         wYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783412412; x=1784017212;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ajiWotAS1acnmFOssC6CEZcKuC/BL6UhgNsm6/8ZsA8=;
        b=qwxTXUZ9cMVVmFWkDSHfubXUiYL2gONwD5wfhD6ngc8WBgtsgox33Y04axGVNcePPA
         oR0XNZmsBd4JWOBhJG92b//o6IaCJFauVMV02TXmb4Ylo91EVdNd+WD7/Dts1Ia5i78Q
         G2WF+uhBraX6mYmiKSS1lTZrpM0JgkkmHYIqRQwojYL/gp3wAynhCUvinm5ZFQy++T3K
         OKPt9vvyfRdvwYFTSEI3vUjxwREMmxiUshBYW0NUqVrmmjOTqsIYOn34M+Rw9lSlbZ5E
         ThBr9fbMUJyWR6XE2bGmN9D9sHn/hbvnIyKOpWBPjrIbqYvrvrLbbmM4PJ9fsJzrY/fX
         LUPw==
X-Forwarded-Encrypted: i=1; AHgh+RrlYgbyAQu8y4iZ/HilM3Dv+bkGIqw93H/lZ8hkxM6Vfh2vV4yc+FMuELKIHH5JCbEuAhbYT0yh8Ekjf+rA@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw9jucVdpYFs2IuZO4OFDU9QYkp/wwBN6SoWSlqit39JKow1aV
	vkNDgan1bKZcWW86ftJMrdy+gsJPcKgp0dz2wHfRv1KHdBRdPfQpJwOt/PaRc/Olm4cbK+Nui3F
	DHWMq1zF7aE34jf2dT12ULewgPzirtJW06UVOMNeFqTtDWEpHsYhLX7Enaubz/B0FA3fD
X-Gm-Gg: AfdE7ckRAaL1mq4N+/IFpFS7qYsFsU989xOmM8ljK88xEQVPyb2XNM4O2pIXbqzluuo
	4ZUSnMHwpIf3lfB+gEETUJ9xZrjEPhjv0I+sFkbQAwRgHpBbsMDRauGkaDItiFLPQXVsc7l8raA
	wRue/42mRLBGsLWMnyowrXJqAoFKwTVbuzUgiEsfozYvI93YTyznG8OiVDcgNIOqrtWj4o3HHDC
	RBYm3QWYqyq9rcQxbsnR/lrTPfkINJqFKnlFLNfWu8pTPll6wxAObvfcUiJpGoM9htg/dOT117B
	f3nhzDcEhLaEXf+TP1Rx21I5zq2XamREAUmDSdW1wUhVHY4ieAdOPHzPwDYb45Nfb/F6TB3kPxy
	Rf+xxtdCzpD+ulGdeKgYQjU4t9Xk8YE0SP/FUSDqTggxyNY2nwO8MxgHnDYEB7PIjgEoRfXAI2A
	==
X-Received: by 2002:ac8:7d0c:0:b0:51c:12bf:d4a6 with SMTP id d75a77b69052e-51c7487df08mr45476111cf.48.1783412409852;
        Tue, 07 Jul 2026 01:20:09 -0700 (PDT)
X-Received: by 2002:ac8:7d0c:0:b0:51c:12bf:d4a6 with SMTP id d75a77b69052e-51c7487df08mr45475921cf.48.1783412409444;
        Tue, 07 Jul 2026 01:20:09 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f32660sm37747195e9.2.2026.07.07.01.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 01:20:08 -0700 (PDT)
Message-ID: <38f5a2ec-ddc5-48d8-b76b-c2ed617392ca@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:20:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: embedded-controller: Add Lenovo
 ThinkPad T14s thermal sensor provider support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
 <20260706184648.35613-2-daniel.lezcano@oss.qualcomm.com>
 <20260707-armored-azure-terrier-4dc3d3@quoll>
 <8d579153-efa5-4c8e-acae-87f3bdfbfc24@oss.qualcomm.com>
 <457242e3-6a40-49a2-8d86-214f9167a928@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <457242e3-6a40-49a2-8d86-214f9167a928@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: f0WRvH2u4U8IeNHkKPjPlOdtymdFIM_y
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4cb6bc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=qYa7bHtEPbO8xArO7mAA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: f0WRvH2u4U8IeNHkKPjPlOdtymdFIM_y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA3OCBTYWx0ZWRfX6kFjz5npsXfm
 n6ZTGydWEzMK9SDZkSI74X66Px6R4kR/lq1+iqQ9M441jD6pCIfQ5OPiKzndaFtnto0X9CxVdMm
 UTjsNhh6cdenK2MkYi8M4s3HLfr6bCo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA3OCBTYWx0ZWRfX/TbjmzEIRDYe
 lKkF8mpZRN9n1Jddo6o0FkDQRgkZ/NEyCkPY3HTqPSEUYcXBxW1Wv/R4HMBQNicQq7R5tGTIjVm
 zChXhFiV00BdNXbWeNE7rv/yia0Hjxt2NxdOpU7hE4kIIXhx9CoeNgfeuF2tsqVzNfFSM0jNrMG
 e5OVUoO2hbS0w7EQI/OouWNBzLeoe08ZfFGecRrqnr6Ky2Nbwgkn6xnWzOj+3dUmHuO2XWKKeJC
 RBQWO8WDyYlqcRwrLyw/b6AWvWhV23GGMmzLjHP2mOd5rbsku7KzQOXJxe0NBWBch4wnN9XTIVf
 VlPBPBFVoLsj0YVSlw3cI68Aghm13355ONqa4chue6RhLt7kjknPlhTnsCTkgACR37Lprk8Ea4J
 eclGmLtTIdyUKWGgMmWlfyCEkWpsJeCtuCLZekGvwyXd3Pd33i56RsX4qbbkmZt2RcLrWUHrl1k
 fNJj4znOJ0b+F3tXEug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070078
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117183-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:gaurav.kohli@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:priyansh.jain@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: A76D3719053

On 7/7/26 10:09, Krzysztof Kozlowski wrote:
> On 07/07/2026 10:08, Daniel Lezcano wrote:
>> On 7/7/26 08:38, Krzysztof Kozlowski wrote:
>>> On Mon, Jul 06, 2026 at 08:46:46PM +0200, Daniel Lezcano wrote:
>>>> Document the Lenovo ThinkPad T14s Embedded Controller as a thermal
>>>> sensor provider by adding the '#thermal-sensor-cells' property.
>>>>
>>>> This allows the EC temperature sensors to be referenced from thermal
>>>> zones in the device tree.
>>>>
>>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>>>> ---
>>>>    .../embedded-controller/lenovo,thinkpad-t14s-ec.yaml         | 5 +++++
>>>>    1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>>>> index c87ccb5b3086..0d049979e35b 100644
>>>> --- a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>>>> +++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>>>> @@ -26,10 +26,14 @@ properties:
>>>>    
>>>>      wakeup-source: true
>>>>    
>>>> +  "#thermal-sensor-cells":
>>>> +    const: 1
>>>> +
>>>>    required:
>>>>      - compatible
>>>>      - reg
>>>>      - interrupts
>>>> +  - "#thermal-sensor-cells"
>>>
>>> This looks like ABI break without explanation.
>>
>> What would you suggest ? explanation or removed from required properties?
> 
> I don't know what is the explanation. If this is actual ABI break as I
> read Linux code, what is the rationale behind breaking real users?

IIUC, if the DT has not #thermal-sensor-cells, but the code has the 
patch 2/3 then the hwmon fails to initialize as well as the EC 
controller, right ?

