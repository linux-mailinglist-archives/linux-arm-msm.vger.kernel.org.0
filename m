Return-Path: <linux-arm-msm+bounces-60259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48256ACE574
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 22:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4F657A63CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 20:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014431E1A3F;
	Wed,  4 Jun 2025 20:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6gwSwtx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9011940A1
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 20:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749067499; cv=none; b=lEunDy8XHlSd2XYoCkSNzLA9M632DNn0jrx0BY2OIXLo8z71kNMJX0f8rI+uGCxV4G9ydcNomPKcuq2qdySTR7zEFgCRI3F/rgNrr2hzHqjokCNsIgmGVZY1Xg/3BgZNl+XLPT0nItOqNQ7XgLXzEJPaiHJ1JhG2lJ/sP51vErg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749067499; c=relaxed/simple;
	bh=3WWidUqE/P4OiyoNob2RxHbKDbzelMRJgU6M8hjkfFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OZLxcA25mN64jT+6FDe9UVBdgP9OAdxn/NC1sp/qZveEeMkaqjuu2hslH+MopaaGpqZeE3tEiNICHdbZlTUO/5WhaObNid/40uzw4Udr3NacNj/RjunxGHZ1o9vAuLFN2Ru6fq54xJVUo4hQLztudgDwwRqX/+oGwn3ax02kMT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6gwSwtx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554JdsKQ013495
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Jun 2025 20:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GETqFDBLOjNwkCUqjvq55LYL
	ugibUI1jy212SxBhuEo=; b=G6gwSwtxq2b8UV8M6h8UBQw8Q9GJs8UGaXL0zRNY
	h0/rNxpbY/Zn3+9uxXeuuhlFg7NfzkTsZFo1ZrtoQ42Cscff6vqVMhTJmyBL7WAJ
	L+Y5oIlY0giBGH47z1CWbjqEiucXZGQehxKnqQiNwMiUrLfSf3VZ61FurFlNETPD
	l2S6oy5H6l9XKkifvltS8/4KnetC9PLzy/Og0zOwY5kZW0MXuRgjOm4MWctM449t
	11vxFanZh3YztqgGsNPcF1FfgE6xTirR0lQ5YzUxEdZsRcUq1p4mCWBgzkDuw/AO
	XK0Vlv+BCEtuf4ZHHpTIz27shkTph7V/exNHLhvxAEFTMg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8nq631-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 20:04:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0aa9cdecdso24336085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 13:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749067496; x=1749672296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GETqFDBLOjNwkCUqjvq55LYLugibUI1jy212SxBhuEo=;
        b=LyLpghxKUHvh0Af2hLYKUdzaTV8ZjF8smdbOMW1JZHbJ/ns7zs6LDOhEAQCakAR0Ma
         +jXl8IigrzUAL0ENFy1uaUihF++4emXbbOKoI4A1zStd4Aa4PHcg7zKQN+RizJF5LSqK
         845+W8XZb5HtN0oa+TJxQ9N7yLfQf4pDeAMUMySIE6PlvCzBze+ZClkTXDM5D/VNnM3G
         cITRP3LM+GzhnWOwXnsPvEY2+XOyYbNfZqe2k+tNTTBhlXqvJAIg6c0KGaxZQmUeylwW
         uYEM7BG2ORnJIUGznOq7fKEZ1ilmbPMp3P54Xo1eJsb+MUUy68iQMMjhsiD18l4z4Wbz
         dSlg==
X-Forwarded-Encrypted: i=1; AJvYcCWMQa8zqOjnk8SpvtTf/qUFeg8Ga8FFWVgbmtMaM1OJ0nEYDd05kr5rRF17wERTTWce2oW4Dnabxc3P9wl3@vger.kernel.org
X-Gm-Message-State: AOJu0YxMJ4lOLm2ODKG2sX/UwlWaExKQZ3NzZSCMalRQA+RRvo7HzjkV
	bXjcR6AHzozSlCJONJvg/Wk8bZcyxggLQ287rPwSdZf1B7L9ID7tLuFBPMCKj1+ITsQqLmufoRS
	NQxGwAkrij7xg9QWMu5dBjOJHes1tkY0CxEF0ZJMKjuBZnpbN0Bl2vogaPkkDV2ag6uzDRFdjFp
	PQ3SE=
X-Gm-Gg: ASbGncvV2M5PFeJJABHDIFs0aU1XtHnv6jHXI22+CzzcMGo5lUqoOL06ckGj1AlqxHF
	H1agqAsy2G6WduYkYsxJiXt+ZKYeZoPLBut/T2kLfpVVHeAnB7JFB8DRBycSiJp4oQTFQB65lq1
	xQoIZCv7ddMlzGGyGSk/AzqRfXhGJPMIviRECMG8ww3fV82R4a1OzjP5OjxMUUhF6/q7zzUAovC
	Gs/mgPnDaCgXCLGzIm1+YJsKPI0Av+QjWU7egFgmGccqqJLqOLmYH2UCVW4GZaH18LG8pE/PR8f
	nqtEenD0bs1MGfl57cDFnmmMBX8Qw57gpZWXndtZAiK9Liepk1yuCnMR76kqfPrcJPCuSPw6Qqk
	=
X-Received: by 2002:a05:620a:c46:b0:7d0:9ffd:423e with SMTP id af79cd13be357-7d21983eeafmr621583685a.13.1749067495801;
        Wed, 04 Jun 2025 13:04:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGjedRKZXk+O2uUWdObWriSOKjKQoYLKQ0YoQHobw0lYOQSTV8DP665A92Oru+2a6e7Y36Hw==
X-Received: by 2002:a05:620a:c46:b0:7d0:9ffd:423e with SMTP id af79cd13be357-7d21983eeafmr621580885a.13.1749067495467;
        Wed, 04 Jun 2025 13:04:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85b1a898sm22612531fa.18.2025.06.04.13.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 13:04:54 -0700 (PDT)
Date: Wed, 4 Jun 2025 23:04:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: .mailmap: update Rob Clark's email address
Message-ID: <u7oip7hbhwc5ni3nd3aa3zemzz5sgdvfjeyn4ca3gttuee2335@dmqcz2m5iyxx>
References: <20250604175600.89902-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604175600.89902-1-robdclark@gmail.com>
X-Proofpoint-GUID: JKx5vqlFmcoGf9uakSWsvU23n7GLWBdQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDE2MCBTYWx0ZWRfX3ZToCrP8WnKn
 zIDJNP2f+fVKLjOfIb/k//1t90NBhYuSBnnJv8StJHfUBPomI0hvu2HKSMzlb7WpKaU/bmq8xQD
 Qe/cdXMATT//3m0CcjNlN8FPKi7M35/cmpCkVyPAi1cmtsG3nE8IZk7/c+l5Zqq995ecUpZ/NN+
 0glHjp1w8DI+jL6EgOjZS22ycBR03DgvB1DmzEFV4o74MUGZYt0taLIEgpNMfNrLCCDw3NRVbZE
 Zbzu4tFRqPJDGajrl1RhoxC08HUkptVG0aGPtcXvxIpqPdsgZMahpebc4ZIB6FvoN24bh2bPfwV
 yQ9UOiGx8nJSd4hIMJxdB86zMhFTpexcucSD0BBkIAPdKCfarVwoCcn0CnbywcDtdYmLi0TeCgq
 4LxlpLgbLu1EIgDqynpUjukS7Ce5dwVaxw4ephTbv3HZkN7fGWwPshP79s/FC6/piGOhGHhi
X-Proofpoint-ORIG-GUID: JKx5vqlFmcoGf9uakSWsvU23n7GLWBdQ
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=6840a6e9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=pGLkceISAAAA:8
 a=hXrwuCzdAAAA:8 a=vIxmpEBTAAAA:8 a=cm27Pg_UAAAA:8 a=PqW8XdIGK9T-exQPSg8A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=AbCNNcS-KtgVtUcPdxgw:22 a=h_NzWJYh3K8fKrkdZWyT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_04,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=869 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040160

On Wed, Jun 04, 2025 at 10:55:58AM -0700, Rob Clark wrote:
> From: Rob Clark <robin.clark@oss.qualcomm.com>
> 
> Remap historical email addresses to @oss.qualcomm.com.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  .mailmap    | 2 ++
>  MAINTAINERS | 6 +++---
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/.mailmap b/.mailmap
> index 6a6aa09e244b..b72a164280ea 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -633,6 +633,8 @@ Richard Genoud <richard.genoud@bootlin.com> <richard.genoud@gmail.com>
>  Richard Leitner <richard.leitner@linux.dev> <dev@g0hl1n.net>
>  Richard Leitner <richard.leitner@linux.dev> <me@g0hl1n.net>
>  Richard Leitner <richard.leitner@linux.dev> <richard.leitner@skidata.com>
> +Rob Clark <robin.clark@oss.qualcomm.com> <robdclark@chromium.org>
> +Rob Clark <robin.clark@oss.qualcomm.com> <robdclark@gmail.com>


Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Welcome!


-- 
With best wishes
Dmitry

