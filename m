Return-Path: <linux-arm-msm+bounces-103575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AEWOw7C4mny9wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 01:28:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 507EA41F28C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 01:28:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B0B43009523
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 23:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63C103314D2;
	Fri, 17 Apr 2026 23:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSXHH/jQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pzs+vPeX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDD72DEA9D
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 23:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776468448; cv=none; b=OtjTLJtSXO1AIVFRfD8Ni9NDHGyxCvgUac9GeLWBwwAGzX4C2h1m+yPJqP5zBW/zef8XH+0xKl3zRT4o8XCt1h8T/ChlQ3XANs342BX1GROeGT/tB2wD1wt5zki4XjAX5jaaIt9MycGOnl+Voh9sRp1VTartkYrK+f+tHYNGi6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776468448; c=relaxed/simple;
	bh=3r0QSKsoUObaFpYZ1l0DZY7WdO1zVcoHrJ3v9kXtM6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NbT//5RNmugkCmPvhf4IKudGeBEuVmBrxnHM2ThtpnMpwvcK56pINHiYz9KXFF2BRsDb1VTEiuEGdKcHxsB3/BNbToe/iYDBcXWB+2zs+vzCrQNdhiC5OkIF9txNvw2lm4oYrjJwzZJZwLv1N6zKnV0y7ORMgVfbaW8uuMeKrc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSXHH/jQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pzs+vPeX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4aRN974982
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 23:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9WjPnYzctFtluAFILHss9M5b
	QcOlyOhl44CK8PDA718=; b=PSXHH/jQWX0ApqTKKBhahRXvAdK2ynPSCiZjP8mS
	mbQ+Jn6eWr9spbmHrx9Zdf1GFBwvSNPzctuWut8wQoKYJ/nA/fsdnC+FRHoGEMaO
	SmKhBzxVx3cTy0dYssSiLQrc/o0J4t7Q38/VRkVTILoZ3z4TkfUv0kzDqKj2nDSH
	KQqQ1KaXRHjHfIW2DUW/4CnD5jm2DLx0AvcmewsoJWEFvtHbDlXBVVczvFRPXNrL
	UW9N1nf5Z8OLY8k4j5hWX3zPkMHNa8ptvxlgXycg6yIVi4zygsSNCzHOeh5VFH0J
	9voxuPFvZwHI4Tv32syjrvqwvXCUG2YOgFVi9RJBZ7/HOQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkg7ru3qb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 23:27:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4987c698so33716121cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 16:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776468445; x=1777073245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9WjPnYzctFtluAFILHss9M5bQcOlyOhl44CK8PDA718=;
        b=Pzs+vPeXdEm3KiyX3uO8MbK70ikm0DMUMYUHd2uQnm2Nfi2tVePaTPIJjsS1GYvwim
         WkrpQUeyqMMJlN9V2CcodHX2ztVSYDMEqszljXfgL4zSmFEZvhLr7jOcC8QCHa5Noc56
         Nk0wr5VOvj4CUdb0F5209pjCQeWtr/wHTC5L1FkRZQyKuLaaUX6l8di849WBMzdEXjWy
         KO1AHDQpzZDzzjD87MnqTXmX+PfbwHbHAbqBrB46fZIfR27pKEuTlmJHgydobFHucyi/
         uL3BfmndiF1MZB/+YsS2e0AfdqJx6O2EUKAzAWhaP+bdGDQ4mDtbF1KWvNjc814WDo1g
         pf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776468445; x=1777073245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9WjPnYzctFtluAFILHss9M5bQcOlyOhl44CK8PDA718=;
        b=m6fc3yLAhrr9z+cHVRtJCRQNngmlCj0tIzCiQGyc1CUqZj9rQIHApuYAzkFF942hDw
         EmEnw/5MgKDpvnUUaoKkqZMouUYQuCbiZzqxUAg8/02k8M7wA5xmH4zZNErTewKBH/ii
         mtUr74bSsn5IVgE5FIkddNrG7AoRgPCmzVrh1m4jLpT8xflAaJeekgjg666SAEVbb5L/
         bRbWvYKV2ibO1hbiAMt1ZkKEnuho7xt7NhWvDF9Mvjzt/DEcqEvArWCznwxeIm+LKuqQ
         Lc0C4o1GGoEz9pkjjXothe/duzBsTLOM9/GBbs46fhwrdwbcztg92OCxlYvWo8O4N1Uy
         DwTw==
X-Forwarded-Encrypted: i=1; AFNElJ/z3iofOChqXcGnYJn++RdEfSKLgwRvvvM1kXFMbKC3coEdbi5xEFOgAJrdbhWnFj/9aUcVpi1PRmp0NBe5@vger.kernel.org
X-Gm-Message-State: AOJu0YyxnbjUAg5M7/eITB01nvHLY7Pg7BNNMHQ3Ck1k2Kh1rK2XqXPU
	LnZSyi4Yf1HmtfEzCaddboZmGD/aVvgKbGr0QsnIz8WTKTsJ2RVeW0zfNgGwuJQ5NhRa93vV2zy
	O/ZfTguSUKfMbWLaCGhqA7gJ1aZmAbfyWr8Ezjt38j35tRHLBWwWqvDpUBk2ClTZ2THpd
X-Gm-Gg: AeBDietEBVmKO9nYvfSiiECiRgt5XAcqM25OVUZmcOYUqpSfGmmukfAZzu1Y6qoHCow
	bkG2Gwd0od44r0pVKSo8HH860qBI1hyVWAFm7vGxHfs3t0u7Sb16anzVFOjeQmUmcEz26Yjp1Lb
	slsHS+c7tguG0wiC2BdlioOfLIM74ldDZodBJfYhpJ2mCcR1jo9H4Z+X+1SCSRj2tXW3aB81eBd
	Zd7KRaspSk4/lsj6P/pCFoz8ohO9XzspfIuSysEzyE7ovy6UoZ/we5Qf6nf5NTPqd+RAPuouv+T
	JLzyElkrux7RPxvQP9EFxWUYzrXt9NGpXQn+IzvtFacfGJXWj4ISiRT35qyFRIT02o/S9VbaEpw
	D+quyLlcyLORHbmIm5/sbDGY7qH04p7b7pmSauuB3eOUqcClqzGa0IG4L7P4Z/Nl99EIQHY9meR
	NPDilbfJZXV4LFpYuj//L7CcE5MN/o5XAM1Uof8jAfirA9jQ==
X-Received: by 2002:a05:622a:1304:b0:50e:18f9:b5e2 with SMTP id d75a77b69052e-50e3661da7amr64793301cf.6.1776468445518;
        Fri, 17 Apr 2026 16:27:25 -0700 (PDT)
X-Received: by 2002:a05:622a:1304:b0:50e:18f9:b5e2 with SMTP id d75a77b69052e-50e3661da7amr64793061cf.6.1776468445097;
        Fri, 17 Apr 2026 16:27:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ec277sm812386e87.84.2026.04.17.16.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:27:24 -0700 (PDT)
Date: Sat, 18 Apr 2026 02:27:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: purwa: Add EL2 overlay for
 purwa-iot-evk
Message-ID: <6x5wx4nonrxmnrooejxflmz7i7fi4dgda2buskeqqqaacy2cyk@wkigi7zo3fyi>
References: <20260417054200.2402281-1-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417054200.2402281-1-xin.liu@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: BUGVoQ_SEBjabRjk5ys0ospo484GZfFm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIzMSBTYWx0ZWRfXzeoJe1hA9Yzz
 RQZBLljT3xHh0VGmi5ID39V7sPJfsEspQSavcs5mJV057+FR+mZGkev121/WaMAfLUvzsw9fA55
 T//DKHRNVN/Vb4S5tbOBxD6YBV/psQglwvJ1X9Vxba09AZOUIVEQaJ7SlQDgHeaorxXk8o97cLk
 Jr57kUcxYhU2KqF5Sfb0cLsvOO5zz7pOfXxQBXjKylSRrUXaXGYOi8IJlmarNbuKStRIyi7ieH7
 wedfUEICiYc0TF4jJFhaz9taeIN8nY9XjFK0jZ81ER6OnnY77xUTgsEwwu09pTwCVKLZWrmxYaC
 9yf6Xy73pWvdqY/bMftyNAsPcvkJQ/qF2owHkJkD0w9VI3lFMGREzIsloQ+mxfocaMpDGPXVq1S
 lT8JnjHIGWJ/e16wLP//l20ZzdRbpV4rxqZKQ53674T2LXAnrye2muI2+58UA1ZCGBXHaIxNoCV
 5n3mrLpX4rip3k5V0YA==
X-Authority-Analysis: v=2.4 cv=b4mCJNGx c=1 sm=1 tr=0 ts=69e2c1de cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=c1XyI71JOhys0xtxqyUA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: BUGVoQ_SEBjabRjk5ys0ospo484GZfFm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170231
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103575-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 507EA41F28C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 10:42:00PM -0700, Xin Liu wrote:
> Add support for building an EL2 combined DTB for the purwa-iot-evk
> in the Qualcomm DTS Makefile.
> 
> The new purwa-iot-evk-el2.dtb is generated by combining the base
> purwa-iot-evk.dtb with the x1-el2.dtbo overlay, enabling EL2-specific
> configurations required by the platform.
> 
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

