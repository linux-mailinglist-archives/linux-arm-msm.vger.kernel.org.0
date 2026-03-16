Return-Path: <linux-arm-msm+bounces-97848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id nsiHHV6ut2leUQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 08:16:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C968F2957E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 08:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AC74300CE55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 07:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C4F21B185;
	Mon, 16 Mar 2026 07:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eYA4RzvN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HniAZcmY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B22320A0E
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 07:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773645403; cv=none; b=Lwu8y4Qv8blvHRx2M3aaadnA9TQ0PPJOyweaW/mLBKm5E6y1iGZTGZ/cvNqRdIE2hsIPVBXR+DIFLrPeaM70g+Zjdz5F1t2xsmpYVVaGGV0dsd5LMSbEcupJ79kpsCVVXBEJYdTQWsmOJ6Umn3reWmou8Z1C9Kf97WFOVQ+oySQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773645403; c=relaxed/simple;
	bh=Ttsz8q5cDNZexWmXXKaGyGp1lEELQQ1lNOBljmUtN/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OK8Wel7r0IfXNXRHf+IcTY8G9Wy69XKWh9NxFEtFWV1iKIJNp+RJHEgJieZ95gRymoQ8Z/Y6ZqiFMuaMbxbkIQf7/8LsK2gfFvLsbDgfNnf1VhDGCScV511JxsILHqnaQuxCaYp6CjWCUP2iH9LwZqjVcmjKaFJ5b4ueQeYOTPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eYA4RzvN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HniAZcmY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64ll0323701
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 07:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2AfTd0j3qDjIpPj5+9F/8NtKQlbfzmA3Mmk2X4HiLnE=; b=eYA4RzvNicB32xuN
	g72yxltGFGSifnl3joSG+g93JglS4MYtWrfxkybyIL+ag+BnaHOXAbyAjOKA0obr
	8MSxQUbNwIvo1l4f/At4/T3Wpw9I1ZS/ro9QzQ7Xz4RK8x5Xn6+eaXxjblyg+eds
	2gtHYDCRAy9wujm2JQ+BF3aUT6jvePF5kTY5t0YkiEG5NHrgcHOD/pFYzUXR8BBy
	pMfzkJo/kz+PbyivDzZdr7KWmsmhYWtfN2TSTTse2E3kj5MdxN50mpCaWlJNMMAU
	gkUYOdSLfEbYuU+HmT7qAa2qi7puNr8k8nHLoke4N98pvhTpWCc8BddaaeasUmQ4
	gSIwKw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03qmmp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 07:16:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aec809f910so257554695ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 00:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773645400; x=1774250200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2AfTd0j3qDjIpPj5+9F/8NtKQlbfzmA3Mmk2X4HiLnE=;
        b=HniAZcmYxrWTXuQdTyuiB4QO4D7wT3KLhoccWXXQT7DtNv12iTbYDFsozCGm5k1wX5
         AlM/ztBZDHJiAnXlC8SkzkMjpJ5tmRKAu3XzhwszbMPc6ZSmHuBUI5C5h++p+yBV3wg5
         PydcQBHvwQd5QFOLClD03XR7vjGzGZonjojuhpCPLVNKsyiigHbEm0Q+/s8by+x0JKb4
         TtYqOqCbioFnGk/lOAkklas5xmaQnVaq5I+WoF+JFi02T5xGIZdD6BuQUc7y8HmIGy80
         Qmubg6G86VF+zr5PzrqCzhxdI6VXQx9UIvvge3y1EN09LXl/bJkYkL319jTrn2GjP3+H
         E7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773645400; x=1774250200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2AfTd0j3qDjIpPj5+9F/8NtKQlbfzmA3Mmk2X4HiLnE=;
        b=QzUtIOsjJB8XrX+HpAME/IUFFpjz9I1jASANQbOoZgSXRaanuYKUvSjxtIiniYFc1B
         s/pBXGCMrE4/Rtl42bUvjg+hjdql6qbAlE8JQqlTGdjrcSd6S2raKD4ugorLCdtOtGwb
         P3hQPEq6pFgWa05neUdjdf9GGamzoeVZ/+R18jhldL9rFTpJ0kXY3c83BWVsFl1eygKK
         mOokflG1oiaLgV8x80UMhvaWFSzkuS/kLZE/NEIPFbfRkf/6n8Ncm+WIPHYgExNKVBFZ
         QDdpQzfVBajU71F65mFH/xvIAQdwa+CVn42W1oEh0NxdlILyupm73feMv2mxy3q0QjbF
         EL+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKDX2VEXDhnw6ovShGA7LxvaB3NVkoFralWc7RguPZYYSGxcWoAQQ8Q7+NAvjFCzNsJTmZImx4euIsb9XI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnsdnet81rEik3a6O/aj8AeyLqTAsNHUaILO27s/h2pWpfkSvN
	x34FDSTOiYnEdy4m+k2U7+HZEaWbDc5Jh43TjYTq1ARUlAi8PJLKGM9Uou5vaOciDxgtHcThxoN
	khkvtIJ9SCT+AvJOYiypwcSVc4IdOuANe5zcHdAlptVo5HxTAaJlAUtIBjdOZp6+Yx/KY
X-Gm-Gg: ATEYQzxtlghxM1hOvQ6QA3aIsfv6kTYnvse3TC1sAyO5FR9Y36vrfrqw5kvF9LvVcB/
	vc8q9DwRVnX/tH6htZL+WdH2rUT+jHpfb7EZ6ELzMc4HnviOzl7l/n9rkoJ/9O4FUrFY1mV4BsI
	MJ/QsFOigZgbkXAX5deMUEegHfuxLGk5VtoJL7UeEf1YY8hPIf0YEjocoXO803u/H8Vt3QB9Vg4
	+yKO1UFU7AmWA8bJbsiHD0NU99U4mi9pJjACdWmmZQzp7R7nQh+kiKzVHvG/z+oNlnJFtzynkfv
	2vTiln00GfaNV9LmZ5V4A4F8ClMCE6D5s4IivwPHVGLFHMAgIzi5EJB7yWmok/18M+U7qXZM0Il
	E2ns0P3EwIlXCqNic9gAlzdBVW3Yg+Jhd0Wab6H2EYzFUqqt1SSg/2lg+fVuPozkT2A==
X-Received: by 2002:a17:902:dad0:b0:2ae:57e2:9b32 with SMTP id d9443c01a7336-2aeca9b8bcbmr127501815ad.8.1773645400325;
        Mon, 16 Mar 2026 00:16:40 -0700 (PDT)
X-Received: by 2002:a17:902:dad0:b0:2ae:57e2:9b32 with SMTP id d9443c01a7336-2aeca9b8bcbmr127501515ad.8.1773645399849;
        Mon, 16 Mar 2026 00:16:39 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b05d95796asm9603665ad.52.2026.03.16.00.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 00:16:39 -0700 (PDT)
Message-ID: <a8e08742-c6e3-4b62-a97b-bc2ff26f03e4@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 12:46:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: clock: add Qualcomm IPQ5210 GCC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
 <20260311-ipq5210_boot_to_shell-v1-1-fe857d68d698@oss.qualcomm.com>
 <20260313-demonic-ludicrous-lionfish-fbbce0@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260313-demonic-ludicrous-lionfish-fbbce0@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: z74oxhthyyAZTqGilwGchDg-pImHcgUP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA1NCBTYWx0ZWRfX7h2Jb7sS0hDW
 IR4RNjkydccLJnLMpmCbTKR4cQc2d6CdqbKxvTVQE6ilBkXnWnsMrgEnkLBL7QUw0g7hoF00GQZ
 AKJE7DvFwKtDwu7CKQxUwygTrDi5nNR0OSzrctAe4L7DMBjBWoyu+tkSY4JE0QhEbTe7sRwlXGq
 6HijLQ5AkhDYyH7FFUbCWr8x8nUHPyLD1gpBuhc4bW1eo1WjO9L5HzCk32/SRF+/Ctuo3f8TXCK
 QTsXmEU7tTjO7T9nkvQ47XHEmEjKI4E+oQg9HQFMn4QlxzQMzaes9YYlyVOaRiJ6iVAtc09mSEp
 vdLdH3qCDGEebUNY1eUXBJ01P+RAYwSWDM7zrLdLq8SzK9C49+rWQYmK+e2k8Dv2sLvvMtWfVE+
 YbNwX+BZx9ldZc34JFCOnUhH4TrRL9P1+WFQK1rpkFhGhpjRMOzAhfYwdp8nTj36U/wxNS9fOEV
 R0YgKjpB1g/Lc3d786A==
X-Proofpoint-ORIG-GUID: z74oxhthyyAZTqGilwGchDg-pImHcgUP
X-Authority-Analysis: v=2.4 cv=ZbQQ98VA c=1 sm=1 tr=0 ts=69b7ae59 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pmxRcdgLKSYvSCRR0ycA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160054
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-97848-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C968F2957E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/13/2026 6:52 PM, Krzysztof Kozlowski wrote:
> On Wed, Mar 11, 2026 at 03:15:43PM +0530, Kathiravan Thirumoorthy wrote:
>> Add binding for the Qualcomm IPQ5210 Global Clock Controller.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   .../bindings/clock/qcom,ipq5210-gcc.yaml           |  62 ++++++++++
>>   include/dt-bindings/clock/qcom,ipq5210-gcc.h       | 126 ++++++++++++++++++++
>>   include/dt-bindings/reset/qcom,ipq5210-gcc.h       | 127 +++++++++++++++++++++
>>   3 files changed, 315 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq5210-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq5210-gcc.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..aeb5d9a3f8322d5d36d2fd19a1d23b275efc34b3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq5210-gcc.yaml
>> @@ -0,0 +1,62 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,ipq5210-gcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Global Clock & Reset Controller on IPQ5210
>> +
>> +maintainers:
>> +  - Bjorn Andersson <andersson@kernel.org>
>> +  - Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> +
>> +description: |
>> +  Qualcomm global clock control module provides the clocks, resets and power
>> +  domains on IPQ5210
>> +
>> +  See also::
> Just a single ':'


Ack.


>
>> +    include/dt-bindings/clock/qcom,ipq5210-gcc.h
>> +    include/dt-bindings/reset/qcom,ipq5210-gcc.h
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


Thanks!


>
> Best regards,
> Krzysztof
>

