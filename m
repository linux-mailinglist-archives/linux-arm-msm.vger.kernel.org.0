Return-Path: <linux-arm-msm+bounces-75655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 337A9BAFC01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 11:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBAE13B002C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 09:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A8E23C8C7;
	Wed,  1 Oct 2025 09:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HO1/oGz3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A572512F1
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 09:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759309239; cv=none; b=S0goraADhXRr4mbXxxRpBXfCH8JpwUkoIwYBwtnXSSFmACDEihLTZ3xV5iYVj1GWPPT5XKG7IchPpEO6sRnP/kDuqBA9tLLDgS0sdViHIk/XAYf22K9zIkQ9H5D+Dovf3Zoj8O9zpYtos0vQC6WEzOAJmdTpCPvnyW5KgzT2v6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759309239; c=relaxed/simple;
	bh=IBGDJ9xI+iaRW69KP/tdYDjC3SNvG6KLpfwYdwnlcuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uGbrtseunDwyYWeJYrrLwH6vbQEXFYTxKAOrD4PF3gS9ggBzSvr8uxxDVGmAvN4l2APVRqoh5WhYL4iyXHZiW5AjEEl87CKOp4rupzBtMIL4h5/5ySGcVU67IyX+smLDf2vVwjVvv7NOQj43bpc1sfeJHQyROAJGWIKDNSpelfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HO1/oGz3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5918Updp027551
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 09:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	szyIyl3ywdRyFDo2nGhD2AXevcSAcrCxsinL7zZgAbM=; b=HO1/oGz3J4u2HI4t
	9sK5l2QiGWUrjQclhV/2nuRQ/svp1NVqOHuYJx7e9ALqBX8F1MoxjwIS7pyk8O6h
	iGypkL2LUmm1hnq5PCl7VmGc2nsCoWtvp+Aim+z2R/Uq5JB3qarY+Mw4mLD1QK40
	hYKwyo3y5e9RHu2KAp/1Mm6GnsBSwBcHfwVCB/H/k5j/S+/dNdDRXA9J7Prj3PvL
	OaetW5XmlLhZYYMZh/beRXMi6Hj4GaH8lE3dO/J+NCBXGf8qhOfOMpjxmtdDdxUx
	Rm9HXxhBTOFFa9I2PmQkBZMeUBgl4tGM/hKUOcRGrTCZos3EkFMujueNtj6TRHYI
	HHwBVg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851kxjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 09:00:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32eaa47c7c8so6244376a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 02:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759309236; x=1759914036;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=szyIyl3ywdRyFDo2nGhD2AXevcSAcrCxsinL7zZgAbM=;
        b=WNPPvFrfRtPCVIBSEgn6GIm68k9WQ5pIzH8t/0EBzV0LDuz6G+3W3RBs6c7/s6amg5
         NQXTRWEH7mepAVzAgqN0ii9NaAfaMMlz8PTGim2z87/TEpSiIpZebZLwTdK7SOGMNn2V
         DEy//KTxGqJIVV5UgsiF9M7LRS2BR/rvaX1YoIFo2MK2Yac99+ScKL7BbEKLFY4UBiDz
         MFkxatYARyy2JIBrtR73UbIpemGalEVVodZXlBPAsPvodnxQjXbF9sYmDbwne5m34Cdm
         g2qd6qAcFzmen37K4mTqSPZn1RRNCTD1Wjx8MBmzmTF3pyLKa4e3bQFqmVkre3gprbdR
         sfAA==
X-Forwarded-Encrypted: i=1; AJvYcCU/ggVYVdGNYX/O0h+Kk4CRarHyNsJ59JEds6DEXT4ZujlmCauvn4VQLI2c4V/6seXDe7DsHFZpsbZRXhiL@vger.kernel.org
X-Gm-Message-State: AOJu0YzA0rRx1u92Fezzih8bABCoGv1t+kWfGkCcKH7eMdHt1JGRVtVP
	pMSJoC0XTS/ZFQe6BzPjoRf+jp8RxaIKCQxVfk9i2/I8Olqc7+KsLfncRjiS9VsqnaFO6Wi2MJI
	ypLwBdba0es+CIlGkCNrI+Ha8rbKpVcUZoVhbyVGq3jhF0HyHZZVs+0lJ1OGP/KIM7Zz5
X-Gm-Gg: ASbGncueUAF/LrRla3cWhfe4FPhCm/BHGJ64+deWnQQQ38rJbCgwHntE8I1LW2ZA87J
	oAQKQSwqg20kcwZCl1bko/xYOKkNJXh3xAlSRpbqODTG5FpyU+M/QElh/6JaQFtsDMKR0eUZwbE
	lzKgauRoYNSAdywskpep6RcG667UKANl9b5UUm1qGaCVse7FwJSgsPyozzaMno+h/YuArPCJol8
	ZLuBpWk/B98ctLWSSGpyphfU7iaO6zMpZa0MaYTQP2Qrl9c6GzbQyyOf0YxHEZzbaWgrIaDS6/y
	e+K0FMPm41rAS8VMiKI/M/R8+H99VADiOFXPxEVSoJ+42dKew45HyK2lhH1CI98kcjZ4rFTscgu
	ofLc=
X-Received: by 2002:a17:90b:1c0d:b0:334:e020:2f16 with SMTP id 98e67ed59e1d1-339a6ea6199mr2796923a91.11.1759309236410;
        Wed, 01 Oct 2025 02:00:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvv5afgkyPQe8VnW2f9+nAbRJTlLGvTNonccPLdcjNJP/11Dh4oVSSrJ6WJiv0Li8mMWqQew==
X-Received: by 2002:a17:90b:1c0d:b0:334:e020:2f16 with SMTP id 98e67ed59e1d1-339a6ea6199mr2796885a91.11.1759309235908;
        Wed, 01 Oct 2025 02:00:35 -0700 (PDT)
Received: from [10.0.0.86] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6f20ebbsm1794160a91.24.2025.10.01.02.00.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 02:00:35 -0700 (PDT)
Message-ID: <a2303c78-ea41-f5bc-33d1-9f21b9fc55de@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 14:30:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/2] Add support for QC08C format in iris driver
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com>
 <b2538934-bda7-45e1-b368-8dc4d2c6f71b@linaro.org>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <b2538934-bda7-45e1-b368-8dc4d2c6f71b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68dcedb5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dVT4byVtXk9i-ovr3fQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX4l4cU5znHemD
 d2Kqk1Dt9jxn9k/giP93jJpwkc4uCskJWRhLti8C9tFdppvT8cI1vQBNcSrEa0qwdGD64WlBH6J
 JkY06NnpMUPAV8zJZymVc4lcIPkrmDP2tPAGgAnIsYjMELiRXx/ITYluFYwxhyxJ6qZShNeek8g
 nkgdJs6+NR1DcE7JNOknywQL1ihKsTdiZJ4D8Wu1SzjI7TO030eWYnV+NuEj967Tb+AB5K1mobl
 z3xf6IPTGF3q5DjyDduMnuLPNZHFYHoPg1Ha8CftSD/fkZigrB+bnoVFkIFfkQkFdUTrB8mq7iL
 +h7RgP6Of/sv0tOLdtOCa7ZnxTUe3/U6ZEnUd+t8xlVIFV0uLRI5jdKL5cccs0QP32YY2A8t6Js
 5gJvOt1QRAqFn1r+62k1/nGK19Esww==
X-Proofpoint-ORIG-GUID: PpS9Wx0_b1EvPC8uBZYlrOnplTOiuJY1
X-Proofpoint-GUID: PpS9Wx0_b1EvPC8uBZYlrOnplTOiuJY1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032



On 10/1/2025 2:09 PM, Neil Armstrong wrote:
> Hi,
> 
> On 9/19/25 17:47, Dikshita Agarwal wrote:
>> Add support for the QC08C color format in both the encoder and decoder
>> paths of the iris driver. The changes include:
>>
>> - Adding QC08C format handling in the driver for both encoding and
>> decoding.
>> - Updating format enumeration to properly return supported formats.
>> - Ensuring the correct HFI format is set for firmware communication.
>> -Making all related changes required for seamless integration of QC08C
>> support.
>>
>> The changes have been validated using v4l2-ctl, compliance, and GStreamer
>> (GST) tests.
>> Both GST and v4l2-ctl tests were performed using the NV12 format, as
>> these clients do not support the QCOM-specific QC08C format, and all
>> tests passed successfully.
> 
> Sorry but this means you didn't test the full decoding and encoding with
> GST and v4l2-ctl using QC08C ?
> So how did you test ?

I have tested the decoding and decoding with QC08C using
https://github.com/quic/v4l-video-test-app

Thanks,
Dikshita

> 
> Thanks,
> Neil
> 
>>
>> During v4l2-ctl testing, a regression was observed when using the NV12
>> color format after adding QC08C support. A fix for this regression has
>> also been posted [1].
>>
>> [1]:
>> https://lore.kernel.org/linux-media/20250918103235.4066441-1-dikshita.agarwal@oss.qualcomm.com/T/#u
>>
>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>> ---
>> Dikshita Agarwal (2):
>>        media: iris: Add support for QC08C format for decoder
>>        media: iris: Add support for QC08C format for encoder
>>
>>   drivers/media/platform/qcom/iris/iris_buffer.c     | 17 ++++--
>>   .../platform/qcom/iris/iris_hfi_gen1_command.c     | 15 ++++--
>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 21 +++++++-
>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>>   drivers/media/platform/qcom/iris/iris_instance.h   |  7 ++-
>>   .../media/platform/qcom/iris/iris_platform_gen2.c  |  1 +
>>   drivers/media/platform/qcom/iris/iris_utils.c      |  3 +-
>>   drivers/media/platform/qcom/iris/iris_vdec.c       | 61
>> ++++++++++++++++++----
>>   drivers/media/platform/qcom/iris/iris_venc.c       | 59
>> +++++++++++++++++----
>>   9 files changed, 152 insertions(+), 33 deletions(-)
>> ---
>> base-commit: 40b7a19f321e65789612ebaca966472055dab48c
>> change-id: 20250918-video-iris-ubwc-enable-87eac6f41fa4
>>
>> Best regards,
> 

