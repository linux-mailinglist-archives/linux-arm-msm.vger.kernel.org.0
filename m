Return-Path: <linux-arm-msm+bounces-88814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5471BD19E46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 16:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B11AD307936E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 15:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D32B392B8E;
	Tue, 13 Jan 2026 15:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PazK/Nv/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K8T7p0lw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081BB392C3B
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768318018; cv=none; b=tSDLQPuIw/k0NA29RfhAXcnQt/Go0ydKcA3hd7J196f/+yfwnuQ+ehT2Wh5YYMOc9bmeI8w7Drm9dMi5S0YW3mxQJZauVVIuhINfW+40gsCVe5VjdNt73q8WtfzhuHkH155II5OQDtVhIA6EH7u2fMo23PJLJngQ7/fP+3WL67g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768318018; c=relaxed/simple;
	bh=H9mGWxU5tI/68NlwoUxq/KaGxGic4AYNAg1bQz0mc8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJFfl7SR6RzRkgDOvQrcD3uIjaGgQ7Fm6M6eKQKu7kRAGj8cD5VQn42Ct+jyrbsxh82OqVgBAxmQnzD1eP52hhkXGFkVIlqoZ4L6x5i3amu04ksa6KLggYSA+ddocJZSbI5rty/dxVWfAVYFa/ZhIzxuPUSTjAYCsJkDIdFF8fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PazK/Nv/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K8T7p0lw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DBDeQo4164961
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F1az1Woti5BYc/nrE9F+K1wucFs6vzpU2BiesykC2Rk=; b=PazK/Nv/9u0YNnk3
	4f2m+A63AA6/dckoLcdhElKLR4gyvfV+TzwRMfShfoFjQ0oIlbm/TQcXNQtFh0LZ
	Ksx+/ecmR4UzdyiFD4l2N0dvX/wdoBMidautqc25z6PQCWsz+b/Jn1PGXwufDDs3
	VYmClSeuzwtmrtbwcdld0y2X+/A3rPdo2f9vxCxCJyx/SsJ3kcg1ApwL6JE++WvA
	r8ggYoxRYEJx1UG1uqoRxgNEM7JC1/XIQw47dnUgdYilLVwIikSivKgYN1JV3CB5
	wxc3tOVG/K+poy3XS4tyMrcBlddDAdpETFxRV+DT27Qb95iibWJ1Gttgg+ah5BEc
	6afLEw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnn06rrxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:26:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ffc6560f05so17949951cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 07:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768318015; x=1768922815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F1az1Woti5BYc/nrE9F+K1wucFs6vzpU2BiesykC2Rk=;
        b=K8T7p0lwb2Sdzys8RFWasShW/3ntCtgfqGH+x/8hwhSjfpPsJ5eK4ibp2WiHTL5gQm
         ptSZQ2opDunE0sQpYEwD70myd2wucOMcn6spszNe9++ckQ9pMvSHxVfcHYGf7b5mGczj
         c485milqyP42rtaTTxpqJeLIV/AEwS3vT6NGZNkcsRET+yY1GUejECSlalrAJTKC2EV/
         gumksKP3F8YXxeUoVYjIFdiclEewwgrH5x2lbU9J9IbBsea6UFXIys2fj5UUFnk+H1Bg
         NLkLJLP5/nHG8KbUv++Pz3Pv2he1pVHNOFGE2WzF40slC6bOx8RJK/V1KM1g5LEOdLSa
         HSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768318015; x=1768922815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1az1Woti5BYc/nrE9F+K1wucFs6vzpU2BiesykC2Rk=;
        b=ULKi0wfkB5dj8xNYwRKVQ3T3QvdOxSxA9KPTclPpT+QBchP3HqZTNpebtN2w8lGSaB
         uwodPeT+AamZB9vvyQvJaE8pPQLq24kTjSRDkr79eGz0aPwsECrfO5LdHCWhfPKlSIbp
         lAtRRLkD1edMw1Zm/7nZ809mKi4pSlHfKT6r5CzNm7Mt4WMXA5NN6LnUL0/jbrsD1m4e
         2ePaL//GSYkYjwo08D0my/YH4EO71TABlKOUDJxJCXxAX4J6jSdqp2m9S3R6E75cHaio
         r+4J7hYExDsLoIF6o1GWXpX/9TGdfIvDgyckL86wW88KAzqFoscAgLzZoWijFiGbkuOb
         axUA==
X-Forwarded-Encrypted: i=1; AJvYcCVK03pIWM2AmmSNsMbBYw1U/LEHq5hPbWyG4tOHCGLPPTiIVjIwGloTgYJFCjlWI36ohHuDHPDa7w/Bhbrp@vger.kernel.org
X-Gm-Message-State: AOJu0YxQbwLhcND5GBHWlVLkwmanV6Q5v3OR81ehoCEzgPQ37H+gK/7x
	fUWe2z3ZHOloVe0l/p38xodrI5iILi5Tbfjnwy6lnXIqfqM6osRpq0vBhTkDFV2QV9ItBbSqhFk
	KG+C67T5TScWf/SnGRSFJ1MUZsrScRhWOUSG/y70uEDpGyuzbn6ulJ+ZAwfyIVPCoXZug
X-Gm-Gg: AY/fxX6MmJvgLqlttrrmcOIherxx87zbwYBMzHAU58BVqlG6tYOmqPZU3RusJKJVD06
	9WQjAgv9wJdvtxVtmIQ4gmhvxWh7mcNFb+QehqfTIetakqYKkqe7pdC7SVQ1HXc/QZNjvK2arEz
	frtLXtRRYqpfjdbEowHcw2lQU8sLe1fUE5MRKyedJN9PE2ztCWc6sY0lWGL1pKuXAY4P9M+gvrf
	3J3mEkLU36kAfPStAMfg3+nlh4W+K0kKRZJJwzgsCI66YvQZyKxsuUWkTK+rcQByLCHN88VGzGy
	s1T+e3zPCLRWP3RbRjbWcuSDvHl6c1eQl+jYN0AJJavkD3YuTrCFIvOq0Y7enkcW0ohdBX53dCP
	iFQxKKDOd7X59CnAG9SDjcC7moP9zowRDnOu9gHlQqBs/UJ8/JKoo27U15G5iN9T2DHs=
X-Received: by 2002:ac8:570f:0:b0:4f0:299b:c785 with SMTP id d75a77b69052e-4ffb4acf414mr226028051cf.11.1768318015288;
        Tue, 13 Jan 2026 07:26:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH63OKsfsC1PCQAIfHI6h3nw+uJWv7koCZrOmWbLpsbWAxrJGkd3sfSU3Ah9H1bPnxDS8ArwA==
X-Received: by 2002:ac8:570f:0:b0:4f0:299b:c785 with SMTP id d75a77b69052e-4ffb4acf414mr226027601cf.11.1768318014831;
        Tue, 13 Jan 2026 07:26:54 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86ee5287e4sm1020534866b.52.2026.01.13.07.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 07:26:53 -0800 (PST)
Message-ID: <e5472469-84be-4ae2-97d8-6756f2cb1a55@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 16:26:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] soc: qcom: ubwc: add helper to get min_acc length
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
 <5594210c-ce25-40ac-9b5c-69c97eb0bd72@oss.qualcomm.com>
 <spk2wlfjgrtvkbxk2rzklsdg7ojpcsehl6c5fzaergrq2chpcs@p6s7px3lrtt5>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <spk2wlfjgrtvkbxk2rzklsdg7ojpcsehl6c5fzaergrq2chpcs@p6s7px3lrtt5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ae4HT3uc2HHW-YJXakBn3KI5t6p0BC0F
X-Authority-Analysis: v=2.4 cv=ZODaWH7b c=1 sm=1 tr=0 ts=69666440 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=2hdBVZVomPjqdouaftMA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: ae4HT3uc2HHW-YJXakBn3KI5t6p0BC0F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyOSBTYWx0ZWRfX4FWiEb2tWzei
 s0kaV3kKs+IfY1F8J8pl1/nMhsT7k3VURWC7bxbKD1opeWCINZQq+91Q/7fPmtRP7PvEThJhG5o
 g+qjs3lBaA+IwGtZCqqyo7HIG82EQxCv3AzsupOoiRzghKROydDIbbZJ+hJUyjaRYCRjP9AKKK8
 fRv1u5R0RRETvMO/WfOf3sa35NmjJtcD1ox07t8c/2PHK1EzHNh9aDCQhDc1/EA99CAWh1K0pB5
 8Q6RESFlen8FLTQKxYpRgnB2dH7f5T3jQ4Pg+a2HE0wjMX4ik1RTEedajAcTsB/6BbAj9ZGpER6
 agTo0G4smEeXOiyADgrQC23xtkTKBJeTJMQywUgft4bWxI6x0MtTkrcANepWh3HDUJJpKNG33+V
 R1jEOiDaasH5fqeyhp+NeMcRkoHiE4ewXLt92R44tLxI4qskwTWiTMT8CCpqob1uCNzPU6AcMYl
 JYfFxHM6719595RgrOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130129

On 1/13/26 1:24 AM, Dmitry Baryshkov wrote:
> On Mon, Jan 12, 2026 at 12:08:13PM +0100, Konrad Dybcio wrote:
>> On 1/10/26 8:37 PM, Dmitry Baryshkov wrote:
>>> MDSS and GPU drivers use different approaches to get min_acc length.
>>> Add helper function that can be used by all the drivers.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  include/linux/soc/qcom/ubwc.h | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
>>> index f052e241736c..50d891493ac8 100644
>>> --- a/include/linux/soc/qcom/ubwc.h
>>> +++ b/include/linux/soc/qcom/ubwc.h
>>> @@ -74,4 +74,11 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
>>>  	return ret;
>>>  }
>>>  
>>> +static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
>>> +{
>>> +	return cfg->ubwc_enc_version == UBWC_1_0 &&
>>> +		(cfg->ubwc_dec_version == UBWC_2_0 ||
>>> +		 cfg->ubwc_dec_version == UBWC_3_0);
>>
>> Are you sure this is a correct heuristic?
> 
> No, but it matches what we had in MDSS driver (and I think it matches
> the chipsets that were selected by the GPU driver).

Should we keep a comment that this is a best guess that worked out so
far?

Konrad

