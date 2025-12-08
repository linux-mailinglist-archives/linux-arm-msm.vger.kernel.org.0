Return-Path: <linux-arm-msm+bounces-84653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 729E1CACEAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 11:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DD9C3034A03
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 10:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0222DCF47;
	Mon,  8 Dec 2025 10:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="chg6s81k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D4mu7xn4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB972D739D
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Dec 2025 10:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765191104; cv=none; b=RtZD20z+yMlzf3fRcL0z+t7u7aQFWkhdmWOfkjFibLBIje2zKQ02iwprxP7uPB0arXp90Q+2gxWMtLEk2KDVwvZua8agHs5z4J3wv+xH0bmcL24bfkJhl4kJ4eCkIPYw/VkQLT9zRUL5AA2XWrB1S3FPnW+2wj/wGl9LuYgvEJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765191104; c=relaxed/simple;
	bh=dIjz5i9iOeX6HESxOCDW91r30lKYxEBVxXW2C+lsVmE=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=e9rwvQQuue8o16EXZnTuvroMAHEhyI/dSPb2MpkUBEOmHoXgvkdMoMKjZoWOTKuMcO89OPYqZ+HYmZMejWwGCeghOtRAGpoUiqEqRHy4LIEIhMfyuhVjvIpjOfEE9SXdle4hlb3u08XDUJTDA76kurawMNIr+EXdVmzyhm6Q/Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=chg6s81k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D4mu7xn4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B88aifD096530
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Dec 2025 10:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2FMVvaA+khXcsrH7qiD49Z4xGGAk8UTdyYlOcmd37/U=; b=chg6s81kMRH9B9Mj
	KI4iULNK86fEdXI1RzN5UJni4QmaOdIOPXZVrmqKDNc319ev0B5J/j38nCKzbu8v
	fjxnl67eYBNLC1jKawK1tmIGY7Rl4Iep9Tx6Pe1oS7YiyiSIMQbQLyzKtykCM7mS
	pAKhkoMkFGBjEkT9WAatoFE9/fER86whJNaiM4xIiDZgjgRLADlUNQ4/4JVxepbQ
	Oftv36LbgJUS58WkGMG6ixFeX5jSonkaWDAPHr8L6aP1hmiMEk9/B8ynam7zzL25
	FouQhQZHhq5UbMqFsTI3aFLY8NWuYE1VIFbJPhJhrTTBSZABj5ih6aMqywN+2cG8
	JxK3HA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4awuafrd4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 10:51:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2955555f73dso63047045ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Dec 2025 02:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765191102; x=1765795902; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2FMVvaA+khXcsrH7qiD49Z4xGGAk8UTdyYlOcmd37/U=;
        b=D4mu7xn4iwKamsviTi7HQMKQ7WBF9uUoIZNxyupJp2sy/H/QymwmE8MPRI20N+XDFT
         LrrxU4sRPsOEpyUgyr9mx3FvkKFjK23m5FTUmkisE063On6jsLS4+NCiEHlryqK0xeB3
         kDSFDHSyHBJzuuvWR26Jm9eWOB0/ykuwIgDTWPD2nmxo/bpjVyQrCwLXTe5eRCm8U1oW
         +T08oqbsVW8KPw2QiGMhZQocG82I1SXVfEGUNYXChCF1V1GK/BMn0um8lBPi5rlXW9Vw
         hryUqFdMS6mszVGPqDgkWOwsYpSOuWRfbtfb7JWtZpMcz3Q/6tGkLis9L9KB1HP8PjNK
         k0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765191102; x=1765795902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FMVvaA+khXcsrH7qiD49Z4xGGAk8UTdyYlOcmd37/U=;
        b=Il6y6s5jjJrWQQUKxOJmijj3LYATdZSjOjMVxf5k7kf9RxLDOyyky2kleRAS4c+bVg
         cuF/mHjU5DVz4F6HHPUwbIUopxzpnzji09t0gfI/eudTH3Jy1gWElw2lKynd0flipLdM
         fl0QCllYpldeCCpictgozMdM1AE1MqXGJ4lyFF4cfxZlIwXw+O9UBqLMXq/mS50XTB2s
         d5z4Gd11ttZ59D9nkPfOfNxaoNKtJpycI22DtNE2V9CxQCluEHu5lQqEw4yMSBR2QuqB
         gmez2rURc4Cc2OxMVjHqSdnJZ5lKcyAKHTZilJu3q9EJzje9uEEfOz2wrSTnoIdUQecM
         FAIw==
X-Forwarded-Encrypted: i=1; AJvYcCVWjgkDCpwDIdKzz3Otc2qP0mJ+2mxPFrbOeiOg7D/yep/pIRomI9Qk2iOg0RGkgWBfepXcpiym7Hq9H/pF@vger.kernel.org
X-Gm-Message-State: AOJu0YzaSU0wepwOqTUvzQRZnC083p5dHf7tTmGQcCOgw4dIYrfnhOwK
	RVB+b/gMsV6asFxslVXwioXXVrEeLfcj/fLzW9/aJOQkkzZI7F9PwSt69nCZWQPKKFPJhadlVya
	e1+g0jXoogm3SvqhMqSgeHfaz+nh/VCbCbzrKUbEj1Del7HvN7BwiBJMpy3NezJsAbSJj
X-Gm-Gg: ASbGncsApUxQPNgnFfhHNuihwqj19AxOHYdLcM0UWxApRCqfOhJvw1Xq51ycUpHDcEc
	7X414Ce6B/M720vsdp1EqItnGGEv47gE6wuokU1MjSB/y+ntbv7as5Umlo2t5gT2l3lXzBrEvy3
	6FBzV0XAtYmpB58eByKpYU0Qk8LNzmtdisw433X2j56byw9BG9pF4n5s04hLRoJVGb/wzG2AiVL
	QD+BfbAmlYDa3ISzSlffNqBR+gZXfbSkQjEiY7c+FrRApSbNoIXd0djR3bIYKgTJlhE8MiuaiGy
	plUPDtz/272F+BzH1vb8HDKSZgto0u6Mu8I+jXARE1WpPJgFBvJlOkXKK6mWZaMiIPmnGsMVdLj
	QtLOhI7HdSKBMifxyGIpLvRrQt5Z7sZ89y9QcQ7f8Oyih/J9KXF20SkT3IB9UEOPiFAsLS6/kkN
	DxbJo=
X-Received: by 2002:a17:902:f607:b0:295:59ef:809e with SMTP id d9443c01a7336-29df5aaec03mr56353095ad.24.1765191102041;
        Mon, 08 Dec 2025 02:51:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTsrbmu+rI/O0lOhiPE2m6GbulEKLPj5DRItLTQPuJuAGd0ETWZNT3veQNvA7DX0tWOz3vPQ==
X-Received: by 2002:a17:902:f607:b0:295:59ef:809e with SMTP id d9443c01a7336-29df5aaec03mr56352965ad.24.1765191101571;
        Mon, 08 Dec 2025 02:51:41 -0800 (PST)
Received: from [10.249.8.129] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeac7360sm121133115ad.81.2025.12.08.02.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 02:51:41 -0800 (PST)
Message-ID: <c1fde623-9f2b-4904-8008-8dd9a02a352f@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 18:51:37 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v8 3/5] media: iris: Add support for AV1 format in iris
 decoder
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
References: <20251202-av1d_stateful_v3-v8-0-2f74a81773b4@oss.qualcomm.com>
 <20251202-av1d_stateful_v3-v8-3-2f74a81773b4@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <20251202-av1d_stateful_v3-v8-3-2f74a81773b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ep7SD4pX c=1 sm=1 tr=0 ts=6936adbe cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ywScyDtGrH_zUvzyQ_EA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 5gpuDziSB7Ppa0FdqBfBknyiqS_AxpGV
X-Proofpoint-GUID: 5gpuDziSB7Ppa0FdqBfBknyiqS_AxpGV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA5MCBTYWx0ZWRfX2O1LrHbkNAF6
 /by0VcraAqVBfRFPUz2SzzHqfWZ8j+UU3dl4iBCkcetUe4Gt78SyCqp1Zj/u371XOSkQ8wt8nNr
 rr2EocGycvXgXB4MjjiKSiQaki5Lz9FG8lo2B9/YlITbucsIr0JVQi3s03Up1emOFmVS0ap5wGl
 9cx6Q8MXLTXVb+8OkOCC8W/LgOa3ksTdkts2ATIklXUpv7WDpzWk2R83NKLFV/LAb880qkEKTcG
 Q5iMvcOOwyBxRViJr9hzu8o5XjMGTs0Zqe4jtfuxnvC0A8JphB0AHfOQ+CNbNla42y/ztmwiRUb
 Ay+h5S8zF4AXgp++liIRs1KN+kiAYrBrTD6CvwsEQp5ZY9Och9QYrC+QtcKm3t7N0WLMy28mNt/
 0BKhTXmYE4H5W6BHt+GC4BxPeEVU7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512080090



On 2025/12/3 7:03, Deepa Guthyappa Madivalara wrote:
> +static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>   	{
>   		.cap_id = PROFILE_H264,
>   		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> @@ -759,6 +778,8 @@ const struct iris_platform_data sm8550_data = {
>   	.dma_mask = 0xe0000000 - 1,
>   	.fwname = "qcom/vpu/vpu30_p4.mbn",
>   	.pas_id = IRIS_PAS_ID,
> +	.inst_iris_fmts = platform_fmts_sm8550_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
>   	.inst_caps = &platform_inst_cap_sm8550,
>   	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
>   	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
> @@ -851,6 +872,8 @@ const struct iris_platform_data sm8650_data = {
>   	.dma_mask = 0xe0000000 - 1,
>   	.fwname = "qcom/vpu/vpu33_p4.mbn",
>   	.pas_id = IRIS_PAS_ID,
> +	.inst_iris_fmts = platform_fmts_sm8550_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
>   	.inst_caps = &platform_inst_cap_sm8550,
>   	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
>   	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),

I noticed that you didn’t add inst_iris_fmts to the platform data for 
qcs8300 and sm8750, which will prevent the decoders on these platforms 
from running.

-- 
Best Regards,
Wangao


