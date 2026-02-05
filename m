Return-Path: <linux-arm-msm+bounces-91912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHMLIwqDhGl/3AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 12:46:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CA6F2050
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 12:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 589F03006B1E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 11:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A913B8BCD;
	Thu,  5 Feb 2026 11:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W+ZSU6GY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N8UgRZBB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D403AE6E2
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 11:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770291975; cv=none; b=brhQRLHCkUCcFxLCcGaJFiGb0qvBtDg1pz54QWtG9zO/7zbPwu7nXALp0/DJmVDahGyvW+R8nZL2UWSa1rjO7mSKoUu8s3AYKlX1zXblU+w6cJs1UJYKkRkIp8dPBKryZ8x1E7HEmv54toVbVQpbZYMNT0ZXC+0hvg6OI1aeLCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770291975; c=relaxed/simple;
	bh=4lB8+JwYgc3Gv2OsZv0CDxcycMhsHE4bhsopVdGAr9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AtiWE3PZrBLOO3S+ewKa+R9mm7cE0g9e7vIqm3pfoEHtlwbxJ49tskWLFaUORV+c8H8UhUomPSC1vm82xunAEYcRieH2N74T05pD3gx7FEK0JBBbwqF6PaQmTWndQpEqy2sApDQHV7wcsKHzmK893mfAoovGmicphkkrxPr14Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W+ZSU6GY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N8UgRZBB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615AmPJ43239125
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 11:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fj8LFYY5ksaRUIN+XwMQynwt3dO6TMLgxZCaxddQEh0=; b=W+ZSU6GYMTw7ZSDt
	glVqDvzCyRdAaT/g7o1QRG//8r8llqJI2a1YRHCP0r5IKqB3iVtEK78A4K5l6jbF
	//bLrSATDGscWl6kdsXFOi41fnDy0tjZ4YF2qwqejEKdJBqe/youKh9NHfNuIZov
	oCUAGX7Aq7XzoYysl3LtzTPo4HuSwMZbK5vdHJHBQmeF7PK9UXvKZFQoSOs4tllq
	G/WVzlz+YCpEnF5YzvZ4SMugGjucCemavfAXzjQKtQ83SgbC5/XkmfiRFDC8HxrB
	PFCvNo8f9QmlSdk26Nu67UV7M4jK8vqkhTDQISCjUonfkT0F9/h68WcEqrLWCeYl
	3zGUrg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4cp52etw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 11:46:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70e610242so237119785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 03:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770291974; x=1770896774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fj8LFYY5ksaRUIN+XwMQynwt3dO6TMLgxZCaxddQEh0=;
        b=N8UgRZBB54awO2OEOfUu44c82yx82sfr7tjNIqXOFPITS1+ILYTTXfiV/6BUa4dFRb
         ncbexblMmxbKc97elKSddn3LB4ffXC9Ql/+lJ08Qw1h7vqAKBg8xVNXAzRvGOeMbH8qq
         Th3AVhg56p4qJoJKSbm23cHlrSH+b0BG2f8NVpflL2zVKgK9fAgnDgBBUg8mE+5XmGBi
         bG2BYKSRG0IxOQYyv1mZ75LC5H8tRcQbiwIx/j+53emhxMfkenvVZDI5ltLvxVGIkNew
         vRiPC+Zu2OqGXfD1qGHC65S/tznz+NjYz4lHenvQtCM8xnvgY9JMz8FyrgppeIXMbGDz
         blaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770291974; x=1770896774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fj8LFYY5ksaRUIN+XwMQynwt3dO6TMLgxZCaxddQEh0=;
        b=dshJW1WLPzgHnDeGFX/nlgNr/Z31BJxVs2UE2c59owT+Yw3qQwgogDwW7dnmtf+BBH
         wBWUFnNlysZwQo5zvWcXzKCC/31gX4Ft666WmSbw3haO95hH56Yyfb1kFA42W/CtCvvT
         zAbAaW5URDQIzH1hE+SyeaZLK2WrBL2UHXvzMIbkbgwsFeOGwFKJq0gNp8fI2a29m8k+
         1VJTHXNOArVidDzhXJ2erMZtVjU6/JKXa0KcfFoO+TUdpBrquTtHcScIMHWjJwyEW+ib
         LAroCMXwdapFinCRcSBbNQpolMhZ5MwoyHfvMjfEDLuxacfHptPqdIUuAfiYgfh8tk9W
         eoJg==
X-Forwarded-Encrypted: i=1; AJvYcCWUx5f0q/ZkK0wWZp8490jNjOzA7puSFSRO59iHtVjXj4mekyH3rNUMPB+K4h5xMkL4hL/0GDkKK09L08Dz@vger.kernel.org
X-Gm-Message-State: AOJu0YxxMnagjv1boYkPh/H9gbLHdma17LcQemWzIiRFXqskToL0yKZD
	+duGDgMCHpufG5MgQzGg3zT2RoBbUw3fWO39L+ZaaOZm7cv2Z+HWvLN6UXbfrMiLeGNCJ2Og/WW
	U99Siv//f7QxXWTnD11edoyertjnPWjHLEmb405ExUj42XdRVN9s16TBt6EtMJvZLRIPM
X-Gm-Gg: AZuq6aI3yBfL3E7kCdZFNCiq2sXN9EKL3dB5YDcYkVBBYDCIESki0nCtOwcOUHAuJ6f
	sPrb+ysNi2XwFAxfjxPQwwCm/1SA6KyE8boaG5GpXL9GwgiOHNF0GeKQQ/Gb2spmb3jNeqiT09p
	0XYjuDzf+n0VwYm9nk89lfP6FqKCSC4HMNkkeDkA9lvv+Pj+1F71WtnRuT5KsaHTIWUYCHfkGSW
	NKFwliGAEYoqEn8+4dJDFrwWQwkgLQ6LWYUVwPiF7xr28165bbRK6dRuWdQ0GRcc/ZdXpb2vl12
	MgOiZRMNJEgCJI4OQ3r67HME7HQbVnEzh1D3wmL+SWdc+JU03Zcpjg8Ne0GbAIlQPF+UZsafRU0
	OZS7Y1Yd5RtEExMeCEqv2LnnO2tTuNQH/1Ypg
X-Received: by 2002:a05:620a:4493:b0:8b5:9fc7:812b with SMTP id af79cd13be357-8ca2f82e4bemr803462085a.6.1770291974005;
        Thu, 05 Feb 2026 03:46:14 -0800 (PST)
X-Received: by 2002:a05:620a:4493:b0:8b5:9fc7:812b with SMTP id af79cd13be357-8ca2f82e4bemr803458485a.6.1770291973514;
        Thu, 05 Feb 2026 03:46:13 -0800 (PST)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48317d7a924sm77009425e9.10.2026.02.05.03.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 03:46:13 -0800 (PST)
Message-ID: <d946f329-a021-4749-bd91-1416fe51ec3c@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 06:46:11 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi: add
 QCS8300 LPASS LPI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, srini@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260204174237.2906-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260204174237.2906-2-srinivas.kandagatla@oss.qualcomm.com>
 <aa0e8a75-969a-423c-a94f-fd8098fbeb48@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <aa0e8a75-969a-423c-a94f-fd8098fbeb48@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Oc2VzxTY c=1 sm=1 tr=0 ts=69848307 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=WQsTmj8KRFL-dA2dTgAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: qnrOnG1a3BKoliqNjOlhSAToO9lJ3lUy
X-Proofpoint-GUID: qnrOnG1a3BKoliqNjOlhSAToO9lJ3lUy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA4NiBTYWx0ZWRfXy027lNb2X+Ke
 ABYzbDAwoVEyEI3YuxqT4E4/slqk7k7MKPpCbDKU5aDKiAGO3CfuPLbcuTwqOEYaGg3ukobB9dG
 +R0ZLAgEXWpEr7evihGr6Q48e2ojuU4cPK0yLCmQ5QAxjm+kPucH7F8yIHVhrBKfTMiRZ25+wYA
 uE3p+AKCcqUpJaTlwE5CYkOj+hwsy2vv1g0dXN2MwakOA+sOkN4MS+jr6UMizjM8tfy0iBoSL0o
 Hn9Und3K8J+mRUdl7C1F+T3Cb+S0FYGNlzSM+YEhXQ2vppYQomAz/Ahc3lKgWVbXTYQbv+b/2hN
 EAvmsGN7fcLYLe3pLbknYMa7EY11Yiul8idF3vvB2KMDyuoaGgrlSn6QZqYOlbysEQsbfsKeoL3
 WqQcLeJv1FGqWAQLaR0bSJN2y90zOPwdx2rr9NOnauEYNEYgZYYNDbMFXTexGJmyu1v5m0D8hmf
 CA/lTV8oP5IRQ6zXwFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_02,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050086
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-91912-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E2CA6F2050
X-Rspamd-Action: no action

On 2/5/26 3:53 AM, Konrad Dybcio wrote:
> On 2/4/26 6:42 PM, Srinivas Kandagatla wrote:
>> Document the Qualcomm QCS8300 SoC Low Power Audio SubSystem Low Power
>> Island (LPASS LPI) pin controller, compatible with earlier SM8450 model.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  .../bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml     | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
>> index e7565592da86..c81038320c35 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
>> @@ -15,7 +15,11 @@ description:
>>  
>>  properties:
>>    compatible:
>> -    const: qcom,sm8450-lpass-lpi-pinctrl
>> +    oneOf:
>> +      - const: qcom,sm8450-lpass-lpi-pinctrl
>> +      - items:
>> +          - const: qcom,qcs8300-lpass-lpi-pinctrl
>> +          - const: qcom,sm8450-lpass-lpi-pinctrl
> 
> This patch conflicts with 

Thanks Konrad, we can drop this one!

> 
> https://lore.kernel.org/linux-arm-msm/20260127105511.3917491-1-mohammad.rafi.shaik@oss.qualcomm.com/
> 
> Could you please consolidate the efforts?

Yes, my bad!

--srini
> 
> Konrad


