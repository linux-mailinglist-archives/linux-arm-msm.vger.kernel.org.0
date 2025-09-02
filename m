Return-Path: <linux-arm-msm+bounces-71597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C507FB400B2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91FCF3A3BE2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103361FFC48;
	Tue,  2 Sep 2025 12:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X2pz/o2K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05EA1F582F
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 12:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756816256; cv=none; b=i3iy52VbYJmZr+RHMtuRlFq0GAi5bx1zf93TwuwNfCyfOtkY79lsXBteqClMImtcSAPvI5oc1I8+jM98DS7NVE1aC0WXH8xo/1lTsS8V2g+ro3psy1wbVamEkSblWmYEeIX0R2zge1xZPk1Bcq9jZm+t15lMwYlCML8xOYjHrXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756816256; c=relaxed/simple;
	bh=BNWoXsVDFnok4UFE+T0JM3TKXHmHj1QrThTVFrNIAkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mLI0yLKP4dMfKcc5I/qFiaEc8dfRr/DV/Tanirb4ujqPZs5MDcJnTLAFbQVGOLGmZ7FESbTWRQtlYXjhZZC1Iipw9+rWNjCdyCPJN82zvDv6Rmx0C+TPm8v8nNIpCz6P/1EwFm9eEWV/TkwVP1h3IkclOnvpobKJDeYTxK/EQkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X2pz/o2K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AegwF021463
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 12:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BNWoXsVDFnok4UFE+T0JM3TKXHmHj1QrThTVFrNIAkA=; b=X2pz/o2KGIh9+Ffk
	JkvjpBU4/98fgg347M2ChiWgeISMl1m7Z6VQoXYRnp2Ktj3oG8Ci/KOXqrs7bXqp
	kOkwdFX90MjzqHGFGfn7M+Nn00zesmVj1qNejtLuZFoadckRsurdpS4xTcEbadsJ
	JSkokdDfOhK6CRYNVRo4Khygg8EuZ1eztFrGLGthoipZPEAhvyN2awLdSoqD668b
	hiCV06UNzrzajK6Quj2iMaV+c5n0dkdJgm118ZHQsrGQpr1VaMB+F4tyippbwuCG
	thHJcTcB/vS8rMzMZWerk2aWCXgbfEyoILbK6mPqsIw9i1vlbxQ4pIXNFA+eqZKJ
	vI4EnQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8ryub3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 12:30:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b32216a52cso10029681cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 05:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756816252; x=1757421052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BNWoXsVDFnok4UFE+T0JM3TKXHmHj1QrThTVFrNIAkA=;
        b=GOMZiKFEcJqxhCCkJKrWYHXkmmhizEX5EjAn6GVCsuWrs/mj8AWWxTfnl7huNwDgT1
         Yayg4IDZunJWMQYg3iPI4Bx6pnyPNmIfhUMBt5wUqCdq7HNc8+9qnbUyqvERe7qSK7s6
         zIUqdPmqmSxfzUP1wl2NlR3w7pAw/Ws/p7Wf30vMReq3lZhSA+UMZdTQHtpVtHbZpOK2
         gjJeC9jM2siBHjMMLZayLLuCa3nm4neGlLx2qTxKkE6dpxdgy7s9rLxWwBx6gly/2TN+
         bwbMheDUg8aS34xT2uALxzuvGOplojFjQuiflhASlqMMmYwBbGblbYKvHMm2VK533bWt
         jpAg==
X-Forwarded-Encrypted: i=1; AJvYcCWTNfEV/tNk4l4TgsvL6JxcxXnt5YpsTmIVM/wr+HTWuvpb37n3Kt/xQ8QLt1LwtY+d/iSzMSZ3No9IZ4qi@vger.kernel.org
X-Gm-Message-State: AOJu0YzhlrJAG3calxxfLiqLaw1QDCZrBp6f1ZHDa8ZbQCiqwldblnSe
	eDGZU/w1/UEUR8RgyZ4Np97j8rgLiifzJoHJ0XopOxrkODyblt8zNo/xMYwjGBsX14Sv07VP9uj
	M45XXBv7l3jLnFYmL+uNW4IueHgSO9b/24quPoyE6C8IxWzlBDHxJMJhMCXjPtAxbS4Ir6ZMg7S
	Mt
X-Gm-Gg: ASbGncti3H040yQZlgqf0drQaPeE97BP/eikvU3J2coOoMyD94YuKDYH9Zq5B5RC/wD
	fn2CnO1NKeqjua39ekSzBxB49dMJLU9nOT+OZzyp+vIRe3Nj0wXGSnjJmgUGasWIZVxuToaOIO4
	NSd1i8shOHOF4ikC/XviwsCYfRIvqZ7TkiiKVP3sgXQZ4m03K9YxAnNcMvSE1AQrL3XL47U/Sg2
	dYusEBqINEN8AHvbOfK00dKTOlJ5kw7QrN2iaZ/drupsG6cbT1U2olZ5SxS2RsYKlH8eRfSSzTP
	6vJS4koYQj/bSI3/uIq4xfhAXiSe6KJb1CeVSGPShzYbVBpdb7duG+SDI0eEmZ1RdqZVV1d81Yw
	7nvzmSz2SxeY29crqkYv1Kg==
X-Received: by 2002:a05:622a:54b:b0:4b3:45a:2b3d with SMTP id d75a77b69052e-4b30e9a845dmr104245421cf.12.1756816252080;
        Tue, 02 Sep 2025 05:30:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlVMbYgx8dc1lkUCensrY9s8XZ1S7XpWw87suZcVbaJfnjs0OW6CdvMWyEtq87QwjeBLmlGg==
X-Received: by 2002:a05:622a:54b:b0:4b3:45a:2b3d with SMTP id d75a77b69052e-4b30e9a845dmr104244851cf.12.1756816251241;
        Tue, 02 Sep 2025 05:30:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0424cc1698sm544146166b.21.2025.09.02.05.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 05:30:50 -0700 (PDT)
Message-ID: <a701e4f9-57b7-46cc-b42f-f1a4a902fbbb@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 14:30:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/msm/adreno: Add a modparam to skip GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-3-f3ec9baed513@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250902-assorted-sept-1-v1-3-f3ec9baed513@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX/zO6NfVf/YPR
 sLC53/K+OHs8HDSeF/rPK/GuXRB9c5rB9m1GN1MEaUmUR/XthO4hasuIvqeEzpiJ0PwsKpJxxgv
 Hr1wJ2wVZ9UXIenvHbZNhB74V/LFCdFIMcSMHGFy97JT31gH6oMMqlJP6TA6AUtAiiwk3PkjzjJ
 zn8AozaF7gwRlw+2DywAfRt+U8F09XBLTLRaeRSrvhGz3aQtvf4m3mvnJ8hNTsETjACsZdExiUw
 bcbPTIHtzG46m7ArZAijL5r0Xs3SMWh5Wgx5X3ZRClWVUIpKPNJE/4DQB6foHwR5/bujwLCYXnl
 QSYkum9r9VVyhLS4RUyf4dQP0PtXBww56EqbR2tB064Bk+S7lrZogoD9ZhvlTZ77B3qxagY1jgO
 wSrjcjax
X-Proofpoint-GUID: isIUhxNBNyRmbiU0Qbz6FxnqQmgT7nY1
X-Proofpoint-ORIG-GUID: isIUhxNBNyRmbiU0Qbz6FxnqQmgT7nY1
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b6e37d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=kokVE_FroeQZl1yzAO8A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

On 9/2/25 1:50 PM, Akhil P Oommen wrote:
> During bringup of a new GPU support, it is convenient to have knob to
> quickly disable GPU, but keep the display support. This helps to
> fallback to 'kms_swrast' in case of bootup issues due to GPU. Add a
> modparam to support this.

I'm not entirely opposed, but slapping a // in front of the compatible
in the dt works just as well

Konrad

