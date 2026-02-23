Return-Path: <linux-arm-msm+bounces-93848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNbuI43inGnrLwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 00:28:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE73917F69E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 00:28:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6059E302144A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 23:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F4137F755;
	Mon, 23 Feb 2026 23:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXJ/POPd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FIKTwhFa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2822F34D917
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 23:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771889244; cv=none; b=FPXIEc+3p0LulOX79yrKpnfs8P+VZ0izn/UOmN+wcp47IvSl4uHD8uU4U9Eq/4e2s9ZGJ5DbQnEkEIeK1tBXPTc03nj19lD2U9AUPDGNbY9udxqmzgl3e50iUgqi6aKMqoxnqQBZTCCt9oH/tWxefVItK106zVwc8wNceYINd7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771889244; c=relaxed/simple;
	bh=sKXUiGsQ+wwsg+M0wKf1IKt4WhQtTEfjoJNkAeYl+yY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TxqlcTqE/p7Rt/tAdE+HKDsXMimySPI1OjgMF4R8M9iWqbTW/8wTpUoN3s67y1A7YmVXuDZbFu22PIFuEpoYiNj1cde7nYsizq3svEyh4P9djfmX6ZWcWHg5ntjPfLTclp51a50WXoMr1MYtedIGtFcYi0NeJkc0OCXAYEjJMmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VXJ/POPd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FIKTwhFa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NIuf3i561728
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 23:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XQMEE4zQDEJWXbhbQn8aEjbq
	vTWxQ1D/g14nBRE8bsk=; b=VXJ/POPd6hE4A4AYfEC9N1zWw6mldcdQkJ3YSIQe
	jd2t+tW/G8JUPk9M2UZoUmSJKUhPOvsy/w1u69fz5f/9zkQbyTeliHkMHkBoQQN0
	o6FktEKjEcWNPiP5QhvnLzqkpqSb1S57LQPV3HLjNQiYJD1YasCGfKzxYCh0ULiK
	TJQRXhzwsZMwLGUdBHKIagRv1kADW0nNFdrzsSle93jGxwP+LScVn7Ikpvjbhyqw
	KNqSIBx2RhGiPvkrUyesnsLNUwdoLF0Dv0gkEKhw5Ez4fARUxY7efJGiepUC1bdC
	irJEeBoLGeTM1mNnSSbAZWv8UM9noAf0gOsJe8tQI90a7A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8ra6sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 23:27:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4d191ef1so710008485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 15:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771889241; x=1772494041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XQMEE4zQDEJWXbhbQn8aEjbqvTWxQ1D/g14nBRE8bsk=;
        b=FIKTwhFa963J4CbO98HsrejTujFDMsu0d1/wJZcNIGI8ZYyZN+b9Au4I7D7LYmuAyg
         IFiKLNFaPDgFZ7PSzez0XTpVEpTnr16pUk/dam0YOEK/jnb5/IRqFjaSIz1+uxPTZLxO
         GcZOYy85gpkicXVhcE7EFQwAwPQgg6IdBytnTn6B7DYBxZ+dWAR94SP25ZcdCI3urFbK
         aPBlbiEnB7wZp4/KXAKASWy8ppEjYpzEMXLq9mzcOW3yo6LMHShEJA3DCIy7mnvOu1L0
         khesa7cg4M/cd46yPb64cWN4Stn/1R11LrZstMhBE7/Xr0a6BUVFC5oncBALjkt3T9sC
         6Cnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771889241; x=1772494041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQMEE4zQDEJWXbhbQn8aEjbqvTWxQ1D/g14nBRE8bsk=;
        b=pJ5KEuuQSq5Pxd0kiMJi+FoBbVuL+BXFgJ11WnMNA4EZB/ytbaMU7DfPN09xK7bWUJ
         r8peubj8OW75D6HInc3QVPfxgj0FoOSHPKMsek4kUeZ2Ti/0lIPJAV3ez2QC3ksEBque
         ZQ8oKuyxVVCXmRJmxwld+npXhmrCRBG2yW1Q4n3ysYZLjnCdWe/G/8He4vLBOuvFnnA2
         0g3ozFZyZUj3B+xszkH28JJpKGWRrelqD/rRJhPRFOvZ1t/fa8rxvgxRPwyVNTtMwoCw
         kFBVXHQFp7gYKXV/gTubzeGpG4Hv4dp74lAO2fR6Rl7ECum9QtR4vudQ2vpi7SUJQ/9y
         7+wg==
X-Forwarded-Encrypted: i=1; AJvYcCWB2wcU5KEZHOFBXoNf9cb7uJaIpNKgHVg8vQJDGBB/4voWzguCMV7/Ls2TCtUna3p5a8wJ3Fn6yGekyWJa@vger.kernel.org
X-Gm-Message-State: AOJu0YwUJhy3iGnaeGuB7cKYooeTCjcanjnJJYMV/duhkgXbPH+MwpYW
	oJtPK1rJup80AlvRxXaPGCytduOWmhHb6CPXriBpiH0pz9PvFQGBMCZ5mt7HSxZBOET3txi+tem
	ZcwXYwlJA3fP4Ct+t2kFsUNFiXM4TBzY/7GoONtyIUPZbmfrVkqywVey9H55GsN4B4ZA3
X-Gm-Gg: AZuq6aJklXuDobSHmSyMUSxUS4g2gH4zTvxVquS/W29k8lRV7MLub6G1ueumdgV57X6
	YC62MeP+0vdXVUWuvP2a6prx7pPSl75KNfudYgWHBGw//cKCKOgQ8YtIeQ1k14izmDip+xBgLs+
	V9YoQJao0UflY+B4KsJgSJ1jSm0nh3TBtnFNVYQ9qHeBx2Q/X0f6JNKoi2akHJwnQOYSv/v5g3L
	0nqlgrxjF+UFtpT8f3MfTu/48WCX3ytkpjufyMP5l49+Bzr4tBP4OQFOyfobJuLIbw8d+SrtuVp
	MbZLwdRfcgfSwnSMJNsGXtLEHQRfuUwPNzqRZVzROpif/QaWHm/CIv762kmqTAWskhkShEFoEQr
	g0cGpA92LItyZooBLLOIHWFf+Tm1zYSw/a/Br5L+Q+GlylhcmchKIyMiqpzT5XpSfOej2WnGM43
	gb2lHD5njyIZe6fqeG836TpCsBCs6v1oBbz1w=
X-Received: by 2002:a05:620a:4445:b0:8c9:e989:9d97 with SMTP id af79cd13be357-8cb8ca834c7mr1325879285a.68.1771889241206;
        Mon, 23 Feb 2026 15:27:21 -0800 (PST)
X-Received: by 2002:a05:620a:4445:b0:8c9:e989:9d97 with SMTP id af79cd13be357-8cb8ca834c7mr1325876885a.68.1771889240668;
        Mon, 23 Feb 2026 15:27:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7a71271sm19006771fa.31.2026.02.23.15.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 15:27:19 -0800 (PST)
Date: Tue, 24 Feb 2026 01:27:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sunliming@linux.dev
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
        simona@ffwll.ch, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        sunliming <sunliming@kylinos.cn>, kernel test robot <lkp@intel.com>,
        Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Fix smatch warnings about variable
 dereferenced before check
Message-ID: <bn6v3tfwj4s3ymfzbulo65qhnq5psfgjwfqaqmhxxuli6yj4mt@ugalqwbx5hhx>
References: <20260130053615.24886-1-sunliming@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130053615.24886-1-sunliming@linux.dev>
X-Proofpoint-ORIG-GUID: hwa-sHJjgfJuJaB53w0qAzNnbdk0CXbS
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699ce25a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=y2YDxqopTWoFPjg0B8cA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDIwNCBTYWx0ZWRfX4qFkj0kJQoy9
 +VWPKWNUls+GR70KPYRh1zNVblBfA/FeKi+rqyHlnXlUP5ODFzv3UVCLy+yiVfsJe/99tvKseTi
 u4RL2Xc3YH556FNpoF6ZiYkzUvkMbve7dPCJN/2U+8lDNocCXYBIBmr5ltUJGNnGpiQeuQX6oJw
 VWEM5zDJ5qzj7UpR17W9ufNMxq7dW/l5OVLQeBmli7SIEyWR+c+E4GAwnd4VfueRYhAsOvN5HJV
 Dr7+csACpXvUQ7JEM23EWSgAvGCepG74YN1vkYtptj0bbUrthfIaP2073muPH+qkYbXrmQbFlTF
 3Ac7Cy4kOuetPEYekaprTAvJpz4jPYlBL9hAHDIUdE3KOEozwuIY7OjQMhUtHl/otelDi7mvRcc
 MeAdJS8LdrMgXjnWHXT11gnZyvrID3qPgpXh8M3sgIa3cVG6G4oqefeYUUyNs7cKq/JWph7dH5n
 rJWOiR6PtxPeJqXhHDw==
X-Proofpoint-GUID: hwa-sHJjgfJuJaB53w0qAzNnbdk0CXbS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230204
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93848-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org,kylinos.cn,intel.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,oss.qualcomm.com:dkim,kylinos.cn:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,intel.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
X-Rspamd-Queue-Id: BE73917F69E
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 01:36:15PM +0800, sunliming@linux.dev wrote:
> From: sunliming <sunliming@kylinos.cn>
> 
> Fix below smatch warnings:
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13()
> warn: variable dereferenced before check 'ctx' (see line 159)
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/
> Signed-off-by: sunliming <sunliming@kylinos.cn>
> ---
> v2: Fix error code
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

