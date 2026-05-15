Return-Path: <linux-arm-msm+bounces-107928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mChhGsckB2oEsQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:51:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD89D550C57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:51:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BB0D3003EB7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA8F3B19D2;
	Fri, 15 May 2026 13:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SP5Bk6Z8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V7OgpMVW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6689E3B0ADB
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 13:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852340; cv=none; b=Sh10hlUJj1nZYaunZb0ZaPKHXYGS3GraMchPIuW3FW6dcsaMb24/XFrHsqxccmAEbr9WNUVu1pH0sNJHQVwG6V/TlyOPu8vxLWI63Csth9uUiKJfBpCtjLAhLId9mhkFQeQneLXGF1LG/+XaEHl0+7WKtKSUmW0VnmMK9pijLAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852340; c=relaxed/simple;
	bh=d/efI9cEgG4+ZMouOrHorHjY5YhZUxFtMuvgfc626Yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bb5HrdtBXJTq38zdyuuTOPiLczfFvBXDpMb6CpzlM4t6YMaoMVYphKzt+4LHLzpRArqP2UX++zDiuGavGE6TLXCJakNQEAg7bWwaZPm8iP93F1uVtV+Cb/9IV2S49/92NDfILsIkC2pPXvivAdeOjynDuB3xr5nxqEKZTzOEVf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SP5Bk6Z8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7OgpMVW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB0idl4008413
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 13:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CAkKFuSRE55Cl5r7tDqtTtvB
	Pf0yPjzoWF8jVKJRgeQ=; b=SP5Bk6Z8bALAkEQiEZFToYWkRxNmpw1nLeYGS5fD
	cZSdYYeoxW2C9g7vOQuN5apw30OjAQL/KjNHr6wipA3bG+6v8XqDokDF2AF15rXb
	VXlekJgVdZovcpm9iyKSEJEYikMwRR7kG3jeG++29O/oEnCCDdc3IQ/ctUmTB+9Q
	is9FpnjbXas8iU9vZ/y5mfCVCKWWpv5b1v4jk8+gO4LaXOJClZesBqWOfIKCEqPP
	uS0g/z0zHUiOmbzDPnlhgwyZ49OHO2VfXmoBJI2NjBRLPCTS8ZkhgfZnTJy6AvjD
	NBlILZWIKj9OI9w78O3/wIWu2oz2h8iz6v4f6QO/I/P0pQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1sufer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 13:38:58 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95fc346e02dso1293668241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 06:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778852338; x=1779457138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CAkKFuSRE55Cl5r7tDqtTtvBPf0yPjzoWF8jVKJRgeQ=;
        b=V7OgpMVWy/S4ryiPmzt+wofisVyPT9xtVl1IGNjYNgJomyzBGr+oI583ra/tPM97by
         9ntb/dBpOHpAg0l5qoeCruqRkgvNhdwWi01/5KkgZzIqNBQ/LQ7zbQCC0c6E3IaS/1xH
         2Q6qZ8/OtRZcdOr++T7q55bEA2kqmnynGqgoiZ0rQC7COKp1fXdIkRqEIe7VDgxN9Y7w
         X7ivGyKXr9xpGAuYgYk+NMXqlQa60/u+JJOREFxPXjmBLLsUm7QmzPMPYs4GZMAOTbNg
         NqBGxtQapk7Na4nF0PjnUmtk1s2VQRbDVXqyZrT37M4540VjVgMhKLKE30hifsyysvjv
         zsmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778852338; x=1779457138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAkKFuSRE55Cl5r7tDqtTtvBPf0yPjzoWF8jVKJRgeQ=;
        b=okZJtlYaXtpfy/4pQ8CCbSFHU+YMljNpLfyPY2knLEf97vP8TZ1cpdBV1yzeGIq9y2
         1iOLJek8HNf42y2RzMeb3tQa3NqD/rhe887J13wrAD7+aQBkY+Zl8oyo1RGZKPWHNZNW
         AKuJZCBH7dGtefi6k3H3v3Kf45hl19nR0Pb5dd96ex8eFUypg1G5crbyNsqBgQzzkbLP
         dSKcvEFrT0zYyZQQr7imozL69OXB/ZVKS00Mpt/UZHXKkrFIUjOrUifcMvb42AuTXO55
         pkirW/KmRem1m7jm+yR+m/s7SNAa5ZinMv7/YP7pMJ0Vm+Dw1j6ZH/vbqeAfJUgg79qd
         QDRg==
X-Forwarded-Encrypted: i=1; AFNElJ/yi8YwZGu89hMgK8vvdaCz0a7C7CU0JDbt2fCcebs5he14mHZiF4X0Mp4fyYy30TrP3t6Mx31XDguvuRL1@vger.kernel.org
X-Gm-Message-State: AOJu0YyzecKCKAFwMtEGSLpd0dYycz4atfkQI2FMLEjuAq43HACB7ROb
	WuJx4mrxBvbGMJwRHSWH8bUZ0zYVVYHMslGplBNr+wMLuNTKoTeAykAzSawpLMMLFQBGo+93Wfl
	F5nBPdQfWe8/sKZIGbjfng4CGKti/oSVLMEUDdRCn1wyUOYA7r+F6VEM2x+2kvhZkrUHs
X-Gm-Gg: Acq92OGZRdd9eumCyUmBGBLDD6tDLPWnJ0PiA1yQou1UnViMv+JLNYtJPWRUtGSeihu
	rOQkb190yCgLUrEOzQBQlzl/t0Tx8XHRVTYcmlH0EkfMqeafRcQNITHtzgjRthmO6qu1HDMUy4D
	R0AtOjKQ6eZdxC+WmVeDnTnRPlTt7uayQiAtliTez/TztjfEIk8wnwp+IpsgYjFmKHLsbFezUa9
	5cXFOBsM2bG7YPHh3g97H2uxZHNO80MQ6RqypOl4qxXGtf8Q22j9e/dozrdPoArFYZ0/iJ/pcZB
	PSrB2eGzGht5/8t8nv+PUjW0gWfwcRCE+Zuwxi5bgpOoIrvOOMqBPn9VntZks/sdbgWY/OnTTDN
	zEhz/iDam88YW9A4F2z1to5AdT5vfmgrxL1FOBhzcGuD7lCycmKjeQzgey6Kn4nfPrWVcpZQ6Kq
	t94QSlCs1tbm2uXrtYEDMRt7thmYsaqIMFEVQ=
X-Received: by 2002:a05:6102:8029:b0:610:db51:6f3d with SMTP id ada2fe7eead31-63a3d42f341mr2353964137.12.1778852337677;
        Fri, 15 May 2026 06:38:57 -0700 (PDT)
X-Received: by 2002:a05:6102:8029:b0:610:db51:6f3d with SMTP id ada2fe7eead31-63a3d42f341mr2353924137.12.1778852337273;
        Fri, 15 May 2026 06:38:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a630sm1337598e87.22.2026.05.15.06.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 06:38:56 -0700 (PDT)
Date: Fri, 15 May 2026 16:38:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez-ortiz@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com, quic_chennak@quicinc.com
Subject: Re: [PATCH v5 4/5] misc: fastrpc: Allocate entire reserved memory
 for Audio PD in probe
Message-ID: <v3qkvvqlggrk7thn57ff4tlbilz26nt3nlma6deixlalq74i2k@nbxbqyppzwte>
References: <20260515124217.20723-1-jianping.li@oss.qualcomm.com>
 <20260515124217.20723-5-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515124217.20723-5-jianping.li@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: sMj2-cdpaVcinrZ8N4Cu-OzJOsI7bCXz
X-Proofpoint-GUID: sMj2-cdpaVcinrZ8N4Cu-OzJOsI7bCXz
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a0721f2 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=qAkFtAADdWEuSrs4xykA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEzNyBTYWx0ZWRfX6q/DI8gnVzkC
 7uSiF54R5KihCAFN+I/SkIu6ZfVqnReU5SjUhaDsy/0ihT5LKwSahlbZ+4ajzGPMyEEsCCKfE6o
 x2Jz4Zu0Tqn/1ufmj2CO+6Iu7zbWmzgH2zYsoGyIG1eo//pN7+l5gQWMH0TyjHLjwMCOaehgyV6
 2GHvdNO7hAz8WFrK/I57Tah8TfdJxziZ0ki/HO1gx30aG/7VN1BZhwPnhKLpdDcENg/vxkwVI4g
 cZ3t9UHle7OH24fIjY8byeNMGwDLEBTmojVg7lzLxtTooj9254vUHDUx0s/jHlhob1oRbKO9OYW
 6qc6EnUOtIOut625iUnPTze9hN7a/jzNc5QUtO90IKL+NC76MSAXYewIeuWOtkCsoG/5Hksm/DA
 LgiuDxADXfPxp5IYK32C1r2ken9iwV205ocp8bROy0do/mLW8Wt/zYB/lujQbbduXHXy8B/UkUj
 kp1Cr9q2GFa0r1dFSMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150137
X-Rspamd-Queue-Id: AD89D550C57
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107928-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 08:42:16PM +0800, Jianping Li wrote:
> Allocating and freeing Audio PD memory from userspace is unsafe because
> the kernel cannot reliably determine when the DSP has finished using the
> memory. Userspace may free buffers while they are still in use by the DSP,
> and remote free requests cannot be safely trusted.
> 
> Allocate the entire Audio PD reserved-memory region upfront during rpmsg
> probe and tie its lifetime to the rpmsg channel. This avoids userspace-
> controlled alloc/free and ensures memory is reclaimed only when the DSP
> shuts down.

So, is this a bugfix or not? Is it possible to make the kernel misbehave
without this patch being applied?

> 
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 107 +++++++++++++++++++----------------------
>  1 file changed, 49 insertions(+), 58 deletions(-)
> 

-- 
With best wishes
Dmitry

