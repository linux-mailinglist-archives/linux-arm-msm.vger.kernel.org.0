Return-Path: <linux-arm-msm+bounces-76186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BC6BC0FF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 12:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5D0D3BB19E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 10:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F292D8DB5;
	Tue,  7 Oct 2025 10:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+ycNSwX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546D82D877A
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 10:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759832471; cv=none; b=U+6E9vfKktxKZS9/DpRP+KN1d2PyXne8sJ024h6qMNAI8eA6mWBzDBA1trYgiYAwJh78/ZVfYFKrlaarBodQo1SeGuCRRbNNLf+m2Z8kpZYO50ShXuXd/12Xh5mJVOWtbgN+2xn+1wbZi8bGCjEtRwxfB31SupkKdsTY4q3iNSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759832471; c=relaxed/simple;
	bh=KlWcesGR1Y3SWb2Pf+LplrfVxqm952BRg+WXsE+1NQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SiCiW+3r4GLICEBxY0J5a6nKm9lM2iHZ9EG7nA7g81B3QGkNZbC9m+tuZpLtJHa65kWzbcQWXyCq/pjm8TNLH+UUxy1SCa0qVZyQWglBfyyFhVU8ggp9Iu+YfRjKMiUhnTEK4jAZXg2T5Cg8qjxV9syutl7XxUt/LyrvjeQKqJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+ycNSwX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5972rm9N022432
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 10:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tIo3KVM+K+vyiDHJB/HcD4sh2FPBitsVu91g7TQ4ScY=; b=O+ycNSwX3MX0aqxl
	Dkk4gPB5u1MUP0WEYGqTFzZZJtfONNuB46zqc84Q06K4BJW5Act4A3HfY6cyXuFf
	P+GbZ9/TWBJmuIj9IEAAODyXSyswR78fcRhMo2Q5idReHwFP7eUXsL9IFBe9+UL5
	Hq4KZhMkyLmfNbyBPbj9WsU+pLUXzAod/DtugcNqm4Ik8s3bWtr12n+Iin2w8vXI
	fLWD3sKuqmrLGDxXyskJvMbDcNyb31USMMwkk3imLOaWxowwfNpqJqiuGnxhH5VW
	fLe02yE7ffaTyfLNCi9LfPKLuh0MzVZTTxXX6ufpIX8Xbas3a0uyMlFrHzPU3Yh4
	SmPbBQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvv7psrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 10:21:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-850553dfef2so16307686d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 03:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759832466; x=1760437266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tIo3KVM+K+vyiDHJB/HcD4sh2FPBitsVu91g7TQ4ScY=;
        b=U7u6Ck1tTl7mwkH6lvOxTZoRYlLE5T976AEVo13WWBHlHZ82vQJ0h+6rc7MdvPNNsT
         eM0KcablK8pDth3fi7RID5ZmqECuIGAp3pFIFg4FqUMiA4Th995uvUbo+gNvO2yHepbY
         IuwM06GQy2HocTrtYulOAfen78AOp2XSvUlXrU7L//sG2CU9YEoWvFOpWL02ma7B5Ick
         OxxIdh0/bAZy+C1PwYSsayxCTKNOyulRobveX68bNlY3okiDfdKL5N1Olg/oN3c4S+OB
         +Y39KHms1IFLg/mIUOLhIQUUcHwypJ7gmbeS+InPfWGDcWWcuqg7ZuNY7UICna7/khXj
         O+hA==
X-Forwarded-Encrypted: i=1; AJvYcCWSOdL65s3+AnhhmMmFO4UFpXaNBDvp0nEYsrSh4t4QweD8/B8lh9UkVqdkecpUDUSxaaAuSMRakJ30+sVt@vger.kernel.org
X-Gm-Message-State: AOJu0YxCG56FN7Qf0ScJqyHwQHymrhTAYOkAobFWJ5+SdPvYHE6Nc9fm
	IimfTDOaWCoLr0WZY/cHXb+/Dth9b9UI4ohHuNpcC2g6yxFuUZSXeBM5APsHAY4I8c4TWc61W60
	2MsXyzmbeU13QEsw+aNQPRvl4f7PwWf1ymJX6C6SglheoYW11vNt2O0N26IrUeBddlSdh
X-Gm-Gg: ASbGncsD/VeU7KCFARsr3LN7jxvVqp+wq6klQ3/9bsNFmxrlcvwjrxREDCScYmoi+dM
	WiLofDZ2f5OvF9GrXH3bi/YB9BS5hWzs5fPBUVlgyJ7zFqJeHli3i7qNSHT31Um4GLWuDA3smgD
	3XPKaQbn9MhB107F2/QELlZiUTkGlSW8C1SZ88e0uNfJcjBrYOo2ZCrs442uuYBn1zAbdXna9qF
	3MFrl0+G+T1EzNGFFSaoy4KQhRUWVCRCOFJst9s1Bkb5Xv13ijzqoJROMStQIKpFlTCdODjTfAo
	zQL7hFbqltG57DZyo7pYqSCmu44+Z080330micfT9dGaGiIyNMimHv8jbc3oIg6RcMVcU1g1ndY
	hdaxdmQv1t3Usrc5TrZbMPvHi5z8=
X-Received: by 2002:a05:6214:486:b0:815:2731:3f4c with SMTP id 6a1803df08f44-879dc869283mr128952166d6.3.1759832466037;
        Tue, 07 Oct 2025 03:21:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHY3578mf169SfhBSI1JAa+gLNy0tM6jidBQPfZwdM2VQXBIOCyg9olplyRBFv973g54ofICw==
X-Received: by 2002:a05:6214:486:b0:815:2731:3f4c with SMTP id 6a1803df08f44-879dc869283mr128951866d6.3.1759832465465;
        Tue, 07 Oct 2025 03:21:05 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6394bec298csm9271021a12.44.2025.10.07.03.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 03:21:04 -0700 (PDT)
Message-ID: <6d9af57f-9174-405b-9131-145fd6d63a5f@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 12:21:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/6] ASoC: dt-bindings: qcom,sm8250: Add clocks
 properties for I2S
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org>
 <20251006-topic-sm8x50-next-hdk-i2s-v1-2-184b15a87e0a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251006-topic-sm8x50-next-hdk-i2s-v1-2-184b15a87e0a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNyBTYWx0ZWRfX7L3UP4Ce2XqD
 SJNWPljC2TdxQ5Xmu97zPN0xZ3uQd+iRvNNxGDPNeRIp+9J6waqYXORItEqrs4OEQdxB7w+jy7W
 EGk8+XCz1IDBWgg6Y+Qt2//kF7St3WKRQVLcVGOzqvdlZuAkiz6jeFtpeFM/Xh2bN6cIt4CL+AZ
 1E+dkv7cXKae1ahAZA/fG1DC0xaPjoLe+Mb5Ob5g6T9l2sEpSfykItwXFwwtOrLbOxhs+KoA5HA
 D6t9xORZyPKr3f3CnFdzgqzJTMS0uvuhEXUep8IHXsrKfHFzYVD5afVlFcR4757hAq7FWjNSX/T
 qbo1D+SBxO1rjk56uVBzhRGyWrviStnLjua+aY8eiiW0xLy2aaleGYHZAinwsKVRsz6AlB85QCE
 br0Qj+u0sbiMYrI1eNeLoGsNmGyubQ==
X-Proofpoint-ORIG-GUID: S96wtmVv2EQc4rZ4Za65bOZV84E3DvYv
X-Authority-Analysis: v=2.4 cv=WIdyn3sR c=1 sm=1 tr=0 ts=68e4e993 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=MuNeFZabic1NT7NxDHkA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: S96wtmVv2EQc4rZ4Za65bOZV84E3DvYv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040037

On 10/6/25 8:37 PM, Neil Armstrong wrote:
> In order to describe the block and master clock of each I2S bus, add
> the first 5 I2S busses clock entries.
> 
> The names (primary, secondary, tertiarty, quaternary, quinary) uses
> the LPASS clock naming which were used for a long time on Qualcomm
> LPASS firmware interfaces.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

There's also a senary (6th) I2S bus instance, which there is no reason
not to describe

>  .../devicetree/bindings/sound/qcom,sm8250.yaml         | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 8ac91625dce5ccba5c5f31748c36296b12fac1a6..fd0d7a7ddc7b363a66e1e7bd72c7290666efb511 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -64,6 +64,24 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/string
>      description: User visible long sound card name
>  
> +  clocks:
> +    minItems: 2
> +    maxItems: 10
> +
> +  clock-names:
> +    minItems: 2
> +    items:
> +      - const: primary-mi2s    # Primary I2S Bit Clock
> +      - const: primary-mclk    # Primary I2S Master Clock
> +      - const: secondary-mi2s  # Secondary I2S Bit Clock
> +      - const: secondary-mclk  # Secondary I2S Master Clock
> +      - const: tertiary-mi2s   # Tertiary I2S Bit Clock
> +      - const: tertiary-mclk   # Tertiary I2S Master Clock
> +      - const: quaternary-mi2s # Quaternary I2S Bit Clock
> +      - const: quaternary-mclk # Quaternary I2S Master Clock
> +      - const: quinary-mi2s    # Quinary I2S Bit Clock
> +      - const: quinary-mclk    # Quinary I2S Master Clock

I think a single top-level comment saying "mclk" is the master
clock and the other one is a bit clock would suffice

Konrad

