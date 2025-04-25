Return-Path: <linux-arm-msm+bounces-55741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A99A9D1D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 659827A4743
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6DC267B6B;
	Fri, 25 Apr 2025 19:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JdmlEomX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7771825E44F
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745609677; cv=none; b=bwQE/l/aj8owp8pZ5nA3m8Lji0O2emr0pbTrSwWABb8tPaA9X5221iJkmJBqT8aYyc5EAxiFcO8FmhyefK1Ic73necEfZwVE1N8TpMjuK0q1FyWjOykhu7ckpQ6UlqGHaGnJUzqQFa8Tqh/pL6iwDL1xj3xnwoho2e35TyXG7ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745609677; c=relaxed/simple;
	bh=163cahu5ENu9FDqHl1M5BVKZOqnHDuPHcZ50Md70BVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4h7CvXkXki3NN7xJZWlu9E2X13fj8bridnFzWkMVkzZliX3DldmpXXK9hGXqMQtchPh/VxDd8l8n88UfNUaADXi5yXhwJsDo7Wtx/DDSdOPRgEziWgp0JY93ZwVKrzqfim0aEXm+4hN0BfyVUQ4hhR6Slif0lgqjlbw3ucdrBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JdmlEomX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJu1c000403
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Gbzbh9sKilox0bBpv/9uc5Xe
	tDa5A8nI6Z4xbs/KARc=; b=JdmlEomXnx0xyrNPEElivGjEB3Xi6jBLj7b0F+ep
	aeggcMkZEda+Q0R6ifvA8exAVf3iRnGlkKRofjIQJM9H3XpgMNqX7qfMYzSDhrhM
	SROBEzbLPe8V1K0s7garvHMVdHFkJNqLljXca8mHMd2+A+Mm8j/Xez/+FKHNm+BM
	rPrOWjFfGdE7bRJdL6r4Bnv2bCJvFkBj3xJmcS9elNgg6usKzs8SMifphHa3Qlhv
	M4PeO12wrT9kHvAu1teauKhfcSiNZMRJUJXXw8tFJscwrGTJbMkmo+NrvjSQAHh3
	VEWPfDlixjNOZK+niNS8bTKcet+yr20iGO0WiXAnw/kv1Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3j337-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:34:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8f184b916so61640536d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745609673; x=1746214473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gbzbh9sKilox0bBpv/9uc5XetDa5A8nI6Z4xbs/KARc=;
        b=nuVq+wL/ytiDeSBQ0ge9kUGzgBrrJyP3HPpK/X5Ae37XP+7dj/TAHl1KDU0turq4nJ
         soGDKar3MYRPBHzeNLI7Zil2ZjGs5QuqeFeKFuVN3Baeaub93yV/CzospjFQBRcGqbVN
         xMyHrtZutRiYYu6Goof6/dCmIjAVlx2bwFU76zkKES9IVaZ5alnvguZ95fpp4ip2Byh8
         jQ3zqqBOoOHTnffHum6Ucwq8J6nW76h10SmHHxBAh6e28+aYqU8juiRJCFV111py2v3j
         AIU4N0Tcy2ETTrUffANFdmD2k5A65OSsD1AgCm0PcdIq9HoEqnmNYuoUOeXj1g7HdP8b
         TPEA==
X-Forwarded-Encrypted: i=1; AJvYcCX9i1/TahQYFK0E3uPpi6+jpABLNm/+lbZ3dFPVY9hPwNtdTChsDg3u/T/Hh/ivW8Z4JRNQEI2R9PRSp3JF@vger.kernel.org
X-Gm-Message-State: AOJu0YyNbANuhYH9atMxmwuntx7Fyi7xm0tKFe8hrLeyjChn7kt324rj
	VhqfS1FvgfeQWtFQCjagyoWPp3tRKXGrw2iNZXprADkto7XfAt0xRik8LumY7qim6iinrgbQ6G0
	pB7b4cosesl4aC5OOnUA669X8JvmTU4HbPj/Urg7w+QGNSuts5l+/zBISMC+fiuRY
X-Gm-Gg: ASbGncu2/PoYYz6g/KdpybqSHiyUsy0KWpPyZWYBd3oBpXrPOaHuKW2KZXvfiAV5Nul
	ymzF2/XtzeXilcQN2w4WoTq8aT77IRt0uHvjiw3RWWoPgrV0mrfTPstvAjtMvLwv2Qs8AQvK1vF
	q2aaD+qS9T+0reejFCYYHLbI+4olHynyPLQ9z89bc6TfJfLzp9zqTN6yrKk/rQ2DaYfOY3a44Vg
	eqc8OY7XlP174RXm7Dz2Sqfk/EPY1Az6FXHxM4uQFQUn30iS+bxZVxrt+vhuk75GGCeYu3kRfhJ
	GEABpt2iwaqXaNw899UAunIQsa2SMLIkmkz4scYT96qkulSgQ2Xp7Fxf6MdDRq1rN7Llz0eolrM
	=
X-Received: by 2002:a05:6214:d64:b0:6e4:2e12:3a0c with SMTP id 6a1803df08f44-6f4d1f9d931mr9596946d6.39.1745609672957;
        Fri, 25 Apr 2025 12:34:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl9bHOMYkB+SjmxFEank3g/xII0FoIJCvCC1QCWpvbIk9euK6eKPgazIojwUkLXrFRDY2vkg==
X-Received: by 2002:a05:6214:d64:b0:6e4:2e12:3a0c with SMTP id 6a1803df08f44-6f4d1f9d931mr9596696d6.39.1745609672646;
        Fri, 25 Apr 2025 12:34:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb2630esm722956e87.23.2025.04.25.12.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:34:31 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:34:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jessica Zhang <jesszhan@quicinc.com>,
        Abhinav Kumar <abhinavk@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC/WIP 0/4] arm64: dts: qcom: sm8750: Enable display
Message-ID: <w6f3s56gx7psqgweuntqvkzrot7elhc5pdrxhvenukzwyt5eys@fndmaszfbo5k>
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
X-Proofpoint-ORIG-GUID: bkB7gx-E6KUVYn-0GlPi0M1B20FmPGiR
X-Proofpoint-GUID: bkB7gx-E6KUVYn-0GlPi0M1B20FmPGiR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzOSBTYWx0ZWRfX8aK6NvNo1J6M 53GJnqjK0+dRUNpNJwWJ9OWFGE24U6nEcst/f2pgIH5mqlBab/C4rpw3lh8SoNNMkcs2Nr8uVGn BzAJ0R9w6KrAU+OfaUfu8vNXQPpmYNq7N32sYrAief/GWWeJtwcWRHGZOD5k7HjUGP9OK4cEv8Q
 KrRB8WbRJWxuS+/bPHYffRXd+V8//ty5wbWa0e37WdLk3lsoC6EyAq832HMweUuDlBb47L4lbna IPAlqU45qQYwjiUJKBg/KmOzEjNDcfbJFcMd9M2+TG4PiGXPUm4wWltQYxwqtZOBwWr0leTfxOn TCyVeOt2R3zj6A7LPByUmGw+eml4nBCusZNlnGE2oIsH3wqBgQOlpX+xTbkgCMNZ2DEsQMjgQAw
 WUP7WG2eHqs9M3YW8GDLUc3dKrw//f1izmOKrA8YYvbRtHNP3li4HnFoesKWennlrzbjciBd
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680be3ca cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8
 a=mWMBN-svVNVciv-ajYsA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250139

On Thu, Apr 24, 2025 at 03:04:24PM +0200, Krzysztof Kozlowski wrote:
> DTS is ready and I consider it ready for review, but still RFC because:
> 1. Display has unresolved issues which might result in change in
>    bindings (clock parents),
> 2. I did not test it since some time on my board...
> 3. Just want to share it fast to unblock any dependent work.
> 
> DTS build dependencies - as in b4 deps, so:
> https://lore.kernel.org/r/20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com/
> https://lore.kernel.org/r/20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org/
> https://lore.kernel.org/r/20250113-sm8750_gpmic_master-v1-2-ef45cf206979@quicinc.com/
> 
> Bindings:
> 1. Panel: https://github.com/krzk/linux/tree/b4/sm8750-display-panel
> 2. MDSS: https://lore.kernel.org/r/20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org/
> 
> Patchset based on next-20250424.

If the DisplayPort works on this platform, I'd kindly ask to send
separate DP+DPU only series (both driver and arm64/dts). It would make
it much easier (at least for me) to land the series, while you and
Qualcomm engineers are working on the DSI issues.

-- 
With best wishes
Dmitry

