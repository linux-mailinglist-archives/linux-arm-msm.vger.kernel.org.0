Return-Path: <linux-arm-msm+bounces-85509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F639CC7C85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 14:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2635319D0F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 13:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01EB12561A2;
	Wed, 17 Dec 2025 12:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DUzMzH+/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MD6EGg/u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD4B33D6E9
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976223; cv=none; b=SGwh0sFsayHp923+4+Aumqj8T54aHZ8R16HAX0FoBxjai8qeIf9GpxEVs+rSf+s712cPlXbssPbwrugWOJ5RUtdCIZaz89PdAygpuTRDxf70AJO90rP22f/jd54aS2bcDN8YFx2mHX1L63WuwIdViMIQCTXF7jz89Fhhw77qH2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976223; c=relaxed/simple;
	bh=ztH074MDFqearVN3nF0jMLfGMXFpi7sRlzEIzX/mkrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HdofoQra82Nn3NOhhppq2OH9EA9S4mGKRHSgfRyjnVj7ih3Gii2T6PlLsTpMy3SZhZfIjDseFu/9fnbBcG4cR6UHOkw7+Fio9oGWiROTfJfC9iIFMcqoAX1t6z3TyFvh4K0Y+vSnNxfD0vYyusgk6/hUbT+IM7CD3BSkMw2rgjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DUzMzH+/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MD6EGg/u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKxgL3048815
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0xDNUQP8yPoy+Z+qqy+MqMkGS3ISZvZ/gefBftMMrmc=; b=DUzMzH+/R5zDPtea
	dB1BCwyGTIFdhv4XF8viFio1qNLGCLV3Ci/7do8JPzEyUCnEpfzRhp2CiOwK53p+
	U1dqW89xFOVDpUAPSuruXACP7eJDX6qfEgSSQfsn1WRhcXiVhgtEbSEVZLmjoUqe
	5Hk5/oGwb2MUHH8RMEHneh4McYGFD2j6/KyY/wfTknGNcq6e0aACMLf5Pl7t8CRH
	CNdw8cTznA0wBMkDUeMm2i7/P9Um24XUll0SmxequFtZiAwaegOKjEvutDfPEC/q
	Qxtcaq2rPycKUAr/kVlsuFzzj+icZJ5WdCiHlgyGzVwYNtkHIaudLp3acmWRRqfx
	o4mFnA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3jgqa012-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:57:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee23b6b6fdso13083161cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 04:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765976220; x=1766581020; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0xDNUQP8yPoy+Z+qqy+MqMkGS3ISZvZ/gefBftMMrmc=;
        b=MD6EGg/up4hCdlSZ7ZLSHrdCMP9QpPvnW4bgAb/ZmpnAVXVEEBW33MxsCl6CO+GZV+
         avcIc8hSbkv+QhqCUxDsoosxAvYuUtgMgcekyUXTYeXeY7sYX+yP29WhlImNerA7peKv
         xLnzFAYV6cSNYrUzB6g7jo50WUz+w4uA8RBpoU4YqQnl7Q428it/Y9Eg2Z1e2yW4jLdN
         rQnWNrWBmUPYeMg3Y2LZXgwXH/fgIpFciKKfBAMBasUln9dHH0FsS5SQqMrMOVPfLUaX
         7NneH5X7gG7S8oWu7po4uFsMujd+uVwU7Sef+CawdlVadWKWefb+BDhrNoCBbNasBAKm
         x2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765976220; x=1766581020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xDNUQP8yPoy+Z+qqy+MqMkGS3ISZvZ/gefBftMMrmc=;
        b=T5U1cjoVESMlE5LVJRGGwjF+k9IZhkEgW9CX83tpk/Nbe/7q9g/e9/Vr/mQwiCRzOT
         UFDitXA5CRc/JnbJi0NJi6dl2mh2LRpAmsMUYxdfzRUZb+WKtyoR/EeJoP0+9X6zDE9w
         9EnxJhyzOKS4H2KL+xPB0ZtOXGsGvKbvUKsGkakD2Vw4ekxfMw/JuEYYpQLP5ttZ99Aj
         rxZFn4XIyHg0eo9QNFh2d/yv2QppCwfa6HyrRurlMyb8Mn5dTsQQwoVmA5z3O/vmgcxO
         0XJd3QXTuSnZ6P28PKv/p0EnTXJCp9tjycuCp6AY1Tr37ha7KYLDRLXysEN0p9N8zOhT
         PRtA==
X-Forwarded-Encrypted: i=1; AJvYcCWGmelVXnymDyWq98sHhHS//YZv76MzZl3Q8E6jmud5rQowxzbqU7ngQoLV4HwyAsrDwBsGZicMRYvuZB4k@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmfa4z06Q4tXoUzePUrXrTOXrUd9QAXTeRLJ8OjrTihhao9Pjb
	1cySqUSKFV0oK/gc3CJJot8qreurxuFwptXiZKwsnNRNJpispOcWOBrs5aM1o7BXhD0SnPAjKmg
	7WsMWml2F0hE+cPjNApo3EdcflA7OhOedh3b6M9bq9BIBXyUoHMyktDK/I52jAsPmP5P5
X-Gm-Gg: AY/fxX4zC3Ec/giHzx10Qm+CpP5Np0+PdEYVBe9yUfSYeDXAhW5XEBB+iOlsrHQKsZk
	0L6Tmy/r/dMwSkTD4cJ+0VjAiKFUhvf/o7mcD2ZVgImkrHwF3QhpSyyB9sv73xOibFrXFQi5Sy1
	O++1BXhNsz9GBklKbZZjGEIOq/lu1eyTIMg6JqOTgs0IT0QUxjx0Za463FLQXyzQzrCMsP1x0+s
	Eu0h+uQF+Yk980TVwp9QCJG2CwOmuesa4ZwC+SKU7TRmjyWAiPwtswWZZEdmlo6HYgp8Nnnx7Mz
	bl97MA89ewvDcNDZOVc+7IjhrqKyI4yLrYhYIK0SS2y6AS9PmZBvNXA4o5b/Pt66VQiuf5ncwlD
	Dg4lhJ3rViwShIlVOGBNC+x+58/j8USjEnuIw4YO7TxBYu/OU2+M+NPeosCn/+kPw6w==
X-Received: by 2002:a05:622a:4b:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4f1d05fc5acmr191874341cf.9.1765976220477;
        Wed, 17 Dec 2025 04:57:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0uXhmc9jYsTPLzPNNmrw1r6UcwzVCFaVA28oMEk+IYkHnnHxKBchHiLlmSJ6qbqmVUKxOBw==
X-Received: by 2002:a05:622a:4b:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4f1d05fc5acmr191874051cf.9.1765976220078;
        Wed, 17 Dec 2025 04:57:00 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2e6dc1sm1936263166b.17.2025.12.17.04.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 04:56:59 -0800 (PST)
Message-ID: <a07ce738-b48d-4950-a25a-89a3874c4a84@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 13:56:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: sdm670: add camera mclk pins
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-5-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251211014846.16602-5-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VLjQXtPX c=1 sm=1 tr=0 ts=6942a89d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=3dje6nBDnuay-3FIa4wA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwMCBTYWx0ZWRfX+qrdCUd0Qwoi
 acphiqiET5r6bD6eha3vsKgIE2AzGZdrWVlPd481hccxybxd9WA3sPzfvo1ieTJiyWQfhA2gZoS
 tDMndtOzVxM9WO9B4GF6Rc9y65qZbvK2b6Zut9M1Y+2UXxOAqIe1CynvF1TAPMU205DZZnlSpky
 OYYLS/Ec2/GzU4yw2Ohkic685Y7v5sMphWtiFz4uqnnz+FA6UwBPdshmonbVVHFxObku5bAlxSu
 E8w11D3/vud7Gr9yZ6b0adOR3lcOVEEbpl6z01dJhjT86wTEFfx8tXgsESrEHPnHMLU+LTa1uuD
 mX87+l84WWQ5guQsUEVtbzwaXz3PnwjQgl0ZKs24jGI+jbt7arWwTU4hlAV5+yH+0u/3ggmeLJo
 oUdR2wZjkJPpJz+sZ5Qu21hHchkOUQ==
X-Proofpoint-ORIG-GUID: wCpwTi4xLkVdA6xGREH-kEUHTteTw2YA
X-Proofpoint-GUID: wCpwTi4xLkVdA6xGREH-kEUHTteTw2YA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170100

On 12/11/25 2:48 AM, Richard Acayan wrote:
> The camera subsystem is added for the SoC common devicetree, but the
> mclk pins should also be common across the SoC. Add the mclk pins for
> the cameras.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/5135823c-f2e4-4873-9e3a-9d190cac0113@oss.qualcomm.com
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> index c275089237e4..69e84cd8ed27 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> @@ -1190,6 +1190,27 @@ tlmm: pinctrl@3400000 {
>  			gpio-ranges = <&tlmm 0 0 151>;
>  			wakeup-parent = <&pdc>;
>  
> +			cam_mclk0_default: cam-mclk0-default-state {
> +				pins = "gpio13";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk1_default: cam-mclk1-default-state {
> +				pins = "gpio14";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk2_default: cam-mclk2-default-state {
> +				pins = "gpio15";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};

There's also mclk3 on gpio16

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

