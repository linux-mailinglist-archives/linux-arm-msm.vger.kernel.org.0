Return-Path: <linux-arm-msm+bounces-62716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AFDAEAC50
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 03:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CDEA3B6433
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 01:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5711D41C63;
	Fri, 27 Jun 2025 01:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DGiJoNa1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE7510F1
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 01:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750987734; cv=none; b=rzJ3hKG8d+Wura3/s7atzRspfIaZvqyHFmsXMGA54ZNBamBUprGNi/ANs5OxWiRQoZCEsPRuKPg3/YaG9KdiszOxGxiZRle+/nDP/kMpTX6gWAtj6G1A+y39HKawytPs+xHaD+1TxvdIbEidpfyEboawDuon3Nsz+DDFkVzVvNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750987734; c=relaxed/simple;
	bh=mLhzT0gbEINjxMyIEBcYQYBQbYT3gPLBbXmxqgDjbXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AwNoLi+MVq1FWu0cNNeyp7Yt5BlnKbQfbIh2kMA0unImXovMQMQlIevw9DSzmFzsNjqe+rU7yPH6PmfLZZEjBy9RUPLV04mlFPz5RObJrRmS1BAAMxSRsmAVKiTJoJoL2/l0hCV5EC3fQz8tnA+JgTZhGlpp8YgfsKkRI8A3+o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DGiJoNa1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QHgmH7019207
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 01:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7BHttPaz4TxUNQzBLNE+418p
	FfXOu6+pWP6NmmNpoHo=; b=DGiJoNa1uPazrx+2KERUtSEAXuqt4lVnru3pvqJJ
	J2DFGQVD+8mf+Fl2GVyLhAKu35qYZb8sSEmA1WTSMo0Jt+paxrecMa9BzYPO2Wnm
	KYffpuY2cfCquGg9F5QyTYfsJwHHOucH5FURTX31/PKx8gYxn0BRN6Gp7mT7A/lr
	BLtWaRVfMJNeeERQNRTo3utljaZdI1nnWrGe/cs9btcI01h9BslyF+08y0hFXGKe
	THEzYiPVEtomHF/js31JRvJ927aFAn4gc/NwzgfNid+YfsElOPJc2pjMSfsq0avP
	G1UtWR4nTF2oGSSpQ2sGFu9qddblmKuJfXZMEBVXsbUFtQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26fea5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 01:28:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3d3f6471cso221778185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 18:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750987730; x=1751592530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BHttPaz4TxUNQzBLNE+418pFfXOu6+pWP6NmmNpoHo=;
        b=a5bpgHftK+fr2eCzOl/IgsRsotncUP5fgyfJ9JUOpc19zwzp2GHX5m36Ph0DreBJlu
         uNlYHAfH4Lh3n9MiIMA3qhHMaDX9QZfalwJA231Ondjx7AaVkBxHn9siKbfia+0vJYVu
         iDA3zUArwisDdKRTYxx2bpuBVvA6b5sp93/XUorcCIbYShdx+M1gIKr9FBirva3bJmKm
         6JiTgHiErKJDIzTgmm03iA9Nj3s8DRAbnWLxFqwH7bdH7T5UxF6kv/jvrRHy25yULjRE
         0BdBx0dNUEcosta0v+/GZM4QcYBhvQzcorwTCzjXx0K8BI31vEDePS/phHR7zuWQGFuS
         +72w==
X-Forwarded-Encrypted: i=1; AJvYcCXsMTw/ZNaRXTqgfTALE1hNMcGZZk2+pBwIh7volq31p4OcOa1YggcpgQTWVJmZAJmz8+ocBkssIDO0JpdE@vger.kernel.org
X-Gm-Message-State: AOJu0YyoN28yu38WsVz+z8hj+/IvKZ9osVZgTNdcAn27FEmaON95wyzp
	xbU2bu9w0fgChEtCc13o+z5poXqhDnr4swu0FYpj2kShwnb/ZmDbPu68yPvOs65LGdyofr/j4QV
	zuCYw1frrY3ER/Unucyr82FZftbQxNFbJOOSSQJPewgjBQzDQxcvcBuprEPmFZ9CUhhyb
X-Gm-Gg: ASbGncuWefqanfJH0OYF+gJablQZ4pPu1wuXyLSDZsnVXZgm0exl8t7A9xV3BG3JB08
	NSPjyTyksQ93UupetJLo9yZWCyuLU6yyr319fspd4wvYYtvvuDLJLo2DfcWd9dUC6xsUzwbkRyI
	R/TrgrKg6kLtFWkzbq4wruVgK0ZkC2ArxWlQemfUIhatM0WZDFNotcUO/j2qf7MnAfFyfTjlZeO
	/NIclzRjLJWS4XhfuW8vx+q+0zFFIMJO9V+mUnvJ5z2cJHIJmH7ioZWs18dXYIEt2Q8cADQqEku
	K4pBGLiZmiSxLEGKyKylvGz5qpFkDhWQRrfIVX8Ql0HFP4+Lldg75faHPQ5LCcy39v9C+kilK7j
	F5mjKrUtcOVWZalREBlHDAJqb/TsqRWIlzYk=
X-Received: by 2002:a05:620a:198a:b0:7d3:ed4d:f1ba with SMTP id af79cd13be357-7d4439b298dmr282411485a.49.1750987730524;
        Thu, 26 Jun 2025 18:28:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4mM93pJrmTOiGI3AS8mbJSAOrrA8+GDhMNzP/TNmnR49p+KAgomnY2oA+PJOFrHgpx9euiA==
X-Received: by 2002:a05:620a:198a:b0:7d3:ed4d:f1ba with SMTP id af79cd13be357-7d4439b298dmr282408685a.49.1750987730124;
        Thu, 26 Jun 2025 18:28:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2ee85e9sm3688701fa.82.2025.06.26.18.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 18:28:49 -0700 (PDT)
Date: Fri, 27 Jun 2025 04:28:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: Add SM7635 interconnect provider
 driver
Message-ID: <2we5y3aimhhizbsr6rvhpvtfkzl35lvpqr5vlhpxzsdcjudlqb@iotpzxpksveq>
References: <20250625-sm7635-icc-v1-0-8b49200416b0@fairphone.com>
 <20250625-sm7635-icc-v1-2-8b49200416b0@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-icc-v1-2-8b49200416b0@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDAwOSBTYWx0ZWRfX7fe8NVcM/SE9
 mEKtIFKo0wYqZoRAZs17esB6RQr3l6ASyPT0ArYHBIv3wOgvErRcz4bWcuL1TrO47dheGgEasUc
 /TmQ5qxCcHNGTlu0pIXGLKNPac2tJ+SVvgpyrjSXBCqGquZf9wbOULD71wHzJskhiCWQ/QeTwSZ
 tifgiPpAiBD73dhL0WlYgzpdUXHMsZXYSgw1yA+K+1Osou+4qrW3etAjYBBTNcmAntm/yqh2xuZ
 oMTsSBoAS6wp5+cxQO5IOb9TwN4djRI253EMmr3+565PpLA1aQDEvqb5VOh2LfHHoEu7dC9ZdEn
 IzxEIfxj0midksF5G2KUzcyG7Lp2QtHxOW3Xyf+VGLzdpee3LRFtID+GyEREW+DkS2FD/yUFsMN
 89V+M5viZemZSOOyOsGP+cxkZP8kzrf70M1f7pBc6m5ly/REDuK2IFUV79nYwvLneg+yLFKC
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685df3d3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=lAZXaacekHF5OtbiRAEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: RiA2syKW9uTTzcOB_3LxfN9H7oJu3Ldx
X-Proofpoint-ORIG-GUID: RiA2syKW9uTTzcOB_3LxfN9H7oJu3Ldx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_01,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270009

On Wed, Jun 25, 2025 at 11:13:48AM +0200, Luca Weiss wrote:
> Add driver for the Qualcomm interconnect buses found in SM7635 based
> platforms. The topology consists of several NoCs that are controlled by
> a remote processor that collects the aggregated bandwidth for each
> master-slave pairs.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/interconnect/qcom/Kconfig  |    9 +
>  drivers/interconnect/qcom/Makefile |    2 +
>  drivers/interconnect/qcom/sm7635.c | 1554 ++++++++++++++++++++++++++++++++++++
>  drivers/interconnect/qcom/sm7635.h |  130 +++
>  4 files changed, 1695 insertions(+)

Could you please use dynamic IDs? SA8775p driver has been converted
already and I've sent series converting the rest of the RPMh drivers to
dynamic ID allocation.

> 

-- 
With best wishes
Dmitry

