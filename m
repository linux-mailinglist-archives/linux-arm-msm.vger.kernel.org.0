Return-Path: <linux-arm-msm+bounces-75467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DACBA806C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 07:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED0F717DD76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 05:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06DB4281531;
	Mon, 29 Sep 2025 05:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ghj5Y0Pj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704B1215789
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 05:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759125131; cv=none; b=CmXDWWJTwhih3p90Qzfzcx8ihBskWmNLdCzJ1jS/tiGzwPavyxDbr0WbHyf5yEBSoIwnPKMgpmgjKDFOnAB+kp3IiMqMu7zv6FGadZmweUIbGZ+zmJe9iNrEu727N/luJN2WBKHStWWXxvPBIUSERXXICI1DeR7rdCuP382pUvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759125131; c=relaxed/simple;
	bh=XUBwfWdpgq5g7qZ2fkMwmcj0ZQ089xhmdCE536NdRcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kTqD2sTx4uxh3h2UDwUc2VRBWkajy8ttg+k990xPyc7MGFYih9XigXugQXoJKbTA/lZGb+bUYjvmDomX3vQqZZBRgn5iFeBex9no7gT7b4OJiYXHeKPbqBOMIIrfKwdAMqYGH/LSEXWHEkez1HnkC/4wYpYu3MeeMnXdfpA+mM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ghj5Y0Pj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58T0jStr022203
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 05:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bbHMiANAyI5VpOiOH9+PkDIHUQcsra2Awt7fKme/mwc=; b=ghj5Y0Pj1cimy/6o
	lQ6eq4rbR4HLdMBNyl0net2Yt2AY7sxbPz2VHq8cW8q69RCfGpjQhvxUF4gsixwz
	+1KuX2A2bvoLV64HDRQPoqosSUWTsYFmlat3pftJUuKSyQ8V/CWf7IrL1A7rnvYH
	iAyvrQfpxx06f4DV526JkMWcpSXKHRmE/HhDgc+EKNwhOzD4j+B6Ts1Tht249uTZ
	hHWQOwbJxR5GSBZ5pCDOoCOlJyr8cP1URwu56wJXdf0en2b/CVSdLRzTdZqfiluu
	jxT1Bk8YW5QItweIk69i7iTO//WgapYlh8KCyFyJ2tsQyz7LVOOS6w9qjUNxbCMb
	4JxDqg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5m30b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 05:52:09 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7810912fc31so3464711b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 22:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759125128; x=1759729928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bbHMiANAyI5VpOiOH9+PkDIHUQcsra2Awt7fKme/mwc=;
        b=XWr235qqS+ZctOeCO110nrOi2JYiHLi/xx1WJPutWdTUzGai8x4rxu4IdeDkodpKdT
         IbFmTBqP86bua+6S+ObO8ENJJFYRLSofAEcaqustYALecGPK/PXlpMpC1zbADJfvLAL+
         P7TfLYg9X2e7W5sO96JBn+Xk8cYpbsN0TTYqT6wtW50W5OTEn6XqXnLGeyzm+wR4A2Nr
         uinDLP9L+hHCNeU83Y/G+FpSBvm+Cz1FQd2eK1HMFnEGNyWWdUlgryBiNUS87cloGhAM
         SK4dKTp6KvNu4mID0D/tELFtYv2q/sX2Un51Hedgd7rW5k4JY2u2qGBbh5AWrWtBgz86
         OuIg==
X-Forwarded-Encrypted: i=1; AJvYcCWtcQTMXbtBj3w3JfDANDVW7lOv/X1VrWqGfjaQCV0CuToV5TMjat8McndKrj7tAf52L/wfw7KlOYIqjIuR@vger.kernel.org
X-Gm-Message-State: AOJu0YwX9e6SqStpgxvJwB+7/ZXYTM6IlCyuwDq2Zp7bfrEpd7NZQW5v
	C19Q7Xi7bMdvhphaYJlWsMOCKZI9azu685cCnD6bzZ6bWbDS9ui3T2ggPwBn4wePaTHF/vuhoNQ
	ryiemqXNU22h6iMmFUL0T2nd48vk42pbbap812VA6qt1OG2n2Cw3khFmgnMWm6jygYLW2
X-Gm-Gg: ASbGncs+P3Dpr3I4d1NWqFX5Q+zOWPkkvj6k1jbJspJV6+yL1vuUQgeNYeKdlbwGEGW
	mD9HjB/AxmtO8YZ4KNTl1BIrXtX369xuVIJ23GmhAeBouMnGrfJ35Ab/hudA3XQTcnF/qfnqy15
	1XarAIMofjqZQ0PdO6xNG/B/JIH7ltBj206ib8jYlZw/ShCD1sdIwKMlGvkrSKRtJYBBE6Lwu/N
	YTGLCMTJsxCR+F7eadxjbkqOKUxq/tcTkVRS8C+BfFM3sIZ6JON7P4mUjxVG1LWxX/cN2PG2iAe
	IBXGz/LX2odnvpc19/DFVLjyMUB0US0/yjvEBPYJ3w9WNkYQr6t9w9mFx2/RNEDNflJOV5+1BiQ
	KD74=
X-Received: by 2002:a05:6a00:3915:b0:770:fd32:f365 with SMTP id d2e1a72fcca58-780fceba320mr15850342b3a.25.1759125127943;
        Sun, 28 Sep 2025 22:52:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8QHbacnDb03pS+a1cSXE1NrmZSWsLadYC2GBzyt68+4gmxErOu5O3Q9uGrkNveCF4qF3Z6A==
X-Received: by 2002:a05:6a00:3915:b0:770:fd32:f365 with SMTP id d2e1a72fcca58-780fceba320mr15850309b3a.25.1759125127505;
        Sun, 28 Sep 2025 22:52:07 -0700 (PDT)
Received: from [10.92.183.157] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-781023c2b29sm10258850b3a.36.2025.09.28.22.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Sep 2025 22:52:07 -0700 (PDT)
Message-ID: <d77e580a-8d55-49ba-82b5-a1d868dab572@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 11:22:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: codecs: lpass-macro: Add support for channel map
 mixer control
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com
References: <20250902062300.212021-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <708dc6e4-1566-4c72-9f3a-a34f935ac247@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <708dc6e4-1566-4c72-9f3a-a34f935ac247@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zQxAdoZIfSqULLcRSHmYW-oQAHgQxwgs
X-Proofpoint-ORIG-GUID: zQxAdoZIfSqULLcRSHmYW-oQAHgQxwgs
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68da1e89 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=o-7Fb8226cIMJVCjAR8A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX7urqwG/PapHL
 nKwrugOSczbmGFjwxtKoEw1m3ZByWTuYQCw1E/DGiEklHBsJnKaxsG8zGf2t1YEb4M0FvPFDGoV
 F2zW0j6cjk1Lv3R/CKFNlKY4TogjiHmQDYhdqT9vJL2JZKXz9vQwOVzFG7zDRyVOu6uRuzfU/IR
 PXt+VRLACP2RMYNmshKpb78GDbdpq4mcqBw9NHeJ5P1Ulh5fMVu075Jj9FyXmB6veCW99KmAY+i
 YP5wRz4b5PFky3GFCl0XQ0fogYnTljLDRDd6ORPCXmi8pC28YsEgjxKVFbWjmz1dC9W2ErEs0sT
 8pMoqFOeuxfez55HAx6R5uFZMjNIX1zQaq32T0NpX+k/FV3jcUY7UPdiy7+ytabCpF4Dw23cD68
 nnGv3CmuXyG7L5nn2prfqL1ur54a/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018



On 9/2/2025 6:28 PM, Konrad Dybcio wrote:
> On 9/2/25 8:23 AM, Mohammad Rafi Shaik wrote:
>> Introduce the channel map mixer control support for LPASS macro
>> codec Digital Audio Interfaces (DAIs). The channel map mixer controls
>> are required by APPS to configure usecase-specific audio routing and
>> channel mapping.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +int lpass_macro_add_chmap_ctls(struct snd_soc_pcm_runtime *rtd,
>> +			       struct snd_soc_dai *dai, int dir)
>> +{
>> +	struct snd_pcm_chmap *info;
>> +	int ret;
>> +
>> +	info = kzalloc(sizeof(*info), GFP_KERNEL);
>> +	if (!info)
>> +		return -ENOMEM;
>> +
>> +	ret =  snd_pcm_add_chmap_ctls(rtd->pcm, dir, NULL,
> 
> double space after '='
> 
Ack,

Sure will update in next version.

some how extra space error/warning is not seeing while checkpatch.pl test.

Thanks & Regards,
Rafi.

> Konrad


