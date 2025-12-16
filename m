Return-Path: <linux-arm-msm+bounces-85360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D8CCC322B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 14:18:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0AB633031FB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 13:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF46338C65F;
	Tue, 16 Dec 2025 12:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CRXVO1pZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D321538C650;
	Tue, 16 Dec 2025 12:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765889589; cv=none; b=DlCuK4lm/zfNftuDPpWW1IS90B6NM2f4H6rigSMhMBy4ITr6XxPVrkXbemu+lI/SC+ActCmGxUdQuxZcqoOqcueSuSU4X63jEiuQFyKa83SjqHRCwB6iNuc8B2JJGW1FfckCV532xAwSixRyiIqLMeLRw15qEzkAVEPN231oSTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765889589; c=relaxed/simple;
	bh=7KdoLs5Rlq56uwCbFx6hRN2ZKMKfnWjGyyMip/fLcSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ABwDrw6h+yRRB+v06uGZ1PZZb5BDyobLGFziLmvO9ACtsASqpvc2ZxV2HV3yQfnOlxCrg3/vA1nDuOKAIVHVpmg/yvWAoAi+wuUt9GX15nwjxd7pG+zvqCTBkSH1VhMNcQt7yOD7wmVV2v3VoQ/Pdo0DbSLxe6B2kSgIqiahsvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CRXVO1pZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGAMKpj3829726;
	Tue, 16 Dec 2025 12:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7KdoLs5Rlq56uwCbFx6hRN2ZKMKfnWjGyyMip/fLcSw=; b=CRXVO1pZDeKhKQ9/
	07BwnDNzV9oCJw+gtjrPYo+OqnNq333rmQV1HH3UGbhnDx10oUEVKfB2UkVxxnfY
	Tk10JaCaq6x/kuz+XrF3X9X+fvKmEHxEGHZuQEYZgrMcwUtrPU7l45MYRZlIIiJ0
	nN+ofyvUrO0pbMiOZSdWktqtQfyKDoJ453NJZp+oKbkYsI8XtPh6l0BUlhgkiDtt
	DwOcSYurc9/115dXRBEx8ZK6lwb2tzlVHB/TnzPxDqrmuJFuh7cDIjNuqGfIvmCy
	6xqj/eYmMqh7mY+HF4zjSP1JuT3X6lgEsNiL9yB6rlHy4yYs7ofv/Ok4KSiz7qly
	ocDooQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b35m2rh5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 12:53:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5BGCr1kq008511
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 12:53:01 GMT
Received: from [10.217.216.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Dec
 2025 04:52:57 -0800
Message-ID: <b3093b24-8e15-491e-80a8-a567a359aa19@quicinc.com>
Date: Tue, 16 Dec 2025 18:22:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] mmc: sdhci-msm: Rectify DLL programming sequence
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dmitry.baryshkov@oss.qualcomm.com>
References: <20251215120009.3877889-1-quic_rampraka@quicinc.com>
 <e1ae9c20-b306-4b4a-94f1-c629168c62e9@kernel.org>
Content-Language: en-US
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
In-Reply-To: <e1ae9c20-b306-4b4a-94f1-c629168c62e9@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=LpGfC3dc c=1 sm=1 tr=0 ts=6941562e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=G1fEpJH6jXn0qE8aeFUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: r-PA-3pCJGY-xRk1PXCW2akYKthel5XH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwOSBTYWx0ZWRfXyAgqXkVTe+qs
 QIrLEVO8MaPVvy79xH81u8WQjhRuUbpK6MxsmDhDI9Egn5GzEmVYhTiVzveEfybt6pCbU6TGbZo
 YuN6GlRZ7OQ9C/0vBts1ab+1LzEJMc2htrpVt8J/epyjIRQ637ckxxHIx8go3tdpdS80U+QFPQq
 Pbgi/fGpRbQ6s+5VS+wvN2pzel1xkyg6ZbwHTPb4RxM3zaDt5b6D+TDR6cxnEUkZxlmc3qaIpNu
 0NagvL67AyPzyPokk58l+ZfIu0P9VAg/tiYvkAyAy45u4tIFTevBn3NkmfvhzhlnC+rtVlMJExE
 9tsjSj1JFM9WR8uPM7afJ9LopZrvaRDiWnq0zcII2DhUSc7qChHgwm/eDERD1Q7+RyC3IbBJEZk
 hEbkOECLSGFiJYDkrE7VgeAXeityJQ==
X-Proofpoint-ORIG-GUID: r-PA-3pCJGY-xRk1PXCW2akYKthel5XH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512160109


On 12/15/2025 7:28 PM, Krzysztof Kozlowski wrote:
> On 15/12/2025 13:00, Ram Prakash Gupta wrote:
>> With the current DLL sequence stability issues are seen in
>> HS400 and HS200 mode for data transfers.
>>
>> Rectify the DLL programming sequence as per latest hardware
>> programming guide and also incorporate support for HS200 and
>> HS400 DLL settings using the device tree.
>>
> Please trim your CC list. You cc-ed 4 internal Qualcomm addresses and
> also internal mailing list (kernel@oss) which you are not suppose to mix
> with upstream!
>
> Best regards,
> Krzysztof

ok. I will remove.

Thanks,
Ram


