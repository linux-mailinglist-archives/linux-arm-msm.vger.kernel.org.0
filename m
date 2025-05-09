Return-Path: <linux-arm-msm+bounces-57431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 352FFAB136F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 14:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 299F517A9F2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 12:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BDC928E561;
	Fri,  9 May 2025 12:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TD0l2v+h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BF2219319
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 12:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793911; cv=none; b=npyQBHxgOIzYgT6F5GcgkFWKT7ZhUnQod38pU9PikSI4CuG+RHw4kNE/hRBnPejL8Ko/10BPTkxgiXThHtpk97pntk+TPV51A9lRjT3ObYYNan+EfTSF6sKMQwlbtkW13vSSYKw4Rz4b33f9spfpyIYtJtYnNKNtDJjeAW+ceGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793911; c=relaxed/simple;
	bh=NGYvgxpdJayVvCDzXfX8HEx0HoGX4wz+UZYjkP/kR4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HiVY2Sq7a+OZfCSupF7NOUEbwyO+umfKj9vRrSwMM9Qtxz+/q8pEkqWlFGlZqND4pRoRSfS/3NqGX+CvHkEnat5CwmEyt7I1YrecQ2o/DjLTYcbUYXLCiwekXAGOrjr56XRx9s1YPG14VkCpGIJZcR8HmtbQCPlA2zN9Yw8d8dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TD0l2v+h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549C24aI016832
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 12:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EbH4xkJ037sHmWJTr5Z6OLwNV9LiRqfb5T0r82ilyRo=; b=TD0l2v+hKdxbfgVb
	/RivV6WcujA3/LpI/T7ypy1YKytqRt6KRVq91exRPZb9sOjot68avQj+C/akVD97
	uenXZvm+8eiehYGhK7YvMmKup1HZokDrZBUNlLIRyXJ/g8IZndTfsKkZfMitrvp6
	5I3luqaXB+BAyWydhTVZhwHlUfNysY281JQHmTP4jWCaWEafW/+tWJPB7l8kF/0f
	WeFE+zM23dpTujtVKqSI8wA0PT8y4+a9mo4YcGfqfLS59ETmiHDFggq7ObqkcMHT
	2vgH1Ke09XA30aMtDDH3o7I+3H1MqjYPNqNrCelpR/Zsw+nFTA7X51y6NF/Tfg9P
	gGMjjA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp8vkw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 12:31:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4775bdbcdc3so5702491cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 05:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746793898; x=1747398698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EbH4xkJ037sHmWJTr5Z6OLwNV9LiRqfb5T0r82ilyRo=;
        b=rcqfGhRH/Bt3e1M1oe3byIMgOLITUjqkDO7qNkX9Z6GfruQsKL+UWvMOtWO4OzKpIQ
         0vQpdkEjBee91bJzy/iCUfQ5zk1efs4S+rIpnOvfXebIPxLmZUDuRsqJvYHGD2e7X8ec
         ZmxiBzwixG0c/JRPIhZF8xIiSvFEsnmIUuEqjstD7ZZbdgJvTFs3Xema/neQ9UL0vI8x
         XpXMxgKbcpwcOH5IJQWy2ilbGjrT1lTHVUvYf1FAINqC2Jgmpi79rJfG2KOQEFYXLixP
         VXlNzw2Pg8BXnRBvzY3bMtsk6xV2s/t/DPyQ/LcFAwCDSE0iVcl8Vz7Pn8PcHdIHlxvG
         ZfQA==
X-Forwarded-Encrypted: i=1; AJvYcCXe1WmtNCVmIB8WRLHISwGJXMHN6KAOTfzDnc7Af9RclT4eKWwbdJh3n76dKAZKLD9rAidD0d4X/1MrX03m@vger.kernel.org
X-Gm-Message-State: AOJu0YwAY7bik38vGu1irRtejWhbn6VceVycokYxD2fWMnxo3ZV0Eooz
	zUMmBSIAzC/M33NMyVCmkDNCIJSfO6lcl71X0iVyy6VEYNi4CZ6WtmTMmtTGrM9gZKM0LrXPcTa
	mfn5l8GSp1dfDjvMC6vFiT4Lbx0U0g/5PJQt0Y+DKZ8/PfthM/rD9zXXoTGz9mmUO
X-Gm-Gg: ASbGncuoEjQkL1vZmx+rsehE6ckbCa15VZk0mmUvYs4WjrieCJH0NnQijV+CJqkPG0o
	tCdiumkkYIBdEahEMtkE6lFbdVFDnErHkjUwiR6Bjc1QjhZ0W6G1/JukHH4yMP+qOHIo3VcgOCZ
	DhrCOQbpNcQlEBLcIgR4xVviUxpsbS9JJWT+ISc4fXYzvHbDKmksaOKg9ffPMOkrZpPXzi06J1g
	MO+B1MwKxkA4eevd08Qeb3vz+/7kP3c4zkq7SBdyF0ACkDlUZ/7lY/KWyfTVlNI3vqOHyWxPQ75
	2gkW+Ca1QuVYhz0X17WvZjZNK3zM356owBcVVZdQJS1kn5RY7oZigApmerZ1bMSzp40=
X-Received: by 2002:a05:622a:15d1:b0:47a:ecc3:296c with SMTP id d75a77b69052e-49452621f26mr19121111cf.0.1746793898383;
        Fri, 09 May 2025 05:31:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdKIea1lSY3D/Rfo8iAPuqf50b+VB1CNMxYngayS0dUO+pp0Ywod1/ouLGCtIY6ZrJN13yJQ==
X-Received: by 2002:a05:622a:15d1:b0:47a:ecc3:296c with SMTP id d75a77b69052e-49452621f26mr19120871cf.0.1746793897859;
        Fri, 09 May 2025 05:31:37 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21985b026sm142384566b.177.2025.05.09.05.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 05:31:37 -0700 (PDT)
Message-ID: <2cb9a1f1-7283-419c-937e-5eecbe65f982@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:31:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 05/14] drm/msm/a6xx: Resolve the meaning of AMSBC
To: Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-5-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7GrdS3m0fLcnOW+v-nkzRveXrzVw9PzSb01duYx1aifSQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7GrdS3m0fLcnOW+v-nkzRveXrzVw9PzSb01duYx1aifSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tHTSPSML_kl7rQXW2axExxSrMfpDrmQ8
X-Proofpoint-ORIG-GUID: tHTSPSML_kl7rQXW2axExxSrMfpDrmQ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMiBTYWx0ZWRfX4BQwmktAdCD0
 EZnaJSZwB77rQAQ315oPQKJNpVf6l5SlnydNavnCb9K4Ti/lha5ks5czMMaiODN2s+IG+D2qWPK
 jA0GX/PmuvQJB3ZXgKFM+3/SF0q+JvDbOhdlBNhDZ42kND9fcGaJrqSG+hxRnVX2oRRtpqDfr+O
 WMr3ICAvsuT0XediHDmnxzPYhJ0G1Hp78sLxk4sAARaqDZEW9alN1c+BCouYenfsjVvIItydSjO
 kBZZbkOKoJbx/lp84BS3SfUys9dkI1wAHwNYnF7kDcDttZ3Xr7hFqNsR6aGJD2YjMHjAlBujpbx
 /zvvFazYZNAByVNvUkk1+QmNNVv27teiyU+UeYQW8U9C9xkFLt0CAsyvr4SouzzsQR5XpYqdqQ9
 Fu9Xf/Ln3wcOFPQiEKV9Zd/RwdAD77ZOO3G2pluRrPE5XX1BR52jLlcO4j0aFS/ZAtyb+VwF
X-Authority-Analysis: v=2.4 cv=e/4GSbp/ c=1 sm=1 tr=0 ts=681df5b4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=RZUx41kZHZKgpNmG730A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=821 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090122

On 5/8/25 9:16 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:13 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The bit must be set to 1 if the UBWC encoder version is >= 3.0, drop it
>> as a separate field.
> 
> For these sorts of things, it's probably best to add a helper to the
> common ubwc config header. Other blocks also have bits for enabling
> AMSBC and similar things that also need to be set based on the UBWC
> version.

Good idea

Konrad

