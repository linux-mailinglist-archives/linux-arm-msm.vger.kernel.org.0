Return-Path: <linux-arm-msm+bounces-97854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDdHNo+yt2nUUQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 08:34:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FB9295B03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 08:34:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E3B23036618
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 07:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8410734FF78;
	Mon, 16 Mar 2026 07:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hg9KE2Dl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tf2beJTl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CABA30FC27
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 07:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773646397; cv=none; b=KbqAIBL3pjUjvxCbv5thEnmsriB6MsvGx8+SkzDrrD8Zp+ElI7KcQj44JVds39g5k59BrC6kaeKIXswDCXdgGz80VPowfL9dYsppzUxDHJ4qUBSoES8vzG6TNsnILGEeSMoljhXuCXcMNpPe/kVSuXcpvgpi7NKxtbDFHRqIL/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773646397; c=relaxed/simple;
	bh=uHYgmmzfU5Zao5BII+0huGKvDzXccFTVTUM9nfmQBVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lln69rHT4chhvgl6AZC6NgdzjbGaiT35foitCzgDKeLQhlJhzD11vwTEEz/YctfBi4KqrZRcEvQZqkaSeIlBr77inyyq4GRiswUSIgpt+YtQR+ahstZ3Tv/KHsVMgMHasN6U6eZMFfYH2hveaQvDs0bZX2KPFchqBrIDSFcBpkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hg9KE2Dl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tf2beJTl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64fYq1066849
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 07:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vK7mvmous20WAUDAVlmQwFXMhJJ4sYSgW0kW2NqSHEc=; b=hg9KE2DlZnWM4V4B
	03uqfMW4hdvpJ5kP3+jyYi7xNS0M5mR8TE6rJzIVXM5CFu9D1Vp6BNi98HktG9MM
	8lidDftHtwrYWmaBLnQpWVqmQ0oAbX+kZgVdX0yA+diRHFwK6L6XpwV2art7Wzll
	URQMqQF+dsoeegLv8/0dJWPJ6R8sON0muGMIMyl+vkSFrAiDhe0lTUVUhQ8TLN14
	ufYH0JBZpje4+qH4/burppLC5lSMBbcQkEXfAXY8NpaGbyYrE9l5sxV0pLI3+/1+
	I39Hay+3bf1nbKEToJuaqrSgiC874ja1qSwXgD+sHNN+gAqKsEsH86kBcVTAc9zX
	9uYiLg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw027cn3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 07:33:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aec809f910so258252905ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 00:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773646392; x=1774251192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vK7mvmous20WAUDAVlmQwFXMhJJ4sYSgW0kW2NqSHEc=;
        b=Tf2beJTlHdMtKJcd1WNkjZoYISIHSd4RNZ3yTIL0Xr6G/bLswKDtlamtag4MIgzxGG
         Tusn3jJFjPq6fELuHeq24khsG6ycI90xxgV191HvXR39hq4eStqpYelpdy/01EIS35qr
         fv0fUw2pHQJhPafvdLS/klgPv0T9Wi/3mHvK1l6F4eRMbuch+Y0wCiksIeudpjtuXIld
         EjNoK/Ssunke3XTK5VR4vGXsLBoT83mFEDy2IwL7xDl1swllWqOoikWMVQKxfvXBoABS
         oJCOEWmyVHd5wxInnaY3GmKWX8LjXTD2u1IKBRm7eBK2Cs600Ja2YbYTJnjnQkhUVadg
         RQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773646392; x=1774251192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vK7mvmous20WAUDAVlmQwFXMhJJ4sYSgW0kW2NqSHEc=;
        b=U3WDfiCUzjjVpTD35tZbx3dnpwIwLQl54imKsezzJEius4lyDoqDii1sqf9+paPMIq
         dpxul7vuW3e/h6V0bIYnJs4r+KrAexT9qd/NKC2m2Q9hv5nQ80lAuxo8WKfkAxLpZqst
         wwuJxWCeF5vhRyMAByvhWLSJoekN9wmB1CU+CtYnKSAunQhGqeApxmSMYTKMDinKdwz1
         IvU7r2QmxDq/pxqPKssx6a+/YourNBlsiOn1ycIdeGnHoZMUwAtSqr2zJS+E37c99Nr9
         vy2/Foa6FkNM7M2i+MzuqxnNXzJneIy1LKhWe9+BZXbKgCo5jqTxTmLn6NhOpzenK7td
         FbXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiovgnup1O8CnpW1VfLGLbwhZZ4vNBYvVGL0xHFLwv26IP6QBlBPGw5yADwuRZY7cvP2tCKpSgXWYAFZ2g@vger.kernel.org
X-Gm-Message-State: AOJu0YwSYO0g8Dt7xUx0XoMJKGe7S/YtlCJu3AE5tYb7UXLf/z1JfsPr
	zYM3wsNFglAzmb7jlMO/Cr7XyHbdm6EvA08pD6UJruM2unweAftqvW3FvNLk3Xq06h+tQc2wtnh
	wLV1Vf3BcujA74qgbPz9twfUS3WXbgilFxOeNM/rOkYU2g4FYUA4GX7yMz4Psv9tIvtcS
X-Gm-Gg: ATEYQzx78RhUxxmbSrdHtKqzD1rQuKiW+iY+8alAT/k5kccGNKDRJmsGrqB/d9U9ftR
	N17blIMNJQYPKFzMOrTWJx3X95X9KwEAr7dVFlquRfRYxKOreBiZcN1n9UmIzIgpm14q2wEkriE
	S8W8rKtoa486B50+qp5b5zNI1Y1GnAQAm7XGRDc6syCX8rCjEixmeUQ3IVAT2fA2lu/yk4yi/2G
	sFXstLeBxQ5y+AwVhy+oXCShozmpHDnzqOgcV1baW+ADqXp/gJeKFH/yGYvuZZ/nNriFGVcJXuA
	mU+Fy3UEdY5B0f5FAVxOrAt5rzjQwQ5Lst79cQpQ0rXA2WQZKMbTfrbERNDaCMOcBBIU7lzXyAn
	2kujyw0x69KyPfBWX1Y93gyoEV2kVeKuz3x5ztezSnLtFa26qjAw=
X-Received: by 2002:a17:903:19d0:b0:2ae:4f15:1aba with SMTP id d9443c01a7336-2aecab22c09mr140858795ad.30.1773646392241;
        Mon, 16 Mar 2026 00:33:12 -0700 (PDT)
X-Received: by 2002:a17:903:19d0:b0:2ae:4f15:1aba with SMTP id d9443c01a7336-2aecab22c09mr140858585ad.30.1773646391803;
        Mon, 16 Mar 2026 00:33:11 -0700 (PDT)
Received: from [10.218.12.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece627683sm94854595ad.32.2026.03.16.00.33.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 00:33:11 -0700 (PDT)
Message-ID: <c235ff5a-3a9f-4f97-b7b9-d6a95a68e393@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 13:03:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8750: Enable TSENS and thermal
 zones
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aastha.pandey@oss.qualcomm.com,
        dipa.mantre@oss.qualcomm.com,
        Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
References: <20260313-sm8750_tsens-v1-0-250fcc3794a2@oss.qualcomm.com>
 <20260313-sm8750_tsens-v1-2-250fcc3794a2@oss.qualcomm.com>
 <20260314-accurate-curassow-of-acumen-c05e67@quoll>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260314-accurate-curassow-of-acumen-c05e67@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lkhyb5HZSQDYFTQr2H5ojYUuKG_yNR8S
X-Proofpoint-ORIG-GUID: lkhyb5HZSQDYFTQr2H5ojYUuKG_yNR8S
X-Authority-Analysis: v=2.4 cv=AqXjHe9P c=1 sm=1 tr=0 ts=69b7b239 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=2Jp1USYG6wLNhKp0wP4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA1NiBTYWx0ZWRfX66l15NkC/OQ5
 6u9K+iCp7euOZJcZAAtNGRJl4kHKhKbX8xaUskI1aH4IYu7e0XgI4RL1hKVvBAxbCq5zvQqinMa
 tkjxCdLTV4vmWQCLdQ0gpIw8U8/e+oOwLiKLnoVeN4OROQ5+FgxdtljFteVrPXgnC6j2+lNwCNY
 EOibgNussSI0/ORQGdS3BpWUE9QnOHQq6gGKd4Ghrcboq3Ht5Oc3erbphXtNFUb3k9gd+gZy/Lv
 xP91W/urONrsk4LFMxWDNp4rs0Xg+TfDFWLGjWc7Erz9MD7x6f2bq3CJFJpA5kJjZK9mBBIW1P8
 L90xL8Y/BgadPrn0ZwL50y322LdorNNM3CANpAAQ5RFj/YmAcxsEWr8fUWI1L59rcSghtR6LGyN
 BGV37gW31H8M8JDvkf5Smf2HARdRvsWafbH828kAk4Po5AGohYSerUQbmEObJOtWrAfvHJxjxbZ
 mF+Q8DGQKco/FSRQwhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160056
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	TAGGED_FROM(0.00)[bounces-97854-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.14:email,c228000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 62FB9295B03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/14/2026 4:01 PM, Krzysztof Kozlowski wrote:
> On Fri, Mar 13, 2026 at 04:04:18PM +0530, Gaurav Kohli wrote:
>> From: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
>>
>> The sm8750 includes four TSENS instances, with a total of 47 thermal
>> sensors distributed across various locations on the SoC.
>>
>> The TSENS max/reset threshold is configured to 130°C in the hardware.
>> Enable all TSENS instances, and define the thermal zones with a hot trip
>> at 120°C and critical trip at 125°C.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 897 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 897 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> index f56b1f889b85..db2a97cb228d 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> @@ -20,6 +20,7 @@
>>   #include <dt-bindings/soc/qcom,gpr.h>
>>   #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>>   #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>> +#include <dt-bindings/thermal/thermal.h>
>>   
>>   / {
>>   	interrupt-parent = <&intc>;
>> @@ -5457,6 +5458,902 @@ compute-cb@14 {
>>   				};
>>   			};
>>   		};
>> +
>> +		tsens0: thermal-sensor@c228000 {
> 
> Please read carefully DTS coding style before posting patches. Actually,
> read also Linux kernel coding style as well.
> 

Thanks Krzysztof for review.

Can i use temperature-sensor instead of thermal-sensor as per 
generic-names-recommendation ?

> Best regards,
> Krzysztof
> 


