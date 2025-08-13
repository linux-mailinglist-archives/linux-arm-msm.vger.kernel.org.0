Return-Path: <linux-arm-msm+bounces-69070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A95B25694
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 00:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A2085A7222
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 22:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDC8302764;
	Wed, 13 Aug 2025 22:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K9Rmk/HK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1E530275D
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 22:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755123874; cv=none; b=WKbZ4cB9BjfqkL0j5D06e2/zfy0zWxrgMSN3XxJvwII/vWD4NFk1XR5Y6i63eokIy6gTUbIPyw2/L3C9dgvZtTVThnR35A4WsmjA82V3O429Kub4yteeZwHUzBT4AdnNbd0uVcMEUxjc3AJ5D0dhxjI6KPTQRB92zlGBlGI77iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755123874; c=relaxed/simple;
	bh=MkzcIASgD2QGbcPW+Wul+0S3bWjeYPRrF6/zdQI2jik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h2G9HJKseMYGG7rn3q4TQxLERbyhP1bUCkiXAwjcV+HC8dA7MSkfsIH+Vs0mKtdBD5BT572Fdu0FozO4+C+mRnRca7+/UBZOW6TdtrF3unO5Q0W9+/JL5hFjcxB+qHU3AtpRNDzNSECE0w3+KeauGHeFY5BlziQ9qVPd5R/hcxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K9Rmk/HK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMIQCQ020580
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 22:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q7gth1q5wXt2kbolj7dWwKraNNmPxnZCoAelNEomImI=; b=K9Rmk/HKt+36obya
	M7UIbbgfRjSYDDYDWA3EMZ/BOIvwNdm2eFMRYEt3okNQRPA0cpkcWri3lnn2208z
	b57DhfPUBmsM/a71CsC8D0O0AGP4VNVIBDndA7NCLVIzbv38FMJIAfi+yQht2xNc
	VSuQDiWxyoC+8D1qos/8AaQZjYj43EmBU0CdXTGnrPwt10R0byL6SP7n2tRHtW4e
	MsTJ/Yw/hRfq5eyXk2PmPRIR41v/3ydboLU2mE6ABUihzo1eKQ5uTw2fr3QnZz06
	ecyaMqZzanckeqGnfFNvxfTg4ooITRU5EAIh1v9QvRicXdAvrfMU8kKF4NuFc7QW
	G8R6UA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g5hmdc9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 22:24:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e2eb2095dso251861b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 15:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755123871; x=1755728671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7gth1q5wXt2kbolj7dWwKraNNmPxnZCoAelNEomImI=;
        b=DsD2l2CxsroIj2uBRC5wbBqtSdYFiuTEFozpulwjzXQpH72kjRHHqSGOr6JV/1dL8V
         XUjVT0YaUm21lqKaZ++8kRiAGOM64mWNROSbCqV2Bsafr/LUyxHfMxDDzQHbl5gXO30p
         jF3Tg3SGE9EXltStB/YZxLd3N6yY1fWvGD100/Ugas1z38L0YeGKkm0fwgU6U5IgA6ry
         8Wa8ikqRW1bFiEVqCA5YHmwKP1JQBMIZO1YTL6IxNp/HZ24kWTwdhP2Gzjt37pnWKy+g
         eYMu3eH/8nUePfVAe8kmsVHy7xHJWdj3//xNJ+GmVX4GsfV90Ji33AwQrWQw79GYX9Tt
         R1qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkYWqJDIUamk7EGrphCicWZtRAFx+8oXeJemAwSlMbv88lu9vJA92w5kWi8BFvx/oIkb7R6olhpiblxljl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8/6IAzTiIZTx99pc89+abYNV2g9ab5JXq5f15KAHR+MipyV3m
	a3ZRazis4ZgMIMfgjhA2dcP8PB8tJwqSWVnW5hR4e3Nj6qsGIqf90QWSDhtUuLn+MvxPiyN49s6
	toy1/VhPOwYPgmBwauEBME4sb4sieEjVu5tXRiAZ581yoAJ36nDfDEmdTZS/Bngv/eh4=
X-Gm-Gg: ASbGncualgTmC6JP9t7eUGwCxcVHUwey0ruCvSLlVuN4TopF7uoElPViCvP+sfYieas
	OLuf+P2Rx2+XW7myS5zJyAHTJNknvDSi2AUHNbx2U03MuC7P/Lbsb5+xtBoPpvcZoWTytLOrllO
	4ZpP+PHYtBk3OorUk4TahkMiV6Y76FQqa8gABC4SVZSWElE7a4yhME9hUn/teajXNab39NolG7j
	ikbtJicpPrIx0tEVs/jpHr8zQ2ZuWf/yltI8skoZFKPfOGaKLeKPo5ij6i9sgCVHcCiKXpdjdIP
	2IRJ8yoOldN+MAUPDD1/6K85P3vJldEkNijo+ULx3JyPiomUJFV6+Ct61WbKLCPneTDmNOQw3b+
	GnRiow01YDyg/OgDa/51faMQV1dDtR29685dyew==
X-Received: by 2002:a05:6a00:3e24:b0:76b:f1c9:4ec9 with SMTP id d2e1a72fcca58-76e2fc23e59mr1085322b3a.6.1755123870902;
        Wed, 13 Aug 2025 15:24:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrd6YX7PSuR1I0NvscqCwDnSHruYilibycjxTioyww4LMs5uJhtMWQp7pwAdosrJAlaZ3ajA==
X-Received: by 2002:a05:6a00:3e24:b0:76b:f1c9:4ec9 with SMTP id d2e1a72fcca58-76e2fc23e59mr1085287b3a.6.1755123870379;
        Wed, 13 Aug 2025 15:24:30 -0700 (PDT)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfd8ebbsm33032684b3a.102.2025.08.13.15.24.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 15:24:29 -0700 (PDT)
Message-ID: <d81abdef-18fa-496d-8493-e8f336c43800@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 08:24:21 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/11] qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-10-ce7a1a774803@oss.qualcomm.com>
 <3ec0a8d0-7900-45bd-b0d3-90ee8ca7730c@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <3ec0a8d0-7900-45bd-b0d3-90ee8ca7730c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDExOSBTYWx0ZWRfX7C7nZbnn6Npk
 skLnpEqNF7pi75TXiAKCfqaCmpAq2nN0WwT5dAAtk306NFvidGCEOwTutpoM9JGsV/Y1JoTBWu1
 JhCEty5yY2jE/kyl61qh600BHnswfCniqCAdO2rW86mC1c5WAySPLqXs9lRK8olGTms9Ph0K/WP
 5NMFUXdiZBjS2DOt/Ohp+Kc6KJ4PKNrDgHtbR1TUTIDz5kCyE6bAJ+clTsCJkyBANbi9N5FmB+I
 BFqpMCQY3PdlhWSJ7dpSE5p6GqwSTRcOBRbwhlHGl4I1M5IVvEVcS97bCmtSvU5l39sGtUX2a+C
 Jni7gT1Xti+zUJG0qS53Huc+S70Jw6JlbMJUbwUKNDXQNXcj3qnXx23Ll2IA4oOqr1wGJ/FZnnc
 GdtdCHRr
X-Proofpoint-GUID: Pepi2dil-FBUe-dcImZwwi4TiFWHp4Ht
X-Proofpoint-ORIG-GUID: Pepi2dil-FBUe-dcImZwwi4TiFWHp4Ht
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=689d10a0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=ShNZIzb07UMatG3o2d8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120119



On 8/13/2025 8:00 PM, Konrad Dybcio wrote:
> On 8/13/25 2:35 AM, Amirreza Zarrabi wrote:
>> Enable userspace to allocate shared memory with QTEE. Since
>> QTEE handles shared memory as object, a wrapper is implemented
>> to represent tee_shm as an object. The shared memory identifier,
>> obtained through TEE_IOC_SHM_ALLOC, is transferred to the driver using
>> TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT/OUTPUT.
>>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +/* Mapping information format as expected by QTEE. */
>> +struct qcomtee_mapping_info {
>> +	u64 paddr;
>> +	u64 len;
>> +	u32 perms;
>> +} __packed;
> 
> Please use types with explicit endianness, e.g. __le32. I'm assuming
> TZ will always be little-endian, regardless of the host OS
> 

I'm not entirely sure how this point is relevant. As I understand it,
the core that populates this struct is the same one that accesses it in TZ.
Your argument would absolutely make sense if the host and TZ were operating
on different cores with distinct architectures -- such as one being
little-endian and the other big-endian, which is not the case.

Regards,
Amir

> Konrad


