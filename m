Return-Path: <linux-arm-msm+bounces-111494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r15JJOgMJGpP2QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:04:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E64DA64D4F7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 14:04:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="epA/xh5e";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ScvXdfQm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111494-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111494-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86FDE300D860
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 12:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41FD33A05E5;
	Sat,  6 Jun 2026 12:04:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C183976A0
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 12:04:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780747492; cv=none; b=TcE3hka9XIhgb3cmCPGqC6EaTg/Q+f+drf+X7H06DxuDdNBYYSWh4/JmGCH5bbEl7x3qPV02zU2tP2MaPvCkHtqbeEC0WaYI8dHwS1GUMolSaRwnaM2D4+c6SPpKXPy4n3EGz2p0C8b2z4SPQV0EeB76xC84feDdgYKTQOi1ctg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780747492; c=relaxed/simple;
	bh=MBg3K7Xnj49zqL4IuFhxgOGqb7gtJRLrC1QmUdsFBlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=puyCVpmRSoDJr2Y+HRwRyKAjqXxWf/yjUlxtBDwpsctbJgXsDhp1JFIXc4jgDbOrKw+hoeJ/DLI0Qt0OVmPuDwll/S2gwp1HVze1vcRw7ANggVECgf7zcIgaCxMQAsGQpvK7EiFozsCjdmNKPrnXSxthG/uj3652aYyl2ybxRUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=epA/xh5e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ScvXdfQm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BE4xC1232025
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 12:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XOo34K6z2SJt+/XdhMaWPTPX
	KCn7NtY7Eb/CY41noFw=; b=epA/xh5efiSTIo51Y6kwzJKxFc6bXjPbW2in4GD/
	R31AYeZcqmJDjkLc1I76zguSsp4KrZoTF5kKft5OOvSZhX0JVuzxSN+cW5gfcRlF
	SJYs5b8MzHXDcCOFlfFNmC9LeiVW6ZS0QECw8kG3/hdNoD4o1Yo9YTeWga0P6Ht2
	r5xheBfUEetLhEMQI82c1Q5gTIQ6gRESKaaaKFeo5M0ZcKsYDUZ3TW5UC35ie1rZ
	dYaqw+JQXEU22FT7fC3pok3OMXI/tE7kEg2vp3Itow28SLDom9j+VGMqot7Uv0Jz
	BVDzLHPKzv81OctUYUh2UsQScxZdSLfgAYHa3LHUvUY16Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgrsdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 12:04:50 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6cfc66167c4so1254323137.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 05:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780747489; x=1781352289; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XOo34K6z2SJt+/XdhMaWPTPXKCn7NtY7Eb/CY41noFw=;
        b=ScvXdfQmpcIZ3E1gZ0zTNILD69J2Fwr6bCODDQdDmi8ikHK4nAi+2V0QtS8YIj8uDE
         uRRDuFNVhqcJT25G/C03zU+vBBiwzooBtFQy1d9upNpFbmtQhHEK1DaQM2xG7pUz0Tz9
         MmQfr3F9zYlE0nkqLCpVXS2yEy1oQUaL9C6NMHAgpenfn4Fl2fF+/mX1GoKbDRrGc2/s
         vIagKCiZiiWbGcnMaoW6LiY/HmWr+yOjA+NnH+so0qDMJVI9VTDNpEOIFBGnzr7pBQjF
         V1AzzvBsWLT7XfF4emz8OwdlQb3ns/aRmQ80j2hUtFxQbBemz5atkXTrlCgeAEHmJnj9
         6iKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780747489; x=1781352289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOo34K6z2SJt+/XdhMaWPTPXKCn7NtY7Eb/CY41noFw=;
        b=ONs3rH2ybDt5I8qcceRsUyIrBUj8h/YvDrnVXsZ/HYHhqlyTz3scJMSyqg1gIteO22
         mGVVNjdSZLtHoKmil8Vo8/0OdtZk2tW+2FwGSqLZwzCk5xSKJ9FrjGKigXzs8NOpx6UP
         orHO8rNNX6JX9HDK4a30tOBhD+tuWl8CXHcu/LIE1drjdIhUtG9lYWpvzMbze3gbyGf9
         h/gxYnzYkK8oPTdGKG6tyS6EtYjqpNdqf6SuvMUatxBWRvzh8f+famg3gJrzD5lVaBsa
         gjfl66SOR8/18OKmrGY3ikvt4PqYWsG7/XrjJkze51Aix0W9MVFCnRFhdwgwpA20aytC
         JA/A==
X-Forwarded-Encrypted: i=1; AFNElJ/tt062HGDOlFnSlcR5/wKPMNyXFZ1GnAR9IXCLhwlCQ5s2SAtVPXyXa4VSMYY5ZJ3YPHovthOCz7p32Q3O@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4X0LQ+EcARycO6lqWEDAzVfG+neFLfNKjCTQLHEinehP2fw+9
	GJXQO6R7CMDsaPx3rD6wLhW6+UFQxAZ2M1d+6mYQ+9+tLQGKUNFRpSErc+WKex76almEo0mFb4V
	JxQLyqupsukDU7rUgtJrl89v9tZKn7CKyrf+pecfQqGpq26WMIDEcxeiOBS8t8Hiykrmz
X-Gm-Gg: Acq92OE09HytW3Fc0MPXhOOUSNgyK5suucGMsrXcVeLJ9t+q3qg0ZHsXEgNuHA1qo1w
	jyNn/oGya23Gz8zZHTr2Vi/wp0iktBhnRQqcqnDCOiOVHhJxCvw2BKQdIfzIt/ihZ1L5gyFk9s4
	BmBz9GirVZfldwp/K3LQVK0+i84Hd89ttZEMmJ8gthEzd7nLlCKLsFhjx2d2BlDCjVeQ+3gy6DJ
	qYwlAd+tNu1YA5uyH22BRKIMjAQM+0KCm5l80EffJSmdIykIn+2uaagO7AeeH6CCcSbxwuZaQ7d
	2DyQ2quu0lqtiv81U8PR3eQrcHeP8x6lGrpgY0PB3CDi055yzaFu6acqlOsaI7tv43S+uBq8eb0
	1bOYDq88+vHOOMDmeO/g+a+aY0vtry36k0VU7qDZfU+XQndaWokl5OmU0uydv53OOyTMEwl1bzh
	LNdbX6j3xRVbp4yyW0QXaChUtrNi7RAacdmcLEgRv/5KybzA==
X-Received: by 2002:a05:6102:3594:b0:62f:34db:9474 with SMTP id ada2fe7eead31-6fefbf1a290mr3455619137.20.1780747489245;
        Sat, 06 Jun 2026 05:04:49 -0700 (PDT)
X-Received: by 2002:a05:6102:3594:b0:62f:34db:9474 with SMTP id ada2fe7eead31-6fefbf1a290mr3455588137.20.1780747488814;
        Sat, 06 Jun 2026 05:04:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97a73asm2419279e87.51.2026.06.06.05.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:04:47 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:04:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH 3/6] drm/msm/a6xx: Fix A663 GPUCC register list for state
 capture
Message-ID: <ox3hiaoxj76rjt2dkymf7sxsls6fmwajdhmwsktslv4hhygenr@yvxvyiszbs4b>
References: <20260605-assorted-fixes-june-v1-0-2caa04f7287c@oss.qualcomm.com>
 <20260605-assorted-fixes-june-v1-3-2caa04f7287c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-assorted-fixes-june-v1-3-2caa04f7287c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a240ce2 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=npCoGp_I_a_DEMxlm3EA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: sa4lauieUoyx3b4Eo0d905C1jmqbwOiO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExOSBTYWx0ZWRfX5JGuAkN6l84e
 yVM28AFg2LqWTRUSq3oJksARylOzS10ttz+liE13kXYTC7bfVJx+I6OqIWpTDzBX1cQ6UpxDyjI
 CbgSxQhqkPIG+rL9Gf1CGrQduwiTXljXPmrbE0X9DI5V2Ovnok7sP0k65W6JXytHqdMaqQ+zIkL
 ZOplmT+RBr5NgjptyYblUA7HldZzDaD8YQek5JSDskKksvzwxhSoQ+CwC8CrlLcGpIKjTlzPJ8G
 mbdGgk6clLDzP50QFmNhqFH+FrbgvZ9oSk2yrDcXKaeq+GEZMG6ZPCF1bjR+tQc7zjUzgiUnAyt
 u853e1ogSPfIiAYfSNtyMTPpPFrH5E5LN1gs/Si9+DLxM9H8oMuEJuuDwxOfG645qk+GBvtdmjT
 D8KkldD/nrrl5aHqyQeUN8zddO+havtt0ZuC6ABZbJW1Hub26GMyPlUgz+Zg8Pw2Vrvsoq0ZS9x
 SHpQ+tMYW8ATPI6rS/w==
X-Proofpoint-ORIG-GUID: sa4lauieUoyx3b4Eo0d905C1jmqbwOiO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060119
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111494-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_pvgtejas@quicinc.com,m:quic_jiezh@quicinc.com,m:mcanal@igalia.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jie.zhang@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,quicinc.com,igalia.com,vger.kernel.org,lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,yvxvyiszbs4b:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E64DA64D4F7

On Fri, Jun 05, 2026 at 01:38:19AM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> The GPUCC register list for A663 is incorrect, which can cause
> out-of-bounds register access during GPU state capture.
> 
> Update it to use the correct register ranges.
> 
> Fixes: 5773cce8615c ("drm/msm/a6xx: Add support for A663")
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

