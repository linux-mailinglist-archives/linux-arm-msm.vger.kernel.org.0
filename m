Return-Path: <linux-arm-msm+bounces-70384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0829B3164D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 13:29:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89201A27629
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3602F656A;
	Fri, 22 Aug 2025 11:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L2eJNvS0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9DD2D249A
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755862094; cv=none; b=W8NiElztHNudHnRVElX/v7ZucPKFRps3Z5gkAZ/69LGTr893GPIUU17cPcHGPRfKnH6CxLBkIRmbEK6T4zEAWWw3id4H1dj7/3lqk3sInBNeb0QmRu4EHxAuLnlPr52ojPaxuyfRudxaASYbba0FMTO0sykrC7p34T5YBjWXUO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755862094; c=relaxed/simple;
	bh=+z1J6cCjTp4cVVZFfPJQaGcyBnTv1CpWlH8yDx6pxfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cx/Zx5rZxdvVIc5rjfXbTZr1sYj76HK5nXorYZpnpwmefQruRHCfsRbhIKaHCMTz5Kt54PigRpIxjE/9ieW8HwOGbP6u3IVY1iBRNxKgXc3YvFWs9F2sNxsbpQ9CSxz/9i9Fk8HVlUXm2ZEJaysluEpwvD6AkVQCldGZzlgQEB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L2eJNvS0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UM5Y011140
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HQz9YlcrsVzVP4cHdjwrgDoS
	WKhu5gMFDTaj+Iok/ns=; b=L2eJNvS0zWsr7Q1hBIQQoXynFZf0P6WCQv4SNOS7
	BWWrgCtjA/3wxq/M816xosxDI4D0lMXphZ0J0HM+zZiTgoPIDML1Vbr2jfoPnNnU
	rZiHWfKzKIRZ7IQnmVNSTLWAxcRboXvmTQuFGH1dtRT5aHzBK7mjb8XmpBCafvhg
	p3+9aJqRBJvZvHDCEg5zwBdrk05TuY+2ATiB9vsfajakJj0Quv422whZsMjenXzD
	+tTlkJvkI/v/nwMnA4Vwod3Tuk2xEZEPq9rMNEq3quYWuM1tVY/dG1LfrBU5xxuZ
	FcawWBLMWfgmyIzTeQiW2cK8z7nASWRt3xBvvCOoSg/ZoA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt8eudu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 11:28:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e87068c271so524057585a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 04:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755862091; x=1756466891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQz9YlcrsVzVP4cHdjwrgDoSWKhu5gMFDTaj+Iok/ns=;
        b=hcGGGwFy09emkp4Oi0YOzf0gAp1HPQGUqkKm1aR6wzpW336RFrAvBg4jAMI6kPzzxn
         ZW5ZSpRqSwESIBwmEH3eF+DkKghqhIJmrVKXzlXC+0/tE6WBbz678u5yhqz1xeUEyWrJ
         YfeejAisoupoO8Lk3yCU8iTzK6HAN70bTXTDa2GMAN9V64vOHq1wsn9OPTPo4/F9rYKH
         Flf587s98H3TCr+nEn/tCBug3CqezkmmhFy20QC5k3X+lhRwlYH7kBggUaBE66ROUdKK
         TVlAX9xspLRzCGnkLhqJVRzsVtNg9AlHsGR51pLZCr4faVzevQB9Tl6T2dNWWuM+KaHw
         Gc/w==
X-Forwarded-Encrypted: i=1; AJvYcCU3hJeEaCn9HsVZCM7GLT0v0rD+t1euoBkdX5Puv5zZj9lOmxib0PiKd9kJujtzx9FFyfOoiHBMaxn+M35A@vger.kernel.org
X-Gm-Message-State: AOJu0YzRBGUM8d7pfvmPHY2lTEJrGqs7LXg+VBJZfut9oO4++VEPxdoA
	+lybMJP1T6AKNXiiRy6mTeD52b0XlIfMK2MpQbi1JNJZDm0rNnOL0zVu7lbTho141fEeGLfkiv2
	x2y+j5uxGZWCuTct/B0SXBgnQGslj7+Cj3Gqhy2qpLNk9t0bU65IpMj4fiOTHXKStSp35
X-Gm-Gg: ASbGncumN2Vz1wxSe3Ff2TGdtaKCoHeYQmWlQbgrd2cZfNX/zzzjIVoV4hcNK1dURgE
	g+d7WaadSrD7DjmQ1c3HidDYsU0b7Xgyd2Qj9AGNcC/q7kskO/unFtdLBpihaz2y21OcQz6ieNa
	hJAlEokqpps+Y5wkMngh9YKx3bkXzMmeQtgYSzayBsSU3xpgFFvUnl6pFmBpPgmO4u8AKvANyRu
	3OHdW2jEmJcN7gJhoSunClN53tovXo/TNP5Y316MtDqSSBoa93jEc8sKgqBjYjwtZhoK+MsjBfH
	ra4JT6y9pJ5WI6IE55Omzy4KbCAu3yYCRobDFvH1z7qDdbQ3Fvc5ZNtvMXcCcg0tWvdUBqyOH2f
	CswmNp6JuVnU/OblMT3duksv5oppuCUD0VDh4OgvGCcAhlmjNq6SC
X-Received: by 2002:a05:6214:d07:b0:70d:731c:c81c with SMTP id 6a1803df08f44-70d971edc63mr31908306d6.55.1755862091202;
        Fri, 22 Aug 2025 04:28:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQfRAzVUKYrkQDCJSAkHkG3B6Hn9CCgM8N73vWZyOY+0UMPseinW2ZJn20zITdxr8y3MuBqA==
X-Received: by 2002:a05:6214:d07:b0:70d:731c:c81c with SMTP id 6a1803df08f44-70d971edc63mr31907706d6.55.1755862090515;
        Fri, 22 Aug 2025 04:28:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a4742acsm36642481fa.28.2025.08.22.04.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 04:28:09 -0700 (PDT)
Date: Fri, 22 Aug 2025 14:28:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        krzysztof.kozlowski@linaro.org, neil.armstrong@linaro.org
Subject: Re: [PATCH v2 4/8] ASoC: codecs: wcd-common: move component ops to
 common
Message-ID: <mmheu5fctvd47gmwilievo27suijuok7zr46qz5acti7vsrpaf@osdoa5ouaqwn>
References: <20250822104927.2621866-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250822104927.2621866-5-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822104927.2621866-5-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfX5UorUY4mk8WA
 9ugH1cNstWqJE/HVu/TCx1pycIhVLwfxkdZTeQQOKLDPWG8w735fLlUj9P2O3rp1MP7ZI745X1r
 bxkXk5jTWUP/vykaqWaAlgPidKcA4jLxZ7dIj7MewSwlwe3Y8ynlfMeZrPKd0/luamYZ75MSD9m
 UEOslM7kwrPrlv2MvGfoe/gx4PONywjpjV9uZktl9wnkauP1LMZYR7wuGWJifBIQ7ZfxMI87KxV
 Km2+eizUa7i4UaUfIyWGJZBLv4RXogbNNszw21iIrMg97PE6NeVNR1xfOJi9X6z2nYCTB1tXdyb
 7Ybz22p7MOjpP7Vu2JU5GuZMA6ymhXZ7QMGm2jCsYzzy5FFeYShj2pbv81ukeh7JaANx8za9guy
 eFkBRCm0777+QBjOevtwWpAgO9kr5Q==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a8544c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=DUU7LNq4FxFGKB8gttsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: f0dPUWKfTzTdVJe6yw-H8dLaTxtQDjdh
X-Proofpoint-ORIG-GUID: f0dPUWKfTzTdVJe6yw-H8dLaTxtQDjdh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134

On Fri, Aug 22, 2025 at 11:49:23AM +0100, Srinivas Kandagatla wrote:
> component_ops for wcd97x, wcd938x, wcd939x soundwire codecs are exactly
> identlical, move them to common driver to remove this duplicate code.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/codecs/wcd-common.c  | 27 +++++++++++++++++++++++++++
>  sound/soc/codecs/wcd-common.h  |  1 +
>  sound/soc/codecs/wcd937x-sdw.c | 29 ++---------------------------
>  sound/soc/codecs/wcd938x-sdw.c | 20 ++------------------
>  sound/soc/codecs/wcd939x-sdw.c | 29 ++---------------------------
>  5 files changed, 34 insertions(+), 72 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

