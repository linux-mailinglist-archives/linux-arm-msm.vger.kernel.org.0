Return-Path: <linux-arm-msm+bounces-111682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7clbMAxcJmqnVQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:07:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 210EF653070
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:07:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="FT8/W/Pr";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aOdC2DCG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111682-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111682-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9347C3009B18
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 06:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2094C382F0D;
	Mon,  8 Jun 2026 06:06:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D65324B2C
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 06:06:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780898815; cv=none; b=WjzqMeHmARiiV0JqvZCPaSxZomKYh5NEbNTu1+zx4BJDki/Ccjc6ia3hGXcllVvT8gOPGcUppeUqq9bluiQaHShPiKHNcJZ3K7sTQ1HKRNmrOk6i2BTcksndcwNzpEDQyY/em1BzEpGPfqSjdZ3CfsS3IPKyL87BZTJLTReWBwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780898815; c=relaxed/simple;
	bh=awprQ+2nqNuJd2SS72IL7jolj5g/CRsI/TLuCWm2g60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQYK9ZZZDVU1td9AX0Q8h5u2XJ4Y6vd0bTQ36G2JkH12g1DsbosU5QCB/ULNRGVOLIgqY9MmOH9MLDNi6W471U0LFWXQF+KR3t9eyx/9IdwsmBNvaTulOcKvdsGwyPP0idhn5ZB4AoVBBQDxVzpSDFazC2Ef/MFuURHIOs9Ag2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FT8/W/Pr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aOdC2DCG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EVgY1575805
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 06:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KlfLurUd8p3s0dk6It2TIQLA
	87lnAfygY8nlifB5wTU=; b=FT8/W/PrRO9jgzC51Yh6zwWAW79z/umsUOb0Ql34
	WHc5cXQkfQvdBUTvclTE7Rwi4eC0miveZk67xFzFDFaueE+Fo0bWL5V0bSw/pvUx
	gzF90Emdr5Sg4grGH8KTMnwvVWMRFmQEskr5pMf6WPkveJj20qQuzUvMvlRwJ5d5
	NX2pYp8AWldhuWJHXUJFMXP3jVjhhza2MnIDVOmXEqB4TVa08VdbVDZRuyVBGZ5h
	PN6syuhM5HNAb4ZY/rFnbveISUKsrs9JLinNEY1FO2DwLu5ZzPIiihnuTIiUs3bB
	Jy/oFlvRyl0+mUOii/9pZftaPkGb5gy7s5zS6OPAZfjUXQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1e2r4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:06:53 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9646997241cso110189241.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 23:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780898812; x=1781503612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KlfLurUd8p3s0dk6It2TIQLA87lnAfygY8nlifB5wTU=;
        b=aOdC2DCGqPihXQVqktLmIirCdyorHLez2Sz49B0sKOh2kMv4ZgMMyRNz9+bM/Km3VY
         Ti4IFmzcCi6GdyD/kpjvw/EHcV4fDqxPtEYN1Q4xOICPVe8c2JhSQO+FVG4M1DlXwJqN
         JlKgPtOmPLl/suGF7fWANcCXiZxD4q+kXX91V74J7v1B+EPUr9lReM0wgA6mfDFTLhvc
         ncK3TWDRwFUMs+DS1k4J82dfo5VFieKHBDqEnYP8+MJ4hoT2UmX4YkBBrFRlESKoVkFU
         B9QeanXI+GvgbImBeUq0/hzHTzc9j8ipfRfCle7VYCbH2cA9udP3LR+zXID5DaPy0f6g
         7O1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780898812; x=1781503612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KlfLurUd8p3s0dk6It2TIQLA87lnAfygY8nlifB5wTU=;
        b=pioerd9CoODGa6Q8NACiZzvfMshg1MAC5rGxr52QxjG6KGDM9jI9NCWzfug4wEdRIZ
         T5ui48clfodEF4Ah3SZNMwhr3HIO/IpohztXdlTIbAat+29PrAzrWb1dRUpOpl22GvtH
         7MtYm4ySSWRkXuZZfr2Fc0o1d0L+w6VLKY5sBNd7ds+fIPj3cQzMoGafMrYdZH4EIYhR
         U2mlYazMvh3+94QtgCLn5Vkf8q1Xx9OkkR6jaThP1beEPkX94vxofl+4k1TWmi/ObzMC
         7uJZb5YZUz0AfQQgsgiuVxbaBiT+a7bq3L2qYZI26ZhmSZD44GFjk0/H2pj76tfO311f
         r3jg==
X-Forwarded-Encrypted: i=1; AFNElJ8lj+EwXPz8rnmU1Yz08nh+Jd1o2a2ZdUqgZgRri93a1zA6ehkEynX2gYhT51wLZO7Z/syoaFo8GBkXH72Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwrkPIEMjJubwYhQuCPP5hpBIBkgZ+dkWEe28noJRHetwndMHQf
	LaITt2qAV2MXbFKwRDP+qrgRhYTdKNJvjLpRMn+o6kvhlahlw0W0zgoUd7rDU++Pzlm9MJbqTvG
	jAwvAvMmE0/RcktGcdrLFtvJTrjGydGUblxfdMniV5OUEOWD/H2mnJPou0wEfExvh1xQw
X-Gm-Gg: Acq92OGRXkzMLQ9ACPUdX7Km/iYvyq8GnSV2Iws3GuTHNHs2Pw5K0BYFDsRK5JUjg3W
	BxKnMK5rZTG/Z4UQ5k2zZCn+l/2d+FIbY5AVPyOzzPzvuCnDiy/NP5QH0abOpaBnwYUV2Bm7mUV
	3CPzRBt45cqr47+Ou0QX26sXhszYdsBNepTKSs23KkwKIRkzAudB+wpQxRipXhYOx8+gih/L6LL
	6osWCSSiaUU828jr3oCguAuz2LUQGvGMcpO0181hnZqXhlPCH7RV8OqcMEF7sDeXX4l1VYGg3Zm
	6Gk0XMQUaGmZmGFPFuvyNzC/gkAn4Jwg4MwcYhhvYiJelwRU9EtMbn86TmFzDLeSkiEy7BQn6RS
	EvdfIma37InKZYY3ghBhlYLsI6JFSZpH+KC+qZeSZkSllRoVyD2zwqdfC4LVTiNWQaFfFYJM0ru
	IQDc+OHtmIJWToXgHVD7I1AgB1RbJKkDpIJqwj23r4dZQ7iQ==
X-Received: by 2002:a05:6102:290e:b0:631:26f6:7009 with SMTP id ada2fe7eead31-6fefee62e5fmr6369678137.26.1780898812316;
        Sun, 07 Jun 2026 23:06:52 -0700 (PDT)
X-Received: by 2002:a05:6102:290e:b0:631:26f6:7009 with SMTP id ada2fe7eead31-6fefee62e5fmr6369662137.26.1780898811891;
        Sun, 07 Jun 2026 23:06:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b990344sm3547105e87.65.2026.06.07.23.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:06:50 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:06:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez@oss.qualcomm.com,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org
Subject: Re: [PATCH v7 2/5] misc: fastrpc: Remove buffer from list prior to
 unmap operation
Message-ID: <ootpegidjjs5h54yvfyopwoycj7zzrfml5i6evfqpb527776td@zkcfkjfc622j>
References: <20260602071750.526-1-jianping.li@oss.qualcomm.com>
 <20260602071750.526-3-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602071750.526-3-jianping.li@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1MyBTYWx0ZWRfX8sDl+yo5GJlf
 cERA3lHjFiYWtUtIKVtXmME7MWPVPi5ZQtTmjMGu+xu/6QBHmQ2gAaXMWjz4+koIBbEcBkFgdN+
 yLIqLRp6ml1e/SSi3zWOUf4PwTHPueyqCK5peeDEacbaBKQuz8xYez3c8znvUAc8QhjCh7N5Bii
 6ihlURKo3QTivUFSaUv5la+OMqYz7TjV4q1oflYPMzSyniX412x0Q3j1u7p/bvR6GbvZyJzEEsN
 qyVNBdC6ZmZsFq5M5UysZhjElytKTqUiIDVfjMv4i8CtClQWiyAPtCSQiXHJNTHZD/oL2zpWECx
 rfduyhVqftEoMDQdo4EimuYrXH4aRl8Rqs591JiEe9pm34ZQNFefeKQVAJiARrjCYeaq9OUcR3q
 P9kWRRnRXMhsINHCGsfy+vCS/X/lQKX4lNKl0C0FH48+HHVfd2J9+oDXX73k9ZzZZwflMsGfdZ/
 4EE6eyhO+G+wXbyB5dw==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a265bfd cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=tfs65u0VeOSdEd3mGyIA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: uEolhEcbwOmnja4M1XrV1hcLY0GfU89C
X-Proofpoint-GUID: uEolhEcbwOmnja4M1XrV1hcLY0GfU89C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080053
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111682-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,zkcfkjfc622j:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:jianping.li@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:abelvesa@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:ekansh.gupta@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 210EF653070

On Tue, Jun 02, 2026 at 03:17:47PM +0800, Jianping Li wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
> getting removed from the list after it is unmapped from DSP. This can
> create potential race conditions if multiple threads invoke unmap
> concurrently, where one thread may remove the entry from the list while
> another thread's unmap operation is still ongoing.
> 
> Fix this by removing the buffer entry from the list before calling the
> unmap operation. If the unmap fails, the entry is re-added to the list
> so that userspace can retry the unmap, or alternatively, the buffer
> will be cleaned up during device release when the DSP process is torn
> down and all DSP-side mappings are freed along with remaining buffers
> in the list.
> 
> Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

