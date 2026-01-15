Return-Path: <linux-arm-msm+bounces-89193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37005D23AEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5BF89305A758
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18198356A29;
	Thu, 15 Jan 2026 09:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fT13+Q+u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GxDYokkN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12F835B136
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768470146; cv=none; b=p812qBGfmEgDp8xYmoY6VQIkFEeDd+dN2qAPG5WCBx/e0uecN49BEWywrXTosNW6lrv/J6Q7QXHmVJmheBHUpZogJZIJeNalafAftU4dnsgTHvqEkvp/QAHmWkEjBy9+vk4IjCz5jOJ9brLPOJ/lHYz0WQBrqdtV+KMd2JyQ/QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768470146; c=relaxed/simple;
	bh=SsGSsQweMsCIDzBJWAuiqOspn0rF1MfrTnToHW5GLfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ti/CULFc7RnW/Zod8d7RpA8PN/YSdYn0GG2beQKj8Lw3cYlqKB1ZZS9lRtUF+DJiZ2wpKt0SDiKoR4GeUbsDtnxFaElshmEtLw9ga6sXYq3XB0jpiWHIIVlNJNbfozPf53FHGHQ536grVtt80QCV8aMKek3uuwZ0IOTOGo4i7Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fT13+Q+u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GxDYokkN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6foFx1170785
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yui7Tq48OA9HPL3qsw2ljNXc8ZD5lhtis+0sqJdfnvk=; b=fT13+Q+uSb02fIzM
	h4i4rgC545w8qtyAkFc0kJOWypDAqXen8avlkePiwlf3UlPW7cpEApbtlun14AqX
	jGimsMdpQhV17pcZUXmj1FSwXBr49WZn65e2O97tQGzFiVSFgrOKQi58Q4ECfqoa
	7Wuhc1MhZBBj2JFlzGdjDJSIsHW8BNUcbH9quBQ/v7D6PFTfhlY5jS5KuuCCeATj
	ryZTZ0iJ5C2OC9OmIHqW1VFBS289C67L0Xn5vI6exhuEYFwXDDGr5KPcled1K3ls
	0HcUqBY1igIFN6mcsMu02Q6OsvJlBVf1ipt5Kb+gYUKYuECC1PUKUwFA0nIjqdSK
	JW/Z1A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpg84ae11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:42:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5029a8193c0so706431cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 01:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768470143; x=1769074943; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yui7Tq48OA9HPL3qsw2ljNXc8ZD5lhtis+0sqJdfnvk=;
        b=GxDYokkN5XqTWQx0/N6RIGsqPwPBOpHz276d4wsBZM1T8RhCCQVvXcwe1a0zqpemAN
         BHkesya//PE1VMBw2VsiLQrptTh9sKLmYdUXhaiEskHJ2ZFp+XJLfRo0ITkN8/MizDzn
         MCoFKdMXgbgFKXS6RMdvWsotFaZdNadDT1D/sePXxywrEfNj43kbHQp0SphqUU01pKCc
         atPnjWPpkhY0bxNt+Rn6np8EsJmM5T5NTHqyeH4ImolGO+JPg7NGUsma1/o6RjQSmllH
         Mv7GhQUrMXY+WoHjLzWtliyi4+81RzhNmKeXE2/tYO2+Baj90tO6d8/SBiq8vtDHZrrT
         GT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768470143; x=1769074943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yui7Tq48OA9HPL3qsw2ljNXc8ZD5lhtis+0sqJdfnvk=;
        b=R0FUJLJkuHWRkDzG4ggO2nRtsd0BYig3Rt/ztKWG5dwyGBcfpTsqXFy88sI629Lo7v
         57rfVZ1Xx9+j9PqAOYCPbMbDaxvaA97OpQjql9z+Fcbuzq89ehCilDRdw5BlV1gTAbhe
         h9Nm7O81EYTSVWnpIaIBDV9ogH/fbrr/wbryshQjbfjtMn+Is7FlGJU1yyHCZr93JE5w
         ZNSRZmP2m+3Ctws3D6a8YLWg3eJMmxOZUyPeMRsYjKTasX888pUA8KwSQPzy2kRV0mig
         XQmg22F0AYULiRJPgWVFVu+DxyNj2tgBUPY14N+wPIllVp5Ia5oIG8EmNwDLN5lON6xG
         2Yow==
X-Gm-Message-State: AOJu0YxY2tpMfCFrD3D3+yTIOVGeVODCrjZP9t+Q8V2Q0BYgUix2o/l2
	A+9q4A+5uiJgqsOAIUhcb/yhDbW98ZPMV4kxqpptzLpBsLDqohthyv4K8uWocFbzR1hndKu/TpM
	H6VAk2ti+wBZbD/P/yIz+Bdgs1KTZjr7BQ+g6IMy9Ap22c3XUy8FQj9ui/wpGrUmKrPNl
X-Gm-Gg: AY/fxX5IQJGlzANLfDB24y2ZoqjspfnZFtrvok5Pajs5eElknTIo7cvwph1mYau1JsZ
	LWG6OLl6cvd3vF48/4yyLvP3t03iU25yLKoSM1zx9n9N27BzUg3nFF1FXpXC/5zLMGP+ADMHadm
	7qP4vs+fERgTA2cA0SnZay3IeqMmQd2zSQNHmfaP5AmLTmNLsHDSXWppvBbEIo2JnDaEmkypB/o
	7yEF0OvYCWpCbukW0KMEI6H+Zm3L1v/qliA55LFdYMx4/HAaEqlsdvQrgZuUoOHqDpE+l236PZq
	SBTZLJWD4Tu5KjR37tVU0USfkS5H6fZjDeQvzUQJeBoeh6cb30NV3ncuUMPWKx5RVOwzIpP8BLD
	qEQrb0XIxHCf0LQ4yhXs8pXTbeOwgLM+6QqUzJCvcQvsQ6wXjujuiBqHUmbe5w/5Kmhw=
X-Received: by 2002:a05:622a:1301:b0:501:46db:6b2b with SMTP id d75a77b69052e-50148535260mr61573411cf.9.1768470143263;
        Thu, 15 Jan 2026 01:42:23 -0800 (PST)
X-Received: by 2002:a05:622a:1301:b0:501:46db:6b2b with SMTP id d75a77b69052e-50148535260mr61573131cf.9.1768470142796;
        Thu, 15 Jan 2026 01:42:22 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b86fee09163sm1459291866b.26.2026.01.15.01.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 01:42:21 -0800 (PST)
Message-ID: <8b44bc01-4542-4e80-ab16-10ddacc10e38@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 10:42:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] drm/msm/dp: drop event data
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-6-08e2f3bcd2e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-6-08e2f3bcd2e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2OCBTYWx0ZWRfXwyRJx0tQCb/n
 IV5SbxpHUjOCDS8BH/FCTc2F65Cp3yl9qkwSetDfFTv2pJWfjI0CSv9Dy4CXbdLKjNrF5tLgr3S
 F1PygidCkwrkWCFFBylopGatVxBNB3jSBGavkcKShakbUsZLsl0PM2kJE4RphSPkQtUL48LMmjB
 bgUkT8eTH3ZIpUHMc3NDH3ZnSDKEuUjWrmdfwEvK9FALM0vvuEER9GXZDMCsngxgcPzei/dM2Qe
 13SlAbJ4mi1vd46E6nmysNvoR7xpYo9CJPHY8/z2HnqkqXLhTxHecJck3nL8H7q8Tw1tnVIQltp
 3Rz3QPjHoabOjiHSs7ksCmyJMv7ecIQFm+yAwOh50hzjSoI8CTgQbHx8R0OejiEyJkDF/B2WOCT
 sgRghbb5ltMIuj/HHxF8QRVidjqprwwQ8O2CbKv/UqF2accQQakEwo9uHgc2vOI3WaM9IM4ps5i
 o7JIfELupvQ73JYomAQ==
X-Authority-Analysis: v=2.4 cv=IO8PywvG c=1 sm=1 tr=0 ts=6968b680 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WKJx3f7KLcD3q_vraEEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: QHsmpLC-Wd2NyTggtnG4YBIUcQarPGQU
X-Proofpoint-ORIG-GUID: QHsmpLC-Wd2NyTggtnG4YBIUcQarPGQU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150068

On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
> With EV_USER_NOTIFICATION gone event's data is no longer useful. Drop
> it, removing also the argument from event handlers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


