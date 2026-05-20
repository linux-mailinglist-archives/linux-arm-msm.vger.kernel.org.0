Return-Path: <linux-arm-msm+bounces-108728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NZcESWjDWq10QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:03:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C5F58D360
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 865B030F8707
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5335A33B6F9;
	Wed, 20 May 2026 11:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bjaqrLMR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="duOsTEg6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC530370AE7
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 11:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779277230; cv=none; b=luQj9GOSai3f4kUkM9TcXW5J6ywyV5NOPNvFQXQyjAqUgAllpGSzloZRpnIF6hjn1KBK6PNwBtkksH5oUqblJlBVC3VltQ2xs8nVxNvjyxn5d+do8pbb7CSsiA5LzYi8dmAQMxmF/gT37GgNLdbJXLisbjvB6Uo0GyU7pUSbVO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779277230; c=relaxed/simple;
	bh=5mweL13Xvi7aC3ka9r7V/CZE6DjWraUDvHAd/V7OHVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jo5XMu8b+srS14ISHnPVV8dYMZKKoAnFpZOre1CoLgoeBN1Zvd0C2oSi8pBafI+z5Kx2luVByy1b/Oabtg+NkHXJQXdkTEhzZatAQJujS32mERREB1g1InN7SefoO5wRTxUCjkAyBlHYB9K6FAHejRPbXkU8whmziaOP7INLqmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bjaqrLMR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=duOsTEg6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K76O8C1636927
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 11:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NKD+goykCEWe7P3VDwM4HDQDAaDkCtngcJEhO1J07pU=; b=bjaqrLMRChx1UJAj
	B8kV6Gb1S5Me1buGmKtvQPqBHfGBXfSoV06zU6alnNvX0KF5+z23Eekr4Wrlq8iz
	Ah0vk5Uj4wsTc7cp6HxLGhQluy43lVbXKca6T7Im8cPk2avrvUuScNc5hlpzPI6q
	50PaMy0x0MhPQzfiYA9YNyNHl9QkOmn61jC2Q3xjwqSJcSK7IFYLAPp2GzawaZ2Z
	EG94rlNTD4ILMYuK5els/mADZt9F6TMjJ8G+KNTsrWO/cKzyCIAs8xrPm/GLM0Wx
	dr7e6RQSg5BE9YwgmXV+EucH1wZOlzLk+GqNfGWz6O27c9KauOBhxkKDEQVyPg5p
	HBTk1A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3scdd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 11:40:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50faf575af4so127134611cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 04:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779277227; x=1779882027; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NKD+goykCEWe7P3VDwM4HDQDAaDkCtngcJEhO1J07pU=;
        b=duOsTEg6yNaGqUhPdDr9Pur8kpqMOtxVz/a0Y3zMQrXTAXW4L6ovLt6BUMjVpuinIC
         wGxDP9rsqdsrV+VgYBJEB5/qjssG8MdkreW66dE71RgBLQI2QYQHyvNu4czx3/FutWpM
         6rgm8g1X8dvOPeF6YwCU26PF3GhfE5KgkcGG3WL8/9b/kzy+7k96WN4BbvXZspY/nvoS
         eItg5WGQiMGVezlDYTXENzNT/IL5sXUGY9xfcQlAHDkhr5xmb/AXSgNihDrjfm2kTnby
         XidFaOzYodKO6c1lvcCsjeN0Bu098KdOb5euZmGKv/66h/KTqZI770GiyG/fq58yRvnq
         v1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779277227; x=1779882027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKD+goykCEWe7P3VDwM4HDQDAaDkCtngcJEhO1J07pU=;
        b=IWkaPkUQt3lxojWFg77A+p1vqGAziAFMXOAQ/mBt51xVoSxOcwdfYYLz/NUB1wEdc8
         MdoArFIxSbsRmmDWHqgAa7FWZTflDd4Wacmg21N5lpYCE92Jebn0drSBnMxj8p9hDSUo
         5aIrORoWabjlAM9sJy6aJoS+LH86Cwgwgvto0AZU6XMq4shQ+MQU9C+MqlN0YL8Wp6YD
         GkUrk6eATP/+1b19ZKnIPjcS+ziGIaMir4RVJb8QlrPO+ZCpnF+cNnR9s/DmPxWxJ7xb
         b2ahBlh+ddB370JNWtelnaYsEW7LC4LDuss8Nr4j4nZO5nueEWgBnnA4qR+mZLrsshfT
         vUAA==
X-Gm-Message-State: AOJu0Yyr99Pe6YSWC5bAb5cB3lrhibssJaOnlhlJs2iJ0EjfetNvWVrj
	GA2xIRmvD8vfW1hx6tutRhKS6LN4pHLsvOcSv8WlsS9te7WWNG+EK6w81ph00Fh6qprlbDuz47F
	1FCVaXsXFx7CLPCR66USgXz4N8WHStTYloXmF8U0a/fvhvqlJrGKw2Ipr4qfMvsQqLhEX
X-Gm-Gg: Acq92OFwRT9kgnVACoX6ZB7OOTNWUUDndIbDMw8lL9lU0e5DPB/pAYhDEkrrdRwjkUO
	sCcI398n87/7GKnIAa6Z3QZXd8H38gMPfLWyXcKDIC1HQ/G+BFZ+94Xt8r0rj5yCzgyTsdwrhnw
	ffp5aXn0JNEiBjbExH3jEPvnRiaVuQ6e8MduFB16z7kzX2xo0921gJ9zV7etfs4u2tv3z1JBSfR
	MiowGHrjnuckFhtxtE2vx/t6mKd5nHwjwZ8kurp7HFw98s16A/IWe0SGn99aF752Ufk243C8dZ/
	DwrgP0Xm2Mb64pa3+UWP3a3BS9yHTfPKGGFlvEkiSpWqFQHDBUHEA5Y8i/KZfSXZEud3vPXb4yR
	+vBPKCFL5UDC75OJ3ZRj2YSceuLxhzx5Ru307NfWYa0XDount
X-Received: by 2002:a05:622a:5c9a:b0:50d:8056:da41 with SMTP id d75a77b69052e-5165a002bd4mr327620131cf.2.1779277227254;
        Wed, 20 May 2026 04:40:27 -0700 (PDT)
X-Received: by 2002:a05:622a:5c9a:b0:50d:8056:da41 with SMTP id d75a77b69052e-5165a002bd4mr327619641cf.2.1779277226827;
        Wed, 20 May 2026 04:40:26 -0700 (PDT)
Received: from [192.168.68.125] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe537c788sm372948175e9.12.2026.05.20.04.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 04:40:25 -0700 (PDT)
Message-ID: <83a1cb82-add9-4896-8fa2-8550822b795a@oss.qualcomm.com>
Date: Wed, 20 May 2026 12:40:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 5/5] arm64: dts: qcom: glymur-crd: add Audio sound card
 node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>, robh@kernel.org,
        srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com>
 <20260325035338.1393287-6-sibi.sankar@oss.qualcomm.com>
 <f097c75a-0c33-499b-9910-b23182d4472b@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <f097c75a-0c33-499b-9910-b23182d4472b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDExMiBTYWx0ZWRfX2l/AidOmYDMB
 IQjzFDHddDQUSOXF5cmzLM+7uRq7jkmNkSFgG25ewdo+AmtQLf9UiFRoQ5kEH1S0A2gW18xkLZl
 XSPUe83TmXw3efSSAYB8Qjw9Lem/5xwvGMx0n6qmiabpNXAYN3bWyZanuvmnWZlxh66MEAQVGyD
 QsHnskjW8oBXuQ2nKdG9jZqFDSmSlxc5oSoSh4uwkHnfyiiaZSN7DjmR4NwYeR2uN9UEjAVQuNf
 ObKTK/3i8AzzCUTD7vCky72++3c4ofA3GnKu/JAVX/LRqZa6yCctzZ86gZq8cXCWQxV2yvoAAjX
 3ZQ3lsBouW5aRrK1zQg1jXCJois9R6YaV6GjWVKS5/3hOznicKtXLP5etr0apk1Sh+p9hfO+MqG
 Ksv2055IyhtngDdslHfPpmGoHmOQHuMg/M+6yXI76tYCWVcXiX171K/X47zZbxO1AtIjazaT9yu
 a8qLKZBHIcYi9kSLQQw==
X-Authority-Analysis: v=2.4 cv=Oc6oyBTY c=1 sm=1 tr=0 ts=6a0d9dab cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7MBKnE05AAAA:20 a=EUspDBNiAAAA:8 a=Wz4qH61WVlOTaqajxdAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: _q7Rg8m3nwx9bQiySmQ4aE_mnmyv49ot
X-Proofpoint-ORIG-GUID: _q7Rg8m3nwx9bQiySmQ4aE_mnmyv49ot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200112
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
	TAGGED_FROM(0.00)[bounces-108728-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 91C5F58D360
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/20/26 12:29 PM, Krzysztof Kozlowski wrote:
> On 25/03/2026 04:53, Sibi Sankar wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
>> Add the sound card of Glymur-crd board with the routing for speakers.
>>
>> Add device nodes for the sound support with WSA884x smart speakers
>> and playback via speakers and recording via DMIC microphones.
>>
>> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 110 +++++++++++++++++++++++
>>  1 file changed, 110 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> index 690b90e3d6ce..88a5c63e8ac2 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>> @@ -118,6 +118,54 @@ vreg_wwan: regulator-wwan {
>>  		pinctrl-0 = <&wwan_reg_en>;
>>  		pinctrl-names = "default";
>>  	};
>> +
>> +	sound {
>> +		compatible = "qcom,glymur-sndcard";
>> +		model = "glymur-crd";
> 
> That's not the name which was already used in Audioreach topology and
> maybe other places.
I agree this should be GLYMUR-CRD as per
https://github.com/linux-msm/audioreach-topology/blob/main/CMakeLists.txt#L24

--srini
> 
> While it is fine to use whatever case you wish, please also fix that
> users of this name.
> 
> Best regards,
> Krzysztof


