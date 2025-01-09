Return-Path: <linux-arm-msm+bounces-44599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EA1A0790C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 15:21:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5702B3A0813
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 14:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E2D21A432;
	Thu,  9 Jan 2025 14:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ctvc3D3D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0458A218EB8
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 14:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736432511; cv=none; b=RxYpqRDfHdU0FsYbjO8GcIU3iXtXo1gSIRw1Lx5UoVOmRZ+w9rY9HWLNYeR6fqsNAROy0Chaa/OfWyTSYZHuosTVtFs2NJTYSMZ9IUbK8Vt5d59Kld8nSWdSgYoirlD2xPVQpf5LQusgFpjqcgS3+yJLn1W+nGiIiw8LwvSEjUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736432511; c=relaxed/simple;
	bh=F+iWZvIytZWY+7ydCfJ+0znKYlIobZB2c/liUawL9e0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NIzoV7LKMn+RnP/nmTjyRP/SHeIurjIT6Sb5AWW1GuJ7PzqLRgygQ9puMelo7fS8pxHyORMoTuByx5CYfyvleEXHvJtUPkcBPZkKiyOEjnEoPZ6prWZNt+qKg4hnXljsr0jWZ20krbFevcLb8Zov6p7wpkDTX2RE29SCn3WfxVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ctvc3D3D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5097GkrB019105
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jan 2025 14:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+4I9xtqtxI/6FFPPVHJmQwDgRmNMqfCZbFdmcO+iwCU=; b=Ctvc3D3DLcpCFTCl
	QhaVMBnssUGg2z5BimL2vuqyL1o3fau+2H8nJB3MCl7/5TXZzJDkvcKcK2aLzk2i
	NktwIV4XbQ74W2/0b9iwLKUs95kCa6bt0HX+5JHbIljZcBpp8HcplLMJvCcMkjph
	fwwCv0BqJy+hv46Ycqxk0s5hIV5IDbWSdtR/jZvbcpMa7PQBdRbGO//Awd3dL15/
	GIKdmQiCC9+jUbdSvEH+7kFzdumT/gUeAmj5lytrtTtCohb4Eta3stKpiC2Icn4w
	gy4ZuQ5ADQId8fFAQ2SXobeczy8XAX+osFit702kgGCcIMeLIVV84d9f7xRqi/vA
	1zucXQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4429x51024-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 14:21:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467a437e5feso2508991cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 06:21:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736432508; x=1737037308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+4I9xtqtxI/6FFPPVHJmQwDgRmNMqfCZbFdmcO+iwCU=;
        b=UXk/Pj/nhJHjAyeTpnWAnzZ9+W3PcXmmefKE7/uIOE/0U5b/mnOpaV2KM73ZrWkPlB
         zwHKZg2YGYW8tNFF0+ADLST6MO5Jzuy7WNlCpnyc0zPfIS1loI9gJY4EigLz+YH5cGlx
         K9Z3qk7yfshKXaQvp1FkDLbZTBdTpYGCF0HEUQG3tzHFGLp0yDH1bcXtelqdQ0t+rQvG
         A0SOBeoZBHhEusNJ0ecfhwYriLqQ2/KHUtYdefaBs6xh7szqug517h7+RQ/k9BUvV9W6
         9UrNVVV18tQpzHFXtAar6gm33KQIKtmo56hBTYkS0KEIQSAQmBGtbiCLRDdMgCbnbHFa
         5Nyw==
X-Forwarded-Encrypted: i=1; AJvYcCUCxo3L+aOVqEj45vSBaqqqHTi3eUutdzsdvqwQtNqAZnj03xwBSCbDJphXJAOGudLBEwP7tNGvcgrjmyiW@vger.kernel.org
X-Gm-Message-State: AOJu0YzawEH37dqkBW+5eNZtydRNzDj6JyRuhM1T1ZzQnwEy2BUTCN71
	qXm4d2Snt3tTSMU7pifk0m66SYnTj+kzPvpbYeLNiUN0tjsiRHjIPfPiiaTlO4TMLQhOdLKoBtw
	IE6pmsDV5DFUxBAlROtcZR2N2jY/EFXsbIYdwbxpWiovEVp+BaamRNktO2RAbtQg9
X-Gm-Gg: ASbGncsNV+TnfWUHsF77nlhCigI+KwHgb8UtUBe13kgyNs9U7QJGmYpk+SHONBEIdzJ
	JmkkI3TYr5WoWtI67M4Kg4OveAyT4guN2x8L6e47agXHw7qVeuWib2vY69GJDlE6DkZMUlXbikE
	sVyZg69Ycz6vtVJ/Ng+DQZ0R6bMLcaIpA2V5xUpoRWinsfPCKJ1U8I0DQqyEUhR6s79UCUiVExU
	/t+w1TfXEQtMdlZjumCoRWgwGM+nCNdYjA81/UvH74abtiE/XT5J2+5DFMKex6TeIfyitcQdXKH
	mEtLFGLyD6bR5BtB1Jmg/Q23iovoUa/zQMk=
X-Received: by 2002:a05:622a:1210:b0:464:af83:ba34 with SMTP id d75a77b69052e-46c71078bf3mr38711771cf.10.1736432507901;
        Thu, 09 Jan 2025 06:21:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7GewUd76dMLyLY+wEhtmmNRVdqFDKCmt9z6qHo0Z/rWk9fNLdViuUjG+bt3O7srVXBQBGmA==
X-Received: by 2002:a05:622a:1210:b0:464:af83:ba34 with SMTP id d75a77b69052e-46c71078bf3mr38711651cf.10.1736432507622;
        Thu, 09 Jan 2025 06:21:47 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9900c440bsm633378a12.26.2025.01.09.06.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 06:21:47 -0800 (PST)
Message-ID: <fb988217-cc2c-45e2-b102-6e85c5aa0238@oss.qualcomm.com>
Date: Thu, 9 Jan 2025 15:21:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Use recommended MBN firmware format in
 DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250108120530.156928-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250108120530.156928-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: siTRUSpdMs7oTRDwjXKoJ_oE_vOUd3Nh
X-Proofpoint-ORIG-GUID: siTRUSpdMs7oTRDwjXKoJ_oE_vOUd3Nh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=939 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090115

On 8.01.2025 1:05 PM, Krzysztof Kozlowski wrote:
> All Qualcomm firmwares uploaded to linux-firmware are in MBN format,
> instead of split MDT.  Firmware for boards here is not yet in
> linux-firmware, but if it gets accepted it will be MBN, not MDT.
> 
> Change might affect users of DTS which rely on manually placed firmware
> files, not coming from linux-firmware package.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

As unlikely as it is for most of the boards, I do like this change

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

