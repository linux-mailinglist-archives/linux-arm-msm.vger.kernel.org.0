Return-Path: <linux-arm-msm+bounces-108250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PrbGbJIC2o7FQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:13:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6698D5717AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 49A503014850
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 17:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD18E382395;
	Mon, 18 May 2026 17:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kv3vdsee";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HkIxv38U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51713382F08
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 17:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779124372; cv=none; b=PGfQYMiYzPf6Ywf1oK3R/PugwujTKM+irNDJzaJ2PjIakOeIZmLPHDYQQ+XuSFFPQxeoVPwDB0QuNIIAyC15Ota5ewP+H8aqyBAR4V8ejV2DUrvp1VC/qGwW3K+YZwJkzcHTES7HiWBNdER0ChwJzM6P40hxhXT9rEgbIIdlbqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779124372; c=relaxed/simple;
	bh=dv6fMZD/2crqlVa85sMQK/Osw1NdqzJ3DyQehrECUzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XSq3zK2w1Lcn8HsXzx3H/R/ZQZb1IZVpngUZSyLB+mj9LfJsLSW+RNiZ6cW53+Xn8h8p7fKG/DLAKILby7gWd0wRV5Zd0FVTdzu2n4GBd+yq5EsgHjrszu+90rcdOcV67njEZWWJHVw97hQNlyE0iuFo15WFkCwDz7r1XC06310=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kv3vdsee; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HkIxv38U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IBHlFc2482761
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 17:12:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Zd7Inw/SsIvtc/OfX+j4exDj
	HNsLgroQh/6miIUvMNY=; b=kv3vdseewZX4tr930IKkfxEq6nOVcWhelcjJ2S2W
	x3gP7OhNFrbtkYdsIMLTqBhY4J1rky5aFG/kZ9ds8xYbswuC9bWOLWee4B0z/C6f
	rBIoA6oks4P6HeIGwCU80At8cCJOaED5lDrDedk61LOOBmvm3Nm4FrU40/SnaOtT
	vLaBANcx2i4VJHIZxHJby/dja0RXjvf3arW29qUQB8liiinSmXJjah65NWN9T52R
	uBV9ipUWyDqAhp5F754+dnHmB6r2N+UNHCF7vR68j8b+Zty1mWSTG6/tWfC7GfYR
	M/ZxYOrG8NXLwiACdhlkMvHoKS8cSD0/imJiUeMgPpGcxQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e81rvhc18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 17:12:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516879bf1a7so54434761cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779124369; x=1779729169; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zd7Inw/SsIvtc/OfX+j4exDjHNsLgroQh/6miIUvMNY=;
        b=HkIxv38UNGE709XsH7xZnxfu/VkqIs0bp5NqZZ8ShShtvqTsKkFvlPdwmvR12+Aq0c
         fXy7lZAi08Pi/M4e2CWOAm7FEYCfcan4aPaFDEn/hOEvWxGiv8dG0viK2/5KEFzWOk6k
         XuEkWrNkIYZnh4l0gs2Vh376A3g/t4WJ1rRPfV9rBp25xUNAp84jrdBv7DzNGWy6qZsp
         XN/87BwuEOXXVcFnk3l1HNNeXD6Umr6E5OV0eZrc8m0Ub5O6Nx49sTTA3BidjvJt5sLs
         UPidxSEpNhgHa48RmW58pKx+OR7dJB3LqNVmWDqamXr9S17KjQQpBKeSvq0inNU0EwBq
         9I9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779124369; x=1779729169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zd7Inw/SsIvtc/OfX+j4exDjHNsLgroQh/6miIUvMNY=;
        b=ZjDG765IkfvIPT7ub11gKUT7pKJu35wgTBmONgKa2V27IV9wFJvRx+T3X4zMJsJk4E
         H45Z9vwfd/dkUwiUUzrA5hl56GxVA92PSUus+56Ojhv0iewEymt7UySlBL2d9X8hlxvv
         18CCGAhra5ia3HsakHgFce+ogrHs2LAs6Pv8kWGl158X3OtpLwXhSzi3SJk6NRvmbsOr
         h4o6fBxWNpsmbS0uAO2Rqb/K5L98bA06gQAVVJ3sbD4PYg6l18bcApkltcxv1dsqvrgh
         cn29+/SpR4x1Aoorm3k/odeAo/23Ve4yLR5Vcz+1JPJbfNaEsE5v0RPeveuB8qzow8FP
         R2UA==
X-Forwarded-Encrypted: i=1; AFNElJ9gENO5a9SL4Cvc4NrIcBQzn/I5ZRa46QHUltPfq09YuWEorzaUyTuFGhWAsUwz5leDdr9WSCmhEtTteyjb@vger.kernel.org
X-Gm-Message-State: AOJu0YxvPDH4rOYBsSjCq1mQ1M8hxBCbClu3JWLDhVwGnZawu9pQ92fy
	us3BFxhuSoZE4pdY790O0/yy0BVc2ddz5lXzKd/zLQt3ZBdgEo4fJoP+PG1+ZQ7Jmw5N1UmIaxE
	8BTYfuIkI0IC4vNSK8dMWmRpAM69zkCmjIi95XQdxCooeR9vjIV6p/0sHSb8PhAdnbiSU
X-Gm-Gg: Acq92OElSLU1/XonNt988vMPZRqNJDzSHEudR3t1F478bFD62gLJFd5dgRu2/1gjInw
	obwqY2g194FUsYqKgsGJf9DQa614/smOYVlrN+uAjQjOKbHiMTG+N8LSNl5qImjQJLxekUK03/h
	1ATw2BLqr0kFKzA5eRLwnRpKAAHmW39jQT0eFOnOLrIYLd3291eLdwifSgzsSGo3Tl5/5oOO2OV
	f95TZczOp8E8Z9dbrr5x4DVNkQc045aYRRbxp8o4k5edrcPE73kMOQlmhho/CUSUWKXd9cx3xiI
	CDOQzQ5e7CtyXxTaGVhtX6B9DsSiJjPtERXBvlkLWFpXkdkx+eNrP/uXiSEcDUl/0mWgXbo0iAE
	02pnWns83Dos+38e/yXkUVKipSkw1QUrMopuNieZuqq3QeIk4YyXVgT8BH16f33nC2ZsUONbsUN
	GeCgAWOvWwaLhThRevFlRuQ9PV6l/nhOLU6B8=
X-Received: by 2002:a05:622a:15d4:b0:50d:9cfd:b01f with SMTP id d75a77b69052e-516418bd5abmr236439991cf.32.1779124369515;
        Mon, 18 May 2026 10:12:49 -0700 (PDT)
X-Received: by 2002:a05:622a:15d4:b0:50d:9cfd:b01f with SMTP id d75a77b69052e-516418bd5abmr236439461cf.32.1779124368945;
        Mon, 18 May 2026 10:12:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f118991sm3450356e87.18.2026.05.18.10.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 10:12:47 -0700 (PDT)
Date: Mon, 18 May 2026 20:12:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: qcom: iris: avoid double free on video register
 failure
Message-ID: <voc7mqvhim4gfaar4n6v3b3xkttzij7uaqs7lh7jriatyonoi4@tle3syly3hbi>
References: <20260518105755.988961-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518105755.988961-1-lgs201920130244@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2OSBTYWx0ZWRfX3a3KUCCnXvSy
 YutgOZtI2EFmsncImdIFriYIAMtP1CP9EbijyTZz+oHrmqZMSikneuYdLV6M9VzRejz2XYep/I6
 z7HnYWU5xWxi1uq1dN4oxGKJfcpGbgzp8DHj4WAAUdNQdE7j+3tFyYAQI4m9JbGYjjRlZS/7qo7
 Q7BAXIqH9Ex+C8o9nz1b8cN4b3AjoIWacSb/+brNHlfp0AcETDTo40RD+MD/VbVK5WL1otkW3uQ
 w7cyoKEWsoKI8iNSWYrnM0EFT1e/m0r9MtX6ekFA55PO0colH+VL4tqOyPAcVj6XalT7bpPaRMX
 6pVk9oc+tFXxL3nqVweT2AEa4OGkRThFBg1YS/L6ZUqYM6klQoYfbIJ9QrFJIpHx1nKOP9ckZgR
 AAVG7Dn3JlEtqbr9zAfuQnQtlO/XYvJkThe6eE0xIZiFbrK9mC/5Jveu+9ZbNtsDFbABwxsFEfu
 mOnVYQsNWmXCf80haoA==
X-Proofpoint-GUID: NDeeSYDDDaLYCpz0r3NhgSJrDiZB37Xc
X-Proofpoint-ORIG-GUID: NDeeSYDDDaLYCpz0r3NhgSJrDiZB37Xc
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a0b4892 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=aPtAEAeG9Eil_ih03L0A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180169
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108250-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6698D5717AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 06:57:55PM +0800, Guangshuo Li wrote:
> iris_register_video_device() allocates a video_device with
> video_device_alloc() and releases it from the err_vdev_release error path
> if video_register_device() fails.
> 
> This can double free the video_device when __video_register_device()
> reaches device_register() and that call fails:
> 
>   video_register_device()
>     -> __video_register_device()
>        -> device_register() fails
>           -> put_device(&vdev->dev)
>              -> v4l2_device_release()
>                 -> vdev->release(vdev)
>                    -> video_device_release(vdev)
> 
>   iris_register_video_device()
>     -> err_vdev_release
>        -> video_device_release(vdev)
> 
> Use video_device_release_empty() while registering the device so that
> registration failure paths do not free vdev through vdev->release().
> iris_register_video_device() then releases vdev exactly once from
> err_vdev_release. Restore video_device_release() after successful
> registration so the registered device keeps its normal lifetime handling.

This is definitely not the correct way to handle the issue. Fix the
error path instead.

> 
> Clear the cached decoder or encoder video_device pointer on failure since
> it is assigned before video_register_device().
> 
> This issue was found by a static analysis tool I am developing.
> 
> Fixes: 38506cb7e8d2 ("media: iris: add platform driver for iris video device")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/media/platform/qcom/iris/iris_probe.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

