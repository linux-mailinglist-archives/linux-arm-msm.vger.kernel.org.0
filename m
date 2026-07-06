Return-Path: <linux-arm-msm+bounces-116929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OjyWM3zHS2p8aAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:19:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 656467127B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:19:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AN2GHhtm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dct0FyGm;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116929-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116929-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F12C83284741
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 15:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDADC38C40B;
	Mon,  6 Jul 2026 15:04:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D781385D6B
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 15:04:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350291; cv=none; b=sFKEHPtjU7TJtNo3iradqq+xUov4SBHil4xXVuPRgpGWGYPWIQ5GGKri/cMFr+ixuyLpuCarvI7I/6xyDnScIlUa+VqrytiYvgVd8R5UVouRUpMFmLAzI0KuSCmG7JC6xxxjy1F/pO93cHBX2NzVJFBM2+KDFa2w8lE/4uqD7o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350291; c=relaxed/simple;
	bh=X04LUYsxaMNzhkdqZvMTj/P9CJGwCl0lEAN/gR2A8r0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ezb3RbEJT9cJ5erJNz/Fo2/w5NKGtEEFvdTs3snZiYTETgHKGAHJKT/f3lJLzFMAeWgNqRdmY1QAGaSE1W907sp4ktp2naH9lBUlTU2who/GdsCl/lxHJp0Cf3fir0mU7SFsBpjwft3UK8mF/pU4KHq2++afOFfkJB5hXBACaJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AN2GHhtm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dct0FyGm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EE0YD835327
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 15:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ca2td9+EyVlsweraoMntmzjY
	hSdPbwsqF8kFzfiyaX4=; b=AN2GHhtmMMxBmwhxImr+fE8YcEtR/M0eVlKUqV66
	oveiQyg3nTu2wZ76otqvpdNWss7noUClU42QGos4EFu7VQ45pPxoEzw+nEbb7gtZ
	ucCyHSsB+Dwx9kIiLWf7SSS9Xn03PlC1Sr3JRro1hzjF/5fC8BR/fXRDI/lFznfm
	an8HJClriUnfgVKmtNWH6tbqL9ARkTzeCVTDiXnHojqMVfDGGz27/RYhPKy1jpD/
	uu/iPvQ/cN+PywxEzBuQG3qJEgH3zcpQ2vRLikbfVNLFUMjjglMMnA0Tkgov8fOi
	qX9PpDojdZEesiY4S09lTIJs6Opw01D8MlDxo05HdA/6EQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgsfx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 15:04:49 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bdda66a906so4458354e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783350288; x=1783955088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ca2td9+EyVlsweraoMntmzjYhSdPbwsqF8kFzfiyaX4=;
        b=dct0FyGmp1jShB5yxTpWZ1CKzwRcY2WUTxP9rpEsObuz3552oczFyvyj7f1ZCMs8IL
         j160uBszDeA1tAVn/LECrnGsz59mKQnCOZS76kbHEuNdls248jC4RwUs3EmfsoHDy8/7
         5vih5tCUqmaW7XKF6+s82gYDGIig33SXztw5DR6qkdzKxZ9zc0BaaIxVrZk/ogMYrPXG
         bN1A4iG0iPdHiUA8Zckoz3alJiLVspqxU2fW+lOYAe+P4FQJPQg1nrp6kK4Imt6zfBT+
         gzUeHyWqD77cgOuRhAStDXbRyNMmayknqTlIPEbUTEHrbv0itoC32RCvXJ0jfaMEb2F7
         N8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350288; x=1783955088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ca2td9+EyVlsweraoMntmzjYhSdPbwsqF8kFzfiyaX4=;
        b=Jvgh3EFTNzE2TCLtWWYzZ3MRn5OLJ089SMGolz05olAvwyPF29u4+8WuxS6ub6i8Vm
         JlJipD8zmvKn/mMvOzdS/K0rcfY0YPNJURXYEToKENtONmymcXHvThEsgLr5u9AYQ2fo
         ZbvyRKyfQdtfyIZ8OVPYDba6kB0WpKG3si/lsX1CCxIrb447gpeKdqiuQCLwoz69s8nE
         I95/+u+jW9p0ECgUUEjHkJToPnnoCqBP0HlMdh3F/aD/NkaDFZjJqQ3oNfyoc7vwD7DH
         1FzISIF7F1J9On4ahlKqSw0ipOBYalxED4/IxX4E62H+bJeaObU8uBaxFYfnJjRHLv4D
         R8ig==
X-Forwarded-Encrypted: i=1; AHgh+Rp5t6eCmGeuOuFm9jJ4DosOF//XQ+XvB2jn4PwmXpKK8pjPDLR0lRZRAZh+arK2AWBf5v8G4+Eq0oCcAti9@vger.kernel.org
X-Gm-Message-State: AOJu0YyWYuK4TgaONsRjQiFUHe7A+75Otwrub5d0qIc0x5arg+jMtQn4
	P79JwkvNTHVRuYYMLRaTBgr6TBSY4SrbMdWw5vrL8WHQpcVDoWhGFnwlwy9Zs4npRjXntAHoPPv
	0F9ihRPoQ/YBgVPhpH+nDm8dZPFuIgDNKmBh1ZIJyvdt/pDgGShbPQYzMW623O2YQofy4
X-Gm-Gg: AfdE7cmZyhPmo9Xt4SZzkDx7Ytg1f4FfpB6ILzpsSGtso0/JFz3IYytURH2iNqhPeRc
	q5Czu/1HSly9SFCUnkBmoC9B8tc7XslTIGmkkQTBqLYul9RXrR3WWQpt9FgnMhcOURuPGXSiiIQ
	YyQKp16FW1NI2DJX0s7GA0Rvu9xpC0mcMB1aGQSMS1PeLxfgvoyxKXKQicCDv/JhIL3IGBFdOoK
	kVZBtuVKj+/22DAUyYLru6lKVEpbVJV4rP3jHsjiLRbR7drP6M7IF3JeDgwH223fVwakTXEZ5sa
	vBA8QFxZhEN9DpW4tpnKFdpNABEE4M/FkHbsT9rHJLucDzr0Gk0mnCJ05PMt586ZRkpcpS52Dzb
	ZZx9xWtT/BdHit1V3h8DL1AneP1QN888F2rr0Aqs9RvBEdRGP6OMO+jGimbFTY57ELryNLdKQES
	626aOKnZw8R+/MN/xZ6QlbLbCK
X-Received: by 2002:a05:6122:c89:b0:59e:f727:4bb4 with SMTP id 71dfb90a1353d-5be90771737mr579907e0c.1.1783350288317;
        Mon, 06 Jul 2026 08:04:48 -0700 (PDT)
X-Received: by 2002:a05:6122:c89:b0:59e:f727:4bb4 with SMTP id 71dfb90a1353d-5be90771737mr579889e0c.1.1783350287799;
        Mon, 06 Jul 2026 08:04:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c5e58bee3sm2046451fa.8.2026.07.06.08.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:04:46 -0700 (PDT)
Date: Mon, 6 Jul 2026 18:04:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
Message-ID: <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
X-Proofpoint-GUID: LGWzDtH1blltWaWaA_RBw5W5KtOUTyo1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE1MyBTYWx0ZWRfX/wOX/4FZrfC9
 8usjGVG3sU/PDO2egC0eEgieSp0Br1sOMa42hdS9et4CQw3EYIMEQPHiVJbfUihYyHN8rwdEKsA
 aDKwg8PJyk+RuCO/leEzQ+lB5Tdq65FRTnbfrS8UWQLWYuPpTuQnjzcTYsGsCMVomphX/H0GoNG
 7gZ8SFs72b8OMcxbA45wTSHqhJ898FrALgTgYNVCml1XRDNqq5e6Wtjbn4qqyvZt1jxQDIwYjgy
 LVUquIDF1AEzuXqcsdF/ym0ygnzKh7ukE43Ox7HqMdTSdWcNbQGD0eKiuLoWGEvP++yYS5tGcRz
 FV/GuN57RuiI6gIe/B3MK+41JYzNGdX8HNbSmFeLjgq3fnSW3GTSe34XiMsmZWTn5R5ot1mlbEd
 zM2PCtXA1akoL/y46CBf333MZorfZMOUhaqVthfz+zOB9w8fbNuE2wK963vxIbcoXwuEFjr2jCM
 XqWij7Jlw4dVBa1eMhQ==
X-Proofpoint-ORIG-GUID: LGWzDtH1blltWaWaA_RBw5W5KtOUTyo1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE1MyBTYWx0ZWRfXw0UhIzuJ4SeY
 QcIG5SCXdPvaLXBwiI9R0qCF4CYqrrliCBQGFzl36QiNZs17uPvXHo/74mLh+TTAutBcZkijXg/
 58pUkffC1JCjr5KGMZ77iVTvdUQqO1c=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4bc411 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=lS1fCJvthqzCmkgEd28A:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060153
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116929-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,3syofuxzsjrc:mid,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:anna.maniscalco2000@gmail.com,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:annamaniscalco2000@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,arm.com,8bytes.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,lists.linux.dev,vger.kernel.org,lists.infradead.org,lists.freedesktop.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 656467127B1

On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
> In order to associate the SID used by LPAC to it's own domain and
> context bank we need a separate node on the DTS.

Can we use iommu-map instead of adding a new device using the same
addresses? You provide zero explanations, but it seems like you are
trying to separate a part of the GPU into a separate device, but it's
unnecessary.

> 
> Add the code to look up that node on initialization.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++++++++++++++++++-
>  drivers/gpu/drm/msm/msm_gpu.h           |  1 +
>  2 files changed, 21 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

