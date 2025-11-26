Return-Path: <linux-arm-msm+bounces-83515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA98C8BF93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 22:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 00EDA356672
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 21:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4C545BE3;
	Wed, 26 Nov 2025 21:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nrIpD/I9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dlq1mtyO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5A2225788
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 21:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764191368; cv=none; b=UDYnukQB17ulqeoQ3j9z+sYz+Px1a0AWCUDMH1kilIZb0rC/X0Cq83yrdLRUeIDmemKyuwfPf/xZQPxm3ZW2baiL8DWAdTdT5UTUYbqQaOeJnpgxc5cxeg2rYqkWZtz1JA8uipLUnrgIgnl4R5W+HI4QSlLuM6xczciJnQk7cBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764191368; c=relaxed/simple;
	bh=CzcXfIPGgq61Y0FCJ6PgfmP1b2eNPrra+VZtPUdboOs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n3a/zXPvhvTX2UziI0vobr9+VTWA6X8tsYRnmN3af4vfFpgXJFHKT0xhJc6b+Fm8UXbWOH1JescsGLulh8tSC4VmvB3MK2GKJ+aXlz8FJSUq/xaNfAjIt7UemZojoTt3MDZhpYk2rOl9hVMSwPNbf2To3MM7XrSTFL5aPyjLZxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nrIpD/I9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dlq1mtyO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQF9BHe3892580
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 21:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yMrBrEupzNG/kjvgWInV+ccqxgsF0dGrNdtRVv00PpE=; b=nrIpD/I9+2FOXmOq
	ELLsoK3ZOZ3W7j/fIEAJVJj63CoxME2Pf28rmqCchMZ7FelHfK33niVpo4QM/oI2
	fvqYhCHjLF5KvJK9AUnwRZog+or81U8bwU/a+2ksqb5czcgIuVYrlnxna/+Ov/CJ
	Ev59eYXmyHY+lb/pRR57EfTPIi5A0T44y4QOyX3yitaHwG4SkRIqN4BOWxYNkRtF
	t6z6PHVgVHxfYCtXVDx8DZPCfRLYq+WasDoW5Lvf+psRXlcZ/wj6pJjrHZ7BNmJE
	ZHiClQzbYECzArPrW3+633cT0W4W4UICb26hatHZ9bHVuppdwvggMugZhNgk+V9j
	Zno5Rw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4angmec6qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 21:09:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-299d221b749so2900575ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 13:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764191364; x=1764796164; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yMrBrEupzNG/kjvgWInV+ccqxgsF0dGrNdtRVv00PpE=;
        b=dlq1mtyOKQDtfFrbLj4TCZSayHGGm98WUt31onkkMMD+5C+VRd7CCTtsv87YJAoWhi
         FOIbnTSKd2iH9KTXnWbIBB6GaCKpPIaknlH3vpF/LU6ZDjnFmmUletBJFTir+UCYCOjC
         dC3N+EWQcRNNTdHSrddJtKnb4gedM0endn1Nd/HjTVGVHYpIliWaz83O0jfni1CNKiO/
         wjttSqeXAD2jtPHoC23eZvtGznFkCpq4vIChAjAuYzCIhU+ESfqv+BdYqB3sb2bhPIbW
         YpKGLp0ja16R7Noa6wsDWZcbj/Ic0o4xW6sL7OvEtwrWd1v/F7tcClt6Dkb+ma++Fm5/
         vCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764191364; x=1764796164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMrBrEupzNG/kjvgWInV+ccqxgsF0dGrNdtRVv00PpE=;
        b=jCYNF/Yiumbt1eXHHVMCLLO/1v4/+ejoIMO4oJXO1raZj4gTmtUFHGrogGHDsN85gN
         AiJ1RCxZj99vbaFqlRUDDdAA741xFKExHpTXWxbJ5TXqEoid9LGWK/Nwsz2JnXkxxtnR
         yJ3Qpn9kVNsCK7wVRcj8/fnDKkmAJBeL6UkJ/Tohi7k9AshTQ+f6Oam2vcc7rfuCBY2B
         L621In3CJzsFuZ8LyrCtdQ6VX1bwDhcCodj1G3/OuTDYwaXokU7y5vbZ5GtDEyU7cGMb
         aFZzuCp/SWqf49IM18GVnafF/KzA/ldR3DevCFqKRxmvYZ/iqB4USC55JAt4AIrOnue9
         Ifdw==
X-Gm-Message-State: AOJu0Yyg5cKShYqNZ22J//EiaSYseHbUk+SSEretqumq3BcAiDCZFuc4
	3m3zj49NgcQKbOGr5iXIUCDcyZYMEmFCikt5Zzj9nl62amq6ivJJIcjYEGGmuPJ7BOYODVSf4+Z
	pWnA8MAtIhX65HcNlbSZl0eer3KMiOA/W6aI4XTQemYRz4xd/sP1LU17OVum3daUQ9VMP
X-Gm-Gg: ASbGncsl1qJvfXjxYCF+y3OXEiys4FMGds/QdDqYyrStpvuB7RNzVVFwoHkumOUQdCE
	N2m3X4WfKawrkzLu5EwzuNXYMTcbYOdOuM1NCNiiyhyWWHyS7e0w8WWDk6GVLaHxE2WFzBHaHVl
	wZ6RWFv332RFB51mBIKQBH53DN92r9euKDP++nlTwWdF3z4/onDLo/5QEj4sbbSzsletwZV87JF
	eYp0IGoMULQsr450A/DzjjV2HZ4y179UU9tNr4oa2dGHqJ8CiZ2L5zWUxLXij68NshFCpqOap1+
	E1+Y86LZNqeOMp4bZL3o0S+kASsL7KI7wvkGA6QMUEjQlqaznRXahXVyg1dtfK3TtMzGJ4euVBb
	XtL0KxnjaAwLQZEeZ+6C3Io6A1naYup7+
X-Received: by 2002:a17:903:3204:b0:295:5945:2920 with SMTP id d9443c01a7336-29b6c575104mr222681895ad.34.1764191364392;
        Wed, 26 Nov 2025 13:09:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZw7wRDK5hth2e63vJFBF8A71k9+LuzivqF3PsMUAR04Gv7kXOToy8rbBpWlmX1hZZcRTOjQ==
X-Received: by 2002:a17:903:3204:b0:295:5945:2920 with SMTP id d9443c01a7336-29b6c575104mr222681545ad.34.1764191363890;
        Wed, 26 Nov 2025 13:09:23 -0800 (PST)
Received: from [172.20.10.3] ([106.216.204.28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b107774sm203797555ad.9.2025.11.26.13.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 13:09:23 -0800 (PST)
Message-ID: <71d02a9f-993a-4d61-a95a-cc3a9cbdb435@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 02:39:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: add PERFCTR_CNTL to ifpc_reglist
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251126-ifpc_counters-v1-1-f2d5e7048032@gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251126-ifpc_counters-v1-1-f2d5e7048032@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PJgCOPqC c=1 sm=1 tr=0 ts=69276c85 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=RklEKUTwpnVNyatRsSmyOQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=GqK8k8GEXUDarboaZ6YA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE3MSBTYWx0ZWRfX47jSMeUrlIPa
 FL36hHxCaeYYTt4YAC99ZzUixeUvWTUmnWxwXiWOoEJGenGBONsKixTMbRTg+eMjiivVTGqeiRe
 3dqyE3JoT+9RR75Xl/Swij5MGbi/1lUwpnXW9lIPBOBI1UI7Pe+QabTji58aKsQlTeQ/F59jj2V
 eocZvfacHl6Yw71dw9ufB6D8xaMnfH93zqEZi3v0MSodPNOMcMblGW/bpi45r+EcvYXG4jWXaPf
 KkApcP6h5anw8/jeCl5H9+ihnNTlBmWyDhTQSIZKaZxIXO5m7bda/tXE/P4VFrazMG/3eVyAktz
 RZrVMDUZi/Hp3SHoiNWKM8PaS3wsq8f4sc5oWgieJI5BfBgiqFNcfZo+j/HNxMX+iKkjKj7T8Nf
 duw6dJxzzI9WK6149uimPYDWrXevXA==
X-Proofpoint-GUID: gqUV8l_PnetKXD319uKfXxM_lkoQL4f7
X-Proofpoint-ORIG-GUID: gqUV8l_PnetKXD319uKfXxM_lkoQL4f7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260171

On 11/27/2025 12:36 AM, Anna Maniscalco wrote:
> Previously this register would become 0 after IFPC took place which
> broke all usages of counters.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 29107b362346..b731491dc522 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1392,6 +1392,7 @@ static const u32 a750_ifpc_reglist_regs[] = {
>  	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
>  	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
>  	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
> +	REG_A6XX_RBBM_PERFCTR_CNTL,
>  	REG_A6XX_TPL1_NC_MODE_CNTL,
>  	REG_A6XX_SP_NC_MODE_CNTL,
>  	REG_A6XX_CP_DBG_ECO_CNTL,
> 
> ---
> base-commit: 7bc29d5fb6faff2f547323c9ee8d3a0790cd2530
> change-id: 20251126-ifpc_counters-e8d53fa3252e
> 
> Best regards,


