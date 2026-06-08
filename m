Return-Path: <linux-arm-msm+bounces-111873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Bm8tL6K+JmrRcAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:07:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E24656714
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:07:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=THJYMksA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Pl0dBQTs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111873-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111873-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B36D33067088
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 13:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98962DCC01;
	Mon,  8 Jun 2026 13:00:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF45524DFF9
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 13:00:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780923645; cv=none; b=KK9lDbUpsr02LZkt1+GnxCg/bcm3VUHIDWI3A+AEgXtlnrpULhcNa/ppLPYFxQBce8kJH9ZZyJJXDjnDE9Jf2PJANJ1lzDWA6M0HA7NTjM8VwyemIW/icbWTIK2VVCU83gtzOtWd39kbQyn5dxlJyjrLMOjhjFMuwKXllmcHhKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780923645; c=relaxed/simple;
	bh=5CPeWiybnuarQX89JSsnELL5gZi36koS7oxDYutM69w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hpt8P70aqiLDJXxBP6+IGO95hsLN81OVHzggpErJofHUp9Cjo8Gh1fFlFelsz6NQc5kDeBzPNQOZO4AZHmggwzoPaeWvS1zbWYvP8amN/kKExMpLNMw3jrbcSJwL47hqZ10fFwOWtDRaUHyTlzVz/yY0KXwqD/WVgNBglOKGGYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=THJYMksA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pl0dBQTs; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658B9K9x3029453
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 13:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sz10LbxlxIzFGKgPz2INDQUt6FN8Eaw4+BxLG+zT1cU=; b=THJYMksAV9Qad3zc
	bfkabOoTb0K9nC2fiQ6yyMBL2F7Vq9KzW7u1MJDstSDyJYIKEMjWL97r42OmntNN
	zWs950gwiJLot0/mTyjIMAzDgGSU3wTb4RF21GIi/FC4Zew0iLxw4MF/7GptVzrf
	6NNdvKfyI77KVEbCRqgmP+31slhuN+xh3ODSBBh1y7VqaVASfyv7I1bh8XLaDkRV
	UP88jfBBBH38g911SSZ5oBLNp3NTZvp54HjDQDYGKxSsXqw2BlDQk3+3F2TEqRYG
	vKc17PYpCWqQkLNxh60gp862shrLf+ufT6Uf8XH5KYDGeZODF3WvPlpAT14Cujho
	KA8OVg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun40pxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 13:00:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0bfcd629eso56233145ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780923643; x=1781528443; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sz10LbxlxIzFGKgPz2INDQUt6FN8Eaw4+BxLG+zT1cU=;
        b=Pl0dBQTsILC9YNrn2AbFsoG+krL4n5+JKnwwjwlVTJ2QLs0r4jfaRjZ5z7LbDZqvYS
         hPQoLlSw2EvV1E7EFD0XvkQ0XffuU5O8YrIBQcc4Hex92KicYRM6KFHL4U+D1pUsOFUq
         IG9U3Neal5EL8/d874qfQwmCMqQHzzBBy1tgYlWpftdkrwdnCfuN21YoLQ8FL7XNs2PM
         XzaFE/hCYrzMPViSLiCT653wwLNdHaWjMFEY0f8cbeR4LvQfRTQIBIgZ6GkfL/yu4TBq
         MXUCJGUA6ZAIFsDjb20qwZFdwoVttAKr25V+l8rGWYI6nAElNJIP9lC7bq8qwcSIJooM
         NrlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780923643; x=1781528443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sz10LbxlxIzFGKgPz2INDQUt6FN8Eaw4+BxLG+zT1cU=;
        b=ses+6vE6DtpS7XgGFFJRX1BrD9uH/sWGLEJs8zp/3GaBPzSKQAgQGvDRdFM0IJg6SM
         Y7WueEH+8xWEvMcIWqUh5txkWjy+Uf8w9aTiUXcNTaX0Y4qIEF2lbADeYWe+0WVV5FD9
         staMYQZV7tUnR1qtSI1347hikOi5+8Yfc67z5AY5l6DdWy8s+oD5+CZ0P7sPjBmGn0Bw
         g2NU8SlBtp6PYQZAllWiJdj7JUKpWZXZkoASlnGfpTVhl12veHQ65HlL4jNQiFohGls0
         DqfJGvqEW5mm9IviBVzcXMqFq1IhPquRX0B9LBP4xLSOPoQBNHSqe+wVT8ZK0yxT4Rzf
         Yg6w==
X-Forwarded-Encrypted: i=1; AFNElJ8btKgAUq3pXdjOMA1J0QKGfG6c7oi03C74nhI6AWQvUWtXGvVmyrDmAVThMQXkqy5Yfzrzxb3AMLz8GIHi@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnco2FkzsQpVAPSn3rRwu96EwoUl+8SUIf6t+JwqvZTGTFMHBt
	PFXHlyC4ZNOSQro2zSkzkCjANQPgHVzUKjmo3RXiTvAbEbUE/4+rTnmYUTKAjQrgPwU45JzrV53
	jSbRW+I0akigxZ6Q8i9qQxovIdvCarWS7zn+dCMtFQ3gVPPpm1SH5EAiuSP61H6gbzxWa
X-Gm-Gg: Acq92OFFrpAQUyC3rMDb3liA9yOHXlWlm5slcqXqk3TkJYKQCazx41cTfDtNziIMCNr
	6gmDTdY6DDBJPC11jjVxmr5wzHNuL2mFN15ajBxiw1h0yZPpqI7VqaUl8njJQd1hAxdG70fAEGU
	/QHLDrSRrSXjzgtsAbetqcHtS4DHjBOnd5uvsupRKPCEXzEbeah0hSoSsdo7ExP708jm/jSkTrm
	lZxKNclZGmmrQlQEctj4emacpAyaTIi+8xmJ9nvuMUFzb/LmE7AeQBzjDZRpONSbgivWzUI0vVA
	dkD2XG/CrI5HTekybsZiqm70tw1s3NUrELpuR6ox3cj/qaOkcKxsSlcgmAflfmXMCAUV6FyWubj
	8nazkSGbBthfcvvXMdeoLP/PUT+nqCd3P+VDulNmumF30gs6EjM9WJNYVYHLb
X-Received: by 2002:a17:903:248:b0:2c1:564b:4f49 with SMTP id d9443c01a7336-2c1e7b35a10mr172173795ad.6.1780923643019;
        Mon, 08 Jun 2026 06:00:43 -0700 (PDT)
X-Received: by 2002:a17:903:248:b0:2c1:564b:4f49 with SMTP id d9443c01a7336-2c1e7b35a10mr172173015ad.6.1780923642286;
        Mon, 08 Jun 2026 06:00:42 -0700 (PDT)
Received: from [10.219.56.230] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6cea3sm177993205ad.7.2026.06.08.06.00.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 06:00:41 -0700 (PDT)
Message-ID: <19df2647-309c-4345-896d-b4cebec07e97@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 18:30:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: shikra: Enable Bluetooth and
 WiFi on EVK boards
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
References: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
 <20260601-shikra-dt-m1-v3-10-0fe3f8d9ec48@oss.qualcomm.com>
 <j2l7ijr56b33uru53wiyhjkd66pxusxopr4c7xmztlqfnztha3@xp6ciwnngcv2>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <j2l7ijr56b33uru53wiyhjkd66pxusxopr4c7xmztlqfnztha3@xp6ciwnngcv2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyMyBTYWx0ZWRfXzO7yGbXCsz/h
 mIEcQ5KNvr/uqq/PWpFRKzAQ0f7lnevZy6iKQUYJd0DC1zFwMuwZ5NWW8DXUowVvq0GUDUUqoRQ
 jNzPTAcnbdx3mUaQ5XGJqbUKdvof8bji3IQXsKbqovQHii64VSVo+9Ql5YPpYVDIbFnlBVPTFdw
 fN7qzJnYYeEdYVFZawSpNGRXPjMAUIV3N2yx7dl9jR3sD7ClUL4G++nGQZfr2lgzR86Peyu1UjJ
 155f3ghCq8ZGH6jlKSZajwgeDhUCipHK9LaBUvarAoyv3ugJTYzd8ii1OuA3yCUzuKxh0ddtbjc
 iY25LzFW5HTiaQn+AZGUYkqf36u1uoHNtd8++kzFmbMgkPm2KEOi1CaP3DJUsqTeCmbEow54o46
 dAw6bs+FX3+gaaX5cFLIWrnZ0DvuOTIMoGv9A9JnFNiVAwBjIe122IsD/JY+9H4x9Jj98n56Noi
 dmNuOqHEx1jOz+Vx+BQ==
X-Proofpoint-ORIG-GUID: YnZbwfNfVszHi7QU_-vw6HlP-7W1cvwF
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a26bcfc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=DXfNKwVoJAfSTobcJs4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: YnZbwfNfVszHi7QU_-vw6HlP-7W1cvwF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111873-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:yepuri.siddu@oss.qualcomm.com,m:miaoqing.pan@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 30E24656714


On 6/6/2026 6:15 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 01, 2026 at 06:25:12PM +0530, Komal Bajaj wrote:
>> Enable Bluetooth and WiFi connectivity on Shikra CQM, CQS and IQS
>> EVK boards using the WCN3988 combo chip.
>>
>> For Bluetooth, enable uart8 and add WCN3988 Bluetooth node with
>> board-specific regulator supplies across CQM, CQS and IQS Shikra
>> EVK boards.
>>
>> For WiFi, introduce the wcn3990-wifi hardware node in shikra.dtsi
>> with register space, interrupts, IOMMU configuration and reserved
>> memory. The node is kept disabled by default and enabled per-board
>> with the appropriate PMIC supply connections and calibration variant
>> selection.
>>
>> Co-developed-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
>> Co-developed-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 59 +++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 59 +++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra-evk.dtsi    | 15 +++++++
>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 67 +++++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/shikra.dtsi        | 23 ++++++++++
>>   5 files changed, 223 insertions(+)
>>
>> +
>> +&wifi {
>> +	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
>> +	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
>> +	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
>> +	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
>> +	qcom,calibration-variant = "Shikra_EVK";
>> +	firmware-name = "cq2390";
> firmware-name = "shikra";

ACK. I will update the name in next revision.

>
>> +
>> +	status = "okay";
>> +};
>> +
> [...]
>
>> +&wifi {
>> +	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
>> +	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
>> +	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
>> +	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
>> +	qcom,calibration-variant = "Shikra_EVK";
> I hope this means that calibration files are common across the boards.

Yes, it is.

Thanks
Komal

>
>> +	firmware-name = "cq2390";
> firmware-name = "shikra";
>
>> +
>> +	status = "okay";
>> +};
>
> [...]
>
>> +
>> +&wifi {
>> +	vdd-0.8-cx-mx-supply = <&pm8150_s4>;
>> +	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
>> +	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
>> +	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
>> +	qcom,calibration-variant = "Shikra_EVK";
>> +	firmware-name = "cq2390";
> firmware-name = "shikra";
>> +
>> +	status = "okay";
>> +};


