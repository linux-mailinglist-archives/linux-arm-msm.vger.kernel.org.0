Return-Path: <linux-arm-msm+bounces-19274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE95F8BD3F0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2024 19:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 798D21F23A59
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2024 17:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1B6157499;
	Mon,  6 May 2024 17:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R6ejFAjF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556211F19A;
	Mon,  6 May 2024 17:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715017225; cv=none; b=WYi4XShQomCbFoDFCPi9mW+WWCpSqJM9wXYH1eouFPC94CSYCEsv9YssoWPaeIYg+yBAhH0DASCLF+1m9WUJ8DK3n4bqZm2kH4TAoHuGU1Eo5jZJ4DZKXSUAC1yzOCvQKhuvRrEoBuoulQnu0qWE5AkOiI27bR+OqhScOWu1UqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715017225; c=relaxed/simple;
	bh=Vcqjn1Z6RaAYOBPjcfqXMWtAhNGgVNzcQSJ1Gw0LXQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LLU2hkBcSXO96MukpQTFpmT+VB3qsAXP8oSs/LS8gTtzEUQrPkgkpHfFZLr37dwe7BMxDFi2FSZ9QrYdEMIDHxJqFvErfAcPpmYIA5yshj8laO9kgpD7EYbdSlHybW2JhEct1dQgUvsM1dT+kw41hfJmZg0kOiDOIDQkYUnA/Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R6ejFAjF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 446DZokY027352;
	Mon, 6 May 2024 17:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=7ATTd3ufsSDw7z+yQ+2rQFtgY+zu84cWtUZHkSX5Z+Q=; b=R6
	ejFAjFJL9kxU7O90/lC3zCFOsIjR8Khe8zdKm3aC1vbEkMqywMsYiCH8uGdJkx8W
	/C9fCgVcPdy78nb/849WYTwmqeK0Jd/mS0H2sjDinyw6V/s5KyOJwp7ScZwGFSpk
	KNXULRRxT+wY9z6dkLnlntC2N7JJ7UlU+aELSS1jbZz5RN+uV6Gtd+gJE1ZKAv1a
	meBVNwP8AJWBkNIpGFoU0wNJ+l7/LRkP+SfWa3kuOgJ9PBxlJVBZduFuQm800kMJ
	FxuUY25FG+pBaJxnPPsFHnGvTGDXsx0427kI/MkyMxIGpO3de68tvTeQRk6PeUC4
	yy/TDlqFcYA5/lAm4QKA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xxvv71166-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 17:40:19 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 446HeIZP004597
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 May 2024 17:40:18 GMT
Received: from [10.110.70.44] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 May 2024
 10:40:14 -0700
Message-ID: <2649871c-ad10-4642-acc0-a15b03b4f1dd@quicinc.com>
Date: Mon, 6 May 2024 10:40:13 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] soc: qcom: llcc: Add regmap for Broadcast_AND
 region
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Rob Herring" <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20240329-llcc-broadcast-and-v4-0-107c76fd8ceb@quicinc.com>
 <20240329-llcc-broadcast-and-v4-2-107c76fd8ceb@quicinc.com>
 <d6b0f9d2-a489-4c0e-9c77-0e3eab49d3cb@linaro.org>
 <13ccc36a-c3cc-469a-ae0b-71fd0d24bf63@quicinc.com>
 <3365d84a-1b1d-4b1d-8be5-6d8d1039e6b9@linaro.org>
From: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
In-Reply-To: <3365d84a-1b1d-4b1d-8be5-6d8d1039e6b9@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FGPey0LpD4LQr9f6nzx_HGpJdM7ptKPm
X-Proofpoint-ORIG-GUID: FGPey0LpD4LQr9f6nzx_HGpJdM7ptKPm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_12,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1011 suspectscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2405060126

On 4/10/2024 11:24 AM, Konrad Dybcio wrote:
> 
> 
> On 4/2/24 21:34, Unnathi Chalicheemala wrote:
>> On 3/30/2024 4:46 AM, Krzysztof Kozlowski wrote:
>>> On 29/03/2024 22:53, Unnathi Chalicheemala wrote:
>>>> Define new regmap structure for Broadcast_AND region and initialize
>>>> this regmap when HW block version is greater than 4.1, otherwise
>>>> initialize as a NULL pointer for backwards compatibility.
>>>>
>>>
>>>> +    struct regmap *regmap;
>>>>       u32 act_ctrl_reg;
>>>>       u32 act_clear_reg;
>>>>       u32 status_reg;
>>>> @@ -849,7 +850,8 @@ static int llcc_update_act_ctrl(u32 sid,
>>>>           return ret;
>>>>         if (drv_data->version >= LLCC_VERSION_4_1_0_0) {
>>>> -        ret = regmap_read_poll_timeout(drv_data->bcast_regmap, status_reg,
>>>> +        regmap = drv_data->bcast_and_regmap ?: drv_data->bcast_regmap;
>>>> +        ret = regmap_read_poll_timeout(regmap, status_reg,
>>>>                         slice_status, (slice_status & ACT_COMPLETE),
>>>>                         0, LLCC_STATUS_READ_DELAY);
>>>>           if (ret)
>>>> @@ -1284,6 +1286,16 @@ static int qcom_llcc_probe(struct platform_device *pdev)
>>>>         drv_data->version = version;
>>>>   +    /* Applicable only when drv_data->version >= 4.1 */
>>>> +    drv_data->bcast_and_regmap = qcom_llcc_init_mmio(pdev, i + 1, "llcc_broadcast_and_base");
>>>> +    if (IS_ERR(drv_data->bcast_and_regmap)) {
>>>
>>> I am pretty sure this breaks all users. Can you please explain how do
>>> you maintain ABI and that IS_ERR() is applied only for version >= 4.1?
>>>
>>> Best regards,
>>> Krzysztof
>>>
>> IS_ERR() check is done for all versions.
>> If new register isn't defined in DT(for version < 4.1) it simply sets bcast_and_regmap to NULL.
>> Otherwise, for version >= 4.1, it goes to err(in the case bcast_and_regmap isn't set properly).
> 
> b4 shazam <this series>
> 
> booting on 8250, I get:
> 
> [    2.794850] qcom-llcc 9200000.system-cache-controller: invalid resource (null)
> 
> which comes from lib/devres.c : __devm_ioremap_resource()
> 
> Now, this is gonna get you an angry Johan(+CC) response when he sees this land in
> the next release. Perhaps, this warning could either be removed from libdevres,
> or some sort of an _optional variant that doesn't print it could be introduced.
> 
> Konrad

Apologies for extremely late reply Konrad. Let me try to recap quickly.
The part you pointed out initializes a new regmap LLCC Boradcast AND region
which is available only SM8450 onward. This patch set is updating respective DTs
and driver code.

Regarding the resource error on booting, I had added this check in previous version
of patch set (https://lore.kernel.org/all/1ca4d384-9df4-4c00-a4c9-0c5ff491616e@linaro.org/)

@@ -1282,6 +1287,17 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 
 	drv_data->version = version;
 
+	if (drv_data->version >= LLCC_VERSION_4_1_0_0) {
+		drv_data->bcast_and_regmap = qcom_llcc_init_mmio(pdev, i + 1, "llcc_broadcast_and_base");
+		if (IS_ERR(drv_data->bcast_and_regmap)) {
+			ret = PTR_ERR(drv_data->bcast_and_regmap);
+			if (ret == -EINVAL)
+				drv_data->bcast_and_regmap = NULL;
+			else
+				goto err;
+		}
+	}
+

This check will make sure we call devm_ioremap_resource() only when LLCC Boradcast AND region
is defined in the devicetree and error is not shown in log.

