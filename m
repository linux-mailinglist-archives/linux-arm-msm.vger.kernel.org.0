Return-Path: <linux-arm-msm+bounces-76949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B66BD21E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BE87F4EB210
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 08:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9D02EC0B7;
	Mon, 13 Oct 2025 08:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fnhd6Zvz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C87E2F90D3
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 08:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760344736; cv=none; b=ifZEdIIN1S8rxEU8buugkE1jkizabuYgroLJdv+4rnw6eGkbGeZpUuvVpGqM32YyPLS21GLtRjgxzphGR2IqpdX9RR3/F0vUp1s0sv9fTb2HOMTQj3sHKrj3K6WhdpXnLtnuhUvLfUWEC3fRu5g66JE1Jt4FhnI9qxchICL9NHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760344736; c=relaxed/simple;
	bh=aM9wpYz7D19h0818wM71Oi/TLVEQrjtN25oiHTy769Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ye8SgSrBpJvv1LMG94YOWTLM4pWjJFYlnXeyboCxWJXBY+FJvqHZEuVw2TLxJYtwZHZt/xk7xbiOCxf15SWQNgds62NlAOWVsR4SNEVHLfH+CFv/b1NxOoOMG8e7C/f41rpnC/ybq6a47+u4gFJDTf2GQXuntERWGR2iismYZXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fnhd6Zvz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2n7Ka022220
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 08:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBVT1f4LC7X+qF9EMdOlijngoSBVrKJPfb4IYgGz1Hk=; b=Fnhd6ZvzNmGrNqKr
	Ta2fhVD20s5qTfXx9lhoSl+Wt8fBhPijpEtd9jaETgbvk49+jcBOzd0r2Bmuzq3y
	q5kmT14AE6nRXQMn5+ccH9QDFph6/6HxlxjYg9A/bOfwZKd/2G1JhXrT5i9UYB9I
	DYrKyJeD5QE1+9U5peP40Cv5Tugu7YDSg2qZ9phCesD/KQ3xnIuGsZZq7yZ0C5Kd
	847H3V1GnXZZhPLHXfkDTxmhZ6E2fdcHy3bp7YCp4p6dUKmrdCoMgKdQMCwbKRK+
	8NktZxu6jgb8ANoeD+ZPqxU7ggt3zGJd6nEG3qaAURKGz6sVc/G1URbqdsJl2ZLn
	nspLIw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdfut6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 08:38:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-330a4d5c4efso7967559a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 01:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760344734; x=1760949534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kBVT1f4LC7X+qF9EMdOlijngoSBVrKJPfb4IYgGz1Hk=;
        b=YNlUlmNhYPaPIBlwoI3JaZSR2tea4VIVvLD2uhBP3W711+7Z8YjRb0Ws46v5gpqtl2
         2viJ11FFxuKp6Z4lvnNjK1cyymOGrTZ1K3QDQ+mah19t/SBUhnYoeHmkDn0kJuWlPHdh
         2gByME4nSs8bGQyX0pGLgSVaRhWAoi9SUcsGkuQPWsDURLuHW16kMEQguTWwlNBPe8+i
         LBLXvZCTebUV2WO4moj24OkA8cHgutQhEwZG0mg8Ra1iJzjUwU7HaVsbAuzJRcktDNC8
         Ef/VWTM8Xs7Ef+oeINH/htkEpW8fzZRnZhvvNdeFQEZTz//Cb6bSRrRo9gt8F/p7uhG9
         kFlw==
X-Forwarded-Encrypted: i=1; AJvYcCXCDgozt6DCFCDuUkmJ+tP+fjl8OFmaFuUMjmQTPsWp7TW7SPI99o1NyS7GpZFp8iT+R4qokEbMrdiJmagF@vger.kernel.org
X-Gm-Message-State: AOJu0YzuscVdlUBmvSZz37C2/a5cUtYTPOqF4P+Q4ViyKUAvoARMeMm4
	nsVzRRN3NAh1Y/XlMJ6WD4SdXpRiFfIw8lrwkUMWLHHPKTYsGtXSgaZvTz1WG2Y1Q4kOUhgB6Iv
	VkJ+6nFzRNnZSjSsqhhEMoPTAMw16OCPzBAeFCvTqlazRQm9bpvYpmfBvENnNoOyykyBu
X-Gm-Gg: ASbGncsP3FZWVLSdkqMEPKfO3h4OvGUzWFJF3e1gvXwrixFIHySEI/XjYJvguq6QMdV
	y1gNH5zww6uJwVPDjSo+rzdAGm/1s54KtCLDoYcCV4meun8L8VWwxW/e0tFlMRIcJmPhxTu3Owo
	utjhg4xCkb+HXq1PVAuyag8dfvpDum90JLWPnwJVVdvvE/Li5ZmOsFG6dawnedNGgbuTBsiW0hL
	WYVx410YMnMszyjyKsqetUOUWoHjaBGSP/A12f8TgK58LK0WbkkFV/Aj2nDhinK8o4hl8c+Dl01
	lbsD+9dm137s8I8By/58SMYyb9ejAs1mp9Yk/+5RfoBc41a3yI9In9ctsJG+eEL6/H32m4l4zG7
	t82iHTp5ySNbwiiNk2iOaYddfTdrz6A==
X-Received: by 2002:a17:90b:4a8e:b0:32b:dfdb:b27f with SMTP id 98e67ed59e1d1-33b5138e27emr30306516a91.17.1760344733568;
        Mon, 13 Oct 2025 01:38:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs7ZzJjXcOdRj1a6iEgitTMaufzAdrFWCf6u6RbYV0u2V2fa3XRScqidAK8Ls4TD09WlYnzw==
X-Received: by 2002:a17:90b:4a8e:b0:32b:dfdb:b27f with SMTP id 98e67ed59e1d1-33b5138e27emr30306487a91.17.1760344733107;
        Mon, 13 Oct 2025 01:38:53 -0700 (PDT)
Received: from [10.133.33.133] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626bb72dsm11172324a91.14.2025.10.13.01.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 01:38:52 -0700 (PDT)
Message-ID: <4d6a74e6-53fd-4749-8839-907a9d0d11d3@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 16:38:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dt-binding: Update oss email address for Coresight
 documents
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        "Rob Herring (Arm)" <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        James Clark <james.clark@linaro.org>,
        Tao Zhang
 <tao.zhang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Mike Leach <mike.leach@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20250902042143.1010-1-jie.gan@oss.qualcomm.com>
 <175684936304.1217220.3167248149687349464.robh@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <175684936304.1217220.3167248149687349464.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX0MtHesDq+ITm
 2OHcF//W8gWU1q+aLfKevUQdAAQZv9LB/fLNrOu4iwNpuqH2lADfQTimavLNPEksLwDAnp5mOAJ
 eM2Vb6okbpr6AC42jdFk4soLe8CUHCUlsrNUk/tbvksYJSLXY/Ow96fK8uFV6AMREqAUgk1ZrHK
 8MoU9uAUYw/IBSiprD4gNfyRBJ4udC2DpKzFeCJLcyPZ5/pAiuTfy5rlb8i4jttS8N91lxp4VVk
 AS6rJyg51S1JR5p/nk2JM7ZJIcGrfLWINB7auKyvLtsK/OCnJzeZrAU7FoaOgXue9unQ4haQm5c
 EkJuVnmP3ZJMza33Y02xR1F63D1wUmeUsBxH96kT3/9CoYq4Hq45AZdLiRPhuc3tIqxi6N8EpW6
 kcW099XKStBCYr1Fda9lZT4o9dPBHA==
X-Proofpoint-GUID: qg5TxIsx90bsOv-Y9jKKMSP6Ip7p6Eti
X-Proofpoint-ORIG-GUID: qg5TxIsx90bsOv-Y9jKKMSP6Ip7p6Eti
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68ecba9e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=TojU4j7_S79YkeO3qSUA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025



On 9/3/2025 5:42 AM, Rob Herring (Arm) wrote:
> 
> On Tue, 02 Sep 2025 12:21:43 +0800, Jie Gan wrote:
>> Update the OSS email addresses across all Coresight documents, as the
>> previous addresses have been deprecated.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../sysfs-bus-coresight-devices-dummy-source  |  4 +-
>>   .../testing/sysfs-bus-coresight-devices-tpdm  | 56 +++++++++----------
>>   .../arm/arm,coresight-dummy-sink.yaml         |  2 +-
>>   .../arm/arm,coresight-dummy-source.yaml       |  2 +-
>>   .../bindings/arm/qcom,coresight-ctcu.yaml     |  6 +-
>>   .../arm/qcom,coresight-remote-etm.yaml        |  4 +-
>>   .../bindings/arm/qcom,coresight-tnoc.yaml     |  2 +-
>>   .../bindings/arm/qcom,coresight-tpda.yaml     |  4 +-
>>   .../bindings/arm/qcom,coresight-tpdm.yaml     |  4 +-
>>   9 files changed, 42 insertions(+), 42 deletions(-)
>>
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Gentle ping. Is that possible to get this patch applied?

Thanks,
Jie

> 


