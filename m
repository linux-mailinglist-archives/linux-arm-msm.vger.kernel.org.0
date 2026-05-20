Return-Path: <linux-arm-msm+bounces-108754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFklOVa6DWpT2wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 15:42:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F09358EFBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 15:42:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D92B3057D76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D502D7386;
	Wed, 20 May 2026 13:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JOB67p3h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RDq0+DKf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4AE34388A
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 13:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284214; cv=none; b=f/rV53vOAiuxafenTVyiexVKUNn8tVotTdqyXGYMg/NO9XJYtE2SFVz4lbY+PuW2C87J4VHJcJRXgHmZbveAlVXYyO8QQCsxlkP9seELn9q/lmPqNXEZXPszbXJRmyxq5JHhx73E+gwVxBcKJ6rOn2/auE4fbdr9cDiGbp/nDQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284214; c=relaxed/simple;
	bh=Kv3ORNhmkXc+JcmpNqH93ZPbvLT/+CoXQig2ATnoejg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dH8EYU2MncRe2XJpP3nhwTKFI2Hd3IUAxz8/WgTdgBf/7dNObnmRrZN3G8FGxk6w0aGp0I0J2Q2SPDIHcw6Veir4/qlkiXIRZORhzwnA9CMjamTITaBw2TlnmOFAEpCqQStoBrKMgxl0OpPRHCBlZJ+QTXOv3aZysuRsc3UGepg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JOB67p3h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RDq0+DKf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K8umnG4115406
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 13:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DJ6h6DRsnqQDPyi2JxuOi7VJ
	mjKcICPojxj2bNCngiw=; b=JOB67p3hSVJLEAa1bLTVKRoF6Wg24jsZ+EX2ovBJ
	AWNln+pfEJNnTzVpzOChXvk6tOw3ej4x1prWgsFvZys7/tz/gcDwQxNg7ycY1Qbw
	W3HQqWWeT1IXZ5mSs5DwzmYGO1Rsp0v9Mq+LRdE6XFxI//TuwllEKydpbIQvUPQV
	q2kf3gZ2MZaB/1Hqbgb/UGOiQ2CoXAPpWqrvlk1R2Ckodt6Zdtcv9b1IJBHOj2Lc
	RuebvKfSWXgi8CVGtCE9rgn5govv1ecCeoBtN4T4IMDsLSu3PeHRaXSIvhc8rakF
	Wg2STPcmHc2fdNW6Vt7a85rJKno8rXk99G4z6Vk1VPZYIQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e99w0h14w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 13:36:51 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95f6b47ad17so9406651241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 06:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779284211; x=1779889011; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DJ6h6DRsnqQDPyi2JxuOi7VJmjKcICPojxj2bNCngiw=;
        b=RDq0+DKfXzEXYB+tvJhsT6mspMu6huqCefRFxw0yCqcZwrfYU/GXA5m85/jyjmC27T
         tMLccM19VUsMHcF0yOsSWaJzDnieLI6qTiCyAeZYYTDkwPcgzlc3bd1ZKGWcfj2iTjil
         rnkEBy/6pTbCvHUUMTxRqVBJm5cB+MR8zFfqKpMxX9HT5lFVc1o9YYDIE31Iq8iNimNS
         70vXuFae9B7vnI1VxyB+kY2AaRJHcrNhT98Eb+8NBOFIu0ffpTMXx8Jdl1LsHTZQfqfB
         MZ0W/NaH0VEgYliLjqV4rqQNF16hqHwJP0BNosxLPfAh5lPRLNR+wFVV6yttd/hIRHR+
         OpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284211; x=1779889011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJ6h6DRsnqQDPyi2JxuOi7VJmjKcICPojxj2bNCngiw=;
        b=b720zmf4WYcmVtMBDi5i2qGLJmQI0zyXM1xUsAhckEzdDRSONwfKT0xWJfT4vbRph+
         kYE7JILS24+UUkG2sqWqZX1Gihu80D7z2++tdchqYXKhjS+Q/P1IjeBnLC/9ISZTh4eG
         Y3/fmdvYFaoarMJQAfxWQTRbpnbHxLPzqdEWFXbaOX7pxxgSo7cPrfcCayMS150J/9Vd
         MFzYmSSownQ2YGwZ81qOrk2IMs30JV9m/rL2frUbQzC+Z4RJgLoOG4aEmcLbqFq091tp
         oJTxIRJY0CEITjuTFIoMPP7O+KF29zuVgCRM1mYvbOxfG3CGZ8tMIedL4IsVIAKdAPf8
         EAvg==
X-Forwarded-Encrypted: i=1; AFNElJ9qeIrk7Gf2h2N6ej/3x33dOLoy/lUYN5Q00mZgnXJb/P3pMxDQAkMnnXsg7eDzTcd6Ngt/qSIHdFU3t8zm@vger.kernel.org
X-Gm-Message-State: AOJu0YxQM27Ormxx8xnnqR0s6hhoydHSTDFjPjf8yZ2lCQyNPe78idKP
	MockM+nENs5M/gQBWbiStX8ODO6U0T6NtzHUcAm7pNJMGYcN7tRrVAnaVnuMulYC1rob3AtyMC7
	D/eepqqDfJES1PmZvanUgycCVbiW5HgUpn0MQYgGftNs40mrcCsHqi9hANEY352FCESOM
X-Gm-Gg: Acq92OEuR6x13sYhoI+UFEc4+MWEbDUsGbu83waiqaxV59CnumCkFa8ZHhcHUGtCUcv
	rxeG0hQpSR6bM288dwpFeokXJi3fAn8hAWGMuL8Qg0FmuCjYojwINHaLLAnDgodcI1lVtvKdX8F
	KqMpcvvm1A660MlKYUTREMy34CaxVha5Nqrx2kw77v7UCsYMa6/j7zIERvhaI4svy2iXS5vNrE5
	z0+aZhtq8HlKzJASBGYFH8Gc5105avVr0BP74KnyRsYwm+3MvgCjNS/Y5kenNZj+Ik0h6aFhPrz
	afmOZFaqLhM9O0vTlE1mLVAEmkZYQ9BuTInHg61iE0fdaiaEE9JmXaOupbpQ7ywDMovtMhIHf78
	NKqYku0uVLJH4fJ0CqSPGVBQU3i+flOgMgmWIOML11H4cVMmuaZYnKQ4sBg8ogbj+J3ZSOJeXQa
	Fckdq3tnIbzDmC13ee6xw7MnPImJ/c0l33vsxsLr5BVgqDqg==
X-Received: by 2002:a05:6102:c91:b0:634:d97f:7ee7 with SMTP id ada2fe7eead31-638b566d9ebmr11127677137.7.1779284210866;
        Wed, 20 May 2026 06:36:50 -0700 (PDT)
X-Received: by 2002:a05:6102:c91:b0:634:d97f:7ee7 with SMTP id ada2fe7eead31-638b566d9ebmr11127644137.7.1779284210357;
        Wed, 20 May 2026 06:36:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395887f7b99sm30026341fa.42.2026.05.20.06.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:36:49 -0700 (PDT)
Date: Wed, 20 May 2026 16:36:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v11 4/4] misc: fastrpc: Add polling mode support for
 fastRPC driver
Message-ID: <jtqfnly2ma56gbdstyk7exk4lhw5nild57uyokkkgrtnnqqscv@xik2phrs4v6t>
References: <20260520065047.3415790-1-ekansh.gupta@oss.qualcomm.com>
 <20260520065047.3415790-5-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520065047.3415790-5-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: A4Cvt4TmcO60LAzBTu6SChmgb1JEzt2z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzMSBTYWx0ZWRfX7gipqTzK2erK
 4Bnks2xyWJAz9+nsq7MBP+2NWW3FKwLLemQf4VcMNunqhDdSIBKfmOFf82cfVcqb+IsexuMV00G
 3gqNlbRejgY37A/3+C1fmqMpspbbM6rypHdI509QF6eTiXiXQNEr5dZCgsZCQP+J/gnYdU9AaW9
 DTnDbvx+HKhtnqR9DpaeVc+LE0bOsyMWYOTQY92ExbJNXgLaR6uumZoGNyQOyI8TH6TPg3kBfxK
 R5nFBDP9MjHtCerWi1YwUAe7ShJ3CMzqFmKj8gG4Dbu/Ma8ymZd3G2EiijT9YsZZHRSsK5GTQoh
 cHtougt6dKFq2XGyH8D1d51XpiG5ajTqMzOeyTqOhh3nLMv6xsoxmekMMXb3H5d2C2PykVR3Hvn
 BmXSCtArNf1usUtFz0RkJBFbXnxaZqSzpfw8k2hlEVHh/19uZ5s8k1Mu+2aqSzEnL72WZiAE4O/
 kxfzIcmBfrgoMgTSVFA==
X-Authority-Analysis: v=2.4 cv=RZigzVtv c=1 sm=1 tr=0 ts=6a0db8f3 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=EekQdeYcPna9Ds66k2oA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: A4Cvt4TmcO60LAzBTu6SChmgb1JEzt2z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200131
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108754-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5F09358EFBF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 12:20:47PM +0530, Ekansh Gupta wrote:
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
>  drivers/misc/fastrpc.c      | 167 ++++++++++++++++++++++++++++++++++--
>  include/uapi/misc/fastrpc.h |  29 +++++++
>  2 files changed, 189 insertions(+), 7 deletions(-)
> 
> @@ -1813,6 +1907,35 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>  	return 0;
>  }
>  
> +static int fastrpc_set_option(struct fastrpc_user *fl, char __user *argp)
> +{
> +	struct fastrpc_ioctl_set_option opt = {0};
> +	int i;
> +
> +	if (!fl->cctx->poll_mode_supported)
> +		return -EOPNOTSUPP;

This is being handled too early. What if the user passes any other
option?

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
> +	if (opt.value == FASTRPC_POLL_MODE_ENABLE)
> +		fl->poll_mode = true;
> +	else if (opt.value == FASTRPC_POLL_MODE_DISABLE)
> +		fl->poll_mode = false;
> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +

-- 
With best wishes
Dmitry

