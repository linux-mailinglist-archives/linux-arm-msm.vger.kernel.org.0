Return-Path: <linux-arm-msm+bounces-61429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2190FADAEE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 13:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCEF6168CDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 11:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24922E6D2F;
	Mon, 16 Jun 2025 11:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k7iYKOZD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4152E3367
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 11:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074278; cv=none; b=S2PvwbMcHngV1RT5qIIMouC/Y6cyl4TdAFt/LDLZi87hXXnwlgyJ1tPWOfPJg4DUeYcntRirBjqH4v0NCh5pm18yrOGT+umKDzV6v3ZvZkHEKrvsENbBoYVbeZb2QDGQbkpcTSgbQ7lAKzOHSDdk0m+J4cOdmM60sQiI3dDQVuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074278; c=relaxed/simple;
	bh=SqNvndz7A9Zt7yPcqFNmLJBQM6AtUHxshTQy3ysSsRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fR48CuZWuGYxI50vMvF+LSLLoaUejMZNNXV1djgLmBfLI2rd+ewJatxP8LZVmmNiSNkmmW6pRXRkjiUQXI54slX9oYreR28s2WatKEohPy76GF6INsCC9gsGO2gSIJid8nWYrlVEFRoatjNGFAL7eV4P+GRZQ5jybG63gHhd094=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k7iYKOZD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8f1ZU013835
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 11:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aBwqXHaqOGLYdlWyP5aCWSTDntNxsctiiIHM3sIcSwE=; b=k7iYKOZDjeXvftUZ
	VcALSh6MEOv7Ws+8QQMfj6hShQ1cOCO0aAmoBlLrHaBr+u0FaQYtxsTiMugkxAp/
	zn/NaEg+D5Odva3c+e9YiJx3ORTAGELltdL0orhh1ogbEosFqMMYfSgECKGnvz06
	7YZnzDoXYTQgRCr2jt7hsQOFLLDZYOwyoPvxS3/j2iqvbEBlQUiDA7wTje0MtvOz
	+9w8SSC4mR9KmoOh0CeGMvCHl3b7LYb+z7i9V0TrUisEXu7FYHofMmMect8sCg9l
	Xgf7CfSuDk8VxSYDKbvA7lLG8vzbftMsGXQN/KzNQcKpcE9Vk8SXZA1SY9+lbF9K
	J+JMNA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hcvb4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 11:44:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a5a9791fa9so9746151cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 04:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750074275; x=1750679075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aBwqXHaqOGLYdlWyP5aCWSTDntNxsctiiIHM3sIcSwE=;
        b=hcSD/UPkxrGNZdgoMPqN1KVb55aC53fhrWZLgLK52IYdVbP6J41nob5S1F3zXCkCwH
         JLx6Sn0MPfcMsB/AD2fU/zxMeo7E1pn+BhY7p5ZpTHMxDiqHVhxn7y4eCRBX0mT7zbcH
         H77wF1SrHPqHEB3L5CbFZdl/vfINIu0eFjLJJLJ7xHFXCB/aGwUNnLf0GUWvGvKpm6fb
         TnfQ642dIndqmPtVdyFK63dCfHPWlbBSgTfKlmmetC5n+KgkaXtPbEgWv/x3OXRhgbfD
         Xg/PPgNWyo/lzjJnt72Zgvr3WVgPjw4yNTnu8lV9UzFilUQ1ikLJRLAqR9tHz9XgUVFu
         fxRw==
X-Gm-Message-State: AOJu0YyN2dKVvpo75KFqLJvoLLwWay+1DzfsUouEC98QMiCKqN7OCEzd
	uuJDz+9D/49hCwCQ5S+hHj6/3sEVoOlu8eUq5GluegY6BPnp+fO5iEOf5IAGf9XXAHFJGYVlJyP
	EF3rq4dZnI+Qa9R3Odrypfkq4n+hdXYKVSbPLhi40F8yFOAhpIKZ2vbxfEANJ3ZkxU5LP4va0fQ
	P3
X-Gm-Gg: ASbGncvvQtatYlO/8WE48LMc3edjzN53Ux/xmkNWYsZ+aYpMC9GTb84sksrvpsRM+jC
	GRHuLn6yNIFI4H2Eoo+OhTd6IVl8DPI00i0+4/W3jYSQ8MHwnCVVpRLRw+tha3/jV72Z6mzY1x0
	PvQ4rM2+X6nqxSPMQ+QIyHpboTzXH2SUcLT/Z4O7jYsoKcWCYOzeyX8G8113BwJzcOMmzJYeSBT
	zQZuiEWrODNdd9ph0JXk36oaHgZ2L0bZqBCzR5eJke6Jpi3EiIKyzuX6dfUaweWT/p4LkhVE6pk
	lFg+oW9wwgPUL8Yx+EYrRjyORgJjk6w9Wi4ZnVyRWY/TF+mgCyA7Y+foMHyc3A2l9QTuL0sREEy
	642w=
X-Received: by 2002:ac8:5f53:0:b0:47a:ecd7:6714 with SMTP id d75a77b69052e-4a73c5a460bmr56637221cf.9.1750074274662;
        Mon, 16 Jun 2025 04:44:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLYGv6rn1SzgWDD2ehrxqokbIF+2wTCG5SWoRKjsh1D8V6/aT4j9BPofzMk3ijGeS/grAFJA==
X-Received: by 2002:ac8:5f53:0:b0:47a:ecd7:6714 with SMTP id d75a77b69052e-4a73c5a460bmr56637041cf.9.1750074274262;
        Mon, 16 Jun 2025 04:44:34 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6097ad640bcsm332234a12.25.2025.06.16.04.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 04:44:33 -0700 (PDT)
Message-ID: <bdb171c3-5395-414a-88cf-eb002af96804@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 13:44:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qualcomm: phy-qcom-eusb2-repeater: Don't
 zero-out registers
To: Luca Weiss <luca.weiss@fairphone.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250616-eusb2-repeater-tuning-v1-0-9457ff0fbf75@fairphone.com>
 <20250616-eusb2-repeater-tuning-v1-2-9457ff0fbf75@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250616-eusb2-repeater-tuning-v1-2-9457ff0fbf75@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA3MiBTYWx0ZWRfX3DF+jiyw4dXH
 zaPuYdq0jxS3/IvFizcCZVGm4YYBlsLfAYCz1SaYZ6urm6B1ygoEFx9fJXMHNoOOklspWFNtht2
 EkQcShdklJsbyvoYZ5joZl1jiwauf8i0cL5jN9YAOmsQMCm9lRauu7xewTHT6YCenXlgSmNRQ2v
 +es8DtRGF3R0y6+6MGsohj2qgBfmZMMQlCO4L7NHsanAgny7kux2Nf1yPedS4ztGWwW6sdf6PlJ
 lXFvPYfbLxnEecoJPOiPsM+T4JrdBEdADtIrMrHJVf0X6WCckhQB7SQRjxcr2+mYEbnwXkN9qeI
 skeyNdjr8NieHuehM0UvnnHc+FpXqBVq2lJt+G4WqDpdftP3pfzzn/FAy3GPDkWQQfQHbW83r4r
 96u8BwjqwkYamCsVyWIF3Ap+fgEdLVv2mpIKwEKCfVhKcntq8mbI43icja79M09krcOkPFJS
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=685003a4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=cispc58g6-s63dKQH_wA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 59wMjUK6BZY2Az-vdFarixnbzdWih-JT
X-Proofpoint-GUID: 59wMjUK6BZY2Az-vdFarixnbzdWih-JT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=873 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160072

On 6/16/25 11:45 AM, Luca Weiss wrote:
> Zeroing out registers does not happen in the downstream kernel, and will
> "tune" the repeater in surely unexpected ways since most registers don't
> have a reset value of 0x0.
> 
> Stop doing that and instead just set the registers that are in the init
> sequence (though long term I don't think there's actually PMIC-specific
> init sequences, there's board specific tuning, but that's a story for
> another day).
> 
> Fixes: 99a517a582fc ("phy: qualcomm: phy-qcom-eusb2-repeater: Zero out untouched tuning regs")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Riiight I thought this was effectively reverted already..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

