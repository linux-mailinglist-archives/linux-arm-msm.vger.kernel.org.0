Return-Path: <linux-arm-msm+bounces-71909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A06B425E0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 17:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71A7D5488C5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 15:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221FA28A701;
	Wed,  3 Sep 2025 15:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDzCgIi3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C1F28725C
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 15:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756914545; cv=none; b=OINLZ7hPF7Qc1UK/c7X8qaVSivhdgwIM8ZDTb3QGrv610HYxOi6PZP7C0wrgOdZHrQK5e9uuZYI9JeeQNo8hSVaBpqsW/qYU349u1uMRYPNNiu2tNpwdGJ6XLGgkKmmLO7WVk/QqkzxEFJtn2LS8nT3xElZ7GLF2bsXJX5LTbFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756914545; c=relaxed/simple;
	bh=2ULE5Uv18O/K63JtWkZrrT0etatA9GQnGwfHqCmI78M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=arDBTo11Nc5vFfGIc6LfiFfGGrVRbztvMGbMEVnRaaq/GVg3/AxTgTCDK6u3Y+6bp7fApHda2a1e/u9ZSfbdySWQPzctoDZpg44cJGQ2KqfL+zrp6W7qkyrPHZ3SbIxxIcM1Nhd9YJLuK1Ecr/gxOdaXs3HyXw35Ni84E4eMO+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDzCgIi3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Dx78L022001
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 15:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Ggl7DnvcqKYKRzEbo61Lin5r472AwZUwG2xdc4arsw=; b=PDzCgIi3Qd/Vy9Az
	A8maAscO7Q86iAzljoe0zUekiLoqjN7lglPGAna3zEQVRqpTy/KgeDUTZ1vCwYkd
	GC0tyEIfjTikDJq0v8nalCcEZf6fEEAv0doheJVHKL35Tqmto9Oc9onIcLTeE2qp
	ZGQOEImLc8Ud1dvlDVJ6aAiBpYsRkwBbDW2T9K8EfAnpZy8xqetkw/6nWJUNyStE
	DnIeJiZDA6CLxzmn4UAlzLVPmnK4uOXmsEoLL3Y+5un8d/Vlxe9VJhpmxojudApr
	1a+QiNwEqiM0HIQ7m5giF1oLaWhYnxuirjplFr1lnEmk+aL2KY/U7cFNTY8Prdo9
	O3RXTg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fm5va-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 15:49:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b307e1bef2so132861cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 08:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756914540; x=1757519340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Ggl7DnvcqKYKRzEbo61Lin5r472AwZUwG2xdc4arsw=;
        b=Hbn4dqOeNMBwkU0PdwFWVOuQyLXCnKSWxXUbBNXGKTz8vUhurR3wbfFeuv9eXh8OP6
         JJiupi3yZM5cg1nJyQvr8QmXekntI04yrcWG0lB2ll72p7liY7zECuUgy8C8hcbxTqDC
         kP/znvcLQGrSBLL+kgKkiRcKLowj/BBjEw1QR2x0QDuw0brerFVYm9M8VyClJV2jrqm1
         ypPVxWbA9l/XI2w8BLQM5P7lXTo3S8XG/L+bsKE5YZvoqsh+eCvq+wBTTipnyEQV1hdT
         /XORZMDEzSw0guDH5Zue0nDihO6M2TFcr6/FJmJgysZ+pTBSsup5lrnMzdAnwZZy5dV9
         H3FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL27JmgRUSqsBnhmMmVYeVQogRxReomvxanwHNZtCvsjyUkO5tlT83evbEGeHjArPcb+7hHGZa8C5TClkK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2DqU65zCSLUVPLKXpL0ysK1/NoKNbb1Q7MQoodYb6KdaZcT3l
	OIrCUgtncUQxkTUuxz9LI1K3M2rkVIRieRR1A9TdZH6VuKckBjhzleU7n22ndpOzVxB7DIIRi2/
	ROoIB/+cEyoExKXMGGiidavL18VLlZojHE0OIM7Xp2u5I9rhMHHorZ4q+aHva3xhZnZby
X-Gm-Gg: ASbGncuJf7CrF1gNtWTxnMfpk0xdCQSMtSHOQ09lln3ZlM76CW2ux1naa3oF2mfaGTE
	odf7lp3fiC156e1RW6f3L1j18zOs/H653YefdvDJDzYcH22XxKdS1sRRgJJZ1AjP13h71HU5aE3
	CkUbih6Mc/Sfv55RrWOek5PGBsooyjEwb71pIFSaaSN1MkPmTcZ15VMPIzOifbWN8s95cg5WLZ7
	4vn3pOCrdgnbBP4h0wLG00nvI1vMoDH7b3hrMKGNknElQXcB5AHLvyYD0rAIh/4ZNF01q7fW0FY
	cqGcwDQH+ttkgnnIWwswqbkuV+V0XDMKPUTLymdP3fO+LvTDaH1q7G4mSsEOw73a46RFeZi4sbG
	oAaKnJlMWJiEqtZsPXZ0qoA==
X-Received: by 2002:a05:622a:f:b0:4b3:d28:c94 with SMTP id d75a77b69052e-4b313f91b70mr146098361cf.12.1756914540047;
        Wed, 03 Sep 2025 08:49:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8vnUHPJqOH0REja14CHlT+z31FOaCWS7wMTdIEIxmuSsVShd2Q0XwbPMpBWacrkr5+rw7kQ==
X-Received: by 2002:a05:622a:f:b0:4b3:d28:c94 with SMTP id d75a77b69052e-4b313f91b70mr146098141cf.12.1756914539620;
        Wed, 03 Sep 2025 08:48:59 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc4bbbd1sm12231373a12.34.2025.09.03.08.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 08:48:59 -0700 (PDT)
Message-ID: <bbf6ffac-67ee-4f9d-8c59-3d9a4a85a7cc@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 17:48:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/13] arm64: dts: qcom: lemans-evk: Add TCA9534 I/O
 expander
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
References: <20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com>
 <20250903-lemans-evk-bu-v2-3-bfa381bf8ba2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250903-lemans-evk-bu-v2-3-bfa381bf8ba2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfXxoO7hhQMer8B
 Vl8eCWtEAOifFaOoGQoYiEpSDsOaKkesqTq2MzYzK11+6KDldygdVNzHxiZBnX9wqZHru5o8vPZ
 qXTRzeJY8HqmmAjFLsoEKlmTYIeIJVTf0qUGwejXtMddQujCI+EZKI9I6NQMJB3sMQKS6v9Pt32
 K+eRHsVe/rGvXATMHDoMIzc29sHaOf8IqsRo4sX1sYtm4DDSmlZD7AVJ/KXkk/E3xyhy6ckv+9t
 mG1dqcrk4E1iPy3lJE7CRStlVOrdlduCgVgqiubk72dk+ZMfTghE31oVEWw6QSTq0gKyJC9DiRg
 lxOU3WVwE/bYg5hVy/4PcSdxOUx4IPVvWvqB2ZY0WlIMWZKRTUBcsf5PdarMEbrGnYrNuapqin+
 4XJPMhOd
X-Proofpoint-ORIG-GUID: hGLFxxTxiH-qKuN8HRv8btCo8qDtrJdP
X-Proofpoint-GUID: hGLFxxTxiH-qKuN8HRv8btCo8qDtrJdP
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b8636d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=nLpcdTFfG50SK1Npur4A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

On 9/3/25 1:47 PM, Wasim Nazir wrote:
> From: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> 
> Integrate the TCA9534 I/O expander via I2C to provide 8 additional
> GPIO lines for extended I/O functionality.
> 
> Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> index 9e415012140b..753c5afc3342 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -277,6 +277,38 @@ vreg_l8e: ldo8 {
>  	};
>  };
>  
> +&i2c18 {
> +	status = "okay";
> +
> +	expander0: gpio@38 {
> +		compatible = "ti,tca9538";
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		reg = <0x38>;

'reg' usually comes right after compatible

Konrad

