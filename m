Return-Path: <linux-arm-msm+bounces-82104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5890DC644CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 14:11:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3AD9D351FC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 13:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536C6328B68;
	Mon, 17 Nov 2025 12:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDbgBq32";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EsZtyBWl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB20C326935
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763384384; cv=none; b=RwLyTSSFcErw1Uiancw2IHhXcUMDP69h0KOE+bDNbrJo3ZnoitB/sPrO62fkdE9yqN5+0ImMNwOWNun6W76qmYAACUmED7+WU2Ax/mchGH+DvmqkGmIeW+nfHh1vmuk3AJGsbcrRJdw85y+EKHQ4RwnjZ9nv0kVR+I9YXqpAk+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763384384; c=relaxed/simple;
	bh=zYOz6qvCKjUVNVREjuq+F3JlRwdtIoLwhQxWDwSCVzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kkVmLOBewXq3RS69RTuEUtOhVTRsJ/zIrvLWPJR7xF0eKPBUyXjew/0RkHHhNVPrjpAzxlWz9jRjT4msYrWmyIh4hoOY4/QW9wEdA9UNuSsmbBkptTp+ykAbAOdnACqHV3KYsS7rvvjS+ykYKeB+XxbZLz1HeT9Tc3nfyIaaz9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gDbgBq32; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EsZtyBWl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHApm853920786
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QIy6nmU4bLPrMwJ8/hz8enJnPyJdVXYR0lTn/0d01sA=; b=gDbgBq32sy4TjEkA
	xV1cWLyP46hhDjxml3hKt7uUUvHHcRhFZT23nfxGlBvG6n6f16wls9B+9zYWUQrk
	PDEN/dSuHijeVC/lqWoOpL1a7IUxbZAjHjL9CkZoGMu+lC1FXU7PZVC8soi5nk5g
	ccDAz/XtF+sQSRTW7e56O3rrt5hHmp3Yaj11r/UXJ68F2CusWoenqkbrsND1agOh
	Qj02iXlXG0nBIBQmWmBO+a/J7uMiE+1dpijBaDGxe8VyTtr9wUEFczFIYfny9M4F
	8BHl7Wp0KEiQNGiwx91FwFj7BBlQAiDLSgKIa9HQftFiLq8dnK7GVlaqt1Fqs7zL
	bT6kPw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2ay8bb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:59:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee07f794fcso6263131cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763384381; x=1763989181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QIy6nmU4bLPrMwJ8/hz8enJnPyJdVXYR0lTn/0d01sA=;
        b=EsZtyBWlQox6Y4167+LWNtsvkbKsZ6b3FL3d4D/t1klANWl5bacbO+3p101D/sEj8o
         Ik50VWExIexPFJsgoV1w+wWiuJx0WD6LyfUVSLufhU9ZqqdGL7YCsNj+KYA30r31YlTU
         r8Jx1+wSQX8bDXRgtyjKzqE5vCIjXKoWhtXnAPKfhEqeUtfKJLqLUFTDiuPR1tnO9ys9
         kvle57kdiGnfYZyUOYm+0YQolglvbSX0CWKQss39fjnFNpRPJy6wpiPTJO2MXu96tzVC
         J0HQuGUkNclqdHuaY/5WbjHod+9lE5MpclZO7SNZW5ke4TUmQgvtiCree4lHPBqioBwO
         j7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763384381; x=1763989181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QIy6nmU4bLPrMwJ8/hz8enJnPyJdVXYR0lTn/0d01sA=;
        b=id0r2wIqDQIzsOO5Zi8cm6rIInfye4lbsqJs5txku9+b8PcUohr3tx5FrTmpqCwLPG
         YjK7hD+0NjOKuG1C++wWQb7JI9qm3+yxPYFtw4Br0y4JqwKAAxChGo7Vt7fm14zUZtrp
         xjYl5fxWFTs7fySPlnmomusDodiATxwCqupm+kjHuXD3BF8aeWt3URkRCI7wfebZfPcp
         GqYYmsXSgMX+9Y+H+gat6V/fzcMxNnAkffhtKvurlUAY+xUx82sba3MFz+ZetD+8179W
         /x1ZOgFwhTw/WgvepeUeYB3FHiGxJO82TqSp58szuzcCodvAYhV3aGJ2kql5Qn62qMXX
         p3JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPVwmgIIV2dvTVVaRmLoMo/UXd/xo/zet3Ptu3HFKzSfHE9F/CFh4Egr/YU3qc6Ai9LjTSbeRUTZLxXQJS@vger.kernel.org
X-Gm-Message-State: AOJu0YzttE2CIqbuhn6whKF3Bgev/z6K2bFSr3s1JMlxzlyD5umF0Ot0
	8SazOVz03/hD4dxhiRxkxpYL64uz9v/Mgp3jfxiJ/N8qOs1rU3WmSeluJb2zjDbtdtNQOYLVSaU
	CLMKFvX75ACY+d3278TyNkxBjxVnjiGd2hO8WDZSZOyu0GbuRONRY+qSvhttEalaJkzmD
X-Gm-Gg: ASbGnctgdf62rP8/DUQH7euYtgek8/KIXXvemASIaVL0eGh9kKVq4OiawLctE8NBuEF
	ir5QPnkc9fWi0Sb2R9WkpBehP00hcteGwws44CRuHZ8sKUbRAQvB1C6cijpiijrw0PMBQKToG0r
	glVOPH2sefsvDTzxva9CcYbpJbXt2UsAsaJNJmvfEx88BxKtH40uUwPcUnQE9EmL7NIiKm77AjL
	J4hL+e6PoczG+lcpkBWZoex5l680Qsiakxrw0cjnj7ZCymqVhLkvGpLhL8kNwErbxQglurqeOhc
	O+x1N6uog+r8J1C7HYrwkYYnNAekflyYGhFkPWU3NVZ023DrLpDaUmATljH7FR+UeMgvOGzMQ61
	JKdYXzRmcXlssXXbHkCZRu0ulqSD2/h+fHc1CuEhPrCPNmX2engZypz6G
X-Received: by 2002:a05:622a:508:b0:4ee:2339:a056 with SMTP id d75a77b69052e-4ee2339a1b0mr23150891cf.2.1763384381211;
        Mon, 17 Nov 2025 04:59:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVdh9JuD27fBdzsHi4Vxyithgf/j0od2VLCYOt4w8VBPCvZl/r78+9pdGLJV5q/0RmAHtKxw==
X-Received: by 2002:a05:622a:508:b0:4ee:2339:a056 with SMTP id d75a77b69052e-4ee2339a1b0mr23150591cf.2.1763384380563;
        Mon, 17 Nov 2025 04:59:40 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fa81172sm1066827766b.15.2025.11.17.04.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 04:59:40 -0800 (PST)
Message-ID: <8a6f3969-077d-4d07-b2bb-230fe3e0e309@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:59:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: x1e80100-vivobook-s15: enable
 IRIS
To: maud_spierings@hotmail.com, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
 <20251116-asus_usbc_dp-v2-6-cc8f51136c9f@hotmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251116-asus_usbc_dp-v2-6-cc8f51136c9f@hotmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dL2rWeZb c=1 sm=1 tr=0 ts=691b1c3d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=69EAbJreAAAA:8 a=EUspDBNiAAAA:8
 a=GX_lnnJ6PiQ3Sj9TFooA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: GSoju8dEY0IEfOO8ym0e7ALv85PLpzyd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExMCBTYWx0ZWRfX1Jf/MWWhzOTQ
 90AC+NBZAa0N61IZCawe+kU8dX0m0v7/JQyVrer3wgYt6lmMpf6zZQqFwNA1MaYMBi9So/qx/qO
 Hv7Eiyu/plyEprAygWnQC663R/oqPRdZ3OzqXew0ci+77WbUmkT4s2pKIXX5QMtQsuH6OVff1Kr
 SBIeurNIZm1oojR5eamh/piBwZHD+2ro/FbHuCXN9TTNmmDeFanCIGuLhcNiAfo7rQKGysIIfsF
 2iCUnzsrs1fpN7IO6n7XDN/Skpl+GWyyp3Hzzd5qSQBr/unjmVgPYt/1wndpc+/oi2axHZtoqy/
 Iq9BDxf73Pd2g7IETwT/RkwrSaXgl3BzmA3/mYn39aAyjhRlZuRwBx0gKc1enTlO72ZmVp5ToTE
 B2QynZskAwAR7aEAwPZixObJzOKnQQ==
X-Proofpoint-ORIG-GUID: GSoju8dEY0IEfOO8ym0e7ALv85PLpzyd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170110

On 11/16/25 11:52 AM, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> Enable IRIS to allow using the hardware-accelerated video codecs. The
> firmware is not upstream in linux-firmware yet, so users need to copy it
> from Windows to qcom/x1e80100/ASUSTeK/vivobook-s15/qcvss8380.mbn (just like
> GPU/ADSP/CDSP firmware).
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

