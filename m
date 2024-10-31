Return-Path: <linux-arm-msm+bounces-36608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C56059B8439
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 21:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DF17B2274B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 20:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311351CB521;
	Thu, 31 Oct 2024 20:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MwpUnlik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA8C1A2562
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 20:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730405818; cv=none; b=k2RUoR47ZtTuYmAaX+q1cZ9nhvQ2MYyKGfrXzZziM3Ayav1zOku1FUdyebt0rJAjoEpxFdt2+jGcAdzZS6EPNRK5+4dffh4BdZssObZ54RkW5mVFTdG+JnaXmlHSu91yj0QNFftIb/68e26rM8aDHPLhXB0EAuikP/0dwL5Bg6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730405818; c=relaxed/simple;
	bh=aS28fB6UqgGm/4sUAt98ASNcFowCfddJK4hIlz47uOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J0J258uhCXlS9KSFQ/S9welgHviZzRYy/E7dcTHb6ZoR/T0tNIIc6ORB9OV8OBJqhT07ZXLP3g5d+mfW2TVIU5+GMuaTgTIGJDFg/dScCedJy+6bnVYw9YFgUslRq04a45yEzdE88B/mj4f1T69VQXgjWBNbJziJ5h5DS7ZhQ6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MwpUnlik; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VCX9Op002324
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 20:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ozwR/yWp/h6s0zOrE1a/DisJrfhCASdMf2SpTqS0ZTg=; b=MwpUnlikrR6e40WI
	1XYT+WiOLlj+t75UcW3oS/+LqmwxXcalUAg3qNg6N1eM1nW6ZB4PYz+I3eYawFlH
	qFeM1jSRxdX5IRpLM4wE7Dqp5f6owBsvhVbPWOnAutJH5cyZj/nlQQNVDPTA9Cez
	AR2xzqwtMrgl2QtSqIsfYO+J7m1v52hnVOwhFOx/AnpXwKBJ+SDTlenq1xsfB2nd
	x3fQzaFkvCKrmYFZ3i0UPdtQki0DBthk840pl8iDvOSKSsSLj2Qcen0uWYVJvQ3W
	Z3coMxc/wdx6RMSo5w86c+El6E1ALiZ25OOPSyjMjQnTI+kB4zGq5bIdcFyNreQH
	ToLwqw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kmn5csxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 20:16:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-460aca6d5e9so3344661cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 13:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730405814; x=1731010614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ozwR/yWp/h6s0zOrE1a/DisJrfhCASdMf2SpTqS0ZTg=;
        b=qcEV1gmWh+Y2YarFwBsI5y4ptDMQnglO2h7PHK9MJeeNFQBCeH3dZTqB7lHpJyNLus
         sUtx+L87CRLvuIw0tlTHaWJCfsej5YfTmj20GEbQbPFCIdID7yH3prXJUdZsOmMTldg9
         tb4QOKvatfGa8xaaqCA/EiVU/ppxWduyQOhno47dAVs1v54omzgADWFEuuoHcnzr2dnR
         SNMiyHTYAhDfcsgeY/86zcGnFnunVxBXo0bMnua4kV4nvmOpE7w+nFtMSpt507UHUJO/
         ar68pCQ3erFDmegGBFEAvLGi+A8AYC4Pg76KokPQ6lSNYRyNXzx70SY2EDRCZ4XC6Kk4
         iDhA==
X-Forwarded-Encrypted: i=1; AJvYcCUJDOmkIF/iEVIH33ThubNLSnc8sj7yVf9U/q4n6jd/n0jZg2LqBjaUhE8uL99SVllOd2rB6YkHoEQ+qLnS@vger.kernel.org
X-Gm-Message-State: AOJu0YxbSqFiW/NnSVzsr6hO21n+xJmIeabPJ8omJcxArhy6pSsB7vQH
	OoQ9hXKl2UEVYLzo0nHtfnICgEE5TC3No1GLshDuoNULHWPzvAaG2reynPiK21yAT6Tqzh5dtry
	s140UgU778D1LdUew6CRJhNxJOxBOL8yJh7Xtn+hYaXSZYHxw4mjIajcnBDP5AqNC
X-Received: by 2002:a05:622a:4c:b0:461:4467:14bb with SMTP id d75a77b69052e-46144672164mr133072921cf.2.1730405814533;
        Thu, 31 Oct 2024 13:16:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbr/d79LGu/Q7dBQ5alrYSE9+vcKF4974ZZJ7pzngcHbryus/lwYkyb4r9+yAYB5WTq7Xd7Q==
X-Received: by 2002:a05:622a:4c:b0:461:4467:14bb with SMTP id d75a77b69052e-46144672164mr133072631cf.2.1730405814188;
        Thu, 31 Oct 2024 13:16:54 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7e9e65sm853240a12.97.2024.10.31.13.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 13:16:53 -0700 (PDT)
Message-ID: <0097f45d-e4d9-48c1-9f52-a0ffe956946c@oss.qualcomm.com>
Date: Thu, 31 Oct 2024 21:16:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] soc: qcom: llcc: Add LLCC configuration for the
 QCS8300 platform
To: Jingyi Wang <quic_jingyw@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_tengfan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com,
        20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com,
        20241026-sar2130p-llcc-v3-0-2a58fa1b4d12@linaro.org
References: <20241031-qcs8300_llcc-v3-0-bb56952cb83b@quicinc.com>
 <20241031-qcs8300_llcc-v3-2-bb56952cb83b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241031-qcs8300_llcc-v3-2-bb56952cb83b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CIBCU-INB_A04PWiWe3-67_qOeaSxbZ4
X-Proofpoint-GUID: CIBCU-INB_A04PWiWe3-67_qOeaSxbZ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 mlxlogscore=747
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410310153

On 31.10.2024 8:14 AM, Jingyi Wang wrote:
> Add LLCC configuration for the QCS8300 platform. There is an errata on
> LB_CNT information on QCS8300 platform, hardcode num_banks to get the
> correct value.
> 
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

