Return-Path: <linux-arm-msm+bounces-55782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F02EA9D43D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 23:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAD9E4C1DF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870172253BA;
	Fri, 25 Apr 2025 21:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T5AfWPwj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D89224AF9;
	Fri, 25 Apr 2025 21:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745617198; cv=none; b=cZztBIJSX/ai3wkWaAJlYHmbwy4ey2Hgdnm4JNz5OKc2nIzlyHW7omoULzKWawTobaTZX28laiNuLxVq7ix7BqgPNEwWOFn8i3MZK3ki8RDZMsEgRDdlUwBS1ozbIob+c91/wpysolHpCK7DIqXX7Kym3Am0MEd2nuZ8aOsgVmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745617198; c=relaxed/simple;
	bh=K2+ZLXt+NUXHfrLO5kMO+0fyQsf5+a9+qiQ7z4zUz6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CG4FL/Ly8e0y89yEaXl6KIhH8I4aqFmTLVtSESWdk1452SZwOrMmHjcf5d4kAovPyBCsI0p++b9uygsQxj7B1y55bWjS7AIQoZ+EB6u61rF90+E1XeUBkdPMFXr+8X4ISebXlUH2xOvjeSUmt3nqBp8fOMctbJ58i8nnDftkDmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T5AfWPwj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqtY003979;
	Fri, 25 Apr 2025 21:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l7HoHHwRm7qx6newPoYAeZn2J8TxwbXKaGF2NpVjD1Q=; b=T5AfWPwjbBpZKTT0
	AzxQ9x2dmrOEutnvOFEskBbn5t9B9d+DcrRF4u0cBdY9eq+2Cx2sMcam446Pq/zz
	7j0x++wrTs152r110D6OyPaqtQ1d7OxASDA1+zhKWDNGX3JbSbJhQ9j6fsu6e3bv
	7mXzp4pNLarIMnVP8zgGnEWjL68BE7E5cRrURVyQbE35PGxh+MhLodVrhdE63hwr
	PMFRaIb3x8SaNeToGIukZCWTElO8/f02H4cEUOLnBhenhzpga4FsdgvPSuty/RjT
	XTKkyxDBc+blgrngeb4IpOlXUf1RVXvOzA/+AN/VWSwxZ7rrIbHan6HwDxQ3CFHP
	N+osOA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2ae4f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 21:39:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53PLddv2005220
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 21:39:39 GMT
Received: from [10.110.41.60] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Apr
 2025 14:39:38 -0700
Message-ID: <bcca2d97-2092-42f0-951d-f09f144e515d@quicinc.com>
Date: Fri, 25 Apr 2025 14:39:31 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: usb: dwc3: Document usb-soc-be property
To: Luca Weiss <luca.weiss@fairphone.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe
 Balbi <balbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan
 Gerhold <stephan.gerhold@linaro.org>
CC: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
 <20250425-fp4-usb-audio-offload-v1-1-f90f571636e4@fairphone.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-1-f90f571636e4@fairphone.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680c011b cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=6H0WHjuAAAAA:8 a=xMRfEcGXebkPZtLSRzYA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: rnmO_5Z7f4dqOqmQ0-ctg3OmqaWcXIcm
X-Proofpoint-ORIG-GUID: rnmO_5Z7f4dqOqmQ0-ctg3OmqaWcXIcm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE1NiBTYWx0ZWRfX/BQM2Nf4UBlF jitJCnS6Qy7Ze70LDRTBK550dv/xbxVRZnrDpeLJkGuE6ZWiQw9EhaJFLlSeYVvzHArPDLUH96g GUcx5SnAUUhoULle4UjRdQSRJyGhN0JH/I0mMDtFRgvQ7IywoHZ2lxBatdIas/kWOsFdumB38Iq
 Uss6BoYR/kkIcDjyX/jJEtBmuX7oTxnCqOd16QWaKLQe+273a8zf0QiPwl1qsH456Iw3/ZdgiB5 yjYC+KSuAiE0O9x4OyVqhXt/41lC0oI5rGDqfcun639PZ37TwcKd2f7q3rHTxzQ7q6Fj7Kv1L3/ fEz5Eu5GR0LT6A3LafWl/Elcs9zCroLXzwlrbsWvZUG03Xl43xgtm0rCFmu7CnI2vJrTJ3+M12t
 BwhJ72XmGDVYHa184aX0u2+tv5RGexTgvhqKb5tXsCTArhCFNMgT+YSldrwXYq48MafWWiwM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1011 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250156



On 4/25/2025 3:44 AM, Luca Weiss wrote:
> The property usb-soc-be is used by the new SoC USB layer which is used
> for USB audio offloading on Qualcomm SoCs.

Hi Luca,

This property can be dropped now, as in the latest revision I added
utilizing the auxiliary device/bus now between the Q6USB backend DAI and
the vendor USB offload driver.  Reduces the need to add more properties.

Thanks
Wesley Cheng

> 
> Cc: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> index 6c0b8b6538246adf746fe7ccd6df936131c61444..07549dec0f74234465fa9b6ab21871762a2f5127 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> @@ -38,6 +38,10 @@ properties:
>        - description: USB2/HS PHY
>        - description: USB3/SS PHY
>  
> +  usb-soc-be:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Link to the USB SoC sound backend
> +
>    phys:
>      minItems: 1
>      maxItems: 19
> 


