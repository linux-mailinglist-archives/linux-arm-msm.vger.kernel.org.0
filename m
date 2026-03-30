Return-Path: <linux-arm-msm+bounces-100760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +I9jBV5Uymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:45:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 671253599ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB1C43043BF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA80C2749EA;
	Mon, 30 Mar 2026 10:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HwCDMRH1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JdxA8MPt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC4D3B5307
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867165; cv=none; b=HpHVCupBZcHNGSdlInLyD/8Bbmi8jPi2sqz7micX4AxhJl3NGlWvF9L/FwhX+Je1MyQCH6z4UetblrGr5QS2XbgolsNxZg+VtvPEsGJL0Xx5GbvfyI/J7q1ZDYXh/byj/GcB0kVPbXhdPCPoA7dtipboqvJJVOPQ0SBaJpQzF5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867165; c=relaxed/simple;
	bh=q7f7efaBmTtyfAY3R8YAFm+rOQqH7AjeG2sjsL95YJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bn87uflMIKIhTO1r0g9L2mPdNiHw3XWV28eBYBV5k2JRJSYfuil7mGHkyAW/yyTd40ExfOxOk3MwPseL27IS8q71czVp49/XFmkborScbB0f5NSpGg6MOi2s8JkBUBIKIIHVUAJt42N5WkJfMTOfvFR8KNtc2QD/TKPPi9q+Qf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HwCDMRH1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JdxA8MPt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UAGuK53176220
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a9i9wrLS9XNkBua3QA++xjrO
	xjkkqC29YQgu3tBNhLI=; b=HwCDMRH1XWzCE4KKq7grLfD1WJmh6yWbX6Or3xeL
	9eFlssE1zhIJeOvFHZIQquZoeMezdrdbpJcU0xOI3Hcx4XByF2kSPPmy+wzi5kco
	XZqu0JgzcCQTPOcZeqaapt8cLMA+sBR4jN4Px9a/gfArg1XRvXhoTOawtj/sWU7H
	aiwrNKuot13cm9t7gd1pVcDHLjgAjXOUcJNd/+CX2pwqppBZHtn3f7rfqeUoqZqQ
	jHbeTG4Db+aRdmElmheQ+1XcEZAZqH+3o2WfmRZ3BE+Pc18V2NjopIFgWJDOlilY
	EWsh6q8QJnpKGXxNXbRWAafS/SbG7h5+MbeELmwzlXxQ7Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q9h02cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:39:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50925fed647so142399501cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 03:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774867163; x=1775471963; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a9i9wrLS9XNkBua3QA++xjrOxjkkqC29YQgu3tBNhLI=;
        b=JdxA8MPtQyWTwdmeBZhJ3K9tXLYyBbiZAM3YtPAr2+GoMybHvmQb7mQktRIF1gw8qw
         VGQOT/3EOU8EOPhnnFLwZ9S801XL/j4uypgIeq/LVOt+uioKlg/JopmUHkDyiQ7+ZXj7
         WGU1oB0r3IgDbIz4ifXLjMXTG/9Ft4LGDA5bepGJ4UuYVuBdwhWZTdIXZWdhQW2GBiGP
         DHRU+GE+6fGhrPA7obVCbh8xDTk4thLEWHlL1SYQiWcmjvZTkoIkFEdB8ZyH14jz04FR
         4uiPknq1KZW8y+knvMqpnfZdx2+0XHNpN4L8onAVTrIZRkyAg4+aOlxe0dPZKJHVg2un
         lx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867163; x=1775471963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9i9wrLS9XNkBua3QA++xjrOxjkkqC29YQgu3tBNhLI=;
        b=aIrEyHM7P0VeSnILyEOsg3UuHx0r3nVsrp2DtjhUMGtc12dZGP1pVJQEmaH4FWSMqH
         WrSde5qEio+e8ZrwGbsejaOwS9QGTUuxTev1zygPHTleEFBQCFwDT3oe0lKuhmbdRLxz
         r0rqD6PONMasMoNxJSU2xprsiNrJeR6TMitGVrdZNLnurF7ECMvaQmIWtdoUEpr08bRu
         EEtfO7iUqxbiYeHb0We9sgnmOurK2D4BL/DwthDWFO4rsmyAU5bHmNt1a/joMCXSr3Df
         f5/xla24kVGQTllI5Jlcv/H6B/jrkwYlDatlxOVgzzdBig9rnypPvJ7u6P2UmWM4Hf/Q
         3iCA==
X-Forwarded-Encrypted: i=1; AJvYcCXUVv+MayE8iswV1mbirJ82x4ztC4OStyamCYx2SZ2ylbQN73wqNkZBjtKjcNDBmL6Aej4a+3aND7r/3G0R@vger.kernel.org
X-Gm-Message-State: AOJu0YzCmrLbhnx98CBgf9kIhWB9gUe2mP1sp5BuSdNrkxifyhNSsj/U
	OztKcOD24z/PheczWudAlbcsszfzUcYdK37L+sEM6COD2/6XMI6gTqRINvyPfPO1basY8E1A7Ii
	CarqjZuYMjqEISn1IBMnHvhTcH6NiAP+NN11pOGym4Q9yw6AqnN0tPIqjbrIMWQNgBihL
X-Gm-Gg: ATEYQzzxhJh8R9kohlNYaiJkctaOSuCaiUuutym81bUC/naym9QWi9ni5n7yzJZ8W1/
	VScH9eWD1XFq2kYFeHnqA3Q8ncfLbOzk9Xaxs9HTERaBR1GHL5cBhAOnz5KcSmNiCwdulAlQtKW
	+vrylK2S7iNHHfq0RhYMO74L7ACXh30IsPpDnDL746VZmlBiQ17X1OGvNcQNY3nVffG1BCpnVnK
	VYfSf9VQ8ikFosx0DnrdMRzyS6A0YDGffPxes8VyBa8GmtyHH/RLAuignBlqhEY0ZZ+a6gzzQhd
	T1fiY+rX1P0L3TsBKt5f08MhUcZ+dz3YtgXHZhycTjX/+QIMPEWH8H8ExdEvDTpyY3lbj4cLc76
	DbIOpmHIAlDnxEdEy66M73hgosbf4OIFo3IdNqpBg/ovKoEbU4qwd4ssj74aErYROi5yRDXDARH
	Cnbt575TLiXRBEsxim9EHym9PXM8uPZfhkwMs=
X-Received: by 2002:ac8:5814:0:b0:50b:526c:541c with SMTP id d75a77b69052e-50ba3990f78mr156194491cf.50.1774867162594;
        Mon, 30 Mar 2026 03:39:22 -0700 (PDT)
X-Received: by 2002:ac8:5814:0:b0:50b:526c:541c with SMTP id d75a77b69052e-50ba3990f78mr156194271cf.50.1774867162120;
        Mon, 30 Mar 2026 03:39:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838dece4sm14492121fa.35.2026.03.30.03.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:39:21 -0700 (PDT)
Date: Mon, 30 Mar 2026 13:39:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 14/38] drm/msm/dp: Add support for programming
 p1/p2/p3 register blocks
Message-ID: <ssiui2np2gvy3euj77t6rzpnvwzd6plnxaed6xpn3awj3fzswd@utphaip4lr7p>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-14-01faacfcdedd@oss.qualcomm.com>
 <34he7xawyuq5z4iiyq4y4ehkjhfalx2vxhtejgyxly4zgyqma7@4uqoas4sz3nl>
 <bd0fa742-fcba-47a8-81fa-aa43d9ff4edd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd0fa742-fcba-47a8-81fa-aa43d9ff4edd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4MyBTYWx0ZWRfX2AsyFE7TPtK3
 1/a47isWrLhBaLNK7Jk5gqCL2z3/4R+fE+zhr+Pe7YE3iQjQMbdk5tBtaZgVllwMJnJz+cIq5L5
 QWFDYmY5GA/y62dSi2meDRWa0FilorcyZ+ZtjFCmzefDesT5ZcXtb+JsZUpOWvMd7x8m9tYbQYF
 akpu6eZ314FvSuhjpwR/uPTNOm66tY7fNAi7e2E4b5U69SaP+1wBtDwYB/aQIO6F6LhoiE6uTQs
 hXs+YL/xFL+pLzUppVNgs1siynyYrbhKhq8DAspSKSnO3xZcpO5NHvanZc95LGEnxmAjna7yYGJ
 eE0QsIeMAHlWYf9LM7w44ULs/93ZKqUJlLSL0rZXUg7H4gcGFo7qTESda8HyF+zI+S6aDu0k9TP
 /tWc8oQWaVrEmLoqDFRdQMFqNR61ScICuD3wlBp+NTOFsetKoX9R+mu33uMl6O7W0Z2fRyy/rEm
 n6jDmPFvCwQmuiqfLEg==
X-Authority-Analysis: v=2.4 cv=AZS83nXG c=1 sm=1 tr=0 ts=69ca52db cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=M3gvwMrBDJyNMj2JsOwA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: p_C_ghAg1OITpRlbJ8FiI8gztRO3qLEd
X-Proofpoint-ORIG-GUID: p_C_ghAg1OITpRlbJ8FiI8gztRO3qLEd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300083
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100760-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quicinc.com:email];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 671253599ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 06:27:41PM +0800, Yongxing Mou wrote:
> 
> 
> On 8/26/2025 1:59 AM, Dmitry Baryshkov wrote:
> > On Mon, Aug 25, 2025 at 10:16:00PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > QCS8300 supports 4-stream MST. This patch adds support for the additional
> > > pixel register blocks (p1, p2, p3), enabling multi-stream configurations.
> > > 
> > > To reduce code duplication, introduce helper functions msm_dp_read_pn and
> > > msm_dp_write_pn. All pixel clocks (PCLKs) share the same register layout,
> > > but use different base addresses.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 39 +++++++++++++--------
> > >   drivers/gpu/drm/msm/dp/dp_panel.c   | 68 ++++++++++++++++++-------------------
> > >   2 files changed, 59 insertions(+), 48 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 3422f18bdec71a99407edfe943d31957d0e8847a..935a0c57a928b15a1e9a6f1fab2576b7b09acb8e 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -84,8 +84,8 @@ struct msm_dp_display_private {
> > >   	void __iomem *link_base;
> > >   	size_t link_len;
> > > -	void __iomem *p0_base;
> > > -	size_t p0_len;
> > > +	void __iomem *pixel_base[DP_STREAM_MAX];
> > > +	size_t pixel_len;
> > >   	int max_stream;
> > >   };
> > > @@ -619,7 +619,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
> > >   		goto error_link;
> > >   	}
> > > -	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->p0_base);
> > > +	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->pixel_base);
> > 
> > Why do we need to pass pixel base here? Shouldn't it be pixel_base[P0]?
> > 
> In the current implementation, dp->panel holds the full
> pixel_base[DP_STREAM_MAX] instead of just the pixel base corresponding to
> itself, so this likely needs to be revisited.
> 
> > >   	if (IS_ERR(dp->panel)) {
> > >   		rc = PTR_ERR(dp->panel);
> > >   		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
> > > @@ -937,8 +937,8 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
> > >   				    msm_dp_display->aux_base, "dp_aux");
> > >   	msm_disp_snapshot_add_block(disp_state, msm_dp_display->link_len,
> > >   				    msm_dp_display->link_base, "dp_link");
> > > -	msm_disp_snapshot_add_block(disp_state, msm_dp_display->p0_len,
> > > -				    msm_dp_display->p0_base, "dp_p0");
> > > +	msm_disp_snapshot_add_block(disp_state, msm_dp_display->pixel_len,
> > > +				    msm_dp_display->pixel_base[0], "dp_p0");
> > 
> > This should add all blocks used on this platform.
> > 
> Let mark to be done here. Since a helper function is required here to check
> whether the pixel clocks for stream 1/2/3 are really enabled.

I don't understand the comment.

> > >   }
> > >   void msm_dp_display_set_psr(struct msm_dp *msm_dp_display, bool enter)
> > > @@ -1181,12 +1181,13 @@ static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_
> > >   #define DP_DEFAULT_AUX_SIZE	0x0200
> > >   #define DP_DEFAULT_LINK_OFFSET	0x0400
> > >   #define DP_DEFAULT_LINK_SIZE	0x0C00
> > > -#define DP_DEFAULT_P0_OFFSET	0x1000
> > > -#define DP_DEFAULT_P0_SIZE	0x0400
> > > +#define DP_DEFAULT_PIXEL_OFFSET	0x1000
> > > +#define DP_DEFAULT_PIXEL_SIZE	0x0400
> > 
> > No need to touch this. It's only required for legacy bindings.
> > 
> Thanks, will fix it.
> > >   static int msm_dp_display_get_io(struct msm_dp_display_private *display)
> > >   {
> > >   	struct platform_device *pdev = display->msm_dp_display.pdev;
> > > +	int i;
> > >   	display->ahb_base = msm_dp_ioremap(pdev, 0, &display->ahb_len);
> > >   	if (IS_ERR(display->ahb_base))
> > > @@ -1206,7 +1207,7 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
> > >   		 * reg is specified, so fill in the sub-region offsets and
> > >   		 * lengths based on this single region.
> > >   		 */
> > > -		if (display->ahb_len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
> > > +		if (display->ahb_len < DP_DEFAULT_PIXEL_OFFSET + DP_DEFAULT_PIXEL_SIZE) {
> > >   			DRM_ERROR("legacy memory region not large enough\n");
> > >   			return -EINVAL;
> > >   		}
> > > @@ -1216,8 +1217,10 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
> > >   		display->aux_len = DP_DEFAULT_AUX_SIZE;
> > >   		display->link_base = display->ahb_base + DP_DEFAULT_LINK_OFFSET;
> > >   		display->link_len = DP_DEFAULT_LINK_SIZE;
> > > -		display->p0_base = display->ahb_base + DP_DEFAULT_P0_OFFSET;
> > > -		display->p0_len = DP_DEFAULT_P0_SIZE;
> > > +		for (i = DP_STREAM_0; i < display->max_stream; i++)
> > > +			display->pixel_base[i] = display->ahb_base +
> > > +						 (i+1) * DP_DEFAULT_PIXEL_OFFSET;
> > > +		display->pixel_len = DP_DEFAULT_PIXEL_SIZE;
> > >   		return 0;
> > >   	}
> > > @@ -1228,10 +1231,18 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
> > >   		return PTR_ERR(display->link_base);
> > >   	}
> > > -	display->p0_base = msm_dp_ioremap(pdev, 3, &display->p0_len);
> > > -	if (IS_ERR(display->p0_base)) {
> > > -		DRM_ERROR("unable to remap p0 region: %pe\n", display->p0_base);
> > > -		return PTR_ERR(display->p0_base);
> > > +	display->pixel_base[0] = msm_dp_ioremap(pdev, 3, &display->pixel_len);
> > > +	if (IS_ERR(display->pixel_base[0])) {
> > > +		DRM_ERROR("unable to remap p0 region: %pe\n", display->pixel_base[0]);
> > > +		return PTR_ERR(display->pixel_base[0]);
> > > +	}
> > > +
> > > +	for (i = DP_STREAM_1; i < display->max_stream; i++) {
> > > +		/* pixels clk reg index start from 3*/
> > > +		display->pixel_base[i] = msm_dp_ioremap(pdev, i + 3, &display->pixel_len);
> > > +		if (IS_ERR(display->pixel_base[i]))
> > > +			DRM_DEBUG_DP("unable to remap p%d region: %pe\n", i,
> > > +					      display->pixel_base[i]);
> > >   	}
> > >   	return 0;
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> > > index eae125972934bb2fb3b716dc47ae71cd0421bd1a..e8c1cf0c7dab7217b8bfe7ecd586af33d7547ca9 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> > > @@ -26,7 +26,7 @@ struct msm_dp_panel_private {
> > >   	struct drm_dp_aux *aux;
> > >   	struct msm_dp_link *link;
> > >   	void __iomem *link_base;
> > > -	void __iomem *p0_base;
> > > +	void __iomem *pixel_base[DP_STREAM_MAX];
> > >   	bool panel_on;
> > >   };
> > > @@ -45,24 +45,24 @@ static inline void msm_dp_write_link(struct msm_dp_panel_private *panel,
> > >   	writel(data, panel->link_base + offset);
> > >   }
> > > -static inline void msm_dp_write_p0(struct msm_dp_panel_private *panel,
> > > +static inline void msm_dp_write_pn(struct msm_dp_panel_private *panel,
> > >   			       u32 offset, u32 data)
> > 
> > Is it really multiplexed on the panel level? I'd assume that each panel
> > is connected to only one stream instance... If that's not the case, such
> > details must be explained in the commit message.
> > 
> Yes, each panel is connected to only one stream instance. We just use
> **pixel_base + stream_id to determine which pixel block the request should
> be sent to. Just like your first comment, do you mean that the panel should
> only carry the pixel block address corresponding to itself, rather than the
> 4 blocks?

Yes.


-- 
With best wishes
Dmitry

