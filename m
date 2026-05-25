Return-Path: <linux-arm-msm+bounces-109666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MbmDSpQFGryMQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:35:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DE15CB37A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 223E3303FF95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8344A3859CC;
	Mon, 25 May 2026 13:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpGNiRW/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jUTeCmbp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8DD33DEF7
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779715867; cv=none; b=B7OWgutp0s9j9TzWD+6kh3BOR/0c0/BGVOHvRGVmLZe5Ywio8BTExejC32mZYg5dUEH/TbOBdNPRi0Ui8R1JzDAY138Xv1Y2Ibk7Gf8zUgWMjQg98b4sKzhqlv3rOjTQ+1FcZO631OhtiniJRJXeFjIJQR6Whlwbm4vW6S8Pw2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779715867; c=relaxed/simple;
	bh=HTGdrHenu5Q/+rNReXy7yYu4WJk2J3aQ2L7s1F/ry8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fpPHqWxoeKYqhzQ3dwkNuaKn01V8CWJ8hU33tDrQ4/WJdpGkvgULKX1aBucOQY4Od71S18sja9iHMKkNl67fptoSreVCdz3zuvQL0zoP5D/eKthlzKDqCdZTvH2a2nm2rE7ihDkOOLLRCA0Qyz+vE+k/zAMrVlWGK7iQ/wkz+z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JpGNiRW/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jUTeCmbp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PD25Fr691606
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zLVbbY0c4SKAOL1UVThQUmV7
	QSh7I/GuGH7pkuZOSos=; b=JpGNiRW/ZPE+XgEeCGcgArkgUwnjn0NGgcbudQH/
	+EphSy+gkJzUHmg4puVy9ENliDrTo0q2urWZFmgjKFDSnVwtHy9CAIwiwfjE0qSM
	/ES8BT2USBTazx/lw6JXprDsxksGvKgDP12ui6+/kmhNB1pwXVoXi0g44slrqLYa
	W3BuQPumocanUpgfu8Sc9eUxGNFYr65Ia6rWvmsZUbq2WnLEjtluVs1osHwYCYPs
	yO2QokB6QpsgBsbiUvzQYG+k7W7KL3Jf3qyjL4nHmJTeso9zf9Cnp9heIaCzZIzY
	OC02iH7Y5MztQnfQYqFXa3uyZmL+O5ljzPTdqgSKo/2TKw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpy2g3m6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:31:05 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e3dbd97fe3so16037871a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779715865; x=1780320665; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zLVbbY0c4SKAOL1UVThQUmV7QSh7I/GuGH7pkuZOSos=;
        b=jUTeCmbpIGd1OiTC7pc6BREHjWd6X4NDETTQjaumlfSZrtwDNZcIS6vzhNowzgJ1sJ
         1qHUdqQV9TfvkRY/FgiabQ3Qljti4gf7AFXgEKPeNBTvEcwXmopTFsHXBeh0WtWPiUa2
         7i66MqGEwjlKxeZsVfz9bxgtaaJhigNq5UvDAi7IaYezeKra44bv+5RMn4pzaynVArMV
         zNcdV6zjWsG1TR/Ag1I18blbWFGw4iPHf8IlloVt/rV5swFhTdebymwFpEdClANGw+Tz
         Xd+906cjTnD1t4Mka/ECKwzN0awAkby4CLVIotv3NNWcePElkk2Zco1UEEpCU9LEg4qP
         EUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779715865; x=1780320665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLVbbY0c4SKAOL1UVThQUmV7QSh7I/GuGH7pkuZOSos=;
        b=J9Bj1JMfgrRXjALXGtgHxI7wRq68XyN5eO8yLHZCLyCpq1PiYCVmiYPBuj0+RHVYog
         onPgA2uFSTjDf6Mo23fbmmpv9Th4+UiH3SO+wKEV/yKwwhSyMK5DzvN7mmL0OcxM7lnx
         scA4vMpNLictzUREOcdCuNQF/eLW3GliJV+ZUqoJwmO8560127AsIAvIsMMWa/EoD3JS
         a+Bfy5D7nPTGMifmgOtaAqGhkqQcyT8ex6SBClo0YLC85fB56UMZusZlNUot0gKDnroI
         1uj5yKAooJ5awt0CVpA+pfa4Q8y8rw4MxTY2Goj/GRxY2kJDpUEyS+dZg4sDTZ+oerqW
         Fnxw==
X-Forwarded-Encrypted: i=1; AFNElJ8oe8/diYVJlveU9iNvIOUCzq5ABQPmChSzmb5Ggq/mJgITkLQsN2QaM9T/QbDsLHNtlV7UevNJYcXifBxI@vger.kernel.org
X-Gm-Message-State: AOJu0YyxROa0tI0IzJFjHrZWtnLQ9cm9uiPITxAFjVNWqXvqwcqzHU5V
	mLcF/yE5kipiKJDikOuj4/uTpOAPu8UbME3NM2BNVGNq7UP2fkrIRRYp93uEBVW9c26EKAo9vPu
	suJp5Va+34NzV/DHgVrqqizSVAl8/wdQDkccDV/zIUIsly+q/CRPcbjui2tmeSlLbRGBk
X-Gm-Gg: Acq92OFgDPOAEQ3X/CIFaPikqrbYkPxAtsW/ul1fT8O91PgNUk/rNjfxrweF2sINWgU
	fSzaqO9oZJQDEw62m9QSuIj/H5u+aVQMbaOxWJ72jJhGN3DHmL/xMxs33MUHmdlN47b9rtVhvYv
	3BLcYL/G1WNnhp9iEfc8KrRLTIB93aXkebK/FJRgdbl+RRXiKXsVj6EvTWwtXU91yWo5aOeB9uC
	WDREnPlg9jzLyrFEbjLoVFCMS7E8CqjSQfLIa8phlPCwt11gvzlAHV1jpbGLuyejZfrgd/dftDn
	0EyY01BuloL643xYdXGcrvcRpeecpJBnwx+OlB8LkhlWFZnVCgyLZQyR/eixbtQc1ShRbbE7WdZ
	B9NdT13hQKPu6Z72cgQtjimUdioCtV34m07wQtNInsmS5+Lr/oBL6BTuskfcilibavDQ2KVYNuV
	+Fg/madG/wYoPmDANpO3pt30kF29K/0DN+G7dwY2q8NsGKQQ==
X-Received: by 2002:a05:6830:438e:b0:7d7:e3b9:58d6 with SMTP id 46e09a7af769-7e5fef848fcmr8647544a34.22.1779715864542;
        Mon, 25 May 2026 06:31:04 -0700 (PDT)
X-Received: by 2002:a05:6830:438e:b0:7d7:e3b9:58d6 with SMTP id 46e09a7af769-7e5fef848fcmr8647487a34.22.1779715863880;
        Mon, 25 May 2026 06:31:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf2b2dsm2658149e87.56.2026.05.25.06.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 06:31:02 -0700 (PDT)
Date: Mon, 25 May 2026 16:31:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4 16/39] drm/msm/dp: use stream_id to change offsets in
 dp_catalog
Message-ID: <btri3zjm75yor5dap3oahdemailljh6h2ndldmmctehxabhdjy@7qnqq5cmsx3r>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-16-b20518dea8de@oss.qualcomm.com>
 <exhugtt2cf2zjvbing6p5q4ubyiealzj5ijcdrmmp2s45liz5q@7ccvl4euerkq>
 <753dde5f-9032-40ed-832b-0ecba7228d1a@oss.qualcomm.com>
 <zeuil2bs2qlqajen7edk5e5dveeyje3q7srxgfkkwrq6ylmzaf@smko5lyfrtnf>
 <db242035-8b03-48ad-b770-7c0d05480d6b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db242035-8b03-48ad-b770-7c0d05480d6b@oss.qualcomm.com>
X-Proofpoint-GUID: MwGNtKk7GNvugMHhoD9mTQJQ7Ndciw7J
X-Authority-Analysis: v=2.4 cv=ML5QXsZl c=1 sm=1 tr=0 ts=6a144f19 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=C6lEkYh6A9OejaXkjHgA:9 a=CjuIK1q_8ugA:10
 a=EXS-LbY8YePsIyqnH6vw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: MwGNtKk7GNvugMHhoD9mTQJQ7Ndciw7J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzOCBTYWx0ZWRfX9UK4tFPBZo7W
 QO9RnS0lY9/2Pfh3pj3Z1fZmCzw0mxccqerx9BzaazhJt4tgDV6vJqiDBKYu4IChQqUzgoV/cpZ
 4YvDhv+evsjj6Qk9f1Kw7CauEnbt18KGfUXkmq4iDj29skFuO2EwdBPrzYEnoURncmnY3BF77FR
 VJ2hrzVA4vJ3J+AEmqceC+96r6ZI9+xtObfVWvPUegWgwNB/jLamtY/w9PYXQpXXsK+URTafjgJ
 UNc8Xtm7tw512OwVgmnQmlfk5cgX8q4RQbCHj0cLlSKYgkCm9XJmN0fiqyHyXSUox4TF4EylU56
 vjWRBdQyHEX6a235fvwR7gWru2nGbQeBKU9Rfqaydb/EJ0JZNp4sun9C2eWn+taf+tqnZm8fpue
 PdKjdB/gGeD3/duwGMaB+pp2QBY0m6Q/ajf8mp6O+uyjzWx6fdkfL1KbXrwXofsxm9beErdtYjo
 hWsOeNWWVdrUjacs0Bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250138
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109666-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,quicinc.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 90DE15CB37A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 08:13:35PM +0800, Yongxing Mou wrote:
> 
> 
> On 5/25/2026 4:21 PM, Dmitry Baryshkov wrote:
> > On Mon, May 25, 2026 at 04:06:08PM +0800, Yongxing Mou wrote:
> > > 
> > > 
> > > On 4/12/2026 2:12 AM, Dmitry Baryshkov wrote:
> > > > On Fri, Apr 10, 2026 at 05:33:51PM +0800, Yongxing Mou wrote:
> > > > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > 
> > > > > Use the dp_panel's stream_id to adjust the offsets for stream 1 which will
> > > > > be used for MST in the dp_catalog.
> > > > 
> > > > Please start by describing the problem.
> > > > 
> > > Got it, thanks.
> > > > > Stream 1 share the same link clk with
> > > > > stream 0 with different reg offset. Also add additional register defines
> > > > > for stream 1.
> > > > > 
> > > > > Streams 2 and 3 are not covered here, as they use separate link clocks and
> > > > > require separate handling.
> > > > > 
> > > > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/dp/dp_ctrl.c  | 24 ++++++++++---
> > > > >    drivers/gpu/drm/msm/dp/dp_panel.c | 72 +++++++++++++++++++++++++++------------
> > > > >    drivers/gpu/drm/msm/dp/dp_reg.h   | 11 ++++++
> > > > >    3 files changed, 81 insertions(+), 26 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> > > > > index 3689642b7fc0..295c1161e6b7 100644
> > > > > --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> > > > > +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> > > > > @@ -332,6 +332,17 @@
> > > > >    #define DP_TPG_VIDEO_CONFIG_BPP_8BIT		(0x00000001)
> > > > >    #define DP_TPG_VIDEO_CONFIG_RGB			(0x00000004)
> > > > > +/* DP MST registers */
> > > > 
> > > > Which register spaces are they from?
> > > > 
> > > Here also from DPTX_*, what about this? /* DP_TX MST registers */
> > 
> > Why? don't separate them from the registers from the same space. Also,
> > please, name them uniformly. Why some of those are REG_DP1 and others
> > are MMSS_DP1?
> > 
> Hmm. So should I just delete this comments and sort them in ascending
> address order?

Yes, please

> Regarding REG_DP1_ and MMSS_DP1_, this is a historical naming
> convention inherited from the existing code.

I see. Maybe it would be more obvious with the followup patches.

> > > > > +#define REG_DP1_CONFIGURATION_CTRL		(0x00000400)
> > > > > +#define REG_DP1_SOFTWARE_MVID			(0x00000414)
> > > > > +#define REG_DP1_SOFTWARE_NVID			(0x00000418)
> > > > > +#define REG_DP1_TOTAL_HOR_VER			(0x0000041C)
> > > > > +#define REG_DP1_MISC1_MISC0			(0x0000042C)
> > > > > +#define MMSS_DP1_GENERIC0_0			(0x00000490)
> > > > > +#define MMSS_DP1_SDP_CFG			(0x000004E0)
> > > > > +#define MMSS_DP1_SDP_CFG2			(0x000004E4)
> > > > > +#define MMSS_DP1_SDP_CFG3			(0x000004E8)
> > > > > +
> > > > >    #define MMSS_DP_ASYNC_FIFO_CONFIG		(0x00000088)
> > > > >    #define REG_DP_PHY_AUX_INTERRUPT_CLEAR          (0x0000004C)
> > > > > 
> > 
> 

-- 
With best wishes
Dmitry

