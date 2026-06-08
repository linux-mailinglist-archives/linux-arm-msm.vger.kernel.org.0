Return-Path: <linux-arm-msm+bounces-111653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SNYdGDI5JmqVTgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 05:38:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F24B1652768
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 05:38:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=f5ayZwLX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=C9Le3coU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111653-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111653-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6059C3001D76
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 03:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29DEA349CF8;
	Mon,  8 Jun 2026 03:38:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D092820AC
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 03:38:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780889904; cv=none; b=pYpct2A078Zr5fx9l5LFW3ddRe2nENzp9hd1hA7Izck9zbSyqhUqEySfI3UoTm9rkTg9SyIMzNx7IpjSPimL2FU26nFUZA6j3SFsGb/KMafVFycpMQEzGVOJLoYS10nkQKyh1CBE8du7bRsw8783r2h/0qczOdRgR6Ho8YF4ZzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780889904; c=relaxed/simple;
	bh=+NaW+6mbVnioIClr3Cz6aEHaLrW5JAao50zad05DkQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nu7QWtRwKqNevfUWaOsefawrQWgt4QQuGCoSFzbhsRJ1vjhSLZTL9AGpW5MqZsEaiTVd8gr2LufpKUxLIUqRyJ8oMImVuKRx9LLK9pz2trp9y/5Pde375ZYSKpxq5fcp6GNwbOBwE0UmBVfQfkKeYWLCgYh/lla4Pbsktg/bYl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f5ayZwLX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C9Le3coU; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580EJFP1469323
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 03:38:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y3N1eeaQeo9fMWbhxSynj6yk
	bIUVQq+uNK8N5xv+6oc=; b=f5ayZwLXcBSr1MU195o8cK0WPtAPy4vtFBAZGu2x
	u1GbAbEL48odZ1HCxA3995hJ6RpJ0gjL/2jIyawcav+RsXxTTMwSGzoDawyFeFvA
	rWt2QvMDH4gZL2R/gDC+Z8//eIwSVwpgYanJ7SbNRMq26Af0OxNsDHk4OcbM/KMU
	d6t0eEBDPGatbl9LkoKilwcLbAPUK7XiT8u1q1mCMkRrcfmsE1iTblghL0ERbm2F
	t7JHrl4fXl6g/3WUCpkodtj2GvPQMuKJvBUeyW9c4DRD/nyU7cBxcfNpCLkrZcd5
	fUDTomTtQbI8qffFZVxUl7b0Sj+zB2UxI6Jjz3wkXVZn5w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgwbr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:38:22 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9638fe9399dso1632800241.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 20:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780889901; x=1781494701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3N1eeaQeo9fMWbhxSynj6ykbIUVQq+uNK8N5xv+6oc=;
        b=C9Le3coUYA18KQYXy/epkXPPYKvptjoR3eWXvbiImGEWtGbjV6MNejeZ0qKyylKRqF
         URPoZcOyghY0X5Kv0TJht9zCJ1AzetbOIjc00IuMEMfdhAqC/jko4mPTUVRFo0fUxkc5
         4tUQT5ug80oU2BUUAyvKLnwDWfYTiwj6yIsR2/0dta6IJt3p/bdW/nKf1L+99mrjJdc4
         JPB60zJwQaOuJiSlDAFVTJdosf9Oy6e9Y2AiIFKQW4sOdYiYbolzI+RNFT5+dNu5sba4
         SP/w2tVQYkymZo/rcUQXPkd32P6hCVcyieL5IyCst1kkke1U0hbmDcnsO/MgkUYfPl65
         bzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780889901; x=1781494701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3N1eeaQeo9fMWbhxSynj6ykbIUVQq+uNK8N5xv+6oc=;
        b=VJVVnClo7NW4uHK7iGGC8cNUew/t3icF7AvL5dc26rLupi8evCN94EzKFiHKE56VRm
         9wORrVgmFaBpLymGpa8YkcAM+XJDXDAMeYoEhBRGxj0HJRqD988L8rej00f3TkXqmTXL
         BZUOHIV2vVJVlruelAyThgP0QJzUXMO5EpVKOhmQUFl3x7qBgVWTsf4VtxM+7Wp1yOQV
         FKjMRxs/s3lneqH3rEr8ziUspv0BcHEobMHCTanhiiKIplvAa6Nq+FYRIhtMVQYOBQ7P
         7IcubpZ2AqcOX57y+9M/y8X7Z/+LusigK5sWmmQd/pj3gMZxkYDNUtPsvpNQwr7+quXE
         U0Yw==
X-Forwarded-Encrypted: i=1; AFNElJ+ZZWRssoLLozkjvPreSxBc00jKRHsSSnvji4W7rxJyd6uZSodXFCfCnduxpC1/GoHnKczUidxaDlRd1x0l@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2UbTxmecGQeJRDnU9zQDfezmz/583kxITkB5+iHI8iHXwosrn
	32jmxm0FDl/3862/+DacM+KBtcxMtlAmiuABM1pw8FANpMKgBm8BUf7QOvwZDijt7K41UkSrS4K
	p6TDJvSVyLORMNFyuSas4K7WgResY+RAzkL9FtrHVFIcx7AHeNpO+iy0LNFIAYlVyW5JQ
X-Gm-Gg: Acq92OHFwSph6OcUCg0ojk7VxV59XS3ScGFFOskFw1nzYrUP/bdz53LGL7IpoSEuW2M
	ENotjlvF2FUCvWB0Fbu9YfeDHJfjNkRqqYk4cU9kW2/nb0pDsyg+15rRkm38HBQ8NYxykdAijs+
	oCB1F/Bk4AezSkibfMybZsaHjHnpODgn8I029BEO7lLu6xALIqrwuOYsIBceILpnTnf6jsY9sV+
	GNG6JHkV1o0K7LC8SvTy6eOWhaLqavIZ1qey7LMLas+3MmAfiVNgGmH4KyeUIKSTlj87cHh0Xyi
	W+LwbrAGpKZMuD4JB9KnbV+hi8+cM/o0G+B+ad3KxwEgS+WnHWPpIBKZtRA2grSAM7nRs0K6J4V
	vF6pWU6PSQqYHySeho8aARwxI69AaH7A4PxQA4B2I6DLUMZYn5laPkDKPl/RczpKundC7VwhhbN
	cazm/drXzLKu8KcqprTdSP1WwlCKHZUze+zKDn9A537T1OJQ==
X-Received: by 2002:a05:6102:f9a:b0:634:420a:ab1b with SMTP id ada2fe7eead31-6fefb09fd9dmr5197913137.18.1780889901384;
        Sun, 07 Jun 2026 20:38:21 -0700 (PDT)
X-Received: by 2002:a05:6102:f9a:b0:634:420a:ab1b with SMTP id ada2fe7eead31-6fefb09fd9dmr5197895137.18.1780889900912;
        Sun, 07 Jun 2026 20:38:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed2adsm3474262e87.1.2026.06.07.20.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:38:17 -0700 (PDT)
Date: Mon, 8 Jun 2026 06:38:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dp: add missing drm_edid_connector_update()
 before add_modes on cached EDID
Message-ID: <pdb62ojwx7l6lvyo7ywilm56muv4vkqpou5tvpi6ac6yjo2nwa@dgsdk6i4sm5d>
References: <20260602-drm_plug_flaky_edid-v2-1-1269fb942299@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-drm_plug_flaky_edid-v2-1-1269fb942299@oldschoolsolutions.biz>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a26392e cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gxl3bz0cAAAA:8
 a=EUspDBNiAAAA:8 a=sa5PkiOI6JPz9RB1ZpgA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: Os_fcy2FzGlX0nHIg6LPTKCmN3dqmcWF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyOCBTYWx0ZWRfXwjTJrhKCUhP1
 m1dJ1sz0Jc0qNDWGknwYhSgz4UUkMpQOagk0kC9k1N8y6241Rq6gBH62JMtb0f3bWzXbG4O9oUy
 dxFw8SnragCt5FxI3g4MnRBuCEpqWDfeaMa7c2mScPs5Zjd1EfZR5Nbl5Fn7rG8eysYxr1hgqV4
 /ZCPMTzYVMKB6TYaVhXdrO3ETOyITCvevmpHZ8N9YqO50iO3kYOHXe+krwjuZf63JQSKpcyxpnG
 sd24AWALFN9u/MwdxBgHd/5LZy2szDfGVQYxgrWHDrgVC3nJOoBhdC8MmpLyQKlk6w7PF8DoK7l
 IFtmrWZzMfFsetczQAb/jcxLN455oBkpjgC2xC4Y9uVNE7dB2kAUWXtNNWM8UTTExC142eng69I
 1ZkSjd98S0YbRT3FpK5WEpMlCI7xmV75J2Clz8/0wBefehLVTxmFGvDopmMnzRd3/jXi/hrxBBV
 SGnOmVJPHYjfDwgG3qA==
X-Proofpoint-ORIG-GUID: Os_fcy2FzGlX0nHIg6LPTKCmN3dqmcWF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080028
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111653-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jens.glathe@oldschoolsolutions.biz,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:dianders@chromium.org,m:jani.nikula@intel.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,chromium.org,intel.com,vger.kernel.org,lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,dgsdk6i4sm5d:mid];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F24B1652768

On Tue, Jun 02, 2026 at 08:18:48PM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> After the refactor to struct drm_edid, the fast path in
> msm_dp_panel_get_modes() that already held a cached EDID called
> drm_edid_connector_add_modes() directly without first calling
> drm_edid_connector_update().
> 
> The new API requires the update step to associate the EDID with the
> connector. Add the missing call. This restores correct behaviour for
> the cached-EDID path.
> 
> Fixes: 5bea90ad9743 ("drm/msm/dp: switch to struct drm_edid")
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

No empty lines between tags, please. Otherwise they might get ignored.

With that fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

