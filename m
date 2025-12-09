Return-Path: <linux-arm-msm+bounces-84794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DF7CB0FE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 21:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97C22306673F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 20:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F8630149F;
	Tue,  9 Dec 2025 20:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S7mo91fo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dk1ERJDn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84402DF709
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 20:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765310707; cv=none; b=stPgUl3tKFF7d4iyqd9vfbXBThF9U6y8NVo/tz50bPUynzvNKfLrbtD1ABZKG8euNWQYhCJd+b4j5CtB+/OKAOnNcXSPHMFgwtnAPZS6C37UKWcgNDAwsyquDaMeX7n8QbAI1YtTwOzIhZcmoFI2QllPe0T22gJAcZ0T/O9IBjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765310707; c=relaxed/simple;
	bh=ejXY9qkcfYiiBA2jlNqE1PLszyFbfXQeFd13v4ybFRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RbONbQCyYbofRpJSNNycVyiy28KpzdXnrdNKuZXHYam/smge3iq1ySZfmdkX4C2Da0QWO7xK4kBaOmKly7bwC5wuNYC1+pzM1iyRJgdrbZR8UqTVf4c9qBVciSnldarnCw1KXFgRHattsI/nOEaWVFo4RMWC5YtpYTiW6ez6KXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S7mo91fo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dk1ERJDn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9GiUom474346
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 20:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AaUoS367PS82i4ffAxkDidXw
	K+3jS8e9PS5K6YsjNPE=; b=S7mo91fowkEggx/75aGsedQDQreptUwkAFq/0sTR
	/hsbJa27LyqmHFiK3cU8pjKVZDkECzWe/gF2LlnmZvRbm2eH0jhr2jCvD2IQOTHm
	h2RFKFqt+j9itxNXtU+U3+DAC8+l3nuWuj0pxHxPMcenysNi3iDvqJHOjAruoAm7
	z86Kugjyl4th9vafNwwsYQtWFOgcBvBiVFEJdiW4xyZSZSBChSZhw2pd0aIflDlc
	8RZWPUs5wp5OsWyT1rcc8gFoe67ThW49a7tVdopxkYZuvmU/srt7JwLmwvcuou2F
	6R1q0CCFm06YubHwk4OAhMNBMcSPJfd7sRThW50WOFNIUw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axm9c9dvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 20:05:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edb6a94873so105124961cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 12:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765310704; x=1765915504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AaUoS367PS82i4ffAxkDidXwK+3jS8e9PS5K6YsjNPE=;
        b=Dk1ERJDnwkGvKqheO3jyTnsE1QCdECZ6j/rCWzrkQO/O1vrX0LXwgZHAmwsMGuA7xJ
         q+IeNV99qEc53lu481RVVPrwAmTg00BNNW9ZTMWBc9DYJeOnpYnsWMGg2kFQODGFqMed
         vl/4R6q3alCddFNTDoeobUbZhRrkHh2ySVbyZHJvJLk+VCvxzpF78Z9sUnl+KNoq6C/s
         p6KkHutJT/mq6CTGMmo6Fdq0gFJO62jGxtGh7oYT56C6DedkJ2J3JyrfBKvqmV7Yas6d
         CKwJUHPRejcqVeqvY2UN1ZrNlGVq5Q4kiFwS4uzzCJCR9ubZVR5RS3I091b7dPxDEY/M
         rqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765310704; x=1765915504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AaUoS367PS82i4ffAxkDidXwK+3jS8e9PS5K6YsjNPE=;
        b=FSC8SRpi2SUjetEA3cDQi6QPUXooj2dvd90ciMtEWZKyXiloKv18J9c683U8Skg2nf
         jpOYwI/rc9N8MPZw8Lw31JVWUlSQfb9d4JXDdeEXHfyhnTtwWhZZArNsYMhP/7F6+epL
         QzpVGEGkeGdPhIzbSvUIHCu9Z4yhZW7ndCcpULvb7maJrWrfeNjlNPpkFOGgvmSoncwQ
         6wlbMW+gVj3f2yAAcZnCH0mjJ+MTPw1n/Tx6+O7xIn/Pjp6V/gDFNt/CSMuviaUlKdxt
         Wn2PvbWkwH+7zzYXbnNGb38sumuEaZtkLV6V4hew1z9dAuczON9rIU8wXpe/9LrqtMCO
         J1XQ==
X-Forwarded-Encrypted: i=1; AJvYcCU84jHxLN8cZTPfgpEGZ0D4dRtxCWwUQwyPNIICBRKnWLo8XK7WzjycggLv+DZgKoqtNoxM5IMsVxLCMT36@vger.kernel.org
X-Gm-Message-State: AOJu0Yw44upPKKaebM0ILwj8wyN7GxsFEIRSJBFEkdSb4r/2oa76E6PX
	JoSOyvleGD+/U0Zq7Pxdgv623VRnQWMA4sB8jqUpZhNUXfk04RXqcNwmgotBq4FFKpMtzeoIVDf
	kaUhAb6pTD4fr1O2D/Mjz+pOhBV14afVA8Xe/KR1BxpZu3epd+lY8T/L1pwaJOA0QL08vNdiBD5
	7G
X-Gm-Gg: ASbGncuGaVRBVjlMb7uTwOjkhkQqsCdx01OxScoraH0RNejqso1YvT4QvucVongG0Yd
	B/6wxEaFSk3Fg1RHYuvuHpk94xL238ts4wlC1IXkYFkKqGVOodtY5CdTKxHiRR96o5aoWAgJqTU
	SujYyOZDgR7BumZHOcPc4pp0ExBBLHXA6HKjR4MPNKF//1c+QjlsTNLT3bP7lBoYUS5cP57APXb
	oN9v+qjW3xb+R6Yz3U5JiprCj0DDSeBPfD5f60avZ/9h37zbjoAog1/yB9OWXIGEW1tRPVUUzCJ
	IELruW+l9tlYXp4mB0SOiaiFMQiDUlxuSNlp719ouKFoIR2gyKXrBWoDY5pPQo97U99tmoOLa/G
	IlVGcux+vsB/cHSFvwHKg471FIVaLGBjJcxcB7ICDECXefaBNaRXpvtadGxww5T2BFNRtZvja5h
	MNKTHEkGi5jFq5v/r7ja2ozuE=
X-Received: by 2002:a05:622a:148d:b0:4eb:a4fc:6095 with SMTP id d75a77b69052e-4f03ff2055emr185688461cf.68.1765310703761;
        Tue, 09 Dec 2025 12:05:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWdU83n8r3+pF7hBLbvlPVS2hulqvwWJVcQX9Oy4tft3zu2KPJ8Yznes+5bnxCDzeZS63rBw==
X-Received: by 2002:a05:622a:148d:b0:4eb:a4fc:6095 with SMTP id d75a77b69052e-4f03ff2055emr185688011cf.68.1765310703323;
        Tue, 09 Dec 2025 12:05:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b2eecbsm5381148e87.43.2025.12.09.12.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 12:05:02 -0800 (PST)
Date: Tue, 9 Dec 2025 22:05:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6 5/8] arm64: dts: qcom: ipq5018: add nodes to bring up
 q6
Message-ID: <mnriqymdonsqjmoyy7wtrfi2lr3ievgzisf4fhotvaejitck7e@gcjldnhw2tme>
References: <20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com>
 <20251208-ipq5018-wifi-v6-5-d0ce2facaa5f@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208-ipq5018-wifi-v6-5-d0ce2facaa5f@outlook.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE1MyBTYWx0ZWRfX1Flt1rs8xopz
 H0fa7gqGM+/SAlxwHSMZMqJI6c3cMDoKuV35lyTEVqcx0RgMxBs6rZ3s549MOyZCLJ3diRl91FV
 IuPoHBm5LZIbh2So4GubuIc5mNNuEd1qWtH0BO0hihamp7kkCUyK0Jb/3sskulhilDGqy4pIWla
 xVWKeI6HPBb56pPlBmx5oPMPjiCCNrHtfyW89XBazr483NC4CUbBY1X1wdtWzbeo08lmK5Y+fd6
 llXjsTM/pM0uJpaYyGlPMpUthMT4zT/m21TvrH8sMQfjE4Dv3LEKAlm4MtMV9qmj2prptlM/a+r
 FiwevyF3QYNVB9kDPU3EtxCqKLe91Vg7KteZrKA1o9o9N83gSuOs3IrL4BVmz1qtIHBLgYmhrIj
 8bZ4FNNuzyp8m+/vNrO12oyn1nk3Eg==
X-Proofpoint-ORIG-GUID: E26Ckh1cqlZHLP_vhq26glDMHpxNGQZJ
X-Authority-Analysis: v=2.4 cv=Vcj6/Vp9 c=1 sm=1 tr=0 ts=693880f0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=OCM-LVnu836T4zQjxcQA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: E26Ckh1cqlZHLP_vhq26glDMHpxNGQZJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090153

On Mon, Dec 08, 2025 at 04:25:37PM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Enable nodes required for q6 remoteproc bring up.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 64 +++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

