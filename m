Return-Path: <linux-arm-msm+bounces-118545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZeWyEKRtU2pJawMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 12:34:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FBE744623
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 12:34:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ieN8kKDA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PaTEUKMW;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118545-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118545-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 931F43010C01
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 10:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D429D374A15;
	Sun, 12 Jul 2026 10:33:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C3A319851
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 10:33:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783852426; cv=none; b=js+XFET3EtKtfOdDrbkcGLqgJA4Wk8UjGFgw2BFSfNGNay+ZAl9zJQs8pDVtZ4QQhMeEr2mnsdB57/jAJy/A4H/PU3eDwdNw/vSZ/eI2u5XCCIgr/3Lahkz7ta3pOOje8qCrOmTot8HHBw4FTPr8l7Zb9+bP4+sz3IGa/r244qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783852426; c=relaxed/simple;
	bh=4X1t/6iXLJsmolRer51FXgT7Lw6oij9gmPtAQ2piv4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+DSInguc19yz2Tdu2E7kUcAPmYqRt4trfnVtFzBSNIt6AmufJlhmN3boAn9Jm9Gn7c+EeToQWFQHim38hSlmLYuYqX7d1ZeG61Mh9Xkr9T6eU5RAvnpzoe4ZXmfWZdQA6UGAYiXyZSSnrUyXwcna9f3y48dhdPZMBurZmpVNR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ieN8kKDA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PaTEUKMW; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66C7SE9w1901592
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 10:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EI2RsEK1gpFn9CEteaurDm8TVhMNSv4mxr8JM1MrVME=; b=ieN8kKDAR8qhHWCJ
	ltUmC6xm/kWtJ1ABS4QVcmrK20Y7oDjtppJUJ8Y3PsQtCVN5BKO9CrQsQavv0lbj
	GBs5OPTCwpSOyBdyeULr6+L03ixDLrpYZkxvlvAJ6i06MsJrMf4Ldmt0KLLCy5l4
	cUT1qg0UTX2BUCEZ/Lpna7op91HeuZO/52jon6DZu4hKllP2DVBty6zFnGG1i+Nr
	Aq39PqjDlyJ/T1O00tdpTrMg7e7SkZRQtsasIgDBAbrZ7sEcMAC20mfGZIcobF+j
	epZgo4d+ZJ+Op+MMdY1UMny7ea6yFKyzLMyjFAVpamFIOHc29dkH5fuzq2aVSKLc
	vr6nOQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe912mhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 10:33:44 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737d352d3b0so1992404137.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 03:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783852424; x=1784457224; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EI2RsEK1gpFn9CEteaurDm8TVhMNSv4mxr8JM1MrVME=;
        b=PaTEUKMWKE5hSldWnGhi7nZmdIuTux3HftUQupxXZ72qZFriLAMeDP92whh9k3zeCq
         4E5qEkG+q7cgtVehyQx66/9NAK674Ra76iNnSt1J/+a8/p4RSWIVjZpNMZiD6VWXV6RY
         GrWksGZy44fNe1oibVCAc5cxp44SEzRX/khozxS3SbeveiJQWeqzeG8p0cJFGW5tLnHl
         zoxas35hJr5U+K6MM64bP5HQ3HqxpS6pMz9ZRsj7Sv27kWstOSCTTMGDOhbZ2Y1BMj9B
         ZEXb+NQ8j0kRrwyCFBem67FxVEGAPTxDyEBn25jtC8YvG+VF9a8Dc3ShDrkV3qiMWIQY
         ozog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783852424; x=1784457224;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EI2RsEK1gpFn9CEteaurDm8TVhMNSv4mxr8JM1MrVME=;
        b=P0DvBgeNnn3fmZaXMFWmVlrvQ34HaMeNRBAfAbJpR7eP+8pcp3DEa1wwdtFQtiLBiU
         kdo6NAstZcSJ8ZD5Vfp65oSwo+1mT0ulxvOzeUQXFMKAe2nPlLoCq4rXfvanB2reigUs
         vnqUAn2pFaS7FV8PlHhH8MGvGdQylzYKxjLyC93146GpBtnCZtC53Q1F9HgajECZrwyM
         jfgmj1xl7ZcnM8GcB18p20odfXIW8gsx413NgUiMEjE0c2ueGlLhZ6MweWfviKC8+eSW
         4mfW9wgB4w3bAUGYv4xq1t8aJuXtSrAE5gMVo2o1Dyllcqshxo3Lf1Yx8PkSqWipdof9
         kd1w==
X-Forwarded-Encrypted: i=1; AHgh+Rob4KlGS8Pi2Kq0qkTRX8qAt3ExOl5Tj5rwedTpRxITyOzp2W/C3F4IBHsxrSmrM5H+Tt+bt1z4pfTdthKv@vger.kernel.org
X-Gm-Message-State: AOJu0YxM+geuBTv+8xzqwPtBLFHwecDtyizlQCPEe+a9ucm73KTtbY/y
	+MVsYfb+gejE0Bk6I9xV3LG7sA7LF1iP0apMKuzWZLNbgZHWQFWkjc3+/AkIfBJdkro9CpHppcB
	u49vCvurXiBEge1pYZbs/EwSZHOmSePIhvOjTUErHID42UPkQ2L6oRjNBhiNSwGz7hao5
X-Gm-Gg: AfdE7cmkuioUmXkexRnr6AOc5cNO/y/9p/sjcYl6x5P6EsgPt9IQlc2RZtSWKWX0uj3
	h6nrwu1MSwSuDq3mdxVIrC+sZM9rqSynb8wlf6fd/QbQ7iImkw/9UuaAhhp3W2wKZCx6EP6Xg9o
	4UVvPvBcoA/yBpYuG/2Rsb01sCeVrSRjnnbDKa/Gvw8SfjPJnCjeVtfQHsyRguKuzJWBrHSxzxz
	9sQ7lVe+BewgK4htXi9987FhCpRlrv5/oTYw4uXIkC48n1W6AvzPhR7mo8PGgnPglYKZd/cMdiJ
	eEe/OIcCh74EvQ/6+MNMjv5bMNCfIXH3AM83WSEpWYajioSif7FYjjKcJlxeWZE0UDxFOp9jf9y
	SSmVNVebUHr5bEa6QZ4c7R5tO4rySbzKTNFv4Ux80rQaYxWNxg+3Cqq5WS9e7n6vNbRXg1UmDWT
	IQiXlNBk12F3So5q8ecG6gv1tW
X-Received: by 2002:a05:6102:5e8f:b0:740:127:c81b with SMTP id ada2fe7eead31-74533bee3eemr3749079137.7.1783852423483;
        Sun, 12 Jul 2026 03:33:43 -0700 (PDT)
X-Received: by 2002:a05:6102:5e8f:b0:740:127:c81b with SMTP id ada2fe7eead31-74533bee3eemr3749068137.7.1783852423033;
        Sun, 12 Jul 2026 03:33:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b9fb1csm18390071fa.34.2026.07.12.03.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:33:40 -0700 (PDT)
Date: Sun, 12 Jul 2026 13:33:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/5] drm/bridge_connector: preserve connector status for
 IRQ-only HPD events
Message-ID: <famoeog5snpvj24b6izwox2gy74ywnwmybflfv2tvr4hjuix5q@cbtce5s7k7sv>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-2-646a10256233@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260629-msm-dp-msttypec-v1-2-646a10256233@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a536d88 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=1N1HUszlP5lRL62vBQQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDExMCBTYWx0ZWRfXy/YpL0QENoDk
 J/O6oTTUxrnoSOyczviPdWEXy+PZ6RQHfsOwY6PYMUmrwcg2cTViF4VNxL8w6qSfvb+LMOVA9EP
 PUPzjzG19Y7ZJKB6JhUv6ULQP/4SUEs=
X-Proofpoint-GUID: fED9ebdbwWaXI5GaqJZPmIlGh5cQc-o_
X-Proofpoint-ORIG-GUID: fED9ebdbwWaXI5GaqJZPmIlGh5cQc-o_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDExMCBTYWx0ZWRfXxyN4DnGK6933
 PpeZT9fy3LbeblJzOi3hzVLK/BvkyNKzsXC2ArQZcSGZgkaLScv/k5dZ/VvwMtsGzKrkCGPne8X
 zJ4d/0QwOCJtvp0Fw2j2dG9Apu0mnp7Dk9QYkIguKBlf/2/XN+rhrQ84Dw3jtlnDAFlwDbSCWGI
 vXa0eBciWpl7RH/Q0KeTgKMDHDxxtY6bZtNYijv7pH7TiFRTgpF/gmxvoykB7UIRsw9PbKz/j/n
 /rfaOXRG9rvO43NW7YbrP0bcUNlA6fDCbWsGzWkbY7e9yFcekktlG10jgsnQup3itCLaRSGKPK0
 1WEWvgCl4Z/kRV7KZeWdwrTAm5DYBQ5kRLonqZdNpzUgVO3pNTbPnu6Douv/iUytZmkBda6gq/2
 d4HWHGoFxMh+qeyh51MnKlUOWIzg1oDI9LgJYbGVumsOHSS/QC3YRK/bgNLikYT7YTUh2746uJ7
 EtVtvlifWTYiFiWEdoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120110
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
	TAGGED_FROM(0.00)[bounces-118545-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:tomi.valkeinen@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:jernejskrabec@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,linux.intel.com,suse.de,ffwll.ch,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cbtce5s7k7sv:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 83FBE744623

On Mon, Jun 29, 2026 at 10:48:04PM +0800, Yongxing Mou wrote:
> The bridge connector HPD handling path currently updates
> connector->status for every hpd_notify() invocation.
> 
> This does not work well for IRQ-only notifications where the event being
> reported is carried by extra_status and no connector status transition is
> associated with it.
> 
> One example is DP MST. HPD IRQs are propagated through
> drm_bridge_hpd_notify_*() so that bridge drivers can process the
> notification. During MST operation, however, the SST connector attached
> to the bridge connector is intentionally kept disconnected while the MST
> topology manager handles all connector creation, removal and hotplug
> processing.
> 
> Updating connector->status for an IRQ-only MST notification may cause
> the SST connector state to oscillate between connected and disconnected
> depending on the notification path. These artificial state transitions
> can later be detected by the polling logic and result in unnecessary
> hotplug events being generated. Userspace then re-probes connector
> status, potentially triggering the same sequence again.

Then the API might need to be adjusted.

Remember, we have two usecases, which we must be able to interpret
correctly:
- The driver gets separate HPD and IRQ_HPD events.
- The driver gets HPD and IRQ_HPD at the same time.

> 
> Treat notifications with status == connector_status_unknown and a valid
> extra_status as IRQ-only events. Forward the notification to bridge
> drivers without modifying connector->status.
> 
> This keeps IRQ delivery working while leaving connector state management
> to the component that actually owns it, such as the DP MST topology
> framework.

How is it handled by other drivers (i915, amd, nouveau)?

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 5edca47a025f..7334d6677604 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -163,6 +163,18 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
>  	struct drm_connector *connector = &drm_bridge_connector->base;
>  	struct drm_device *dev = connector->dev;
>  
> +	/*
> +	 * IRQ-only notification: extra_status carries the event but
> +	 * status is unknown — do not overwrite connector->status.

But it's not unknown at this point. The connector status is reported
following the HPD status.

> +	 */
> +	if (status == connector_status_unknown &&
> +	    extra_status != DRM_CONNECTOR_NO_EXTRA_STATUS) {
> +		drm_bridge_connector_hpd_notify(connector,
> +						connector->status,
> +						extra_status, NULL);
> +		return;
> +	}
> +
>  	mutex_lock(&dev->mode_config.mutex);
>  	connector->status = status;
>  	mutex_unlock(&dev->mode_config.mutex);
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

