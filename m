Return-Path: <linux-arm-msm+bounces-117042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C/oHCA4gTGp3ggEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:37:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5289715C2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:37:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="n/g9HkW4";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IHbh4n90;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117042-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117042-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 328F8302FAA3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 21:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A56395ADE;
	Mon,  6 Jul 2026 21:37:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC5647D93C
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 21:37:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783373833; cv=none; b=e4ofVEJJQRwwL6plcuvIWYv4hPPy/bumvYyqDGnWLkD0YfrRYnXqyFRS3vHSoZ2LxK9G/NTKip/NANIXENYEzeaIOTEiXXYejBkq2POMv3dBrSANs+7XXKZXr+HpqULWyNPnaKnRqZoIR3CsrW/cGeQc9gXbQPqHey8UDvLlS40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783373833; c=relaxed/simple;
	bh=SYSTzYMV9dZlGM6XYUNUNoY3tliyo+BItosKaSVA/LM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R32hQxIWrJWYOm58Vp36DjQu5eYX+IftUag1bgpi3zfyIUAM+AZYMloZ0nFdda0Ks9QtRnvSctD/d4oRx9NxnB7pbOwjVyXsPF8j8cCpBCBX+XzRDvv9EqJkuE+K23dhdhKlEds1KJBQm5auR9iBOR1+ALfzCmKSXl429ZuLkSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/g9HkW4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IHbh4n90; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KE4Cq1478223
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 21:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=51ioZRkWsr8YoDDsIq7CqvS9
	RZMTHGeh6Z7fA8LH+6U=; b=n/g9HkW4D60PuJ2NZSWDYc5hRIKJKU8BpfsglSw1
	tgDVNoy5flTOTKVlT92I2uQLIGcVUu2ceQOuCoueRx6rIxt2Q1eoJ27LvZq42NJA
	CsLnVxmG7WgXa1AdD5pCbmD0AsVUpfVNhuyW8ugquMLtNlIHlaFapc45+Ey6Ms76
	Pou+uFpaFih47E7zYwBfx9KzzuBFtU4rQEWG2qgVdzRq/W44hUCVTIhpTMqdVM+S
	/k6TUo3bPIyriitLltZgudduDaZlT2ADkEIglIEwQAlk6VkEm/UBWVYcQWXqNS88
	Z++6Ff3ySp5Kfn7BE5oLSq/bUjeCr8WYcPG1g8veWZv6qg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hsbf0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 21:37:11 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9692d7bee20so2748874241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783373831; x=1783978631; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=51ioZRkWsr8YoDDsIq7CqvS9RZMTHGeh6Z7fA8LH+6U=;
        b=IHbh4n90u+e4+S0vdeITa0VbGoNHzb4i8pVo21G2nV3vkw26ZBuVv6YpPyu2+lQWOl
         y3do+dGopCTIRt58UG9nISCVS8RzxEia2i80e27nW4Xm9pg/QBOl78jEri0+azBkgnou
         Z6Tv4AxINyhqzNwQR2+8hFejLvEpKiVRKJOlxJzODCL2LUcXvtYF7Psx2C2DsrYWKIc5
         9ac8F7njmW3OdmFbmh6RinmTE2KMJ5cK71onUGZZptBOpQW4DwwciAD72duk5QeXNowz
         b/MuqSZJLy552vYALDEATiNoPeCo9StnEzGaNiSFgVMufDqG4QoZvZhF4EraYeJKuPQF
         toxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783373831; x=1783978631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51ioZRkWsr8YoDDsIq7CqvS9RZMTHGeh6Z7fA8LH+6U=;
        b=hw4gJjbb3FbuuMs/vdIQN69PF8ShJhlDRLKmIYD/ydQEXtyA/H3qqhzSLtNoIKfxo1
         yqiztZDRuS1ApFnu2i8hkQGAW9aBORHfxN2MSSVUkQfdcMx3IRB/r8uM/4prKK4CkWrQ
         XdXndwpHI76YzrBamTAh3YvaALihbDY0LVUokpK4y3pwv4Jd3AtNJhlHHJ5O2vZ5V8Gi
         nKkZI22OuowH7qNGREzP9xa4NEEeEFkRBIehD2J1uovSE0EdF8T3xett6nZC36WrmN7i
         rbyWT5/NQnYV778XO9fSnCPSJ6dspnMhmoRqPC89rCEmpKrMYrMrLSx6ycUHxTAtCe43
         tHDQ==
X-Forwarded-Encrypted: i=1; AHgh+RocZYQwtREuu8HsskltlqKrzIrtHcneBIxdwwLdvr6NEXHdgjVUk6CNMYJhH4LM1IuCQxMAclCVn5SHcqZ0@vger.kernel.org
X-Gm-Message-State: AOJu0YzZJEZpP68DueL5it/6+Z9Kq78dDQVQvBNTZTvs4FqTnZw0IqCk
	nhZlZBqCPGss30cfpTElb+iX+loFdxeJvjpQ0+eZdxh7bt9+Gc0hnOLC/kD4r57zxaiwzGLzeih
	glHzUd1f/DWzk6w7suNpXaoAA/+irbWnY6icjOjoD3DB8cjp50jKhIxkoOQJjrkIyrck6
X-Gm-Gg: AfdE7cmMkD/zpMB+383fGWTJ59zkyMOZJZ5dYDkB8zy4a9AcwAeLrY7pPRYETLmR87O
	vGP92lfofTNwtCWeJkJtzIV5CG8u/3YzN78kAV+r6AGiQwFHCVPvmC5EHeMWxPyZ0rc77EAecMA
	23Zgw7SF52Q8M4UK1YKx3is/kbN1y0FctRqLiuFU/ff4jljCB7kwntz8GVQfU6uyUeDwC6cIr1P
	Z02NSarl2Qoz8vLvW8bBp8ioNFfAmJjb4G5xP9WCmgG8eDYxv9sv2zqhLLYfskC5HNKL+O+kB9N
	L3lIfbY5augF1CwBYfC/lYVNZAnDpxwnAfOVJ/TP5O92RVwdlCjAowD0jrN8vPnzAPxCusYob47
	KfhEMDiS2xWC7V2Ngg0xTyGYatQv8OsdkzREB0SLdtvJJNuETTj8/cFflZCUP8Laip8KatnthfG
	nHwzeHXskixFjedZpyAxeQBbK3
X-Received: by 2002:a05:6102:5e96:b0:726:cd42:d039 with SMTP id ada2fe7eead31-744b7e0bec0mr1289317137.24.1783373831083;
        Mon, 06 Jul 2026 14:37:11 -0700 (PDT)
X-Received: by 2002:a05:6102:5e96:b0:726:cd42:d039 with SMTP id ada2fe7eead31-744b7e0bec0mr1289236137.24.1783373829228;
        Mon, 06 Jul 2026 14:37:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c8c3asm3167623e87.82.2026.07.06.14.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:37:08 -0700 (PDT)
Date: Tue, 7 Jul 2026 00:37:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [PATCH 2/8] drm/msm/a6xx: Rename GBIF_CX_CONFIG to a A6XX-
 variant register
Message-ID: <hahn2b6uu6bwzuext5jkb34zbs55yerrkfpdfqpd4dgzprywcy@wqcw6w4bkjtk>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-2-c9f1354dbd29@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-eliza-gpu-v1-2-c9f1354dbd29@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: tnlk38w6y_fqGbR6sX5O9rHprXTiY-7T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX0AFQYwDNXRJe
 shP7/lsJqYheia7dAlWWDYW2zhM/JyupoGV4iVmAxWiUzu+nfXZVZzXgXJC6yaVI85+jTjUpY8i
 N91V4kG782KDPnveZE6us+41JUz/eBAihNVrjo1j25niFhJ1mQayV6VZtfcg4CEe1VK+rPU/8m7
 aiJwhB2PcnTMs2rYtXt3k968G/IQ9Iv38SL6zQh8/FrigF7SsTvyQVIUnsO0jAVrRKdFmigfyMt
 EJRx11GW+5eUWhGoe0R4lgNzhxE4WXHZwtmDGcPBahQ3qwqO1yTiBDBQyZqJ5qrMXW2lTA50GWI
 dlS/wjX8Mj3EnLcYonO4i7La5CCuVtqtmr3gSMbhyhf5608YA1mF7ejQTmkLvZO3rSTgrlf+sFW
 Xm1RluPpLM+4uBNpHweuE2RFmpuD2o8v10wMBF26lF78pFGy6VYEwKxEFufYvU87bIKZ5HPHwzm
 /T8+v5q8oils1bpPhHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX1DtH1qtBQfU/
 cLYwPX40WPKotPlzxnq6eVY2/MnfVxVmnxhsheo6XgP0D7/U7NxB27M5O5x+0Jfg+GKPlRxW5XF
 t8FiG+r5YwakqntXZgIpvzufCpMKhB8=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4c2007 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=3yiLn2T9MxZ6V1egYJIA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: tnlk38w6y_fqGbR6sX5O9rHprXTiY-7T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060218
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117042-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:puranam.tejaswi@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5289715C2B

On Sun, Jul 05, 2026 at 01:44:17PM +0530, Akhil P Oommen wrote:
> The GBIF_CX_CONFIG register exists on GPUs prior to A8XX (it is used on
> A722, for example), so it should be tagged as an A6XX variant to match
> the register spec. Widen its variant range from "A8XX-" to "A6XX-" in the
> register XML and rename the generated macro accordingly at all existing
> usage sites.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c     | 2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c         | 2 +-
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c         | 2 +-
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

