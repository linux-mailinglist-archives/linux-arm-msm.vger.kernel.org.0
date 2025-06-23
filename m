Return-Path: <linux-arm-msm+bounces-62036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF81AE3D17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 12:46:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40C483BABC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 10:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE9024502D;
	Mon, 23 Jun 2025 10:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qt/lZXde"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40911519BC
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750675243; cv=none; b=b8LiL3bP+hNsRaB4vWadwXb0izELnloZptTpz0IBgqZWaDb8bGbnvUQfNm27kd0aJwVDzTkVWan43he0zoDtXZlYXI4NR8fxEur4mjhzCFTPb5mVFKmGFtzklvD4Q7II2XFr5TFFKCRMY5V3wjUBWkR9Hb1EP/pX7BCwotWcQrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750675243; c=relaxed/simple;
	bh=KHd7ek7wScTW5BMWrwQrgcBrFmEZsNhi4ty1GF+C6vM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WwC9X5tRmtgieuulVokWoos6NTyPHtQcVZ6IMDtKxNQ02C/KQzsiVJO21gKc6UjvEc0DXtIaiY/VfHve87emFNisv0ctN/faPpjF60x7+wYTMhdobKzc/x43V0jLA3lq05L6nbpyp551YFMmtXegNA8NLpExGd4KyNlwr2edO7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qt/lZXde; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9TPV4020843
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFgHeL5Gs2jCvYUfdp7Tl3i7xt8xQpcA+8DI3691EVc=; b=Qt/lZXdeRPNUExJj
	j+lB6sPYre8ajxlImVPVvMvbl2W52LDb+cwMZK6R6+PNFfcjvriqrcBacV6UlgQ4
	sbbFc3isdWkysM6FOYcWGkkM9wKU4cfTwCHo47uV67BKzjJoGGGDxRMDtfCufzHE
	WJy7SsIOdvK/VJeHLE2O6pH5qRp07Q0Qq7gVbVvRikkejd5mzE/ukmstEKp+u4vS
	ybMSNzI0YnG3YoqffjtXsdF+tpNBtVsIbrIuPBLQx7CKB3xvB54rhenRmYMCtLMZ
	mp6Mvm3Nq5qG9KIBSAilLmo2n7n76Lzk6TvbVPlEVDxtl/NVdVn8q7zJKIhFcXLL
	uxMl0Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3r6uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:40:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d21080c26fso106787585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 03:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750675224; x=1751280024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AFgHeL5Gs2jCvYUfdp7Tl3i7xt8xQpcA+8DI3691EVc=;
        b=Z+XkuC442AZd9uqOWQoOQ8aHD0mCJpBbp807NccdK4w1EbyE2fxEq/iNG1t0Io24di
         /y4XpNOI3Ks6m7yMyMBZwdTyH0uG7+X+8IeO/HwCTzYgak4qkn+JY+ridMFwY+SZHWGD
         jqFFoOWGab+U75Tr/aGnEXXEX30z1rGoAIqbNhOvjnQJ5t0ifVRGptzTA1XGxrvnguoH
         kKFWBbGh7ZhehKYGW5a/hYYTpI8CZuujhUP55rmagPnQf2XUt2YaoVX6vJC8GFkwOHZI
         38AzO08mJFhwNOIsQF3dZcQpDi0he6G06zfilCl2U+MX1fIZbFhfx2apMLI9x9VSrztG
         zjvw==
X-Gm-Message-State: AOJu0YzPtQyOrPqoEf7b2G1Ed1nVIenRyOU5GP2HIuX2Nb78PnheiZtd
	LBEqz9VdH7kgPc5P5Z/FnDwOmASMIcTPehObFgZwQ2SqZaZ6vy2neHOckyzfTLrguF5clCvfcN4
	vEZjhebUEQV+SG0YrKr1d65MEGJSwJu6vd7lpuykq2+TtiiVBOPaia21HcXn+3V/91MW0
X-Gm-Gg: ASbGncs1f0GRXf3fe1ZCXSEU9nbdOZSnX+h4UhtimaR6HLaSUONheKhZ1mnGtLsBTry
	+HtrYuB3fcZJf2lkmdOCUSPC0JR0ArjcEWyIn/uEQXYJ+8CUwbXogBkr3tqnNznnx1LjG9gdbSt
	BUMWFVXDqgbn8LSZU03BtwBbaAuuesi/C1Vud3K6NkUOxbPz7I09XupXaOwKHetTpC5VMuitOtf
	Rs6ls8fFiFaEHcfUyVl4M4YI1cgmh7/GDctD5WDL5LpcOVTXA/LN+HmcrLBRXhTvxVj1DPLUJDv
	Axww5FTv4QdDEp/9k9nvDiOOhpe3f2b2LGKnCqmspEQW3YUPMCGhU/gBJzNwNsaEqW3d/P9yBch
	yLOY=
X-Received: by 2002:a05:622a:1aa0:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4a77a21e46dmr74611221cf.7.1750675223944;
        Mon, 23 Jun 2025 03:40:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2f1QQK1CX9KeTJNYGyibcvCyULu4j7WMWuIlqzfC1HVlyjzcYFejOgtkDsDfuQaX9s7pQDA==
X-Received: by 2002:a05:622a:1aa0:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4a77a21e46dmr74611001cf.7.1750675223466;
        Mon, 23 Jun 2025 03:40:23 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0a18d9887sm3419866b.11.2025.06.23.03.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 03:40:23 -0700 (PDT)
Message-ID: <c198b946-0599-4254-8ad6-3d897e047928@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 12:40:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] ARM: dts: qcom: msm8960: disable gsbi1 and gsbi5
 nodes in msm8960 dtsi
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Max Shevchenko <wctrl@proton.me>,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20250623-msm8960-sdcard-v2-0-340a5e8f7df0@smankusors.com>
 <20250623-msm8960-sdcard-v2-3-340a5e8f7df0@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250623-msm8960-sdcard-v2-3-340a5e8f7df0@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2NCBTYWx0ZWRfX1wMNeYJypI0B
 oi3ompNNByxo+3LTPjo6GmEKxmuwurzzcOgbYHXU9PDK+SvonDfZzprDreAXV53WIVMSGfChjY+
 dN0ZR5sEv+HlRSp2KG2epO9fpiOBtr/tycdSwWjaxUiTCEz2UwIloeqr2XdsQ4mztCZuTKxNOaB
 Mt8wCqK3aYyIsMtDFBypXibM9f0LbZYjev+brS9pPCaQyz6MgCQ64clv0e572Bt0krwAhuZtAfc
 HCHu/KTW1moiAX6A3fk53iVBfTd34yrBWujoLmfrQ2SzydToNlR+2NwuvPG0tBkjgaH2P8IIn82
 vS25SI3/wp81wdZpyDNkyFeT0aKqlK/3utl8kE2FEVq2bq4tRNyrzUmmhKTADxTYHsZDUGQ18qN
 PPec2GHcR/JSru/8tTl89uEfOYF9yWxGZBxWQ5n90URh9OuLxbNcXjs6NihlZssArLN25dn8
X-Proofpoint-ORIG-GUID: juI-eDLC7z1rwJX8vybdCDgXFZDS_dHD
X-Proofpoint-GUID: juI-eDLC7z1rwJX8vybdCDgXFZDS_dHD
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=68592f26 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=wxLWbCv9AAAA:8 a=EUspDBNiAAAA:8
 a=qfpFch6WGoqHJWfhXuAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=882 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230064

On 6/22/25 8:26 PM, Antony Kurniawan Soemardi wrote:
> Not all devices use gsbi1 and gsbi5, so these nodes should be disabled
> in the SoC dtsi, following the existing pattern used for gsbi3. The
> upstream samsung-expressatt and msm8960-cdp devices already have status
> "okay" for these nodes, so this change should not break existing
> functionality.
> 
> This eliminates the following error messages when gsbi nodes are not
> configured in the board's device tree:
> [    1.109723] gsbi 16000000.gsbi: missing mode configuration
> [    1.109797] gsbi 16000000.gsbi: probe with driver gsbi failed with error -22
> 
> (Note: Xperia SP doesn't use gsbi5)
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

