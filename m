Return-Path: <linux-arm-msm+bounces-89118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49241D22C1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 08:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEB8030B7150
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4646326921;
	Thu, 15 Jan 2026 07:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UfnHq/qU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DjhZZGaa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A990022157E
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768461063; cv=none; b=D0TV7grA7o42w4XU+YXH1zMfJ8PZ2xXaVGObEPfssvIfCk66xKHW00IEzBw0+kV4cQ9I7yGxiVSYso2pebV6pD5hke3h9FCTpnyba/zZWamkQSfY/r2+w6/l5qOEfovNxiIGYJK7M0XxwsVHfgnl5tD1PU/ex3eMBnEe0gXQhTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768461063; c=relaxed/simple;
	bh=ahdCF5IzGvJ5Y2Kaer6ZEsBWxkVCn9FHtltPh4gfQQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C2BbrR4acVcz8VjWRbEopoTYcuQ3WqKn+jNxQomJ6F+8Qspk+F8kWwvK8TWrGVdGqbr+w6MhfI/nx1C/H9JPSP/i0Bt0YCLAG513zXp0u2QvNYRe+9l0lCrzS7qMZ/MFn6Of6i6c4zXHZeTYmaoMu1SVlwZt9TYES020NUgAxcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UfnHq/qU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DjhZZGaa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6g4DF1692815
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3Wyck+ktuiH2aE1K8w4QRU02
	rq8oc7Yf1e8wrTHy5Ug=; b=UfnHq/qUAEeZKIbjSi3vme1fdWF/CAyOnTuOSb3W
	yriWyMUKvFjXz/IQtEdDCWwc8e6oUOFZQRpW9WhNOHx6Brl/s9FoELjRKayf3/PV
	5esK55hFywUb2jHZuv5xpszwEbYhQj70SgYGyk/ucuLmm344TaMHpM2YDlKQvpxN
	7csulVK9S36O/mzoQiRc/0URmzZUzmFQzd9ynsb34b2Ryiay+gHvBbVtjAIl/nHG
	MoQJxZkhvTLNaOL2VVHhNKqZWwNTPkSonTd8sfiof9HVvhBNZguBGjB0puAOlPNx
	WJdKtP602P/EvxTU601PrOzJbQsssmramdyfstCbANG8Hg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp931knnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:11:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bc4493d315so176759985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 23:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768461061; x=1769065861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Wyck+ktuiH2aE1K8w4QRU02rq8oc7Yf1e8wrTHy5Ug=;
        b=DjhZZGaaLonbH+S8idGZO/xZxKG5MtqzywJrZ0Jmd8LqXq+2c74nIWKpz0mYQnjDfg
         MemfhQD3qkngBslCxcamgnhwDUi4ednLvvRmWT8q5xKqvBUpCfZBxX4mYYry+YiU+6va
         AhzAjO7BYAyxzNLX4JX56uR91LRE/mPD3iXe2V7SXQUER1rJHEVoTxLe/fCSPeQf6VZN
         27vRSG4Hzx8rnNECczpBqof73mVHlMm6usVuJv6vyUtg5fI5auD46wKUIUOy3rQdFCE0
         JYLLs+UmEJYE8ZAvefVndV5L+77eKwLIxhPjwl4sxJ81dxLfpFyw2TPXgU8AVAEnu+Hr
         ZgkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768461061; x=1769065861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Wyck+ktuiH2aE1K8w4QRU02rq8oc7Yf1e8wrTHy5Ug=;
        b=Ki9uFrktBLyVUBPnzpvxNaEjWHopBtZ0STqu+rexnTrCJYYnkcXveh9OGQ19bUL9Cz
         01tOMVKptVJlsl/9aVAAxbVyPFvD9UmLd8UTzRANA0m1xxp4I/arGDNXrzakK17OdZqM
         RAofsRHNAn9jAAX/svo0nN1TwyVYD9cMXKtUiK89H9Hwkcp9RmTwD84r3Y5Mvp72eqWX
         PyTguHlC5/5vJm3EyYm2YMarAO9H7LkQ6yYHpSI+rrMhpvJRnFCSMKe93WYZ8krcurjq
         Qx5fioChgSByLY482sEsgGYHOzlqdcb+UGxXdLsZBul74RbiK8vs3+nJQM3/kErggAc0
         cGHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyv0wp6HHTIuN8NBdbjYbFP0ObIVhXPJELXdlUmGGDiLe9X+SN13lxuvvSNwsfeZBh54mHYeJoJrz59QgH@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz3IrRXxhHTSJpeuZG1fq4mL3ywM10zvXBxjVvYM+eDh2+peU1
	vDSdlDXvgJPqXBzTeJGRuiDghwCxPw5kryfD5w2Eb6n/DAWxZz3eL4DTdcfinJZJsTCzYkeg+Ww
	T2A/P1vCGv7odBvBRWrWqeh21CT1iw1md0HveLFTm/FQfqr9+jV3Ri0DbLrVqJiBP7v2v
X-Gm-Gg: AY/fxX7OSoKfsk4zrLokwJKhGzWLsftpwaeDIqNPNvWAfAtWocjZhAvbGKawBnfkcGS
	7j4t3Bz2TzxzNW3RYr+SGqS0sNsI4b3FhwfFt3h4XDUKC5iWNzVXfGNxnlJTKRPlUpR+dP3ltu3
	tqxaZoqhrkYAxiMoueblet8gnTD2MdNGsNBY5KZq2yA05bph5XHtS2KpZtm03fMv5rsh7IYtbQM
	6n1XfBR+1WaXB9Xk0YDYOUIovr+/NjnkqlLLVcCO3k5cbPVrZg1TJwWmNE9kHWNprFycXcluVr1
	PZugWJV8hQ0qeBMRrxbY3gouDzJqYRTO2E0sajiOYRYBGy3bf120Yn3QdvOBAbETYqtMnbkYlfp
	NxcgngzS8HRbbiInwv4/iG71vZhH9IwNcUKfZAvXF7QJKrbREDVI8rwcZIEdl4W3GYUUiL8vU9R
	E6VosQ/1COHLoQxqcRLrPYZy4=
X-Received: by 2002:a05:620a:2996:b0:8c0:e5ad:adbe with SMTP id af79cd13be357-8c52fbdcc1fmr736808285a.90.1768461060825;
        Wed, 14 Jan 2026 23:11:00 -0800 (PST)
X-Received: by 2002:a05:620a:2996:b0:8c0:e5ad:adbe with SMTP id af79cd13be357-8c52fbdcc1fmr736805585a.90.1768461060328;
        Wed, 14 Jan 2026 23:11:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382f5f8a42asm55187511fa.26.2026.01.14.23.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 23:10:59 -0800 (PST)
Date: Thu, 15 Jan 2026 09:10:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Subject: Re: [PATCH v3 04/10] arm64: dts: qcom: kaanapali: Add ADSP and CDSP
 for Kaanapali SoC
Message-ID: <jad4p5l6beny3uojc7lyjtku2c2i2ykple4lgikb7s5kfyfg5h@o6a3uqqkduww>
References: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
 <20260114-knp-dts-misc-v3-4-a6cc9e45de93@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114-knp-dts-misc-v3-4-a6cc9e45de93@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BOW+bVQG c=1 sm=1 tr=0 ts=69689305 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=fhQCKtEa9KXwpflw578A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: symkIGdqPonxaVDJ6rX9dTlyrbLPTr4h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0NiBTYWx0ZWRfXy+qBOj31mi8n
 n73Yg4xA6ZGykhC/tyu3ldzyRZq5bIz508vEOU/j13tyTgw87rCTemjIhj9415por14CElbHUdA
 yLASCkwRg9JdJ8uyxfDfJFKkFQSLIlElzsIv4+tcwYOVCyydUG57oJnEySgqI+1ZWRwIDQPAsIi
 s9gvT/RJuInk3vMuWmd0b3MxgkQ/nLqS+0XxI5W2IUcDthJE0RqyOiSybuO1j6gy4wAjUv4C851
 B6l2eVFMQnZNxJOfSV+Zo9ozsI+qfWMcQi9PXn7ExcvzNYNZ3UCn26X0Q/6+38/JHUc0Lv6iPlo
 ABEued7H4Uhz7CvKg6Kyq71wVbSyyiZtADeLCJC1XKDQ/mVZ82s39b6G3jvXOMiHJ4lqfcsXYkb
 9U2zh4EkZOHsVLYWkfv9vDoyPRjEpv3mkYbu/EETcTWnTXu7odx6ec1A7OkjoAD/8L6Elnra4fS
 5U7UoBIQSiYGGjdBwDQ==
X-Proofpoint-GUID: symkIGdqPonxaVDJ6rX9dTlyrbLPTr4h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150046

On Wed, Jan 14, 2026 at 10:49:06PM -0800, Jingyi Wang wrote:
> Add remoteproc PAS loader for ADSP and CDSP with its SMP2P and fastrpc
> nodes.
> 
> Co-developed-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 351 ++++++++++++++++++++++++++++++++
>  1 file changed, 351 insertions(+)
> 
> +	smp2p-modem {
> +		compatible = "qcom,smp2p";

Nit: and where is the modem?


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>




-- 
With best wishes
Dmitry

