Return-Path: <linux-arm-msm+bounces-82485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDFAC6E404
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 12:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 89F1A3A316C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 11:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4639A346E73;
	Wed, 19 Nov 2025 11:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AWHf2y5r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bkG+MSjz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD873538A6
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 11:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763551674; cv=none; b=BkpGhlicHItF7imiZGZc9lv8AYk4k79aMq++IUBZvVxteesqPS9pjtrH6bS9983/3DxXp2Rj5pVSSmFFw78GWubRd0pzSi8u7SlEIwpsY0NeTtcuWrpgc/+pcxvZH6gRU05AmHaUNUi8oEDuEu1SCPBQo8n3XZt3Ra1buwoU0Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763551674; c=relaxed/simple;
	bh=eRPVVHGIz3DHYU1O7ZOYH/eQeyBRv9Sfhbel71R8gsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STSVsC9UwbXbn3HqC1JIw21soG1VyC/ZnSCUE78f/kdJEbRAIxT4tIp9K0iqaGHbEGitoyPnRtRrvLKXxb5k9+9jzmTikcWngDc8JmbCu2pJ/sJs7p+qMwTBJnwLo0TWT7KcLXCqc/nQLGwo7EH9jOSHpZHkIpUNlxpacltiy+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AWHf2y5r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bkG+MSjz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ61UfQ826926
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 11:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=htjqet1z8r5meoFg6hkg4pYc
	+osGI5Z3qXMT5iYRGBw=; b=AWHf2y5rVWlQhegBtAH96wfWD7vy1ku4Now4oTx6
	vOD5hF8mqIude6iQzXH3prNU8uewBtuOqEnuAdtzq1PVaHVRqO3kU9Dhsw3lVODv
	eGdNSbmaEF2P7Xs3gJiUx9YIyOOaVeG9SIijl7FaCoONfUZhgKVi5J+vYvMAqzgr
	CDWA3HYZP184KnWX1tvvMTm+bGyeINh4fIpG7Km1HwusPKGskNkEPUbH7cZW9Bn/
	3ojbNqT9ipm+y2uoGWJ6ml0twpPEBrd6RkzEDG4YVSjbqXLf9erZfrRCyRrzDPGl
	F9iz1AuDT1dIaAbvbQ0bSdWtiAOWvgDJGT2i5j/OlPsjjg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah88w8y3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 11:27:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8824b00ee8bso99320286d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 03:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763551670; x=1764156470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=htjqet1z8r5meoFg6hkg4pYc+osGI5Z3qXMT5iYRGBw=;
        b=bkG+MSjzg4HY7mALWB/Iq+Mz9OZBe6wg3a3uqitD4LNNtLNE24FYxjMR9LPx0AwOTu
         GIbzgosx7FaFykdnFognEcU1a7oGisLHW6wlG8hGZbNbbNvE9WM/d7ZDeV+T/bKxztp/
         rOrN2APRge6uTy5sf/kuSLCnyq+NNvcQr8ZsldH+++7Mtf/wDHn7Ktq3toXVPNw9X+/F
         ezzSXmX8jUMyH2Z1RloUlCcmNwhvAB5fhew/aQLvQ3ujTNsjmNIMtObtrMNNpTh8hkDX
         ctLVc7v/Z8w0jmAzdAUA/xK1YrPZ41w9IEBVFq0YdYG4qv2p139kTKhAmdZsfnpMtnbn
         qyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763551670; x=1764156470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htjqet1z8r5meoFg6hkg4pYc+osGI5Z3qXMT5iYRGBw=;
        b=wgRc8siYyms+UZ7+rjSYxcSlJw1Z8LtsPc02uJ4dqIzI/vE+757ulSFfnuVcZH4WbN
         uVXabgFcfdzQhQUi6TtAidtFEXxSydf08Wnf9K3fVq+PQIzbYfBvXCtbFQdoss6g93w3
         dVKQ3+q0OdwCT1CQEoWNtq0i33Ysow/rj/tnN9UgJtVi9PtCY/vIuW7Y3eGrepslqNEE
         IIoZdXVzI5zmJoMD9onMJdMTLX7EZaraJ+NzPMDt+xbAKnCBI6l7kjxKa6PxDNYGLlyh
         U+51O0qGmpbfJ7S1eYqdGz6Mo24FN5altKuATKyX6sKPsuBUaXvhxSHaBefZWEOYX931
         YdAQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5vFGWMldBlCDwt3ruN7/rN/1o6sIzkyE/9TPUtXzw6nL+IzgK9Qyj0Op4sB0a7rfcb5WTf/po4ICVUBZI@vger.kernel.org
X-Gm-Message-State: AOJu0YxInF6z6wwT4JVNb3mmhI2C+Xu4SnLaG7wtQD7TbRk9iWX0VZEK
	W24QX0WQ3P0gDpB/9lDKopm89GjZ0zaw0HIQq90g1wakbNzWB1x8R5AN5dWCK0zUgCYu6z+uyJD
	8nahB6L+1ExbyawzK18lUY+M9HLK/fJs+EO03xPcR5H8HrcPW9Irod7f3mw85PC76xYTG
X-Gm-Gg: ASbGnct+q6SZdZ2ML6UWC2+dT4xRHt4kU7wPL+gkjZVbSakZfb3ca70p81mzkKEp83y
	n5vnynottXsLJMjnwrMyTpIEX0RMwCNghLRKVjyxbA83C8gHe/JgLZHpJG2p+lYFn70XwYxHTYM
	5F8DDa4ra/MffpvTEedq37TJEUKe2Q1x+tlixNqIqZ7jFpUWWMvsL0KPkCTEzC/5gWX77PEOjiU
	SNTyDTavzvS16u32J1t1A8PBlHh10PXmIBTs0zUtPTR7Izbx4B0b9l5URxL6DyYPBDLEW8FWWld
	wDfVYCxRkmg8qAyYftM/tYD/lIndjv0gDyRbD/RVofCgLEPtXftANjGauQ+Pyu+vnxYZp5+kuY7
	ZuyDluz4CmEzfMwRUsCIR9g3TvalHQxaxypVXE05NPNILdaklmqqUjl+aca5iRC8wZ4nYQ6fx6G
	9DZeioTW+OmVR3fVu1fjIUOjE=
X-Received: by 2002:a05:6214:f6a:b0:87c:1f7c:76ea with SMTP id 6a1803df08f44-88292686aabmr245308156d6.44.1763551670472;
        Wed, 19 Nov 2025 03:27:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyHMkVncCkfQ9fLK6iwiE5NtdrxN7grXBPy/3NfpN7Bs+jSnMQrPk3t4w17vy04KZ0+hrZiQ==
X-Received: by 2002:a05:6214:f6a:b0:87c:1f7c:76ea with SMTP id 6a1803df08f44-88292686aabmr245307846d6.44.1763551669969;
        Wed, 19 Nov 2025 03:27:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce1509fsm39043511fa.13.2025.11.19.03.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:27:49 -0800 (PST)
Date: Wed, 19 Nov 2025 13:27:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
        johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] net: wwan: mhi: Add network support for Foxconn
 T99W760
Message-ID: <rrqgur5quuejtny576fzr65rtjhvhnprr746kuhgyn6a46jhct@dqstglnjwevx>
References: <20251119105615.48295-1-slark_xiao@163.com>
 <20251119105615.48295-3-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119105615.48295-3-slark_xiao@163.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA5MCBTYWx0ZWRfX8muE3Exe5vn2
 S/+jeMZkD9wm9wCm35xM7vd7jnVI66rmeKwuBxQ+WhKCi/ZDHdB3ER757c3gEYFxpHgwvJ8DHh8
 h/0MhFGytoEogauyRgmqrsz7cFTVUfwWCSXxjlLm4tuA1YZyQpCD0uQa9oKAsHAm4iFiXHrc3tm
 v9NxX4Q1qPqfTFxkZ8/1q7VCQkus6wLzcgfEsvnasdHJM5yieB2dH37mif0ehPEM8Lt0JFE4l4N
 S9mvyFpry9ZGlAgW0G84t1Wd6SyRhLkSdcDvrIQvxNPx3gIjrMtmbeXUlLUOKSNn04znmaC5YvS
 hGxTpe/gFYnYl+HgJgoX+ly20GjE5dUWrzzAuRyZrBPKTHk4CdtDBT+DY6ovVGMDl0iwBJdyX7j
 iB6vPpkSFsCvSWOn0PSpaIx644GF4Q==
X-Authority-Analysis: v=2.4 cv=YKqSCBGx c=1 sm=1 tr=0 ts=691da9b7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Byx-y9mGAAAA:8 a=yYy6iFiXQZVf29SkKJEA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: vptG1evsl2x_S29uy659x67x5ehTbucX
X-Proofpoint-GUID: vptG1evsl2x_S29uy659x67x5ehTbucX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190090

On Wed, Nov 19, 2025 at 06:56:15PM +0800, Slark Xiao wrote:
> T99W760 is designed based on Qualcomm SDX35 chip. It use similar
> architechture with SDX72/SDX75 chip. So we need to assign initial
> link id for this device to make sure network available.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
>  drivers/net/wwan/mhi_wwan_mbim.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_wwan_mbim.c
> index c814fbd756a1..a142af59a91f 100644
> --- a/drivers/net/wwan/mhi_wwan_mbim.c
> +++ b/drivers/net/wwan/mhi_wwan_mbim.c
> @@ -98,7 +98,8 @@ static struct mhi_mbim_link *mhi_mbim_get_link_rcu(struct mhi_mbim_context *mbim
>  static int mhi_mbim_get_link_mux_id(struct mhi_controller *cntrl)
>  {
>  	if (strcmp(cntrl->name, "foxconn-dw5934e") == 0 ||
> -	    strcmp(cntrl->name, "foxconn-t99w515") == 0)
> +	    strcmp(cntrl->name, "foxconn-t99w515") == 0 ||
> +	    strcmp(cntrl->name, "foxconn-t99w760") == 0)

Can we replace this list of strinc comparisons with some kind of device
data, being set in the mhi-pci-generic driver?

>  		return WDS_BIND_MUX_DATA_PORT_MUX_ID;
>  
>  	return 0;
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

