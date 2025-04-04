Return-Path: <linux-arm-msm+bounces-53271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DF8A7C689
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Apr 2025 01:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB934189D8D5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 23:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26071D7E47;
	Fri,  4 Apr 2025 23:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="li8BdDl4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BECE15990C
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 23:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743807969; cv=none; b=lJOhuxRbnVKxFzzo/Y4hCkwq6o8oQqTz6sw9/YPD7bmVLMA8CIWIPyhnrrb/xhwa0MAfejN0mfkRSu20JhRpXrtcDijhg9/961bYMi2jOzHgaIVrM1Xgu6s6lBIuhMpov83smm3ivXAKisXN6bdDfA7hagtKDKcvOKgq7rfexV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743807969; c=relaxed/simple;
	bh=e7s/wQf6biP/QLI2PC9Jk4SqZU8AvZa0ftX6e/SnlEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gy6hmgU4xizHHDQOQ2EQOnVWvKA0fqJkFVCK0NzgMqdOzs6NYnvGKBVpLKRQKLMpimXjhgvQ4AnOsg0zVHN+Qt4WD+JpU36pldlXT67P9AZe3MiwJxXIVtlYCFtxAxNAFiTH0ErjnVoGmSx+rJFKvaZivFI3Gm320PJIKUaTEmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=li8BdDl4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JEfA1005357
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Apr 2025 23:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pqZtD6HyViLcLmaA3AKsytIF9cWBf63Uq1fPzpIpZX8=; b=li8BdDl4XKae48Sc
	cEP/ciYDlBBzSPfUypJjeJx3Y8/sTosv2B7GZ+S10hG9yphjJN5cbatSeuCEYQXZ
	ckqXPhi+rVULLBGCErcKxl8MEuONklx8Vh+Q3/ACu444q0HjN6eKT5L9AAz8CoVk
	LFQDKEqQqrRH6281FcsTq1jcnrIqUErPdFpaydn8sbjxvdnJZk0M+/QF42GaL1MH
	gTXD6W0nSaGznMohbzRKm/iQPAEQj9Cat0P3fISZDcy+vHTN3RA+7wn1T9uDDB6Y
	HW6Bg0d6HJr30kg1dqpRPLlAzxgPWdrKjjKVUEp+NdxbeG5WwjkjZi69nMh5m3A4
	pbHdCw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d9b6p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 23:06:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f3766737so5057946d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 16:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743807966; x=1744412766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pqZtD6HyViLcLmaA3AKsytIF9cWBf63Uq1fPzpIpZX8=;
        b=lkeItcurpYgGDh3v3VaLbiAa1sy34r5AJk6BwhJ5foMFgCRMYknkOFheJgwnwhk9gk
         VpToNz8fs62WvQkgNzbxfESqQfUrl7gSq519Q0C7tF/U5pztnG5ov1iCOLHbDrQ4N4zp
         34IcK6Uc5rdR6m3fsAMljy8q4DEvcgWiDQHnrzbbpdgm5KCUwmjMNQmAOWapa3XuDGHt
         DUwdEhOgvKVeyOxSR3ADUbT8QOI2Rk5ZIPfYhEoikgq+pj1nu8w3A3Mf2DocoRAKstKK
         gTQYPqU93q9Bqh85RngwSuZCAoRnzb6TP8EAGq96kwBbPrmVK++ZAankggFqAI/k+FGf
         9I/A==
X-Gm-Message-State: AOJu0YxiLPoa1/wQGcogKSI47dHnLfJhUo1IV/2GRnhFR+eliXGJwCTu
	A12PzjUxQCgGqZzLyHtrn4IG5mvkqa35heQJVJgaWi4kFyXy58X4G/GrZoUkPJoRtr08Y5sOp3H
	H10gHNt8oe7lC/wXzJk7nV6eU4tKpc/8OHCwFcLPRN5+TmC1zjxvYKRVK9zuVqLAA
X-Gm-Gg: ASbGnct4evzQL0I0PPqm47/1Tx/hr710cb7uDbu1LxldzftoMZKu9GMIQkZo0cEqLPQ
	VlD3BsgwGEldZD2bbqrnvtOBJH/8xtOTXOYsV5aALRvOiS4VzqaW6LORtiPOtpE5kCv7qBb/o5D
	7GmMN1wzPCdtVUnjmSBOwxvuQqM+UI2qLJ58Yedw+jAeb9Z1qcIqeo/tdaTPa5tpuGRbxZowehh
	fQDwV9NKHiMKMvNNv2Afv0Cmhy2yqlJdrttedKBWG1OFKjP71IVbt55XqEZ7PNlzp8fxdUW9Iqh
	U8tYpvc2NaM6LaGkB/b4O7maW3zr8yDcZhD2F7MgqwIlDCWSp9vl7RDKuAxBHjQ0Pv9qcA==
X-Received: by 2002:a05:6214:400f:b0:6e4:501d:4129 with SMTP id 6a1803df08f44-6f01e7816d4mr24617486d6.11.1743807966297;
        Fri, 04 Apr 2025 16:06:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr35w740KZpw0xQvptnZ8MF+cYGIpMx6tB/EaxbG6zx0PxVe/i/z/b2Y4U7Nu22q2EIDnbuQ==
X-Received: by 2002:a05:6214:400f:b0:6e4:501d:4129 with SMTP id 6a1803df08f44-6f01e7816d4mr24617286d6.11.1743807965905;
        Fri, 04 Apr 2025 16:06:05 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5d794sm329756966b.11.2025.04.04.16.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 16:06:05 -0700 (PDT)
Message-ID: <fa5fdd73-fe76-4c06-a18a-7b06b87b05f2@oss.qualcomm.com>
Date: Sat, 5 Apr 2025 01:06:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: sm8750: Add UFS nodes for SM8750
 SoC
To: Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>,
        Manish Pandey <quic_mapa@quicinc.com>
References: <20250327-sm8750_ufs_master-v3-0-bad1f5398d0a@oss.qualcomm.com>
 <20250327-sm8750_ufs_master-v3-2-bad1f5398d0a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250327-sm8750_ufs_master-v3-2-bad1f5398d0a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: syfpnakRfb6y9z1B0P4StAu3L_vvj13R
X-Authority-Analysis: v=2.4 cv=cpybk04i c=1 sm=1 tr=0 ts=67f065df cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=DTz9NSAdtq1ik8-Tc7kA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: syfpnakRfb6y9z1B0P4StAu3L_vvj13R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_10,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 phishscore=0 suspectscore=0 mlxlogscore=639 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040160

On 3/27/25 9:54 PM, Melody Olvera wrote:
> From: Nitin Rawat <quic_nitirawa@quicinc.com>
> 
> Add UFS host controller and PHY nodes for SM8750 SoC.
> 
> Co-developed-by: Manish Pandey <quic_mapa@quicinc.com>
> Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

