Return-Path: <linux-arm-msm+bounces-57430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F74FAB136A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 14:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 444BD3A539E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 12:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087D528FA81;
	Fri,  9 May 2025 12:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kZjXYxWo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA3028ECEF
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 12:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793874; cv=none; b=tndP3Sr5L9J+79gB8P2Kstdku0LiMcGAnm1QJODcIXukOe9pMXLe2rqKyT+AA8mYQ2JFm9limqDDlG3WNQvm/1gK9ohv5jMfSG63MVqRbijo0oxhHFeEQgqt8nKWJmMRTvpbDVWx1ocdemsM9C9wu4O0Lp/GD5R+at/rtnDUEjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793874; c=relaxed/simple;
	bh=SxUSYOGEJ5GdaQB0YHzZ7AoHXc/rXS8j6Kh6v5G3at0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=riS6mtJhafY4/Y7L9K6SiL4Mfa7+ygjAGgp2yKiMSklwpJPyMb0s6H9PUFgSt1u+QPR5YOzeW7BANNSdU/9Ht6BsYvUuosThl1271PvItj8C3PdmjxpJRdy/SJ9VL2ws3y7HRduouaSFA1TzKPL4zw1XzAabRSZK+UMs6tMcebc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kZjXYxWo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5497mmWr019353
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 12:31:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rhVhwGpfX7hQ4jGypsbkijEs/qh48tDmIOIDjVbBg1I=; b=kZjXYxWoB1YUebRG
	f6ccXE5+Sl/v7vPq99CnhIpu+kqFGVnlF+8TfqDZvKsW4xdvINzbC2J9SJZDFCgI
	Uq52JtYhgCoQ/2k58qAjNFrG8XdSYt1PBbprQ9nAUnzuD+6XT3xbOaNevnRxkD5Y
	ZLh5gj+o8YLwoYlvgaTgL/Kj4gB6ZzxyHyq/3ayjGQKAGZEXGiWIgem9IH63QY1T
	/t8JmeqD3fbZFM/DhiI0pSgGjLOFQg7S3bqZbcH+sLS7C67U4zolRQ/Xvyevc1y8
	X9g62UfAmSqC2AwXvhZHJ9BC78JDSK+lopbCCJmK8fFHdYKKi+0orce2K00g58pZ
	EHwiIw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gsdj436x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 12:31:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47983a580dbso4246051cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 05:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746793871; x=1747398671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rhVhwGpfX7hQ4jGypsbkijEs/qh48tDmIOIDjVbBg1I=;
        b=i+DcAwOkSUPCn9UVebu9eEV+RF9Qy9EuPRPQ8oFQUqxCSC7TXVFXPzTuK/YX4/p1hH
         UYhRmlcNq4b5DpKQs410ZKy55ylmWtMLn1gGQhftbeMfd3dh++K4TRe2DviHgDHcMp+u
         3W5UHyoAPY1JWHvYxgtk8vn/n/M/jgnqneyP/Mx2UmO8EqIewFCPcSXDzbEAcwUbfBeT
         yuOXDZADa5loir5+EI0z2minVhUQAnom0WUmGnMIt6Dr11M5FJCORO1w0+P94mn8crtt
         j1C+h0c3BciHEgLcbiUyFnUkiIlYj6dpSlbjubCDbRRUh8O9Zg8In6MkQca7RtKlBbe1
         /EzA==
X-Forwarded-Encrypted: i=1; AJvYcCWpJW4jtZ/4rhmRj9bF4GUP2ajq4wRYK/b44f8CIqFW2py4qp6J0TGJ+ZtIk/KddGybFCvz/4dkGB/ZOOsn@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx3ihn2sFDRHPfs6Xm48K5NMW4UIZdcGEOt6dEYT9moyTxmDYV
	E7SYimv3Tv7At6Xd+Gb8TrI6u4Yb11EB0ffgwhlzH7MD58HV64s5XQMT/ixL3XqqdufBSr0n2dh
	lYe++qeUOQ/5FH1fVXvjAaKBTs/D6jv3TrMiVUOpcR09u5UUzKfXJ8ftwaLLhD5Jq
X-Gm-Gg: ASbGnctxeCHSbesgxkgfWefUXkJlCMIXDZR2PY4KnW76kre4j/1UvasgvfwaItRONvd
	1ed6euOet77aC5a6IzM1Ldop/Nfa+rJwUgWfGhIxzmDpztfSPKTXbdaxykMuTwXq99BuTfg9v2x
	BkRR2Hm+gZk+fqGdZQnON5Shfu2OZ/oFZv8+l2dfLP3mKK8KD/Zle74sj6BYx7ZZwm1hBmWJJ5x
	J11fg7GII3Im/Y2tcM4tonNkPUFPiHYq/WWDWfcGs9RTxisBgtzrL3goV7sxACnbkIRgddUxg4U
	RIUBUtR0DgdOke+Uawi/r0PGo/9a71AdA113beGDdhKxmZ70lXOF4CHBjQpy3lT7zLE=
X-Received: by 2002:a05:620a:4710:b0:7c0:b018:5941 with SMTP id af79cd13be357-7cd01109256mr174579985a.7.1746793870969;
        Fri, 09 May 2025 05:31:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhgwqc5dmv1BuLfl2iNwP5xWwVZa7nyp8TxQ+UzvepLaRqf3krtNvF2xEsEPUvN4R2vKmFTQ==
X-Received: by 2002:a05:620a:4710:b0:7c0:b018:5941 with SMTP id af79cd13be357-7cd01109256mr174577685a.7.1746793870580;
        Fri, 09 May 2025 05:31:10 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d70d55bsm1302110a12.65.2025.05.09.05.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 05:31:10 -0700 (PDT)
Message-ID: <5c3d3682-8378-486d-8af1-4b884b81f3d0@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:31:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 04/14] drm/msm/a6xx: Get a handle to the common UBWC
 config
To: Rob Clark <robdclark@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-4-035c4c5cbe50@oss.qualcomm.com>
 <CAF6AEGtcoMZ+WiW5_BA4NFpLZsoOrDbkY4xyvENGoS2FQVwQxw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGtcoMZ+WiW5_BA4NFpLZsoOrDbkY4xyvENGoS2FQVwQxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PMAP+eqC c=1 sm=1 tr=0 ts=681df590 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dGexCodceDVc4I0WR1sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMSBTYWx0ZWRfXyAMhgl/9x3pE
 d3UL0H3u+0SPKza4SUlFYpxzAxkfhIBSpppfpqm3BwN4is+UmL6YWUpvPLzc6Pq6e5ODsqj6Qau
 8r1ZFTHq8jpOTqLARH+jUJC/Pa+qYpTBchBzy25zzwujGW1n9Ss1IV4zyUaem4TRyCerg5vnFz5
 PshPZHh6ceP9vrqDLcA2eE8+/IoXC0R17s4t7qqoRO/XrRwrK2BrwLEX5BUcTcCNvOLvU7nbfda
 bJhBeDaM8ZppxGr0ByjQlKN3blUx8bLZd3+3LWHqltC2kKl9xB7Gz5N5/PG8m9Qvx2hqtz9B1fa
 yPc7DcYi0pMddCoh6U7DP30NkG2YE94Mn3gWwkyRS5irleCZEFY/bQMCtjiolU2vvDgHSsHp5+4
 Kq6qP2sFRmdxpWSgD2WrIUWelTBBIMhVNWKEJlWYg1VmY3twYsE1PH/Y65MmFI42cev0c13h
X-Proofpoint-GUID: YVImM-bIlWxmZb9BmMXKfGzdDf_xT8P8
X-Proofpoint-ORIG-GUID: YVImM-bIlWxmZb9BmMXKfGzdDf_xT8P8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090121

On 5/8/25 8:41 PM, Rob Clark wrote:
> On Thu, May 8, 2025 at 11:13 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Start the great despaghettification by getting a pointer to the common
>> UBWC configuration, which houses e.g. UBWC versions that we need to
>> make decisions.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 16 ++++++++++++++--
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++++++
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
>>  3 files changed, 23 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index b161b5cd991fc645dfcd69754b82be9691775ffe..89eb725f0950f3679d6214366cfbd22d5bcf4bc7 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -585,8 +585,13 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>         gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), protect->regs[i]);
>>  }
>>
>> -static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>> +static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>  {
>> +       /* Inherit the common config and make some necessary fixups */
>> +       gpu->common_ubwc_cfg = qcom_ubwc_config_get_data();
> 
> This does look a bit funny given the devm_kzalloc() below.. I guess
> just so that the ptr is never NULL?

Yeah, would you prefer this is changed?

Konrad

