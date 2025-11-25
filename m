Return-Path: <linux-arm-msm+bounces-83309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C502C86976
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 19:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CF5A04E01EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 18:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF87732D0CA;
	Tue, 25 Nov 2025 18:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ur+eU95m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jn6dDLCZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69872329E5E
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 18:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764095082; cv=none; b=H49Z6/2SdvxPvFz2kXKG3E6IROj8TV+hnRCwf2iCrhw5YP+xS1aE1uLSRmVQALYV33t05+MTGyoU9F49r6zNuVI+PU3KCWVZFWaoiXPu5YjnLZuhtXDGOWL6ZSnfXLiJr5WIfo4/GlJt7VnFx+A3HqeOJwJQrzg5w2HG+aF91V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764095082; c=relaxed/simple;
	bh=aCJPX/JrC/AEf5t5t+ZMbYdDuSPsFCbn/5lDk4CTYTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OD+CEtOoERFF3fqQUW6lAtlVEP9KD/uez6pIDEbjmelctBA+5zdsgqeeGjRFgF16m4/+3RugClulhp83Lm7t8bEP9qKvRcoQYDimZe4yn/lMBlYU69G2a9gVYxXm3hi55suEsziLZ9fffYKudSkfJorHUjR0DVMvYqT79ZAIVNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ur+eU95m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jn6dDLCZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP9wL9c2659009
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 18:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1W2pZNd5o2xExOvwqTzV3PfS
	MN7hG4UWUiuznKEkBfE=; b=Ur+eU95mifuE9XNyJ5XC7WWeigz1+ESiy9qAu9sy
	ONFXvdMcfN4wdL95ek/giXY4BoDdytPxVAeVXoLXgsr+3KtcaglkhyjGoNyQCRt5
	lSePbR6ngZa02QoE8T4nkY17GDwl6Y1LeC9RQT24Y+4EBzIFDdkZBcwK0vfQliDF
	B50F7iqkoLl3iA9Tpo97dljrWKuKJMmdPPODMYiEHBU6UF9K7uTur4YbcvM1GugE
	9RqBAf2ahpwMM1iqdrWn/QHDrP0elo8FtSTFKUCiOQC8KnUgQ0pGefbslkVwfLdb
	ggLwqCA5ncWK8uf1BdKzxXrUE7MWnWnLZluax7xBeaf57Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ana9x9fen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 18:24:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b26bc4984bso2209239085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 10:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764095079; x=1764699879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1W2pZNd5o2xExOvwqTzV3PfSMN7hG4UWUiuznKEkBfE=;
        b=Jn6dDLCZCORp6tPjdTUvm6S0CTLKYNYBrTuzvzmdPpCCQe9eo6+SUdgRjlHT75eYOj
         3wjgFCSXHp5dXbuDwYZKurHwpY3Kz/hSpZstF9GinY6mX+aed2r6OboKHaJF47seBQGg
         I3ZigbT9qrGXblG61gB6J0mnygD8hQWoUZcVH/l1RW5FhHuuwfSNhMvnJHOrzfRTxnb3
         uO+INKKgdKHM13yM/EEI2NxAPOHIHGxEi29h8BuRTNJZAE/S2oa1IBZ9ugo8ChEaGepi
         H323chLOjz1lcWWN+roEz5pDIcBYD3Rj58ndsPD7xyLQnZ8C3kidSD4uN6A/3pNoxNXM
         gqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764095079; x=1764699879;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1W2pZNd5o2xExOvwqTzV3PfSMN7hG4UWUiuznKEkBfE=;
        b=WiB+BV1cBs2YR7fWL1V+UPmRCf5o2DpEZ/1WlkGDse9LyR9M/FvSTHd3niC5RXBhvE
         FQHevaAzMkHpkd3eYlR8ZGuVcrUVJzUbVhfe3WCIk0DXTa6gXgig9OLiLGFglrZTPUy1
         V3bWw47zDhbqt7x+RNJjJ+UcBSectZaobdUzKYNrQEsmR04vgklZjhMszhAG1tdj8rdj
         3rK9thew+S+dXa5wbInEoSLoCf8cg4oTRZtTSYXOUp61YFzG7ZXVAtKwNiW6HWsVeaXQ
         5YAk/KVLMDDwYYsWjClFDtLa1larJw+0r5NC26iY1u8MSqeD35uBhxW07mIBTgIFs5oZ
         uZuA==
X-Forwarded-Encrypted: i=1; AJvYcCUnZ21hnurGfPO/Tq1lIcp+CdblmJrEX/d/NYK+D68xLaDeoSRk9uz787WszAtL3DnTuTh0M+OYHLEUJSMf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjj5EKyerAMYh6WTNt5WWf7yw/wvFDJsjXMaBVQoa8z3KupJ1D
	UKCUaCjzXIH6dHjw5fn6intNDIU/gSR8TTmi7Y1Der9k7vXUVUaEwkRVgQX8UbA3AoIUzdp1FN4
	xppedTG6KduzvX0tTESrbnVG9UZunTaAIoLR0JtERVrJUfKwoMT3JkRohEvxysfnr4aqt
X-Gm-Gg: ASbGnct42VjbB8mDHEbwFPGOXQLuMl7A1M41CBobBRhCiQ0bXImFwg86U7gpzG0GVwv
	WDCEjQURL1IO4WKb2ycnCMh8m7j+pHGrhXhlxNPRweKpyVxlaAHETF+YK0C3IsS9iW09LsWCCRs
	lNjRKM6nq050vIovY6ry6ahPoUsbkZxgGkvzUibddnQ0B4Q2MrLTIL+vGcE6asyWwWb9YpUztZO
	lBNatHbauWa7SiV/k1SHErnc0mTYvIEZS3V6cbws2eXHJxCeXszC3XDBUctjeEe9oPZqO8Bk7Pa
	iQer5FnyXje694zqHtmwItZ4K/JNs+dL/kiqM5jrXiHIT++wMqwIRx0HsKPES6zBFIz9Fm/lIeN
	phymuduNi5J5pDCXNyOAlS6sh8vokNlGlQ6ZhRTpTO7J/kybyYcif3FYm58Yc8NJ8A5m13Oox/0
	U1Wh9TJlCKrPPdSkul4hAzWz0=
X-Received: by 2002:a05:620a:29d2:b0:891:a6b0:7cda with SMTP id af79cd13be357-8b33d5de395mr1943569585a.81.1764095079535;
        Tue, 25 Nov 2025 10:24:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/LwsjMNs5hDAMrUk2thSQ409OAJVsMNAKG7KN5/TDjooNvMHnsCDt1A7pnyNx3Aq4GT59vA==
X-Received: by 2002:a05:620a:29d2:b0:891:a6b0:7cda with SMTP id af79cd13be357-8b33d5de395mr1943506585a.81.1764095071636;
        Tue, 25 Nov 2025 10:24:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db74711sm5356013e87.12.2025.11.25.10.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 10:24:30 -0800 (PST)
Date: Tue, 25 Nov 2025 20:24:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH v2 10/10] drm/msm/dpu: Add support for Kaanapali DPU
Message-ID: <xf2v2idn64mbmnjofih76thot7iudiy5winekxwhki3snlqnd2@qaols2ykqgyd>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
 <20251125064758.7207-11-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125064758.7207-11-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-GUID: _x0JLwQ_gh1WTqecx8gUQvS3yqZurtpS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE1MyBTYWx0ZWRfX+MCttea8HpNg
 i5HNFvFkJn9MCEgzQwm2WbxP0y4MXKU3IAtojKvltqmqsJG8vrZ8RuslQWLcIRmR6bVpp93J6vS
 /32HN/qfgXOAvH6ItNlHVXn9/Obd9qbMcOKv3hdl5ho0HYC1gWqMCAPO5h9gqzMO3FjSKVLJXON
 GuLsPQzAXlUI3TxX1+XFqAAKf3bShu0V+c2S0owfH3BqpwK9u4w/KUAvoXApvcr0xIjvMksp8Nb
 bHIZFO4f3l4IbRu2BA1ck7R3OCXiUcXEwqAYdxUkafg9HqVTrkF9x2jzJ6czSVSJVFZFJdZl0Q5
 xICjrtkc8EQBu85q9Sszudjq1x5mEql3mYCA0U9OPAVwLaie1EUiMcTbTuhQP38HqPFWdP+SnF3
 3prfZxdmJjps/OkKa2Ri3yehm1/I4A==
X-Authority-Analysis: v=2.4 cv=Sfj6t/Ru c=1 sm=1 tr=0 ts=6925f468 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8hlrZ4-jp5Ul6jFpUz4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: _x0JLwQ_gh1WTqecx8gUQvS3yqZurtpS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250153

On Tue, Nov 25, 2025 at 02:47:58PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add support for Display Processing Unit (DPU) version 13.0
> on the Kaanapali platform. This version introduces changes
> to the SSPP sub-block structure. Add common block and rectangle
> blocks to accommodate these structural modifications for
> compatibility.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../disp/dpu1/catalog/dpu_13_0_kaanapali.h    | 492 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  41 ++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>  4 files changed, 535 insertions(+)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

