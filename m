Return-Path: <linux-arm-msm+bounces-103597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPPFEySo42l4JgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 17:49:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E56421810
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 17:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EEE913008605
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 15:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E8C2F363F;
	Sat, 18 Apr 2026 15:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y4edaRWi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ejXCjKZ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76442D46C0
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 15:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776527387; cv=none; b=hGEyFM74B0ArFnCU7sX0WZ8vAO6/63c7YfCTyBfvL2NzIJOVvC0kbEo2JMKIsyM6ZQbwzDKE/XoCKtzNKnsBnn0l+z/tyxYodIF8VnCSL4W1khEtgDZzxATAoHvBngbjRDB5wHaBqOqNCKSXHiT+htyROM0xG18WTrs99D+mVYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776527387; c=relaxed/simple;
	bh=/HA76A9qprGa3+OO9aFpPEwwDOzd7I4+pEXNu6iBqSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a3IVywC36NOUKwarAy9lUI0kX6BWACsgEiPTAHYjp0Vd2V9Qq5DOSj3whGG4RA0G/SNCW8k3vfKm5h3A6/UcfqeyXTWYqK/X3J0C6uvZxJ9O9gGG+JRFqzI0hH0/xRcqIjNZ91JmcsKt3QCsBnM02jga6Jtgkdw1vfCVmyVSNkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y4edaRWi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ejXCjKZ5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63IDKrNx3082932
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 15:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z0VY8RVhtghe7kLXnB/ZJHlb
	XDKlFoNE8WK6EfPBUsc=; b=Y4edaRWiJ6seoYfn3p1K6ABfdL5982i3mmGG4krh
	s0o5Tiqhwm5ZVXpoYSMs2Ejk0x8kIaIp+xYbDQUGXUv0YKFsO3l/3yRnrWHaGmIU
	24BC4L9XbHb+cvRDKUIV/yvyGYK5PiTKQUzKA+lNGrtnggpkwhlWO0fC4Ygf4dI0
	HkLJLw+1saMDvdgh1KD1b5i0TSqUEn6/hasIgtHtZuqyE5gh3uBUFAjUxWLSgBrS
	P8Cskyf2sLNJSdC74FPC5ukVF5UNkVw5p98vZVHmJVlIMVLpPcQhloMCw4i3O68n
	U9j6UFfzAFmuzMvFSu8qVDpMfpU/DVpU9FV2LC4/8ccLLg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0y616n0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 15:49:37 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-953cccadb32so1882945241.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 08:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776527376; x=1777132176; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0VY8RVhtghe7kLXnB/ZJHlbXDKlFoNE8WK6EfPBUsc=;
        b=ejXCjKZ5QLK3Wzy86yNNLDPwyP69CcDH9Lc5kc4vdw0ShfjGOMG6hycAMKl56BVWoY
         DbE/qsO5Ql60hi4v4rwWeiM6yHf8vbENwH9sUolPuQQmgQVWR0riVzflerA00ebBejE9
         8NQ53k2nTtu8cHwlZBmZwUwwYfijpHISy5U0R3HkvWUEXPu4yx+owXjzNDuPut9x/zVP
         amsBaVG0Mzb5lIOlW/uJpuuF02XJvWnBedKtmDWCwH3NWkv7+PQdbmg6fYncl6xrGDAe
         HQ8JYF86AQIvpMlG0ZXpeaU4wVECS3OKWUI6X6iriGNe5JQPg3SXnrq4PcbmyQEv6/y3
         lkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776527376; x=1777132176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z0VY8RVhtghe7kLXnB/ZJHlbXDKlFoNE8WK6EfPBUsc=;
        b=rhnQ8mzn2LmmMUrM8oj6TQEHOZyEuBWCVmb44lgqg3ajXQRm2xqgTGPOsgp12bt0RV
         vTnZqmRJLyKZtsfFXL9vte0GWI9ro2EJiGkRGrEV3tANMRhkLN4FeLK2Q01Q0mn6uau1
         IWdz2jFg/ynv2HNnAYYIhD/CgR7PbPqlV9FeXqz3AcqjNNywcnJMq3SYoF8vPLUEPKhd
         Y4axV0axk5JPvHFzwBAS9GuNm/8tT69o9Es0FgwIwTNjqaGrTW/8DxRPWDRlR//LfRcz
         XHchfi3oCMJCtuMZOk1Qr+0cO6FmWEQBaKYEtKYNihZl0LyiybgEy+lfF+90bylKAC7a
         00+g==
X-Forwarded-Encrypted: i=1; AFNElJ/S3IkrjPmyvP9mEpWOUlJN6GNWXpA9WBT9hv0QQ25I2QubNO+3n86WTaBOqJYJPAacgUxNKe24FxrqG3P9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9eN/wXLlLIuYzw57foz9SVTZlIkmqKSrCb78/Gz//JWv1CPdw
	LmASmIcMSaPA18scgVDiruyXFsNoeglzZKxQUEg7oHIyaa9VnWwtvSLMpi+erVgAA/N1kGwG5xQ
	T/AOG6+Lhvwak90YYD1uUXs6Ae6BxTmrd25uEKCDJwxmqiflujC4QKEfx0FOZ3mStuOc4+YXOjw
	iR
X-Gm-Gg: AeBDiesENpQRxMTc2IzidldZ7K4oomcTYdT+zjegkG67uyh7JGIEyU6YkvUinMh8Ti8
	+66aXIHnFPwddgtrgMSs4jmatMIiKEIcx80HrLyZKYxg0WkTTCqr7UcA3xzj+ECOMOgD5PZf0qx
	C/+s1U4pdl4UyWfqL3MpH2zMInmoQjN0YNwAlmKJqoQMvany1TJLyjSw+Kvcw07BcnPB9ApKRkf
	jag6wOp+yQoPdsPUDwj1CEHvJHMbZgjAfaTKDZzwOOX7kms7SnIZ11cp4pf7YLxgKtvBPJR+YyZ
	DpGf7JLyFI2DJ0Iz9EwspD3u1eCZPgGFYEBQKP5ggGIfFc5bMnJkh7VzaAFt54Xw1utznLC7rXA
	UwRARi4DEIUAe2rj0hmnOLnxtjIjlCqnnjNF9usk9R8qtMqWr9D+WgT2DtX182Ks67/Zj/DVHss
	aMuTF0QZji0zli4bIkATnduff5jC476z5K/JuRV70MnEfnOg==
X-Received: by 2002:a05:6102:2912:b0:5ff:e39d:9f93 with SMTP id ada2fe7eead31-616f4e774e9mr3399707137.11.1776527376336;
        Sat, 18 Apr 2026 08:49:36 -0700 (PDT)
X-Received: by 2002:a05:6102:2912:b0:5ff:e39d:9f93 with SMTP id ada2fe7eead31-616f4e774e9mr3399702137.11.1776527375912;
        Sat, 18 Apr 2026 08:49:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0d49sm11771471fa.19.2026.04.18.08.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 08:49:34 -0700 (PDT)
Date: Sat, 18 Apr 2026 18:49:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Correct modparam description
Message-ID: <il6i7pazbbum5vxufwnhpkt6p2vh4kuxfhqs4bd34dfdp22pj2@z6hhdpeczrkb>
References: <20260418150847.157246-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418150847.157246-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: WFqLs4wp7vT-SNwGVfAb2jnZzGPAMNq4
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=69e3a811 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=eahPDGdU4WHvPLAXGaEA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: WFqLs4wp7vT-SNwGVfAb2jnZzGPAMNq4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE1NyBTYWx0ZWRfXwd5llwrc14rl
 91K79fbpuyaHzmVBJnrFHhsFkeKijcJ4jR4E0UA+Hi/x3/3DYnxiPvfaLS1noElJH+GvqkoZLeF
 u3KVpzmxuR99DTgET0kjTcAf5jYSyshYfq/wbzxQhQ7SI4WEePr7bXmOxPI1FZSLG8E7MRotQ9H
 d1vcA1PiTYYdUyXczC9Aq6UYT8G/g5vFBDkxm8XvjpRGPbqpITiaPrvIcip7fak9F0jMep3567s
 +lTKjyYS7rFbV8M9gRSI2ZcEgXSd72R/er5yj0MgUI7MtDjkkBw97Nh9j61qKRCmksoSWEpFyP2
 dGMdi27/68xlcEdsUx3unaDTx7K707mgNokMYvpkGgrB/rvnBdci8MlPW59mhFm8KCcc6pVVlF7
 MbLntLfVwmJXdNZfHQadSR8sUfk2+GKYgJbX/MnkAQd9ROkAT5LasnL8ozKDRM7G8Vk59QtpPaQ
 gRac16TOAsTRt3OX55A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_04,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180157
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103597-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,poorly.run,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 43E56421810
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 18, 2026 at 08:08:47AM -0700, Rob Clark wrote:
> Preemption is enabled for gen8 as well.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

