Return-Path: <linux-arm-msm+bounces-47470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2860BA2F6C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 19:20:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26F4618823F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 18:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F064D24418C;
	Mon, 10 Feb 2025 18:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iF77/AtQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB9E22257D
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 18:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211620; cv=none; b=dNfA9H0dIfTkTL5HXGAAmXvDptPHnsDI6GhWJYBVcwEtKksU91Xf6ZGS5T+fVB004wBNUD8O8HB5LodZ0x/2Yjh65/TioRQprR/RPD51/DGW2TXSd5kJNIWobexlfaubsr9wYRwFW/TlL26vXzdazAKxFdCVT2CmSf1drsRtQpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211620; c=relaxed/simple;
	bh=4KRvzzivT/uRr7tkezYqZACH9wbEWsmy6Zqlmd19IeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jq63yWVTFwZJ7rv3XhQIULILcfbS90OzjxaI6FNg65nVwl6CvpMatEEuK+7Zihwm17gQqjxFEMb3aL7gFcJcQOQw8m4SOdGcFEnLCT28bLJlf3GxpdhnLyXXbBtwpm1q0BvFweMS3boKpaYV7YcmTsZq2dZQEu/OuSUq7YzXaqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iF77/AtQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AA7agY003521
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 18:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XzZm3dBxQB3zEADv5qdL2kDPBxS0dSfX6/e4Np+gMNk=; b=iF77/AtQ7Z0X18BR
	BcOKQbOYHesG4OehJGQl1ZmJBdMB0/SIOCeo0GeyV3ywhN6BN76ZMeU+JCSgMzyX
	S/sU8EWfN1Tcr9AuoPGIG/O4GLjockTpx6qe3Qb5sy7BFA2i/yyOz9V5cBtMUlVE
	l7fBYi/r2a777X+BRF0GvX2XiOIUQQWRpzUMPGM04QWrgzXA882BpxuN6dSWnPgV
	M93b23UViO06oyVl7zOewrb0hoNdwoGTJ9opJpttyfkt8oyWb45qfJuAVm/VyK/m
	1U2RR5ps4Z8sqkB4sd2Lzb75pW9QMo0QMv3RlB/wLGScXIP6uVRk1m8VtYNoh/Bo
	dvGTyA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dyn7mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 18:20:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-46e78a271d3so7438651cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 10:20:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739211604; x=1739816404;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XzZm3dBxQB3zEADv5qdL2kDPBxS0dSfX6/e4Np+gMNk=;
        b=BuShoM80FhzT+YoR6qUNV0ij2yTR2KXvU8btMuWdWjFIiyIjX1SCwyV1rxi4b0vbHN
         AO9t5d22kM1MPrHvm3AsN06GgXUeq3uItUEBYoQBgvjytmi4dIcdeU+E7IwXY4crI81+
         BYYkz3rT8fCB9SytSlBPFN+IY5MUpt3bjZkVZKHDz4srV2T8z/rLduFQTfGu6gzIGEwf
         1X8A1SNPdXcfKth2+J5/Pi117KyTZL3h4jSKqtCP3/00A/FnGccxlSvOtT26/OX6N0ud
         sHpnjSDFEIZ6cNL+p7MEH3wkH1Wp/D9Lc/JHfielCGjVxwR+b90p4UQOWHZ8Vl+WKmoM
         cyQg==
X-Gm-Message-State: AOJu0YzOQqblTOwnV02zESb3qJb8DJyfTRJL3fgd680dF74/MiehyB7e
	TPD+h+ecuvbdgjutjytm6KIMdDvQYdydWLLbriuyQURBZuS7fZOqxmbmd83eCUfiZJLEEZCqMD7
	B8EvdZph3v2cIkuLLwni2mr6lOMNWmKweTikunV3b1C4JG3lzG2HbKxlue5dUtKZr
X-Gm-Gg: ASbGncvb7rowN02g44DIYoE+ZL1g0887e+gHxuO90yqeJVBATKdknJNnw9UyTu2f9mI
	KznNOpO6clj0NGMO/d612RgpWT9jkHPzGsGyzRcw5lRuOEGQJrZxWD2sJ27I+K7uTQHU5x+eleM
	IknuV0z9As+2OvXnQbWqC1ADGO9kfsK/RnCtYbzONzWebUB9SBb941w8iV4uTNDaRS/mELabM4W
	26h0Pjn/xwQyK2BjCDo5cndahWroV/SxIWdbVkpQObSwQ3SYLmPgiBzrA5HZU7ZrEhgJOeh50QG
	CeGZRlwJGegpHs7G4ExQUEmf25yLcXTpijirOkbBc6uDNs+bou8Jea61D8Q=
X-Received: by 2002:a05:622a:1b87:b0:467:6bbf:c1ab with SMTP id d75a77b69052e-471679c7d79mr82147381cf.3.1739211603652;
        Mon, 10 Feb 2025 10:20:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBBQ/uutoyyZA9Q8ECd+9B6GJsW41C07FBYaDeS2ddgtd8HZI0jW/MXRuHeV89RTTPerPu7Q==
X-Received: by 2002:a05:622a:1b87:b0:467:6bbf:c1ab with SMTP id d75a77b69052e-471679c7d79mr82147151cf.3.1739211603323;
        Mon, 10 Feb 2025 10:20:03 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7c4da47f5sm232971266b.70.2025.02.10.10.20.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:20:02 -0800 (PST)
Message-ID: <666f5917-92d6-4c1d-b172-dc03a38ae46b@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 19:20:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8650: switch to interrupt-cells 4
 to add PPI partitions
To: neil.armstrong@linaro.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250207-topic-sm8650-pmu-ppi-partition-v1-0-dd3ba17b3eea@linaro.org>
 <20250207-topic-sm8650-pmu-ppi-partition-v1-1-dd3ba17b3eea@linaro.org>
 <efcc2cee-1d8b-45d1-aa9a-4e7afc19d857@oss.qualcomm.com>
 <57c82928-5275-4f6c-b6d0-935dd5080f9b@linaro.org>
 <5b782e14-5262-49f9-938b-b8c9b8935f6a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5b782e14-5262-49f9-938b-b8c9b8935f6a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FPG88wYKc1p_BzvhO1OQTJkztuur0oIA
X-Proofpoint-GUID: FPG88wYKc1p_BzvhO1OQTJkztuur0oIA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxlogscore=686
 mlxscore=0 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100149

On 10.02.2025 10:27 AM, Neil Armstrong wrote:
> On 09/02/2025 15:45, Neil Armstrong wrote:
>> On 07/02/2025 21:23, Konrad Dybcio wrote:
>>> On 7.02.2025 11:31 AM, Neil Armstrong wrote:
>>>> The ARM PMUs shares the same per-cpu (PPI) interrupt, so we need to switch
>>>> to interrupt-cells = <4> in the GIC node to allow adding an interrupt
>>>> partition map phandle as the 4th cell value for GIC_PPI interrupts.
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>
>>> If I'm reading the core right, we can leave the fourth cell
>>> uninitialized where it makes no sense
>>
>> It's not what dtbs_check thinks !
> 
> And if you don't specify the 4th cell, dtc is not happy at all:
> 
> arch/arm64/boot/dts/qcom/sm8650.dtsi:5302.4-27: Warning (interrupts_property): /soc@0/timer@17420000/frame@1742d000:#interrupt-cells: size is (12), expected multiple of 16
> arch/arm64/boot/dts/qcom/sm8650.dtsi:5302.4-27: Warning (interrupts_property): /soc@0/rsc@17a00000:#interrupt-cells: size is (36), expected multiple of 16
> arch/arm64/boot/dts/qcom/sm8650.dtsi:5302.4-27: Warning (interrupts_property): /soc@0/mmc@8804000:#interrupt-cells: size is (24), expected multiple of 16
> ...
> for a good reason, if you specify 4 cells and you specify multiple interrupts the
> DT code will split the interrupts entry by interrupts-cells + 1.

Right, that's a dumb "feature".. but everyone is kicking down the dtc improvements
can down the road indefinitely
> 
> Remember we pass the DT in the DTB format without all the verbosity of DTS,
> the properly is only a bunch of u32 blobs we can extract with the help
> of the -cells properties of the providers.

Which we could/should make dtc autogenerate, eventually

Konrad

