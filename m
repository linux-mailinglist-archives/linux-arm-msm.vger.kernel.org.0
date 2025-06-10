Return-Path: <linux-arm-msm+bounces-60769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 302D8AD358D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 14:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE3D81897E09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 12:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F279027E1CE;
	Tue, 10 Jun 2025 12:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+xFVZv4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB8725F974
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 12:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557149; cv=none; b=J7jgzVkzHL2QWpxtaJ0Jri5hui4D3Y+AxNHfPTaJai8HcLwwX1lMmvGfY1+q4kgwloDyK52i4sxd5tMYsmkRL4Xeq1Px/C1dtVI3Tdkk+O1QXSLemCUNB4SRXQ2M+JnNevbQ4g8jtimT60up6KL4YCLCJRCi0PIFl5mfQaIWxpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557149; c=relaxed/simple;
	bh=pFACJJo3+bqCi+jn8eJR36xw0uNvwWRpVBqS3TPNyPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ner0RphSU5GYqO1DwdZPkXMuuorws3Ek8PEIIFycRwiw+Pld3c0/she5yk2M+JdltVVPBz3e3erKGnhm5XEArCWtWG8r/hzTO/21Jh4vOyS2b9BgZ/eMjreZ9n3tYw1pNLsggPHQx3mCUTzGC4/ubFVibH3JegH/NJIkj5XQJgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+xFVZv4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8N8Ju027826
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 12:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h6vlCxhSQUvr82OIu6Fr1YYqY2ncYKV9HsLI2TKQjvA=; b=O+xFVZv4445XtnWy
	J+lVZ9O34FPA0XJVcZ11LUaUbsEPFvdYx7ianc2oPlQuCGwtmCY8BusCljtkalfF
	NVWP4JZbGRiwshmTnVHV0Op+WFJx6nyR3zBloNDJ47S/COpvvw3WyTo/2rHzlL2K
	COVLXIGiR2vHhi1HsmVPfphHtmfab0bXxrUbxCZDzvLUAerdbw9MAxLHtp6Qd/2G
	LODITej0WCU3gl6yT95aDB9W5oNNyn3uA/Z9F8l09LyU4eoLE2lsFWc+HkOUOJpo
	KC8oWvN3bpoStzyaXRmt30qM80N5AFAvp98+2v9wg3WLsVwKWsL42NXE46hoS67D
	VWIHoQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqch7km-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 12:05:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a5ae436badso13077021cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 05:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557146; x=1750161946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h6vlCxhSQUvr82OIu6Fr1YYqY2ncYKV9HsLI2TKQjvA=;
        b=egj8xSuCibV3CFylov2CEewO60I7eY/oAbb1Ukeo5T5ZnATCS0tJunpKSurFvH0b0o
         P3xwaC0KzEz1QLgM76r/tJihmmEvxdFXomgL1mWjrWujm8TlOlN01Z5vGPmzDQKRuJvK
         AwU9yXDAIwDI+wd9NyvUHLkmeZkF4Fsd/SBaXJnVxr4hnC2K7J/nBzwaK9Q7c7sq/Ogf
         FTE5rCG6Cu6ymh828r+hUCeqa65THZcAld6Ollh1oJur+bnaRQrZUDdYgMWmA4+Bq66h
         EqdzY/46e8ClCPPquVl5ghv0Agpg0ae2YAmdO76aL9zzE3pV8f5Vsv3R1TySdDsqEG2Z
         2o1Q==
X-Gm-Message-State: AOJu0Yzft820+iWfZAZCd96KfTeOC1DuIwiVYqoVa67sGLdEp15puvoa
	YZRhWhOfTtocR3HgP/3cOZWggkvGEs/ymhYAdbp6RoFvhcTNX3MUDaWwADVXAuyuhZJ5LiTEHti
	T/Yfl6yqW1szbIlbloQEwDPCn2eHaxMBr9U+7UiUfkuvBd7e8LTSCl0IJRgyY+mepyfSr
X-Gm-Gg: ASbGncvrMxVaLGXgn76rDeUHco+NyE/iZc/F+j7HxGY6vETW3E+y2iYaJ+OLzZ09ZPC
	B36nZfQt73VqaTfRR8ICNP0d+uX5PjBOhbrUGUmmmXZjCJ9xnjxkgPrDfrCBhgMJJd59qw+Hg6i
	j5w/BVDmXBD3tdwnxCDGjgvNspon9kcgVMraHMnpfTQjZBMK0jlgPiFiyUFnZlVdwA4mYzTRkiJ
	P2l647OG2qkpnqJyRgjpSqPyvlajdAAuxynul0q1sDsIH24Lznwpi7yeV7vNcArrEzPCaLic89Z
	HKAtILuz7hqHMTjAdb4ELD4pdDmHQ3a8vwP6BHb+nQirqXZRjErbe2M/2BQ2lSZcUEIFZ5LMus8
	/
X-Received: by 2002:a05:620a:4496:b0:7c0:bc63:7b73 with SMTP id af79cd13be357-7d33df22c1emr912842485a.13.1749557146341;
        Tue, 10 Jun 2025 05:05:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHy7jnQNdMKK3VoKnfpEBwRY1V91000OKDc59hXFCGtzyBYzwQtBOpr+Q1wE5lNHQT7AGzK+w==
X-Received: by 2002:a05:620a:4496:b0:7c0:bc63:7b73 with SMTP id af79cd13be357-7d33df22c1emr912839585a.13.1749557145775;
        Tue, 10 Jun 2025 05:05:45 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d5f9b37sm710722766b.0.2025.06.10.05.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 05:05:45 -0700 (PDT)
Message-ID: <829d79af-cd66-4124-98af-7819d9476840@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 14:05:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/msm/adreno: Pass device_node to find_chipid()
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
 <20250609182439.28432-3-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250609182439.28432-3-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA5MyBTYWx0ZWRfX1zQFmJNNQarj
 qYR0OePEDn7I7489lNwZv56kSnuLwxroE4hdHeJH2abOew7UQvJIDlGw9sAUr1i+F6PzjHPhbdl
 kgVr1OTpqbGXex7ldN8A9r3AaDkZqXVOe8wWthOe0vz+nepsa9qORxPnMCfcGHSbUIZMNyd1g41
 DCNANR4JRR0kIjnSFgdssDzzyJb/Qir1A0w954/F1y6W0ADrNo3k7r3JR8jbQBr4N54eU45ktub
 SV92KEkBoaMqS1aOY1H+p9c9ea06+xFeDrNn6uR1C8P4h4QiqRpA+jW3iPOpBtQbta+KLasNEcN
 I8zwpg578wPc3msxa5rZv9qkKqYMIbtqc44cYFeihMXT+vySSw5mVZlR7puy39mppecIQNWxQxj
 M1Joq7D/v5a/f2W2Sq+USWsonMMLzYf99MbrogfPonQY/3txufUrVidHzocVUs26zRpGixa+
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=68481f9b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=9tEP0OE30YQ_IqY-BwIA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 0jgRbyp73fKNFvd-oJFV8SURwkt1co_1
X-Proofpoint-ORIG-GUID: 0jgRbyp73fKNFvd-oJFV8SURwkt1co_1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=774
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100093

On 6/9/25 8:24 PM, Rob Clark wrote:
> We are going to want to re-use this before the component is bound, when
> we don't yet have the device pointer (but we do have the of node).
> 
> v2: use %pOF
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

