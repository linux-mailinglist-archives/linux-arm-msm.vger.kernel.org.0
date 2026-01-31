Return-Path: <linux-arm-msm+bounces-91359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBZMLJa9fWnmTQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 09:30:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAA3C141D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 09:30:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD01A300C93F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 08:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7448531A80E;
	Sat, 31 Jan 2026 08:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2QJv/Ro";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zr7XTiJI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0243A31D375
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 08:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769848211; cv=none; b=FlFDWSI5o7nFLg43kJ+YnKbjtLBXuVCESRYuMmfMdEbQr259zRfUa5Hl8Bxl5/p6RGAdYpWfILGiH28R6kAOsaMI85F0l80lRTjWFxqSeJMd48IIcq4E2hxtOK0GX6EkrCNd/NBC283DfatdH8I1BoexoM8Vk7wSK2l/FHmk7dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769848211; c=relaxed/simple;
	bh=Z3I+WVkTLGguhYb9TFkFosngEo7jXihfQ0/vPPM49fE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVbrf1DnD66Bl3Lpp0a2FPmHqKvdGehpTXFE8bIYGKqreXSi1AHckIyrd0ty6K7+pyYmftN+fVBz3rS04J4GIGS3Y91KiLtsFpNkNgxqPy6254OZTTRgR7oVAbksrRRe9BKa9Buib5EOLLW49fORJlxNIqSZIWfYtHIDJTsA1aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2QJv/Ro; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zr7XTiJI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4T7rR3957078
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 08:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ufXJQD9GBYFDKvoyoQAHCQdu
	6g2pHLom6Qi1xTuFWBw=; b=f2QJv/Ro0/gHpr4P2Xv+gIpbUnf0BZt19QHen1iX
	zWHxUnWQ/Kkxk5bzOoUogCZyKH8WU+0uCAhcAQUtu2CqoOxj9sznVoS59l+wZpd1
	IJTe4l6ha6Xf+DgBer2L2ycij+vMw+Cp8MzzlUJtMLGzlXYi5fZBiLbtfeS9iy92
	u6fzcIJ1rN5Xa/j7Fp6627xnrTHWkwJBnSlB3u2GtUFqLtr5KUpNOTsJZwxRkAPd
	uLvOZ1YWpa04+EkHcVn5acVD86PNsoHhxlCMqz3fmvBE5xIIXvH+4xqQfRPaM1Ua
	TtdBKcIg/iHSpv8o4gZPQEDpBkQUtuQYAdwNDnAOPZIvbA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1are8fsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 08:30:08 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ed0ec20724so7616787137.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 00:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769848207; x=1770453007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ufXJQD9GBYFDKvoyoQAHCQdu6g2pHLom6Qi1xTuFWBw=;
        b=Zr7XTiJIpvTmNY4xhOxQFqtd+2TptgV3Nio0glWMGm74qcazMVPmZwG1v5FxNttGGu
         ISHXYw2GvIt57ru9G9sgpPKipgHk68ZBfDpzPYn6MSyh4pU8h9rF+oitRYvkp+27u2Ky
         A0RmfGEt080E1Iy6GyJbd0HA8aDXlrgdGF0Em1mwmDS9A/MCfR7zEfvTbLYnRvpo33Pz
         GDO6cQWuQPbaRLnhTpKK1BIGw39yFEwklyN1b2jNC3BF0kV0v52QlnrfdGpm8D5Ym2Xc
         yzOj+9o0AcDOuDVtMhSvUFq6nzBCe+rCSBbVRlYTT/w/ET+q/0No2sb+hpAO5F/bxp1y
         Ibcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769848207; x=1770453007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufXJQD9GBYFDKvoyoQAHCQdu6g2pHLom6Qi1xTuFWBw=;
        b=SPyKllfJcuoWxLsNuicJd/kufDA3WdJonPUufE3MMdmZvilNyx83njMNY9f4kosAzH
         DIo/2q2SteA1l475mJW+BpPxdghyIO/XVvgg8sTte0mKE6V+NQfqt9apk0/lA2+gt+vO
         YXvfO9nAlYTd7T5gzEQwGVyeuuweKWvRButtLh8aCRpcsbVJ2Eq9bD8TAP0jgW4jXtSa
         chetAN+6V8+ejai9O9SqzHXy1lOfP05DtjKpx/8zo2w6CisMVz1OvqB3BuO8qd4UTNlo
         6x1GpiIwnAViAcUJ9AJ5T5DLwlAhcQWixMABzMv7Bi6x85AJWpX9BdL2Sxf/TN8NF6bc
         B/mg==
X-Forwarded-Encrypted: i=1; AJvYcCWetrwe5hVZ3bKUtNJ6O1qHnWakld8s5ckWt/lmg3th1PROAJwiO5qBmrptPk3ilymeb6Qi6sGoT4BEErED@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/SyUHWyYWh9O+B12ac5I6HKj7Iisob6NVHM7RFpRx23yw5ueT
	Yh1GP8q5NU3p8+Ljbx7DA4Y7cbBNPRhKBffqK2fsbj6wtQ0LtnKA45JMuycmdrxxqM/cXwKiYJd
	C8rfdjpSVKqvSaP8eDuHId+vpeZmS0Z0Ze4o6i88p0g7x9kYq274qtdfzUvYDubLzWcEWMEUqFJ
	O/
X-Gm-Gg: AZuq6aJ8/lW3tSAGYwhSuVIdGe6lkGpzLNxQIQD7q9n3msI3sxHno4RQci2xb5WL6bo
	UKWCP/DmnzrPPDKWyNiqbzA4D//LQbAYkQgBBtaDY84Rl+IbwmZBg/+6wLGc4+D5BHLvRa/6UKw
	btke6pRf63cq31/X2Xp+1LZJWummaz6NrpQ+xT1F6o060n9WoiAIrHRcElZt4dWLuvZy4k/EFyo
	qtT3J4mPLrVGy2rCU6H0+nqQ6qQa9rNfSNTlPwTcrTbZJ+IdCL5y3RtKfIqiQdwBu2SjqYJt4dE
	Z88QRRPzuuLZvxHjQbhB4D23/0YCZweRB4pVSmmRxvpSqRgWgDVv3moUfGjkBbhHcpP4e8nta8x
	lviMErjN0ZbthGWfSQSJ/rNKEp7hE1vEXtukyfOHyGDSlClGNRbh4A5pYtPJX7Xt6KFBugFQ8+8
	bZST+51tfKbvIbaqSgKCALvok=
X-Received: by 2002:a05:6102:c93:b0:5ee:a76a:8513 with SMTP id ada2fe7eead31-5f8e265ee7cmr2080893137.33.1769848207375;
        Sat, 31 Jan 2026 00:30:07 -0800 (PST)
X-Received: by 2002:a05:6102:c93:b0:5ee:a76a:8513 with SMTP id ada2fe7eead31-5f8e265ee7cmr2080885137.33.1769848206973;
        Sat, 31 Jan 2026 00:30:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074bbf55sm2300983e87.90.2026.01.31.00.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 00:30:06 -0800 (PST)
Date: Sat, 31 Jan 2026 10:30:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sunliming@linux.dev
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
        simona@ffwll.ch, sean@poorly.run, marijn.suijten@somainline.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        sunliming <sunliming@kylinos.cn>, kernel test robot <lkp@intel.com>,
        Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RESEND] drm/msm/dpu: Fix smatch warnings about variable
 dereferenced before check
Message-ID: <iypev74zzv6l2ydzm3r5jfk6qabf45ujyhenxsyijegpcghwji@vpozmiehe65y>
References: <20260129024919.30449-1-sunliming@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129024919.30449-1-sunliming@linux.dev>
X-Authority-Analysis: v=2.4 cv=NNfYOk6g c=1 sm=1 tr=0 ts=697dbd90 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=s1uS2ZYBl9SNm-zYMqYA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: MXUmyWMUB53sYPAGyJc-CRBbmu0f3qLs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA2OSBTYWx0ZWRfX6pW6/FRS+h9O
 gWqM+QNAODBxu7OIVH+Qy/2Tv0nYjBEe/yo1VcD4XN5d8YFxb0eHNtNKtRig6O7bxxcR0OqKCSZ
 jMLfcpKznGAcM6vlx4n3dXvABKeGI/FkgJvYsKzm1RDPuRrXwfF9XTNV78ot9kneWOKwrSJjemt
 BknH5yJzGbFXDW7G3VC4dvS1Oy/ROWl1EHNcljfPI8uJwz9IIgh2RKscceQNBf7vlA0vxudYMZj
 nse5YLUMvVJhXjG2em4eN+oEFHQZ9Js08IHi33tCR2ynW33GqC4rNRVV9lu80oY3ZylvWgrBY6Z
 xLSr7g0n1e/bZtduYU+PR7dxrra3GcwwN96A/t9d1nW4R+28N764IOx7ysMUjP8FfJgIpYTDWfw
 kuuj71nKhf39fG79G/Yv7eSNi4MP941lm23MTrZtQwBxfLoP4MFBmK73SZ3fWgBN4SN15OANrgR
 2K13XPyP5biP86sgb0g==
X-Proofpoint-ORIG-GUID: MXUmyWMUB53sYPAGyJc-CRBbmu0f3qLs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310069
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91359-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org,kylinos.cn,intel.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,qualcomm.com:email,qualcomm.com:dkim,kylinos.cn:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0CAA3C141D
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 10:49:19AM +0800, sunliming@linux.dev wrote:
> From: sunliming <sunliming@kylinos.cn>
> 
> Fix below smatch warnings:
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13()
> warn: variable dereferenced before check 'ctx' (see line 159)
> 
> Reported-by: kernel test robot <lkp@intel.com>

Closes? (you can just reply to this email with the Closes: line and the
URL for the LKP report).

> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/
> Signed-off-by: sunliming <sunliming@kylinos.cn>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

