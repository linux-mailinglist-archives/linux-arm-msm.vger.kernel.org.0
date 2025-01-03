Return-Path: <linux-arm-msm+bounces-43883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1B6A0095C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 13:39:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CC8E7A1CB3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 12:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF001F9EC1;
	Fri,  3 Jan 2025 12:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJ6t4GHI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89C513AD0
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 12:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735907983; cv=none; b=uM5TRXp7K8prRli5Kw3O2fsC8y9zC7zCIKM+Az6Tp8pD5D1oEu/EmbKf5OEkFIKfRxTnmS67ofhUkdSL9XT51mVaLQpeqcV1JyTlHQ0RrRXeivwdLOqPSk0FPUByjwijvj1JO8GX/SHS+hH4bVaPvJ5ucpPw0k4TrMTrt5UWAnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735907983; c=relaxed/simple;
	bh=+D/2I74qUnLCXLMzPRoFaIC/hGxKY9/KK+LLg+RYVUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nEWTi9dVCZ+1fMKdkW0gDaSx8+0HV0ku2w9xr/fmbzayV18Kbzo9H+9OVeA0xnq4ShMK/RUYAmLYHA4un+rq5XC8hhY0AkSOnsbtkXf+h1edthcMf9Ls3G0o17AKtUSifVpa5/hbY3Inf91OCDBKB8T3TM3tve8wKeVJtU4bSnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cJ6t4GHI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 503CA2oh009499
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jan 2025 12:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lZwRh4PseLrHdLpqPBaflijRPt0Pr7IOxsOt0iWXhpA=; b=cJ6t4GHI6o5SsFAB
	OBjd647yfxLWmY4GJSY2O2f8qhUwSfZbY3ruB4AVdGlNPvsoBhppAywvPQpDZaSI
	CqSpjYTJScad1Sp7Mz5iXOfFgvgRPj4sEm0xfwu0wsXshr9xkLSgg64Zw1KK64Lj
	11ALx/y/01RtDaO7cDYBr9+Iz9SGdjcryeLbbc6zrgatqQuQsuacbT2MN3Aextji
	W4YRs1WWNYaZkA0QEvkAL3rRLiLCgE1N6sYY6q/uJh6LudBuRSsWqZCujNggP7NB
	VFzRNcOfBSj3c7quArXxaKT0Bp5zX5ISVCyxtobAyZWqkz2IpftwlxnttwteFRjr
	CJlqUg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xfnfr1ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 12:39:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6fee34f95so28489185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2025 04:39:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735907980; x=1736512780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lZwRh4PseLrHdLpqPBaflijRPt0Pr7IOxsOt0iWXhpA=;
        b=w9oEOxI4WE7dAxH1NK4ZheLv8tL2xkTNlxt2taqN/8xTr/KkvKinHrUHJqAnU8ZZv6
         a40cuEX/q9pe0eTJDluXpzpRzXvJ9PuaH0GwyGS+UB2NuQpG+MJSKB9dzT5W/pKrwS7l
         cv2khzJ2g38yjNiUnAJ/vWx0mz9BJeQdm6028VoGWY1xxyljBsfVZluRzcLJUIVLK8oA
         iMqAjseDzKAsOKgospoUObPwsYeITifN9LD21aMkBUb68LIb1+0cqE0n1lk4aL48PPr3
         2Dr+hoTMDnZBN9E90qoxp1hbDIEHv/PPW3RMeGkEQteKNA48u4gNzpk66aR/4LpGp6CJ
         yqYw==
X-Gm-Message-State: AOJu0YwdEJDVdP8fK22bApcCTjZKwqBVH1bjEk7y6UtqGhXcwNkgxvCe
	3mKTL7sHOJeSoLxHvPSvesJXmhT3c99LUGPSW1UF9N5KefH872Ys6D27bWhahV6BewcNynlTiL6
	RF1+PXXpH1yDV+pcrIRAgbeUTosYFe+cGwtTpCef2K+/wFdPIIAE1XBIFI1M1FtAs
X-Gm-Gg: ASbGncvcmtJgpGzC/skbVLA3WRoZJ7jtKOQeeYPHQY2heSIFt2fz9UWYp1b/40wbpgj
	tOdh6qY6s+3jEqG5GX4ZzRL7dzm24biM5E3oPST1wUxJzBxnH+1crMhqw4+QXG59/fggUcwuVi8
	E/zkMQPN0wDEmp5tseFz8kF90PWXDRj+r5HDypUWlN9z2ScCOGYX9KSzKenD6QtCSe20GSP1Kid
	uRY29QIqpWKIAujRVUng/EWGhm91DnwnRAUepMliYVwtK/0YospQy9qM/FXK9HauFApfuubNaB4
	P7/WrvDIGh6XyOWtJsWyxVAyLQ8pPig9wdA=
X-Received: by 2002:ac8:7fc1:0:b0:462:b46b:8bf8 with SMTP id d75a77b69052e-46a4a9b7558mr309385331cf.14.1735907979731;
        Fri, 03 Jan 2025 04:39:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9T35sLA9E07WaPbgvB2yIVdP5SW11rIxHrqYYRBRo/hP/Iuy8WbY9t+3R/LoFsXxymado1w==
X-Received: by 2002:ac8:7fc1:0:b0:462:b46b:8bf8 with SMTP id d75a77b69052e-46a4a9b7558mr309385091cf.14.1735907979439;
        Fri, 03 Jan 2025 04:39:39 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe41a6sm1914071966b.102.2025.01.03.04.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 04:39:39 -0800 (PST)
Message-ID: <da74c183-9f4a-4b11-b747-35fc21252a4d@oss.qualcomm.com>
Date: Fri, 3 Jan 2025 13:39:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] drm/msm: a6x: Rework qmp_get() error handling
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20241231-gpu-acd-v3-0-3ba73660e9ca@quicinc.com>
 <20241231-gpu-acd-v3-2-3ba73660e9ca@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241231-gpu-acd-v3-2-3ba73660e9ca@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2b7Ss7aSZmHfFUQpScNlVG3eeqPnrATS
X-Proofpoint-ORIG-GUID: 2b7Ss7aSZmHfFUQpScNlVG3eeqPnrATS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=823 spamscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030111

On 30.12.2024 10:11 PM, Akhil P Oommen wrote:
> Fix the following for qmp_get() errors:
> 
> 1. Correctly handle probe defer for A6x GPUs
> 2. Ignore other errors because those are okay when GPU ACD is
> not required. They are checked again during gpu acd probe.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

I think this looks right

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

