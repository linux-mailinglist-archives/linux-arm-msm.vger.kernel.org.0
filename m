Return-Path: <linux-arm-msm+bounces-71598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA42B400C3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A9453B3F16
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D14221287;
	Tue,  2 Sep 2025 12:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JrvnP5+t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1F2224B15
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 12:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756816392; cv=none; b=Kg1RLMluHpoGSicGSOw3t+iMn+AYAKLDOFWJERJljyFOE2aqG0uZ45Q0GLj/DDBq26pl9fhA9kWigZB0PWnHv6VwvEWjotfuqWGTjA9OTtGaR98CvCh402er++KcyD6XfqXc1WLM0cASojRy1YJqNlkbpLU4WYXwTD5UguMlccI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756816392; c=relaxed/simple;
	bh=hhZxouj/zGjuFf+nEsL4SNs0kjckAEOFc/zIo2HWuMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u4lGNbpa5x26KpKMebL7a9JmMy1Rs57UGEYxSIhZBCu0N8Bb3YJmG1zmDIJ5bB6stclsOiEI4UTgcijT4ECOmlj/naaFyFbAl/AJLpSr5LjL/YxYtaUBlG5ED8bRMEvXSfqMnEo/MbtYzxX4OkbV67uHYpVHxzgqlQaT8Yrn7YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JrvnP5+t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AnkGW031364
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 12:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vSvPlAtycm0pq6Ig/4XPFbNEtXJ7S/Va70A53TQ5/A4=; b=JrvnP5+tLTWa98Ty
	yumJjQYn3dO0XnbKa5+FlBG7AHsOP6WEPFza7CP86KjUy292hW/VGjv0Z/fZqNmV
	0rvKK7CR/TlEESvwdAlnMBMpLvMwcjRpD7Dx27zkOSdeD/g4tCnTekR3VhJF7n6H
	VVSf/lt+s7aKADlobM5MeekYXFh/pxhHgUNInvKRdyX3683BFfIBjP5JOCXXMO+n
	ugzYWbBvv8Z+DY8ia+3PXOLCJZebNTnnLi/ahpupXgoNjlRZrt1igtgO2SJfOcoX
	NAt24AC2+I5TYLwb2BwI5xHtH6xdSFQ5f9FWnr32FeXAJ0jkMqe9UGtCdWnKVXmf
	Phq/6A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush2yndy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 12:33:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b33d08f681so4139991cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 05:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756816389; x=1757421189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vSvPlAtycm0pq6Ig/4XPFbNEtXJ7S/Va70A53TQ5/A4=;
        b=pt85yLnQ4oxvuLrf4SOc2NzmYvhtKO/+64/XNgz/se0Jh9oo2NWdpXfsOHdner9r9S
         RA1sNfxaQsAkciowOp6szxOjIhGBH3DOjZkI9tc6EZwnPUFkkKxbx4zzqq4FeM0tsNdx
         OSqGROfdiICFw1638/LBrjyJKF0vFpoMgcwSmWRNp9dm4xwNM4J/mIaKSVrPZm/JR8Wz
         HiVls3Tg+JjwuJ7RTUjR6od5rJ4h/gxFuIRneZAgc4t1Hc7xMfF95Do/2zYWNVqdGCUR
         NEvoLKVB5M3zTRp/wgJxf66Y9ofC2VW9vdb6dx7RYrORhPxzjdyV1HDFdaGvtijrLkyR
         odYQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1tJS9dK7H2rt7MbK6dMMonMq/z4DJKeX9/uWRw7euIjatFxQrfFpp+ZojRD6Lj2cBSSy8X0IsTg/O8SLQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl3wCgSPIeb/HXd9jU2yX0MKMAMIWp8QQVBMYfmgq9p4afF4Lo
	yEyQ+04U+f1foLAoa6WwkYwJq8ksCVyACB99EUXveaam+Z6Xwc+hXsxu+lnP0TmaaTXpj2wSDj0
	V04KcqyHNaH1W0I//qAuxMaRIIaZSM/65XODGVfNkJ+LDJ2ZbSzyrQYKTYlDhCmQKr+/6
X-Gm-Gg: ASbGncv+/G/1xBV4DMTfnSKB3MaXs7EuC3VPTyHuA4kVdpmuUaKObIz3dcEARMf4hsY
	T+XXRQnhgLqeQS+plMIW5Wmu79NNdkhTJmsNcD+UwBBwHKRCXJM18BK7A5U8NyV+0lJH4Dn1jRB
	sdb+VhVGg4wy9oPG+yK3nYvTSpPEO8V0XipdzIm+XEzLCHP5xOV6hphc57CP7VxeFPejcb2SwcC
	N2UXCNFJS0Ia8FRfeOh4IB7ub7xDrVtYYfkIEi5bSBb7OkMSvRapk086hKdJbld5Dq5r/Cdlbn+
	iu0gwNPZyUugg2EQAoA4lg/4an5h6Lb1/TGoJyd6O74kD7FCBMjaxE90w8U4X/XDX+4/5hiK/2b
	/lppTdL+ymcn9fIQGBiduiQ==
X-Received: by 2002:ac8:5d87:0:b0:4ab:5c58:bb25 with SMTP id d75a77b69052e-4b313dd02a0mr101705801cf.1.1756816389169;
        Tue, 02 Sep 2025 05:33:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFygbSXPmg/W2fjM/6E1xOIRsZDrVD2qEEhASg0Xx0E83kK/rba5OZ+uTMQ8o+BQvRuG1WRPQ==
X-Received: by 2002:ac8:5d87:0:b0:4ab:5c58:bb25 with SMTP id d75a77b69052e-4b313dd02a0mr101705591cf.1.1756816388644;
        Tue, 02 Sep 2025 05:33:08 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b040df6e19fsm723031766b.100.2025.09.02.05.33.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 05:33:08 -0700 (PDT)
Message-ID: <694f0989-64ea-4c3c-8613-863da1dd286a@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 14:33:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/msm/a6xx: Add a comment to acd_probe()
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-4-f3ec9baed513@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250902-assorted-sept-1-v1-4-f3ec9baed513@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfXz7Wu2PW64/5k
 Ga8dH93LajgXiqesNtHG0f2j7ppc+qZJ9OxWR4kt7IyAs3N+klhP4VCpa12jWdnRuWDIlKo5lae
 YDAcYv7oaUX+AEgmz+2cnaqm4COuhEa2ZJdqpnb1MPrvk0P1LsZvn60lKDXFtlXBgVfpZOWC1Oc
 HIYiXhLvnqQUzmuc2N5u8MeDUmNGb03oNGZrEUj8f43vtO+6y4hcv7YYm6pvJnvDCI7Yi7GXOaD
 yzufKPJZ8ru1OkBxB1B+mDpagsdS2ri0RBn0W5VLO4YxRwfDaL9ptaqaUGKyda87uR3dWF4Mhqi
 +i/GqTGS5D0e2Fnx2CzeMPKhyekM9Wv6V5n7JklNWj+fGQB2ku4ZKKmXgZdxEQHG1VGrfsBdPkx
 JTz2Ydmh
X-Proofpoint-ORIG-GUID: CHzYsDmzzUaBC_Qf_d4vfqudLE7nLl_R
X-Proofpoint-GUID: CHzYsDmzzUaBC_Qf_d4vfqudLE7nLl_R
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b6e406 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KrKh6rb5Vgb6-fdLxr8A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

On 9/2/25 1:50 PM, Akhil P Oommen wrote:
> It is not obvious why we can skip error checking of
> dev_pm_opp_find_freq_exact() API. Add a comment explaining it.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index ea52374c9fcd481d816ed9608e9f6eb1c2e3005a..de8f7051402bf0fd931fc065b5c4c49e2bfd5dc7 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1694,6 +1694,7 @@ static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
>  		u32 val;
>  
>  		freq = gmu->gpu_freqs[i];
> +		/* This is unlikely to fail because we are passing back a known freq */

This could probably mention that known == we just retrieved it a couple
function calls above, but I suppose the reader can come up with such
conclusions

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

