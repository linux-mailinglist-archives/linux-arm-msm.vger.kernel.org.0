Return-Path: <linux-arm-msm+bounces-91219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKZ/NCf5e2n4JgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 01:19:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50202B5DBB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 01:19:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 355833022970
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 00:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E12279DCD;
	Fri, 30 Jan 2026 00:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J2FHjCEJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BxDyUWCA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8F5279DAD
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 00:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769732367; cv=none; b=t8yaSesRRknI2kriTMnjJXK2XwpE+uMYaTvqQbM8FQn9LFeBCzLIaBut8Oer/efQRnAajP16iPET9otqkXfRIRkxM2phEBC2Nw4fiDf/antOSvwyMDH6py673f3E7tpmld8+6y7cnz9sgRHkcOQGJGbPW2JuDqwz3QeoUDdr+F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769732367; c=relaxed/simple;
	bh=EKiQzoEkzljnc+viujwGwJeys/BQXOjyz6zoi4u0dvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+OXCqpRS1mpH4vZh7WpD8M1YAHZ4Jg+78UyQxPEjyRqukJhRQcZ0gfoqzq4MPjCbztz8dxgMHKHOryjee03qXZciXo7JFHhR83AsOaq3AJz2bidScAzf1SI8nBQH4+fZuVb6uEYM4gfEbOBZk2eb7KuNfZ2+uuW3EqH8DQ5GHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J2FHjCEJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BxDyUWCA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TImW791036345
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 00:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9CJ43V4EbjuhLmiO2IaWAjx4
	TLOb/s8qWCGW7bqpIoc=; b=J2FHjCEJbteIYvp8WoUyPUf3glmqk75C/mRhATyt
	gNMdyEOI2/mhyxqc1f4dp6R7vLOYGZ97FgPAJ4ilXwSp03Ia+y4ltnq6M3LDKe5n
	GGZq2dknd60+rIQlwsC1njurnivFpDusv4DxR38rpnIAZS6yGn8WSX7KbWpdCpR5
	OrUqzN4mKsBKKaHzMrHygX4a/yANTBf7FcLpJsarxextHIbsy50Vm3jYPqjuSA7n
	4ic0/qn1SqlJoYWXbeovMh3hqy3/pXuOc/EZvWR8Ab8JVROq4bPyhom/jg0jyUX4
	knXRCZL3n2DIA4gzmbGoDJcqaPihz612oJYFTojY7NqUDQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0d5frsjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 00:19:25 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12339eea50bso9307306c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 16:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769732361; x=1770337161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9CJ43V4EbjuhLmiO2IaWAjx4TLOb/s8qWCGW7bqpIoc=;
        b=BxDyUWCAE7RSEm/iDPX8d2vETfM5sj1V5ZJTeYiH0UpZBEApN/nM8ETrFVqTCeHI0S
         90EdZsqTFfWuG8MiuWKKpzEgOjVpz6yAWSrtUpjdc3yt4M5atpD4gyA1iszLu3aiGbi/
         9MosZ7rqTJ3ZVEBQcMzHXSfDBhLrCzo4IPV4rMzF3PxGx0LnlnrA+5PbUPLmLdix2vb0
         vS1vnvQS12TAhTF2BbSSGDDBXoFAJ0eswYP9jDRHiSBwZfPzi6WYURfuB3lhzyS0xTDu
         y+U4sV+JJhfLwdicZgT4r9249PYqYygUpqxJ2xB0A2HZwiQuBP+lypvxNhn73rt/HXUB
         tiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769732361; x=1770337161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CJ43V4EbjuhLmiO2IaWAjx4TLOb/s8qWCGW7bqpIoc=;
        b=XgLPjuz52yx07+wCXIHFRHDETNryvOBeMVmciJpH7rVR0szD1obgd2kNeN3uL0RK2Q
         sBDeoZdynMxW3vAz2wGollv5G+0/wx/NaX9V2puAUJx0GDkv5oN8uekPOPHrUr9t4bPu
         dPP7qiJk2rFNLEus3NuI/CBHnEGhC2d6xmvRjTjZSe3etrUALLwF1ICumISc1Y7GpfcF
         cOf2OXdtKoJGwJayFHDElOGB8xXVAVcLvNnzFjxqmXVMfWmbbLhIDJx9HDnhDqtfU4HW
         xwylKbLm6rr8w5TqyjU3+k1kzsP4rUktL8ChVGSvPnUDqpkQlTj7gaXCOtSSHSgxRNbz
         xHgw==
X-Forwarded-Encrypted: i=1; AJvYcCWH7qZcBts+Umy+ovfWvOFQwXoxANKwcwdIuUUW+Q3PJiGs0Oj0krWvswMPWfLEtF923yqn+anztx+IUywc@vger.kernel.org
X-Gm-Message-State: AOJu0Yzff4HbF4CqsMj14C/95Olkzzu9qomf06g4tR95o+JCxfIWFj+g
	ryaQ+vpsXM0Ea5rTfp8Dbe2iAGyWMaqM0U9UHQ7M7cH2vZ5/W0bYBT/PK/G0Z1Kf+3/kbya5RQt
	vi223ZKrKteL5mp2LoVI3KvgDa2NgpHcKQ0+9tckcAyjkFzbVH9xqLufkuFJFTMZc2Xvv
X-Gm-Gg: AZuq6aIiHAouvalqZCvVNxO3SNOBjURrMGKqUfwhCYVKRhA/hL3Medx2Nzs3YoSfxCs
	Z9HA/GjZgQsq332SevLvQCHm716MdYAmWuVuOsMLvnHJ77yWOvhCawWTfYy8aUSap3T7at32ptW
	MAbC2gmUKFFw4tPvOkauk9Le/8dHcgzoJa0VY9DLJTvK89JuY/VuJLnoqvK/7/7Rf0Zu2OkcwGW
	pCwr6DpQgcL1lkorDNl1qiH7O7/0XtDlBuvNCbWPw9iIoNBCTO3bulEIzN6NbMh7TUGxEDhIEHX
	Rfzyk/zL5hC3e0DmKUQFbPi6wipdhaCnhPDHXPX7j8xKZXfeWmNuh0Qu/W/d4yf27fqoaVHYFkl
	D6uDDxA8uL7Zw2z3H+gJgPLGEnAlYhMj3bN+Vf37DI0ObGmZ+gqyb1ymE79fEgIQ=
X-Received: by 2002:a05:7022:438a:b0:119:e569:f274 with SMTP id a92af1059eb24-125c1021a87mr570948c88.29.1769732361337;
        Thu, 29 Jan 2026 16:19:21 -0800 (PST)
X-Received: by 2002:a05:7022:438a:b0:119:e569:f274 with SMTP id a92af1059eb24-125c1021a87mr570937c88.29.1769732360795;
        Thu, 29 Jan 2026 16:19:20 -0800 (PST)
Received: from hu-clew-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d8ba78sm8163033c88.8.2026.01.29.16.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 16:19:20 -0800 (PST)
Date: Thu, 29 Jan 2026 16:19:18 -0800
From: Chris Lew <christopher.lew@oss.qualcomm.com>
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, corbet@lwn.net,
        rusty@rustcorp.com.au, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/5] rpmsg: Replace sprintf() with sysfs_emit() in sysfs
 show
Message-ID: <aXv5BipphkogvzkZ@hu-clew-lv.qualcomm.com>
References: <20251217065112.18392-1-zhongqiu.han@oss.qualcomm.com>
 <20251217065112.18392-2-zhongqiu.han@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217065112.18392-2-zhongqiu.han@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAwMCBTYWx0ZWRfX55p1rerevF3M
 /YxcMt726HzjDNBA0CQVzRKqSk8boY8ubxqkUaYc/+bWShqHSAw8zKEaF/4TvjUUVjnZXid72+E
 8qWB80GdycZLR9jRMuhMc0LCF92lDAU2Q8gXkl0UDCANd7JZtMrmADd9awMv19MxycnnjtovjIF
 mJf+7Twl2Rkl+I19oYn0vCFP5bzzOJG6pgyqw+VYPN7+rwSlg4Gv0MhgWMyqoGukg4hopJtWXQ6
 mgF2po03XRUamQa/66fsezN+LGdt8FPT/BhqeOUAY/ckiA72/359KfH+E9JkPRR7phOBc5oGaY5
 mzx0T04gsbmaP8FBBbni6rOLv2WsrMDwi2ZqFhxjkjWDMWXPqsLJ4c76AgL6CqvpbY3o4r1HtCd
 nBLftLxnu9xtfte3KtbMBzOhYTvAmyOxhwsTuwKvdFHvVFcxvrpT75NGDSmptUkxsGUZG4ZGMZv
 I1KqCPl5WZQfAxYXjYw==
X-Authority-Analysis: v=2.4 cv=U/6fzOru c=1 sm=1 tr=0 ts=697bf90d cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=APNczDZykQHC8614KWwA:9
 a=CjuIK1q_8ugA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: bZXl2YzTf6InRhf5TvaCCqbEA2yPDPjl
X-Proofpoint-GUID: bZXl2YzTf6InRhf5TvaCCqbEA2yPDPjl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 clxscore=1011 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,hu-clew-lv.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91219-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.lew@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 50202B5DBB
X-Rspamd-Action: no action

On Wed, Dec 17, 2025 at 02:51:08PM +0800, Zhongqiu Han wrote:
> Use sysfs_emit() instead of sprintf() in sysfs attribute show functions.
> sysfs_emit() is the recommended API for sysfs output as it provides buffer
> overflow protection and proper formatting.
> 
> No functional changes.
> 
> Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
> ---
>  drivers/rpmsg/qcom_smd.c   | 2 +-
>  drivers/rpmsg/rpmsg_char.c | 6 +++---
>  drivers/rpmsg/rpmsg_core.c | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>

Reviewed-by: Chris Lew <christopher.lew@oss.qualcomm.com>

