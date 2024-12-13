Return-Path: <linux-arm-msm+bounces-42074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFFB9F1078
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 16:11:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57F94281393
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 15:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38CE51E2615;
	Fri, 13 Dec 2024 15:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mK8J6k93"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D321E105B
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 15:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734102657; cv=none; b=jX+Mx/dBg/00QCu8dcJ1SITyQy8xffMtwxlN3Bl1/Q7fy1jNd3By+e8WebEvLBP3RSAD9ty+MZNYEks94DSAkcZ9fct5XklTJLS7E8/cp9+f9b58hDyM9nyLZq8XC/S1XPSf77YsYU2nx39GjME736cHQaKdYM4XxMnu0ItDRYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734102657; c=relaxed/simple;
	bh=pZkTUNEPfwYzY6QCzWwAaHbPeARAbCFotlemTTF01C8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dqxovLBbKDY4Sz6ekU3R+p3xSj5/3guHSMY3eY+RZO9X4JwUI1Tp9G5GvWRjKPNxFKrHqqiVxyV1xNX+AGxoW71vffhQ7NhNlDK9sK9k+a7gSqch+gB8FMgGJWNW15iAJEIrcvTWEKBX1XFF9kR3sWrCgqMcdgEx27UgEGoKMlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mK8J6k93; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD8rNJE022799
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 15:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LMIc4H61MSX6NhiZyaW7yQQ8yYjrJ8QN6wNQuoNHEE0=; b=mK8J6k93itNSQHVL
	3K2T9rLsizlfRH70pfIh13QxdWITiqOKxT9q6VaMTeU6Ek2qbGChXYlLlgS0K+GQ
	MBsz6hxU2GRFXe080hRCYhHuY/ja5INxatSXQWiOYSkSvXMIg2eeDqUIJ+jyeCVg
	W2OktgAHNaMPkt7haa2AWqZAyvOgLQ0iqCdDOcWwIE9mTKTWdee/A73uZHv+M1lr
	SaaWjleMW6osd4hMaIEZRknj2Sxb2dqVDpoH4mdTx9ITM+08BQ6Cg7YmTaF1eh8N
	yD1sGzaX6GMAbk76eYtOC2ZmHOPhGrSC6T4KS7BbhIDkApo2ZwLaUP0s1GqvBJiZ
	A5vuwg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43g4wnav05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 15:10:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d880eea0a1so5154146d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 07:10:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734102653; x=1734707453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LMIc4H61MSX6NhiZyaW7yQQ8yYjrJ8QN6wNQuoNHEE0=;
        b=L0cgqcrRcSU7ANBMIBvkiMk3Gwiv0kz5oD2HRgkvdl+RM/Us+ikaGwQVdnV0NyrYLv
         Oz4k2q+49Xt17uiUCYyNCu4PO0Qksze2g+BxAzWDY6pZQEtFHebHabXcN/zYJIcHK5ZZ
         WDHZnRbaWhjObQ+5+3jOJUN4n0CMojuTdkZX9qbendQahdcppopCPjCDksiBgYWsnfYh
         dY8oUwqTogfNsIE4j/+XGt9rHVoHBs2/4wTYqqfFXrwB7BYiX1Gn4nyj2H+PJZFcKS+8
         L9YVCXrchB0T5S5COvX5r9kTX7vqvpEvrJ/wr3ly67OYBkq/fCZRviWuXuOsMS9h2a0Y
         VmDQ==
X-Gm-Message-State: AOJu0Yx6pcEQhikBJo/yMgwIHF0u/sCzeoEP89oFIU3S0ifsPC4Rpd/M
	4AY/DXx5BVfRXwhngc9o1NJ4kaYLYxLbrQ0DP2B/AY+ue4nJ7vH9pWM/Gwf5GPMVJPvC2BXhfpr
	KraG6NnVYB897QsQsdj/Ss87laUsHWw/KoNMsx1HrF+8BeNSkJ07h7K6j4+VIOnPYOJu8Ws5A
X-Gm-Gg: ASbGncuJhzjf10drNw1wbKCDOmlEz0TCUoqmaL/30l7SEs6vfZUOs1B4s6nO6yQHzRY
	GTlmIaAwuJOj4LkigYZgnPJ846zbmPmXErr960xW3w6lffxwK6/5APVvAfgJOw8OU+t3e8cCylZ
	ChiLjQzZfeWvkF8T6jT9GoezhtiuXTfX8upEvPQ+nOcCINPmGC7WkW03kmxdZpxhCKF9GRcl57s
	fUgGry60vW6HwjI2OlZFvHYX7rz1Yadzzzve2922A/N2tGZzLFxWWhfB9AcolFxFU9vceFTPhgM
	w8ipo+kMCY3U2X/G4psY+VmlhifyUqiKM4jv
X-Received: by 2002:a05:620a:4609:b0:7b6:ce8b:6858 with SMTP id af79cd13be357-7b6fbf3267fmr153298085a.11.1734102653254;
        Fri, 13 Dec 2024 07:10:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXTG+90+T6m0TzrCRgHC+VZFlf1IXbKAxpR0NrkdAYlucCrf2kmttpqZI7dcBXlrZ51YZyFg==
X-Received: by 2002:a05:620a:4609:b0:7b6:ce8b:6858 with SMTP id af79cd13be357-7b6fbf3267fmr153296485a.11.1734102652746;
        Fri, 13 Dec 2024 07:10:52 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa683a0a736sm746086866b.142.2024.12.13.07.10.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 07:10:52 -0800 (PST)
Message-ID: <a31a60b2-429c-47f6-af8a-57f14163a4ab@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 16:10:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 3/4] arm64: dts: qcom: qcs615: Add gpu and gmu
 nodes
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20241213-qcs615-gpu-dt-v2-0-47f3b312b178@quicinc.com>
 <20241213-qcs615-gpu-dt-v2-3-47f3b312b178@quicinc.com>
 <a41eb4ab-2045-49b3-b571-b49eb5a05057@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a41eb4ab-2045-49b3-b571-b49eb5a05057@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: B9q6xX-M2ePW9cdzMeDHSavM7D6ijZsp
X-Proofpoint-GUID: B9q6xX-M2ePW9cdzMeDHSavM7D6ijZsp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=641 spamscore=0
 mlxscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412130107

On 13.12.2024 4:09 PM, Konrad Dybcio wrote:
> On 13.12.2024 12:31 PM, Akhil P Oommen wrote:
>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>
>> Add gpu and gmu nodes for qcs615 chipset.
>>
>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Well I forgot I made comments on the non-resend version

https://lore.kernel.org/linux-arm-msm/a44027ee-40d3-4552-8f61-bcab77476f68@oss.qualcomm.com/

Konrad

