Return-Path: <linux-arm-msm+bounces-41807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7829EF6A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26D771899DC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 17:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0907A2210E1;
	Thu, 12 Dec 2024 17:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HjesebgB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A4B216E3B
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 17:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734024153; cv=none; b=TFhsowTm+MYQHAGC0ra5SsPgaQ+XiepXDik8RFGRmc9LW1KffIqTffI3tkyTy9od6zcMDzr+wd30YnkYlfxBJTroTwbb6nycveUIV6JLEw3DdRzGHNDBAatDmMR7wTcjM0iJTMcNTV4L2TlIdtNP78mNXJ5D8lgTMxKElQL3Fm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734024153; c=relaxed/simple;
	bh=RzhQRZVFYQhLnpEqkHEQLdhOVQLxSSPFxiLWiauqBoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RxvIZWYJBVpAbF9GwH4Qbhk2afyW4Pe7orLohTGvu5We4gJ7ym7aIWbAnTsEf6mdpWH9buWtZri3twGuVygNq45yoxHEBwTFoJN0X6974lahMbSc1d5LnsBmk9mAACrltMGf02nR2+Fu9djHZeUNSGQOLvwsk0wpe3GIaAupSoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HjesebgB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7qAKb032186
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 17:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kXI/rMwXSEtNCPJzmcPZTN62CU/qS5wBtOEw8hBRpg4=; b=HjesebgBHZtRhf3M
	VPqsjiVCwCD6w7SkCqMshw//P2dgEPvm/RdVYUt7SLj/m6tK+Y4Qg8opOCXPnRjY
	bjk0x3fR9G0y1a9nZGCvPIybQ1/ERSafIVxMbFtatoUOAuTPdqwgK5RDW87/tT0W
	+5Mx4D+2+SuI/6VJL/u46vAkuwL3IwzjA4sInrzSWdRxKQDKnEc3BHPT9iJkmxlE
	TLGGACVeFvaBoWvhP0XVDPcq7OZYKETts4u4xt4/hFs4rPd2Z7KhBH5PcM64dbhF
	jTsarWDgleoepFHWYN4bOdk2pAJnMQIrOBejRFWIJR1ZoDMzIPZbMwBYe6vCbSR2
	A9ErWw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f6tfcyd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 17:22:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4675a6e05d7so1641391cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 09:22:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734024150; x=1734628950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kXI/rMwXSEtNCPJzmcPZTN62CU/qS5wBtOEw8hBRpg4=;
        b=P8WJR285AHeSFnnzr7CkO8gDVfDeGkFNlnm/INbhumCze+wRy3gbaQHvEplrxmFFuP
         UFtCelPaTJgoUIVAyl9mlThv3u24KkvBUJf3PfUFyjLhjLCILMNE45Go5zcBqPZTZ1x0
         RvNceShhVyoyAvU/Z8QdWhWci324jNTumBC28infRlv3aHscsmdKbt2tdIN5rRvblGjz
         OnfX+ShD4LQ99tkITxqSYbQx5zMAHPCF6iR49FM9G/Rek3AELNuZIU23t/E0KSBimznK
         +GPK1GWgDjjthVUI9P6maDVnyW9mr5cLR+y77+09m9BeSzCM+zgJJDqK6mqQl3S99IMD
         k7eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA0Boy5NmRZbF+7Qf56rRsr0kQmltnw+bek4VL5+2LBjDGEwFN7OK6dXomVw1YJPoAQKKTpf3rYFmCTNJE@vger.kernel.org
X-Gm-Message-State: AOJu0YxENKRNgqz4FYo8rI9CCekyyhJzR1XLyyc2UhwAj6jVFgm5UvDj
	GAXpHIzk6WL0BnBui9mphSZT0tNFu8cJ3DsHFXCOxFg3MGuqv/t1/MZGF21pW2JoEHbQpDbQR0u
	DDtbfvRTZwleBDZ3iqurOX1B55jRYoVdsDMKJs6vVbzcvNMQYEryFohO35/rYXmFH
X-Gm-Gg: ASbGnct6KdwRhRdqp7AsHMCT0wxZqGIozdq7R57tI6CKQKkSQDRCRiiZJcEq3pHPmcX
	2M2Klt35wxQ2CYjfL6czw9Ec2dJny7CTpwujd+LLxuRgfwZXt5wNfFi9csuJLU32saigwudoMFc
	tPM7OkjNSJ48kKB1FdNG8J50CnZUAsP24CQ+PZvVVVL8JdEn7ya7cG1/T/VDvkNjEBpY0PLlf5G
	0Xu76Ts5nx1taRWcRu2aK+x+9es5EnPvPlv0cE+xTVcY5zn6ngladL7/RYjcczcHDy2BFlMyHVJ
	af+DNz+dYOiKO9B3H6NGly5o579YxQuEnNz5tA==
X-Received: by 2002:a05:622a:14cd:b0:467:5931:f6a8 with SMTP id d75a77b69052e-467a169b447mr6579961cf.16.1734024150506;
        Thu, 12 Dec 2024 09:22:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHudtOde+f8IPYAkK5rDmanvroRSGDkZDifNKDKSR1bTTXjCRopc+9Li9B48WzjRmEYTZPfGA==
X-Received: by 2002:a05:622a:14cd:b0:467:5931:f6a8 with SMTP id d75a77b69052e-467a169b447mr6579811cf.16.1734024150105;
        Thu, 12 Dec 2024 09:22:30 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3df2fc65bsm7743885a12.54.2024.12.12.09.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 09:22:29 -0800 (PST)
Message-ID: <ae57068c-5d73-459d-b319-46a582ed7f3e@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 18:22:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/14] ASoC: qcom: sm8250: force single channel via
 RX_1 output for qrb4210
To: Alexey Klimov <alexey.klimov@linaro.org>, broonie@kernel.org,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com,
        andersson@kernel.org, srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
 <20241212004727.2903846-15-alexey.klimov@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241212004727.2903846-15-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rHUvFGhIR37c1Uj61ugg_S67hJEw4toO
X-Proofpoint-ORIG-GUID: rHUvFGhIR37c1Uj61ugg_S67hJEw4toO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=768 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120124

On 12.12.2024 1:47 AM, Alexey Klimov wrote:
> In case of mono configurations we need to enforce single channel
> output. This is required for audio playback on QRB4210 RB2 board
> since it has only one WSA8815 amplifier.
> Implement data variant for qrb4210-rb2-sndcard with
> sm8250_qrb4210_fixup_params() that does that.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Would it not be enough to set channels->min = 1?

Konrad

