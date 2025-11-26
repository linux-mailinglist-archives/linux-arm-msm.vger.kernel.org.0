Return-Path: <linux-arm-msm+bounces-83399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A218FC88BA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2358134D733
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 08:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FFA319867;
	Wed, 26 Nov 2025 08:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcvbPsqn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KGPRE+Of"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9252C236B
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764146882; cv=none; b=NZVR88AiEDH3xAsGYIQeuKcun/Ptj+H72P88wxOooD58wZUOUaDi2Vbds4n1j5z5hf/aHvoP3HR3JEyTgk+wBex/XHjpZBEj3eKA6P5vvEWgrZX5vh4odO5SticCBvoFBhraVpqDJj26uwgNgbvuXvx0BrEOy2h3ikJtDusGjX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764146882; c=relaxed/simple;
	bh=OQO6HBAEnnltAyp8dQvJsMSoTEOGp2D+YuqjsCWdyP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GW4uJmbwFXjxN8HxQiRbDMZ3zzJhG7PamzwI7TFX/TM/d+MrAjW+m+Kpug23zZ7AzLwmvQ9jXu5TZdUZRvHabo1sFReMVXplAwE0VjuFUD1yyXPVZvKBQ2v6NNvJg8bCb0Pk0LMk2sghiRMJqQxvSkfexrMm24SZO//qBqnrmto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pcvbPsqn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KGPRE+Of; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ8NiFV3255846
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SdNwImC3LzJ2ki+TuzKvgUAdcuqua8jMxzqhHj6xwiY=; b=pcvbPsqnzoFQcFS6
	EOb0qnqQUW4q1aME2bdTSfFpi+9mj3dH11z1qJs/EQf4AKY9wdJXADhhycsfe14A
	9YkrHoogbneEuftWJMAgRU+1UGa2esFloYANlioo+KnI2JXRxeubGwd0lIxAvMSY
	bNv77oQjJhix1LI0y38QPytsG3h7Wb9zEjbA2Kj9UBWXdAj2EYWNxP6Err0+Pt+B
	gQPZGXlz8PEnMC23NhQi1fJtdVMdT+TVlblJTsObAipIm/mKsRBPz7bOGiVPzar5
	FwyuVwB+/ZbdAicb3eoZaE+V5gyXKYe87xgp0dxFJ98QSqy/BX+7DMpPgh0qLSeU
	PHWqKQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anb9c35xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:47:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297f8a2ba9eso145052955ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764146878; x=1764751678; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SdNwImC3LzJ2ki+TuzKvgUAdcuqua8jMxzqhHj6xwiY=;
        b=KGPRE+Of33jNeLYgYg7ZHFc2B/PmliMRll3BIebUJf8/uRcq3wOo2VO1ZuvnHBbU7i
         tmLSy+l3UHOiOXiVFRwUpx0zhc6GiT9SRcKOwDTm0waue56h2YayLtsUKZka0mtLISeU
         fRI107Jlxh46oWW8vbPbXMlC5LptEmM3W6YuxS0t7Ytv5JX0IkyUhBO69Wv1BGaSDnhJ
         C+AWlNF5SJdiatVuGfMyIvzHZkrLT1hesyx3Qj/zAh0L6KZIKzDbzXa4NeuM20B1h30Q
         n8gJbRFo28m+ZP+nYwCvrqGGtm0vA85obaMqqf6QfVbpggotRJ/I0cF2jC+JHnZXLNa8
         xdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764146878; x=1764751678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdNwImC3LzJ2ki+TuzKvgUAdcuqua8jMxzqhHj6xwiY=;
        b=ujnayBDnU9FNEsSSz9DiccXlFHOHe92U6TWuhgOzfOHeHShCfmOsfPuWEuLY9Zhm+C
         Yc3QbaKPZVytenhE+sBqiEWldRZMmPl0w+VvIiwSm7hNkPuto0IONahmycjExGuwAGwM
         CxbuZBSXX2yo1oD7FHNNG08DNg3jc3KLk6zH7xtBEpa6KAacZ/zG/jaRt2iLjArOPacv
         FvAuBSYROhyfXn4kTMuChRVeyLRpZ8fGcG9YJNvw9UOgJlyueFpK4shtK/BrG8ow6VUU
         KvLrI1Qb0Sd9ZORgc9lOIa8UKGWO7dHwVnAZSg9zLst8krqVxVf+nLdTnBfvwWCBLuD7
         V+MQ==
X-Forwarded-Encrypted: i=1; AJvYcCW49FfwIWWB6cof3vudKTU+VV25P68hDK86i56zx9sajQZHTjSPHHesEu9hu3huXt1/HP/orkHVPsH7ZFg6@vger.kernel.org
X-Gm-Message-State: AOJu0YyBMMcwD5oyHPWSyGFBmc6WE6v8U2G7LrU5RuzfseGZC+HaVfOp
	Qmwg6HGZunNzSzfzZCNglgeztcsDPTt5GsG5tBNufTPxYhs3/TT/AWbMpFRTA+CK3DrMFHz8bIX
	UbLozNJWsoDIU5F1lC+cOYwFnrzDYKX7rWy+s1pBVGDvfBxoZvKHAuE2MktdCnWDuxHrV
X-Gm-Gg: ASbGncs24SoNHT/JhFbUIhcuL8kARFXa/MQD5Dse9cLaYUJchRBIntHSN/+6wzQxfgI
	E8a2lqlvicBit/ntqCFfYDhOUxWJRqLXtkR3zgiKsj/u1YHs4ouZKKekINyBQEM7Bnzxvy9yjyi
	yu4CbrsXW3Cw1YXrnnEX56qL7VkXhNZs+/SrHM+KuSoz8valvt+DLEaKi3dIOzbTov+TjmkgznM
	hFa4iK5gztEN+1HyKHwf2hmAXD9Y+YnU1FqPbUmBGW3FIKjiusRqLzdyd8hELxpvZomQZBg4wcs
	wkWd/GGoQc7K3cUbtFySeaZ3TtDAcRS67uyHfZvsXSJV191EAjB0pV5k7Riu/F/oieoA8U65Diu
	UJQ46/lUjJnj3XIQIfld1rkHq53iW5BiyRBtb
X-Received: by 2002:a17:902:ce8b:b0:297:d951:b4bb with SMTP id d9443c01a7336-29b6bf77d62mr241566285ad.47.1764146878287;
        Wed, 26 Nov 2025 00:47:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVmau5uUwIIeMRGSzBCslxSBKu7684G9SeqwfqC2P7iNQUqvcR/lsx7cZCAq5voOsme39tAQ==
X-Received: by 2002:a17:902:ce8b:b0:297:d951:b4bb with SMTP id d9443c01a7336-29b6bf77d62mr241566045ad.47.1764146877840;
        Wed, 26 Nov 2025 00:47:57 -0800 (PST)
Received: from [10.218.33.29] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b2bb7c1sm189940795ad.99.2025.11.26.00.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 00:47:57 -0800 (PST)
Message-ID: <738b895c-4b65-48d5-b802-b758652ddbb8@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 14:17:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] clk: qcom: gcc-sm8450: Update the SDCC RCGs to use
 shared_floor_ops
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera
 <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
 <20251126-sdcc_shared_floor_ops-v1-1-9038430dfed4@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-1-9038430dfed4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: z9D2jP0gtPQ4nH_e7StVtYgimph2bXVk
X-Proofpoint-ORIG-GUID: z9D2jP0gtPQ4nH_e7StVtYgimph2bXVk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3MSBTYWx0ZWRfX5z/h4VUD7lTW
 v8SDcwqzqu1aUW4v7tczGvn5AJLQTPDBO2FskdCa2ICxUH/WvBcyXQAUWvlRZpxb+55bojJ8njF
 V+gzbJzMZ3BXP6bvv5xngb/lm6e1FJRwD5el9TTv+i1jf78BFe8hDw5yOHYLfPc21F3n1ze88Pi
 XG5ESh85SwHQtfpmEsswiy3TxzzDXPDWfH25dwgeHgp/oUhxH3HbWt5xnipyIcr48gEPhUciHIG
 doPPwMLjnGwYx90d8OBYQdPBkel/ngQlcRIpgfOzl5BT/IeQYyba5Sok1GPmyHY2eBguCAQ/g0u
 J3Q0jSox447S+5pa0NH0rB7UPGcGAA5LoUGEz+JKBqICds+XM3PXYK0QmoDcw7gRVOzFKPQWTHf
 T4qc1xIGL2ZLF95eo4OjZAwvTRJgbw==
X-Authority-Analysis: v=2.4 cv=VKbQXtPX c=1 sm=1 tr=0 ts=6926bebf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=OtGAF3PL-3b91V71RaYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260071



On 11/26/2025 9:45 AM, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs so the RCG is safely parked
> during disable and the new parent configuration is programmed in
> hardware only when the new parent is enabled, avoiding cases where
> the RCG configuration fails to update.
> 
> Fixes: a27ac3806b0a ("clk: qcom: gcc-sm8450: Use floor ops for SDCC RCGs")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sm8450.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran

