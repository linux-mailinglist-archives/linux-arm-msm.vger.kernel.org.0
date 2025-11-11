Return-Path: <linux-arm-msm+bounces-81296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0AAC4EBD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 16:17:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BC8D14E7E38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 15:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3DA935BDD0;
	Tue, 11 Nov 2025 15:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B8DeNhzL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dAzojFK5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1002035BDC9
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 15:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762873864; cv=none; b=fcRWNLAUX8Rt3Own8y86vj0tBX4c9UkM9CRr94UhM+hUs+hZI5btFUxv2ojKCJwwx07VsNermPiBcPBdlcsSTxHiwnnMU1IZJ4IFz/DzAQF8wcmXUcDXSLMWy1mdK6dhg/LEcBUhqiK7cmPoDPr/5hmqfFv8OAglZMssV3vX7PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762873864; c=relaxed/simple;
	bh=TjShl+IbqX53wJVlpQ2cBl4pqeuDhsZG859FJQZqCyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hv6MFq3lgPqP6MOyw5htEtpexdS/6N4+8sLzeLoFZaocJRFQFHynyI4xz5IlqGxHAV9AUydUQx89dmkK2kboWDDAE4P6+9iw7WMl2K0ZfDl20nWvoVmd2CMlk5Nn3/JGBXhpNcPQzZUXe7qQxA7fkuVF97JdLPgpLgFrfRWXIpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B8DeNhzL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dAzojFK5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGHoa2250537
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 15:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NtWhBlV0ZGLBZySq8b2IGhCN1uzwyRzojwI9hN8eLNE=; b=B8DeNhzLRR4TLQlS
	pZkxFgPSE1kjPcDSeJ9xSSRkLax9QEp6yF2Ok3OwcqMUb0IE26fRyynC/Pp7e8bK
	Di0clgLVs7MBd5qpGyS3GGOvf+AIu0n/sipEjXvrln1ffkrSvdAr3mf9Du7irGNv
	9npTC7Ny1z46A/KndkWekKGI4jbgPzAOSL1MZxsxjvpgsBGNd86phFC7qMemy02O
	dfESceNQtYVskKYvJp23sRRCJXuPp/T5KCjHbXGXwfhxQZ9qmHyM2RJDxGAMF9/S
	EHtbw3ONpIu5M3IHIRUwizcwgcF2zdoxTrHSbOEXTV/pCvscZ5IScHKKk1eEsc7t
	bpyPZQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abxxu9mg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 15:11:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b62da7602a0so3891713a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 07:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762873861; x=1763478661; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NtWhBlV0ZGLBZySq8b2IGhCN1uzwyRzojwI9hN8eLNE=;
        b=dAzojFK5OSdY1GXdRP24z8sV/RzCnq7QqUfIiJ09K99yrNy/j7wE/pv1si/EbdIENv
         3FNmdTf3F2hmMZIeTDKhh5pIdLomRPD7NY5cvtsz40Qa+4NYDsccjhFNKKGngIlnhf1C
         3k9CZgoS/Xife7QCxoeaO/NkhcDPEVSzHQc1dH8Uf+7lYiawf3FDl2r21V9IbSM76Akr
         GupSI1MAOZHflvVoy4y3tl33APzZYuCwJ8hQpjA1QZT8FVBZlNDEiyzU4BtX7sHxSlQR
         m56Jp82F7BgVsAH2Jk99n08ifZBD/VVo4GursHAMgBOxFBuEcUxoDOYn218BGPpPrRJp
         XGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762873861; x=1763478661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NtWhBlV0ZGLBZySq8b2IGhCN1uzwyRzojwI9hN8eLNE=;
        b=PSXm8bJotag42cqUZ5q5mCKceWi8k7jdoN3TrDfnNxNY04pQ8LIUj1PzkzyMPXuLxR
         LescT82eQrNaef2MaW4E6xkfdNboMka66PEOLH2JZiMOWJUMxHbxtVuFq80iPMxAONX+
         L1ysbH16Qn9B0ma/TPXtcX57SpZI8tGVFayocZ7jDd5H2ku9g4dschGvoYRZb8a1d2Vr
         hICLuZA+yuU2MErRhgo/70KkYky3Nf5Bm2J1SDiy6Ps2VkqOQPLdj99cW1gji6flG3TS
         0KgfGsQqwzcC87O9+B+grVnGf+leefv+Y1u4bpy4RNsOBqHrc/kwf+7hUVBWPdxkptLx
         wBuw==
X-Forwarded-Encrypted: i=1; AJvYcCVsp2ozAT5SClRD2zAccampz2IDEyCjqUEmhAR3kNOOxhYZs5mREVkM9VIbQMQPTDVFDfwu8sWoQqQrvawe@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2TGHH/+Lyw3RdSk7dHSJ7BG3gKptaC5Kk3evfnhigBO9IsCEB
	hWjMjS0Z+aYyn3VbLCTVq5n9xV/N2VBDFNmoMPXNCqOpjGI/Li6RcEzVdWSJqxY5kfD8A4HVxh5
	XKcknySRA51rnKnh+0xg335NKH13wuHVscSGCJE4NutFuswVCEfhYaYgn0H+0m2hgnJij
X-Gm-Gg: ASbGncuEWbxBZHYEEo6w1omhzAKZbsTgww7WrdLRgz3soMaipkBvp/LINfeLD15MlZJ
	Hc8b4qBq0/IYkA/UzeOKB63+paUsQx1VLcl8a6/+XhFeumcTpQZgFAPjbQZMP3NK9n52Fc0w4bu
	3ws5dM8LX8H3xLtYfOPxU3dideTbK/Cw5LwFR1hPTz2ZdtLn5YboBSYDBcyrPJmNf+zdECEG7S3
	151v5DHaxR/OcbysUGLq2suTfunscWSidyGaJveiF8CemebOzB8BGYa1vAzf67zPmTRjeV2DkUe
	JcvfFUUz0OlpYgXzv9Z9VGPhzQh1eWwTB1xKh9Pkmrw4G4Nf8+nS9mxpYjH9tojl39IMI7UXyVW
	8Eq8LImBuywOJpGM3Bd9Xbw==
X-Received: by 2002:a17:90b:5710:b0:340:a5b2:c30b with SMTP id 98e67ed59e1d1-3436cb21a6dmr19109659a91.9.1762873860801;
        Tue, 11 Nov 2025 07:11:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNf3T6rQRdI+ynvsyLg96H/Cq6hXZuZujE80OuxKOe522yI9DUPjy3z+RAOvPojmWw+JmU6g==
X-Received: by 2002:a17:90b:5710:b0:340:a5b2:c30b with SMTP id 98e67ed59e1d1-3436cb21a6dmr19109605a91.9.1762873860285;
        Tue, 11 Nov 2025 07:11:00 -0800 (PST)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c344838sm14745324a91.15.2025.11.11.07.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 07:10:59 -0800 (PST)
Message-ID: <65714302-3b71-4a15-8647-ad707e056302@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 20:40:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] drm/msm/a6xx: Add support for Adreno 612
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
 <20251107-qcs615-spin-2-v2-1-a2d7c4fbf6e6@oss.qualcomm.com>
 <abf79d96-72c2-453b-aa2d-0626be584baa@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <abf79d96-72c2-453b-aa2d-0626be584baa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDEyMiBTYWx0ZWRfX3MjbWV+Kvbga
 0S2ZjrVuq0ldv3V0/KdPsdDDidTR3QnF3oBbZAUwWnaYrefRgAsML1jykBUE4MhYXaeFRaO2JHY
 A3Msc8qxkdQ0wfOHw6dFaQfxpoy+HTd9rF/o1Pvpx4ixgy5oAEJNNkPPASGTWWIzIZ1pCP+5dls
 aDsR0aJn8bAbQP/WOE9KFNiCtnCZo9HwCxVYTjsvl+4WW3Z2oLyZ2xnLmyAWZPrOHWd0jAxOGcI
 6fmhpMwyPx4Ln+D8camMUJ33GY4isNf+tmA+xs7HuLuKyKpNz+KBlb5EYpmGFUo22isXdb+3Q4x
 4PxqrXNV0zh3803zY2bi5k+nSLtaEjG/dV0ct5Z4tmCIcChefqLxFAIdQiWoBRrHSdyntKQPGPZ
 tC2clgrTQUl/B5gOe2UGpAvCYLr5uw==
X-Proofpoint-GUID: cK84oh-AtwoyqEb_kKfiSAZkFG0tGe7j
X-Proofpoint-ORIG-GUID: cK84oh-AtwoyqEb_kKfiSAZkFG0tGe7j
X-Authority-Analysis: v=2.4 cv=TfObdBQh c=1 sm=1 tr=0 ts=69135205 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=qJyp-pYZgGMIYD5dL0UA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_02,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110122

On 11/7/2025 2:28 PM, Konrad Dybcio wrote:
> On 11/6/25 9:50 PM, Akhil P Oommen wrote:
>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>
>> Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
>> A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
>> of A615 GPU.
>>
>> A612 has a new IP called Reduced Graphics Management Unit or RGMU
>> which is a small state machine which helps to toggle GX GDSC
>> (connected to CX rail) to implement IFPC feature. It doesn't support
>> any other features of a full fledged GMU like clock control, resource
>> voting to rpmh etc. So we need linux clock driver support like other
>> gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
>> This patch skips RGMU core initialization and act more like a
>> gmu-wrapper case.
>>
>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>>  	/* Enable fault detection */
>> -	if (adreno_is_a730(adreno_gpu) ||
>> +	if (adreno_is_a612(adreno_gpu) ||
>> +	    adreno_is_a730(adreno_gpu) ||
>>  	    adreno_is_a740_family(adreno_gpu))
>>  		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0xcfffff);
> 
> Downstream sets this to 0x3fffff, but IDK if having a timeout too
> large is an issue

I reviewed this. It should be 0xcfffff. It looks like the latest tip of
kgsl has an incorrect value for a612 gpu.

-Akhil

> 
> Konrad


