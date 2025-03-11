Return-Path: <linux-arm-msm+bounces-50939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B757A5BD93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 11:19:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C807A3A689B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 10:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3902356D0;
	Tue, 11 Mar 2025 10:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lKjgeKJL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606F42356AA
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 10:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741688286; cv=none; b=jQWis3uq+yQ7BfzbaYsUY7IYAbLCtJes/jJ1ZyxTCLL+ekBZBqw/UkeIsd38aUHWTOoO4vs1aHn25RJy/vbAxxlx7TxmU4T0Njx8JrS8ZlVRuKgJuQ27iijBWL3SOnX2A36BP6UOBQN/LKqAQ0O9Nrh1OopQqadcqYjNC1OPXSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741688286; c=relaxed/simple;
	bh=aYwvhdYqKk+yMw4kbjnkVREvt5t0+ZNbizUj9s6FnbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FyjQG22AgCoeB0o8tjQ7A4yT8QIDfSyTLgTiS1XCGOUym2+PuLoUszkrXyRTlmjGbddCQQX/sj9j0maHGsxjtJJt5xxEUIUXXoSx3rma1mPuG3jY87qsLrIFBMsHP5w1D7/tyam8dtiBpW2jq+dUJ1AKAWpIaUyebANmLI2qutY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lKjgeKJL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B85qMI022850
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 10:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gLg0XiQLhr7BV81erd1rdBV9tLWyEIS3vPLctOX1NFM=; b=lKjgeKJLX/WEIhn4
	8R4pGOq2vztPel0PPZeOEArS9cJk3IDbIKrB2DBVhXgmR+Ztw7OYxtmzsnQUDv2S
	XNFx9QH+2zzMLrBHZCIGTTek6UqocD0KWeLQQnHA5KUo8TKbCh10ZsVLxhpaXkpc
	/AVX2gRZljbjZNiCQMBg7QZ8glsqCt8Di2FbOuaD/6JLhVP5AC7zA8J+uHLeMx0r
	J9/Y2EB5V6VYqZregT8n12A5WhNx6psQaEpN3KLEhkDVSSkQqlvobpcpMCTgljm+
	ojWku9YzYur8BR8PRwpnN+1ZVnk5fZ3j/Tj4sBKF7EhHuv5RGBwPu7XSqzHAAHxG
	eXakyw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f0q0223-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 10:18:02 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8f3766737so6086826d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 03:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741688282; x=1742293082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gLg0XiQLhr7BV81erd1rdBV9tLWyEIS3vPLctOX1NFM=;
        b=qgGoQL8DWrUh+8XXFx/2s9OTI0/GzYTOwIPWpnakT8aUVG28Ov48z8bTLshEgnqc2U
         wsijL01O60WryS/HLUHcXnDV7Vi7R5lBEE849ZIUkVg+PI6Vp163E0B4VK4P1mUSwhR8
         eOiTgFnP/skKlfkfKkNBykyHrDCpOAJW4J/fG65ims2gaK4SxfdduOt8GKUKPO+Qd/WG
         YJk+/eJjJtXLw632nQe7aEAJHRe70Eaw127xLD9etAdj9+OcwdTHSuj2EjxF/6U5v25d
         FNZtyB+ZXqKeZf19YTFq2zTyf34E+QDETocDOHcn1SyqopZwqdH1jf4FjyBWOjRZmSxi
         AkYA==
X-Gm-Message-State: AOJu0YzYwA9j3BoRzsYrodWO0RBXMSYiWtXpE93bfB3xVdc+yVvYD8ZQ
	WoEQMo9ZEJDdPXJVFesP/5uz0vZJmnGzFAP7KXje0RgDc84UR39/ljrKz2/ozZTilhS2DyZCaei
	Io2s54eUDZAkSoSoJAcLZ/VXDLr6QknK4gaWI9u+wUmY7/+bPOANeLlfCmjBxRSTt
X-Gm-Gg: ASbGncte/RjCatWRV5O1p7fPiWTQdTzD2h6yT1TuAQ2LIe9B+8jyuR2Wz3t4o6bbbJY
	rbDYDnIxShzCC6hJMdacWZokoosGTVhLDU5RXPLQcDepVTaF1FEsuDksc5yOFTKygV+Gz+8Kmu0
	H13K/cYWr9BaCIjvwZc73t1pDvY0P4COU3DvS2Lf/AVRoiZ5QNhMn7QFin5cM6o6Xua+AI0F9fT
	mEbkv4Xr5htDPNb/fAXxn1MYCYNOLo8wNweyWS30xnHpj4fsN+QvXmeRgWB61bq72kcdNP4+0tu
	12gc4wYTMwPfJNE+BMlPXR5jEsIhlTWozq1y8N0QT9rzsO8Yv4gjaIDO9t/2IhYvHBGFLg==
X-Received: by 2002:a05:6214:5192:b0:6e8:f701:f6d8 with SMTP id 6a1803df08f44-6ea23b414ecmr16717336d6.0.1741688282145;
        Tue, 11 Mar 2025 03:18:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW83xBYS/+ns5BJXqeVLeMUipXXxeFLW0QWx8QN5GkkDNXt4yXik/fUudE+ZYwMdYnZzYWfg==
X-Received: by 2002:a05:6214:5192:b0:6e8:f701:f6d8 with SMTP id 6a1803df08f44-6ea23b414ecmr16717256d6.0.1741688281842;
        Tue, 11 Mar 2025 03:18:01 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2399d4edfsm907415066b.171.2025.03.11.03.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 03:18:01 -0700 (PDT)
Message-ID: <44553d96-d1c4-4cd9-88ee-5d3bd7227715@oss.qualcomm.com>
Date: Tue, 11 Mar 2025 11:17:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] soc: qcom: llcc-qcom: Add support for SM8750
To: Melody Olvera <quic_molvera@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250304-sm8750_llcc_master-v2-0-ae4e1949546e@quicinc.com>
 <20250304-sm8750_llcc_master-v2-3-ae4e1949546e@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250304-sm8750_llcc_master-v2-3-ae4e1949546e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3cCT_IO-6Dpmv0dr0gPYWIYvkh9x6Y6-
X-Authority-Analysis: v=2.4 cv=KK2gDEFo c=1 sm=1 tr=0 ts=67d00dda cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=Wn71LMW1St--75GlNFMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 3cCT_IO-6Dpmv0dr0gPYWIYvkh9x6Y6-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=695
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110068

On 3/4/25 11:23 PM, Melody Olvera wrote:
> Add system cache table and configs for SM8750 SoCs.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

[...]

> +		.usecase_id = LLCC_MODPE,
> +		.slice_id = 29,
> +		.max_cap = 256,
> +		.priority = 1,
> +		.fixed_size = true,
> +		.bonus_ways = 0xf0000000,
> +		.ovcap_prio = true,

ovcap_prio = false, alloc_oneway_en = true

> +	}, {
> +		.usecase_id = LLCC_WRCACHE,
> +		.slice_id = 31,
> +		.max_cap = 512,
> +		.priority = 1,
> +		.fixed_size = true,
> +		.bonus_ways = 0xffffffff,

.activate_on_init = true,

[...]

> +		.usecase_id = LLCC_LCPDARE,
> +		.slice_id = 30,
> +		.max_cap = 128,
> +		.priority = 5,
> +		.fixed_size = true,
> +		.bonus_ways = 0xffffffff,
> +		.activate_on_init = true,
> +		.ovcap_prio = true,

ovcap_prio = false, alloc_oneway_en = true

[...]

> +		.usecase_id = LLCC_VIDVSP,
> +		.slice_id = 4,
> +		.max_cap = 256,
> +		.priority = 4,
> +		.fixed_size = true,
> +		.bonus_ways = 0xffffffff,
> +	}, {
> +		.usecase_id = LLCC_VIDDEC,
> +		.slice_id = 5,
> +		.max_cap = 6144,
> +		.priority = 4,
> +		.fixed_size = true,
> +		.bonus_ways = 0xffffffff,
> +		.cache_mode = 2,
> +		.vict_prio = true,

.vict_prio = false, .overcap_prio = true

> +	}, {
> +		.usecase_id = LLCC_CAMOFE,
> +		.slice_id = 33,
> +		.max_cap = 6144,
> +		.priority = 4,
> +		.fixed_size = true,
> +		.bonus_ways = 0xffffffff,
> +		.mru_uncap_en = true,
> +		.vict_prio = true,

.mru_uncap_en = false, stale_en = true
.vict_prio = false, .overcap_prio = true

> +	}, {
> +		.usecase_id = LLCC_CAMRTIP,
> +		.slice_id = 13,
> +		.max_cap = 1024,
> +		.priority = 4,
> +		.fixed_size = true,
> +		.bonus_ways = 0xffffffff,
> +		.mru_uncap_en = true,
> +		.vict_prio = true,

same

> +	}, {
> +		.usecase_id = LLCC_CAMSRTIP,
> +		.slice_id = 14,
> +		.max_cap = 6144,
> +		.priority = 4,
> +		.fixed_size = true,
> +		.bonus_ways = 0xffffffff,
> +		.mru_uncap_en = true,
> +		.vict_prio = true,

same

> +	}, {
> +		.usecase_id = LLCC_CAMRTRF,
> +		.slice_id = 7,
> +		.max_cap = 3584,
> +		.priority = 1,
> +		.fixed_size = true,
> +		.bonus_ways = 0xffffffff,
> +		.mru_uncap_en = true,
> +		.vict_prio = true,

same

> +	}, {
> +		.usecase_id = LLCC_CAMSRTRF,
> +		.slice_id = 21,
> +		.max_cap = 6144,
> +		.priority = 1,
> +		.fixed_size = true,
> +		.bonus_ways = 0xffffffff,
> +		.mru_uncap_en = true,
> +		.vict_prio = true,

same


Apart from that, it looks like there's some sort of grouping / parent-child
relationships involved in this thing - do we need more sw changes for that?

Konrad

