Return-Path: <linux-arm-msm+bounces-66154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C586DB0E45F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 21:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 846251C27CDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 19:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559BD21FF3E;
	Tue, 22 Jul 2025 19:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hCA7xZXi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ED727F747
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 19:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753213675; cv=none; b=E2+Y02b8BfYZtj0z6mQiqlQoENLIKmMN7uZKDmgC6SCvvYcQJUWXB9RVc4C9DUPw9AfzNWom1IbxK9ULk+BUvZgx4pghANDzFCmSG6wLsSg1BUeX493F2CgVNRV66sVmTOueOWGDLOY1H/nQgWwq/QkxeT1b7KBGx4qvVrHRD44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753213675; c=relaxed/simple;
	bh=j8inDgZHgccbVD3/RyKwPXu6rETxgroGBtjf5kU4EOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MrQ19QJB2ThsDQQvKs0aRobe9OcS5WnO+/MOdPMUnppYXqO4s0r/v4Kf9toAhVi4yG0wIyp0YNNp8ZfnfWvNfptpIe9a85tZ5U3v3wB2uzVFNyRgZBOkEw88PpxxTE3fpGyHGL9OyBsrf0Tpv5QxRJPreDKwlpgXyU4jLO0FUkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hCA7xZXi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MJGnaZ005535
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 19:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EEzrFntqUpXwmzhEbd6zxsSsOyDtSlkzdmerHqu6YxE=; b=hCA7xZXiYFhwYDKW
	tpltNKSTlmbynKdXCm9Cms+9Wvjo3RSWdQb87B5oNmAVIdJa2k2TPl86UQyhNww7
	JKu66usKv+bpAcrQOi4rhN1xGsnNNV2YGg6PB5/kcs6dMEts5f5WUGIahGWD5b9h
	n9GGNqUT3L4O7wqXQuVszdzA8KwrnGsnNEf3tT5raA0oGqN892TwGQ6mNCD5MzwJ
	4egw2x2BrDZLxomnpL/rxrkjeiAOjn/c59mBVjc688algM4UcKsOiBlzeYyUDPIU
	2dZ9CQfKc60eMSrRxeQ5eCUbeSXe2H9G9GllYR7Yf9P0DVFbYC0U9wQYWCRStsnQ
	Cn57vg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qar0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 19:47:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-234b133b428so44928775ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 12:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753213671; x=1753818471;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EEzrFntqUpXwmzhEbd6zxsSsOyDtSlkzdmerHqu6YxE=;
        b=doNYEpUhCQU40N87/qxBk9t0Q9uYBZJa9Ja4VlW/3HSebA4P87oo/w6IpsA5GrTKWU
         XduMId8AQBjrLQJ8TybRw8Ph3MnHA2/oiuMPixG3Dt6OMKfBGbx4RiIrdFrYtLaCwDec
         iMgIF+pIvL36PWLCEAU88rbcJEc2VaGjyK5qee820WcJQH8ANKPTNixUTIQs0MZIMDhg
         L6QZMy9LdEkF2I9miDMLcWRmkP8gTFAyIYJOhpgRJiIulAnp/BH7F7FnRVMpj2bozYm8
         p3BlDV5/qdUZoyUN1gm/YP2hd/dY3MbAiclTv1P1c7USmwIBe8mGfxTRqBFZlDg3VW3J
         6Gcw==
X-Gm-Message-State: AOJu0Ywufy8zwl+UnBfj/IzFaQcLrAPNJNJo/hFQQzhMYhM8+PSSLM95
	/GAmG70Y1kegrtKn/9cIkhHiPbjcrTH7rMrVFzpA0OTyNEQBlCZqIEtxzt9nOrICn6m5ygsCgzM
	1DMP2dV+/fWJxwoy1zS0UwxbEWbjC2MjzUCNrNzVZFZ07GNYMbIkDXpPs8jZ2SKVoUj7I
X-Gm-Gg: ASbGncvYSfNi3PeqBMOZ3HA8LjBh8l4nFgi/1NAaBtlrDElwsYQREEDFHaXl3c3/yUB
	P2wC7ycljBSQQRMN8qnAENJiqlPtac188NoJpp1EFDDn6GZmJEZrCrFzhMMzoH7Y/4gVtODpYcO
	DvN00J9Xi2y+anqMenpyEgXPbZ6Sc3a5c6PRSr0xxtaLew7HpObpqrRQ85O2h/7yRehFRIb+fw4
	R5c1H2p3qdZ28+BC5+3vn4h2oFqCsqIyfipzajigijTJOoS01Q5+t7p3bHRkzBt5K4WtDty2wNe
	vGO05CY39MADp3Z6hpTHTEF9X4Mr9XnnikIXo3T3IfzP3jYtVegYBK/TIzhVrBI/
X-Received: by 2002:a17:902:ce8e:b0:23e:3164:2bef with SMTP id d9443c01a7336-23f98172240mr3021315ad.13.1753213671286;
        Tue, 22 Jul 2025 12:47:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFU1qOtwmPdcPsJGIhheRiktlJaDiPc1l+Av8pvaEKyMToOna2BedvGFYD8Q4SL4rfvukJv/Q==
X-Received: by 2002:a17:902:ce8e:b0:23e:3164:2bef with SMTP id d9443c01a7336-23f98172240mr3020925ad.13.1753213670851;
        Tue, 22 Jul 2025 12:47:50 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6cfbaesm82160665ad.151.2025.07.22.12.47.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 12:47:50 -0700 (PDT)
Message-ID: <4832a160-344a-4140-a115-d4742f95825b@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 01:17:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] drm/msm: a6xx: Refactor a6xx_sptprac_enable()
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-2-9347aa5bcbd6@oss.qualcomm.com>
 <d4b46652-c4d0-44b4-aef5-e8bcf606de06@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d4b46652-c4d0-44b4-aef5-e8bcf606de06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE3MCBTYWx0ZWRfXzSI4MrpTzwOv
 F9Bhyl8Re+yhrMkU3MiIGdaJzUuY0OhEi4Pg8lYI2iQufEdj0KCiVArJkJV8gH2AvCbfi36euex
 Gf0LgXUV99w9DfBOw3WM2w7TGqiaoEMI0mFtXvtVDtBRdemlolQriQfcrmKmLmXCbZ+quskVHcf
 InnTb57bwuDRbKz0jmcAonGTIl3Jj42VmQfDOeBm3qJ5UJrfTfLbEjBmVRL6tSSxeEJUT6WX9Z3
 wXNn7pcDC708h01Zi9/wzrP/QxX1Oea9uSd5ZYPD0nGrAC1PuR24jZvAN1RO3M6KZh0MW9VFffd
 mgU8cdcH7zTWvuOojXEgK7s3B2ns/6/yUo6nRSxz6x0ky7thRmhk42QfxaY1Ze8fanaCXbXwk/i
 CAu4KFIp9k+vQNGiHKMiYCued7BGa15WEG2aMBLGRBy+qZCbInEmPW7lTfcmigTH+P1HrnbY
X-Proofpoint-ORIG-GUID: msjURc64u1y8u7RaxZYwYQuy-RgUMXsf
X-Proofpoint-GUID: msjURc64u1y8u7RaxZYwYQuy-RgUMXsf
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=687feae8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=1Zk-24FEoXaHOanE9kEA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=944 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220170

On 7/22/2025 8:00 PM, Konrad Dybcio wrote:
> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>> A minor refactor to combine the subroutines for legacy a6xx GMUs under
>> a single check. This helps to avoid an unnecessary check and return
>> early from the subroutine for majority of a6xx gpus.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 38c0f8ef85c3d260864541d83abe43e49c772c52..41129692d127b70e9293b82bea5ccb6b911b0bfb 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -403,7 +403,10 @@ int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
>>  	int ret;
>>  	u32 val;
>>  
>> -	if (!gmu->legacy)
>> +	WARN_ON(!gmu->legacy);
>> +
>> +	/* Nothing to do if GMU does the power management */
>> +	if (gmu->idle_level > GMU_IDLE_STATE_ACTIVE)
> 
> This isn't quite a no-op, but I can't seem to find what the '1' value
> would map to, even in 845 kernel sources. Do we have to worry about it?

This is fine. '1' seems to be a low power state that was removed very
early in the gmu firmware development stage. We can ignore that.

-Akhil.

> 
> Konrad


