Return-Path: <linux-arm-msm+bounces-103530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHTeITkz4mkZ3QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 15:18:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 271FB41B8D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 15:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1346F30073DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 13:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B26425A645;
	Fri, 17 Apr 2026 13:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pDIb4ftP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DKyjSeW8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B997823ABBF
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 13:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776431922; cv=none; b=AgoSoKTuQcbXxBVzg1P3VQuKVKdrkSS+HV8773zdTYgTRZjttugnfuUK+/aJpoPzn32t3/BeVTLDGbKZoUa/JZgEnw1L3oLtFef+hKBNvz3KVB7FB+6q8pS9GGdjpvA2vTpaklvJHcpaS1QEfwEdE8zgRu41zINln4yvoIwM0rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776431922; c=relaxed/simple;
	bh=gStN3cw/qUN+ZGE4aEO0ZX22lIb4e0DYjufnX3dUDPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Stn2yTv0FecaTA5uAZU20t2ALxLgg58bJTH6jojTHii/1ZQ0d8V4p7vxGYp/+gwea8hpnnYeUpf6x+tDOx6NHccXv4Vn26vsD+kLazRG7c+iD7MeG5Sa9nHQk8ekXtIPIbgtgapYsXzlB329At0FQRAE86NCFmEZatG0P3R4jaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pDIb4ftP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DKyjSeW8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H9kiE81042380
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 13:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/o4OAij5cU+4lIvQWD99hEqb
	Gigke6tlElxv00jgEao=; b=pDIb4ftPbTWuv2zFN++lT0LqPW28pAfqwCn+8Iih
	wkHjFctAJF/Jbiy+Zy7ebFziAgTTCn91FKEkgSY6kYUtm6QbwFax1bbE8WGqpLfe
	KZP3Eu4cUUJ9esPJ1zBCYEiPXeG0k7yKhUJpPV1HbGXGwo+082I4ZnrZaF1GUIbB
	2u74tVRZALo8pE0/ie89t/h2blRTQ2Z0oqoEjrcpxQuzYrywyB46vvLXEv6pISrA
	XTfEa/qtORzHFJIwhQY2uwYebTHm7Wmtq4M10eo4X3Ic59g4Sz9WKdp1RTqNIG4A
	aS2KZEZqo8bXt7Yiwad0AoollxRmVaG/hW8evskFWmcBlg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkjhdrqvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 13:18:33 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9518cf3768aso108167241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 06:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776431913; x=1777036713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/o4OAij5cU+4lIvQWD99hEqbGigke6tlElxv00jgEao=;
        b=DKyjSeW8hX+fRRDtfvoRlsrpQnNvBBP+Iar+gJUtGC90dz+KwABSd/wP+hGlB/xx7C
         0sds0pz3kB9KZCQ6GVT7m7lmtRUw8AYwAoa2XsQj9wcp8r3aNOHQ9pnh4BaxvFDxc/sr
         7+ONtdJQh8CHzbyrnzC2KH+0jF0ksn7Z1+I4LrblCCbEOFEd+atiucTTyVyG3/MA6L6x
         UKs8GlpwVymsmXq30VZpJHU9OUU8iD9TccrielIemSsLSUmpK1nuK1ADxS/lImGGRfvL
         RTzt4byYV4daqtCWAcblJmPf04vBUXR04UAa4pX92xni3Hv6QiXwfM5VBCrCYeQBSloT
         zQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776431913; x=1777036713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/o4OAij5cU+4lIvQWD99hEqbGigke6tlElxv00jgEao=;
        b=d+12v+RysevFneyDY8uPvJ8XB8SloGlmOu2ay8E8WE/t2G2u/Du/GLSNV+ryNfAu5N
         wu7RpdlX8QqgAMxa6//HjT+rwvalY7AVXGAr62pTN+oTVo/P3/7pTg6/5qKFdW+lYADn
         3Rc23jrhqHBAmHz2xH2SugMDruq4/Lt9/bjnLmjHaHOB5T++uF8K6LfpBcqjHuLcDHDf
         /ZwC22XmYEmnKtHfgPrY5txHDouuEzugQRLjXtkQxvdZ1aAw6oLIBGTSDWBm7EjWsKas
         YJA5ekIYpHRXebOqwV0kO+SSuNQWOaSjNO/1FCAFCzAhcx2WF9dyGXHWBCABKe4bU2+q
         BVxw==
X-Forwarded-Encrypted: i=1; AFNElJ9chJeIlbarsjkClSd/uxWTwDKqCbO5DUxAAiA5onh15aYUYPwzxfy2GMQwdnxiq9HC6cHiZthG6h7B+Nbl@vger.kernel.org
X-Gm-Message-State: AOJu0YykNiHGR7pWznwiCYRYHrisz092Z3mgodYgeaeudTK4uByZN+7O
	QZaP6T8XBUHTeR4sHrPCUZAI4GRBx6k+XZiyRCjOacQ4mi8V5e59hNaLnZpwAH6QIk3B5tIIn7Z
	nDYemnh9ldSww+ry3lyGPJeyXzvepYY7L1EgzD2gvN3566K/MGWords38fToMF2civk6Z
X-Gm-Gg: AeBDievXQ05CNi9n4th9FcwyKb7GPX9iKCoXPU2wXe6fteYXe1JU/RWqkVVljDxWIZ8
	mhp4xQ11Kg7+nhnVTRL/Y1z6wetbY6eeuYNFln7wOCO6x6r9s/+3BimYGZCbnZY27fhkzb+D5kT
	KoZYgQ47VJjUONYQz6sTyWpe/JUhnrx+ao7w5G4EGwRzRClV5Oh6n95xRABW3etgc3cZLdTpIJw
	D5zG6mRyCIa72uYQvVhB8QZHZuqt8rEC5Rgu7GyplpRuygIN6yBofuMIWRHgLbCZ00d741olbZt
	RQtRVD7kH1GTPnZJErP0IUC57JyNZWaCxqzSwvh7S39zlIMIKqcxDkYJIFc+ikY+mADwG+CwG4m
	3azZIi+tC56uNDgykwitZmngh/DcMG2CSXUacudWOZpUNklYy1m7VMgu77J1S/im5t33jhMNMI+
	/W6lrOf6+1vGsa8Fah6XWvLVqUYXPmTSma84UhbqdwFlfWvw==
X-Received: by 2002:a05:6102:4a90:b0:611:17bb:934a with SMTP id ada2fe7eead31-616f88b456amr1072760137.28.1776431912871;
        Fri, 17 Apr 2026 06:18:32 -0700 (PDT)
X-Received: by 2002:a05:6102:4a90:b0:611:17bb:934a with SMTP id ada2fe7eead31-616f88b456amr1072719137.28.1776431912455;
        Fri, 17 Apr 2026 06:18:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e11ecsm390368e87.47.2026.04.17.06.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 06:18:31 -0700 (PDT)
Date: Fri, 17 Apr 2026 16:18:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        konrad.dybcio@oss.qualcomm.com, andersson@kernel.org
Subject: Re: [PATCH v8 4/4] misc: fastrpc: Add polling mode support for
 fastRPC driver
Message-ID: <sol4d2y3jbvlljg2nigtsjmc6iugya36y6vdsu4xyqjyvb5gwi@54vzpkaxzd3r>
References: <20260415112530.4083240-1-ekansh.gupta@oss.qualcomm.com>
 <20260415112530.4083240-5-ekansh.gupta@oss.qualcomm.com>
 <ymieeagodsfbygq7fsejsqriajmncoubzvor7t3ll6ntomtbeg@l65yihnixwbu>
 <0bab12c2-48f3-45a2-a87b-b33b60b5a7df@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0bab12c2-48f3-45a2-a87b-b33b60b5a7df@oss.qualcomm.com>
X-Proofpoint-GUID: 6-RHjsgBQRo143wmJr3xe6mVxpaK1xEJ
X-Authority-Analysis: v=2.4 cv=YpQ/gYYX c=1 sm=1 tr=0 ts=69e23329 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ltOAzfauH0U5bMVrslcA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDEzMyBTYWx0ZWRfXwshklHwhpdBZ
 ui+1O2L2aoU4S+zMfBBvFhzCx4nz6ffPNPLFTccAWTtBzJdfLJtxIU/RtGIafC8wwTYag13QgW7
 F1wHuJYWmKzIkGzp/ZrqMN7gbc221cWpxrI32fVNsgZk6ygUMzZU/wPEulyo4RogEDqv+k2oMBs
 i+c42tFzaTJjYymcfXoNQqr6WSpYbCsnNE1KI527X1TyRlluaQTsZ7WMd5VMA08UTVy60Q3+ek6
 aVeneBD0YVNglFqehluOgaBTJVDi24iRqMPEvjpSsGt71c4emA5YLu7LQD4RY4gWkxIknq857QE
 s2vMo+kOaDbi7pjdZ80nrW0qZiy4XPRnCHYp6I5CZoIgL7/R87QHzyMUD0V5v8nyqIqrM85TXc2
 LaPZpqkYOG9NEHVN04lLcnGEtzRMSpAeh2eRnGoO/YyZhSqLF1Yz9G9TPoDrjERhx6FZ1R4aycd
 1jGT2pQF893ivypHopg==
X-Proofpoint-ORIG-GUID: 6-RHjsgBQRo143wmJr3xe6mVxpaK1xEJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170133
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
	TAGGED_FROM(0.00)[bounces-103530-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 271FB41B8D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 07:32:43PM +0530, Ekansh Gupta wrote:
> On 16-04-2026 16:25, Dmitry Baryshkov wrote:
> > On Wed, Apr 15, 2026 at 04:55:30PM +0530, Ekansh Gupta wrote:
> >> For any remote call to DSP, after sending an invocation message,
> >> fastRPC driver waits for glink response and during this time the
> >> CPU can go into low power modes. This adds latency to overall fastrpc
> >> call as CPU wakeup and scheduling latencies are included. Add polling
> >> mode support with which fastRPC driver will poll continuously on a
> >> memory after sending a message to remote subsystem which will eliminate
> >> CPU wakeup and scheduling latencies and reduce fastRPC overhead. In case
> >> poll timeout happens, the call will fallback to normal RPC mode.  Poll
> >> mode can be enabled by user by using FASTRPC_IOCTL_SET_OPTION ioctl
> >> request with FASTRPC_POLL_MODE request id.
> >>
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/misc/fastrpc.c      | 137 ++++++++++++++++++++++++++++++++++--
> >>  include/uapi/misc/fastrpc.h |  25 +++++++
> >>  2 files changed, 155 insertions(+), 7 deletions(-)
> >>
> >> @@ -1813,6 +1908,30 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
> >>  	return 0;
> >>  }
> >>  
> >> +static int fastrpc_set_option(struct fastrpc_user *fl, char __user *argp)
> >> +{
> >> +	struct fastrpc_ioctl_set_option opt = {0};
> >> +	int i;
> >> +
> >> +	if (copy_from_user(&opt, argp, sizeof(opt)))
> >> +		return -EFAULT;
> >> +
> >> +	for (i = 0; i < ARRAY_SIZE(opt.reserved); i++) {
> >> +		if (opt.reserved[i] != 0)
> >> +			return -EINVAL;
> >> +	}
> >> +
> >> +	if (opt.request_id != FASTRPC_POLL_MODE)
> >> +		return -EINVAL;
> >> +
> >> +	if (opt.value)
> >> +		fl->poll_mode = true;
> > 
> > This will enable poll mode on the platforms where it is not supported,
> > later silinently changing back to the normal mode. Please don't surprise
> > users and make this call fail if polling mode is not supported.
> Ack. Working on adding compatible based checks for supporting platforms
> by reading the root compatible string, something like pdmapper[1].

SGTM

> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/soc/qcom/qcom_pd_mapper.c#n643
> 
> Thanks,
> Ekansh
> 
> > 
> >> +	else
> >> +		fl->poll_mode = false;
> >> +
> >> +	return 0;
> >> +}
> >> +
> > 
> 

-- 
With best wishes
Dmitry

