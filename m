Return-Path: <linux-arm-msm+bounces-106580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMvBOsOB/WnSfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 08:25:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB09D4F26EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 08:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BE83B30011A3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 06:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3689833DEC0;
	Fri,  8 May 2026 06:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QssvYCmm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QTOqv23r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4246355F2D
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 06:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778221490; cv=none; b=K66QyZu2FFH01i4a6yrUnyhD9BXUR4J2gAhUTcrT8E2hMQgdFUYvEFAlUjwk7svtZ3WwErMicYo4riIpYnGqakVCliR37n3AURgbCVN/JAbaAxW43sAkrvVWfP4YFjg1r2Ere3XBSq4R3QUqjTY3WgP1eRjjAMbIiuFW2G7POuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778221490; c=relaxed/simple;
	bh=AYucIGE/XxHjtr30OpowBjVhJAyxN7nxsd80Fvb+b0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DBrnV5kmQBw9uIzmrPTc0W3qdsAZnxxWRlx2+B4D66np1gD2FN+7+dRFOLfVRY023zCKQ230IZ9qaLNtNxomXXOau/wowh6HwGB0phI/VyjM6Zhp6rixCSJUAt1Oc34QSsrAqVzxBI1HYIvthug9wZoSw1eu2NBQOArMO7l14ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QssvYCmm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QTOqv23r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64816Y5H2384376
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 06:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ObJL9sENHeTc1JXRa+Fb6potoCEo6WZOsrJoz9aAaYE=; b=QssvYCmmJW20hBJv
	fhGHJM6VU7h1I5BJwrPVZnHXt9udku3Ume7w2zFsCVcdwjBF9u5bB39LX/SL+4Xb
	7dyqqzHL9avf5OfOSO5WcVNJeKCa65vX3hxh0iKDEp1Y6ZE6PojzqBc1huMHpn0Y
	2MEwZ8lMKUaXKNt4eSRC4gJQ2uLfEC5mwvVtiAWA9tw8OwKBo0NMTDkFON+3e5Z0
	KZzZWsjNTwdsXl8QOVvSKQT1WZ2dLi6rcTa2DXtxuf7Lf+Jqybh8Znd0N2hpeQCe
	g7z2ZFukfT3keloBYocKHTq5CyqHIdQV0HQ9xaPRd0cnXQ5objNa2Ra1UNWrx8RW
	+ghGPw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwujqch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 06:24:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f7bec24fdso1071038b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 23:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778221483; x=1778826283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ObJL9sENHeTc1JXRa+Fb6potoCEo6WZOsrJoz9aAaYE=;
        b=QTOqv23rqawTOqRpfxLVyFWg8CSxoGJn2kNBnNdusqUw+m0ZFIj9hZhOS/WqlsNqVh
         38ywT6q681xIA4m/mOeqANq6gymYlY4MBQ1ioNA0DGCcr94rf8I57YyXbMzdE5QAHeI7
         ryTuuFzr1W+PendXMSI7IDJy4qAf/YQfcFd2hRjdEfrk4kD5Dwk59SOO1exBbmFWXLrh
         J6MM11W5o+2Oxi4jKUBSWBXihb8AlCqodzB6ugxWYXsAM32X50XMuoTOI7lVMUVZLfrz
         oHa09f1dxWRTGxy82AovWr+EoGXtXmxlERy0pULdKwtcIeXnkJfliYY6FtHpKkt48Bfz
         1a+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778221483; x=1778826283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObJL9sENHeTc1JXRa+Fb6potoCEo6WZOsrJoz9aAaYE=;
        b=I00+pf5F96DYjaASvxbbQNMXHrcPkjJIK84NyYbnofJn+iljaZXqKrIyhrGS/rXkfr
         7hsdTVENJ4wIjoBp8OBZmAmB2QZ/Z+CBcQj1aUkw5mSkscvX5Boy6JXlDZIpn0cd1AMr
         KeO5TKW+E+m4cMR7j9TvHz/8hPmt/+uSeFXaSnfkK4r2jk/0A2hDuGm58VMdV/+4j7/h
         vgVtq5cEoyOuZYxOYsqy7aQe2IfoJq8Vjo7+GHIPX51IN9xVYQYjpPjkfo4zUavwlNTS
         IZApjr7Si2oqQtmUyOxWt7gYwXUkRw/XRkXFYfEUy1YJy8hWYXnU91z82MPGySFiWTzA
         H8og==
X-Forwarded-Encrypted: i=1; AFNElJ8yXw9D/7ffUomf7n8He7rkvK3F1AtO1Ga5o73JYX4WMoKcMSgU+jpBrL4sreYa0RwE5jPKksBWINEsTlDX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq/kOzpf0hm893FmZ29VZ8W139SSMFe2B1fGGPO1IjkTm82nqD
	tnpQVHVGexDMTHESBZIpqZkZthwLtfP/qicsOlkn0GzMpgOEkyEeGQ1yZPdCj3QAn0JwlyDFdm1
	AVwhxJdLwpSiggviD1Frvaki4k3WDz1vlNRFgLn+PGOXwXk9dTTmUUuCPxsB8jENgbOfC
X-Gm-Gg: AeBDietNu/Pp1rIxEyv2FWrJT0kDTpBJgSMGyenvcILuS9bYRTBci96i7Dt2UjJjRUI
	7o0DI6ELMp0FOGoulXe3SxxIt9bskalWaTXbYDBqGdLx0ZiHi/3Rl8JIrsiidBNRjgfjvaaqoTN
	bxfJGrd5MAbK3sxA150i/wiZJCk+kxWbwNRjhKlIaQHqHCwRPyq3Xg8rSZ+5lR67mXfDBvB0j7y
	D4uIIqVsRX+Jgd3wyz/OzQdjbH9UpwdmIMl/Uh9lhbUvXeZ1ADP/nO+kNWoV4vKQ6wrZU2taMcd
	OYLRnqiO0B4JNqZNVvvXojBejZqNLVZXWJU6crOGQ7hE6BZLZcrBP/Sa52cvLPr2vVPFNM/tjK8
	+y44PHje3jM/j9c1wBlyfiPBo4snOfeJ8b28BTDmALp/JZNXC
X-Received: by 2002:a05:6a00:9096:b0:81d:dd3a:b8f5 with SMTP id d2e1a72fcca58-83a5dc5ed7dmr11395755b3a.38.1778221483224;
        Thu, 07 May 2026 23:24:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:9096:b0:81d:dd3a:b8f5 with SMTP id d2e1a72fcca58-83a5dc5ed7dmr11395720b3a.38.1778221482631;
        Thu, 07 May 2026 23:24:42 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682abd39sm10888950b3a.52.2026.05.07.23.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 23:24:41 -0700 (PDT)
Message-ID: <1d7141d7-3440-4360-bed2-d690fb30a116@oss.qualcomm.com>
Date: Fri, 8 May 2026 11:54:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: firmware: qcom,scm: Document SCM on Shikra
 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501-shikra-scm-binding-v1-1-93d7faf1b784@oss.qualcomm.com>
 <20260504-utopian-civet-of-symmetry-ed48a1@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260504-utopian-civet-of-symmetry-ed48a1@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OF-Kxl7-iT8i0I4wVbUT3XYof_vDqupH
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fd81ac cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=212fnMXnYh6t1oBpmLEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA2MCBTYWx0ZWRfX+/E6jdxmGY+V
 hCvxEhdJoKdZgQSu6C4Dv4dC+oBUqF1nixj+tExzf2Ft2gPW+dis0mwWY6Y8JJgAjH8BPht3tuy
 9hWVu4OwnmuWWjwRM//hvaZqvHvWVeeuoTVsZALTXrsU3z6IX65nyQ56Y5OLzIZM31yVZxZqXUl
 UofLpSP6WGrzejDZdfQQ+NqBtTviKAEyYn8e6TpGWSahO/x6oQTN5Y3j10CJIpNXXjwZdeba9H0
 e25PsypPCl+6mOlnaVZUkpCB3Vkhrf4sLQwsx6AEhK7Vlqe6+2mspHQ4rz7L7me5rzMqg0S6nk2
 XK8/SLKvAWnqiEyhSTtGSyJ6m43LiJup0dwrYRFDhk6LE5Xb2CsUj3E+/ZRhh9zjh9CRjasueT1
 IIZEQoENspMgszMPswGuoDuXy+7wEggIt72s5d2Eoq4V1d8cLrxOofRFGbdhsk36TM7NO6Hhmy/
 /wu4EuZGnny4nQ9/pnQ==
X-Proofpoint-GUID: OF-Kxl7-iT8i0I4wVbUT3XYof_vDqupH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080060
X-Rspamd-Queue-Id: EB09D4F26EF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gurudas.dev,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-106580-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/4/2026 4:33 PM, Krzysztof Kozlowski wrote:
> On Fri, May 01, 2026 at 11:23:46PM +0530, Komal Bajaj wrote:
>> Document the SCM compatible for the Shikra SoC.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
>> index 7918d31f58b4..bb1e0a0d1d3c 100644
>> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
>> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
>> @@ -65,6 +65,7 @@ properties:
>>             - qcom,scm-sdx55
>>             - qcom,scm-sdx65
>>             - qcom,scm-sdx75
>> +          - qcom,scm-shikra
>>             - qcom,scm-sm6115
>>             - qcom,scm-sm6125
>>             - qcom,scm-sm6350
>> @@ -146,6 +147,7 @@ allOf:
>>                 - qcom,scm-msm8974
>>                 - qcom,scm-msm8976
>>                 - qcom,scm-qcm2290
>> +              - qcom,scm-shikra
>>                 - qcom,scm-sm6375
>>       then:
>>         required:
>> @@ -165,6 +167,7 @@ allOf:
>>                 - qcom,scm-msm8660
>>                 - qcom,scm-msm8960
>>                 - qcom,scm-qcm2290
>> +              - qcom,scm-shikra
>>                 - qcom,scm-sm6375
> This looks wrong or the diff hunks are confusing. Aren't you changing
> one if:then: block for clocks and then second different one which
> disallows clocks?
>
> dtbs_check on your DTS would tell you...

The two hunks touch two separate allOf blocks:

- Block 1 (required: [clocks, clock-names]): SoCs that need clocks at all
- Block 2 (clock-names: [core], clocks maxItems: SoCs using exactly one 
clock named core

Both hunks are intentional.
Verified with dtbs_check — no complaints.

Thanks
Komal

>
> Best regards,
> Krzysztof
>


