Return-Path: <linux-arm-msm+bounces-89715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D1FD3B2ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 18:00:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 35CF730A451F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 16:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155CF32FA20;
	Mon, 19 Jan 2026 16:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lJ1LtAtW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DqigiaU3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0132C178D
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 16:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768840885; cv=none; b=byzyqrks9diPcY6/60QkVH/hX7i1Gqy6rGyj1SdCmtAjiI/Vi0D1UZfx07lCd92x+OtepulBjpmMaqPLY0fZ1RBiuT2cUaG4Tys7fQ7nSq9wIYeBzn3tiw2S9ic6osRvJnAHytjhX1cu/1gqgQ0vBIwaKtyTUfitPIzgnRGpIbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768840885; c=relaxed/simple;
	bh=iFIvQQ+o+BplI5ILbep3PtNXh7zBhJq543tdOffM87U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfGK0X01P8IXb0uSSzjpAvYuHScmVLizgutkIgB01+tYLgTNp0ZmBm2UQhFBs//l10J8vUQy0Wh/kliV8UtM0zSANKduhOqML3MhIB1X24/txTq+Wq+LCmWEiqOBXxFCRgOct5rsKrh1SXnWdkzagq8tdd5vAnkq7NH72gkng/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lJ1LtAtW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DqigiaU3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J9mxkw2965063
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 16:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qB/Wgz2q5Vldzov8odLrdrus
	iyg/Swaah8avNX7CcpU=; b=lJ1LtAtWxhXwUe8u2G+4nyDemdM9Wcnixn3IGhVV
	8IbllmabwoljQ7aYfmxL50DVqgR7Q5Jwhyt+ftTQSclOtgo2HIP8wW7hgCmfk9G4
	HvjQ/NOzDk6ym+arD2/6xXIbG1VCJDZrG16sjr/Rn2ttQCdEgp301k+bAwtmUFz2
	6SP2MftlDJ4jUDNKV5r5cEQdrYLOvNgtf3kkz6STK7yn3O23OFmOLW/LEG9MbxCD
	lgtCNDjrdgHnj0aFQoWObClivJQaJvdCNkIOM8Z26tnKr4RY5VzbkKRqL8QUQrNw
	d6Xnrol7XpuvdqkI00NXTUb6Q5qZvn33YCCzuKkATRvFFA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjaa96tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 16:41:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a0ec2496so872802385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768840882; x=1769445682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qB/Wgz2q5Vldzov8odLrdrusiyg/Swaah8avNX7CcpU=;
        b=DqigiaU3GH2Ha7CeZGwqreqXH62If0+6CMm3Gxb2ZbFXkn2fMhkjFF7r0BTbTJMjli
         hX55v4hF51wtI5YiKH/XJhJGvL8oH5Rga2hD+0FOFPML5nqxB+/dUb9VLD3ONBOQJQ0M
         VXp65QDlMUdB3IXYDyJwcgK+7hnl1ahgvNfBn4WU30yBw/jcDfWSXnCMjSNLSGNGN+l+
         wELg/5P5u9MjEm6K3aVklXES5oxe5VM+v8VFQFR3x1dfTNEWAvet5KsvHHnz4FJmcB6e
         JgInWTrWYeASgApdMSdzZwqXg3nki6LkxR2rYUNYSob47qp9mZmwggV1sRaAkNc8QcbE
         KIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768840882; x=1769445682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qB/Wgz2q5Vldzov8odLrdrusiyg/Swaah8avNX7CcpU=;
        b=YHeNXDn9JO2Z+augu+tuSExzrMnpbYQIFAB1dwiT3dQ/G6AHtK0DseYrCE2zwR3Vci
         gKjOXy23T9INiD2L3/Gkza0JXwQzPYQXvtAKG90R7zNyIs2rIPEQu9+QiOMPru+vFSor
         1cgd5Q4jSC5jTkhN4W1Ot4cKlCaf826hHfKyFz3hjUS31uJah5JweoTjOaq13fR7GtNw
         qRrrxzCl3QJDK48BEeX1KbWEjylVBJA6fQZE/HZiTSPn72OGohCi5O6jQrjnJlPySRrM
         4nYdga4wrVbHrPIIVbadr64f/dnX9uF8WSGA643EMVYg/lGTOdDjPIEXlnw3MKaNOcKC
         qQSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0PZRjxWFbcSmjZjrFcK4c5EY8eYEPILLftixsAoxCJUppdqXEDVTAGWDLiD+eHttQ58YEClw8g1SG6uUn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9KhrUlZfKsNehf/uQoWutxzNG+6K3apvizXZ+C+Br4m1Q1xmH
	GCAsbiumWcSvjM0YvapCaFBdQqO563uxbasSZmfWIUifD62IRXoEWuqWefGdUKzBihcQdc7+GXM
	xSoxzPbjx25ptnhUw9pRH6u/2zQLGhDdsLdAWbBoqXPGeilWeacpSPqNz4F/STr+1VKT4
X-Gm-Gg: AY/fxX6hec941abAi8reH9uKmNZ86ylVq1Zpwai41ia/x+EfzTXdicrDWjzmmH8/yrm
	9e3K7om0lBmi30gBJZqE2rxK1g8kFhaJpRcYJ6iyO6K8Is16uJ/XM7uiTE802WWcjopBLlRlsZa
	lIvCCwWfTJbfBtPOrZj32lUL1JHkhVfgWDDV4X+mAleJmnb85AjTkyOXzYaxQhwdNY8IBh81scM
	MNj40ewrtmZbUU8S1S0qZEpHDKzlFFcCsfea8Yy4ajdfEN6r4B4ya2SmK5mCMMq5fj54KG2Kqln
	M4BRjzpxwDetT0wa9NaLY/miz/2sNUeLV5K2l6Hm2Klx97VGWVxG7bIV8u3G4+RX5+d9LGTZb0Q
	Lzmd1Br63MxJZQbS2NVrGCd24CO5qEzUxiDywcWSy2M9V6OLXffWijPuqLI3LO9yDDIN3A5SDgn
	b4k++DFIMuNzEpHLTIEy03gkA=
X-Received: by 2002:a05:620a:448e:b0:8c5:2e5a:5c80 with SMTP id af79cd13be357-8c6a678990emr1562435985a.65.1768840882078;
        Mon, 19 Jan 2026 08:41:22 -0800 (PST)
X-Received: by 2002:a05:620a:448e:b0:8c5:2e5a:5c80 with SMTP id af79cd13be357-8c6a678990emr1562432985a.65.1768840881577;
        Mon, 19 Jan 2026 08:41:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf39c051sm3438900e87.79.2026.01.19.08.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 08:41:20 -0800 (PST)
Date: Mon, 19 Jan 2026 18:41:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: nathbappai@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable debug
 UART
Message-ID: <c6w5w3bxqng3f67bvxl4g5ihsgulglhi7wl6maq63snoscmvjp@2sv3yv3w5fkh>
References: <20260119-xiaomi-ginkgo-features-v1-0-3c8fae984bda@gmail.com>
 <20260119-xiaomi-ginkgo-features-v1-5-3c8fae984bda@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119-xiaomi-ginkgo-features-v1-5-3c8fae984bda@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEzOSBTYWx0ZWRfX2ky6d4qzbpex
 yeFD+V0LXstvm559vmCaqQzNDWoDL8UMJgReLwuS1zDnlGmArlmNnMXmRO9WNXym19H0l5khxD2
 7H+S/QwxV1PDnlg1MeDl0kdfmryDYo5WnNCmxU/Izc1fqQnPAT8Y8hYYq18DO6w3Ch1IhqPl2VU
 ePjPR7P7rw+at7IUOZVXBW4brY529DD44NHxJcPFfuzjpuVOZjdgNmB4SmWm+le4ITpO49ITv0V
 Z0qzz5b3V5/ilXH/he2hthUEoncYpa0kdX/TQJqlg6PSh3B4faKFwJidV9nDNdCNcDEytg8XGmR
 ZcXzXaKKTaeoRj5HmPDkoPdbSUoYKvrg49rrVY+Ye2l8u/mug1pPC2IBKg93ssUthZmTtdUY1Tr
 UXw6p3t4/KQBD1spwOH4+g8NLLfvi7aXlw4GkbPQifAwzoR1ce8cUXjpWw2GcyJpRVX7vKg0SKG
 dwlPSgftPXfr32aOp9A==
X-Proofpoint-ORIG-GUID: 2IANWdPOV9u0fUS4qKn75VyjlMECtLYN
X-Proofpoint-GUID: 2IANWdPOV9u0fUS4qKn75VyjlMECtLYN
X-Authority-Analysis: v=2.4 cv=L8gQguT8 c=1 sm=1 tr=0 ts=696e5eb3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xHxH5GpVV14gQb3VaR8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_04,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190139

On Mon, Jan 19, 2026 at 03:13:07PM +0000, Biswapriyo Nath via B4 Relay wrote:
> From: Biswapriyo Nath <nathbappai@gmail.com>
> 
> Enable the debug uart node in xiaomi ginkgo exposed as test points.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

