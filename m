Return-Path: <linux-arm-msm+bounces-117179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4h7qD161TGoHogEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:14:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8FD718F70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 10:14:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="JjChqHs/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZbZD9G4H;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117179-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117179-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6DF17305A4AE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 08:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F8532D6409;
	Tue,  7 Jul 2026 08:08:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215082C11DF
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 08:08:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411711; cv=none; b=lzagSE0fV0j/HOl72uhI9HmxKOlE6bYIH9Vsxn2+/BiJkNmjDDoRV3xUXlv7ZOru3gfAc5aPf/e8X/19RLi7/J8LCau2mzFcI+9c2FAQzvTZjPTIFTRRC7PXGJvgFSCczifCyZsR0XJZo2+xUs1Z7bDQoQqVfj93Qx5Yg38JFBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411711; c=relaxed/simple;
	bh=A2SY17CAeZ/j2znh/Nh29scTgcl8twuNHXIs5ZQBXac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L4QRXCcZaTYCr/cIDKpf/E+CCF6gOGmmfj/3TglkOJy+KsGYhw5QenId8O+STpsw1+T1Xb6e3Xbrxtb3EQpF11zqSLWXEZXCbL47pgv3xo7/V9ppFVYrY5Ec5X77+8ltg0llhbhhBz5D7GnpqrFSXzTaGmdzS58/Y0SLzNCJDck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjChqHs/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZbZD9G4H; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6677psaY3169883
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 08:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TNCFc4M275i5hqwVvMbqgQb+aYFA0UWni3Igt//9OC0=; b=JjChqHs/Y0ehLuj9
	+Ek57vIafHifloHM5Kj5V7Q5pLcWdKiLeC8D1eR4Xlto8WqLlt1PDw8LV2h81EhT
	w9NfbePsgKMT17eiwjHJQwcxdjKjHH2tWczk+AY5U7Br3/8XRCpZfl8vr/DL2hzT
	ovFeczrWWTfSiJUJ1cUPIbogrRfhfPmNLtJItBIjU15L/Edt4cXG9TamUStaHpSt
	Xm5oT6/NDi6KP3t4FTfLvCja+AFrh/UoRRurLs/0MWH0GHKoOlymRQo8CS5/x6/K
	namP9jFL8NamLaKj7qm3x20gwxEUq5Ukwe2n9TEqv6d6v/MfchaF47CrjK2h0sb3
	YD/F2Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep0282-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 08:08:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f1e4e0eac1so45827496d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 01:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783411707; x=1784016507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TNCFc4M275i5hqwVvMbqgQb+aYFA0UWni3Igt//9OC0=;
        b=ZbZD9G4HNYGNP7CDGb/4z5JJlIshgyJYP/AZYJpe3ZK1UoaFvnjBi6acRo9msvdr7K
         q3ss7Rda+CPvXK3PtCQlVR/BUaXNlCen8ukTiApEhDbz8WYI2LpufyB/pVW9xkh8NBxc
         jB6oej8pLrmUPkvfbritqudR2xfTTu3nPqN4LX95LjR5M8rm53hhWotPh2ka9Gb8vbPW
         maKKcbIdvIY+gme/Kwhi74Lxyyug/kNMZ3nc3GRcARbYl/dlJlbVCItuJ2Sb7i7x7y6V
         kViHV2AvF3NlBHcVs7egfGUas1TDSCmVP86RuJlCGHGbtQaMlS9A8RlexBFotakgGybV
         lMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783411707; x=1784016507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNCFc4M275i5hqwVvMbqgQb+aYFA0UWni3Igt//9OC0=;
        b=tOEXA2CWoasL+F1KYaYZ8z2pB2XFacgWly1LnLwSPphsKGcRt9XJkPror8ZOY16M2x
         z+Lk2s3GtvQMiaClPNKO+T0SN7Nf4OhBkJjJ1udyMRNTpXSodP09xIw/XXMrtaHSUYfQ
         b9YdQkwL6cINEGOot5JkYIDbIEh0qNPKK2lsW7M+zXtISIfwIuPFnM589D8MkXg36io8
         26ejPi15tB485iY7EYLAxmzHswU4cKI0eko0Ycz2E6hPA2NPnT5Bvgol/uFLBIb0ousR
         xf74Ci6mCboxMVzveTq8yR9JywDX4qsIfZ5gafFbNye/JVXZz0B/iyPz0iGdzySSEAVy
         ZUeA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/k0y9+pgJgeqVx8yOdnXPzf9OVVC/ENOcBO82IaZElX1yn1VXNI/bME9X8YsB0m6R9iMAPBzmV26+cJUD@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo1ts/mZJM6yZnTphyjYUZL6VnYp0k1lvSvlmeOBUTfbHJD5UC
	bAv4zCqyBr6P/MSKiq7YsvyuRC9uU9Im446g/zh/n8IUhnY38tecZqZamTLmCIlbxzKvVs39tvv
	a9mVPoalx3SQSkO8Ovt/qZW2Y2ZzwTXhqDRp8sC4Y9c23JL95eLfGgaBOyoBX3LhQbtH2
X-Gm-Gg: AfdE7clbeEUFfUm3ofpDBcbpAD3a6dWmtns0W8jpwuiap0Rz08t37go4whHeZDWL3KH
	1qeis1x/0/A99H7y/RzW/nJy1DUWHAtS/cxo77MBPCcQlwdjndNqWziWBk3SkcicAI+c25unsQz
	Zf1V4hiE3YVsDvaivtX+j504CXXBWtGQLBO2B5j79uaqzLfTM3BuzpbmLNNTsPdtci0PPv2DKjP
	cIRrJyMjxsTBxMqYSpW+ZM/VGXcmi25IYcJD/OHzApG8MpHL7OdV6dVZEpPylbcwPgIFdkMpdLb
	jsHC0dOj4qdrzliYPUNIb9Fw5TeTHdGPjPKC3+yUgCAgCss/8aUdsHEBVj/lAbDDaOLluqCnfch
	mzvay9NXwMy36dhpT2I5lcO6i82HH/Ffeb61pC7s4u5XfPtNx+tp5zOnOf7qOJn0gO2Z8S68PTA
	==
X-Received: by 2002:ac8:7c49:0:b0:51c:1132:c800 with SMTP id d75a77b69052e-51c747a137dmr43719871cf.19.1783411707390;
        Tue, 07 Jul 2026 01:08:27 -0700 (PDT)
X-Received: by 2002:ac8:7c49:0:b0:51c:1132:c800 with SMTP id d75a77b69052e-51c747a137dmr43719601cf.19.1783411706797;
        Tue, 07 Jul 2026 01:08:26 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b126sm31391476f8f.24.2026.07.07.01.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 01:08:26 -0700 (PDT)
Message-ID: <8d579153-efa5-4c8e-acae-87f3bdfbfc24@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:08:25 +0200
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
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260707-armored-azure-terrier-4dc3d3@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Fs_dC3DN2sSSCJUoFQlRw9kLusR4144q
X-Proofpoint-ORIG-GUID: Fs_dC3DN2sSSCJUoFQlRw9kLusR4144q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA3NyBTYWx0ZWRfX9VBgl3Hk5RoS
 FaLEdpp1C8r/bgy4vzaoIlNnh7vVXK1ceiy/+Kvjbvygll4MIN1IBD6UzYvU0tMUiwTcAl5CqrM
 pyd/ZU+D6sDPC1gqVXkfsrbVTzYHmGLvN6dCzbRo46Y5isNUz8XbMKapUCP7wZNJujJfNhV7fz8
 zSfIgByk7DEZy8C+ML+jzgKRS5Nx2QdcCXUs8wW3jjtQMN56c7HvmZKqBiyq18rapPOVQ72Ec46
 PlzNBu5a3w9nVH7/GicTdFsxrtH+4Q0//Yt/y8o7KCf7qeYkuhi9sZQugxQ8qEk1RRtndqZLZn1
 Gkw2f4/KheRkQ3ZgTF/iHnsJ5kViUzoktDkokFTzFwEWFifuoEO24F+BY6HpbonXiQeNqtesEu9
 4InPFgvm/IURDBW4VoGJpVjInxwWHeCQj2UHBrjEY7G/uQ4eUbRl8ef+moxRma+LVdx+0O7wjHQ
 hULLaPsfTvTgRVyC4UQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA3NyBTYWx0ZWRfX07WwjbqTtwfv
 MtrXrVg5aZmFIaaptd7Kl4AIgfFf0LKTsNJ9iU08172zwKnRPId7iEZrfcyFicWtHB34Te6fsgp
 1LD7EE6Fcvz954w7YPOF2lDPa1VhV00=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4cb3fc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=dgN5xaoR74Ub-rSnYJMA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070077
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
	TAGGED_FROM(0.00)[bounces-117179-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:gaurav.kohli@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:priyansh.jain@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 8C8FD718F70

On 7/7/26 08:38, Krzysztof Kozlowski wrote:
> On Mon, Jul 06, 2026 at 08:46:46PM +0200, Daniel Lezcano wrote:
>> Document the Lenovo ThinkPad T14s Embedded Controller as a thermal
>> sensor provider by adding the '#thermal-sensor-cells' property.
>>
>> This allows the EC temperature sensors to be referenced from thermal
>> zones in the device tree.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> ---
>>   .../embedded-controller/lenovo,thinkpad-t14s-ec.yaml         | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>> index c87ccb5b3086..0d049979e35b 100644
>> --- a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>> +++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>> @@ -26,10 +26,14 @@ properties:
>>   
>>     wakeup-source: true
>>   
>> +  "#thermal-sensor-cells":
>> +    const: 1
>> +
>>   required:
>>     - compatible
>>     - reg
>>     - interrupts
>> +  - "#thermal-sensor-cells"
> 
> This looks like ABI break without explanation.

What would you suggest ? explanation or removed from required properties?

