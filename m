Return-Path: <linux-arm-msm+bounces-86038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA7ACD33D5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 17:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DC99B3007B40
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 16:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C5A7261C;
	Sat, 20 Dec 2025 16:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X55yvZpo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YDwRPS0H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DE51AF4D5
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766249000; cv=none; b=FWw7OOfV0M+JYPkKB/CGQ6qpqNPSwM9kqP2XxqeIEAde/0D4hup2D1jxoLwyPc0zGnQqUy+4sTOpSz7BRYAn0tuOMuUJRcbp5y6hZcHv52II9KBswZ2DD0VUALJIO1NDo/N5Yau9Z/ovnDI2gOxx6hM2CpLkVfWXiuCWM0RYMlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766249000; c=relaxed/simple;
	bh=ma/va1xuUA+E++ZNGOD79iybJzKWBcfWFHkG8XZUVds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nd0+sV52foEPo07TS+tVuipAaF6g6gK62jkUkPTtuGtm7qHiCOuI0NSd1BQn2S5eQMa3yfsh/SJvtcpoGpXibO7OPuc/fa02SOaGNyQIKOhLsLHVtjwHgGZuwnKkVw1LOYwFuYCCI0bryq5nnlyXnCvSYfYYFxZSVF/QD8pg6IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X55yvZpo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YDwRPS0H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BKBPEjx088286
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ohdhdwiC4FFMEEaMOcvAmr6l
	y1HKYTiQl6IXfBOvxWM=; b=X55yvZpozrjBaV6bBMoYJgTxMDqXI5TP7cSzxD7R
	D6rE4dhUmWkwZtbw34m8FtIIqn7p2175nF/J2Hw8NJHiEsY4eqE/UTn7jyEq5QVE
	Ah0LDQQNxK96f2JFOexYtJ7CCoJgNhVwidavYIW2Uz0LkYvC8bqfQeWBsOnlEBjD
	BdmieJ0UvLp26cs1BfvwTpU9YLqTY+lhmn0NPJm8xUGe3qTOwJH8fFQSDHO5k7IS
	SdDzQUo+Cq5RudouZdKHCVXQ/ZY3o53gIMy5ZQysrxz7jAPI6dYCCZBJ1MCCYj8g
	cQ2khI7Ja2g19bMlliYBwpZ1xVe/KesEaXPIYP+z3LZWkQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mra8xwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 16:43:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4eff973c491so64986291cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 08:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766248998; x=1766853798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ohdhdwiC4FFMEEaMOcvAmr6ly1HKYTiQl6IXfBOvxWM=;
        b=YDwRPS0H4pt9JDCS3jvTRc6dgkVFzUb93owSX/4HHAYRBgCDSomX5p5dASU09KR5vx
         gor865GxGuk+o8AZXJOvHWMiMArO2VSHPVXmfAFRpS+eEw7tNOp+xMPcSOf/LWzt9r05
         l8Qe8pkLEirpPhjdTBTwEjRMXX2U5Z4B9jhFrjJUGMHBYAa4J2MF9HCxeteT+6pZVgCn
         dh20i4vEaHjraiQj6/B+KxK0l8CtLFj/7RVvt3MNS2e0DCfLh1ivw56sPTi9V7V0WqS2
         n0zzyzF0QCOETCQ5Ut1dV2CAMqDybsE0WBdEntZ3yuR+5KL4zIAlKCBFSzHxyvhTP1BW
         /Feg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766248998; x=1766853798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohdhdwiC4FFMEEaMOcvAmr6ly1HKYTiQl6IXfBOvxWM=;
        b=gD8mLUZi4t8Suh7i6dsUWRuDiRxGxTBOqxX79VHt8gQz0KUHBqASxftaaSo1qoOXwE
         GmNhpJqKAVK5DzMrgYvruFzn5RS0lGW6fKTGn6p0rRKGfvpJRwgk4zFNWqAwb9Lk61aX
         YopYTk1PH/P4Bvpae7vMSSHAARLP6aFTUKMQDJdv50fcQwsgJZJaev9cwD2gP1IIRsEC
         A1NJlJGO/igaLxbV9XUiaE4V6YsRUfOcjCKuMoC4y7bItZf/dGFd1R7CGoZOL+nxcU2D
         RftsF+DGkW/AHmJdNiUQPP2Og/eDKi4/YisF5+83iZ3UDcfVs85bS1wRVVXildhraeR/
         b3gA==
X-Forwarded-Encrypted: i=1; AJvYcCVCpjrIAe31MVk8KtRSxwp/2Q5pfeoFJ5m8wnGZwcpBaA++W4+VuJt5SGIlNNLO95w/cXIlCrT0OEB4HwVm@vger.kernel.org
X-Gm-Message-State: AOJu0YwYEHwX+OxC134qWE4sdYXJXB1GDQEe2TiOikpl20iOyE49cez6
	FioqvOgC+1vgOcKOnTGmxP/axDUiGEOudj2AnvKcHIpWtTuzcZaKdw8iFxSwhFVW/WiItkAmqC3
	+VTd/G0Er41weHfUA76XIazO8lTZRSguwf4bwoOGLZDAbbdkPZJLJ3BVx4kvwZE+B9F4E
X-Gm-Gg: AY/fxX6iWnFX7WEniQpvtvU14A+uLfuNOZ5GNm/tmd0EH23FImzldncqaKAkmzvhKf/
	K5VZBoK2BDaKiqHQL7eZ3tXJksecqUC3CNslQJsmvgNdLQhz1j7ZoSTfU6vNigNLRblUHN9QhHG
	1bIOzv1QWPDnG3FVdbcZaxQIzId1mlYasZvcwgCMTAFPtyN1aECwP3iyJ2AxazoLGLJVN24BvMi
	0WK5ABd1wUVbLxawFR3M53gwCWQK8i3/YF48Kuup73aVumur+Inf8E8+5lVnTwaH68E0EKWPoYc
	30koQSil9vZRKLeLlg8hS+s+3p4hkh5c9IhTDU3SQBvHgAdoWNMIZ0SDoV7vXMbrc16zj9bdWZQ
	S0ygCUPDVmAYp1sLoNdRFrEMFP0BgQ6ZMLMEUYFyhe6X/+fgV9X/r0elO2PrgTYLa8jI5t3ilfk
	9fuledYnOOCOfPkcz3kA46y1k=
X-Received: by 2002:a05:622a:480c:b0:4ef:c5cf:ec0e with SMTP id d75a77b69052e-4f4abdb2eafmr104522451cf.55.1766248997737;
        Sat, 20 Dec 2025 08:43:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEeDG8QliabZqhFL6L/XSpUcLdYtvjSEWOrUClzCVnxv/MT1Uc5hNOfXtSD9CVyj8/GL/WqQ==
X-Received: by 2002:a05:622a:480c:b0:4ef:c5cf:ec0e with SMTP id d75a77b69052e-4f4abdb2eafmr104522171cf.55.1766248997321;
        Sat, 20 Dec 2025 08:43:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38122501032sm12106451fa.14.2025.12.20.08.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 08:43:16 -0800 (PST)
Date: Sat, 20 Dec 2025 18:43:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 1/6] soc: qcom: ubwc: Add config for Milos
Message-ID: <i2nbit2dqu4ajefx44ky5aijqhieflocnkilbvo46vdq3ywd22@kpyomui5i3mx>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
 <20251219-milos-mdss-v1-1-4537a916bdf9@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-milos-mdss-v1-1-4537a916bdf9@fairphone.com>
X-Proofpoint-ORIG-GUID: S46N5nSjwYFyCzCqecufaoG8zQd8H8TU
X-Proofpoint-GUID: S46N5nSjwYFyCzCqecufaoG8zQd8H8TU
X-Authority-Analysis: v=2.4 cv=e9wLiKp/ c=1 sm=1 tr=0 ts=6946d226 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=KB0s8L93-oSB63ZrkccA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE0NSBTYWx0ZWRfX3US0cAtBUXms
 7QIgkQ3xf+NvaZzsaNGbpTXQc7Lg0JsjATya7PFX79jrINmsC6vJjer8y6xYLpHRbEqDaHrn+38
 sAmejRy3PuPWglJZ5Ggkj3lHQBQ9CBLPAwrx7bneONN9FvpIDkRIYoPwvi3iGl6QfjJKjapmbAs
 n2K4G4Kp6jw155WnLxkL8FLmXOQ6h4HZfv/iAaED+1PRxP1e8zWCIMPEN8RHocV1ZttQ9uhiN1z
 8eZJdobKqkSgQh1lHCEyDWqA1gc97aI8767wSjzX8JjsKR/yuyyCdIWSTds+2WpYXG8wvP1HQV1
 knXZeu1SwANmatxkYQELDO/Z/hVQN+yYr4XZ1fhjxLpT3zspLd2KS2H43mnc36wQc8dK09Tg3U1
 C9Wi4mzrOz0JM3VZ6k+cFxc5xxqLP9Q3akfmFZgos/71ViSuc5/MENBpCQBfM3xtgLMsCNxG3gg
 l+1pGyaYnEA+t1k/pUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200145

On Fri, Dec 19, 2025 at 05:41:07PM +0100, Luca Weiss wrote:
> Describe the Universal Bandwidth Compression (UBWC) configuration
> for the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

