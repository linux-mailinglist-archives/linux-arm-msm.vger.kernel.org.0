Return-Path: <linux-arm-msm+bounces-77617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55139BE421B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 17:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E97A5E2F1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 15:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D301E343D95;
	Thu, 16 Oct 2025 15:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CA8PzSRj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486C033439D
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 15:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760627300; cv=none; b=mrTSE0p6AEZatSo3fBPMgyEuqKhyM6/OUaSXxKmwV7PXJVCv2nhozuSoLlxCm58RvhK5O/fCUN5KhThT8SKtJ3CaPMBEIX2i+T5HZV72+voiOoUvfM7Xteu8bK8YDDIW2w5NRXdZxECBt7EwDLZD2KD6OcpCc4JYohcW+xhvhZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760627300; c=relaxed/simple;
	bh=G99ZPbE0qrXEWxpI9cnRms8DfqdX68C4eTHKs/UcMD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sYIyb0UI+nMr+r/VQ4N3D48achi0aymcsDohuiWg2xdwJ41f2CJ2ZqVs90vvUqx88ovThk1ASkRrsmqcjrjv9ZvIRm4o2WKhVQ12PtjRym3o7wxxzLnmWzuVRGtWWLuRQlM1RhJxJH8S0XfPj+0y20LOCvQt6+ltio0E/iBwotE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CA8PzSRj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G7f6RK004300
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 15:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FXyMiKp6Pe+UsoaL5xjvf5aBb6HRAlCgHcOZD/wdeOM=; b=CA8PzSRj4MsKetOp
	iFUrF9KVRsp8LxbZKGn3ZZL5VBCWuTNtrZV5mlGAkOMeQcYDnQXpJew3FjH+fQF8
	FYMKGerxmrMflb9ZnKj7k8gO+basMKX5D04Z/JFXEWJkTKgxrk5kXI3P9U6fktiz
	BMoOqgYkgiKcDIzU3E1tbeCrc8O6+jYCQ5ko4fz2rdQGnt+im4UkTDfIjAjWd7n/
	ybC1e2jaRRbhFitr2xA3vsOc12f3gXRObrkGuBK9IeHiFBuPboM6+6anVyOBwPwd
	CEMkeyVHfYHB+sjfO+nz6DoD7tQY2f7lhRqhNQ1zdZj8QIhNhG2sFN0F3N+Uagmv
	1CMR8w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1an0a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 15:08:18 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-554bd7f39bfso458000e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 08:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760627297; x=1761232097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FXyMiKp6Pe+UsoaL5xjvf5aBb6HRAlCgHcOZD/wdeOM=;
        b=vsgHYBGFn4/Aho9QjimYiKOVKCbEHjKKZLT1EaF+/vnaVQOK8wMH6f5b3YryHFPvFM
         G6I+x663/ObqRbhGDGmhgdeTUc+eJKZ433OuI9KZ7g5CrziiclVrox0E3q/U/HtM9SWB
         BmG80G8YCgYzeK3mI8FS6Xpc1MF54hWIR0eRFYmjP0DOU41+hEf4IBbELGJjFiJhO/DI
         GQeIWnrXLZv3CVBr9YNjy/zxBYWsYWlbTjVa+N1zD4bDMjrcuta/EHvHmcnWtCOVXhZ+
         zREDyF1DwSubVXnz9/AzCu2R9rlXRfLt05Onn67vdE/OeBQdDzkxCG9h3sfcp6+m0pw+
         +4DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCZQNXqilUPW/RNam/uE5vG/VcilhIj+d00XEz4i2++lInrDJo7uCVreBYRit7+uofxaZI2G4wvjeRz00r@vger.kernel.org
X-Gm-Message-State: AOJu0YyOpOoTsr4UGWkGLLEEbRPqCN0gbytdacqZqQdV448a5bR/fumK
	aOeuZ1dI3T892mJXUmZFwk8hfogQ3E3bcKB6EGaZAWUrwHa6B4m5Ht0PeN35Y643C+MUpzfX7B8
	w6yL8Vbr7l3qjWlOLPOXjrJKHP60v3SXY7iCb1vKoWgDJlSUxJt934bdboLy/XyrSRr3I
X-Gm-Gg: ASbGncuAwBOl/IBivVFNeb8Db8R1i66EtRq4MWuNehHW1QLfnQyoxO5OT4pfKST6KXm
	ABqcx8r1kWyEyQeJvsYMLabr2Fe2yHH5rRxpl9rl3otzcbCqosFxQM6QvDmTVOlvqEu1jhUhoqc
	rdwUyuvngVWH4peeG6V1YCFDAlbUrAfJ+ugkV873yr8POdI8fo3g8L2VU9IOObGrSZQpl7ZbJfq
	9IXxcUi5kFMmFgHSCJpz+RbX4/m7MeOPBLZFOy8Gavk2nBR0jiiwcC4zF8apqi+qMAVLcGD8giy
	E3VO7bWeEy2NCEGGQaLln+h5DHVMPb3uWaI6vNmy/8BxmRfmS8VHoboaoZiw5D/0hFYIvwr9H14
	tIx3Z19bJJdNzwvQu+ArcfUBfbw==
X-Received: by 2002:a05:6123:2e6:b0:554:b927:dd96 with SMTP id 71dfb90a1353d-5564eca468fmr356751e0c.0.1760627297060;
        Thu, 16 Oct 2025 08:08:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPWieiWFaaKyulx2rok1ilSzb8mCz8kPrQASfSURizbtH1xNaE0Q4mMvEcDFXidP9X2/I5HQ==
X-Received: by 2002:a05:6123:2e6:b0:554:b927:dd96 with SMTP id 71dfb90a1353d-5564eca468fmr356696e0c.0.1760627296637;
        Thu, 16 Oct 2025 08:08:16 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42704141cc3sm1877857f8f.9.2025.10.16.08.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 08:08:16 -0700 (PDT)
Message-ID: <b0d9cec5-1162-476b-8438-8239e1458927@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 16:08:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: sound: qcom,sm8250: add QRB2210 and RB1
 soundcards
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251007-qrb2210-qcm2290-sndcard-v1-0-8222141bca79@linaro.org>
 <20251007-qrb2210-qcm2290-sndcard-v1-1-8222141bca79@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251007-qrb2210-qcm2290-sndcard-v1-1-8222141bca79@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68f10a62 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=7YHmJdMxG_e0k3IJONEA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ogbb904AWP7q4nuk8dJ49VXX66RikKpp
X-Proofpoint-ORIG-GUID: ogbb904AWP7q4nuk8dJ49VXX66RikKpp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX5x0UDKS0+H1C
 ipu1j0CPH0+8WwgbpE2wxNZKBdRkJKdG7cDWjNXdWwwBAKwv2GAA7N9tHJXfSKRWZyCnSlgdetD
 o+CB3kuai41h1BGSK8KGbFjE1S6Z9KDOa4DrZjsoXe0KhYLb3d4kFV4xUe5BGJhZK8kX2ZArpR9
 niLa5gHz6OV+oa79RoHh1tT1NyJtABtuWsZGx6gzfUt2RuabrP9spCV3wn025ilEzz8XDSQh0Ce
 tNvfS0k78WYevredghLm1ZfLjlKV1QaQBY7AUXNG/8pLL1Bt7kYy9UR6v0qipwEKIikZqSPqt5k
 2kun9RZ2z5BknJJg9CXAO8rRbSJWgrP3pfPdmKaBV8AdlG3YNV3gr2eURrgik5VUeJoA1nE4haq
 F5ewSKYcJ78kgGK1IFuio5Y8WBMCjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035



On 10/7/25 2:26 AM, Alexey Klimov wrote:
> Add soundcard compatible for QRB2210 (QCM2290) platforms.
> While at this, also add QRB2210 RB1 entry which is set to be
> compatible with QRB2210 soundcard.
> 
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 8ac91625dce5ccba5c5f31748c36296b12fac1a6..c29e59d0e8043fe2617b969be216525b493458c4 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -21,6 +21,10 @@ properties:
>                - lenovo,yoga-c630-sndcard
>                - qcom,db845c-sndcard
>            - const: qcom,sdm845-sndcard
> +      - items:
> +          - enum:
> +              - qcom,qrb2210-rb1-sndcard
I don't think you need rb1 specific compatible here, unless there this
is totally different to what the base compatible can provide.

--srini> +          - const: qcom,qrb2210-sndcard
>        - items:
>            - enum:
>                - qcom,sm8550-sndcard
> @@ -37,6 +41,7 @@ properties:
>            - qcom,qcs8275-sndcard
>            - qcom,qcs9075-sndcard
>            - qcom,qcs9100-sndcard
> +          - qcom,qrb2210-sndcard
>            - qcom,qrb4210-rb2-sndcard
>            - qcom,qrb5165-rb5-sndcard
>            - qcom,sc7180-qdsp6-sndcard
> 


