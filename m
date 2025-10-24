Return-Path: <linux-arm-msm+bounces-78694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBAEC04E78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 10:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 639B3189636C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 08:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92762F8BDF;
	Fri, 24 Oct 2025 07:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fHs5qyfc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20992F8BFA
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 07:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761292798; cv=none; b=WsU9zCaLCom9nwCsbcEvU041rnDNUyx24jCIlo5dhdKHfI32BgiW05IskFk+FTlBisj3+4MzcZUo3ROEl+GogbrJzUWnY5f/l0bJJNbSHNsm3KMUfLacrjDXBQtQo21wA3kEUythb8am22iunk4qdNcjIeQjMPdkwy9hLWqjKfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761292798; c=relaxed/simple;
	bh=9qdzKkUxNwidtGg5qokIRznrRuUeGNDdt4Ipztm1jJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KvbgvErYyM5foV6aqu4fSz7P+ysDFnyMea5bL41xn8u0KbUYsFUUGK2uovWBhlgP7lJQPnGyHys3JM8/8PZOC8FF68UuJHadv+I1FUsTolbEyTeVzLsTd1d6ghmlrT88kwmN3D8Ii6ij2lRB2Dc+T3jpkd7PYXkmzcYiUyzlT7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fHs5qyfc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FQLU003440
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 07:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fuIyGKnq00sfHTyE/opfe7bmLAvpc40709+4IDJlYKQ=; b=fHs5qyfcJixJ/hon
	pAeUe+dzu+VSHymPluV0BQnzsGcUrtfYCzT+3IbnK4a/S3H7bT3fRffpMxHO7oCO
	JT1dkGsy98MDLYtwLovkSNQXmUYQFRoeowWgtr/y6qbL+SV5Drs+G5sBJV1Hi8kX
	VVq2gryAGNEgdLc67HkO5i19PBqm/STA2vhmsFu+DKyd9JMq9BbYA0xj+UMWNyUG
	QvwgR8CVdRV0rwuawxrYGxoH216QK1qaXXfh6ubeaQet7QqG0H0omSPuAnjLRH1O
	kLsTta464MPdT5irmdI0VjnqS8eWoR6n8vevrHYVCluMJq/MesAZW801+7rZnUV6
	rFfQfA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27jb625-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 07:59:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e887bef16aso4564961cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 00:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761292795; x=1761897595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fuIyGKnq00sfHTyE/opfe7bmLAvpc40709+4IDJlYKQ=;
        b=krMbRYWZtmmthLwCX0WucPfdBX7h/0pbWVhfyTR/G9C+BL5CebLsuQ6enwELYBZYHa
         1RztJpo+DG1epJDnpkdHw8iA1CFHwm1ZbMIIdQCyDOxvBZBIqn37Uj9B4rkeLDodjSTQ
         3OnDsLLJz5PMbRC9Upap//usCyx8C33MGnvG+2ferDsL6pm2nvF38k3h4mhcsa0vYbDm
         Zgqw7qm/mWkMUIGdE47cSKj9XbzhauGJ3y5i2KvF0vY+T74OcXyxtDWmxZXzedugbRMr
         TjMwg31eUr4m00VevTJbIl7dQ7fU4LJQIU2zncarHr2bjMOL3JvoUlw0DPWNNjYPJXx9
         b3tg==
X-Gm-Message-State: AOJu0YzMhDRHezTTR18hpY9IgNBPi/Ltwoet091yNTPfc3bm9f8VVBOj
	sh3HSk3VhVURIIcmevMfKf+DYM52OfN0Vp+hvsxvHt+VoFS5md4NVHFMWslVxUzhabhMo4qT9/E
	3zJTbOt9hiJWaf4cOGpYyO/qerC9UMPZlphYbbZPmkgcD8X78Oxxviz44PlY/vrBVofGg
X-Gm-Gg: ASbGncvgnkhBQU825zRUF4MyP61hXrgVgLhvLKwgsXh7OlTP3ulmBjwl3nUMqiY6UoM
	ZD0dyfXymWIVMtJNKFmYsXlfV/oE+6XaGqVVApDXRzpY//GiB/gdL4JX/oDUeNI1stxAZb5zLMw
	nGvTUf4SBKWiGVTKJ08Hm/Vr+tyLSSmesdOcBPRVc0vyi1Jl07tfotIFIzOeFT/fv2Ik7acsVpU
	LmavpGb/22WUmEr/0nRUEfh1PQIRZy+G+fcpRb9cp1h1QWJtVEEciDOzwHJ9Iig1rcOcRqRJXMR
	MXVz70zUXO4gJ3SL1Kx1q+DGS2leRvVDqAY0+6MtXQSt8mx9cuyttOnN2YuB3Y+V5dMfP19+mA+
	oCjCssBC9bhL9L4wqmCTFQoMrJ2PcOv0pGLNiKuh5rtIQt+pSuQ8IhCEg
X-Received: by 2002:a05:622a:1a0c:b0:4b5:e9b6:c96 with SMTP id d75a77b69052e-4ea116e2fb8mr114380521cf.7.1761292794853;
        Fri, 24 Oct 2025 00:59:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrPmBQGWI5ofRE81ElAyZ58hzjoOsMkKuLVYPW5g1VjELKe0SfysdfObTDgxtmAz9Kjx5wLw==
X-Received: by 2002:a05:622a:1a0c:b0:4b5:e9b6:c96 with SMTP id d75a77b69052e-4ea116e2fb8mr114380371cf.7.1761292794282;
        Fri, 24 Oct 2025 00:59:54 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d5144efbcsm472338466b.66.2025.10.24.00.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 00:59:53 -0700 (PDT)
Message-ID: <150836aa-b69b-4dfa-8118-4c32f181e03a@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 09:59:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: talos-evk: Add sound card
 support with DA7212 codec
To: Le Qi <le.qi@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
References: <20251024023720.3928547-1-le.qi@oss.qualcomm.com>
 <20251024023720.3928547-3-le.qi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251024023720.3928547-3-le.qi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX6zvy/74TyAS0
 MFT19y7kHuot/15bJFW6SM94YxbE3AB/kVuwnNnLyzUUh+r/9vtYJXzZNdYXTGdXmjPt+Gg1F6q
 GDTthoqIwUJ9jddpF7O5J+mVlJ+BceV2HlxsYC+W9OD01982+iBJxQuBSEOBcRO0l0luAL7Nenk
 sen9PayP75QyOixLPKxLfS3C/9SttgJ2ioxaegDGMAwiNMZMlb4WKW6hPCNB2/Vieh5gyRJMLxM
 7Ccwo+OqanpxpVtINSinnoRaySRzyvoQNmj+XE04yd9uTIUY811n2+3z1pU5jNHFpnqSeR4K9nq
 no8BCTgjePp5iBRV+0jKSUpiROL8Zwwp3CJxSkxTBI3ky55/2aRivq5DGdUPAjpwMl/A4J5bg5p
 KLufER5T0jCmS3NoTqbGHs48tStdIg==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68fb31fb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Q3T1G7DDasfguL93IWYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Cv2mTGdezVM279TJgaATZMpB3IVuG8BW
X-Proofpoint-ORIG-GUID: Cv2mTGdezVM279TJgaATZMpB3IVuG8BW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

On 10/24/25 4:37 AM, Le Qi wrote:
> Add the sound card node for QCS615 Talos EVK with DA7212 codec
> connected over the Primary MI2S interface. The configuration enables
> headphone playback and headset microphone capture, both of which have
> been tested to work.
> 
> The sound card integrates:
>  - DA7212 codec on I2C5
>  - Primary MI2S playback and capture DAI links
>  - Pin control for MI2S1 signals
> 
> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
> ---

[...]

> +	sound {
> +		compatible = "qcom,qcs615-sndcard";
> +		model = "qcs615-snd-card";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&mi2s1_data0>, <&mi2s1_data1>, <&mi2s1_sck>, <&mi2s1_ws>;

property-n
property-names

in this order, please

[...]

>  &tlmm {
> +	mi2s1_data0: mi2s1-data0-state {
> +		pins = "gpio110";
> +		function = "mi2s_1";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	mi2s1_data1: mi2s1-data1-state {
> +		pins = "gpio111";
> +		function = "mi2s_1";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	mi2s1_sck: mi2s1-sck-state {
> +		pins = "gpio108";
> +		function = "mi2s_1";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	mi2s1_ws: mi2s1-ws-state {
> +		pins = "gpio109";
> +		function = "mi2s_1";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};

You can group these together (i.e. create a single entry with
pins = "gpio108", "gpio109"...)  and move them to the SoC DTSI

Konrad

