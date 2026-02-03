Return-Path: <linux-arm-msm+bounces-91627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cD2HIJK6gWm7JAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:06:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D20A6D68FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:06:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74A9E303E4B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 09:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E1030E846;
	Tue,  3 Feb 2026 09:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9+QyQ/3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sn2XVT5L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F28230DD2F
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 09:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770109284; cv=none; b=ZaG9iMQOhXm7mo+lFlXiaRsNcsOecARI2i4+jb1vOrGJ1p+i6FzmwkIrKAbpwzZ3XOH2WXU698uHzneyfJfW1xduDqCfmR4m6M06rXjnUUU/3n5cG7U8cUUEjc4d/+5h5e/6xdJe4PvfeoWOyIm9QdGiotRfxjpv9EVn8nlCCl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770109284; c=relaxed/simple;
	bh=NOTn4w5YBZ20/GL9sXVBe+hBvkn1gJZ6MM0O7jjhV2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k/yKsDp/Yk0JeSdNef6Xno0y849e9DJk2GCHx8K/yLpBsxLkPFFZAZKfehUpxG9w9pivLgso7nrOH9XxFQZCKQI0uBE5NTUJEKsC7ozd9ELryZdzZ5ceJiVpE7/yF69jLaNVjhMHMXAFdJVFpRVtSQqamz4H3r8+KkR1ThsQ/Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9+QyQ/3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sn2XVT5L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6136fCA6278229
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 09:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rukF0i9oSB43jxeOhCrzD1uPcESef8W7GSXb7mIQH4o=; b=Z9+QyQ/3S3K8/dIy
	C9a89ohyzFOmlOTkvQsZ54ZF49OxAhMZ0ti171mXCwQH5bGRA2MUBE/M3+kgh2/j
	fcQURBzhtyBrzl/+gSqnfhOnYB0Z4GmBebZlsyWCGHjN4iBYe+Skq2VbcpgZhRlX
	nxV4dZ+asu3q2QNBSQPqOr31cTzj96p8q+zPvqsXp3eJozUOk7Grb45owd2HrerY
	eORTdg14AWN2VUC8q4NQTcXUSdEhCcuup1gm+wZu+smmEqh6qqj09ghSnt0L5QRH
	S6Ie/3kRqRXo2enNHt0gU0gA2y/fX5USTKTuXlU6ZC8+7sDTsWO9tXCpuRJe6POO
	ZEpi6g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c32s39yhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 09:01:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c65d08b623aso509162a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 01:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770109282; x=1770714082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rukF0i9oSB43jxeOhCrzD1uPcESef8W7GSXb7mIQH4o=;
        b=Sn2XVT5LcaGr5hiXwaoef1tUCtaj7iCdCfKDl2f+XIBRjixF+4WGOSfF2xJ5FB3KFH
         +fAkooUPD/a6Bv3vV0whyWDpvGKp91UCAbUMEAVUr2dIFVBmXojjf8ME/D1ZIRkenmuu
         rHFPAdUitP0zIBHPQYNJn5+BiUW7qn80vdVaOi0TCSFdWN4OFV7nI6bvlCHSH/0nIr/I
         XGmo6x44mfsDiTlhOKcwDdzZlAk3dn1ANYYsHVfF+AcsiYtHqP/FntlLG0Pwwk+cbKGj
         awKiubgvipmcahTHKJS5c6W1lIbYuVu9OMtsrxAh/bjWdqlhzf4fa3pBkmY8b2q1il6N
         mc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770109282; x=1770714082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rukF0i9oSB43jxeOhCrzD1uPcESef8W7GSXb7mIQH4o=;
        b=WH+SruVr+7yokZOsv5m8II17P0C6JDhmrnJmu6TXnbiwD9GQylcAUx3LtvLGBjl5Mw
         0vomMsH4NCrLuhpLvYxxiPJfef4e/5swC1/uAXod9BywLqEUpVqZOBFcvHTjIvHDes90
         L9/ruoep2itJ5Hkrfi8hjRlpk3fCLO+RYZ3ZC7cpH9lakJowCp2KpBnL3Lk2tQprOPFN
         kFe9atPnzpo6+gWXWA918TBFBBAmYz1vfS709UjWlfWdCOyOokT1UJc/6qti4fskZ6mw
         eltHmHYEFmX2iRtye6KW9ZunboSss70MYcJTKuIO4CWorl6KyJLEEjxNja2nOaF0CN57
         NwPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPGoyke7D3g0AmToUes5unp9H0f1zeiEGg6CvzdfNLKAK6a+CymEKz7+IBWyT8IVpKsIMjID16VjNu9P9l@vger.kernel.org
X-Gm-Message-State: AOJu0YyW8Yt7uJCRx7gAlHKqYPQE/zT9H7t5BlJSpMIsm85TFmeHqDo+
	tmmTXERWzC7OUIIdm/nYB0L5zgL8GCOEe08NLV3owvDqe1VOa5muvkpgzfEDGWSgee64FP+BaA8
	rp0cow6Q6hfxZEO7QGbfNaJH1li9i49uuBofeG7BWrNogx43tZdYrFQPbu259o1TTsNJz
X-Gm-Gg: AZuq6aK6jaalNMfRPBSSjW8M8tB491tngw1YmBLzOpmivTyFxhStdS5hpadculflyXu
	bXUUnQC5Ql5VII2nNdBXf07mpgfEys8X44FLfMUnKYGxdagNcO03AbD3YqayYkfxm7Ah2ajJtuZ
	ddJFQHzbWQXX7pBV+wwexLjICnIbjjoWU8uBbdt4EY/JHJufmBX3KrVjeX20eamB+4QgBWc0myn
	CIank9BIgCxhq2HTXgYc2Jg8l3U4P/EVGlwKCNiF10UdhHjs0ZsAqNqY3NvAgK63W3XZM75s4aX
	+gkjIShMaE3FKp82zh7tzFIJx+k5tP0QoAFNzsXzoTINwUhLgy+Fc22bo298lQ2ULsrTLsDddHB
	BohsCkj2Ir93v7pysk+os44WweQaQHzfxuHcjhTAigC1Gt299d1jeJGeQgzres0m9il+77ftHCg
	==
X-Received: by 2002:a05:6a20:6a0a:b0:38e:6774:382d with SMTP id adf61e73a8af0-3935610a947mr2372400637.8.1770109281799;
        Tue, 03 Feb 2026 01:01:21 -0800 (PST)
X-Received: by 2002:a05:6a20:6a0a:b0:38e:6774:382d with SMTP id adf61e73a8af0-3935610a947mr2372348637.8.1770109281221;
        Tue, 03 Feb 2026 01:01:21 -0800 (PST)
Received: from [10.133.33.29] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4173a2sm174617025ad.30.2026.02.03.01.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 01:01:20 -0800 (PST)
Message-ID: <4c2c3578-867a-4a1c-9f3a-fa7506371795@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 17:01:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: pakala: enable ETR and CTCU devices
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com>
 <20260203-enable-ctcu-and-etr-v1-3-a5371a2ec2b8@oss.qualcomm.com>
 <d91d62ce-8d85-4182-a0e6-9253f07bd002@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <d91d62ce-8d85-4182-a0e6-9253f07bd002@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Zc4Q98VA c=1 sm=1 tr=0 ts=6981b962 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6DexCDkPx0JeSCrEoRYA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: DtlQHWFiVERB_tjgOCYiETVc0ixdRFtq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3MSBTYWx0ZWRfXwZ+NALdfHOT7
 /yDCg76REAIBcV+rLS0R9mBIbnw8zUR4U7+5+QM+koWIHt5+HGnUAvGQ7O4AqP93BhuzgrEs1ZX
 YuuvNAgUfVpjTxeposueIrLLoZUvcVytDhSspfaUjXMuaN23YdKedQJSEqs0+ngM1CuPrxiOQEL
 DrbI4GhYrxM5bp5JHIXjci4WaQ+L8Lhbesw3VJ/QDiJPobz8lGgq3MycPNpjvlDclylAuvsfCay
 u6vYwMjQLdJBeAxfpMhms78OWDXFOS5J3GNV7okWzLwSofobvwcxcDZkRMpqKHxoRIP17l7N/fS
 LWfIFVK7KwmQAhllLQFdpqnnuFcMu0wv/bjHm+XYx5DoZaXlVzfh95S1ErsQOxDTIHsWCDsa6EG
 8/UuhFg8OTJ0C1Ivyh+V3RCTMn/vKsIEf0MMAVuJKlW8Scpqx+cEHAznXXoVJPLU36hrJWSoR/5
 pnSNOs3Fo/4rrsiK9sQ==
X-Proofpoint-GUID: DtlQHWFiVERB_tjgOCYiETVc0ixdRFtq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_02,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030071
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91627-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[f204008:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,0.152.154.104:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D20A6D68FB
X-Rspamd-Action: no action



On 2/3/2026 4:56 PM, Konrad Dybcio wrote:
> On 2/3/26 9:08 AM, Jie Gan wrote:
>> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
>> tracing data from source device and the CTCU device serves as the
>> control unit for the ETR device.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 177 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 177 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> index f56b1f889b85..1e39503360ef 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> @@ -3574,6 +3574,35 @@ tcsrcc: clock-controller@f204008 {
>>   			#reset-cells = <1>;
>>   		};
>>   
>> +		ctcu@10001000 {
>> +			compatible = "qcom,pakala-ctcu", "qcom,sa8775p-ctcu";
> 
> With "sm8750" in the compatible:

will fix it.

Thanks,
Jie

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


