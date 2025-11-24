Return-Path: <linux-arm-msm+bounces-83054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE204C8045A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 12:50:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2B693A7DF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 11:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7D42FFDD6;
	Mon, 24 Nov 2025 11:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKKZhE3l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tz0sLWsV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9263F2FF662
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 11:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763985023; cv=none; b=iydT32pt2BGrLn9cJNIIuBGX+ByN1B9AyO+DM4ls/LQROHLUv9sH8T/FfQZ3j2WMl5dRME7bo1Pq6S1WNJMeydB6+a04JO3uhetr++VNXKyKUOsjTQpk/3fljyTCiqj2uzUNpkw17Sadkd0XeGG7YHOixG/Ldh6zR917RDSzSZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763985023; c=relaxed/simple;
	bh=ktd6t9TB6XzZ3dbmNIidsgwh4ZvBONIZl496x+NMuJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EiHLvVui02MWRA6EGgwhf+Bh3uzD+MctBZdtHHHb16lWbuM8WGLexRge19FaTr9Uob4geqto4WooM49Af4c8W0EyTBE9HFNHC5Jm1V7kE/f+wpQUsSwvWEcFDM2lSgDQpWmvf72dYeKDg0dH4w02fIOJS9tSExSbnHXhvIReal8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKKZhE3l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tz0sLWsV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AOB5hjT4003041
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 11:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3SZ7ZZ386czpSOQVUmKzDyOQh599YOzYaYs+/zwG1h4=; b=XKKZhE3llSXa1Gm/
	7Yp+REN2mq2CqgZkBnv4Y0EfAj0fvh0/KoypqlhZG8GHERKOF63CKIZDf8Tc8lOc
	BuLKy1X4zDCJYjbfzaOZ2QrLXCH1jjIvwVXe1VzxSwzKKhT065oik5yc8lYvCodI
	2spf4bTKj26mKf2PZ//KY1T1iD/YNpgsIQbz6qBmh10cxYRGoL08bRLh1PnRUKJO
	+ilDVrWx524xztAVJvob441DfizBRbx81+syFoTF7AIqE55c40K+/8XeLnKRut9E
	LbkLMLgBK3uJ5/QQV90Vsd6bCnFOPpeCqS3toeJPhDOZT48nJE8hxn46k4dwC3A9
	MQKzRw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amp6h03jc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 11:50:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edaa289e0dso21417961cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 03:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763985020; x=1764589820; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3SZ7ZZ386czpSOQVUmKzDyOQh599YOzYaYs+/zwG1h4=;
        b=Tz0sLWsVbQVu7eESLS5jPVHwewBtT8bxgdsV2xyx7GbEBfZwdtjyMkr7U/O2AONOAE
         ZvqOprSTMIayNbwcj/oeOpLl6RMHdywrGcK7KNuhM9eBMOt64G2iHtUTl2dpipEOVBCq
         tXGpAe3Vcr3xhmX+/nPPgM62DxuELYp3fYEbVZ3wCkdUyQsWcli+4kOmjit/N+qpPUMp
         QhHWU5nku+TYLJPIo0AlKJe+xViqMlC+YIhqkKEMGyF83wIzVOCoYgAAtV1yO7SMbGsp
         A8Bnll/7xPg+0apcUHvEfbba8ErrtYynl6PO54l26T1ItPYwJSUUhBnOrp513vKF19BT
         MkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763985020; x=1764589820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3SZ7ZZ386czpSOQVUmKzDyOQh599YOzYaYs+/zwG1h4=;
        b=nMAY2VNfDDGt6KZVcVKVxZ2lydhgEIhavo+dq6EYEZNR3IrA8KkrX/oVfO6ool5G8v
         WzD981gkZLg2FdkXTUYn0D9VlVyZQ/PdETemCQbTwzzYrea5uO3hvz91ynt0WeX02rZl
         zyTe+V5VjmRUXYhRVy/MgET8IAoI8aR+k7BIpszs+cYjKWefy3pu5jLWV2u/r+B5ccz1
         bDiGKPEj882k1qDvMpChHMZV/NP3J2zk09UTaFRyLxTXBTpvDI6dYvos5KKhQHTrXjZN
         j7V4lBB5v2AVQavL8zvqha6jjkQJYzVRWXabhDmaSX7FK5KRddKtuCc7K3aIxsbr+qsu
         T0+A==
X-Forwarded-Encrypted: i=1; AJvYcCVB9k0yEor/F4oOkBUZHepcqDZVMseeoWU799JouW/34XRMIBpHNahyJb9otllTseASIGMUQGHfO8aFOwy1@vger.kernel.org
X-Gm-Message-State: AOJu0YxF6pgJ8NlIL6r/e8oC9/mMA6V44g51tWPEMrgJFGQx91DQ+5nc
	pOsOaoEu897923ikA1qOAOLVo/ik/wcfdzvRsBTu7fbc1AON/4GaIcZ9wxYdJUimDVINPOzS0XN
	syJetY8l9Wbhh20rx1kxC8UJS2yrz3UfMB37eDXcnXQB4kc5WbE33G7jvV9THfCOYeWPu
X-Gm-Gg: ASbGncvMpUu9lVQaaCx0J9jJHKZJ5ag22oAS0ckiCUCn762ffyNhAEnfFTyRruPDZsk
	Tu+Up962n9pejov/wkxo0F/JKfFqYtGJ5IX5Dm0JjB04yvZxtljdwe+OurL1Xa6sLL80uHXF+pe
	Y/AwoDbxTKhbG2kk3zjZhDx98CFnCDotL0Ox3EloGpyzXx9Ucmq39pPIpT0/gGLixNTrWhr/Nb8
	uMB74zZ2r1lu6Xca8y9tIG9EUtctj2FIyX/zsh7I9tKTvccO6VNQVIRA0S7J60BNd2tMjXCPgnk
	fEYOy+8O7EmzweIpsSc3+N63R/Iq0bXjK7rj3SvCIgMbgaf/04R8vgzMEVTPMLCB2VVL2RkVj5L
	CnjtGSdFLbxttQcfAGU0KwOvD3KOiecI5Af1az/OekLWKWuLiY9yX4YeMhkJ8HUimz/M=
X-Received: by 2002:a05:622a:508:b0:4ed:67c4:b7b9 with SMTP id d75a77b69052e-4ee5883b027mr117948561cf.1.1763985019915;
        Mon, 24 Nov 2025 03:50:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFE3hRkWmJEOyRnNOZZEZAnqlcqwW4OAL2/F0nzRAv2dxmHvVXnDv1yESoMj2ty1Q56BsWPlg==
X-Received: by 2002:a05:622a:508:b0:4ed:67c4:b7b9 with SMTP id d75a77b69052e-4ee5883b027mr117948311cf.1.1763985019541;
        Mon, 24 Nov 2025 03:50:19 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d54cf2sm1265048966b.18.2025.11.24.03.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 03:50:19 -0800 (PST)
Message-ID: <6be43c27-dea5-4607-ab22-431e3d99492c@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 12:50:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: x1e80100-vivobook-s15: add HDMI
 port
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
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251116-asus_usbc_dp-v2-0-cc8f51136c9f@hotmail.com>
 <20251116-asus_usbc_dp-v2-4-cc8f51136c9f@hotmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251116-asus_usbc_dp-v2-4-cc8f51136c9f@hotmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDEwNCBTYWx0ZWRfX0sGjNR/yfIsz
 XJXk+LkBVszG8XmzogrASr1u7IebOtzo+nRH5QCgpublTHcC+WHn/YwgdAXjIR1w3jkvSnOGC7i
 MOt96n0LPRr2QiiN0KDLQZeTL+WQLBWDRVwlLtt1kKSAyzqkC851TsWcumkCHgHi2QJ/bdE95gH
 4BDgMG2nKHmtN08Gg4i+XaZOleM/bSmS3wAWzUh9BshoVjoFlz62QSJIJF1sneDuCla70tXKCbW
 hrvQaqplGRtaACYGLw9C/ADdTMv/NB6EXip2Ic42N549TRz+ZEiBzJYmOgcfr4K6qooiwBvurIO
 H0JpioH7Y4fZPDF5d7p24wnAvoUQEuJtEWRyaGvVyiIaboKZCIypHNttChKcjXj+NtxMBqvWecF
 tKkC+uynP/RovOgSC54jHdy5PT9bOw==
X-Proofpoint-GUID: zKxafz8a6oY2r3uZekv3igXa7re6b8ir
X-Proofpoint-ORIG-GUID: zKxafz8a6oY2r3uZekv3igXa7re6b8ir
X-Authority-Analysis: v=2.4 cv=GoFPO01C c=1 sm=1 tr=0 ts=6924467c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=69EAbJreAAAA:8 a=EUspDBNiAAAA:8
 a=ucDlCoAaIB5v6D95Jc0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240104

On 11/16/25 11:52 AM, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> Enable the HDMI port on left side of the laptop.
> 
> The display signal is routed through a simple Displayport to HDMI
> bridge.
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

