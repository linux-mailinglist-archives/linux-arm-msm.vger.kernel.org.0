Return-Path: <linux-arm-msm+bounces-118731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CSfCJUm/VGptqgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:34:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE48749DF6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:34:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=V+gCeISA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ts0T2PH2;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118731-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118731-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C304E303F06B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A2F37E2EC;
	Mon, 13 Jul 2026 10:34:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B506C35FF6E
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:34:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938862; cv=none; b=s2ReeveTYWTc1xRxrzSdP6AbiV2QqwgJ9O18VErH5dP1V0LCbFEsJlUuXgMHd5Kj+TypwqjPB5FCUG6YC1A5GE1LtaNKPHKF5UTkZ7VQI/9gqipK+VazPQtpTKvkkAE35eoOfASyIEjQbZKiVxGMZM6jdNGlxMFeCZp+siowRd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938862; c=relaxed/simple;
	bh=80uvDt5MU1fMdxcH8e+Lh30RDkAELmAtxtlNNHoW8+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JUsVz5y1Gwl147HGWoNSdFKOI02w/iLxORDyKRr/VrmSfnjE/cUeqtBwG8jFBy0q60yYiPn/NzpKFkEmNCJEU95e+/GCtZE8zK7ZFhD4SYX7tibeVamISv5M/FlIMTfr94CoovKDzkAVPwc0ouh95VjHe4Tnz3+bnCWij3sV69E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+gCeISA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ts0T2PH2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NkRM668639
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hStT8qpaedXjiHKccL1ATtGNxSXRj2aYF7INvKg5ScQ=; b=V+gCeISAvfz1jB1z
	zjcsdfJMqSC8J9qKGLfLRi7G7QlXsrHxw0GteUuJDKtCcoyugYbWufARqcQ845y6
	D0Em2KCROztDRovkWvTsnKpwPLTTF8ZvVLJvmgfQ+EYgDGnGLybk1pMvheCosQZI
	H2OdfBSavI1FSZu7slnxEekGwINhbAIQfFspf6KoYloGchjEacDYJy+kSLcIVzwn
	lJUveFzMUGelHx9iAgSIdNOuedCGXG3rz8cec+PY//P4U7eGNb4veuvEMuorigIF
	rlP1rMdqSKQac748gSJa0x0toM188gKucmezY33huD8tHU8YRMKBqG4KPqg6xILX
	dWsoJQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm23rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:34:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1c7f135bso62337171cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 03:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938859; x=1784543659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hStT8qpaedXjiHKccL1ATtGNxSXRj2aYF7INvKg5ScQ=;
        b=Ts0T2PH2DpVlkkhqCAijdswi6oNnu8jgJHfnVHZrRCJwp7ZLFRUynpTMN7A9anyQ+i
         vuHLSdADr4Lcz1MiC+EgR92nH8ZwrNrl8ZC5WCqaRpbVTCUP1xSt9EYQIiNzDwKdqGRP
         JTBjFVgAJ11Kt2RL2o7jfOnXTfG17+gNSIPaYwraceSeDmByQhLPAhZm/0nIA1EbebjN
         MnsugcCJtTeh0EUCp1Aol1v4L1R09RgFivU+peQO/iMq3LpSNEeoPrt6kwsWyBTvruoK
         P3jbj2qNNsgr8o6SaYRf6+SX/MyWKJ4VypLWBLjhwALbcldi2nuZ0mTrJa5sPbDW9O62
         U1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938859; x=1784543659;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hStT8qpaedXjiHKccL1ATtGNxSXRj2aYF7INvKg5ScQ=;
        b=afXYcS4hj0lCYP75b6DiNjllxF6N/87wez4qnKS1Zz4O6XQIKe5IJusatr/7e0l+oI
         BbGKu8yq8pAdKhbVAU5oYHrzLY4c6RbRcBoQLp7YO1cshdNLbl5Sve3XNGdB5GJzG2NH
         R8cS0HAzLqZMPtq5Tza/xB/0qwTA4yk4m8VX3cEaCjGUglfiildBrV4UsT1HvRVF5Wlt
         a/xzu5Qx5hSRlOD/VlD9sWpzhVb5LlRACIh2CguJO5cWd5v9zSdGSLT7WPcmcR5zVc8s
         ioEz7A6QH2xO1UwMg0hwmUvzJ9PROTv4Mima9ZAorEApBJRwsLmc2kd6ohOjyhTpwnp9
         wUgA==
X-Forwarded-Encrypted: i=1; AHgh+RrcYuJ9QePUlRSIyFpCHMrzJgf+xVv+UsP3DZA3dxLnRyVo+uY9IGS/y4mMMIaB5of1bpWy5Lypa2W8/4PC@vger.kernel.org
X-Gm-Message-State: AOJu0YxBQrdHV1ngXRUCRFRF9CJfVCkB7ThbpxqThG6MpEaZJ9573mwX
	mneovBS7Rze+JxUKaHDYi1a2/Mp8lFIdxXwP0nedHSejWkJWyJhNMgfDH1eiNqpF/DOeOdvCw7M
	8gmCNsoG49GiqzNxUBn4BKlmtSMJdhloxEPBg5H4qTJYwsvLOVTgUI2Z938Smk/EDuU9N
X-Gm-Gg: AfdE7cmCqpo9JeBn7kShOqol6DDNfynGrJ8GfbMt38DkBaOCxjNg1xifWzxp4VKDNLS
	X/BztAEGs2m2mNOgxwdycc81GxMeqWjuyepGmNu494O3qUoI6nG659ZHRObvVw9H/PnReG8EHvq
	U7D7HRnBWiYFavlHCB+ros8N7QYV3HWeMojENHyRYPj9eJs89cUieQ+RKle2FMgxHne0xgY4oRS
	qbsmEK7oWoh2RnQKYvtADHUN2kST6Fp9ggkoPvmUQ00XGDSS7S9BPQrniVClKWGg+i78TI9hKst
	7F/vQUB9hx3N1xexecLtu9pINduya9kEs7+9i/Fi0B1QHDPn6EVeCyREZecF3sZz15ZXrpER2S6
	M9Z8SYdQ4gKwsRYEhEQ3mTu3oNMWBYbquS9Wy7KNDtzk=
X-Received: by 2002:a05:622a:95:b0:51a:8c97:fb9b with SMTP id d75a77b69052e-51cbf2feb65mr80671071cf.68.1783938858775;
        Mon, 13 Jul 2026 03:34:18 -0700 (PDT)
X-Received: by 2002:a05:622a:95:b0:51a:8c97:fb9b with SMTP id d75a77b69052e-51cbf2feb65mr80670781cf.68.1783938858362;
        Mon, 13 Jul 2026 03:34:18 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15de6c565fsm662932066b.2.2026.07.13.03.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 03:34:17 -0700 (PDT)
Message-ID: <b2f62e42-b909-481a-8aab-07aa5e866665@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:34:15 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: sm8250: Add JPEG encoder node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-5-atanas.filipov@oss.qualcomm.com>
 <h2fskxtlb6wusoz7o5pw34ii5n2il4jltcrogmt36676ioq5nd@klwft4s3mzgk>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <h2fskxtlb6wusoz7o5pw34ii5n2il4jltcrogmt36676ioq5nd@klwft4s3mzgk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _xVyb8OoKTjXI0Pilz8OwU5lVbUMA2jv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOSBTYWx0ZWRfX8Zij9UavfA7J
 RUF/G2oFWNV0mXm54JGKSSbvp3DoMGN1sHT1re2xf9XUXa9eqScChx6iieXS3kB9N4iwXlWH3zq
 vsZrTm1wXmW0PVtkU4IyOQUVeSNDEo1J3ZYy//ZUcydoGRMbZW8MIl9qZ+ab/Vw+fbme2nRhgXg
 RkyySeTmK3yn7lXQUJAgiRSkDbmFStYAoqwidVjBCSbPVF74hcPT3Lm+vH7DpR2fuEzA60iXQkF
 T/pWP4yfmXwSM05Lk1B1Wn5uno55XQcfgwDRVVFXCI+wlcS3Aic81VTTAwTP+Mmh94fbp2klrAA
 6FOObvF/CCzOLmWcMh9HnHRITj6eHJHkx9UdyFMZyOC2n5vXr8BKoUSncBiBXVaTWubgfRmgMW9
 cKmvI3c2d6KkJ4wVG2016FCb4ZVxeJ/cjGoaDMEWeed29s/pmr47qUT0vsTlpJzVS7aWcRghTHW
 QqolESEPqwXV566pljw==
X-Proofpoint-GUID: _xVyb8OoKTjXI0Pilz8OwU5lVbUMA2jv
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54bf2b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VDI__ZYCjcDFRWE0z6oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOSBTYWx0ZWRfX8NM9tP56ubBZ
 iy4wIwIWAThfhcpEEbqRN6bZtnEoHyyq7wMZWIKSw/Pbr1EsgwldP1VyRZhChWuyfCkDkDDPrX1
 3Y0Ho9Co3qq8PC28tanUrcOJ8cqy7bw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118731-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[atanas.filipov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DDE48749DF6

On 7/6/2026 3:45 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 06, 2026 at 10:11:12AM +0300, Atanas Filipov wrote:
>> Add the JPEG encoder hardware node to the SM8250 device tree so the
>> qcom-jpeg V4L2 encoder driver can bind and operate on this platform.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 81 ++++++++++++++++++++++++++++
>>   1 file changed, 81 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> index 7076720413ab..a089b706f60c 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> @@ -12,6 +12,7 @@
>>   #include <dt-bindings/dma/qcom-gpi.h>
>>   #include <dt-bindings/gpio/gpio.h>
>>   #include <dt-bindings/interconnect/qcom,osm-l3.h>
>> +#include <dt-bindings/interconnect/qcom,icc.h>
>>   #include <dt-bindings/interconnect/qcom,sm8250.h>
>>   #include <dt-bindings/mailbox/qcom-ipcc.h>
>>   #include <dt-bindings/phy/phy-qcom-qmp.h>
>> @@ -4471,6 +4472,10 @@ cci1_i2c1: i2c-bus@1 {
>>   
>>   		camss: camss@ac6a000 {
>>   			compatible = "qcom,sm8250-camss";
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges;
>> +
>>   			status = "disabled";
>>   
>>   			reg = <0 0x0ac6a000 0 0x2000>,
>> @@ -4649,6 +4654,82 @@ port@5 {
>>   					reg = <5>;
>>   				};
>>   			};
>> +
>> +			jpeg-encoder@ac53000 {
>> +				compatible = "qcom,sm8250-jenc";
>> +
>> +				reg = <0 0x0ac53000 0 0x1000>;
> 
> 0x0 instead of just 0
> 
>> +
>> +				interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
>> +
>> +				clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
>> +					 <&gcc GCC_CAMERA_SF_AXI_CLK>,
>> +					 <&camcc CAM_CC_CORE_AHB_CLK>,
>> +					 <&camcc CAM_CC_CPAS_AHB_CLK>,
>> +					 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
>> +					 <&camcc CAM_CC_JPEG_CLK>;
>> +
>> +				clock-names = "hf_axi",
>> +					      "sf_axi",
>> +					      "core_ahb",
>> +					      "cpas_ahb",
>> +					      "cnoc_axi",
>> +					      "jpeg";
> 
> What are the clock _inputs_ on the JPEG core side?
>

CAM_CC_JPEG_CLK is the JPEG-specific core clock. CAM_CC_CAMNOC_AXI_CLK
gates the CAMNOC data path and directly affects encode throughput.

>> +
>> +				interconnects = <&gem_noc MASTER_AMPSS_M0
>> +						 QCOM_ICC_TAG_ACTIVE_ONLY
> 
> Put tags on the previous line (even if it is longer than 80 chars).
> 
>> +						 &config_noc SLAVE_CAMERA_CFG
>> +						 QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +						<&mmss_noc MASTER_CAMNOC_HF
>> +						 QCOM_ICC_TAG_ALWAYS
>> +						 &mc_virt SLAVE_EBI_CH0
>> +						 QCOM_ICC_TAG_ALWAYS>,
>> +						<&mmss_noc MASTER_CAMNOC_SF
>> +						 QCOM_ICC_TAG_ALWAYS
>> +						 &mc_virt SLAVE_EBI_CH0
>> +						 QCOM_ICC_TAG_ALWAYS>;
>> +				interconnect-names = "cpu-cfg",
>> +						     "hf-mnoc",
>> +						     "sf-mnoc";
>> +
>> +				iommus = <&apps_smmu 0x2040 0x400>;
>> +
>> +				operating-points-v2 = <&jpeg_opp_table>;
>> +
>> +				jpeg_opp_table: opp-table {
>> +					compatible = "operating-points-v2";
>> +
>> +					opp-100000000 {
>> +						opp-hz = /bits/ 64 <400000000>,
>> +							 /bits/ 64 <100000000>;
>> +						required-opps = <&rpmhpd_opp_min_svs>;

In downstream there is a dedicated CPAS driver that aggregates AHB/AXI
clock votes and bandwidth requests from all camera IP clients. No
equivalent exists in upstream. So, IMO a few approaches are possible:
1. A dedicated ICC provider that derives clock rates from bandwidth
    requests — we have a successful experimental POC of this approach.
2. A dedicated driver similar to downstream CPAS.
3. The CAMSS-as-parent approach — trade-offs already discussed in this
    thread.

Having each client set camnoc_axi rate independently is not a good
solution due to last-write-wins semantics. For JPEG specifically this
is a performance issue only — the encoder functions even at the parked
19.2 MHz — but it is a correctness problem in principle.

Until a proper aggregation mechanism exists upstream, the OPP table is
the only way to ensure camnoc_axi is at the correct frequency when JPEG
runs standalone.

> 
> Inside the DT example i saw bandwidth votes. Why are they gone from the
> DT?
> 

Same root cause — without a shared resource aggregation mechanism,
opp-peak/avg-kBps bandwidth votes have no effect today. Will be
revisited when such infrastructure is available upstream.

Best regards,
Atanas

>> +					};
>> +
>> +					opp-200000000 {
>> +						opp-hz = /bits/ 64 <400000000>,
>> +							 /bits/ 64 <200000000>;
>> +						required-opps = <&rpmhpd_opp_low_svs>;
>> +					};
>> +
>> +					opp-400000000 {
>> +						opp-hz = /bits/ 64 <400000000>,
>> +							 /bits/ 64 <400000000>;
>> +						required-opps = <&rpmhpd_opp_svs>;
>> +					};
>> +
>> +					opp-480000000 {
>> +						opp-hz = /bits/ 64 <400000000>,
>> +							 /bits/ 64 <480000000>;
>> +						required-opps = <&rpmhpd_opp_svs_l1>;
>> +					};
>> +
>> +					opp-600000000 {
>> +						opp-hz = /bits/ 64 <400000000>,
>> +							 /bits/ 64 <600000000>;
>> +						required-opps = <&rpmhpd_opp_nom>;
>> +					};
>> +				};
>> +			};
>>   		};
>>   
>>   		camcc: clock-controller@ad00000 {
>> -- 
>> 2.34.1
>>
> 


