Return-Path: <linux-arm-msm+bounces-55099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7C4A98553
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 11:23:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE2973AA171
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 09:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E7D221544;
	Wed, 23 Apr 2025 09:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cLNSx3tr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C63B21FF24
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 09:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745400217; cv=none; b=B4irHiNwMxj03Glrzd0xdgErMt8LY+/vOqeyjjrQweqAHA7P5kuK5Rjjjo8K2dsVDYhatRjrrMIlqQz5eo2GoV0r7PqZQkM1mrJLSZLF8puvjrULBbbxWItDLK/qD/5K8KKAG1ZFYbwppdCGS5dBCQsPT2cXgLDFYRX6eS2NFU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745400217; c=relaxed/simple;
	bh=iH7DP9dZpJanqirxLyNRUGOtbtByGYbxW/ZmYSEtK5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yrz+TrxejAU3Sx3n6JFbhLtYxJ48BxKyvVYAz6nPssPpxZu3G0pg29eq0LMleTnQJEqsEXH+/vznv6/TRLQXV15zCUPSBmdFzXqt4uAva2MyYjcY/FnNIY8Rz19VUD9b/e9Y3DS3cHXp/SFXn7+AN+YoLd57k03z+bwAl8KfeTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cLNSx3tr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iAWw014559
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 09:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S0DX7BSBUwn7p1lpR4izdME50aVoNbeF1btAoXSr/gE=; b=cLNSx3trTKgV1bGH
	HDNGFYlvI6zlZmH81gTnu3ifVUibeKviSphb87i6r4abHOvQo+Mv9tK7YlAw0yt1
	TGv1o6eJLKXjeKJxIbqDN8ZScBrhP1qs0KkpceR8cQlpW5B5LzrDTyXeo4AZLiwV
	hHk6izwJHIayeYlKdbXNb/r+weE5b1FQ6bcVkJNNkFCuoYySIDJ84oYyt8G/0VC5
	RO7FIXwgfdPrCuqq5LBsMsGV07DfmtjO5k+t1x8OP11OezWQOcP0KmytYLrkF6wX
	spRXoLIuEvpUrrIT2TwIaWLpV8Vo2IwK8GLylwNzhxj+emf03NqJjUIppXWZvqvw
	zwIhmw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0hktw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 09:23:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8f3766737so18175916d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 02:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745400214; x=1746005014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S0DX7BSBUwn7p1lpR4izdME50aVoNbeF1btAoXSr/gE=;
        b=oHiyEdv9baSPZVeJy6fZ5VExaMPJa9Y+UYsJlF2G0eFJtlvDiC3o4ZAjJqyjoQPpNK
         ekP2XZy5Ry5D2C8OXSo59C8HrQKPTotVykeaqZPKFQKEiiCE/IyXNDjzSprr3Jf9o+Gf
         1mw6v2j3aoGVA/mbbWuzY960ANEMPfcOqRbXfxu2fJldg9u9oarRYU3ncZrrwuBM6QzH
         idj33EMrclMniXeGElK/Ocv8s3XgFNASqTa4DcX9seGMwYJEeH2Rk/UgQ2BTSGwSLc3L
         I2Wy72qlGVE7UkjsO5fDuJmWdE83Ryojjr4E3vorZ/hWnxMTzIm2U7MwcWNNxUn9Ilie
         ET2w==
X-Gm-Message-State: AOJu0YzJ0apWcbgcOqNaEmlQitpgWfN58NqBL0IRbQSfRukJbMj56c86
	teQACeIhZJA9FtvKhAGdIBZZMW8v6qGmIfE2unVb8FXn58ZmgElsgugH8DeRaEQ3fKRZsZnA91e
	blA03E7TJ7J7dOGsqcpASJ7CDDz6+tSj3Sp2e8Ej6biy2dWHDuhr2X16XGc6PhxS+
X-Gm-Gg: ASbGncvhKBpzDsajNG12uSqmmOnto+muTr+Kq0Dw4z7lZMYIKFR4SBzDVdG4Y1A+txV
	A575k2loE6yu0Q+nhdsp35OIUmbpoJu7DjHRJkBKWajewXaVnoFOzcqB5DOYbLARx8VhRhK4Caz
	KHI9cvXqh3EzYFQu3rIkVCM/efxZ3+IS2XGguieEUPlXqutYDk+GiC7/9NMJs2juFqvfHHb0MR6
	nFayEmFM9tlqCCpW42JDjP+Slu13LzSL+0uKR650a/3CkCHOtL0U8YGgVoGRIsyjTWBYjdCtCc7
	vayoL2cAzwE0CUawo2zzeJna0zbtoLRUD4krRdSCSVkIu3ZJkGhv00rLH9GYDunBa7Q=
X-Received: by 2002:a05:622a:251:b0:47b:3a2:1fc6 with SMTP id d75a77b69052e-47d1b89d080mr14325971cf.3.1745400213836;
        Wed, 23 Apr 2025 02:23:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+/gytjr9+nrsN7/CXGcHCsAwkAGihF5yThYOCu+thvEtbYV2hsJ75B2fDDgPRi8cI1jlxPg==
X-Received: by 2002:a05:622a:251:b0:47b:3a2:1fc6 with SMTP id d75a77b69052e-47d1b89d080mr14325861cf.3.1745400213476;
        Wed, 23 Apr 2025 02:23:33 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec4f6c8sm790669066b.64.2025.04.23.02.23.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 02:23:32 -0700 (PDT)
Message-ID: <4dbf93f0-5df4-4c4b-b7e4-32cb4b99cc6d@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 11:23:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: qcm2290: Add CAMSS node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, bryan.odonoghue@linaro.org,
        rfoss@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
References: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
 <20250423072044.234024-7-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250423072044.234024-7-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: h2LYu6IzkhfIwfBdKJAsKopBqCT6tnDH
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=6808b196 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=vtxEUVkT7waMBiOsAPUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: h2LYu6IzkhfIwfBdKJAsKopBqCT6tnDH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA2MyBTYWx0ZWRfXwoBtPUX7msVd 0rw2lXaW0eNFYVjEB4+WszpZmnz8+E1pg7ABFr8/YBJ1DLLTipVFhIUg+oegeV1Cz5tyIfF3oxE onld+3jv6qeOo6Ke7XZK07knm2apBLQMM3CQIhxVZ2v3CielQ6qPBwZxfyaavoqiB+d5wJFL1QW
 euo1fTpVzsqLtIG4D7xQAun8vYNXgbi1K+DoHp/oWHLoYwAF7YszwxvMkDPZ2pAS0JQYUkFbv2P OJrYnbYPYawlcGKGptZ0t7ZESeDCrwr9WHf+JjtsttMHxhhOFDbN13YlvPwjebJsUWa8bq+hJ9J 9sEFqHshCV2gRs7vqutdCr7abFwWh89YH9jZvTaWfsQ/MzHS/J6Aqo1urWMGGwgwt0FHjC6YyzP
 6L7Vkz4ONMRtjgAvKJE3YhNUhqL5wmuVBZTji9R7C8K0nqAUJKasO0h26z/pPV5ZavVjsnYM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_06,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=760 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230063

On 4/23/25 9:20 AM, Loic Poulain wrote:
> Add node for the QCM2290 camera subsystem.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

