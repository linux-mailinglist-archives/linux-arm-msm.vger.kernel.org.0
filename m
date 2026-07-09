Return-Path: <linux-arm-msm+bounces-118044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C5m1CJ+5T2pgnQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 17:09:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6883C732A63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 17:09:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fgFK1CrJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kxY1x6Ce;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118044-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118044-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBC3F31E46E2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 14:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDB8387347;
	Thu,  9 Jul 2026 14:54:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5AA384CE1
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 14:54:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608870; cv=none; b=DSbg/Ywp0hbl8pcFqVVyEZZPfJxdgfLAWcglclKLBGmHmva73kOjf4y2aMt90EwCq9N2L/kIqOkVkXcLx0bEK+rDh3au2VZol+Qq4s2AZSt403HtovPajbphtA4khxLNnwavWFp3uE2J7o8Vv1nPoh1UeDbQXMx4IBFSHVhpKzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608870; c=relaxed/simple;
	bh=Iad5UADQt9fXiFcZiRSv6DKnb9zI3RyEtPOMI+t/pn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ActRHpRmloJbkUq9UbZP7CnhoHSn+RxrnnbSORTH+di6xV7bqSs0EAbzsgEPleyXrzS/Vmt3lb9dU46jDVFlpY9/5xTy2BmMe8+nHB9r4V7JazrwZY7GR/Cd+Ili/N06CmMCvxqXh+ntsuQFrMpDBTmLM1wQA8j93jpsS320wqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fgFK1CrJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxY1x6Ce; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669DwHs41919924
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 14:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZMd5SzYa2JtJsuef3gXqhLim
	tjjWD7XXATJ3fVJWKFY=; b=fgFK1CrJsVkn9+lyI6grWkzihN4jSETSO5v1zhyx
	yJs1ZTq+7KHtpwkUTbuaxhcF3PrJU2srnVT/38qhJ9mzZM1mQ4QjpOepB4feKAhb
	qUCPsOaFsIoCJtlfRnch1AnGKK1yM4fPZZ7L0NHLzFKXA8C32Mq4xZlovyMONOpy
	As1q+d7o8m7GZ4QhEASjtxVGnbHUjp59LzbgeSQo4ZsQoFzzQ+geRApF82v6PJQj
	J5c9kaLgTPyqOhu17GRIOLVfHTARtljnj0obrgas9663NRdQSoTqMvFGSqpoDCT6
	DLVVepZvtOFYWaPqh6A4NGKOmJiJpHkHoVfPC2GrQjWg2Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwcuem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 14:54:27 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-744e7c828adso377364137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 07:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783608867; x=1784213667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZMd5SzYa2JtJsuef3gXqhLimtjjWD7XXATJ3fVJWKFY=;
        b=kxY1x6CepZIbeBFdl4SJHiJUMZeBfoqaQenmfM/UvsypgAlwrx4xEJwZl4/f/isXex
         QxxN1KMzu3wjA2EkvGcbEWPKuVyOcNSbrkj2qJiWxJKId/QbE1ybVLe+N7RL+6/jby/6
         UveKO6/uL8RKAzReXCAqFn5ISRDnx31X4vfAu8YHReCHSwTDiGFZiT9VKzVCB79VvywC
         Qxug6kBB7wC2dQUT6Vmovu8oAjjPbFyrsnQlZu5Zj43GZptry2CQfnQpDpsU8x8amPay
         Q4g4c0TCgYgtEasAJyueS1Vj0lpva/PNfpFqE6/LwFNkzTYl4HMXuVHg/eeTcoUviNDb
         U2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783608867; x=1784213667;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZMd5SzYa2JtJsuef3gXqhLimtjjWD7XXATJ3fVJWKFY=;
        b=j6m0JUmwuyXRuBQuggwXYK4ewFiw32HGo+w0ddpIFRGQr8XOjkb7KySQDFlYsxhHfp
         6+m5VXEijMUHqGVn838xrCisNhvyovpTzHPM1XmDXDgtGmI4IIqnnrffd7P1OztMHSb+
         ii4NI/NFfCAEGy3i3SdhLRkZEYpZlJ6AdhrkKfkB3O4cLnccZMPxGr263q8WOku0JFnO
         fdrDey5rpXECiJF5v8iF3YvBmER9W+5bXx5cK5s54XPBFzKPqSTT/0XE1PJXBzajyTLg
         VHw3eK9eJI8WdlJGBa7Jhlsv+GpiGVQf3rewpktpdgZ1sxDODkvQvJ3reBRxtgsW9Plo
         QXoQ==
X-Forwarded-Encrypted: i=1; AHgh+RqiKaJ7/Qs5VdfwiXAz2DHIvBW94De7gZYJErgbKVPj43DsgsxVKku2oV2H0fvaCxtv7GNbB2YeMKggOu3Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8HHeVE3c88i/dJX8DnUw1PpxSCAGhnaOUQed0EozKRtQFXXC8
	8uTOeT7z4ePkDeoPoKhZKLnO3H3/8dCR34pRxRcThnIHWwnfu+qhxJKWP2YRywHpQw/xKJDnUH9
	gnh6cL9JA/tU9xk0LupxW+AP43oP6u098gGQ3L/84UCMkT8dJHYwCMf0a4x1bqPFlZ1F+zwAMu5
	Aa
X-Gm-Gg: AfdE7cmr4W0v9rmWSHEsvlyJXaaCIlCJkx4Zken4M+eEGQnNjxfvBgXUIdqB3gdnNgI
	6O7uWQEwLxsCDqidCYcMnDxeJE8ug6tUyxmnsXWX30mXtEqhdwOTuAuLDurIPQUwj4kTcPUthAq
	QRsTPLpTUFfKjycgaEuM98oXztF3XOsHK/GgYt5oVdAhxDk+v7wsOJUqzOLCh6I7UWu3fEvnpUK
	dl65xjmAeVlH+ZkvXzwHo4hXNWnnMrb8E/ZUr3dCX+QN0l9weilGuDGGJS0wHZE+6BGe7kN+RuZ
	3BFKfe0541L4tvdrkMTGS8k0334yfkhrtXBzTGPOzphV7Mr0m88gfvtc3nSvk8qygkPQCrgYnIe
	kd1WRrEwaVSoimsSjjsvRJqh1kajSNBELs/QtASNq5DHc2vZvIBc5UB0rC9NALhl9elXeLTr5FQ
	3mTISObtQH4JMJ5iLHgGsvIoyz
X-Received: by 2002:a05:6102:5cc1:b0:62f:522f:5b2a with SMTP id ada2fe7eead31-744e03d0408mr4194102137.22.1783608866720;
        Thu, 09 Jul 2026 07:54:26 -0700 (PDT)
X-Received: by 2002:a05:6102:5cc1:b0:62f:522f:5b2a with SMTP id ada2fe7eead31-744e03d0408mr4194057137.22.1783608866193;
        Thu, 09 Jul 2026 07:54:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b017c29961sm500429e87.29.2026.07.09.07.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:54:25 -0700 (PDT)
Date: Thu, 9 Jul 2026 17:54:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
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
Message-ID: <t5gu6ciwmxdb2jghc44gtixdsbedkgy4yzke5sgawjrr2h362u@ahvhh3yfe6lx>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
 <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
 <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE0NyBTYWx0ZWRfX0HfktBe2MH4L
 pcfGd7JeKyJZrMMjr0nm+0PGbEXOKmKvLr60iP5Ak3+FlEsNVJWrWm1vN/cu9Xgr9Zvrd8ueSZ9
 I19bKutUVkcdyhqUaKWZWMS22ZQKoxoxB/soCxOdIod/VgKKhqNXLD5kP5RikmD2m9mj8DghI0p
 cevKws0fYvjP7Bu7D1tYd5aPrs7wypf8jnn3hl+LBN8/IWn3QbpTkCdWmGCLnFg65+JcI+uLnZT
 hG0Y7iDQIxWg8BAfWojyYN5oHbojQxgfqCkjcNr00GCZecd7knw+abWnJ/sTEyPJ+5nR/cLxRGa
 sDKeEBbxWGv/SxqPK5JzZKjT466ivxSR1YJ/bT2K4bpGlikzrL0MsfFGMBASbCzPb+9KCP2AHVW
 CYYhHDBrTxDYXtC3oXS4KJQPmadisS28k+pyN2X1QbinCqmIKZtgcla49P0xhtmrgkZUK4fuVOm
 mXdmAaND6fRGRsx/n5A==
X-Proofpoint-GUID: DpOhmVId9XofGfs6-yGOymX6gAU_isGM
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4fb623 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=9jRdOu3wAAAA:8 a=pGLkceISAAAA:8 a=gTY0VpHTFMgWGwS8g40A:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=ZE6KLimJVUuLrTuGpvhn:22
X-Proofpoint-ORIG-GUID: DpOhmVId9XofGfs6-yGOymX6gAU_isGM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE0NyBTYWx0ZWRfX8JO+1my9DpVp
 igxiIcZMwrvr9Q3fwInar6z4y0HWlkdI41jwkEc/+aDfspG9v4SlSDR2vNeRdipZhSdSKVrjF0o
 jOOf3abNQpNjMzpL557AIgVeYVGFY18=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090147
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
	TAGGED_FROM(0.00)[bounces-118044-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:anna.maniscalco2000@gmail.com,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:annamaniscalco2000@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,kernel.org,arm.com,8bytes.org,poorly.run,linux.dev,somainline.org,ffwll.ch,linux.intel.com,suse.de,lists.linux.dev,vger.kernel.org,lists.infradead.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,ahvhh3yfe6lx:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 6883C732A63

On Thu, Jul 09, 2026 at 07:12:39PM +0530, Akhil P Oommen wrote:
> On 7/7/2026 10:09 PM, Dmitry Baryshkov wrote:
> > On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
> >> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
> >>> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
> >>>> In order to associate the SID used by LPAC to it's own domain and
> >>>> context bank we need a separate node on the DTS.
> >>> Can we use iommu-map instead of adding a new device using the same
> >>> addresses? You provide zero explanations, but it seems like you are
> >>> trying to separate a part of the GPU into a separate device, but it's
> >>> unnecessary.
> >>
> >> What I was trying to say is that we need to map sid0 and sid1 to different
> >> context banks.
> >>
> >> From what I recall, so long as we use the same dt node, the iommu drivert
> >> provides no way of doing this.
> >>
> >> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
> >> and secure.
> >>
> >> The address on the lpac device doesn't really matter. I have very limted
> >> knowledge of DTSs but I think we could just leave it out altogether?
> > 
> > I think, you were poined to the Glymur Iris patches. Another option is
> > the QDA driver being submitted too. Both ot them use iommu-map to
> > describe the same usecase - a set of SIDs which are used by the device
> > but which should not be a part of the defaut set. With it in place you
> > don't need to have separate qcom,lpac devices, no additional properties,
> > etc. 
> > 
> > I'd recommend following the same approach.
> 
> iiuc, the conclusion in this recent thread is to use child nodes for a
> similar case:
> https://lore.kernel.org/all/20260618151745.GD231643@ziepe.ca/

Let me check internally.

> 
> -Akhil
> 
> > 
> >>
> >>>
> >>>> Add the code to look up that node on initialization.
> >>>>
> >>>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> >>>> ---
> >>>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++++++++++++++++++-
> >>>>   drivers/gpu/drm/msm/msm_gpu.h           |  1 +
> >>>>   2 files changed, 21 insertions(+), 1 deletion(-)
> >>>>
> >>
> >> Best regards,
> >> -- 
> >> Anna Maniscalco <anna.maniscalco2000@gmail.com>
> >>
> > 
> 

-- 
With best wishes
Dmitry

