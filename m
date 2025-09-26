Return-Path: <linux-arm-msm+bounces-75319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BF5BA3EF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 15:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B12681C0428D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 13:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D4719FA93;
	Fri, 26 Sep 2025 13:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DUJaz2/G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811382557A
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758894423; cv=none; b=O7NQ/wnnDUzxHIAYaRzgaSWV+o1sx0ZUzvQF1JnHwFvGwB4Y4XsjWL+NbNA5j12Uab1dFtgDVC1UrR6VnroruxKHSmS7Kn9TEIdx4HsMMoGqY9K9OS5JJuGwlZ7VNg5Vq6haB1eazPAgu5m1x+vK63hcvoOmz6hC3SDCk3mBMeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758894423; c=relaxed/simple;
	bh=aBFFYUPfC1VbKQE1JBC50s2T3I1/bqs0tYQQd5BNEuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0tPa38JJ/1++HZ1Np9NNfTxHy7u5G7RfpcImfTPpt76UdHDvnMiMa7vM/ZD0OJfFLtL5clcW5fkrV7VB624ijt2EaHDkaob6BtyNyuDKc6LLkBrIMhdX0fsZKXb+HHFt7R7T2NAqYCzN0xM1a0wgAKLywmWCTkrdF19PU3f7UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DUJaz2/G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vZ6a002607
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fBPPqyIhYVrf4TXpIWvVvJCP
	+mPfq0dKR0wYVfEnFfI=; b=DUJaz2/GwPsGNd2speBWtjpXKQs578FAI0Vmt1GC
	9F4BiV0kpIvpRdbxDIAybUeIVvyYjZ2o3pcCmMwVE93wg917o6DrBMtzj6S+C97z
	s0V064dvfr/FAWjflKKSoAN0iDaKXmzkaSj/lTL/hDopIywRcWpTeVLR9eYvQaY8
	CgNm9SGvvTmiLIWS3oGQt86phUNcPjze03vUh4iH9acxAXE1iQIZXXYaDPwH3X3x
	RaO1Yt3t5W90SJT1NNMUL9Cv8kS/RDX0i/jv4w88TWwSt+5sH2OJkc3yuX0GofqB
	SNEtwllVljkHy52ll9zg3YRaiK2qYcs9Cww7aNn4Ucos8A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u30xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:46:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4d77ae03937so60268611cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 06:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758894418; x=1759499218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBPPqyIhYVrf4TXpIWvVvJCP+mPfq0dKR0wYVfEnFfI=;
        b=ghtfgapEGmG9G+qW57EdBbil4zyFekquEr/gsjzbJhmqsug3QVQThkpwgJpwbOBW+z
         i2ozwvz1uhsiRSBut7ESvo/OVP/MlUP4LRnTbM5yen5oHLZsUMovmbJrGHO1eDP3SjRX
         Pb538agTCD6r2kZ0tc9c+bjWUURDOvgiOO59DUxivE/S3zIc2bUpNg68GGNPBhb7USBD
         m0/t1oUS+oG87WQcZf47qedpnJxSmUsp7eTR8FYLrQzNhW4PS3bpVb8ay2LhNUOj66+E
         cylkv5Yotpmz/iRcf6BkT0E6HZuZ4R3GObkbhOuzCx5n7EiplyCsMDCvgrBnfa0qRG6y
         AyjA==
X-Forwarded-Encrypted: i=1; AJvYcCVtBDfek4Ienk9nRuhV8fwSZ/kbX2TRq+2tfC8IvwV1J+OQrrfCAwRlvz0Nv/bC+S+16ESEqw7ObDBOhjPa@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+psiCfVmfWPA/i4rk12+MxzZBy7BVqJIQKTZ8glSM2FWpuTYr
	YcZeJwd8vRMLDnhnoXdRuJpNw/bvU0E3xBJ/jM+ffQ02P+5mI4o1ADAqz0wnORfA6bQBKrm5Lb5
	3GWTqQQfVEbevjRJUJim1TlUZknkmca5z+8Ja5G3WoRJWxOBDtQwXKTjizPSiKrLNxjwV
X-Gm-Gg: ASbGnctJdZZAAgT31ohObzjcxWYnoV4PiX5W8xhcps1ly/e02NtUsDHAUaP4voGr9RH
	toN0woiopoM904QwXIUX2EE0OrPUUZX+2weJV0cRAwwRLSHWVDUtccwIv2WJPME1ko0ie0mxvi7
	8n78jhYpPA0UDje6gLot2Pls3iM5yMs2s8Pr/yTp1wJTuAMmD4IDjNE5KpnQ3diKVoebDDTh8/7
	qYiLM9YzXd1PCJMRr1VGLdqZWXdv2Njssc8dW6yyIPxBPTcrFr/0psgph7M574hsppaA0PCJAyI
	Y/i8uTVoQOBgFsughiM8mACN5N/0IIcnYoS0OqlcBlna/1+pyYMjKHBeFGVh1qiZmkpOLhdW7AR
	0XA+M9E4l39pf01r7mB1r/RoiUJGvCxqMC+0dIXt8gK1z4tR5JJcx
X-Received: by 2002:a05:622a:1f09:b0:4b7:9f68:52cb with SMTP id d75a77b69052e-4da4bbe54e6mr107537091cf.54.1758894418372;
        Fri, 26 Sep 2025 06:46:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgMHv4hlXwVECvlZwSLsQCs3yZNz5dZYBkviU6fW7qoQdMWI+9oVr9Ah5YxWdPj6tHgyDbsA==
X-Received: by 2002:a05:622a:1f09:b0:4b7:9f68:52cb with SMTP id d75a77b69052e-4da4bbe54e6mr107536111cf.54.1758894417530;
        Fri, 26 Sep 2025 06:46:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316656453sm1831278e87.92.2025.09.26.06.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 06:46:56 -0700 (PDT)
Date: Fri, 26 Sep 2025 16:46:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 14/20] arm64: dts: qcom: kaanapali-mtp: Enable more
 features
Message-ID: <vftateior3shdrifao5ueh2pyjbuqbwb3sw3gywzghyhwkplfs@7tzocm576bin>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-14-3fdbc4b9e1b1@oss.qualcomm.com>
 <ejcchgc3isc5f6tmiqbxqihmk5efmbcyhv3ehuoerb5ulkd5an@g7a2wc422l6n>
 <60c65d7c-1564-40a1-830b-1c9931776fb7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60c65d7c-1564-40a1-830b-1c9931776fb7@oss.qualcomm.com>
X-Proofpoint-GUID: QLt171NQBaa7R_xXH7msQt_ILuX7Nosd
X-Authority-Analysis: v=2.4 cv=PYXyRyhd c=1 sm=1 tr=0 ts=68d69953 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KfCWjoryZpLtWRJACwUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX/h8i9QjrLZiL
 oc8xw7mzFYo6KEMVHWG+z9k869tT878rEVzlJx2AaIAsZVZNOyeGrh1o4HwL9AXq25j/xmT/bam
 qVUXv7HI3EV+CfK55hBmScGuBi7dvuGT6x1gM4B7SwsLbKDyjqeoQ5RbOCMVtA58tF5oeZqsdsp
 EhXgDbJXEF7hzl202mlCrxcNTIlXA8xijNl1wkyDkd6o1Hu03rC3lJqr1dd+rkIbiGqqYrk8IBR
 P5ci2ph2ep7FYueQtBYz2QbwlH1fxdGzocK5CVLborij2dwqEPDPIenff/Qhq7c2yrSFAF4xDDA
 BQcmWsoHaUghdJviW8LorMbCajy+/XoTBT1A51DZbpp7EPiHUdn2o46smv9Wv1Mp1bwTGqwgqWA
 ZKWu+dHbvTi1QI6Uvz9CHzkUdF8gMw==
X-Proofpoint-ORIG-GUID: QLt171NQBaa7R_xXH7msQt_ILuX7Nosd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Fri, Sep 26, 2025 at 02:11:16AM -0700, Ronak Raheja wrote:
> 
> On 9/24/2025 7:09 PM, Dmitry Baryshkov wrote:
> > On Wed, Sep 24, 2025 at 05:17:31PM -0700, Jingyi Wang wrote:
> >> Enable more features on Kaanapali MTP boards including PMIC peripherals,
> >> bus, SDHCI, remoteprocs, USB, PCIE, WLAN and Bluetooth.
> >>
> >> Written with help from Jyothi Kumar Seerapu(added bus), Ronak Raheja
> >> (added USB), Manish Pandey(added SDHCI), Jishnu Prakash(added PMIC),
> >> Qiang Yu(added PCIE), Yijie Yang(Added WLAN) and Zijun Hu(Added Bluetooth).
> >>
> >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >> ---
> 
> [...]
> 
> >> +&usb_1 {
> >> +	dr_mode = "peripheral";
> > 
> > Is it really peripheral-only?
> > 
> 
> For this initial submission, we haven't yet defined the USB role detection
> infrastructure, so it didn't make sense to include dual-role now. The
> controller supports it, but without the connector bindings and role switch
> implementation, it would be non-functional.

It would be nice to explain this in the commit message.

> 
> Thanks,
> Ronak

-- 
With best wishes
Dmitry

