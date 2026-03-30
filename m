Return-Path: <linux-arm-msm+bounces-100754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMIDFcFUymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:47:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5135C359A19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DFB3C303F81A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14DBE3BBA0B;
	Mon, 30 Mar 2026 10:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FviTyNg0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="esy7aEPh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BFA389DE8
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774866800; cv=none; b=CgR3WUSDAQBWX3LDmkzzKAOBtwObUR2b8PGnhEjW0e5nemv/rgfhfP04kXsaTyx6RJf/4tc/z7t9s8NjWEGp55M0v1ngNkNSQyY1lJCCaNPTMqTW9OTi1jWtjfh2EyELzb5eZ/gsGBGkYg+AeMTlCDrZQMfTJDy8GPAnYZbh9w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774866800; c=relaxed/simple;
	bh=xfZNctNz/i54/Oyb1sBaOsI5QEu+8pzOFZd/BZNOnYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZjipQnuSDcW6ToPS724Cro9/sdxBIuJZ3ScrGY/cJiB8VsWdOs+PloQMVRdYkMTqhVeC4UyYA3bs6sxX/PhQvlzQ1+FcuJgBpRoQ+ZWozJ0mNSSl+v1eQBHRTpxT0vllmyzns7CTSzf+YTEsqeQh6hUyHWRDjC49z3YQBEMcOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FviTyNg0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=esy7aEPh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U8PxwW2458337
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2w7omVV5MGhgUuytY9/a+Hrv
	/Zkn5JBJZX3qNOAW4dI=; b=FviTyNg07d3LeINqlYTW6MooVmHX2v0TPesAwWwr
	NKH2RGSEYwoODh5Vd5fb12GmzgoKbG6+pDbe1Bm7sD1STgldoGvqHyAHUwTlIV9Y
	RhwgDlLSrmCmEasOJrIhIATDYOg+6KY+xIc7YTnQxseq9aObPO1p0oA0FwKa/LDv
	Ii8wps687/YtfmztuFzldRFPRfU4FtTXo7TFbiEhQwDh9udI0uGLpK3k3aPioZPo
	GZb+q/+cOD2hZ3pC3+k4Hm2aJIqLxjQRjjA0Z6Jq4RbnQp1nkXaBvbWbpDrhpHY8
	3An8oNm6Icc+KNggH9PpsBRmQoAEffcTDEI0VlBSokKTAg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7nnmrh6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:33:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5094ba09affso127208941cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 03:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774866797; x=1775471597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2w7omVV5MGhgUuytY9/a+Hrv/Zkn5JBJZX3qNOAW4dI=;
        b=esy7aEPhNmj1lLuc28Z5Q8M0Ju7WZ4u+JkHre3q3lVBicj2Fr/VZyNL3PbOQBXekGf
         fwd+AWo3t9vA9Ax4mbhz/hdxKP8DVmJGMTm305ReMTXyl1R0JNhfGsK2UoR8kW0+Zohr
         kYTfmmvPz21eDtr5/zP+qMdMhwEIAAVCtIjUpJ9DqwVEUpnzIaYnMwnAbAGPPGFcwTRH
         VskG7KYtd/XW1phGHn3I1tD8T4xEqE/K7IWYJqaV06X/FgxUVW6Mc9tM5uXMDCnRRz0z
         bBM3s6PtB89EdMwxbW4dFvPesTudAAdHycloJypWKYmX55vJ5+xhvjC6CvkZDGWH0Xzx
         Ux0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774866797; x=1775471597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2w7omVV5MGhgUuytY9/a+Hrv/Zkn5JBJZX3qNOAW4dI=;
        b=nBoQ9oDAxFsrtruV1MvPWIXedAUEB7lr3p1leapLIB26gwEqrmVxIRm6ZctckZfpB7
         HUiJ+H68amcX6bQjf1Ico0oIAmQ1cOYBoH9dtj3sKAaK7V+SzOSsMYxChH//RQfWP4i+
         /RveqKBDH8NX1QtEY+TINx7VojSRzK9fHluBRsa6N+6+lDSRNKdaL7ADnqHJQjO7hEvZ
         JvoYDe6XaRY0Q7aIH624M6mmEG9d7HPa2h+5dByDU9moAjTpHUfSou3ZigZGDVCU8+LX
         CeHURA6VaaVe8fcHgQnh/vXJYRgY3Vqe01iSnwq4UFa9o/TXtAz0S/8I7L9/Y0ekpD2Q
         kfzA==
X-Forwarded-Encrypted: i=1; AJvYcCUs5v3U272E9sSjOjIJBgKqd5FwJBTMdn8hftSjKWKw0KqoeXO4lFt3SMmKd6XuHVr35lW883gz8ihrQrVk@vger.kernel.org
X-Gm-Message-State: AOJu0YyfxD/HUj7T3yb/5YuVWA1SOA92n9NGp/3WRiXC9R07s+WFPqH3
	CqmXLS0DJlnkjAL+/731xC2dMjrvto/AgycApAM9iQEx2FrhfikaECy7lKpk2avjlk5DpWaoqFa
	x9SYGf/cmo2kpUvTadpTR6umxAZZl5oZbjbVqydvh+1ShiJ/tB53C9fXCVUMm72BF3a1v
X-Gm-Gg: ATEYQzzsQkJ+aOzIStK2Qfv/VAoQ0Z7C1vy1kfnj2nugVDgvevXjNIEWj91r3Ufg26/
	JpY5ifZjhFEchO/Qeq/oepfX4lQGTWM3Z0qQD0MPQw7XAVyCbRhN4v9HthP9qPkIlIMqEPLS2Yj
	ZqRvSb+N/WGreWHyo4iLZCr/QxSem1cBySe+6k/FaqrAwC4JkAu0RKxWyyye1Aeq567qEl32mlm
	2amoGFxYL3o+6vvEZt7w+Qfgq+O6wXd2CgB2T9LrCIWqAHaangATCS7Kp12pZT8PTFB2qnqFyCy
	BcXOodNkmXXsWtn2VnwIkmSzyjCIjGU2LPKotlK/JhGToJ2ZNX8PRqItLK2fZEdtB+GNONW7vbZ
	x/Kg7xytuVO+jV0dEmdjMpfUu6d8KhPJZ8vv1ekrwoI4X+WwoPU1RXOAKCD6OApoNXoYAZGy3Cv
	heG4TfZ4n8VrT4z3zHpF+e+UEp02QxmAYSR3w=
X-Received: by 2002:a05:622a:345:b0:509:f36:496d with SMTP id d75a77b69052e-50ba395d137mr157807911cf.33.1774866797218;
        Mon, 30 Mar 2026 03:33:17 -0700 (PDT)
X-Received: by 2002:a05:622a:345:b0:509:f36:496d with SMTP id d75a77b69052e-50ba395d137mr157807491cf.33.1774866796688;
        Mon, 30 Mar 2026 03:33:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f429fsm1563883e87.2.2026.03.30.03.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:33:15 -0700 (PDT)
Date: Mon, 30 Mar 2026 13:33:13 +0300
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/38] drm/msm/dp: splite msm_dp_ctrl_config_ctrl()
 into link parts and stream parts
Message-ID: <r4dtuhse2v2i33x56fjymlouk4ue4ftj2ff7pt3scsgoknegc2@innzpujxngit>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-5-01faacfcdedd@oss.qualcomm.com>
 <vvemyg2t3ycjwb3uhwua7ow6yjvo2mnu5tdrqc3ed3iuj5ue3v@bfvgfhcxbgke>
 <e9d15987-7c8a-4ec6-8c65-a882139ba0cb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9d15987-7c8a-4ec6-8c65-a882139ba0cb@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4MiBTYWx0ZWRfX7UhjxqLTIxte
 KDTANJWLtioKZcjaGk2TTxsN0Ovi+6+MdrVEPvFUfjS9R3zhlX5WyM/k2WY3NURyOUDabWr4H+s
 HhEbeWEaWX451ApnnbpidRI2FkCnaJra5O0ezitCD1cCUjj2JyrNuh2qHRLPG+ctMy3i47Ckg6n
 Xhh6IZ68WqKBuVCueW37oWT/sq0A09kiJOqS4tENg/tsbPFGRk9nW6R4Fi60erqJyU8qmwQC3In
 NlLC0jhkSCrd/6cdrEoeh3eAoyOz2z+YDeE3Vx1Sl2WAH95YtLvnBQhFMy4PftvvcCfZbu2sw9j
 0t1bjYPbhU3LjAVkXhelzCERtUIALNzO+gNnQHeANJFJPTYsBvNVAuYMpoO5hCV6OA6/8n8iAk8
 dBZJtYCeKEzS+LRGJqNFS8+XwzrxNbWHtZOLlU/2o9h2/vZvJv4uVb6yVDXfv02JQMiu10iEgrm
 j88lHysAcqufp6CYjAQ==
X-Authority-Analysis: v=2.4 cv=M4FA6iws c=1 sm=1 tr=0 ts=69ca516e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=oLyNmjNKlfozL-9H-OIA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 7jZEDqzvxPxPc5CsHwJ6BmKenBxqyEHN
X-Proofpoint-ORIG-GUID: 7jZEDqzvxPxPc5CsHwJ6BmKenBxqyEHN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300082
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100754-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5135C359A19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 05:00:56PM +0800, Yongxing Mou wrote:
> 
> 
> On 8/26/2025 1:28 AM, Dmitry Baryshkov wrote:
> > On Mon, Aug 25, 2025 at 10:15:51PM +0800, Yongxing Mou wrote:
> > > The DP_CONFIGURATION_CTRL register contains both link-level and
> > > stream-specific fields. Currently, msm_dp_ctrl_config_ctrl() configures
> > > all of them together, which makes it harder to support MST.
> > > 
> > > This patch separates the configuration into two functions:
> > 
> > git grep "This patch" Documentation/process
> > Got it. Will fix it next patch.
> > > - msm_dp_ctrl_config_ctrl_link(): handles link-related fields
> > > - msm_dp_ctrl_config_ctrl_streams(): handles stream-specific fields
> > > 
> > > It also moves the link-related configuration out of
> > > msm_dp_ctrl_configure_source_params().
> > 
> > Why? And it looks like a separate patch...
> > 
> Because the patches following msm_dp_ctrl_configure_source_params() will
> take a panel parameter, and lane_mapping and peripheral_flush seem to be
> more closely related to the link, they have been moved out.

This still looks like a separate patch.

> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.c | 49 +++++++++++++++++++++++++---------------
> > >   1 file changed, 31 insertions(+), 18 deletions(-)
> > > 

-- 
With best wishes
Dmitry

