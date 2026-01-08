Return-Path: <linux-arm-msm+bounces-88094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 18916D033D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 15:11:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2580D303A3F0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 14:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176754A8F4D;
	Thu,  8 Jan 2026 13:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SSFZslUn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SrqgV+9+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACE746BBE4
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 13:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767879847; cv=none; b=ZA3DkHhgE/Hi3c3WbLonLJAyW54e7EAVmWKrq2b1WcXyrEJy8gqC8Gh3SiTZzEHfqbCcEz6qd/H31QEV+A8h6eWgJpmJqDKxjuFQ5W/vm6+9SKyWiYEb2vHjPtd/YzjIiG/4Vqufbp4iRGbYTLghup4xOyDvdCXqtdUlfCXWvp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767879847; c=relaxed/simple;
	bh=yWe9963GIb8DbenHbM7k95bu0XJcIEtloJm8kZZjbZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=icq90hhodqoEpngv9n4pQ/meM1nnGI6PKnjM1k2SY06nV5AkursOg2jFFZz30nn8GU3JrplLV3Fti/2WgYriUqHrOz8keHHRTkB/vCfZnnrTlP3ma7X3OJ9lzPILrF51y1w0QsRSNxGbafp6gDcf4HJJhYHGej/jqKd/P1/zIcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SSFZslUn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SrqgV+9+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60872ExZ1496071
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 13:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9IG5R1B/DNG4pTgEjrKT98zy
	+g5kbLjmMUpTgn0aHJI=; b=SSFZslUn8XqWiuDPXedoq8AO7SJPBQSvcaIZGoEk
	Um5cltnwmCW6xdIRb1SStvjsXCHXVT+nPS7ueec6mBoI25d1rAs8H8Po/BKjZ+cG
	t/6dpHk4Nemwbcr4662Er6kyhe/Gl1ilwhBuB5aG3ocigrvQIGW0NrTb0RkoQUYy
	UeiJo3f0PV+q4RYzc+Tdq3rnSjDJdR/WCXMUAVc4/rItZOYg8tmyUofykR3ICOw1
	ZWFoalngPyGwcKMamMEh2OlO7bQ8asuQmTFIccFu96HrrNt2SRt6Bbe1nd0JI4sF
	V1GAj0HLd/TfRsCUFpFfcs1vrfLl46njOhCU/OSEiMBR1g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj7ua9588-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 13:44:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c1fa4a1c18so756923485a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 05:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767879841; x=1768484641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9IG5R1B/DNG4pTgEjrKT98zy+g5kbLjmMUpTgn0aHJI=;
        b=SrqgV+9+2pRD/TMD54YbDtvAFZxR6kkAIflIEbQUevR+JQZwocCn1lSQIKlyegoLOw
         ND9td7+X3kqHOB4M1IZQ1/LeMdc8AaHWGxJsz3x+srfQ/J/JJug+4mL2n7e0p8jVrYT/
         CNuDQPY7jLodJVOpJAA7L1MgIaXN0gc9GE3EPlyu5Hhe1346e0n5/CWP07pp5+Nir5+x
         rPoqfhgQ+xYoXfTEtVKAcfSMPukyrMIKSmi6z70fVA0BDcVWn0YNL8lv60T4Gs6V85dM
         CSFcDhvymbf8HNacil8wH1ad4dbVa8y5+aVt6cN3onDXM8fQzuRFPzVEc8lnASXqa4zf
         op3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767879841; x=1768484641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9IG5R1B/DNG4pTgEjrKT98zy+g5kbLjmMUpTgn0aHJI=;
        b=m9zISQhCfunMbfMWm65Wr68/7dWRS/poU9mC7aExWTyyk3rbEHSCqgpTvvycT2giI5
         idFgBYL4nvC9muvCmx2AKV1+5PH0/gT5B2RPjSPg/VjQK/+T7WNsaPi8niJEjBvimupn
         mOJwVIL8p4mnBX4HVYUQ0rD/WR7rt9n5ax6M0+U9RJ/qhmRv6W7GfSgz3Dqgg+H+O65o
         /uWKV/n/2MyZrZA3p6uWkw1jHmNmETHqrZoCVFikakLP1rqR9EzuSBQ77RixJote4DBP
         0KqYLPNU3TxyFJ1jN5QTM+y5ecKavRG0gG9a2cib2JXQ1IYSqZnPRqHESFbTWJLa6Ujz
         TKBw==
X-Forwarded-Encrypted: i=1; AJvYcCVqz22SLeuNbphoLTDN6rJ/H+p1vtZpVLledONgPxJKRvpvYOQRipGvc30K5bvyeuMFQVfGaqsxFhmZG6wf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvq+jBSeG57Fr975fPVt0ue+DbjHgvO0Wy8httjUZ9er+RuuAq
	hWXyR+quBFrThbJE21z4DMPvRGne1EzKBO5bHUhjlS5dPs1l081TgQ4yuyhoujne5VQSrT/OL5Q
	6m9dpE+Vfuz1IMevFf5Qhm/xx182v7klV4qYaWI2bQchUK/qZyackAEaVgwUauYbZsQc5
X-Gm-Gg: AY/fxX6SQXPddInj+p4U9oX4DHyXHaBOfExeoG+ur4gZKvZgnZTmGeO09uC9yXA4M2R
	3c0uME1bEPiZm86lIWhSs/pCjxFb+BNn1w8LwqLtmgIRdbp3u7N04glj6n5x23frffEhQ50y0vF
	UEa+FknPikUL8up/+Xy0X84Ldzl2lybhZ11poDicgdVzk9oKf0IWCBicvaIMSwXlgn2qyPmJ5bM
	glPKY8MdWBliic7pNjz1RQWg2PewI7mtZ0a2SW1q6bFVbcCzheGwwjAJxfQPCmtP6oP+5s0MD8S
	Rb5CrzwCi8X3mm2P5/dDdgqmgbZGHCxIqliYO9PXhHoGzQ39DPFn8THdSAEM/sKWEgVMvrmZwAw
	Vfoh7tQGE0agghnhoHRtiHsMJxIOre0J29Rmd2qjbNG6yBGLnmrp62C1n9ThSl1FYL3dwJSVxke
	qC3qb5naNvekG5QR9athnCFJs=
X-Received: by 2002:a05:620a:1726:b0:8b2:ea2b:923c with SMTP id af79cd13be357-8c3893688f5mr835604585a.14.1767879840667;
        Thu, 08 Jan 2026 05:44:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHw24bHW3oIFsvmb8e4lRriEpl5Nr6dkfNLKdXFFfpxh47NA7FTc8dVRffTR3vOBjsIlWDfRw==
X-Received: by 2002:a05:620a:1726:b0:8b2:ea2b:923c with SMTP id af79cd13be357-8c3893688f5mr835602285a.14.1767879840191;
        Thu, 08 Jan 2026 05:44:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6ac0a769sm1706120e87.21.2026.01.08.05.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 05:43:59 -0800 (PST)
Date: Thu, 8 Jan 2026 15:43:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v5 09/12] drm/msm/dpu: Refactor SSPP to compatible DPU
 13.0.0
Message-ID: <b7weoxyja6glxeqal3iz26mglyvknxa45btkcaipgdl7zmeahi@ab5qc7go5xex>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
 <20260108085659.790-10-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108085659.790-10-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA5NiBTYWx0ZWRfX1tkViejhb8Nn
 WGlOr9PJ7ewSz0DPy2cq1ZUNjlCp45mBqIw6zgnmEFgsLZd0VpXHdrgxCq80rnP05ZrMWOcB/6b
 7bNhUTTDGL8v8VcP/PcUt4lFa/DY93A42hTVdsWBrpBT+FcP0RqpOxlia15pD88L2e/Nqq4jHZ7
 s7MG3krjoIq/fytvXOJiPKS1MUJEjxyGWHWWN/6k1t7OeUBh44xLZazVfkGlWm+Eg/e44g/Fp0+
 49CMPSXK/bIEE8iq7syxYH+i83ZRzn0dEC6W0/++o73RBoyolP2PgnKpVxgG0GvinincChcUlFN
 A4dOUV1C8yTJuLvB0O6pLBDHg1ZjpIvFtao1W5OJPzpE//6CQr52UYpHDEQOkPXuc2aOIpANXzl
 S3PlENLNXmsUis5vEI+J9tWH7F36iSrTP3WWSsZcFEQEhNaO7n3JlC7GpSFYItDMh0lLUcZEfjA
 e9sk+fHa3+qsjjFGUAQ==
X-Proofpoint-GUID: Zze1ZioduYvBqAqeAkByccc4vwP0OxYv
X-Proofpoint-ORIG-GUID: Zze1ZioduYvBqAqeAkByccc4vwP0OxYv
X-Authority-Analysis: v=2.4 cv=XMM9iAhE c=1 sm=1 tr=0 ts=695fb4a1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qJVVUtC8YRK5WH-1NpMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080096

On Thu, Jan 08, 2026 at 04:56:56PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> DPU version 13.0.0 introduces structural changes including
> register additions, removals, and relocations.
> 
> Refactor SSPP-related code to be compatible with DPU 13.0.0
> modifications.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 110 ++++++++++++--------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  52 +++++++++
>  2 files changed, 116 insertions(+), 46 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

