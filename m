Return-Path: <linux-arm-msm+bounces-37624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 267859C5AA6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 15:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC92C1F22783
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 14:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD292003DE;
	Tue, 12 Nov 2024 14:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="haNrY6Yt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E608D20012F;
	Tue, 12 Nov 2024 14:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731422423; cv=none; b=qYm3+T6ggzoZ+GYUVNIA09c+goS1InV2BePAtU03yH1oCJFrmxJ9Si0PrZJ6AjM80LJAVSINfOLLf1se/G5txMLY6X6h6OXveXHNlnlp399pmdfJnbp0UjNOkxryFvg1UpMm46XOiwn30+NF2Wp7IeKheLBX6ggmhAFasEniwu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731422423; c=relaxed/simple;
	bh=CLr0HGkZeFBXBnP18a0LyyAjTPOgjFpYKhmNq5cmbxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=X4f4PZZURpwxLIMmhmoggmLakhfonOTNuBRVgjVowJHKQi3Wq8EXSk6gfUyyyfg9ZdyNYumtONSIiZBwXffBc9kyGx4Erdw2jhsR5ZXT+Wpoj1D6fDbsKzDs+CzorcArRKMRaqdzVQnZJzfssIepeqWGhFlEOGO9SXUiI1PXWm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=haNrY6Yt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC9FpI2003095;
	Tue, 12 Nov 2024 14:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RJfLzC9hap2ILnE6XCIOx3NoKYnuYRVXuoqBo7tTnnI=; b=haNrY6YtU4wwrvj5
	L1lhM+TWUJK/qaz3J+w4LcdYjy/g8tgw4pnHWRpb/73xAJn1WA92xg6p94lm388Q
	rfdE78Aia7iTXMeGo0lPTz94WakJx4SjRa4+XoXt7Ynhgz9y+GPquj2hQyC9v2R6
	8MhaaN7Ckv+3TO+G+4y9uez1AxO+hF2vKcikjkWYGDk6jyXIFUbIYrzhKDC5gy97
	DcF+kv37rzaG9h10P+4u72dRKRaHFGiA8pl3WwAnUFchjnopcegVxfXUtz6eXoFG
	1ty9hRQUJVzYF+y69oyvRvbCiJ2lLYrKQo1EvMg+K9ykdyJpcBItnyZ/WsCESKoI
	FKu6ww==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v47y0txe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 14:40:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ACEe4Ew012312
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 14:40:04 GMT
Received: from [10.216.59.81] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 06:40:00 -0800
Message-ID: <fbba794a-ba04-4790-b5e9-b4df3cba35b2@quicinc.com>
Date: Tue, 12 Nov 2024 20:09:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: enable venus node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <cros-qcom-dts-watchers@chromium.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241004-venus_sc7280-v1-1-4d7d8fd7e95b@quicinc.com>
 <kezh3lmysij56g2tjwwuas5r26ro5i777yxxitsdcjeg7zp67v@oknrdbkzison>
 <78e6ff6b-efe1-496c-a1fb-c9a0a4aba2d2@quicinc.com>
 <CAA8EJpqqZL7xybcbJMsbTQB+ht5-A+ocNs+Sq30j=v1zM3JL9g@mail.gmail.com>
Content-Language: en-US
From: Vedang Nagar <quic_vnagar@quicinc.com>
In-Reply-To: <CAA8EJpqqZL7xybcbJMsbTQB+ht5-A+ocNs+Sq30j=v1zM3JL9g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1AAVZbR4Wwk48MFlXHN92GTZfMvqUV4J
X-Proofpoint-GUID: 1AAVZbR4Wwk48MFlXHN92GTZfMvqUV4J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 priorityscore=1501 mlxscore=1
 mlxlogscore=183 spamscore=1 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411120118



On 11/12/2024 6:43 PM, Dmitry Baryshkov wrote:
> On Tue, 12 Nov 2024 at 08:17, Vedang Nagar <quic_vnagar@quicinc.com> wrote:
>>
>>
>>
>> On 10/7/2024 1:20 AM, Dmitry Baryshkov wrote:
>>> On Fri, Oct 04, 2024 at 04:22:31PM GMT, Vedang Nagar wrote:
>>>> Enable the venus node on Qualcomm sc7280. It was made disabled
>>>> earlier to avoid bootup crash, which is fixed now with [1].
>>>
>>> NAK, there might be other reasons to keep venus disabled, like the lack
>>> of the vendor-signed firmware for the particular device.
>> Can you pls elaborate more on this? Any device with sc7280 SOC can use
>> venus.mbn which is already present in linux-firmware git.
> 
> Can it though if the device is fused to use vendor keys and to check
> the trust chain?
Yes, infact the existing ones are signed and works with trustzone authentication.
> 
>>
>> Regards,
>> Vedang Nagar
>>>
>>>>
>>>> [1]
>>>> https://lore.kernel.org/linux-media/20231201-sc7280-venus-pas-v3-2-bc132dc5fc30@fairphone.com/
>>>>
>>>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 --
>>>>  1 file changed, 2 deletions(-)
>>>
> 
> 
> 

