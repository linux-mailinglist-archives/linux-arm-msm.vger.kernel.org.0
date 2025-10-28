Return-Path: <linux-arm-msm+bounces-79136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98249C13CA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 10:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7203405057
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 09:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB04630217D;
	Tue, 28 Oct 2025 09:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e1h/4f9Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE275301010
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761643361; cv=none; b=RoElRxt+9aXuclZMtSliG2YwRiT6C2uSsb5Mo1CV+kFF/d1587DtCpU0oicG+/HwsIZ5T3GuVG0LDgIKTDSkhOxoyCWEcQR01jJMKrSTrHyvcQ7Fta3SHxNotkYJYRMoV0QtBzf0iR+t/tpcwSFoM7NQq4A1Qc+ezNskWUlvRFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761643361; c=relaxed/simple;
	bh=qsFC1t/fVaM3KdBTuNCtkaYnQArD/UtI3nrJ3KbKVlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rSm9aLJIn6Jdho0u10PqXkAg7oyRibhKXobXQFx2WK0vNuFvbIHlF3xmOztJOiGND/pg1Jl9tmY9I4Sz1xx3FPcAXpx65Gc9RaiSJdlEJ7Uh6xIdb9UhNyeKvQ/1aQWtyht/bgjg0kZ81ZT2a3HZ7huthOCCwS2kZFoAOoZNemM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e1h/4f9Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S4otw4589647
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IX/AJuPm2H3fYAH/Y3OWD0ONewAieu2FIaoXZk0cs+s=; b=e1h/4f9YDvRe1gvj
	fdP5jIbAD+QDcmuvJIqaGlfuOYHhVbNbAsP0u3qaO68jCxX0MKFdSMXo7q5ZV3Wl
	hkVigg7lyJX9nF1wFcN0c/pqyuQLa4DSqkCAaAwSTTeo+QhhgMoHt8EghrA7biQq
	kzrrfG1yQaxTizMSZyAIsM58/g0eTwyeylLgirEuRpAEY1M1W5FczTrdubr16CH6
	nqJCCadPsGbuZtLs2wo6M7tD5+GBfejKisOLkP0MTN5iG8WXXyVsUWGJOgIk4aQB
	lz5Gh+aU8Rfc0DDNGw3StQAPmfE7NQhf0zOzhe598yGgYJR8YoxtClk1RtTncgZ3
	lCvtsw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2q5u8rtm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:22:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-87c1d388a94so16445846d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 02:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761643358; x=1762248158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IX/AJuPm2H3fYAH/Y3OWD0ONewAieu2FIaoXZk0cs+s=;
        b=M9qthi/x8uTGMd6vCxWtG299tHoJkElbNOkK/cY26BNHxSype1Zowz3sTEd46ku9GJ
         IGzqftJLajhXOdidwc0Gd3Tg2ZviE/Wfqce+f6AGorrjbKtuv+BHwx4VJH4wMF3eMnc8
         MWn1BWvVT2/D9NLqSrTo6ThKXe1lZAxPvroCsa5WOaNnz6QGMU7+VF3A5MOzRHfu8UtA
         Kd3ne8Iey/tJTfVx5OljWOC/HLRUcTBmEjiFpAd2TyrEy27IxuLGRkEpAqTyP4dtQjkE
         3LuH49rMTymDh8Ibi+ZRPKrnWJf4prrrOAh4bHxHce+/DRatouXlcWllabR2IJjJ5l8l
         x6FQ==
X-Gm-Message-State: AOJu0YwZjyOn3V91uIHZykqbWB6vk2G/8FTV2U1yS7CPvpBJ3vwlkWcm
	2oPcMKU9K4+twY1j+rZf5tsThtaHI6k+KKuTluIFjNBoCIR3xiIVgwZxwx0YUy3Lk4LJxJj3h8x
	qIRQ9xR/A0zHepJj/lwNz387logmr+KsWW6e/XfiNfmGIpUsgpRPwIaHd8HH6dNNFgX7a
X-Gm-Gg: ASbGncu8Z6uHQQtNlw2XAk6uG5Nm/9tq/8FLJsRYsFOym3Zaz4nqmSBSeTBt6nwxY/r
	lFVF5QnxltdLQIM9GOONMh3KcTWe2u1ychdszSu8gwntbaeynF6LyhHFz+Q2H0IXDgCePwZzHug
	sUTwMDYB+WKjP9epsPnSjC4g/VWg2qxqpJELZEUdqY7V9BUvC4963GJlf5utTjdCEs1JA9gm6Vt
	/vxDt9kM5bm+fvtplpcRyVcZT1s/zoIDkZNa3G1gwYgQOExvtvK5+mcium++I9vkILH3dLMC/f1
	eCnp4bbbLx3stOH1+neKbID4Pt8GQP+rEQ+wBqwmKUWPqqzCEI00U3UghC0H5K+WTzfiZ4uWu/S
	9lniEAoUFViGaeyBvLqnpRCkSKc4Y7qMD3nAXJL92Q/9cePtD3pwnqrId
X-Received: by 2002:a05:6214:27e9:b0:830:4f29:a648 with SMTP id 6a1803df08f44-87ffb112d3emr22293326d6.6.1761643358058;
        Tue, 28 Oct 2025 02:22:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1ZreXF9W3AcLutVyZajvD/Nw87lTiLoKTGKUZuS/I2lkFW6ZVkmxbJZsXQ+QjTyDQ5ip2zw==
X-Received: by 2002:a05:6214:27e9:b0:830:4f29:a648 with SMTP id 6a1803df08f44-87ffb112d3emr22293176d6.6.1761643357549;
        Tue, 28 Oct 2025 02:22:37 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853077e8sm1038621166b.14.2025.10.28.02.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 02:22:37 -0700 (PDT)
Message-ID: <a9da8c31-fb88-4350-96a4-de61d68fd756@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 10:22:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] soc: qcom: pmic_glink: Add charger PDR service
 path and service name to client data
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251027212250.3847537-1-anjelique.melendez@oss.qualcomm.com>
 <20251027212250.3847537-3-anjelique.melendez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251027212250.3847537-3-anjelique.melendez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA3OSBTYWx0ZWRfXyKDEDpK7ozCV
 tf515I+dluu5ClJCAOuRv6MynnYxQAqp/C2bVacup4A29L3KtbNZ77l6LhGuDD55WWWfEOTvpJo
 mLbA/Q2heZrmAaqpJCDGPO/cFNRmw5ci1h0EIewjcWswqLQ/u39h//CwBywQUvHM6BnSOToieSn
 UA9+ItVAXh9KHY7cBCdM2lhY5VMEeJA254S88N9Qfj6fEWAAbIbs6u0JfYo9wir7T2XpH3F39Di
 LbGXOHimIEZLZ7etw944oaRm2SvcsihMeZ4a1heBwzAsGKu0LOqBpxeDaFaEkEpdh3ZcyFZ9Trj
 hHpn52ba0VcLdQtPvCBf7bzvCIoR+9J2TGxIpGCf4BrTZSMFYhZMQyE1KXeZepwXIWguQS/9TK7
 N38gWV5SF0MEF5zRecNMt4g/9kBXoQ==
X-Proofpoint-ORIG-GUID: KHC5HaYZ-OabjNQEBNA42bSrzPX_P_e4
X-Proofpoint-GUID: KHC5HaYZ-OabjNQEBNA42bSrzPX_P_e4
X-Authority-Analysis: v=2.4 cv=c9CmgB9l c=1 sm=1 tr=0 ts=69008b5e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WU2mBd_dA-PMypUZboQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280079

On 10/27/25 10:22 PM, Anjelique Melendez wrote:
> Currently, the charger PD service path and service name are hard coded
> however these paths are not guaranteed to be the same between PMICs. For
> example, on Kaanapali and Glymur, Charger FW runs on SOCCP(another subsystem)
> which does not have any specific charger PDs defined.
> 
> Define charger PDR service path and service name as client data so that
> each PMIC generation can properly define these paths.
> 
> While at it, add the qcom,kaanapali-pmic-glink and
> qcom,glymur-pmic-glink compatible strings.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---

I think this change disqualifies Glymur from having a fallback to 8550,
since it couldn't have worked without ignoring the PDR

Konrad

