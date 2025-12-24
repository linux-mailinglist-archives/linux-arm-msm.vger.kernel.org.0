Return-Path: <linux-arm-msm+bounces-86462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E44CDB319
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 03:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFCBA3004237
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 02:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F362882DB;
	Wed, 24 Dec 2025 02:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVJLUPCe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bn7Mbe2W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EDD2857CC
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766544305; cv=none; b=XW5SDbPUGAOqjK8yhAnP87+rYcB6fQKRYy7SF7PZeyhXwbgcWsPuf4NX4NWtC5AWuHGYRq1egmd5Xy/eHVShPUYp/7PC00f7KDdmGpDyS5FNLCGTUZ+UHVVJQ5l4nGPl1gwjHLtiL52hO6C0GFBMK+Pt7QZIQ0LhdzY4b5m0Dws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766544305; c=relaxed/simple;
	bh=bD1cb1E3J3z1i8ZcgFPIL9aVpMF8d2MjSlH32Zn5Aro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VaXbRNOfzFuW0Dic7lW6kZBNioTAc2SuU28ZDrvoXtGcqQ+/ojL/RnvouD1HYEM7o9yXFws3GOUB6NO9pQJHCxGytso7/hAFBSIANMIyznjFRMowN4dYQb+ERSkvGVCR0U5wDRrBfrqjfpAy1guNgNQ7SC7hOFDjg6Qh6VYhC5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HVJLUPCe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bn7Mbe2W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNHrxlZ678609
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IfGjHhbYw5xNFTJJyktEctcbFF/Yp9ewzr5cQJX69Zc=; b=HVJLUPCeMAjP9Hn6
	EjFK+JpMgEUsNtg80sezMg+9Nohm8na+Fl5eKYLriPdgSMtHD9ldRjRYT0Bdxl81
	zFtd5doYHLJ/q5c8tiBzZHrdD3yCTPWe5LBvcnaxME4ykBylkoUkMXFQjvj++4T0
	470kOHhMndXvWGHrTI6ymfudPNK/aBME26PQusOkoZsjlMbW3wlDuij7zyKmbNPx
	ItTgjOHqPbQtf69aWb28olQS0XClUos5P0lNfOHwZiBiOwUhLyAwHYf9oz/zbG28
	aduhMemrSExHRECrpdOe6t6Rfywr6wmbaPYJMEfuP1gHRTxbhtfxbQ6R216mNE4W
	Gsz4Dg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq1840-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:45:02 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7c1df71b076so11132655b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 18:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766544302; x=1767149102; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IfGjHhbYw5xNFTJJyktEctcbFF/Yp9ewzr5cQJX69Zc=;
        b=Bn7Mbe2WqiltGO34vsL0/nuGMVMyFuddojI38ynAwMWMqDPnMWlKdhUN9dY4J2sZa4
         g1Sq9WV02n8g92QkAxGBVJi+CS+nufiDjHYM5W14aAcPrdD8wB2XlXXW7pekVorCPNSM
         AdMYX2gUdF5hdLV/yJO1m1ljBRe4HS28YGzN8mq/BZPG/XwHc55cUDDOFeNPziUcOfiV
         vvU8OW+pstdrYrzEYAgbfAarXypoTrMLXlMD2PRuYN0kQ1AyXV1j6XlxGKs9E+U2Lvn5
         a8+Sp2ymrw0mvwJ7IyYV6JGNKgkQXmTSup3tb8DLNLsPK1kP+fdHI1fWe4ZFe8N8kc9G
         jPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766544302; x=1767149102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IfGjHhbYw5xNFTJJyktEctcbFF/Yp9ewzr5cQJX69Zc=;
        b=JDDe0FWxuSIPbzKI93AIXC99jMLuOllBoK+IQuDHMV2Kz9vrcYuuhBFYGLEjPx2jzG
         l72/rDTUFUFTwgk4U4eL0dHIZqfTkLw2o04lXsDiTFpav65cvQOMxquVzI/Aq/njsKMX
         bWG6Zjx2yv0c+O4VrcWzsbyXClBQRV2ld/WUYarRvDVBPxA54YfHngIEy236EZA765zV
         AOZXFfVAAWEGn9Cq3KsnFRQrS8fe2AzrCnyM+7JLZ4fhD5fakz/BPeDdsg6dneAnL46F
         xTN8WijWPUwdjETiI4A9I/Ces24DxdXQjcO8Wgx1gnUgctb8nDXoPbIjnb/ffo1qlLRp
         Qd4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJ18mhpWRjJ5g41BZkN9c8wyOoHnlrGuVTTLALDL+Dsvh8cJ7n0cf2tfbw9bI3XuCQKbllD7/rSe74Cmwj@vger.kernel.org
X-Gm-Message-State: AOJu0YxiGB++nnGSQX7LOWbB8iLB+2uG+0NJl6826umF9zKWBtExjlb5
	QKff7iBq8AKcqJDNBrKV2ApCSi3xc9yeHYvGG5OeYNeL6jgJgPaJ5XCMYizVKzY4GVFEXTTD1zK
	N1aWu65ybzXs5+q7BrmalCPqlOjc2Ea0N0dKpnptvjudqcO0eQiHbplf1WvYpOehoswjj
X-Gm-Gg: AY/fxX6wOLxxlU/RnQfqKPeECu/EoUpxruv3IHpZPwpDGUUJE5+ec8uUN36USUtbCHL
	EMPFH5LEiXBKBhZLT7WcEo8YPbYK/GZy1bRb5v4/AXR40wnTs/YexgJoItNgr42OmeRgiTrZKyY
	AsaqzNUVKbfwJKIUvB7dFSR74brHGWLl8CIKjK3W0YvtkKoTr/lFdberVbeh2f3kqoJC63+C2Pw
	VQOv/bhkVFBFNoVPSmGJ+llR4xX5r0qgUcmE0wboI+nnM4vM9pqEatDUhXvjMQ0hZNUoSVwSkEf
	ZrnA+8ddr8FTd18KGsnxBnKzOdQBuhLakdKxA7K7gtdzHqsHkJPQkWaqDzEjP+9kuzAO+7Wm8sR
	Nnq1vJxAUDRbOx9dJg6GIbyUvM9ToEMine2LUMVp2Aqa5eahrPhZ2OxxY6A87JkzYiT7Tq8ucaM
	cpUXoe
X-Received: by 2002:a05:6a00:1bca:b0:7ad:1e4:bef0 with SMTP id d2e1a72fcca58-7ff64403ff2mr15613567b3a.4.1766544301871;
        Tue, 23 Dec 2025 18:45:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWQuhrBW4esQyr58tJTAvLN4g0/+Ce1v8UPn55MvG0FsmylDmfWdjb4pgT3FzooaYOpOg01w==
X-Received: by 2002:a05:6a00:1bca:b0:7ad:1e4:bef0 with SMTP id d2e1a72fcca58-7ff64403ff2mr15613538b3a.4.1766544301400;
        Tue, 23 Dec 2025 18:45:01 -0800 (PST)
Received: from [10.133.33.224] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7af2ddf2sm14968649b3a.19.2025.12.23.18.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 18:45:01 -0800 (PST)
Message-ID: <bd5f3700-8c4c-420f-a3d7-5b2429c0cd56@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 10:44:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali CDSP
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
 <20251223-knp-remoteproc-v3-2-5b09885c55a5@oss.qualcomm.com>
 <20251223-loud-pastoral-ant-f9e74a@quoll>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20251223-loud-pastoral-ant-f9e74a@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4bVEKhL3fcGLT0VPhM1X86te6sU6HkCc
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694b53ae cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=4G0_3PWqEY5C_guDPkQA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 4bVEKhL3fcGLT0VPhM1X86te6sU6HkCc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAyMCBTYWx0ZWRfX1mdMUw6fL8h6
 i1DifauHUs0jW7eU3mfOyPVnY9sTnDFngZeU7OL78WMvkYT0ERrDn+FB4sB48/gpwmfqyrSub/g
 cvPIxzJpMdysfOayOZ37UoWnqNjAv7G5WsgDsZBRwU4qx8jlvrgzWD7RMv7SV9Id3gAqmxWZqzM
 PLB04QtXlFrKG0RIRa78yoM7pDPCX5/4wRnrzLRBo6FFMpy83HgXB/wQ8bxeTmqZMcOT1Jb+Y+z
 r2nr4QPC5ISFn9G6aNw2Id7iUI/ma+UFeIZYXu5sB7/xGP5W3D6kiqCTIE+ZZ/SLnExJsRRU6AF
 CBQaMHZ5oLqwhITXlKFHgNAYy2CtcYobw00NhB6zslD9S+hmDrwxphK3Ae3WNpu4TsW85NQ5KG/
 QAboCwrIZ1+1GQRzjFLMnmXjshHyyf2plilBKqtj1c9Qz/5VOeF5QpN3VEB3e8V+WCL5saOhY2/
 tXolS1F1GHrdqNb4qKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240020



On 12/23/2025 9:07 PM, Krzysztof Kozlowski wrote:
> On Tue, Dec 23, 2025 at 01:13:48AM -0800, Jingyi Wang wrote:
>> Add remote processor PAS loader for Kaanapali CDSP processor, compatible
>> with earlier SM8550 with minor difference: one more sixth "shutdown-ack"
>> interrupt. It is not compatible with SM8650 because one memory region
>> "global_sync_mem" is not managed by kernel on Kaanapali so it is removed
>> in the remoteproc cdsp node.
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> index 31dffd02125a..3b66bd106737 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
>> @@ -35,6 +35,10 @@ properties:
>>        - items:
>>            - const: qcom,sm8750-cdsp-pas
>>            - const: qcom,sm8650-cdsp-pas
>> +      - items:
>> +          - enum:
>> +              - qcom,kaanapali-cdsp-pas
>> +          - const: qcom,sm8550-cdsp-pas
> 
> This should be placed before list with "qcom,sm8650-cdsp-pas", because
> we generally sort them by fallback.
> 

will fix this

Thanks,
Jingyi

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 


