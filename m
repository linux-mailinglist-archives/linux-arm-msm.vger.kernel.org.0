Return-Path: <linux-arm-msm+bounces-72878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A586FB50967
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 01:56:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 622D55E5693
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 23:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390652949E0;
	Tue,  9 Sep 2025 23:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mXAAWBXj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9675328CF41
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 23:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757462166; cv=none; b=YGB/OH4Sdci6t5wRn2Adel6zfgIur4I6BPWUCN3fRLiongO3r6TXvM7cOSmyLYixqO9ciFvZr44HMLxuzwu0rnqjudPRnELG1kYs0olI6oTD7iOI5fVmB72FM23ETPr9tGfm1ZE9kIpHDhv65mrJZowAs+lgFkFI4vgwn6IFRYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757462166; c=relaxed/simple;
	bh=icD9gdWPAJJWeEBQEpTeScQSiYNChrtZNid4ligZQ7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JhlrhQ+sEmi6NghThkaTGj6krw7kZNfdsCyE2QjL0IstsyMXGofliudGB90ygzBwlIC/VbkKDnFa32Oq0jGMLB2Mvobif5cJtGm3EFHSnX1mFj+yxEJ2OUyIfwa+tGj4Crl+1/VkRu8Xyp3JGmeY08Y7K0/5voXccswXTngQgr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mXAAWBXj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 589I3nlv002294
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 23:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DOgS6PiQ/hnHybpp7vuDXCDS
	oK5LCMPR9NyO/JUnO1I=; b=mXAAWBXjLX1HxJ54WRna3AxQJL7zH/dZiqOT6/Wi
	rAFtu8RwDTdyNpY+FNLbMAIbgcqykd5u4egWc11FoTpNo3ShwkbT3JZ+/cDnmOUc
	qmg+yBuPjxNnrbrNwz0uLTuTNASiaBQVqbkqUkNWYGH2kF9CwI75178tFkuVQ2C8
	IuoZ99dxZRlcJE+hSx3q6Srx2qVtGNvCbnmgIoKkPfoxVvuj2AV8mhT8dfcV/UdP
	5q7RusnOqQ0OVP9nCMW9m0g0yZF+IKJMk0qek+t3v1haUBSRgESgPb5enGx2UmdS
	kZI5r6jbUfDTt3H6JmPXHRT48RaOB1HVQ2wyPCUoHkUG/Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg1tj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 23:55:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-72e83eb8cafso99874126d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 16:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757462156; x=1758066956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOgS6PiQ/hnHybpp7vuDXCDSoK5LCMPR9NyO/JUnO1I=;
        b=pR+CJfTne0swC31TMKfZRILkOmtExdEhTojJeyeKH2nvNTDHi71h7oVSJ4MlbB+40z
         ZJqJVomYkytPRdYqYI+9/lSL69pdOSvkDtXn6ReXR5tkGpwK+KnIy1niDoPWY+knxR3e
         Hew3KXg2q0z52EMa3o9KFWjrzG8zf5sG44oGPMwL4qQuktl5SzpOo83Ql4thcgTmGqb6
         fFZT85MEyi9vudRHXTecFRR3X4vxVD74N8tGqTvYCgXigGk09SNi1HewdM3XOzStm66E
         ketAMB0ouhJyd7BUVd/G2PH9Zz0prp7VYbQH4n+l493e+fPCyGAVCRSmZHKgvrU7OS9V
         zmBA==
X-Forwarded-Encrypted: i=1; AJvYcCVD5bSJ5Pd+hjPOl+snPVkRz/fS80gcG6GtM/MTSQHSJhaqn2aia0oZpya4QZe61gTlgvsjhZ1As4qv/0HN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf+JR5XxsM/6o4466OweezeEQ5EQg621XSNjp2U/YA8RUKI2nk
	M2gPZ8uozIpj+F0ZPRL90vMdHIfXnAJCiAh/I8W0bs662+aDXZ21g7+n7LiqupHsQ07LiwWbPOu
	qTQulBvYUyQch8cuN0UXnsTkgcAtWkN3b+HhqAmr7BC6y3/DLd3+iyDQ9VV9G49bvukTC
X-Gm-Gg: ASbGncuqJU18uJi2S74qFS6NAtwnr7D3NbHgRAWLBeEwLCXC3ZNgu+k2Yyz2e1VJHxb
	gtIgY9JGnoZlkD9WERsG+CB/ACdO+uEfa/SIONAWnv8CkKHLYbYJqMn+0OqVGqyNxEHuDnbBeqE
	NEuJ6YENhCz+NeF3zTmHS5/cHGgApwFpIe8V/3MPNVwUOTbelhS0G+szNs30IXSkZHuCwBJ3pm8
	/6bQmb7EM21TynY+AIid2GyyvZBnP99/klg5GP9Hd9pRNsr5tQI+Bny5RSyKd7eiHCrIFgRkIeu
	n0dk2hYdwezCMycmXrX8MlIYts0ffK94nY514lEJjW0FhuXwIef0764L/I2wEiQgPhqfSQAImoj
	GCcuHL0erbn504YmfgDF8aP0pDdfWGU6FiMR9fCQbEZATRZ38nYsH
X-Received: by 2002:ad4:5d63:0:b0:70f:a874:9838 with SMTP id 6a1803df08f44-738fd44e4c7mr123779856d6.0.1757462156569;
        Tue, 09 Sep 2025 16:55:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/+l4IAg1ke/qBgFq88M1rFWuCS6rIGDcnBc+blOxvMw+WiXtyVyRKy/O3bA1dxeMZYgKWSA==
X-Received: by 2002:ad4:5d63:0:b0:70f:a874:9838 with SMTP id 6a1803df08f44-738fd44e4c7mr123779656d6.0.1757462156128;
        Tue, 09 Sep 2025 16:55:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56818a11806sm831373e87.129.2025.09.09.16.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 16:55:55 -0700 (PDT)
Date: Wed, 10 Sep 2025 02:55:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sean Parker <sean.parker@viasat.com>
Cc: andersson@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: qcom: sm8250: Add egpio support
Message-ID: <don2dkb6wfi2g6o2lwwjk7khnptiauvzpnxie4qzt7bfy4xona@sf33md4bqqwj>
References: <20250904170613.68855-1-sean.parker@viasat.com>
 <20250909205248.16169-1-sean.parker@viasat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909205248.16169-1-sean.parker@viasat.com>
X-Proofpoint-ORIG-GUID: ODcSqeMEMY8xoNvQOKWhPPMlr4JKr__m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX4ayJwZuDVdZd
 5acuPgpK9oR6ysaRE97WdudfImxLy2u94VwV/YtRHVz4yAedprHO10mfS6ob6Xkh/SuB7bU74Wx
 yJh53Is5WjVyJ8xGZUGG5RLRsn420DPJZ2bz6TSqixalWQnUyRV5iu1QSwVTBxn8L/hGpZbStdR
 abKTyAY/1BFPPAfJ1MnZz4gXKCeq31/1EXfTqdbzHwwT894qLN90Vi0jiFNwZJeohgmclobIh9J
 4g6pY0NVJQE6Geg1SuxK4pt8CJQEncjodhhDQ1l9Vk/zDosqpo3q5o+2xT8lCi+qBD9js8UvHVQ
 rZfSZJ+HIii1SURNfEsGws8UI1x6jB+RAEfVHpFzJ1X0pWEvv82yVq6eupqDs130/O5AWANPFom
 lm2iNIYs
X-Proofpoint-GUID: ODcSqeMEMY8xoNvQOKWhPPMlr4JKr__m
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c0be8e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=B2zXoFvHAAAA:8 a=EUspDBNiAAAA:8 a=HbEANjnKo7ABX2ZL8B8A:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=VYVPV9JAioCtC5HZRjjr:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

On Tue, Sep 09, 2025 at 01:52:48PM -0700, Sean Parker wrote:
> This mirrors the egpio support added to sc7280/sm8450/etc. This change
> is necessary for GPIOs 146 - 179 (34 GPIOs) to be used as normal GPIOs.
> 
> Signed-off-by: Sean Parker <sean.parker@viasat.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-sm8250.c | 81 ++++++++++++++++-----------
>  1 file changed, 47 insertions(+), 34 deletions(-)
> 

In future, please don't send new versions as a reply to the old one.
This messes up reviewing and can confuse some of the tools.

Nevertheless:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

