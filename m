Return-Path: <linux-arm-msm+bounces-86497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74714CDBA89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:21:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03E223013549
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 08:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7947D3101B4;
	Wed, 24 Dec 2025 08:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEIHoxST";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e3/pMZR8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01ACF823DD
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 08:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766564458; cv=none; b=TqmOQOTGWgEsWJNQS2lh6ICvI3sGBp4Vy43YQGYEKrrdHbFBCg8o0uF57pvt5CbljCPlFPTUCETaCehbfpVwRDTKPU6tyzAJyQhYMXuOA/WgNZegfbbcDltiZTKuBCg1VcIhCI+bqee9zZJlrheBYltCoQNvjUxv0ed4Jh77UFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766564458; c=relaxed/simple;
	bh=GSU5yGNtEOFMKebMqYnsrC3weQDSAQFw3sFP+vYsDkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LVAgupD6aKq9xyM656A3UU6W5y2yG0PFkG5c0jJm03hcmyMir0RqJSvpEA4kPMZ1u57TVfYRMK1jWPdu+c4dcpvFrvIfRHCpiN2aJwtqHuQ6scdfiKXkF6IjvxLy4f1orLB7KxOfcm2Nkt3CGn/H6tGoK3QxMvnSKZyn0SejXM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KEIHoxST; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e3/pMZR8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO7uCDl1056162
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 08:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EbcdHEnt0rdVycBwlDK178QvcbxGSwRY7tSrUvZuOok=; b=KEIHoxSTIwsf88V7
	5kyvHNIPj4V9AWAb38nnRpF/jFdgsQthz7d4qSaV3+59OQVOZiEAkyqggJsMwzE0
	ZIy9Al4vOCeBFuzfhGEestBZqVQPPee19eri3h8cdptrkzUXFiezhAUYESlBvyQu
	UVwFeuP6mZSOPAGyO7+heu3BVVFLnWmSxKEsE3tCv440nMtYYd02T+l2tMOFPJzF
	NJ7JqoEpxoUdjZC/oCM0cuUJtrSQANjDdRn/SbfR4xjVj6aBwKbyiqCi3yNJ1wby
	UtfzMBqqlu4Ewhmmq30hJXD2ikH3L3d1fPCmQUs+/2dM95U+q8k7bhBGSAtZDark
	6A0dDQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v1u1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 08:20:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c904a1168so12311487a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 00:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766564455; x=1767169255; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EbcdHEnt0rdVycBwlDK178QvcbxGSwRY7tSrUvZuOok=;
        b=e3/pMZR8/fQP71RokkITqQGPC3G4DnySXJ2GTJpegDurhyPb1opqE0RnbVhRntvzlU
         61NkFeejljZhkLlrOFSj29dX25K345PKdReR5k/GL9EOE7qxOgKao2504CKKFzEbg3Em
         2h/l07whIrIRNmV0cioXQy/cSawwFBRiX50lhX9GFgJbztld3+gn74SK24vM0G7FFRv+
         rEUYJX6ZSKHmV9Q/cFO/D0qi0IFfv24kQ8egsCdDpBrgXVTudlRQg/C66STPIA1Y1n1/
         KIq3egaZqniFr8E7y51rz3lNW2j6TL9ruaiYyz9kizd5qlkLXIcBRbYOsdfJPS2le9MP
         UiLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766564455; x=1767169255;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EbcdHEnt0rdVycBwlDK178QvcbxGSwRY7tSrUvZuOok=;
        b=WFADlHK9SBPJs4NQASUC0U5N4ibLAT3Wu+MVm9zsyP1BaZXuiF2vX0IJHuQKMdYyMZ
         oZU3fMJ9kFxRBuM8ld3lL9AAXrLmaGT3c+06sFX7fSmbIPPjvS79s486Wz755Wgn0sJu
         eDIlum935AYlqQOoBgYzeHJxx69Tc2fodgjF+gqmb39Tpgh0jnmPiYsQgIqjckLSCpn5
         ERCbX8/j9H/vZfU8EdzaAU2yHLe9X7wG25Hqt32ixhAXiXnObAlL76Zhj0o4yeYehqZ7
         ypg9RgoD+MJ5hf4QwjfGBmONfyQNLMxf44ShLXpgLD98vfH4MJlXFxLKiQMdHgXXlPj1
         nYuA==
X-Forwarded-Encrypted: i=1; AJvYcCWlyapX/V+shvrV3j/lxAFNC9ItcUoRPdt6uT6kP8Xojj8S1x/KRcAexgyN4skq31eS2RhnL4I6N49Lw4d7@vger.kernel.org
X-Gm-Message-State: AOJu0YwNr1bTe38n49D/Z4sjh0cRxBkTS9mwcbmkwLRjKB7/gR9/PcDA
	L6mRkMLK5zyEjMQa2yo0+EkXeLjTkLRxfMwqIXMVcSb5DBY9Plnryv+PR1wcgBZcYJjz5ni5U7n
	dflwv4K1WJ3+5wVqIxTEc6bm+Tt3m6z0mZ1nvGi9oHza7EVcalNGT5fT40U4all0zSrFI
X-Gm-Gg: AY/fxX7UlgT0auoEl9FPZp6DD3dJgZfNqAWCyKTKzjWsuY3ZQIlVaLTP9J8/SB6UtZI
	xHO+B3RYoW85VcM89S6m4kwcpIZSRdE2eg/Uus2X+Cd+UxJXeIuLMd1Y6rPORZMZvwylvxxOuga
	QG+ALljAamv7jTGKhRFCwBhLwUGYYPOkIo4dpGPbXv4Y9s5XSDQ7eNVYXO4z4uEtTeRiAaB/A2C
	/TjYWEM0Y0Rzg+oNvyTo5isTA4TiEJE3nkqm7t+xXILjBnTnwRAXxj/rAQaxlYzJJFNPpFlKEZg
	FqY6/3rofwvgjrqaVu0ZuJsmU7uhb6QzJje5u/ecEhhknRfZpnUaALg+YvlmNG8o5+9J0oH5LxQ
	jk3ZlY8pmRG7uuwYq6q98E7iapLBSFnNzOJKbW+6sLw==
X-Received: by 2002:a17:90b:2749:b0:349:2154:eede with SMTP id 98e67ed59e1d1-34e9214e677mr14067926a91.14.1766564455525;
        Wed, 24 Dec 2025 00:20:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpNJi8TUG80yxK6/I8Wztg6e2acb+GkGygU+f56Eoxmw1V3ergpeX3o4nU5Gn7hQVrf5V46A==
X-Received: by 2002:a17:90b:2749:b0:349:2154:eede with SMTP id 98e67ed59e1d1-34e9214e677mr14067900a91.14.1766564455027;
        Wed, 24 Dec 2025 00:20:55 -0800 (PST)
Received: from [192.168.1.11] ([106.222.232.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dcc7bcsm17906048a91.13.2025.12.24.00.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 00:20:54 -0800 (PST)
Message-ID: <c46a42ff-36df-43ed-b9c6-a6778ac7a791@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 13:50:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/8] dt-bindings: thermal: Add qcom,qmi-cooling yaml
 bindings
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: rui.zhang@intel.com, linux-pm@vger.kernel.org, amitk@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mathieu.poirier@linaro.org,
        daniel.lezcano@linaro.org, mani@kernel.org, casey.connolly@linaro.org,
        rafael@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
        lukasz.luba@arm.com, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org
References: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
 <20251223123227.1317244-4-gaurav.kohli@oss.qualcomm.com>
 <176649836333.2975956.6455328748183813008.robh@kernel.org>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <176649836333.2975956.6455328748183813008.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA3MSBTYWx0ZWRfX/HGfN/zolLYJ
 /CFKcvYOWIPDWZAd7g9eBPyxoH2sqF5Ps4DvQMjs+3PD164u7cg3wcJbTd4s4MdurvY6AD7oN/2
 07ocwiqR2sBX2Jsi8gxmaLcp+tjqY1/TpHUoFL4PsMkSufVuVvfy6vf0o51cR2D7xuJL5DVLVQc
 XCuaT0BsgGQs0Bo9b2kcjjcgxHUutm6c6GTpKFgMKdw16lHfX6Q8k7iDwz9oTIWtakL651r4qaC
 uJ0kgtzo8BUDTvCAvPi56g0YUb3UGwsY4bFffGltB8qntyrko/R8n055c0sYfdxQmrWO2s+TfFw
 FTHC6ewG+/NucauwKNHnFrb8gBly0kyBMscxoMLsR+14pAIGdcV8gHYQSPONoe4ZWpQoF3Zq2P0
 hDU4/wFcUO2+QRTj8u86lj4zg2nHxR25yfg5iyQvb5kuY7f0cga1AwlF684+6GhC28LpyBcjHuv
 4Id9KF+s9OvErVN06xA==
X-Proofpoint-ORIG-GUID: x70PKLqQm3wnIIyhjIUof-s9D31iRdVd
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694ba268 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=pk+8NuH2X28N4C0eta/h1Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=QcnDgq45NsFIHwn4wVcA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: x70PKLqQm3wnIIyhjIUof-s9D31iRdVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240071


On 12/23/2025 7:29 PM, Rob Herring (Arm) wrote:
> On Tue, 23 Dec 2025 18:02:22 +0530, Gaurav Kohli wrote:
>> The cooling subnode of a remoteproc represents a client of the Thermal
>> Mitigation Device QMI service running on it. Each subnode of the cooling
>> node represents a single control exposed by the service.
>>
>> Add maintainer name also and update this binding for cdsp substem.
>>
>> Co-developed-by: Casey Connolly <casey.connolly@linaro.org>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>> ---
>>   .../bindings/remoteproc/qcom,pas-common.yaml  |  6 ++
>>   .../bindings/thermal/qcom,qmi-cooling.yaml    | 99 +++++++++++++++++++
>>   2 files changed, 105 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/thermal/qcom,qmi-cooling.yaml
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/thermal/qcom,qmi-cooling.example.dtb: /example-0/remoteproc-cdsp1/cooling: failed to match any schema with compatible: ['qcom,qmi-cooling-cdsp1']
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/20251223123227.1317244-4-gaurav.kohli@oss.qualcomm.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.


thanks for review, missed to add one cdsp1 patch in this series, will 
update in next post.



