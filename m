Return-Path: <linux-arm-msm+bounces-93849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCFJMOHjnGn4LwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 00:33:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE3F17F953
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 00:33:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2416A30BBFB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 23:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C755437F8AE;
	Mon, 23 Feb 2026 23:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jV3LT70c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hOZgK3px"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CE8369980
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 23:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771889519; cv=none; b=JMgTcaOl+3v0eoULEqB0tXuqxCKMHr2RLXVrtwQ/mrH0UIO+DkhD5oCGJQoH3jf0/Dx2nnpfxShuXWCsXEZnLmEa/MmiN4hBI81To11a+uGKUXEcmBsF0DbTPL905rtGgE3ePDDDLWgLNhWrQMKknbva9A6XOGL92TUJzIhcGuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771889519; c=relaxed/simple;
	bh=liTDDzEqpTEF3LGt4gVjOplxn9QC/VkSRWHwrx6F8+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=spjDRl7xaaMgC7lQa55wqd5SedGovJ30z+a6nmWBWdQm5bus/02Ft+tefGHT1olE0WPGrBWCj7iREGIQIrQAOn4jgm4whXxv9yTcDaoGtlYysBgB+aVkNk3HzXMPw6qv/8WP3gc++GyHT2qz336cmxzOKoEq49b0e9hntt/e00E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jV3LT70c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hOZgK3px; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGFHx93936126
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 23:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pcXNny12eVUei3+MwxRw80MUcAUX1Es/wkupl6bpnH0=; b=jV3LT70cFUxj/uMr
	8Ey/Xh2rL+iNxA+GPFKTaTLCnRZFL8R/2gzGZm6YwljL0ZdmR7+R56p4Hi6oGrqT
	8LXJg/u1AeFul6Xa2xMBrrOZf+LNL5QGbinBOlQCie7oQyaQzlPfqkY96xghSOoT
	14FEtvpo289C3O7tX0Y8l2KvDlULEGl19LPAGNsYaUd4kE/l5c4Fx+AJwLKf37Mn
	d6Cx0LDY7Z8NDV6P2NU5dsbJdtCns4PBnvXjQAmRq8W/SgGyS4nTfcCBaXp2ApXK
	73A32INRXWd44YuxzXwudyZjKEHkBQlV0cpsQlMptRnnk4I1yaS+Ppct50SSfqh0
	I6kHGA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgt8mh63m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 23:31:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3ad1b81aso7115561985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 15:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771889516; x=1772494316; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pcXNny12eVUei3+MwxRw80MUcAUX1Es/wkupl6bpnH0=;
        b=hOZgK3pxBZJ5+hO6GA86vKUgFRHzkNALG2dNj/eZZjoHiQBTqO/H66MMjktgzfo73G
         JrO9oQKBdoX7mGHX1ZsGbcTtRV783NkX+x2BGTKHK+F5h9CYKjFZOo7EbwbnHTJRDdVh
         cVCQZeyuWKnIhA64vuCh9PBrpC+8oB68LtOFwK0Oyonr8BkxaHT4o2dgPSo83VkbaH9h
         OHP2LqytpW5Zwmr2XJ+Ehea814wRnthg7UwoXTW4Oe7hD6cK4XDN3yQSzeO5QEvVaRhw
         qHjyJokls82uTb82AD4sDANq+ZacZVlIydIctP1+cEbG+YYjE/dqhDuvHOAlZrOXDcPb
         LuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771889516; x=1772494316;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pcXNny12eVUei3+MwxRw80MUcAUX1Es/wkupl6bpnH0=;
        b=RhzbiOPGlHHquZRw82nOGaf1GL32h+BYuS/77ihmZUi0FjKirOkh8O43VwBObPMPcI
         aF1PYxo9ftGJcddsrux3XchIh6+eKhPV8P+hY5VNHds+w34DnPptCRDuLl2CDtRddo/x
         AlYHWR0Vu/tnmF0R+jajPSn45O0oYfB+YnfypVkEtj7UOQqSDBhAzw7M1dsPoE8AnAqt
         Pssc42XHLPWdJZ34uCnsN365KSw07l4wM8vCh8VAB0MVYahoSDcSKB/CngD0gDVvQXuG
         IBajDXH7PxWjsw5VfY74NoR9qKB9t9+aVqqZFzFs7/xau63qOHAou13b1LsHDMyfgkxD
         yt4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXB+YQrZUMeEAC7t4sS7VBjwPrr/DuaYsRZP0wIDf3Vahd89c9hZiFa/KBQ4Bts2VQiR2Ap7AvjyWHpbr7W@vger.kernel.org
X-Gm-Message-State: AOJu0YxQgrgrSO83dyTkjIf0pX8sa34AfnHeZJxOUvBoFqGGVgjYql++
	/9P+kJQB6vyxfZzzy5/1ogJYmPxO4Mwr3lzExAbs4v8ZsUrVn2mDX7y6n4iZEsV17HZfrJHaN4J
	2j5BdjCTOWopLSqHZA0RXMvJIqJ/VRxW3Iavlimi0ixYIkSQENm1n0OGeIRqjpNgn0Jpq
X-Gm-Gg: AZuq6aK/DJNyF6M7p0HXJEWx+CZLb/X1arcI0wXd8foSTuGExaEe4njvjTCqm9uOwNo
	kdi/WrIz3lpwTHepEkuHlS4u5ib4gi4Nlp54qOmfo4EJx/Us4Lz8P+XdQZuXk12YzlbGSC2dIgO
	xul1K2aoFSJaqlTuwoUzvSGu0oGqkkSjpVeek4VNkCdA3+ozt1sGH4D1esNJ5/pdyuk7WEpxrEC
	uMc+AUq6/92VZGalNkn3CpzBCTOttMdujUMDXYGlnResNITTpqYlPmr3e++mciIvNY4ggHWoDQ3
	I556AdR7PpKb9ypRM5p5Jy/zn3A3h3ZMGtPpkPKX9Ggb6xjNVJ7ck9pRGhw9sZOWuFqkKUNfriJ
	bMPIkteCd8Vw7W3Zci5+518EvQ0E6u6RxD0aUYlakcyp1hVfEMZE3NXQrtx97tZSu4bGkULIPmx
	JamBHnnm9CW1nTtrZJp5dK4P5DVtOqg5GVrtM=
X-Received: by 2002:a05:620a:8412:b0:8ca:105a:f5d1 with SMTP id af79cd13be357-8cb8ca0a6ddmr1049864585a.30.1771889516524;
        Mon, 23 Feb 2026 15:31:56 -0800 (PST)
X-Received: by 2002:a05:620a:8412:b0:8ca:105a:f5d1 with SMTP id af79cd13be357-8cb8ca0a6ddmr1049860585a.30.1771889515893;
        Mon, 23 Feb 2026 15:31:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb0b8f0sm1809097e87.14.2026.02.23.15.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 15:31:54 -0800 (PST)
Date: Tue, 24 Feb 2026 01:31:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Don't use %pK through printk (again)
Message-ID: <r7n7bpgagciyln2iik2iybctzujyfrbqpxdynqv2saxapcmicw@yymbsq5ifhjh>
References: <20260223-restricted-pointers-msm-v1-1-14c0b451e372@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260223-restricted-pointers-msm-v1-1-14c0b451e372@linutronix.de>
X-Authority-Analysis: v=2.4 cv=J/unLQnS c=1 sm=1 tr=0 ts=699ce36d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=EcddL8Wb1xXwbACcv5wA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: CuwHY8NimlnP1BxRcewzG9oCcbkSltVA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDIwNSBTYWx0ZWRfX7S19XFakfU8F
 qCr8dq4fsY6BsBG6BoDuCyoQsSfwZZK8spDyWeEgpYrBgps2oMY5jKrkmz4Q0ozA1Qpy740uU8J
 ShJA96YP7QG8WvocyftRMmsATC4v9zjySdkIiIZKmAYgtDP7KW7UNQFdAw1K6DqVE18bDgtJoZS
 TZTCrpEjhJCs0isoi1d3uwjGS6aA0sQjDvszh+A343HkiWl+R07tqOcVwjRLJkxcgIAGom8zQSe
 jN1b1U3SnMSZ6HIZH6Tqdb6lRRzGXx8om3OrMZJ3geQncXUL9Q2gZhhC9thAP+f9HlUfpuCYCCH
 yBrIYBdA5qSAJHLygYUjILepy+7gwWXBRRKlxD7Ukt4USCduDueeZ3zROgDA5anRlaxcQAzqmRl
 YgcXi4E0YABsHParakLbzyp164ss1sUiDjIKpWR1PLZRJfvkxaToSXpyD0lwdKjstoPGwNWCEtl
 rP18Q0EYz0bGwAqstag==
X-Proofpoint-GUID: CuwHY8NimlnP1BxRcewzG9oCcbkSltVA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230205
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93849-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3CE3F17F953
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 08:16:55AM +0100, Thomas Weiﬂschuh wrote:
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk(). They can still unintentionally leak raw pointers or
> acquire sleeping locks in atomic contexts.
> 
> Switch to the regular pointer formatting which is safer and
> easier to reason about.
> 
> This was previously fixed in this driver in commit 1ba9fbe40337
> ("drm/msm: Don't use %pK through printk") but an additional usage
> was reintroduced in commit 39a750ff5fc9 ("drm/msm/dpu: Add DSPP GC
> driver to provide GAMMA_LUT DRM property")
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Fixes: 39a750ff5fc9 ("drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT DRM property")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

