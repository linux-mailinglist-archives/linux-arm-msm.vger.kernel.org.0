Return-Path: <linux-arm-msm+bounces-109667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AqIOW9PFGqnMQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:32:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6165CB2AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 15:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F053730058E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 13:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C28F3859D3;
	Mon, 25 May 2026 13:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y9hbBT09";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eTbwaxMx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFC0384CFF
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779715949; cv=none; b=qJ6nvPFN35xxPkhXdMp6+euRRk9SJ83OCbTdvY/QlBGr46LOE+7Nu4YQrEWv6ebYq0akaHC0tTPCfN6Yjfje4UaPuUHBenDIkAdvDr9NLjBtJeDagtPd6lYWOPSJ1Y6k2HbJ0hcuiUV2LhgkxMVwYGO6PNEw4qmV30k/vGPVJcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779715949; c=relaxed/simple;
	bh=bGeTeTNU2mAZRXpBjHrnGlbfnhuw8uGeqayX1fPxOw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FxRWoUE9NuF5eV9FWjSxRx4eBL4PvG3F1wlZOtqezRzIe18+snNXZVnv6kOMhvfmdxPlFSkfk8RteRNbojhyATJCZN6wtkYtPnvz8K3n69kXOG9rZnnXchkrY0DsAGSBIr+UDF7bbBled3HTxjdjPcdWQuoM5IGf0H5FYmO+9Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y9hbBT09; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eTbwaxMx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PD265r691637
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w7FmZpcTa1770YwRUngtr9kv
	50A0u+VdLPdImEuE8vo=; b=Y9hbBT09rYqNTqtaPtKPPFay5kQXxRVwpiuzd4pv
	0pOZxXHTYE69Cmetug0ZCcbfdysc//qZ2CIj1kkuuVq1yrbOYcgRWc78Q5AWmE1o
	Ox218RzYX2MTfIgwE+lZjZOnLZhHlUZEd2g4pPrkor+CvX/eUfzcof+KfhztomfN
	q51PtCMx+5yZrWk3zKJsZzWQNS13hRf+3SNBnvmNhIUAjy3uHJIKDuuQNFOCAAFP
	Nbirm/k/UDnf8Z2j6yL4+ixhxU1zOtjBI2pixiTCDhgjufMad2NiWSeT9xdTU/vO
	gJOtC9/WbNAN5F4YMDx9DtzTx0sZWBDQIiYJeH9meCbnOQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpy2g3sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 13:32:26 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e60737a964so1835855a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779715946; x=1780320746; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w7FmZpcTa1770YwRUngtr9kv50A0u+VdLPdImEuE8vo=;
        b=eTbwaxMxIEQlm4EVhoSguO8dTIiLavMxPL5Jor7Q+Ua33j0kmYaq5igj8Mf8zfmray
         ZfhZA+uFJf30HLSBkxm5vcR4ftx6HJ1yrIK6nX1uObXfX7b4nrdHi2BwPZQjr1hlJPJ7
         QeI88qMZqFS0ef4/FYTObh1wH+na3Lt9JrEex7Te2Dutx6jrAlOMzPIY92F5UjIaOs0z
         X9ip7PxE08U97hoR8Ix2kXYXuVGMstXi99dk9w5VqLbQov9cNwjkQvrRiBxsnZGRXpc3
         UjfyzvhWQKdr+7SyonmS3cxzaWWbn4MXqTQdPLsJlTbx4h11JnEZUBsF4L6BpKSYkJNU
         Gk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779715946; x=1780320746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7FmZpcTa1770YwRUngtr9kv50A0u+VdLPdImEuE8vo=;
        b=KuWlR80JMLF2soVEdbUzUcSRtJv8qzkOUGsS45HG6CI+KuQZ3km20dtT0CzADceKbA
         lBcB5R+7OKxrH6j6z6lkdjC2uqdpaf9a5ispeBqphYslP/LbRIBRpMGNS6HyF5+G6wXB
         Xqjv/PrElC/i2Rox++pc2YJqcnGWlcfU15Z78feG9MKjouxpOxVfdllGHrh1MuAb9h/l
         xYPcvI9HONVkmnsWtdJE0MFTBPd2J856b58sHg2vw+UhcxbQQbCP6kw+OP2ZXVZbJprM
         MFA09jzXwfhIB8rv+jjZjv5CeFZwxXjcdQgNfhRo7ZGutQ2yjREk4eVe6ohUoQety+s5
         uF0g==
X-Forwarded-Encrypted: i=1; AFNElJ9UyFkovQujM6Aapg4J4VG0dndLHJKwKZRciACZEWD+iamXvR/FwcSUjYgBkXP56lwtrz7O0Vw8E8m3Yz2n@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6IvC67Z908LOejnVsGKplMwAhR0h70LHm58a29N6QBQhrsTWI
	KxJ3lnMktEyF+68Hp7S6mMmmfRkhl1yYSnXtYkPkcxgKuuKkYQZqRZfeP7v44cFg2VpdlomCZW/
	faiPsqVjLsON0NrMES9yqLrgWKMEphWmZduknrqvFYlGsY1O+Qt+eLuEx+FFzYXL2x6hG
X-Gm-Gg: Acq92OHKeh6ynJYApGILKEWq43Sjqb7nwTMJfQ4MSy8lSXFLItpmCFkNdcrLLrT9+rc
	bO4oLY3mcRIAJNHQaa/wBpuC2202sBZGa66nzWbZk9OtvVXgJyd08b5CBjwYfUv7UMoLBBekXtg
	k1nGZ4+HyN7LIFdPMXfnKAKnD8d5fWFkRmy1ujYck/g2a/UXAZKGaibCIVjChuf86F69ZlLapNL
	fAmFnxeF6ILIDIeQnMP1TSPxW2cMwCwZBgdGYf0OpYX11DO30C5ttvm2xrYZsW418Zs8AV9z0ZN
	Y4wE/Kd2gsQv4AKT0r56TOhZKtaNijb/96jJNeHAW6P5/1/r2xouOacNfSKceGJCsj1GCb0UKMp
	godEh7OgzkCfijLnSBoHsGgX8iwN9WY8z418WuiO2LVTyy3X9WtXO+PoKJVPwUZOq+ksLDR0w8O
	BVQQtqI55dZhweFF26Aa4tWO0GOAxvR1IYQI0=
X-Received: by 2002:a05:6830:3887:b0:7dc:c338:d23d with SMTP id 46e09a7af769-7e5fee9bb75mr9585809a34.14.1779715945985;
        Mon, 25 May 2026 06:32:25 -0700 (PDT)
X-Received: by 2002:a05:6830:3887:b0:7dc:c338:d23d with SMTP id 46e09a7af769-7e5fee9bb75mr9585767a34.14.1779715945539;
        Mon, 25 May 2026 06:32:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cb3689sm2722845e87.5.2026.05.25.06.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 06:32:24 -0700 (PDT)
Date: Mon, 25 May 2026 16:32:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 17/39] drm/msm/dp: Add catalog support for 3rd/4th
 stream MST
Message-ID: <m5a2dsnyrxiexzvmqigpfbfzeopai6eqceph7nces4yp2ywbic@qvyl75b2axf3>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-17-b20518dea8de@oss.qualcomm.com>
 <roqivmstbvdd7mhyyljhmzxv5njvuqqgjdn5gkekzrclhveozx@fougiain3kfh>
 <2ef51545-e3e9-446b-a97e-a01d02fc4863@oss.qualcomm.com>
 <4t6jaqelrjdcoczdtnig5pwpsm4fj3fxo4sqh7222dh26dzq3o@yc3t7y2amsl3>
 <339aac36-db5a-4013-aa7f-58715f3fb9d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <339aac36-db5a-4013-aa7f-58715f3fb9d3@oss.qualcomm.com>
X-Proofpoint-GUID: s4LW8WdZdbXtrTzwnvp6UfwsC5tz3HW2
X-Authority-Analysis: v=2.4 cv=ML5QXsZl c=1 sm=1 tr=0 ts=6a144f6a cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=uxpCQ_6U4hnA4gofv-oA:9 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: s4LW8WdZdbXtrTzwnvp6UfwsC5tz3HW2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzOCBTYWx0ZWRfX28QZM73kFX90
 GVw6+sl/tTbSMVDZ9wGcA6ANrOkF0lOrBDrb2igEO6S9vA3Pql9ZJFMdNC16LNasq7qhgTkfq2l
 S6L9DpCwRg08mUsKnGOmwmsQkys6MDcODF1LLuqrPtOTqr4ivGKD8NjBnYsPL0+/1Expkt7MpFh
 /pRraX2CfQ7gi8iidPJOzlnmelMWpyzYcTjzj8JoRHx8G6w7kohw39t6Hnkw8eWVRlli/xmQb4F
 lJ0BWCI2u2NefOmuwdhUU7bfWdLP5vLoOh6p/b4kYNOkuL31E9RpOgYRNJItPDpXWTt244S7xKQ
 lyALtFByCm9ZYV+Wsf04XSihpxBSm99xea/t+Rkr/gpS0TkqGuFKx3xoHcaE+riMOoWCGx1eSBh
 lL0lwVWBHDGS9nUpZ6+OkoSAcEdkydb1Lg6OafEmgFnmhhkePJZOXDQ5biQDEXX7s7LPuM7ft3e
 NL7vkXk8GzHrrizH4iQ==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109667-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8B6165CB2AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 08:01:09PM +0800, Yongxing Mou wrote:
> 
> 
> On 5/25/2026 4:25 PM, Dmitry Baryshkov wrote:
> > On Mon, May 25, 2026 at 04:06:17PM +0800, Yongxing Mou wrote:
> > > 
> > > 
> > > On 4/12/2026 2:24 AM, Dmitry Baryshkov wrote:
> > > > Nit, there is no catalog anymore, please fix the subject line.
> > > > 
> > > > On Fri, Apr 10, 2026 at 05:33:52PM +0800, Yongxing Mou wrote:
> > > > > To support 4-stream MST, the link clocks for stream 3 and stream 4 are
> > > > > controlled by MST_2_LCLK and MST_3_LCLK which share the same register
> > > > > definitions but use different base addresses.
> > > > > 
> > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/dp/dp_ctrl.c    | 225 ++++++++++++++++++++++--------------
> > > > >    drivers/gpu/drm/msm/dp/dp_ctrl.h    |   4 +-
> > > > >    drivers/gpu/drm/msm/dp/dp_display.c |  24 +++-
> > > > >    drivers/gpu/drm/msm/dp/dp_panel.c   | 135 +++++++++++++++++-----
> > > > >    drivers/gpu/drm/msm/dp/dp_panel.h   |   2 +
> > > > >    drivers/gpu/drm/msm/dp/dp_reg.h     |  16 ++-
> > > > >    6 files changed, 283 insertions(+), 123 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > > index a52bcd9ea2a3..1109b2df21be 100644
> > > > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > > @@ -118,6 +118,8 @@ struct msm_dp_ctrl_private {
> > > > >    	struct msm_dp_link *link;
> > > > >    	void __iomem *ahb_base;
> > > > >    	void __iomem *link_base;
> > > > > +	void __iomem *mst2link_base;
> > > > > +	void __iomem *mst3link_base;
> > > > >    	struct phy *phy;
> > > > > @@ -158,19 +160,45 @@ static inline void msm_dp_write_ahb(struct msm_dp_ctrl_private *ctrl,
> > > > >    	writel(data, ctrl->ahb_base + offset);
> > > > >    }
> > > > > -static inline u32 msm_dp_read_link(struct msm_dp_ctrl_private *ctrl, u32 offset)
> > > > > +static inline u32 msm_dp_read_link(struct msm_dp_ctrl_private *ctrl,
> > > > > +				   enum msm_dp_stream_id stream_id, u32 offset)
> > > > >    {
> > > > > -	return readl_relaxed(ctrl->link_base + offset);
> > > > > +	switch (stream_id) {
> > > > > +	case DP_STREAM_0:
> > > > > +	case DP_STREAM_1:
> > > > 
> > > > Continuing the comment from the previous patch:
> > > > 
> > > > Or, can we remap all offsets here? It would be much, much easier to
> > > > always pass REG_DP_foo and then here, in the link reading code, remap
> > > > the offsets for DP_STREAM_1.
> > > > 
> > > The stream 1 offsets relative to stream 0 are not uniform:
> > >      REG_DP_CONFIGURATION_CTRL  0x008 -> 0x400  (diff 0x3F8)
> > >      REG_DP_MISC1_MISC0         0x02C -> 0x42C  (diff 0x400)
> > >   So remapping inside msm_dp_read/write_link would require a full lookup
> > >   table, which seems not help for current status.
> > > 
> > > Can we introduce a small helper msm_dp_stream_reg() that selects the correct
> > > register address at the call site:
> > > //dp_panel.h
> > > static inline u32 msm_dp_stream_reg(enum msm_dp_stream_id id,
> > > 				     u32 reg_s0, u32 reg_s1, u32 reg_mst)
> > > {
> > > 	if (id > DP_STREAM_1)
> > > 		return reg_mst;
> > > 	return id == DP_STREAM_1 ? reg_s1 : reg_s0;
> > > }
> > 
> > No, that's what I want to get rid of. You are spreading these lookups
> > all over the code. Push them to a single function (or a single set of
> > functions, one per the stream, but having a single frontend to be called
> > by the rest of the driver).
> > 
> Okay. I should got how to do..
> void msm_dp_write_link ()
> {
> 	offset = msm_dp_stream_reg(stream_id, offset);
> 	switch (stream_id) {
> 	....
> }
> 
> msm_dp_stream_reg() will handle all the offset. then callers then simply do:
>   msm_dp_write_link(ctrl, panel->stream_id, REG_DP_MISC1_MISC0, val);
> Does this match what you had in mind?

Yes, exactly!

> > > 
> > > //dp_panel.c and dp_ctrl.c
> > >        u32 reg = msm_dp_stream_reg(stream_id,
> > >                                    REG_DP_MISC1_MISC0,
> > >                                    REG_DP1_MISC1_MISC0,
> > >                                    REG_DP_MSTLINK_MISC1_MISC0);
> > 
> > And then, if we need to support more streams or if the map for the
> > registers change, we'd need to go through all caller sites. No, that's a
> > bad idea.
> > 
> > >        msm_dp_read_link(ctrl, stream_id, reg);
> > > > > +		return readl_relaxed(ctrl->link_base + offset);
> > > > > +	case DP_STREAM_2:
> > > > > +		return readl_relaxed(ctrl->mst2link_base + offset);
> > > > > +	case DP_STREAM_3:
> > > > > +		return readl_relaxed(ctrl->mst3link_base + offset);
> > > > > +	default:
> > > > > +		DRM_ERROR("error stream_id\n");
> > > > > +		return 0;
> > > > > +	}
> > > > >    }

-- 
With best wishes
Dmitry

