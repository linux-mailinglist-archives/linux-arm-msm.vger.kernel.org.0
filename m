Return-Path: <linux-arm-msm+bounces-42245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 837C49F214A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 23:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CDBC7A0FBA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 22:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE8C1AB531;
	Sat, 14 Dec 2024 22:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FGwVLHAx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2E419993D
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 22:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734215687; cv=none; b=baa/fGxlyw41byP+JSR3gjWCUIPM1p51RyuAihwCtq4H5FL/j0cUlSmxPmFsqAjhRkQs+acRRUrXKW6vxsISakJ2C1KPtLOAbScb+q/eyvouihcegzj4NuLZXFAbEBjiIjTIDGNVE2jB5A0pfkot2NCQ91uHPJ6iJ72Tx+7uItA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734215687; c=relaxed/simple;
	bh=eoKXfq6Hj5SW8j+wkA/iHI2/OaarWoeU1Zy5vKlID1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KPc+7WmW8Qz/FV7F2kpxkC+bPZZcnXZJ3v9qMt847GtuoxDLjf/5y2KoaWFiiAGl/+cG9antaZIjymrRmrvOz9ud2taOhefUeC2L9ewdSjP991SOXPhFsCv7+9KDD9O08ZaTy3x/BRkybmEcTxNp5Rl/Nkb92gwKP6rYdAVQOrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FGwVLHAx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BEMXEha005210
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 22:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zoT/6Ve4wQjNE7DzpC+6ucI6/tFmHxfuNE9Av90lsj4=; b=FGwVLHAxwHE79fiU
	fJiTlSRTOOwPetAh1rhqbQ48tydFNGPNY74nlVFhlrBtQPAMR8Ve4DscBZznadiT
	wlW/PdJXylbs1Q4w9h0eQYAMBXqCgm9aGCcukHH3AOfxGL6IF2q7VDCcQw72TZtr
	FNUIZc2WN/wXwRuJGvhxb4bT9J9bk3NNMCH5o8fMXjjXA7UIzF30vGxG1PTSsDaH
	lE80w5jryLvPeeoOp5fB4fDsEmHKLMWjN2ykYiEnB7033kKcenrZRZFsdttfndcM
	WRZcgKKr+AlPcndUrXcTgK9ugCyZpRMf2ltD26pNvcLDmPQGuZXT0BGrlbOY/25F
	nwk4KQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43h30ks3qq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 22:34:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4678aa83043so7659501cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 14:34:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734215684; x=1734820484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zoT/6Ve4wQjNE7DzpC+6ucI6/tFmHxfuNE9Av90lsj4=;
        b=hXG/lvpGQ2yzzs1uhP0DojDjfgHcjmYa5f3XGHDy/7pVn0KEep4IML3f/C9BNgje7/
         y/1gmIesWwqQUWPPHMYeeDQzbmTKmwne5n14oU7i1UkfoBqkvNywQzUJWZGVvytUmtym
         G1q4zKkPX9xSgswXCf66B8C8ClgRO0q5bVahhVHX/c1vSuTm6QH60B5xLOpB+2mSpr38
         /Ygr1fsIMASyfMIgtoHQ+bG4XUmx0f/zEUiFN9Snko10BGK8DLoq7L7LxIBnUW++DKnW
         L2L1kviPpOW4gQOEj1CUt8/P5PCdo6BVh61m4tKfKTkYYcyo59mH04mleV0UXHsFG53f
         +gPg==
X-Gm-Message-State: AOJu0YyVXXgMnRIDmqU+Qnl2ydIyVvifvobfjdGhhzeMnZ7qGP7uYxhA
	G0kjBPTVvL9qL9p4/JTEwN12sSBl1O9v0GptB+fu220ws/uHev8HpsGEAvP8ShkomSo5Mf8eRzL
	T/1rUJdMdWctrAmxlQ0KLWm0jRUMCU1E2xdX4/OfL/MeS3J6LyZkFaz/cFfJtBT1Y
X-Gm-Gg: ASbGncuGhVOXCkeBBbajq0nUg363cGPvLCZBA/ETdGhOE1tZGTHbqPC2XyaKdlOFJzn
	b1hM8J232h5njEyBnFYi6orZnRllP9zWx49fW9hk7hxx9/oPv/bYwQrKb3ltaehNjxZYxQ6qFAp
	PF2mB5He1oj8ROxH1tcRWKqOrKqfGfEgXtkFf9A7IW1Yf+yjKxEwua8mW12ib+EV3SxZuAFRlk2
	yALoqjPa/YxU8cdENw000Hy1Ae5pVAJrFuD86J6oQvW+wSdB6JeZE744XmMBVbelEXrlMoee91c
	4UCjBA1hLEQxGqCYeHEcSwoU0EWOGt2z/Ko=
X-Received: by 2002:a05:622a:606:b0:460:9026:6861 with SMTP id d75a77b69052e-467a578e2cemr51306821cf.9.1734215684488;
        Sat, 14 Dec 2024 14:34:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGQIFK1+HGT44yFDj67IL1tLQqfEsu3uldzYeFqe8AIQ8wuuDnknJYfqn8obcdvMjeSrZ+OA==
X-Received: by 2002:a05:622a:606:b0:460:9026:6861 with SMTP id d75a77b69052e-467a578e2cemr51306641cf.9.1734215684091;
        Sat, 14 Dec 2024 14:34:44 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ad17d7sm1396571a12.25.2024.12.14.14.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2024 14:34:43 -0800 (PST)
Message-ID: <cf9e3fcd-052c-4ccf-b3fe-a63a95bb2a2c@oss.qualcomm.com>
Date: Sat, 14 Dec 2024 23:34:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sa8775p-ride: Enable Display
 Port
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com,
        quic_vproddut@quicinc.com, quic_abhinavk@quicinc.com
References: <20241114095500.18616-1-quic_mukhopad@quicinc.com>
 <20241114095500.18616-3-quic_mukhopad@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241114095500.18616-3-quic_mukhopad@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TrnAxblM9CSAgG4sJU5DESEyb9CM5Apk
X-Proofpoint-ORIG-GUID: TrnAxblM9CSAgG4sJU5DESEyb9CM5Apk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 mlxlogscore=945
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412140186

On 14.11.2024 10:55 AM, Soutrik Mukhopadhyay wrote:
> Enable DPTX0 and DPTX1 along with their corresponding PHYs for
> sa8775p-ride platform.
> 
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

