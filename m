Return-Path: <linux-arm-msm+bounces-116911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M6Q6KdLhS2r6bwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:11:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC08713B5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:11:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lw7Z7xvm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RmpSrLay;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116911-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116911-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F26A3129DED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 14:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D134218B6;
	Mon,  6 Jul 2026 14:57:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA762F8E84
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 14:57:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349851; cv=none; b=QY8dIhknfXoSMYIOxVJyViRvcEj41R6NPPbRu18uRNO8zTR+dc0HUkcUxlCuTyLckInqYNMY/1taEYAIETFoS8yKS3GtpXpk7LnZn7uk7DQGY0FtTbjMyReCCmiQbZV+oeD/TWzA0SqdnfzTv41RSym8gCO1yCZf+nnV7C/42Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349851; c=relaxed/simple;
	bh=euY+KmOhlsqbzFJHjgYGwPowl25OoEPkxAZqHFyBFRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkGSceATAlwXcmk3IgrbatxK1SkYA34E/HZECKC5aP4fl45ZvnJYhh/09UQp+1+sDqs4cQbvPxtr7O+RsXdAskwHioQ2+tvvF6kxyaLqvqtYc3MTPyn4so4dNqxwhU2pjDCjkOdg1ubekv/v+x0W+6LxpFmZkq83pbJRZBFsbnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lw7Z7xvm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RmpSrLay; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EEMr2665791
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 14:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hYCsnJxlsCoVEAci2Y2tWdW2
	BwZ2uRLCnXO1hko98pw=; b=lw7Z7xvmkSruIL2Cbny55zDYJFedy2/3xwd50Z5j
	L9GVNUAAUXgvKpTtHKCzGZ2z6mQbVIVdMycWmLXXoy4PX3/mPfdI4dOQcSrboFLu
	CSDXJdlrzr8N6R0OSwp64XRjG3TsvlhXIo9A9TnwE/xPhhLC/4NP+q7PB5713PL0
	4vlh+NlzOYN48uRJK6ogNfxfsKVIvQ4fHbxsWVfeaxlrJT5LQr0BT0nE/wldH8sl
	Ahc9qq3hv2RZLemwEYWfHqlA/MqimVnqJljhJUcmiXTMUSScyr5aWROWsY7I7aRm
	O+lo05VSAJ+nZjUlCWJC3kKv0srswoDukX8rmZpB3hXr0Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs9sbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:57:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e820609d9so230824685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783349848; x=1783954648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hYCsnJxlsCoVEAci2Y2tWdW2BwZ2uRLCnXO1hko98pw=;
        b=RmpSrLayzqWH1ecxK41+E3pHq7/0Hr/sFiGaHrhoZ/J1v1nqHLo5G47eZJfMCnQjOQ
         qleE5jG/TbAOlq2vmgFWjvsoprCgnOp8NskbPT+WQoUIsD+G4kyw9uDoMnk0yDx6Gm6J
         fWsSdxqbOFINAKUdVCXeKVzluwJG+HfU9+eSlSK8oN9eaRT7OuvGR6nXzqnXAE2MT0z5
         j2oF7QbBwA+NReMH4puvwPEVLgwGm0tvisfeZngpF0QDKJpUZM7+KOrIfbWnCXHFoCe7
         wVUn/OtyvH8soAfxzGkncmf8ZXXnxlNqazpzFVzQFu+e05J8eatoisLW1atkHLbHik7k
         cFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783349848; x=1783954648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYCsnJxlsCoVEAci2Y2tWdW2BwZ2uRLCnXO1hko98pw=;
        b=BsLGB9IR96UbxOnADVe4qVbeUk//81DCfiFhKNq4uzH+S5P31Gygqf6LPiXXZoUHtk
         grriGgNWNtf+OPHQxLjvk9vpWo8eIDyCR1nZ+JXDwCCEWpkTjbN8UxSwMe0G0xS3txES
         icBaLenipEXYnukQcacpTe6ChqOMvLfMGoohoLYp9AcpKH6M0Em0s7vexL+kM5BqAlGr
         r/Ma2Lav+S/UqRn3DSEAUM/eaIpF0lC7NTRYjuS23DAW9j6Ovi5JwQL2l6/ebFgI3Mew
         DY5FOAdWeV6chOybXz4dU+u5tcfASMsH0LnQF5Z0HM+EGtYTdbPUaE66uKBwlfFyhfEQ
         neow==
X-Forwarded-Encrypted: i=1; AHgh+RokcwxBTLAwoqSmvFObWV+aufv54QKlLVBKjecneKNHKXERTNGe29rWk8VnTfjKC1DStp6aFJ2sC5jZANKa@vger.kernel.org
X-Gm-Message-State: AOJu0YwG2uBV25DG+sFzMyZd1UmzbuQMurotZgsmQm0ZAQYmeLByM+HG
	8Ji4uxjUKnY1oM0JrjOcR879KUV9L9evg6DjAQ5ZUMdxeSYHLkQWiIiYwk4Dc6c+J0Jdl1tvSeK
	7ymmtH+6uSHTU41aGKYdJZHq2f11e+LJUyab3GEhky/26cbnKYmOMkRhDaXDjE7miR+H3
X-Gm-Gg: AfdE7cnxGtVFaNsGCqlFVgthgEp9F3uSWczlo3P4afulNqY/EWx8JJz/SqV5ZjDHUX0
	prgU/GEEqtVH0QLx7uk6mgsicfPNKYAi5x1/nNrevvAAItp/WRoesl738iQ7jVwoLQMKa2k5LYg
	GnT8RXa3gSM6DZA0DRhdSA6jJhit2s4p4LMrgkWAFYaOLfj2XYSfPihkV3IHaCtGkG3E0jr37VV
	iaq1tAcXNVq/Q702wrdHVoMyEXiRmyNIDuOE6RJztFUn+RbOnw8kyhmg8R9GshoaRYyqxR2iZxX
	13fSmUATRxVGkEy2GXx5IwZSgQsmLGjrpJLP9qTgpMM6ZVfpy3VTouofXzWRZNHPP0YbxHAKdFo
	ZdqZ35L8XVZjCHJHvwHORi0+M4+bLWOrpDdBNdTbFlRw+JOmrsx9mpIBn7YZV8yjNCNCMti29BO
	X2W4CZXjHaw9s+YaN1skO3BJqQ
X-Received: by 2002:a05:620a:4101:b0:92e:8256:8226 with SMTP id af79cd13be357-92ebb56a788mr122718385a.44.1783349848305;
        Mon, 06 Jul 2026 07:57:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4101:b0:92e:8256:8226 with SMTP id af79cd13be357-92ebb56a788mr122711185a.44.1783349847690;
        Mon, 06 Jul 2026 07:57:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad35edfsm23456681fa.13.2026.07.06.07.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:57:25 -0700 (PDT)
Date: Mon, 6 Jul 2026 17:57:23 +0300
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
Subject: Re: [RFC PATCH 00/13] Enable LPAC on a7xx series GPUs
Message-ID: <mn7dmfbyt2hnvlb7u2vnxurqef3w45rrjanhkd5ei65sgasfnl@l73s4c6yqxbe>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
X-Proofpoint-ORIG-GUID: sW6eh9C29cW20B1VvkrHhPHwPfPcgVrv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE1MiBTYWx0ZWRfX0ucq3CBPPR/m
 j0B/x6BNnq6XlXZ9GBcIs2HM6JkKVNN1wHMwAK9g2VBaPUFkgdK9QcoMF3ysk5Ds8Yln9Mk2e1x
 rbueociGwE+p1zbScQBJU99n09rWrTfqCmMLp+KrxcRLL3SU3WEhUlRl27/RlIkWTFHb+ucxm1t
 cWnWKB0V0wSKOVdbLriD6xODmXUBXq82m1f0eqtSNV76r3hAvgRLnxX3Pqm35+KwMZHGh/wFd1G
 UyASNqi8p6z/n2GWrYqCRsFalm+ovRbgIb8t8U4YGYRIi0d637SPSSeSvJUvUp7dlQBvd3CuUw4
 QNWGJRkOICJpWNN5ZmZ2hIjBw6SCzYxogFURuFNEezlOB2zvVn6RPMAd/J2UJ9tDMtwH223PyWp
 pNdzcIPFF7b+sCy+8G93FC/pCIUR8fO6qVCfMfKhmVwTGLt0OSvq4wH8D7gx5hQMNziZ9M97OIU
 doRp02JKdoC63tYqafA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE1MiBTYWx0ZWRfX1yMrUkgEczct
 JEZ7TPvetZXh0mcKoCvNzoX1IDjHUMsn/6N9j8ogZisvyNtBoJL80t36B86zebrpg+8uf4QFdXL
 Vdy27SGtzGs0GVBS4PyA2XWjLF3INAU=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4bc258 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=5ytNcvzt7bZj-gOGiacA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: sW6eh9C29cW20B1VvkrHhPHwPfPcgVrv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060152
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116911-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,l73s4c6yqxbe:mid];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DFC08713B5A

On Sun, Jul 05, 2026 at 09:13:34PM +0200, Anna Maniscalco wrote:
> This series enables LPAC on a7xx GPUs

What is LPAC? Please explain (or at least expand it once) it here and in
the first commit goes to each subsystem

> 
> Currently hangcheck and recovery are broken as the patches to make them
> work depend on https://lore.kernel.org/linux-arm-msm/20250911-preemption_aware_hangcheck-v1-0-974819876819@gmail.com/
> 
> The series also depends on https://lore.kernel.org/linux-arm-msm/177919116291.814652.1720687887970998122.b4-ty@kernel.org/
> to work correctly.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>

-- 
With best wishes
Dmitry

