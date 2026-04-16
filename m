Return-Path: <linux-arm-msm+bounces-103374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rQeOOzbA4GlglgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:55:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EFA40D100
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26C503051CBD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2680C39B94D;
	Thu, 16 Apr 2026 10:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FRmo4TI2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gLLxcpIW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B877F38D6AD
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 10:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776336947; cv=none; b=f07QvoD/Qt5yOsVXLkgRVo9tKeSj195reBxner0YXlRZHFd1jADclM6JHaM0e5cuOt+E6hS43d0tQij4127mhs9OxBP1Ul7hdS0cPb1FAtaBcZkXnMNyauaYOTLqacuKHxo5NnCu+JMB72dANOpLImlnOpGBdcQgEKudAeC3wqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776336947; c=relaxed/simple;
	bh=KgmAQgZnZVaUGFsBDw/AzLkq4BFJPVsoa7iQJnjyBdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WSiNpiG1jvjjjsILfRtzomCP1w6lYcSspVWPoy95Tqn/Gn5qnBe84PPoq+kAqTVkeCHwzF/2wE6WF9xQrCMdAGGbXHCG6MEjnqGGshcNtvVWNYazxVUsg6kvT/Sal4gpwN+GzaqAbiMSsrpWEL7BiHpu91ln6iIQ8EoK3H00Osc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FRmo4TI2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gLLxcpIW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8Y81g1703935
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 10:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qhaT6frBkv4Qr3L0ozWOVUx5
	2eDBgylITMC5mRQp/mE=; b=FRmo4TI2ZtmcWnTZjoLJrcD/hrw6adet6xXlhAui
	ndrA8l0YG7xWn/hyJWGLV1uCnCvIFcIbH2TwvWKTgFFSIcaNus+zHQPOmB2NtChZ
	aNZnOt4NL+mkSJMfdCpscTBApsXKtTXP51UOjBq9ZPWwB+YyzN/qJdcVxZwvnhXz
	hnw1sRbjKfliAc6KFqQDMyuLPtIJfJZlO1alP7/3IYGu58nIeJIXSrmurkL9wCgS
	Gt3dM3rIxbc/EHIGWQuxRIYrSbbcq2hr/OQd1C1MaWbeiiNzwbEHSq6NnyfFLRrU
	pUmYPo6GQX/YKVkZCRHyJ4p9lZ3buMZ9ilwSaHcon5xEzQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djdamkgpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 10:55:44 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5675cb317e3so8096376e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 03:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776336944; x=1776941744; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qhaT6frBkv4Qr3L0ozWOVUx52eDBgylITMC5mRQp/mE=;
        b=gLLxcpIWRQydNmGSOoj73vRPbwqOUaDAQCeGdQgC6/43Lxp9y8q1YtGhTyyhKlbf9R
         ToxwAkntJ9S5eqQufXOha3i06nZ62kMQIAh7TeWcjtJsBcgfssPvBPOSwqHL/oh4Dikg
         gY3rqtzu/gmqrD9BI5aXl0w+ljPUuII8yKC9bddqAryzJtNIvuogiPZfKg5To5i6Ca+2
         kR9LfJ0cfxZuUqANMKSLi5iapMr6DQbj8gbjrWysNUi9ZLiKH335/XSHgCzcxAcCYmfq
         w98Ww2qwfaV4VwJEgbRtM3dXvoykieU3sB/Y0b6qrOig7at0rS9dVVeuleuiEAw4q0T7
         rD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776336944; x=1776941744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhaT6frBkv4Qr3L0ozWOVUx52eDBgylITMC5mRQp/mE=;
        b=Ffs7xaBTnKcv555w9c+e2jJHCxyGWFCbDtG0U5oCDO/KUN53WYNFuW/vkizMTg5DrR
         luidLN01SnMG0xIlTPCyJSdDqDNl5J8bKFRDfbK5wYHjN3Fc4QfjfwMJ5QAsfAkX5Zk9
         9rBeksxf+sjg0Gosc6GIzHzR+6ybDGFJ3yfP3zM+sm1huUJQOWI3YrFzJkcVWZj/yNPY
         V76k+llt+KgRsO67WnCSiqhvrXyx/x+9a/YIcJeLMR6J/NWpb5U3Suz+rlPjAX/mdp/3
         qZ4VB6FAGWCkX6Z6iVFKjpID1voea0HljSWKwLa8+NbEku1/bvvEKquDULp5/of2tfRI
         PUCg==
X-Forwarded-Encrypted: i=1; AFNElJ8q9r3gT4lH+dL03xdklK+RuyyQtSo22JhPiXt2JV+Sk3okHeH35Cb7dY4sR/Er0KIVnfF8BFmKo1BjitKC@vger.kernel.org
X-Gm-Message-State: AOJu0YxswqxYy1Ss7+xWwSOpYeR7TnxmTCIsgHDpMR3p3c7Q8iBaZVSq
	9A2f/dTfY8gGl3OJ4Yj6x/bBIpko9bCgeLRVCKB0VD+Bz/fAffDeWwupr1hkytp//D5oaZUJUoP
	T/HMTMW4HqAWNNgZdYz6H3gx4c/m3mJ+N/vhj0gaKRUnFyheOW4D2uNAWVXH8P/M+Kugt
X-Gm-Gg: AeBDieuXsE/DYYwmqK8jNlqQW3hcGBSkc6jKTKuDH+XqzlM4pMiZcSpxD6WTztsMNaT
	7ZqmIBz70jGhsvxLq6onMVXw3nBGXXenCTHQ+SrEc7tXU2H+Q9/vijlPl5p6BPmevC2oJFE/uUR
	jNdjZFCB8rhkFhIMYI8wjlXPAd09QhCI4cE+hWzFZs3JVsCKw/9q5TH/7gvZBa1hNe6R45WWV43
	uKKF97C941RnHRoasUmMt0yvCYpuToX0C1CTl2Rb/LZVQ9WK+IEWmn5NqBoNLIqssc/+kt+xTqS
	5kIz10R4UiVyqc3fJtTx6p2apeaqRN9k9G4fMsujOg8afSLF/qd/qtkQhmIb6CpEP3iWmz1WvOR
	LcFfx/f3L5Bndd/WD/S6Yodapx4blfUrCrVwDoXqnf+pgQCVKt0zFhuGU7A8c99HWyHC8b6QEuy
	uBkdheM18cO9nf6MCdVzjLPNBdOUSGgQRcFCNVXhFkhf76qg==
X-Received: by 2002:a05:6102:3e04:b0:5ff:ea33:2be with SMTP id ada2fe7eead31-60a00427d2amr11297886137.19.1776336943943;
        Thu, 16 Apr 2026 03:55:43 -0700 (PDT)
X-Received: by 2002:a05:6102:3e04:b0:5ff:ea33:2be with SMTP id ada2fe7eead31-60a00427d2amr11297876137.19.1776336943460;
        Thu, 16 Apr 2026 03:55:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e9ebe67e2sm9936291fa.26.2026.04.16.03.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 03:55:42 -0700 (PDT)
Date: Thu, 16 Apr 2026 13:55:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        konrad.dybcio@oss.qualcomm.com, andersson@kernel.org
Subject: Re: [PATCH v8 4/4] misc: fastrpc: Add polling mode support for
 fastRPC driver
Message-ID: <ymieeagodsfbygq7fsejsqriajmncoubzvor7t3ll6ntomtbeg@l65yihnixwbu>
References: <20260415112530.4083240-1-ekansh.gupta@oss.qualcomm.com>
 <20260415112530.4083240-5-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415112530.4083240-5-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: LD_E1qyT4W5tKge68cqWhdTCIsl_7jRW
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=69e0c030 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=EekQdeYcPna9Ds66k2oA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: LD_E1qyT4W5tKge68cqWhdTCIsl_7jRW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEwMyBTYWx0ZWRfX71tdVbBY7A2v
 A/lYh5S5rkFG7XH+kQYKUb+xRk8g+92/ik67l3F6/MusRG+rnISGJsMqXqvytIIweWPbnkboTVs
 BL7qoN/1rexp8utD96QQjG9uPZtmBEYd/Ig011d8laR77IxzrAwwMR56iz9dy+yVDPAMqzWtU7V
 bbSdWypcdmLjUCvVRtOG+tEkWdnIRtDBFPabgk7sKuU6Zy+3opDfRKI0qCdb8nJ3iCAUelvvR2Z
 fXOrv/14Xg1xIB0CyvRWvc4zANBIXATpX7R7LmHhAwCGG7uzG7B+AqM57Uhq/8W76BQW4y8hthY
 Evc8emu27sX4PvgCy4ML8Mn747TRYifL1pAkUHoapYXVfba5LVpKZM8SG79pm/kpAoLiIKOlZst
 USq5iVr2RRTkR3WbQNr4QZ0PE2DDGkMM8YKv10NlivlmwkwwQwIyhH8GcqWJzOJycAwbGNDgZLZ
 l0H1+NCs/XFlNmX5yHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160103
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103374-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 48EFA40D100
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 04:55:30PM +0530, Ekansh Gupta wrote:
> For any remote call to DSP, after sending an invocation message,
> fastRPC driver waits for glink response and during this time the
> CPU can go into low power modes. This adds latency to overall fastrpc
> call as CPU wakeup and scheduling latencies are included. Add polling
> mode support with which fastRPC driver will poll continuously on a
> memory after sending a message to remote subsystem which will eliminate
> CPU wakeup and scheduling latencies and reduce fastRPC overhead. In case
> poll timeout happens, the call will fallback to normal RPC mode.  Poll
> mode can be enabled by user by using FASTRPC_IOCTL_SET_OPTION ioctl
> request with FASTRPC_POLL_MODE request id.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c      | 137 ++++++++++++++++++++++++++++++++++--
>  include/uapi/misc/fastrpc.h |  25 +++++++
>  2 files changed, 155 insertions(+), 7 deletions(-)
> 
> @@ -1813,6 +1908,30 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>  	return 0;
>  }
>  
> +static int fastrpc_set_option(struct fastrpc_user *fl, char __user *argp)
> +{
> +	struct fastrpc_ioctl_set_option opt = {0};
> +	int i;
> +
> +	if (copy_from_user(&opt, argp, sizeof(opt)))
> +		return -EFAULT;
> +
> +	for (i = 0; i < ARRAY_SIZE(opt.reserved); i++) {
> +		if (opt.reserved[i] != 0)
> +			return -EINVAL;
> +	}
> +
> +	if (opt.request_id != FASTRPC_POLL_MODE)
> +		return -EINVAL;
> +
> +	if (opt.value)
> +		fl->poll_mode = true;

This will enable poll mode on the platforms where it is not supported,
later silinently changing back to the normal mode. Please don't surprise
users and make this call fail if polling mode is not supported.

> +	else
> +		fl->poll_mode = false;
> +
> +	return 0;
> +}
> +

-- 
With best wishes
Dmitry

