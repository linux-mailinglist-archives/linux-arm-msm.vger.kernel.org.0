Return-Path: <linux-arm-msm+bounces-64787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7301CB03A55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 11:07:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3EE67A9815
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 09:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 878AE23D281;
	Mon, 14 Jul 2025 09:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AYbXmRbq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF5C1EC014
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 09:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752484053; cv=none; b=gahxEKNrMxikjIEjXV05RZoTDRR5gcVoiy1Cwwpt8EKHSILxWpf0TrIxEAHfYYS6U9egNgI57d09PdcL0V/oRhLgRzVfQxWfYHa3Ijp6Yy2y87t8pl2JDAWiHJJgGufEtq9tKuEovxlmy9ux5c45IK4SasKN5PhAotKnKqR9H6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752484053; c=relaxed/simple;
	bh=IEo/0ebyLqCtoPIUGho1naveiGhjOQs40pxOBVatadk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OJq8aJgiDi5kMPawUHKVGcFW2/1aRkdni78UBkT4fV4Epdcg1KSdJhI3/+eBIfDdfGDOBp8PgrhO8QTw+18h1hjxlyFy9bJM2tzVzdIlEftWy3daBN0vY1c9Fkeen5WTVCN4rqwPSuHYiobO0w9ux0RAVD6IxzurulBG9X1YsMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AYbXmRbq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DL5K16006253
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 09:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dH8858t1uDwuloXXZdQnkHNZ0NilaSKFnXkLNu0wdfI=; b=AYbXmRbq8xd1OCk/
	s+IyeLmGFfeiNNGNQIdNkKND663wReiQq1+hIG8/I5qZeIT8TH+Ck0PfG/m9KDuD
	Aa/RkZCCB8R5Wenu+hwrbLVhltILB5yq7T52m5EIy9X0jTnVDd3gcedmZswLld9T
	C2UCqHn7JusrK1QwKFzv6ShZkNOxoY2SFv6mWrZm6nwqstbrUYt2Iv6fg1mymird
	eNIzgKDJQT8YUjLdpuvzDQaEovjfDe4SyOaQrh+EiSB7er59VYloiV6sIBxYdI6Q
	ouk9hq6OyzhQLgZ/LkeBEfmMPjOdPzk/EmfpVHzQeET4CFt189KXOOH25S5KAW1r
	GMd+vQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxauymt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 09:07:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fd1dcf1c5bso11498166d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 02:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752484049; x=1753088849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dH8858t1uDwuloXXZdQnkHNZ0NilaSKFnXkLNu0wdfI=;
        b=Ucprxo4M5xrmFvePR4ETbek1gn1H8XTXoyd6mcNAEqi2rEaWYKg0qfs47stYSo2BZX
         OkfzD4XcH08tFhPs2cMaVMs1gPcXX8sFQkpkm1cMKNTI6KJRKB2cGycI18xVELh9dkiL
         b+bczMYcv80yoWTcEM9scmXpu6CqB48btZOcW42irahdowvyUWSCc6eXH/jJbTenb13s
         tS5gJ86NQxQUvKXTyZ5quxvWE4fvbMNVsFCBJ9akqEACZ4Rhjk1VX7nKaNd7cxTpuK/b
         gZz7C+Ibf6OElcZXmdySJcNbbGoJmky9hjee/S1tMiRO1btZCOcNxZg2iTCS2TYjQ6RN
         N2TA==
X-Forwarded-Encrypted: i=1; AJvYcCWLn6nfrVngIGkpOyV51N1m1cuBAyiQlpFmU0c/pgE7fSOsFsg9lXNASv3cFcpx+SZ3wWPoDlK2XsLA/3qt@vger.kernel.org
X-Gm-Message-State: AOJu0YzrFWA24gQy2LE5QhphHXuHhCcLcdniCrMfGv1+QHM7uUu97Tlt
	rbsRnsecpuoi5NE9sd1F2aBlr3epCxp1yHTCamQtzt1uTtBl8Qo8GKfa5QcuH84G8gXdM7ThJgu
	kqXVSHWC1UhtDVhX57cl/vZqJGicU9tR3TcsKZU9QqSCfbKCSUg7vAWQxxH6LUexZ5wJb
X-Gm-Gg: ASbGncudAmzTa79M8s9KC7ABWomNu/g44VDDjntML/sqUPYg66RPMp1HJjDVN5dOeeM
	jdST2A7yQN1ARL4VszfpCHYlN4N6TYXapfm18QGa7JB2siqIYbyZC9Cv13tVuhQfk0+dDS9/j8Q
	zlaVmxSG5nU+rrCMrHkezEuYmco3sxwJ/ct9bASvl/U1HhJpOSE6K6Un33vnUcYADdeYCBA1+dl
	LXZdOTzD+0n8e51AdHLmO4u1LVKgVtjDJ+I4u9i41IKXJ1+pryCkG+eZHZMbS+ZoEDSWBwlap75
	SeaCNfBbeLSqrcBZuWhJyd4ZNjnvlsFTtK9D3O31dMLYu0ZgOaO0MZS9eQcuOw1yb33EF4LOvTX
	CTZXyRXAuz9OUwc7ftCFP
X-Received: by 2002:a05:620a:472b:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7dde9953e8amr658697385a.3.1752484049200;
        Mon, 14 Jul 2025 02:07:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZeBIEWBgGO2oIe//VMo3cjAnyraMQetm8FdPub/ATMMOvADVyOJZ09L0sSUjb+pJk+fkycQ==
X-Received: by 2002:a05:620a:472b:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7dde9953e8amr658695585a.3.1752484048682;
        Mon, 14 Jul 2025 02:07:28 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82962acsm790125166b.139.2025.07.14.02.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 02:07:28 -0700 (PDT)
Message-ID: <7d9d027c-87f8-494b-9101-69c83ff21353@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 11:07:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/15] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-10-0bc5da82f526@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-10-0bc5da82f526@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sQazu4GCRGzUs59jJtF2jjT4IVOJh8U-
X-Proofpoint-ORIG-GUID: sQazu4GCRGzUs59jJtF2jjT4IVOJh8U-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA1MyBTYWx0ZWRfXxDxeoX0nkOPb
 HWRl0mWdr9vFXyT8FnIOW56bcJNyzaoVxrnT6LMod6MJRbTFzitcI2f1MhyNueouKFbGa4Pz2U8
 c0nRQdEu1p39wUBIGjtC5ZNgaqrh2S3F7wBbWl65fqmDTwII9snEpROkS+yxsaphcjQxVP5l+AW
 ol7CI3JRjH6jCiJt7ubZqeI7UHbpvsYudk6+3QrwjE+6HixZSvUzCMd7qO6NrgT1sPkaFUYNJHL
 5Rf1Y4P1g4+z7WJmZOSl5NwuJ9JJnts3PDw4IHpaai72sI0EZqlgQrzHeWhLioDeWHd58G29VSK
 Hzvliw+35hvP2ig7a9YR1gRvuRk2ZYQnF2R2JbfGwvDtUm3O6fZWIruDhLAoH8GZbOVt89wX8pI
 2k3UbII36SlxOF/JnKREpFWQ66C1cs3UOcGwf8VGO0LtCdQhsPx8BQa8C6u/dB/j5CMwiyY4
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=6874c8d2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=8FxmNogKXzv6K0n2ekAA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=959
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140053

On 7/11/25 2:58 PM, Bryan O'Donoghue wrote:
> Add pmic,id = m rpmh to regulator definitions. This regulator set provides
> vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> index db87b9b5be63d4fabf5ced20b23080a1a49b1207..08268f60c305cd69baf937fced6d37f2ea788b62 100644
> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> @@ -960,6 +960,36 @@ vreg_l3j_0p8: ldo3 {
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  	};
> +
> +	regulators-8 {
> +		compatible = "qcom,pm8010-rpmh-regulators";
> +		qcom,pmic-id = "m";
> +
> +		vdd-l1-l2-supply = <&vreg_s5j_1p2>;
> +		vdd-l3-l4-supply = <&vreg_s4c_1p8>;

vdd-l5-supply = <&vreg_bob1>;
vdd-l6-supply = <&vreg_s4c_1p8>;

> +		vdd-l7-supply = <&vreg_bob1>;
> +
> +		vreg_l3m_1p8: ldo3 {
> +			regulator-name = "vreg_l3m_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1808000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4m_1p8: ldo4 {
> +			regulator-name = "vrer_l4m_1p8";

"vreg_"

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

