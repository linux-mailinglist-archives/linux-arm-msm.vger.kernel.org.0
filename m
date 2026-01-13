Return-Path: <linux-arm-msm+bounces-88718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F53D1794F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:23:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8E8CA30411A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4520938947E;
	Tue, 13 Jan 2026 09:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TAhxW2FU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mtv/wUn0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6FE389E03
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295782; cv=none; b=mWdSyOvBq21b461n081mto8yGcwFMORx8h+JrtCkC6oI7c7Lk5b8QbbyGBKXlWb3Qyz0hh6zC3fL47q8fjVEzaKy5adp8Jg29mpxdvzc3uHi81Djp8acLn91GufPeUGEw/xSy5zW4/658xH55t9xLD99PG70WcplUqif25Viqps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295782; c=relaxed/simple;
	bh=feyWm2Mb8bggzWn8E1h3bwqLe2hk2xe13E1QXg12S/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IWVX1w0NnBOwUm0Q9vImdrUudHjwcIwzq0Z3ewRB7U8HZZr1anjZi9OmEjCNnNwRKBSGB2uJr+7KxZYifX8Xl1+zCUrx7MQuzo8PWJz9YfOMk9k+UXr03NNOSapGUZ4YbGRNF6IOkqVhMF/WCDD+qpP0KNA4DH6Dy83PDHFcFUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TAhxW2FU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mtv/wUn0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5SncR3868705
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QHVA9cpe/WzwiNxPhlR074r+xhCiARVtlgldEvRztgY=; b=TAhxW2FU8kLCBN/E
	mchTTZDaPPE7FVN8CAv5aqUz9BmwM2ZyTQRpcM0061t+t9y+Bkmp5KdzymLyGKth
	OdpyRmeYDX3pQ9kEa51HH4ryHNbJWXPDmOInngUO20yoaxUIoY3Ptd8shhy0c+ru
	ckYxcjt9R+4yMQl6imc7TqMs0GlOVS0GhGxOCEXlTz2bFaKWhxOydA/cXfI9Cpbw
	xdHkfxNVYEhUD/MOoFmeITi8elKlj/QanVOhFxaYLTXRdjgRISMsZaeLw72TLD3M
	9aqB0oZMbooQ4NKC2Ic+bocFyCNW3kRbaixefabdLeCZwBSItEYPZ0Wk0M2SbsKs
	9cv/vw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfxk8mmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:16:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a262380deso16241306d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768295772; x=1768900572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QHVA9cpe/WzwiNxPhlR074r+xhCiARVtlgldEvRztgY=;
        b=Mtv/wUn0AK3m4Y1Y4vrevW41Kk2FWHlJ4583yUZxF5FRA/hedMb0bmXPB5jeNcxgVA
         K0N5PIWBRXXg9J0T32iQAmBY9zPGCFp7j1WHbSRmBfojc//6ZDUEAcvjukTAzb+OiRvA
         s9ZjnqFG7EcfSNt2eSrK1DJ9EhV2D/lkqklqce8kBTnoCSrzVrsx8ituwpOcB8LNS/iQ
         Yn9EzDpGsMpIk7usvckWGYE3z05mA191RkOpzAJwO7oiJFzz7ueB3fwIhKevw0M95cTc
         0AY26ldbOoRR7JYjsapykvFM3Fmy0MtdOK75ohkv8vOWMczbRU7L63gfxo0qGI5yO3hm
         KS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768295772; x=1768900572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QHVA9cpe/WzwiNxPhlR074r+xhCiARVtlgldEvRztgY=;
        b=MMqzv32/Gf9jwD82S/doZZv4rEMWEtT7vW3TbARegI8w0jqCl46l8mdQt9AcT5Y0PT
         UXo3tokd3xZadBXyzlnHlTl9UzpdPPs8dC3+UeZ3HiTiLF2LA7Nt/hlnxWteTfgYG+e1
         HcU5ra/sUCJmjl2Jh6g1YdwYMe++WagHI5kBgn4xwWehVxhke4ZIPOgYysyHKM40dlny
         7vEd25Ic87CHqqVbGFN/Ph0Yv3KPzqSEEaDoNx+HhdUdMuLMFAK98Y/xUlXEgdnVsELF
         FPnr4z+tCqluBgUjJIGXutFx4wMCDPIkfVlVQdRFHdBdA63uhW/JYnLutOx+EMWWhl36
         AAug==
X-Forwarded-Encrypted: i=1; AJvYcCWN7SwpUg5rL9JtrjGSbXyYr8s09kS8MOyEkDwHoowtUm45fiYptOXqU9opAKNppU3ifh5kmrJCgjWodSe/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3AAzYUf0lOs/KHzLpapN0tJrSZOmD3DgeeYPZLYI6vQTsk7oH
	mmYe0ZhGK04DP7wb5SH08yPbQGah2hm63NvWrth+KMHUEOA/7v2xCNyQ33rq1Dj5i2ucQoaMFM7
	U9o+j06shdo7p4p/ndaA3oDsfAYJiXr5CQ4nAAUe68w0QiO1D0XxU5bNQR10wZqPOsKVctD0wn7
	DM
X-Gm-Gg: AY/fxX41WY+qATQIqFniZnG0/HV94Un2+RRzjVTY8YTs/gq2OFASMl2DxnPztUJn5n4
	XKwAWnQM42UEKf4+f/mzkh/9PpQ1Tha+1UVVqlC3bPx0FziWonXlU2t8Si67QOUea2/4eynQa+7
	D2i+7tj1TB7JCxWhuM+pUvP6TPr5slOGaqPvJNTdYWcZqWwVcTDScoG+JXJ204rGx8m0qiw4WAk
	rL5UBs0PuJH+7Dhraved3B6zUjoBEKqaA5P4kVKjN+Jkca69xWGZIYBCAI+laE/jz6KcsTAg/p8
	ofbGAfgFIiEMIsk+ay+/wImK4y6ai45RxPwyCag169YBiJo3eu+JlxNE8PPYQUqgigdn/GDlXMv
	HcHTxGA6Zb1JzQZV2SIDcHBC0PUwVyamQUMkXnQVm1Ah4mjeeVYHG8B5gsaWnpqSrh2A=
X-Received: by 2002:a05:620a:1904:b0:8b2:fe27:d2ff with SMTP id af79cd13be357-8c3893f8db6mr2027434985a.8.1768295772412;
        Tue, 13 Jan 2026 01:16:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEw+585N4c6aPZW7SqtnL9QzcQpGl6ytB1mSY5dyyJQ2dLHnlHRFCzCA4kZT5S9sxgE/4KRmQ==
X-Received: by 2002:a05:620a:1904:b0:8b2:fe27:d2ff with SMTP id af79cd13be357-8c3893f8db6mr2027433385a.8.1768295771979;
        Tue, 13 Jan 2026 01:16:11 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be64efasm19038208a12.21.2026.01.13.01.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 01:16:11 -0800 (PST)
Message-ID: <433fc01b-0e59-49bf-afdc-a23e815cc563@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 10:16:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Enable download mode register
 write
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260112151725.2308971-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260112151725.2308971-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yHulYe4F6O6U7nlv7AipGMwxvV6DsL0Q
X-Proofpoint-GUID: yHulYe4F6O6U7nlv7AipGMwxvV6DsL0Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3NyBTYWx0ZWRfX9B46piWw4zV4
 O8KrltGbaguCWAHRAVMSUCSfdtzRCfSw/sOZVyNXi6PNigQmQRkyjExIux3bOKf7QVhnALGGlEu
 y9UoiTc7koEwrIE79f5ZRn8xhPptq3n+syXP2uaRj5Vt4SP94vuHtkrbcdAYIrHF+3zc8+UEl+6
 0XuqGW1lcRHbgKVB4JvCVxAfppUxsm3Vt+jz7DNuR3PGnPei/2t2DabxhDTKEZSI3MFjwlLsaNj
 qJbgdZ3iwOF+pL8kyLLvs1jze0pLBu19YwePnZLnXGyJh30d8XQP4idxTLuoqqTlf8hTpSNLe+u
 pZKY/PBkEI83zsPHIM6LTVVdn92UoIYqPVs+AV8i8FiMvpRyfyoxoZkJJRD7EJUOnu0z/PCY/VZ
 TCjp5njviJTwgcbTlwi8Th1lroyf0bO8489tvfXs1Z3Pj6E1pV+SJfDWMkDK/zbJWhd8rOXILaR
 VLd3plN6iAMdgnYrW7w==
X-Authority-Analysis: v=2.4 cv=PvSergM3 c=1 sm=1 tr=0 ts=69660d5d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1x7xYhVcW7TDj72elYYA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130077

On 1/12/26 4:17 PM, Mukesh Ojha wrote:
> Enable download mode setting for sm8750 which can help collect
> ramdump for this SoC.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


