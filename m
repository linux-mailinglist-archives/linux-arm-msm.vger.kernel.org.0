Return-Path: <linux-arm-msm+bounces-85501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F11CC79B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 13:28:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1E97309CB8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E193C314D34;
	Wed, 17 Dec 2025 12:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LNy5rvrM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BqgtRjHg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0A02EA731
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765974374; cv=none; b=oqmZAk6H5HDMTMQaYJ1BRKFPxmSHLGcMYlrcodrRb/2Nb3x68dyGHApryX3geB9+V8xZufTnsAMthGUtr2jj14Xyv3mxfRsz7rUri6QXfmwZoYl+s2JIbApjax1Fdpwt2hyMY7aDZHLD+SuebffRucRI3afLvIT0QpCir7IB7RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765974374; c=relaxed/simple;
	bh=C1feAJ7owFyiR49qyLvfAicbrprYnsAg83SKSJyFT+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XP7kfif7tL+JxiocBotmhSgTycenUOz0ofF7q6InZQW3I8fzGFU6mdxk2TubkZYHwOFkEVhjOUNJKNPVv7dRkb89+gslmGPu4uGI/ZBKtV4O/6NRLz8GgkvK3HowR6h95B69wmdQ6fqcK1WOBD5gdb2g60lBHp35UBRKH72nngI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LNy5rvrM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BqgtRjHg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCL1K43048848
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kpdgk3joxMChu4E1gW7/tT1GkFwhKf1tpGpGIp7IAcA=; b=LNy5rvrMJKzXqo+o
	lR0/JugV7NvzveuMobQ5QjXIzsUF1JSiC4p+o1F6bFowgvQ3bqRvS+np6jJoWZjl
	Z+bdGawUwn95OZeVou7MuektFf9qxgZaIp/saqKSk5MZ8cGVwwB9p9znPEW76+kf
	wSXkVGau+XMsDLIerbeZJ1n5qDCCpnksAefxXHOGY3cPksNta07etx0Lhhz/tCWM
	l8wPGkq/N3pvRNR/Ub0k8uxJpvjVbqL4UHAMP5pg/fCIYDxwua+xPDC06ps8HwKo
	mTg8rRYuoNBHqu5UVKdvHN5mxodX1MaV3DugrzXLcyutY6JpB0T2tYivTLGCShm2
	eL7Uxg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3jgq9whd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:26:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ede0bd2154so19191921cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 04:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765974370; x=1766579170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kpdgk3joxMChu4E1gW7/tT1GkFwhKf1tpGpGIp7IAcA=;
        b=BqgtRjHgO0jd2Dvqu0QvtNoJBl+1TKJQdqX5IEo3vR5h+J7y/xs1HpT+L7TNdjsZtu
         nt+pAqJWKwykT2pxq8IhSrk6JGL1FGy2mvQh/OmYMK7/Lc4/nrlBicDyogYGpMxJkE6r
         1AxjCYvshx/ppomw/KJwxJ5a8es3XB43EAk1YuSQxIAzHhz1biy0eQb0e8sFpfzeJjY5
         QeDDB4M3fSBh8xeh51U9Dt2rGN+EWZNUrCABDhaQur4gdv0rHYxnubiVIQK7pxjH6lsQ
         oezwHI43agQAHkCBf5zRBLGpe/hNyGGNlOtXnGEFk57pZI0kybO34MEc+I4sn8NGbNHr
         D2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765974370; x=1766579170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kpdgk3joxMChu4E1gW7/tT1GkFwhKf1tpGpGIp7IAcA=;
        b=ilbXIjL49lbWRnOz9BLbw3pQWZ2+KN+dHyGLwxjAIgBAsaU/KJcTgqS1g9w20ou7qw
         COLiIVFpwP8UOL0bSmhsxbbGiof2YNTjk79/Wk4agoQU5aVWY/1OItGbWhGcq0ksQ693
         oCREIAcclrWGqu3h1xfKUseHdWKWPaVC+CsAd8sqSQ2vLu+rJKWBe3NKSdoYQ2ksgM18
         EQXUtb16ESKq7asWYh26zXTFS60pTccuO3V4JUmBIUXmpph9XiEz32Fj2W3ft/hPHtpG
         YGO0qq7Flmp909kmYu++o33FXK+cFmxXC/6AnP8ssuw2sWEMrPKwO2EP+2SXKOrpZROc
         GJow==
X-Forwarded-Encrypted: i=1; AJvYcCUtIuA30+QnKm2hJIWfsi6Ait2i3imtu99lqjmLEgIPfsKLJ//CubVXnVBD+ZpA0J+M5PGx/oeewWNnfl4d@vger.kernel.org
X-Gm-Message-State: AOJu0YwnBH1XugOUszU9TOAKxHwCO9mUllAtwFZVclYXsi650uyJ/rQ/
	asy6yWyL+CE5Fy3C+CIKhaAUmoSkCXZGaDoRDpekeifO4IzXpOaL7dsPI8co1+JDbWD4d0LdWO4
	iEepWBKYSPkKAtFwoud2nwWCsPF/K3iS/snhSTTemQva5MDiwfD2bVWQjnz57E6IjpLoi
X-Gm-Gg: AY/fxX5aWixj4Xr0fwRh6U3/lU7XUmjOBovrb91NSEPGZZj21NmTDjoO3XU10+N6QNg
	1xlMbWs1+M2G1sVk/NMOwbyZty/viUM8xV2vDbBGyYcBDmwEPfEOdKhJmkwE6UnCilHeQHMgGmP
	3B9I00ZWAZMuU8ezcjYxc9N2a3xddYCZjLOyvwoxU6tDeCuKLlWPrhVQe9tC790/zCyPU7L7nXE
	B+k4PfgfXYAAoeONGZRX6dbL124HJUB8WWd0JsvCc6Xbf6jI+TO5lukjHzJk9yC/+q1Qztd1a6A
	HZoV4x1UsD/g5GT29IFy1pki3OfysxKCqTiDORusp93D5e8GDsl3EjU34vD4GCE5sxfQ4rsGw2d
	ut/aLuXxG2RbXnMDzT99ZBa0cEY9+ASGbDo20JOyiC6BYMkam5tF7mTFD5n6yewF4FQ==
X-Received: by 2002:a05:622a:28a:b0:4eb:9cb1:c290 with SMTP id d75a77b69052e-4f1d05055a4mr189248011cf.4.1765974369594;
        Wed, 17 Dec 2025 04:26:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEM2MldRz1oQoLZ8y4vGWKM5zqNK1ePwyoEfZp+aNFz9BnkzSv7Rdia3p0qOY4gD2bA9awhIQ==
X-Received: by 2002:a05:622a:28a:b0:4eb:9cb1:c290 with SMTP id d75a77b69052e-4f1d05055a4mr189247771cf.4.1765974369189;
        Wed, 17 Dec 2025 04:26:09 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f563bb6sm2246734a12.20.2025.12.17.04.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 04:26:08 -0800 (PST)
Message-ID: <424a58f1-9edf-4b28-9dd1-18b5019fba62@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 13:26:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: SM8750: Enable CPUFreq support
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20251211-sm8750-cpufreq-v1-0-394609e8d624@oss.qualcomm.com>
 <20251211-sm8750-cpufreq-v1-2-394609e8d624@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251211-sm8750-cpufreq-v1-2-394609e8d624@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VLjQXtPX c=1 sm=1 tr=0 ts=6942a162 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=54GCY2OcYghDP3SkkFsA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA5NyBTYWx0ZWRfX7bx75AMUmsj4
 85qtATLtmVcoJOzOAPltntt+hYJFuetbfVvSKGcnmX2v4jkvfYknIr8Mbp7y+dl5V86p/82AuN/
 u4m6DExoryQpvDB78Zw5oHL/hqDfQnIt/vHMFmVZFdSthe0lz1+a64kS6ZYVrNoDpmvIUp62IpE
 B+Jl9zyrt1P1Ua6pOqLSaqyZIExMDW7s7+8MohgrFMt41hxPD2erkHJ9zF4O60SK7+NVf+ghGDi
 UZt8XLvK/NQwQpfTszAKCl/gCHMlCB76/w5lgGlNM1BOU3qIQd0pEF4cXnSKpWkvYZNErOqha/I
 URZckPczRW2cL7Af/M6RvvGpyNPxmCt+UOVKUUbQH/fSKL+cfh5737iF6SeEDnQItB4ULUPpuFO
 +4rdXCtC8yqWERxEFNnqe+k6pS3bLw==
X-Proofpoint-ORIG-GUID: KyiUORIHBGbMrk1WJdqpSPKir2LmwDKj
X-Proofpoint-GUID: KyiUORIHBGbMrk1WJdqpSPKir2LmwDKj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170097

On 12/10/25 8:02 PM, Jagadeesh Kona wrote:
> Add the cpucp mailbox, sram and SCMI nodes required to enable
> the CPUFreq support using the SCMI perf protocol on SM8750 SoCs.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

