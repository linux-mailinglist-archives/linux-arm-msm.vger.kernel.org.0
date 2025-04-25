Return-Path: <linux-arm-msm+bounces-55724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EB1A9D0D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 20:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AE1F9E65C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 18:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68ED7219A63;
	Fri, 25 Apr 2025 18:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kblvoohZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC2C192D87
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607087; cv=none; b=HN583HogpKsQVUoMvxWiMcgN7H7pqtnCRJbTOgvTysfDx3gWvQr1NSpjaDJs3WXBcgFVpDEWIO1BlNs4hHE0SLMGEQBtjZmUaZWaNhQnf4TyF8aTpHwU9ePQSKMcZu7pdIIbBVElY/sGau2vhAMQ236NLkWhpDnAhvN/HnZT24Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607087; c=relaxed/simple;
	bh=O/aNKcRBRr9XPzfMd3kgEYnEuls3NYKPCxmPgvMgF1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RnNz0WAH1rtWl1IWlq+XJ3GC4vfCxOWpsg/HxPZiaP8HBbaltIJe459oNryygEOmEI5fpAG1GfgsmITmo4rDAcgYVnCDgAP2LoyCBxu6daqKCyEvqmKR3rgz+q3nL0TlWr9u6XWOyPsJUmH4m/OiCxFV1bgitdmdPuNP6kBDyy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kblvoohZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGKMdT001943
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:51:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jbt8E/SpTOH9u/L3+Prpu4vZ
	2knpMVBoxf2CCgEByC0=; b=kblvoohZdJzoU+IYBH8rg7S2vgEWoxZAR0HyPbsO
	YoZqZiJevkFGXAPcsB7B5Z3MMmflPcaUz9p/KQ5obUA0/TKTe2e4X4iog3/+PCrY
	3Sovce8Bmd15TMdvaAHrz+N6Lnaa0D9upyVPk+W7E987JyKyPgYCDN8NyT4Ktvlt
	eTnkv0C1FgUpWbP9NAQRdSFDdxMeAz47p49UgCV5YpOwIHOdkghQVaGmMoooK3/o
	7RH5Zxyv7mwkZkN9mjGJiUgnGVid3TJjwbLiezJwVVC9GhgVWfbJYnh/pur8/LVk
	nDEchUHimMk11b9Yj6jYKiG53d+2Iq3Ehi1MX++wEDID1g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3hyyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:51:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-47ae8b206a4so47208601cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 11:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607084; x=1746211884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbt8E/SpTOH9u/L3+Prpu4vZ2knpMVBoxf2CCgEByC0=;
        b=DkfY+EQ51ZKHAB43pZjZD5m98A3lGl3yccDJLAMt5oT6ZN8KPQG77OCOfDgXq3FPkF
         H1++JPdewTWWL1xbIbC+5JymJ8WT8TU3BQFvZtAWbdWxcodaAM+cJGde7fxI8flixJzS
         7GubSe68hAP8Ws5de/q6BYBU97lcfPHVzgaoq1Q8bYHukqxOlDXpitGkTpPNHmm8v3sQ
         Jgy3xW4LgMKG/ibN9Rh0cRYdHKzgv44ocwqnqHu4L1qSj3uIjHr9j9gfgCvrbIui3bY/
         xE7CAy3afrgD2kNgMTC5z9QnrAO+TX+sbU+RgYkBIPCMHAMOyRsde19Op44VthDgbHTQ
         WYhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWscM7tLgFtujP6hrNKwBwEu27lbxB7dUt8ws97acCKv5th/5ysz0KJfV0LPIFC44GeXhdYjzNsSRa8zzR1@vger.kernel.org
X-Gm-Message-State: AOJu0YzQSIB8fS5q7031Eno745PGJWW+/pZpNQv7J7KmCBtRcUEv+J/w
	+pw9YTfvM9qX4p+IimzlSJyOZg41X8CfV1lvTeqHxQVU/oe+m7FyUIh7qtOvh/8CYJizlqwIc88
	pyn+gt49939ERgvk/mTTWPahRsAbvpPVM32jdALDm4f4OQ4xb0g4V5p1Actnadj84
X-Gm-Gg: ASbGncsg4FV1SmJORPXPCGNJxSnLteAPbp3RUno97YEztW2tikJ4NSvqkaubfKBBFrC
	16Nk2xmAfAC/i6FhqRZVAx2U6HHelEVGSgLVKl109Y4wtMrkRGDD5Hmp5Ulna5O5bo2iT6ln3DV
	3MigBgUWr5JVXcJzWc0mS6zcCHI28XBoULw/Io226bLlK/YKVi0C51SvWWT3dRCOk2suR8QgXCK
	v9rnF+9HqMqhYP9gbN/Qbz9B7u8PoFQo/lR4qY8wFS1QIudbzZJgZLR09/G5diNx4TM0q8ZvFIb
	43jcsNIYp6ww28Nb9JK6b/NcFuMMM6Zjo1XjWYBjoo0G8HRAHxIcz2cOCX5G8XKvSFsP2cWSuBw
	=
X-Received: by 2002:a05:622a:18a4:b0:476:ae71:eabe with SMTP id d75a77b69052e-4801ebd2629mr64703341cf.50.1745607083708;
        Fri, 25 Apr 2025 11:51:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTNjkv1hYMJC5mDMwjON4XalMvkyCL+b202KJ9nUxbIt/FHV9dJQbgm6JqDooiTYZAgXjO8A==
X-Received: by 2002:a05:622a:18a4:b0:476:ae71:eabe with SMTP id d75a77b69052e-4801ebd2629mr64702951cf.50.1745607083362;
        Fri, 25 Apr 2025 11:51:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bf7dsm689196e87.100.2025.04.25.11.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:51:22 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:51:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/11] arm64: dts: qcom: sm8350: Use q6asm defines for reg
Message-ID: <xirxwzunynpy4geuhizaqldcsn6fzoct2bbghhwjoszcvwy3mf@ot2gp2i25xr3>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-11-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-11-28308e2ce7d4@fairphone.com>
X-Proofpoint-ORIG-GUID: i0q3QiJmx7hnTLoynMQ2gNS3Eh5Jw-BB
X-Proofpoint-GUID: i0q3QiJmx7hnTLoynMQ2gNS3Eh5Jw-BB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNCBTYWx0ZWRfX7mO7rg86K5TM 6Dd0oNSuyl5YM6r3zrcF21jS0vEdVlCjbGLIv3T+XVmaHNkEaG4nDoTdE7a7sTVV5iS7ygDedtc ISb0IX+9D4FDYHwt3E0O79XX4KGPT87Dgxg9Wwci+IJcAzdNKuq1Z1pxZ+NXiEqu3Ej/ECFJjZU
 Uv7OuWXGHQ3Zim7lwrCJ6WVrdgbOH+XVAUI5CKtmqO9OsrY0Lv9n4l2e5J9KM3Knpnm1gBcAHUf SrGcM/nOkWYDDwd4+yAFatFWZTt2eLsvm9ZQSs3yzxw06S3OmEjEAJnn7HD7P0LY95W5a2GEDPo JHOJlP2t+WNhDwbiNucKlbbNCaT9NEUkuXdcbjFD84p+8K5M+kQJZRvXFHZl0M+XDNcFle4l6jH
 xiofqHeB4SW1dLnWuhjx5wIkaTobdzR3zRMqTBTUB30KXyHuTEZp2MCsHyApHtcvdG7bDmzS
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680bd9ad cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=621 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250134

On Fri, Apr 25, 2025 at 01:53:50PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

