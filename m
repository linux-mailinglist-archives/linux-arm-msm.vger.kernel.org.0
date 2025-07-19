Return-Path: <linux-arm-msm+bounces-65728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F84B0AF1B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 11:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30FBB3A93BF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 09:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D9421770A;
	Sat, 19 Jul 2025 09:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aYNd9kCJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D2621ABB0
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 09:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752917737; cv=none; b=UmP3QxBAw7bHI8Rgx5WbH5GcPI4Nwl5FbyFON1ecNfO03wdAouXCxut9r0D5tFVU7WkpAsXt0f1/pLnYV/ETIXs3DQv3RAchOTRWubIID2loJD+6xvXtpr3PI4+P85P2cwN1VdzgBGeA+Xy2prYHcwAHTGhNCV/3yzVr+ZG26qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752917737; c=relaxed/simple;
	bh=hoSWN+5jhLJI9d8DpMrlNxb5YX+YAZkHose3puHowik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNMxvPJBK/6PrjfzHvmKo/Akh7csB+2gvnKVzUt4pl3Jt414fn0eeat1NVq+rHqF5sYrmFLZn4n83nxAlj6qRMwrG2E2rewt5igLwlTMF9o1cMnR41DBpd23lYRNqZ7iKX+WZ+/rjNcRMKUOpRSF2SA39oD37Ro5f3suI6KcCk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aYNd9kCJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J4LDCE015157
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 09:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wSbh+xGKxOsPi/4J27pwmx2I
	Cc9rg1Dj97VeqIVuWg8=; b=aYNd9kCJBpJD8plQqeqjz/IuZ6xQz243UkfZsZl2
	xfMrkrgp61/ad0lwFhnxvzBZfBwaJwIXkXf+e4secVC/5Zb66PlHfH2bQ/AkEQ+S
	UEJ/TE/6lu9GEH+F7mTu33dlaEhdBI/Yb4E672HHDkvbeePuQWNPnt5Ugt8xLvpW
	2NOJV3h/UJxDWgd4VAhTCZnyDQVyPnZtJ518PNR2jrsKVTXIl0E2AXtcYmM4tdVC
	mFYYA1Km/E9LwiHwpq3c/Kv9KhFnaLRe8lpUSbJevx37qrINemTr/FNDDjGvOUuO
	6ZFE3SL0a8tE+FSiXq7eCzkMG4OfC1IjMDr/8usJHWdQ+A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048t8dmg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 09:35:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5bb68b386so773007785a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 02:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752917733; x=1753522533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSbh+xGKxOsPi/4J27pwmx2ICc9rg1Dj97VeqIVuWg8=;
        b=Xt/iUnquyiFlRVu6dICyl1El9lUW+bUDdgc4kgbCB0y/7Wn0+sgHbq3dNxHkejRzuJ
         5C5T8NMi25VwxIc6eqtrUQG8Y2QIjQAKnpq2pSqqzZdHB9OtXv9hIJOZrHXgLHXE0l3P
         iS0D32mMGMYz+Wc+tC+5lUMooAoQq8Oe1GtLU69yggT2BdGuMg2g/cdTY8sdKS+KHrVY
         uH/ZHY86z0oQAKE1QLImqpNWuySFWhxuTHX8pKCV7hKOvYHThzIy+7jftAe0Mgg7pMJG
         S6V1VQaOfcg3vg523FPpluvTkIR93r8PsaEGhW7xGVeAA2OVF8i4/37LcUGxoXZr/X68
         AM9w==
X-Forwarded-Encrypted: i=1; AJvYcCUvWIz4rXdgGkMGDg2GrxWlQsjwJK/eKLyTtv1evs2ypxAqrTupqURnyvQufMJ001R0CmphSYGjG8R4br0b@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh+Bk9YFMeBF9DyfNWsNJC6zvKt3Xlb51Gp3eltcjBedoaBV/q
	K54nbEc4yX8sAN7BFpiBy69QzThv4sGq1qbJ5n4QaKw8Tk7jFK2gWpCG6h4HOIhKh0VXQ9TNwK/
	HYm4kFH6Yt4+n6PriJeLzkQhasSElqYjm2qiMcDMntZHku900vunqn6XCda96h7J71iCQ
X-Gm-Gg: ASbGncsuutk3msbpYSE5Q0pFSZZbjwgPt5bQBD83YHKBg0jWBrur2WxHX2zvZJBrxH/
	2X8CqEtP2yguA4eJWN88ajJtZz2kESycNpS+qM7v8veiafw/4gPC8F2nLKGRJaVWFrbptjbDN7n
	oGP9YcLLwtvZwRNqmMg9deTsP1vxhjAN22RkmwTfyyB3KDwmMMhHt6zjaM5vZMWt5aCxJAxA2p1
	YpgnAvmPVxzuxzRe4JMDOJ/LxZ5A5r7t/HZ33ldC8TnityZrKlTg8JJEqO+h2AfzQczPl5t2kJS
	P4PXlc4JYwuRQbqagfjGx/I4oLyFxs0ao7Us1eCh38MtvKyXP8Yicd17J8DIPbQ1SyONZeciVPv
	9CfEaeGxXWhWnbKapR3wLvfGd9maE0gnehPpUI6er+Iu5UI/w221P
X-Received: by 2002:a05:620a:2699:b0:7d4:28d9:efbe with SMTP id af79cd13be357-7e356ae17fcmr791788485a.32.1752917733024;
        Sat, 19 Jul 2025 02:35:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM5wbUvtWyq03MOIlSlrD0IZhIz8P5EDs5+tTPDfigb89vA+4wYsZvArhwqxS6KlWMIpuEvg==
X-Received: by 2002:a05:620a:2699:b0:7d4:28d9:efbe with SMTP id af79cd13be357-7e356ae17fcmr791785185a.32.1752917732539;
        Sat, 19 Jul 2025 02:35:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31aba0f7sm648128e87.83.2025.07.19.02.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 02:35:30 -0700 (PDT)
Date: Sat, 19 Jul 2025 12:35:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] usb: dwc3: qcom: Don't leave BCR asserted
Message-ID: <iyvjr6fx3ec327mcbtemxdke32wzm6xy2zuwbdimy7ticsuvmq@rlbqiwdwi4x2>
References: <20250709132900.3408752-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709132900.3408752-1-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA5NCBTYWx0ZWRfX6FCqbFvq6VZj
 LhdVPepiF8mNMijktPOBHXKmTuUkuxOjBPC3MTntP07C7eInohxVNEVSnBi9gD1kkqhS6D6e3FB
 1s+SzKLWzbF4LrFeXtxfhT3vElRPayiMjz7Jr4MilPmHj4YrRNtVG0WVVxxc9I/Ib1cf1GU8JWC
 Dm/yuKtLqDfk9uPjrdzkJntGt1B+t58R1W6AlVf1IGJ3Vxl1UKDnomq1xjNsNzakOueBF+Di5Tf
 UXb0BLQ8UaQpm7NBrWJaW/s1+eiWzE7XFxMWsRX15ef9GO8Mb3WrowV68GyuvS30Cw8q2DifG+6
 jTz/Z16XfkZNwEFRSDHDkjuc/y1cPgaYqEqEHFNNIV8LdWyyWQu1EToBh4kn+/FK2Feb+ZiS9dm
 YTDcs+T75EB/cWLSrTrKGilCO9AISE7fIQnhoFvrVtUHZDOqdBHPX4avmzDMh33P2WMaDgGA
X-Authority-Analysis: v=2.4 cv=Jb68rVKV c=1 sm=1 tr=0 ts=687b66e6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8
 a=eOX_9S80fVGYM9ega84A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: sFzzqKTdKrdxULDft8WzisZf1ZN1G3qS
X-Proofpoint-ORIG-GUID: sFzzqKTdKrdxULDft8WzisZf1ZN1G3qS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=596 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507190094

On Wed, Jul 09, 2025 at 06:59:00PM +0530, Krishna Kurapati wrote:
> Leaving the USB BCR asserted prevents the associated GDSC to turn on. This
> blocks any subsequent attempts of probing the device, e.g. after a probe
> deferral, with the following showing in the log:
> 
> [    1.332226] usb30_prim_gdsc status stuck at 'off'
> 
> Leave the BCR deasserted when exiting the driver to avoid this issue.
> 
> Cc: stable@vger.kernel.org
> Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> Changes in v2:
> Added Fixes tag and CC'd stable.
> 
> Link to v1:
> https://lore.kernel.org/all/20250604060019.2174029-1-krishna.kurapati@oss.qualcomm.com/
> 
>  drivers/usb/dwc3/dwc3-qcom.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

