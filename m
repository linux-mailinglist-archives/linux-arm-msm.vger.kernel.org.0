Return-Path: <linux-arm-msm+bounces-37379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 518899C2B99
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Nov 2024 11:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83B8A1C20A5F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Nov 2024 10:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E01314D456;
	Sat,  9 Nov 2024 10:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RvGb50uL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A4714BF8F
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Nov 2024 10:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731147500; cv=none; b=AAlYb3V7EK3bbi1qK6BXY6LO6yPRXDfKFjwmF+F+afeoD458LWZ6ttw4wZmYUuh/0Z1SpARzni9dBkl6ZMsxine7kJ7XkQqjxVftWcjP1hZPHjS+43XCCKB/9ObZzVUgZrlq8J8YpNk5AK5zGouK2X8HvJDaKZJ8UFWzBU8tEnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731147500; c=relaxed/simple;
	bh=A2UIlVl5cSXcYTWIFGWfguHOReior8kvSoiqiufEWBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lMVLke0qGZNcHw5uxDzLPkejMutQJk8PG4pCO0unsybDZf0xo+4lKx0FHUwrwfDQxr1tBTT8/KeEZ6bHGyydm9Q6jKiomCVSYWgeJeyF3Lz0T4/UQt1tZn/mJejyGlYNjVHcIcWHtarfYNE+YoRgCMOHF8KlD7I5e5ALNqBQqOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RvGb50uL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A98nlxJ000742
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Nov 2024 10:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JT4BN24Ixkyc47hBesIlQiTdu3kFP0r0gOnbllgnKUk=; b=RvGb50uL1f4A8T8h
	ZbFsZiAU4lEB+Y3tEHvVKmKibCua6Q6fPHqpedkcORHdoLq+TFCXL0Wif6o8lsHC
	viQengizNET1tPeh77a+18mxx2ykVIzWXmzKMHy9tQw+UkGcBEMMW1QFrCAwwxxE
	VcaDoCcCd8zmTtFc/tUEsQnUBiG1mIB6X9ReBHyHqSLM+/CvOv8OxcT6EbPeR2U7
	3SxNSy+WRrHWUfin84NQa8TynQ6+cM2s132sn8j99MXjqwHk8jg3y+eTyZN7KePp
	Z4BA4BLHVJd/xYtTcG7uD6UJwC4sItmXMGlv8OtKqMYW0QLwnEzYxw//ziHFQQr4
	bhRxNA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t0460e6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Nov 2024 10:18:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-462c15afdb6so7346831cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Nov 2024 02:18:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731147497; x=1731752297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JT4BN24Ixkyc47hBesIlQiTdu3kFP0r0gOnbllgnKUk=;
        b=lJNSCRucMCFssaW3sqmlo36ixohc0iXpbSB3Le5IHTFHETMz7KAwQNSHRwJFeDnB6Y
         NjwJMIsnFx1nPZnEYqWdj3da+SICMXpN1qfOlh6bUwrE0EOozoc9IWwdF+hS7u1UzYU2
         2/nvDRWHSUocmP7QI+UEHgcS9FdFXSExW0EQ5ozlu7bRSsJhpxNmC/Lv+t/dOicJdF5E
         m9/nNavt3+8oGvG6nP8qiaav3syv8PzXtfIFVr2H1vLFH40DtRr3X6KMad5N3PzxOF2r
         Szqr4srDKvYXJCDN7K7Y+A6IbjJxDPYhAxhm8hirAHXNniGCWZ5QTbA1uFkhhB7LJHHj
         ndxg==
X-Forwarded-Encrypted: i=1; AJvYcCUxpSo3m70I/XhfyldyfZKI74NMyHHoYMaFayOoXe42FsCEiFTzqmTQA7aDRy6f+WeK1p61Ru44q1H5s3oJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl09c2q2CGnTQi402dFE2qLPjbZ7VU6/iLC5lbo8Vj/dGIVy2X
	mYx646LZbBvFzjP0nvr1HrSAy0XUbLBnq/v8Y8j//wZhlEq3vagxFCvagitVclUq5anXx2kjBvn
	8lOOk3gsjJv/cb2FOfRtHmhTm/BhHeiFOF/rmJmDPtsKZAWHQIa0KrWOzGW0O2MOG
X-Received: by 2002:a05:620a:1923:b0:7b1:3754:7d71 with SMTP id af79cd13be357-7b331dc6962mr392817785a.4.1731147496774;
        Sat, 09 Nov 2024 02:18:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtMiooekYJQdbVcnwzDrnldbW8EofFp+e7TKCKmt0jEjK9VqPir3SyOs6OLlGgvMf/sHVRLg==
X-Received: by 2002:a05:620a:1923:b0:7b1:3754:7d71 with SMTP id af79cd13be357-7b331dc6962mr392816085a.4.1731147496390;
        Sat, 09 Nov 2024 02:18:16 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee06b9d62sm343714066b.0.2024.11.09.02.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Nov 2024 02:18:15 -0800 (PST)
Message-ID: <720286f3-8d92-45e0-822b-c4c5c40e7337@oss.qualcomm.com>
Date: Sat, 9 Nov 2024 11:18:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/7] Add TSENS support for IPQ5332, IPQ5424
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        srinivas.kandagatla@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, amitk@kernel.org, thara.gopinath@gmail.com,
        rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20241107140550.3260859-1-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241107140550.3260859-1-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OhRxueZhwKTrcZoHSvS0A_ZhEpHeNTHu
X-Proofpoint-ORIG-GUID: OhRxueZhwKTrcZoHSvS0A_ZhEpHeNTHu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 mlxlogscore=440 impostorscore=0 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411090087

On 7.11.2024 3:05 PM, Manikanta Mylavarapu wrote:
> IPQ5332 uses tsens v2.3.3 IP with combined interrupt for
> upper/lower and critical. IPQ5332 does not have RPM and
> kernel has to take care of TSENS enablement and calibration.
> 
> IPQ5424 also uses same tsens v2.3.3 IP and it's similar to IPQ5332
> (no RPM) hence add IPQ5424 support in this series itself.
> 
> This patch series adds the temperature sensor enablement,
> calibration support for IPQ5332 and IPQ5424.
> 
> Depends On:
> https://lore.kernel.org/linux-arm-msm/20241028060506.246606-1-quic_srichara@quicinc.com/
> 
> Changes in V7:
> 	- Fixed all review comments from Dmitry Baryshkov, Konrad Dybico
> 	- Detailed change logs are added to the respective patches

Please see the responses I made on that thread

Konrad

