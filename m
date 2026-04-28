Return-Path: <linux-arm-msm+bounces-105080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EuKMYsZ8Wm3dQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 22:33:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BD548BC7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 22:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACA643018BD2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 20:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F1D1862A;
	Tue, 28 Apr 2026 20:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A3QSSofs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdcRi54y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C5C40DFD3
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 20:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777408393; cv=none; b=G/MmPBx9RRBB1jfXuRHt5QcfAlmm2BCu+9iACokITEfVfrHArKiTHo2JmbcmT6Fg3L6Si2uaTE5HzyJ+cn/sKSZb2h6Ltj9MeQCeEkCNQPxdw1X8K7ALbRmLim0e/JBjW0+Ij+SpNGRyZ+nReNTm6fx6bFUUP87uTdtC4buqpJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777408393; c=relaxed/simple;
	bh=hec6VjS1OXTHzmlVNNoCgWC9FfQIHOvvLQtsJGxIr04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WzPJEOfmJRYkPDzpk0+ErElYpDAiTPmjIRkjXaF/qqGEP1u5UgEWyTzQcpGceYViR0lJ/hukTLSF3BZsTnqcmxXe1TueJGnUcdvVylESEHtOADhYavqcmGnBBLiC5HgIMtCbAqKRfU1lfhpjtHhkgMyzYjwUzkuY/+J+OzIY1ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A3QSSofs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdcRi54y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsRIl3705173
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 20:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4QafK/wXpaIXO2Yjg0RdqOd6
	ehqsozV2z1rnfWUzn6I=; b=A3QSSofsWdYsNCtA3W+qfRON6F95gsriFK+EGDti
	riDeqKKNvqDtEKI1U2W3hfjGtf1Dv5Iz9olLl+BB3mDG/3RFh+WhO+/cNXiCy8DS
	cHuyeotfWIviQIFNBZ/AgFWHbdMGVouUefP7XBb8hEz1JI7SbAzqbJEYhsKhbd3I
	pLuyaX0QhcYpD5qSZNm6Efm4r3M60Prgi18uwJzEJh1VhlKH6LO0J8Lw/9oW4ctJ
	b66Szful8x+n3fRwKpbOBS1UIfyyTvm1Syw30WvCyZ8OXPC+vPYoFTyC0poQt8nc
	Wv/IyYHjpTpDNRxW+zCq6Q/14dr9ZThmYfGJrlsTndNWqg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttxhaarf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 20:33:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb6d713ddso1055191cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 13:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777408390; x=1778013190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4QafK/wXpaIXO2Yjg0RdqOd6ehqsozV2z1rnfWUzn6I=;
        b=LdcRi54yg7SEsvyWVaBCZCZ2cp9Ypw9CHq+SYBzdVxFHqDItmKXT+fcKyRUmNecuI5
         3g93Edlq/8iHQZ+5UpadXzjIY/dTRN710D1sHW4uySXymUiBZhwaLEjjxuuF2Fm54I6N
         QQK4qEPEbwXQbkNtxQhdqDBzif1hkF4dObn6f1Gg/1egJq+GsbcjlX1o1jF8lKbRruKB
         LfFhoPuMAKJglodUqiQ0rpc0gkwLRz5SFL3Qmo3vV2hvovqde/riyLiuTLqBQKddehsB
         IGX3c/tLG6JYYQGkfLJTfWwVHy/4gT+YIrOBUTKoRJ9oWb2oX1UPZBbIWfLiuhXKkplT
         H4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777408390; x=1778013190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4QafK/wXpaIXO2Yjg0RdqOd6ehqsozV2z1rnfWUzn6I=;
        b=C/2l/JK7ApXyfCKNYWS3cMXOCO4OUAa/7kv+o11/womuf0HEDdLV7Ioi0SXRjrUXoj
         wHRqZwbX6NDkoMUv6nRZ02pVwTJbRZu6KkcBQHL4XY3u84N0yAbho9iTrUMA5rdRhnA7
         BO/7cf8Gn+yC4B7YqgmzTy//IBgcHXElrWuZkfVEowfgJNZrMSxRfFW7wgvlHbEvt+Qd
         WXbxJKSqcLzNwWe1428K1k8E+SbQi5rzv4GklIq0W+I5hYRTT6JVKUtKIYe3tAPM/mXJ
         EcNO7TRKx+So1Zz4BMe+sVubtxKyLMiBFBoFSha5BEIKywPjVA3attRorudPxf+eN8Nd
         hPsA==
X-Forwarded-Encrypted: i=1; AFNElJ/vaNi1di2vb2YFxQQMLqYYMiO99xpd/YjGrM1/tUt0esyEQFbI9jcBZSB9/OZ5GGglaFj52X0sosmRtpyR@vger.kernel.org
X-Gm-Message-State: AOJu0YwVdBXMHN9vQ86xPtPZIPhuVU5KfMKgge6a9lCIdDiaBMM5wA7l
	zbnfmn92oHnnmzdlf0i4MOo5dfdUgYaTAPAwL1qqDq219eraIt3QEEB99FMkwAKMoeIyVV/0Vyp
	oF/F7Z/7cobAUTY9iAiOfo83CUYMAdpON1Lp8rHA+kmzZXqzFoF46oD/z7iXMBWzYu+Oe
X-Gm-Gg: AeBDieutivk5i6Y2nNk+5T0cHFuxtyGDNzArAU701z0cUGT/3C62Y/OEOVJAsnesrA9
	UAWXp4L4gZlaQB7hYEa6/NZMw2M+MH8tjJ+XXtzpQYfMo/o0/xyB9h+VTvksCqIwN5QZ093TscI
	6jHJWWi/eqc4ewHfVjHeHrUVZi/LOHwckfczny/t5bcMrEHCDlSmNUF/AWDV5tHQLBCdMjM5/JJ
	Xovh43d411labUymEN6aR+Ft9D+gnyiYAEdoFDWC9Rx8+Rf4vsnSosZE/VmbHPFaWkQqYttcokO
	esWIS+s8w8XxLwckVLxyPLBufbzBfrtiyjkAbWBMntaT4HCx4pNEkMncrQIxklDSMyeFGGkcST+
	qnYgJcMeQW/7nc7SLmRI/JpMYbghhajcwfGSDAMT/87lVPTf8ClV3WeKA5G1P0QNmxuM/hX+Ayy
	qRVihZYeB/5bEaUUQkYtbyJYN/quDiT9T+dmTDSG/gHix6EQ==
X-Received: by 2002:a05:622a:550f:b0:50d:8b23:4948 with SMTP id d75a77b69052e-5100e1dc544mr62480391cf.46.1777408390151;
        Tue, 28 Apr 2026 13:33:10 -0700 (PDT)
X-Received: by 2002:a05:622a:550f:b0:50d:8b23:4948 with SMTP id d75a77b69052e-5100e1dc544mr62479741cf.46.1777408389609;
        Tue, 28 Apr 2026 13:33:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a74a756c9fsm12644e87.50.2026.04.28.13.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:33:08 -0700 (PDT)
Date: Tue, 28 Apr 2026 23:33:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 08/11] drm/bridge: adv7511: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <67pqw7jpoydsbql245afcblpc2jbfn7llmhc2qbhrkf2epflp2@27x7qttw4lxh>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-0-a537b5567add@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-8-a537b5567add@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-8-a537b5567add@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE5OSBTYWx0ZWRfX9Kw814Ne/hc2
 KosvWEZkiLyQ/UhmjVqItX6PHtvnh4EndTLh19/dfgRUn4TeNgDErNqYcQXEf6ItC3SvDNTce2F
 7APRp3vrhLtE0nFl7gQEIOq6JrynGvi3l+17OO2V7bLpEaqREwqe1ExMziozm9pDHy7BayQpDif
 NOGYheq2CGBn/mQqVhqjM9eFXN6FBls5uMdX0mUhh8yVWnm6MoQB4TElLXKYq++KFktsUeCAmwH
 uWUbuhF1CtfhAIyVmJdO9W2fgaU9it2sNMppHSLXca/UYKYCHTaHlQpt7/dhsJAk8d12YqHy9DG
 4I0ueubOuOpzkhS4PsTd/+lXM+O0Qn9gQMawgPl5g+NJoQP/baprQgJN820PwZOZAY2Ipv1+kPW
 7lm/TkG8cuyJUexxAKoZ8BP8O7iQD9p6N6DjRlEc3lMFzxgVxKmNN1UreLt72o4QtvqpL7RXUVC
 411uFv5jgO8IDLKy+wQ==
X-Authority-Analysis: v=2.4 cv=Uu5T8ewB c=1 sm=1 tr=0 ts=69f11986 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=sqxsbOWVCbAVHG9YZwUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: oMVMBS0shJGlp01jTEhyrGfwBD-FBu2l
X-Proofpoint-GUID: oMVMBS0shJGlp01jTEhyrGfwBD-FBu2l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280199
X-Rspamd-Queue-Id: 24BD548BC7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105080-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,google.com,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, Apr 28, 2026 at 05:30:57PM +0200, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal. To achieve this, instead of
> adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
> pointer which is automatically put when the bridge is eventually freed.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v3:
> - fix ERR_PTR deref when -ENODEV is returned

Biju, thanks for pointing this out!


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

