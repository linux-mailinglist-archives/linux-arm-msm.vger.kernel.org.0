Return-Path: <linux-arm-msm+bounces-82907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8F5C7B8DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 20:37:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 57AB134AA79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 19:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8532848AA;
	Fri, 21 Nov 2025 19:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJ7gDnR6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R0InVN9r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8E921578D
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 19:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763753777; cv=none; b=U+CbzNN0JK+t8FpBdvI2cGr+O0sR7y4UDFUOxNmHRz9i1Gmui8Py2VKuFsYE/rV9VeQDQU1s2/QT3F5MIHQUvcVthBeGQsEOTEdm/rzkUAidwdZQFVxfNP29djXXuLSRZGnvWf87ppXcbbm5SQJTWtiTbnbLBK9pWbiVcB/wavw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763753777; c=relaxed/simple;
	bh=2xuEeshDfl1aqpeleX+/fubhWKEMp3gVPqj3pp0eNJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pgpq6Dqh4c16ri16o7Xg4lXSwYrlXgxGIT09ycRAzuqmOGxb1J4Kr1SSGBCN/LIytmdfMWyqtL6xRY5eOOpBtpGv+ttpcDDt5BCdfW134MxJ/w1WwL/3HyKY+qN10lHHHrEhXCvlCezem6CfKEquX82KKYrVZDEcToqSi8cZstg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJ7gDnR6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R0InVN9r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALGABb53676619
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 19:36:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U4j4VCK2QqyHT79LVfe8KvggkJDSXm2aOliDmNkugfU=; b=FJ7gDnR68uMEAyJz
	nSmtdm/8fFl8SQCkfhws3tHJom8LegtPc9xUeg0HXY/Ym9jxeBxuYDhnQNsNjJQp
	F6kgjqThSQw4xIWL3X3uFN0pf+9w+feV869TPxUVrgj+WrY52EpSYzT4YkuKbRU8
	juRQzVr9jKcGjnWMlY6v2ps7QAe3dSXd3LYGqbvgps91uckgtQMZ4YcsdhrafVBL
	+hdfXeoif0GRvOKmuA9UVE/ynjXyKVrJxKCPsQK3grhm08hzRGyMd+lvVdiIiapJ
	GC76S/qGACUJY+bR5U3umLVbkvhIqNjN1uggcfiguO3fPBrbPl3WXCQROQzkUD5y
	1qFKBA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajmyja240-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 19:36:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee05927183so5737761cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763753773; x=1764358573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U4j4VCK2QqyHT79LVfe8KvggkJDSXm2aOliDmNkugfU=;
        b=R0InVN9rHVv5xJ3ooGcBdSoeN8LzfVrg+bCOaD8u32/OPjChWkPMd8E2Qm0C1qpyUq
         d20R3y5flioZalVITzFI5eBcG8V1BvJ5G0/6bSONMz2MjEkXkUgsBpm0x5pEWhC7itQA
         +P7b3iyjo/gmjQzo8oWJTiZKbJaXU/LjN0HcIVUBkpQTF/H9+abasDd9rOTDbVkvOwq6
         EcC4Fc2vxYBjVs48Xm7ELCK17muvnfv8i4sSuMX3PN8kTQWv6j4gFz1Sq8nWFgFEVsMF
         VFVV30Gqoi4PWpD8RPtnpmyJodYY+b0g9M/hbHggtiIFUp2wNUr79X7j9vHzADtvNG+d
         49yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763753773; x=1764358573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4j4VCK2QqyHT79LVfe8KvggkJDSXm2aOliDmNkugfU=;
        b=ZbKu0hz/C4eHiPxD89jKgqYCidZxcXLP3/wDdxqAmKpu3RhIHtiW6IO8pYxrQA3+et
         BJLsyAy3Pv0UT2z/4sI47zJh1ttFBjy38PqZtt03YQAfeQDnzi/8PRiqtMdmQI80G8g9
         7DOPo3CJ1m7/MTWaJzGLS+H+o3j3tHpK0J1RCOTdjTmwk4LDwOotUPKWB4dWQJEVMGp8
         E4vUbp/04WSV8MPi7dGwI6A66D98mHj/jXDZwngMgH3609VN3ZZWkp6040KzKgSmisOX
         z+CHCedjQDwHoVTtiwo3BtNvO29QOxK8NzRkauaiFOlQkq7tDRLG9+IlmgE6X8ZgYV00
         MJjA==
X-Gm-Message-State: AOJu0YxHq9mp39RXsdnMxpE/Tfb8WKZ9FzwmNGxrzEJFsZpNjhaRXJYF
	lBStwdST8JcNynsWqUue5IL1NR3nydqAZditSMBSw5xBSXgCO1sa6DJ8Kj0uaBZSpb+3irooliR
	ZXuKWzxJJoHm2Y/imOTDUAdGdX0quXE7mDA635RzdC1VoqDeymgOcUH9KqXPTKfXc8Qve
X-Gm-Gg: ASbGnctzq68lSkBKnghIBTedMmmTejfdOFKzgvrk1GfNbldcYR9B3CyZIBUDBA3FL5I
	AyH/xHYCgHbSV6QOKEBmm0PcwGPAnv4PNH25/tTMhRQbkgFVuzFpMb2ZpVgrmsS0KXn8zIJKJRx
	ZAoYYJdiQLBRZ94uFW4KBr9R9yEiYe6I1vxlsPD0on+vlLHD6H0JjhFFK1I00D5P1m0NDWB/qEc
	eeVQ+zAHTg+fCsNOdretwU/oALR+NrH1c48N/qLg8EwSIRncwz4CqealjOuLAMjt3vczLvVKj43
	1hSlK/T4VH2prKM+6CRpIqzy8WNJCUt+NAwetW/uXQnlzC405voacFIuDLOi840f5JbUQKOJ0CO
	Jx5twrPXkhCETn1MPXAuxhPMaENQClXpqaSZZLaI1jSb+taLrFSFZsoENxLtJHNkHCpY=
X-Received: by 2002:ac8:7e86:0:b0:4ec:eec8:e9cb with SMTP id d75a77b69052e-4ee5b7cd506mr25736361cf.7.1763753773446;
        Fri, 21 Nov 2025 11:36:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEY9s0z1teqxiBYPmhtD0WstyGisah3KpFja2LwxDn3PAOwAI9PpAIasklAbMLiLD3zuXJGRA==
X-Received: by 2002:ac8:7e86:0:b0:4ec:eec8:e9cb with SMTP id d75a77b69052e-4ee5b7cd506mr25736041cf.7.1763753773065;
        Fri, 21 Nov 2025 11:36:13 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d73e6csm537409066b.25.2025.11.21.11.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 11:36:11 -0800 (PST)
Message-ID: <68224fc4-9d91-4e6a-9fbd-b3aabe0f23c1@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 20:36:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/msm/a2xx: enable Adreno A225 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=6920bf2e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=lhKUE6b7AAAA:20 a=EUspDBNiAAAA:8
 a=bjsXyR8rEHG-ykOKZpAA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE0OSBTYWx0ZWRfX0ypcZ9DCtugE
 qhAmN2flAJFzMa+j2W6+apn+Sja7fbZAOyge7Q1eo4xwe8enHqArkELXDnXJ4xOPO7wPxu+6u9L
 yeRdHvIl4YPUSlfOYX+ujmcJdOVNTu0kLi+o76qdcuv1Y4SpfsKHyeFFPSaFAmN3FjClLOOCASZ
 kE122Mg/t+HsbqofAaGxpqt8WrKlCy7ncOO154uyq6khLsnEED5mf43RXGHeNatlutmtRJzUaqa
 0umEx5KF1asfufAuedY1xdc+SRxk/HnNfJFolLivxKTdGMySDTzFYXB1B14xpTcePaYKLl3FnB9
 QzEAvBHWejYAl1PX7UBvwnHL+QUNT27W+cD56C8b6SePKgWEc531PPdt1y8NoN3HHkQYkLl3UF6
 r9gqIpESlOjv9rf/k/Hr3R2BM6B66Q==
X-Proofpoint-GUID: PTwq4KKiAVMemL1B6Rn4c413nH5rByHV
X-Proofpoint-ORIG-GUID: PTwq4KKiAVMemL1B6Rn4c413nH5rByHV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210149

On 11/21/25 5:13 PM, Dmitry Baryshkov wrote:
> Add two remaining bits necessary to enable Adreno A225 support.
> Note, this wasn't tested on the actual hardware and is purely based on
> the old KGSL driver from msm-3.0. For example, running on MSM8960 might
> require adjusting PM_OVERRIDE[12] registers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (2):
>       drm/msm/a2xx: fix pixel shader start on A225
>       drm/msm/a2xx: add A225 entry to catalog

Not sure that's enough, a2xx_drawctxt_draw_workaround looks scary

https://github.com/AdrianDC/android_kernel_sony_msm8960t/blob/lineage-18.1/drivers/gpu/msm/adreno_a2xx.c

Konrad

