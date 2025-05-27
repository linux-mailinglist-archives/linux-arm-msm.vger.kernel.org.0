Return-Path: <linux-arm-msm+bounces-59555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10174AC4FBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 15:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C8727A6141
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 13:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E108271479;
	Tue, 27 May 2025 13:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NExP91jZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEFB2698A2
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 13:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748352543; cv=none; b=jLCBJRJSf4b7MgLfG6z32XMGMDljdyUcEUueYNdE5/GBLZ0CSmEKiihIbYNszwY9ngkWtlF/1OyiEm7ICiyObnxnBh5MwUbgOCROTYtNaFXAIUIT1qwkAlHgCGhVbs/lmmoHKC6ZjbfXeZdXDAXd9xiOe0wmhDrDh9eCCqdyZiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748352543; c=relaxed/simple;
	bh=3khYD8/zBqFq/sQrnyUXf1pB3G+HW6cVj4xlQhf6Y04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X3qrUVhPgupznrT5ZN3ptYyOeN50jGdlTW/5oOrIp+BmNa3QPKBi+RXgrbekIneZ8CU4KU+xsNFACpgg7P6VrF5lJ+G/5syV1rIFlXd/b6u88fzBHny7Gu9xrBIqnYZBA03zAPQsptos/AtzKWYuISJCHwhBMUfkOBGNIWtobYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NExP91jZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAbFm7023803
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 13:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cgsUUCfT9fW6BhZpiKOs3CtiiVh2raWuBuMflrGhC6k=; b=NExP91jZlbHeoIdM
	SkYlV8KtSUr9Fjy5dRuDiRIfKv2kB3SIUaKXq92dCGMnH6erv4k1fUXXiV/hr87A
	QHbmdR3+jEjAZzbHfMjU6xdJh0KA67ivtwJLOK7iqIeBJeH1GjTbd8Z9qAOb7Ua6
	lAB4zOqvXvTVThzmz4W+wthAsYpO+SWJiznznYbJVwy4/pXKee04v1KTH4RbyK6n
	IBBpA/KeHf4SpCBI2Fkg4xpVekaRV6aU3uNfoxOSH4OUnTG4gx4+9V+2W8T9445+
	4GBimdYxqakJ7KE7IGMMNNEnprVTuNk8xAk4BvFWGBKm0/MCBLv7ajMidM6KgpX0
	sCyf5A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6b5q47t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 13:28:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-49b0f81d9bdso2843131cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 06:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748352538; x=1748957338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cgsUUCfT9fW6BhZpiKOs3CtiiVh2raWuBuMflrGhC6k=;
        b=LtN1u/xepmSZrsYxMQPVfo1jgPzPm90VbM7i7fU1ntJyP1pgXQUXeC8POunrCmTyBm
         OP1JCj7hlVnHxbm1hxGssVCKJJcxJn2UOOE/uGHj72Xrd0XOte7neeHfL5W9T1nkfIC0
         Zn7uLMEo0wZA0VfvaHF+TxYsgist5opSxjG6oiMTQAxiYBGMXHoEMx7wjuWq9wpHv3vn
         C6vSziaRVOA7n+U10N4/zMI4X1juxSxbwD8ecuWj0ri6d6mUXcl9G/Bws+I1yRKRtIu4
         gBgrpL07QNmn188D0BBBTIVg9SXlsBxSIkBlq/rk7VPThs4pL+srFMprDSk7/L34WsDf
         xuFg==
X-Gm-Message-State: AOJu0YxPtw9ClspomhWZriPdVl0QzpS3g/srmLsZ0WsVCdlG3n4J6y4W
	yVimnp4HiVNp7PH9jt1Om2DpUqmToo8DwumTAFfGWvFKuvFBTSM3c3W+bPuitfeJhCpS7dcEnTq
	Lc1JeY7gsXnkspQSaHGZarJirhR9kH7qlytS0sqDEG4tYXSArDE3uJWiyebo8to1s0x7m
X-Gm-Gg: ASbGncsqIG+71DXJ30S+re8b2wT3EVVYhE3af0Td5ksHx9XOfEYWafyUK6xOTTq+rKJ
	Q2oROqneIlc287MEtFLDhbk7Tmy+iUtK85dazquMmDo/gHJYTXFr9UE1SGeJBglHnIzVK9dVHM1
	c7nXXAz4XDhFANe1HPTDKwm6lbQtrFc/oziIBoRnOnxxOt7r9twk7fCEQQ0wSOGIIpO9I/bu5iY
	jVHOnb/Y8fc9f+Dq7dvu1FNAtuJloHrDifZuUNGWWIc7dWxz84puxqXXCRO3z0StlVyzRD1kDGe
	gsgLRPMx/tBhxayPP7Le763IsLRpAeIKXBIYc2K4QuxpteY6zbIteclrWwYF8DZNgg==
X-Received: by 2002:ac8:5803:0:b0:474:e213:7482 with SMTP id d75a77b69052e-49f47fd1738mr71549601cf.11.1748352538539;
        Tue, 27 May 2025 06:28:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMJ3R4Af/j4fl+ul5t+vzSQyZol1IzH3ckYdxMSY4nI1xsxiTn9yK+8AiDLdXNE2Izn4X2UA==
X-Received: by 2002:ac8:5803:0:b0:474:e213:7482 with SMTP id d75a77b69052e-49f47fd1738mr71549411cf.11.1748352538036;
        Tue, 27 May 2025 06:28:58 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06cc3asm1854732666b.39.2025.05.27.06.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 06:28:57 -0700 (PDT)
Message-ID: <ea0c075d-85dc-469f-87b4-66834e3ff89e@oss.qualcomm.com>
Date: Tue, 27 May 2025 15:28:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] arm64: dts: qcom: sa8775p: Add gpr node
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250525155356.2081362-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250525155356.2081362-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250525155356.2081362-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZcodNtVA c=1 sm=1 tr=0 ts=6835be1c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=AD0RaYQsuEhH26DN5A0A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDExMCBTYWx0ZWRfX6yElMe8e9sTC
 bIchMZVZB0HKWbl0qgRm3AiP/fYgX66GAoyWL+6e4FIkPmx4Umgee7x8Bdo1k2ZrpjSV9eXMOSf
 Ndoyy1QlmcmHoxKIWECfnyJWyoAdaiCWBt7qxkb88sBYvd7qddmB6skgnizninoFUx4iioCFPoz
 CtS4uThTvYX4jmVhUcGYdm9ZEf0YabQPoN514zRtv7SLbivPvGRB+GWQ3RIxMon9bQ9uSxY8LsR
 iwkM4kHZQYUfwbJfgMMaQFy01B4nbK/gfjbFG2rmSHoBLu1moq/b8wFRJPlMWJt5zD9D+7pbGfq
 Dk1R5jxRgbJnHh3GUlk22WIDKfNsR8wt7cHyq/w9I0koPGk5sgK0a/qw0tPziqCnT53n9wNNXx/
 cplLn0ueTbyVnVnN1UKYn9ufCiffPbLVDG0Wf39FazfYGU6WGcPbs5EjJqdknwu+QF4fv1g+
X-Proofpoint-GUID: xUT8ZDTVXF4ujksquuOfNTisEc5vPl8D
X-Proofpoint-ORIG-GUID: xUT8ZDTVXF4ujksquuOfNTisEc5vPl8D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270110

On 5/25/25 5:53 PM, Mohammad Rafi Shaik wrote:
> Add GPR(Generic Pack router) node along with
> APM(Audio Process Manager) and PRM(Proxy resource
> Manager) audio services.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 40 +++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 45f536633f64..187a59e29f59 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/soc/qcom,gpr.h>
>  #include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
> @@ -6109,6 +6110,45 @@ compute-cb@5 {
>  						dma-coherent;
>  					};
>  				};
> +
> +				gpr {
> +					compatible = "qcom,gpr";
> +					qcom,glink-channels = "adsp_apps";
> +					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
> +					qcom,intents = <512 20>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					q6apm: service@1 {
> +						compatible = "qcom,q6apm";
> +						reg = <GPR_APM_MODULE_IID>;
> +						#sound-dai-cells = <0>;
> +						qcom,protection-domain = "avs/audio",
> +									 "msm/adsp/audio_pd";
> +
> +						q6apmdai: dais {
> +							compatible = "qcom,q6apm-dais";
> +							iommus = <&apps_smmu 0x3001 0x0>;
> +						};
> +
> +						q6apmbedai: bedais {
> +							compatible = "qcom,q6apm-lpass-dais";
> +							#sound-dai-cells = <1>;
> +						};

'bedais' < 'dais'

othewrise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

