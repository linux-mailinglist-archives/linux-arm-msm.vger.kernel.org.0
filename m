Return-Path: <linux-arm-msm+bounces-74345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7F9B8DC71
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 15:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E87AD189E529
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 13:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1AD24E4D4;
	Sun, 21 Sep 2025 13:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XcNGjLEF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD322D6E72
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 13:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758461895; cv=none; b=KKoKzWCkUsDEJ0bP08vDqBR41LMEpOx9PtokdqVKbR7yfn+fVHCgoZ8hy7TwN3jXRZs7LNQkCq/e4K1xVSY/3GGt2lnogEVrCCc/Ty1AFA2fbBvucfH1T3Eg3/fKamhMo863FtJhUM01jyxJtbSeOT67OdOK5jRS8/Cm7HDe/DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758461895; c=relaxed/simple;
	bh=kfxzqQY9FBGo3ot94aCtIjWQ9LMwiuq7sLB8wE8t39o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLaz3OqJOLio491tuAfgXfNgRM/YtXf63poG4yqVwAg8I9mCR4kaTU0nhGsILx1pY+UVdu/CJlD99OqTlPx9vDCySydoLmZWmR9m/lQpuzzceJwonMbkhDvRVBnXxbeuiuk7a9zTNMBBdoTDmYL93Lb02QM9++YINRJdUUL1LDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XcNGjLEF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58LAujqg031302
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 13:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UXvFsOnz/bg69aGhRBaNFRF1
	HMJGHKlWWIW714fk3pg=; b=XcNGjLEFG00hpkufZFQIfp7v2mbvMgaRHxm1X98G
	IWB79xydbywzYmCvdaqZ0S5Hfv4/ScxXaHi4E+H4WHRB3D/nSC3/1VITg19SC9zk
	94QvEKnkvCEg1Pr2z6ULYONwsUlfgadBqpsNlftFAKQHIVzwfrzBqD+2GxNn67E4
	/ojYPjje2uyGgjTkWjFgXcesAAXVFIYDHo9Eiy0qNJ0624CEa8sQapivGGSF29mn
	D7YXNOuZiFTHrGVfgHdjfm5W7Ztrkpxhd7CHIvmbLFZiZOBJPWjJQWK3PFAecIkE
	JDy8f9MSjSQAL76Oo/Doogw6OrzSz6ESZTka21AdxGYYgA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98aa6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 13:38:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-79538b281cdso51771336d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 06:38:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758461891; x=1759066691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXvFsOnz/bg69aGhRBaNFRF1HMJGHKlWWIW714fk3pg=;
        b=lzLIVLo9J9YrZzGT4d4k7Gg/Z4ibgoYGwJMSOyHanQbR+wOCgSg/aWdyXHosmOVVz4
         nLZNlyalUlaNB01/LT+WT3VT+M8tVvCCV/sa13gMKD7eh9Y+2Ku5b05ijI5VccBMVRVQ
         1oktjzdjw+tVZJlB8ePrSCZT5ruAFTOVe77Y1f64c2V+rFw4DnMM7y0ExgNGg2c+bbz3
         pUMl/y067TvcLsox6uL26yBscUYImm+g0y8nHXNEounKuMaVHcpG4e0gaqxUP3N5+1DL
         DZE+Lgajdp9EY/9D8kjievvF9ZjXMCz8AHmUHjGpbjnogXJs4yz1Ycpcc5TJbBPFiI4H
         lKag==
X-Forwarded-Encrypted: i=1; AJvYcCU3MuL3gw80mW9xrZgvtpxWBh7JAD/A6c9acLO39HX6cbklRlEGtEuTGkqyZMr8e4rV0nHc3fuwjBvxAzpf@vger.kernel.org
X-Gm-Message-State: AOJu0YzYwMwaqp5cnSP4h07A85FYutG+Yf5YXWtB6IHxAeqX49yEmYJC
	8WmvNkwNrPrQJYiYJMLJfHS8e01CXRNscHGs2a6HOZ5IFq4bdDJMSPaPp0E9YVTpdWsN6odBeE4
	LOEVywU/abdZI61zMvRFWRu2GdpinUAvwSNqaWJD06RuE6YHLoS+PPCexmoObi2OUhHZ8
X-Gm-Gg: ASbGncutqOH0p0HCa/samf0IXvSYUV6IibB7N5jwWiFwF5aIyzRmxnKuc3yaE3psn6n
	1Rc75PgyxyN0+hy1EFTSJn24jaHJwkJlRArnpUD6JVnBj003+LeIxoU2cXhcmO1rnuZY1UQvWVX
	tQbJCHMumKMakUyu6Zokt4PMyyo6wHKYbAcONhdyzgMEkU51jokijg3tYEBoDGuBTp/4y/6K7U7
	8kokrlqmSC0WeP+SfaK0f0/AIKfqzq02YFb6XcRCwDAE6EbD0v2U/g+WqCf2NdrPjUdEmEwB0pS
	oowekme2zscHWz9jR9QKWlooovj4fkhT7MXkfc+tvQLqzLkmmuR3ea0GRCzMVkqAd2V2pBGbTHm
	VWdknczasSdI23lrmao9IsOMrvJlLv8v9fKkdyaZVrL1GCDAzjh81
X-Received: by 2002:a05:6214:14b3:b0:797:1e3e:bb0c with SMTP id 6a1803df08f44-7971e3ebfa8mr79271686d6.33.1758461891603;
        Sun, 21 Sep 2025 06:38:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjThN5e2uPVDWFKuoGk6IPrJFb/I2On/gRq0XvQWhXZz/M9H0O9RQW1RejBp9P/jCHPApZBQ==
X-Received: by 2002:a05:6214:14b3:b0:797:1e3e:bb0c with SMTP id 6a1803df08f44-7971e3ebfa8mr79271446d6.33.1758461891143;
        Sun, 21 Sep 2025 06:38:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361aa480bd5sm22491641fa.65.2025.09.21.06.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 06:38:10 -0700 (PDT)
Date: Sun, 21 Sep 2025 16:38:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>, Max Shevchenko <wctrl@proton.me>,
        Rudraksha Gupta <guptarud@gmail.com>, Shinjo Park <peremen@gmail.com>
Subject: Re: [PATCH v2 2/5] ARM: dts: qcom: msm8960: inline
 qcom-msm8960-pins.dtsi
Message-ID: <ehpuhdh6pueeqbw3qoq2ad3xqjefcevja25wia2poyf4kzdvbj@ki3sjyots5im>
References: <20250921-msm8960-reorder-v2-0-26c478366d21@smankusors.com>
 <20250921-msm8960-reorder-v2-2-26c478366d21@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921-msm8960-reorder-v2-2-26c478366d21@smankusors.com>
X-Proofpoint-GUID: Z8d7TaSe-uUHQEM9ERXUSLW09553u-0j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX9B00dLXQ+3oZ
 BrDkcyRF2mxkoEsq+iqp3ccS7jBidh7CYAfP0aA4YE7L/1IUhqHKGC+SQCRF60qGwv1z0AEMG5a
 y04qQSc+4SjcCErAMs4qUgVVCGlAA8K8/N7cLBQHkR3fApEFd7PP2U7s23+d+OBsMFr1Y1o1maO
 VbsdtXmBXKwdYEie7zs5xpmzKynaXnV/5PwoHqwtHfPWpPjuyEZh7cNqa8ThZP1+GnbyFcnUizR
 b9sImpPM5XZSCA2+8VB7928OZOOwEk42XnmpvqB1DbrrMeEeMQ1dm5nOy8A8qk0imGGttWf4ugz
 pDS1lga9soVEW/tOpSkmACG0NN5P5p+WoWTWASK8V3bYC4J0g2cbJixAaeoN1UdZGLkymUdf+WE
 Ma7v/UG0
X-Proofpoint-ORIG-GUID: Z8d7TaSe-uUHQEM9ERXUSLW09553u-0j
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68cfffc4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=wxLWbCv9AAAA:8 a=EUspDBNiAAAA:8
 a=kbTPNbk5bq0GMcXo2L8A:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_04,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On Sun, Sep 21, 2025 at 03:08:05AM +0000, Antony Kurniawan Soemardi wrote:
> Inline qcom-msm8960-pins.dtsi into the main SoC dtsi. Most Qualcomm
> SoCs embed their TLMM definitions directly, with only msm8960 and
> apq8064 using a separate pins file. After this change, only apq8064
> remains split.
> 
> This is a cosmetic change only, with no functional impact.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Tested-by: Shinjo Park <peremen@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi | 61 ---------------------------
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi      | 59 +++++++++++++++++++++++++-
>  2 files changed, 58 insertions(+), 62 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

