Return-Path: <linux-arm-msm+bounces-58687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 059BFABD3FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 11:56:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F6871B65646
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 09:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5716E21C9F5;
	Tue, 20 May 2025 09:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gd53YKcX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1737625EFBB
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 09:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747734969; cv=none; b=BBGr4CtYPqDjiGVYzEKtkq0EClZOZmm8iGioLh8F49JepXu4Dbyzy6iskauutokJHojajGyUJgc81vAcz86u0QvYrBKvn8+Uqzo8X6nVRWjhug+VmR1AC3wWokBtAefSvVxFRT+SiI8iYiU69c0naGcHcBcLaCqTB4I3Y5lMeWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747734969; c=relaxed/simple;
	bh=lydJCPfDF+Y8xYT9SxfHUAuxF9fHAKVBJJJryGlb13s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XhiEqvaUPDrHApm5KM9N96PVz3sZ47T4n76GY6uVWJRStlqgHW9DljQiBRqMsNSo/FPrXQvmY4+mwmtQ4B1AJl33sdOPLgQ91ypjsoN+gLD5aHD5bzrK7EtFzg34fogXBPm2EHM8zGmHMUZTqT4cLasoWVyiM+Xf0JP1O7dQsdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gd53YKcX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K8jKcU012231
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 09:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjX5/V+ctXqdOjMw8zTg4Nlq+ms4eh9Km8lSRzO0p5s=; b=gd53YKcXimle9d3G
	TLt+k8OPw5A8nqqG91P8ZQbIa+RAAvm/UdMenyJ7XpVTm21PUhqKpWKb8A4kHNnY
	J7GOxNSiryLJBLdMutPkGPqEYz1J3r96HRGl1h8QsK6etyv/iXRZaaplJ3nq78xt
	e00rgLFfrx+am7GZnZHjgqFWnJpwy2W9kmki3vt01n9JadlB9t6OpOjaiutDxTwn
	srg/KBg6mwTSWzSjBC1FYDL7FNApO5vRZfefu1tqJU+nyTnPGxl/vMWh1Qv88BNl
	uPK+Dio5ZdvLqXOuY6CSfeI5th8ZjzavH6WUStYqlr6dRlMB/oV8IfLk7Eae1Qxy
	ic/pSQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsy78q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 09:56:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-231e412d4c9so27641565ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 02:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747734964; x=1748339764;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjX5/V+ctXqdOjMw8zTg4Nlq+ms4eh9Km8lSRzO0p5s=;
        b=B/b/upJ+nneLThcR9lFQ1lhmR6hsKG6n0DlKB1T8YVCocDJ2gVK68tO4x0vCk7HSVd
         +XcDHOukm4XHeXYSDJF5jHoXrryeGyyNbYgQ3ExYwTU8TLCNP7+ryXn/UiM92Y2Vc3i4
         JBHeMo8J0kn/AHD0X0jHlcnO5zJ1yx9ObrGITlmjrEJRBgAo/nv7ANAhAaqSpBJDOXVW
         6DiyHrM1MmKvmmVH7creqavmDM0AS8Ga/6PiXJKteO37m9N9dP1LELxBsghdeekAr3+T
         q0xP9Hwo0p3Z6QsCQUQtIO7IJSPY48JnC+jCkvvoY48QW0L5ZjL7G3XByXdjHIQSlkuI
         nVjg==
X-Gm-Message-State: AOJu0YwO4qBfD9FU6QK7m86wEenjAHSwMaSQEeTRSoKAY/RB9aIktue9
	kCHvIm7zGkV9E8jqaHZB/DfbbSkaAe0uyNoHUkr57sShNtBOhX3QbbqH4+bx9QWvkqHb6YjBkCP
	spNfgXqX7P8DN5FKi+3DcU8r45wInM05hRKveIZE5d5SmaNSJEy3UUZldxfsnENR6muCs
X-Gm-Gg: ASbGncugilYF4/D/eA6EOlkZ2xZGXnQz/MjkP+0ZDffpMal1sHwDEyXNHAlqCjXsohm
	gTI9H7kAsuFWr353fAOPftqqhptxlT9Eb4Qg3Po0i8JuOzR0g0TW3BA0UAyt3BcPOiPYYF+C32N
	Jerjpsr70Xd4+HX5zy2KB1d+na3hpjg4jhqR2GXDooaDPZ5ITTW/fxOABj2StAYv4Dh24uXj971
	puYP+62LYd/2yWFd03pYVBb4zoStYbnMRWWPNZukmtvr9wln+Y8YBFiuK42wOmVdeEabF2RqY1l
	XGSYd37DRkWkblde+yK2ix7p6pe/YUHDBR1N
X-Received: by 2002:a17:903:2ed0:b0:22e:7e00:4288 with SMTP id d9443c01a7336-231d459516bmr261366485ad.53.1747734964506;
        Tue, 20 May 2025 02:56:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFh33sx6xak778kAhEweurUJhyiCBBd6ZzkgJMIBW8tS6ffISJATJB/IBlfQ5+JHy4btgFKOg==
X-Received: by 2002:a17:903:2ed0:b0:22e:7e00:4288 with SMTP id d9443c01a7336-231d459516bmr261366165ad.53.1747734964109;
        Tue, 20 May 2025 02:56:04 -0700 (PDT)
Received: from [10.218.34.181] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed576esm73392485ad.242.2025.05.20.02.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 02:56:03 -0700 (PDT)
Message-ID: <a14f58ed-fbc7-4074-ada7-3b9e50eb3047@oss.qualcomm.com>
Date: Tue, 20 May 2025 15:25:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: qcom_stats: Add QMP support for syncing
 ddr stats
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>
References: <20250429-ddr_stats_-v1-0-4fc818aab7bb@oss.qualcomm.com>
 <20250429-ddr_stats_-v1-2-4fc818aab7bb@oss.qualcomm.com>
 <c876ae55-a84a-436e-8c11-c0df236c1ea5@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <c876ae55-a84a-436e-8c11-c0df236c1ea5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZBtpwxq6Ruvzph36qdHthPeqCCTnY34I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA4MSBTYWx0ZWRfXwZEL5P7qPeMM
 GqvUDcKvMiEqTxjJAS4cjDzL4S2OeYyLW5Y4rcUHsTLXkSCsz0/47FR2zSbJrwYas9v/E8KnK3Z
 AfrG2VOa776DGUzqnmlyEKtxSErdf8FBWur7HfXujGyp9ZS773l74tegR0r2YHX0IepeheIU3G9
 WMN3iU39oZrfTiJoV+zRzMJHkdS3o9IypLZdSwUrautGP5F+h7TSpgJHzpzw61zQ8sU21L4gHUs
 43AkjShmfH6rObtxTFRtuiWmswIKjbJqa7qYj17DVsfJWCP+59tvUjwhxcI1xALDsZ/VAgd3KOV
 wixmsP1EvqdD1RHT9P7TYtYNRYd5cctzRG155pCsHpGYgw5YfNWchrX00fevCftKNgHRzBGw6NB
 FkzPlR2SBylUphwoXQA0KZxUFD9g9yuN2HE4CEaYLo64JGUbkI0NPoOuNobLalklXp3zGlKg
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682c51b5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8
 a=Em_3BBobWHkwEKcIpuwA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: ZBtpwxq6Ruvzph36qdHthPeqCCTnY34I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200081

 

On 4/29/2025 4:09 PM, Konrad Dybcio wrote:
> On 4/29/25 5:52 AM, Maulik Shah wrote:
>> +	if (qcom_stats_qmp) {
>> +		/*
>> +		 * Recent SoCs (SM8450 onwards) do not have duration field
>> +		 * populated from boot up onwards for both DDR LPM Stats
>> +		 * and DDR Frequency Stats.
>> +		 *
>> +		 * Send QMP message to Always on processor which will
>> +		 * populate duration field into MSG RAM area.
>> +		 *
>> +		 * Sent everytime to read latest data.
>> +		 */
>> +		ret = qmp_send(qcom_stats_qmp, "{class: ddr, action: freqsync}");
>> +		if (ret)
>> +			seq_printf(s, "Error updating duration field %d\n", ret);
> 
> let's just return some error, instead of printing "error" successfully

Should i drop the print and also error, From details given in commit message of [1] 
which made the qcom_subsystem_sleep_stats_show() function return 0
in order to run command like below to collect the stats without interspersed errors
grep ^ /sys/kernel/debug/qcom_stats/*

The same may break if return error from ddr stats too.

[1] https://lore.kernel.org/r/20230119032329.2909383-1-swboyd@chromium.org 

> 
>> +	}
>> +
>>  	reg += DDR_STATS_ENTRY_START_ADDR;
>>  	memcpy_fromio(data, reg, sizeof(struct ddr_stats_entry) * entry_count);
>>  
>> @@ -310,6 +329,15 @@ static int qcom_stats_probe(struct platform_device *pdev)
>>  	qcom_create_subsystem_stat_files(root, config);
>>  	qcom_create_soc_sleep_stat_files(root, reg, d, config);
>>  	qcom_create_ddr_stat_files(root, reg, config);
>> +	/*
>> +	 * QMP is used for DDR stats syncing to MSG RAM for certain SoCs having
> 
> having what? (you could drop that word and the sentence would still make sense)

I will update the sentence  in v2.

Thanks,
Maulik
> 
>> +	 * (SM8450 onwards). The prior SoCs do not need QMP handle as the required
>> +	 * stats are already present in MSG RAM, provided the DDR_STATS_MAGIC_KEY
>> +	 * matches.
>> +	 */
> 
> Konrad

