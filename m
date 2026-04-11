Return-Path: <linux-arm-msm+bounces-102813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Jp+DeKR2mnc3wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 20:24:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 647A93E14E7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 20:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECE9D30063AF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 18:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E52175A6B;
	Sat, 11 Apr 2026 18:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IWVqM+YN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="atLa5u/V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDF7242D6A
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 18:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775931870; cv=none; b=aHIKlZjBc5z+Sn8vFO0g9cjfXTkW6WF5QLmES6qvfoLXUb4LU6u/goT0OuMV9Re6eG+w/d9l4aayoCSRMtBaI9SayUK/63iin7Hp6Zjhpdmfsz6e2Y557qMJvxTwufbSuQ6Kej2peAQS4KDMqDsvNn9C8iae6rSm0xlPPpMwwBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775931870; c=relaxed/simple;
	bh=3hIVvKAG7laNaIrY0VFOFKwSwfyvKuS1wvWBQkXNZK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLJefC/j7Ss1J54WCaCxELIMgyK4NWat/f0CMY8Fb2OtuPOGIIPpAt9dAqF4wC1k3xrRxuP+FTeE+XCwgrx0o/66boD1yRM/ZkO9ndxMUmfFeO0UcFf6M0Hnv/+VdoRXE7TOSVM6lZU8kXbjfGz5/TV/trPwnswlc3bW/voCYrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IWVqM+YN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=atLa5u/V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B7uVqa3335954
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 18:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VJOFLYzHkQR+k+vzDpkRuPbV
	i8Cdn5GZ2nMzB+YbLpg=; b=IWVqM+YNLa6p6eVTRqc4lSDNAQbsYLLu4B3HXDlR
	x5OF2DkXjy4wcK4AXOYHzmseYNmT5rz/TXXyMfvqWIviU+St9rAp/LauaxGGqJWR
	9Q8fNwYh/rNNE6Oh0eYOZFo4og4ZsK6WjiM5HiQhtEMC1dTV/1Ss/1WJ/JacsV8L
	lcW6Job6gUmycc5tFAgU17w6kfmP+TjVLWApgI1GqEvlDveoJrcuBoBrbN++/0I/
	FKAexN3VxW1tIZazFJlEXKbp3tU98XTCvpre0L8DgoDuf3S9Zu9RLU7Vs0FqHy4I
	hlfXiFyAyubhtXCv6IJasQjMqcQYcppwmXtYLrbDLYYYEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbp8vff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 18:24:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d4c2906fdfso320822285a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 11:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775931867; x=1776536667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VJOFLYzHkQR+k+vzDpkRuPbVi8Cdn5GZ2nMzB+YbLpg=;
        b=atLa5u/V8TYeY+OpWoasLcnyDjgXHins2KStqXXxUQ/a6A9wIlVXPDpHXP+4K6cqTs
         81PEKuJlERYuM7NYz4/DXdcYlel/13IQVpv1swC4TTz+uCXw/tYIMqlgwE5YanKfCTxd
         Jk9yLZ3YLt/24Q7JkkLc0mr/aAfI82s9ddqrSjk4TCnLbs6JB21cEI3fdj/hHq1Oq7L2
         HNu/gTOHUTzfrNuo47akYn38TrQHS4ZJsmiI01r1LTdJilslel/4aS9YV9y/sOA4MxlB
         lMlORnpzIbhS61wp4C7Pma0gWrnCGdobtixAUyparS3UY1Y/qY4buhlooULahMoxlqmg
         N3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775931867; x=1776536667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJOFLYzHkQR+k+vzDpkRuPbVi8Cdn5GZ2nMzB+YbLpg=;
        b=bvyh2WqXi325IMlji+zj5uOFNG3T8BGpgidzhtEfnmtaGLKGelg2nJmaNa0vvIXE2x
         BBHA0bsefFpOfNIgmjVtz4LHT5jiWOFyA0HsYN0TJlSOGhK3jlpBmisf/dyZLPNelSiv
         2z0h5c+W5OjuBCKOzgFQm42An1szxByhi5nljMHribUe97WSCINK4I4eKKX9KFgc6lNL
         9rAyLInojE5U322+49+W/TVRwP09u9qCKSpn7wt9XLYTKGvD9G2/7iRDGbEPJR8HlE7Q
         jRREBBS5HGmp860yNRlh9kvU4IDR+/OEPv5WEZ+lLmZn1sxzV8KTC5tfNwux/DK3qyuI
         utbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQ4sfpkzqwLY7HWPG+qv+0As93upuq2TyvMytbG0wEBtqCNJIFAM285da+WnHhZlog+nTQWZryG3zt1+hi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw60Wt515mwpJH1zjqo4wAfKpLb15pOOdl7rVuG9wNB+hStTJZW
	CLZlxtPhzgkvRJByYvx3XgiSy26Jmiyanik7Ya01sH/H9/SYhAsXTuMtIFg0xsKoEccYsNOmzax
	uI0xF+1TxFy16u2aLjxz8l4lyw/jUPNrF2g59M4NXgtaQxEuZXja1UcSiHHCbbF5obsOI
X-Gm-Gg: AeBDiesJfsVWe1V4snxuhuN8HCffNjxXn9KSj3V7/xUQ25Jag/2uFfuTlAjk6tM0Q32
	6fTSpKAmTeN5AjStO8L22Gogs6U8Zf2GbFYOq0hk87yKLgsVCxFSpg9yFHGH7JcxEI8KUhkKY5y
	NnUmCWAwhd8vivEnD+Q3YzYhcBtu3Omozj/GMUwX/Qz8Zv3NWJ9Oo/7VyksmYPEUYdHMPhbxLa5
	JBAdMwG9RouZ4E5u6EP6YN2FJX7mH4MN35lrB8OxXtieMjKsuuIskBq0PGdofpv//pipGtIGAc5
	WxoQpQHB0oWkGMMEpDq8wQJl6Zkx4g8guxYxHfsBZYHFeB7RGlE4UIA8Vaq3zdYBQOlR4cKlSmB
	/clIKW/zvzgjP6E8OGkZ6Tu13kPlZFIaxTvC3rHI21l1/Y1Yt8eySk1f2OuBCzL6zi/FeG/oFxi
	p927EuS5NtNQzJ5SHQwwFpjRAugPZfIt/tdpY=
X-Received: by 2002:ac8:5993:0:b0:50d:a56f:6085 with SMTP id d75a77b69052e-50dd5bd65edmr117133541cf.43.1775931866314;
        Sat, 11 Apr 2026 11:24:26 -0700 (PDT)
X-Received: by 2002:ac8:5993:0:b0:50d:a56f:6085 with SMTP id d75a77b69052e-50dd5bd65edmr117132981cf.43.1775931865502;
        Sat, 11 Apr 2026 11:24:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeefbda1sm1571363e87.62.2026.04.11.11.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 11:24:24 -0700 (PDT)
Date: Sat, 11 Apr 2026 21:24:20 +0300
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
Message-ID: <roqivmstbvdd7mhyyljhmzxv5njvuqqgjdn5gkekzrclhveozx@fougiain3kfh>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-17-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-17-b20518dea8de@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69da91db cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=4LK3sz13CaYQCNX7TaoA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: fb2HvPnWIETXhigWolpSVhHvlszx8_Ao
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDE2MyBTYWx0ZWRfXzyP6vHMpvlEg
 8+kHuEU15aQ499cUPxI7EDHHwYFTuvdksTU7MN7+KvmNX1ALJ7AgRhsnDYHbVvkoGXN0wh3Nns8
 ysNWYSTDKv0dXdXBXvT19te4C9mGcTo/zFeVjRfK/ebR4YFfq3gmKwpwOS9d6RWC/iViJadmtks
 f/YO8pR+TXOlR+ZBoDhjsrsvIcrdqm4BDDrEgAtph+1lb3x8OgmMerLL8nl1fepie/HnGEH1X3I
 Dq4GbrnxKgbnfhPS0sOsAq8JMM2mzViZb27Qk5/HgMxT6xcAfcVulIiIR61Ut/Rf1jAOX58IJbL
 y9CReWHw7qmDLLcmJQQpTWVfGbMedcjRj0HbuoM1jWkNs456NfH1vChISDX5Qp5rS8Wbi2t+O9v
 5Co3MPUZAd8LgKy+mUEvqC6PWW5pxuEQXp67f1kmsKsJC0CXLrMCRt2BMNUFO1hTuZCZe9mZ9hH
 +UK8CyIA4EwI3ilMPAg==
X-Proofpoint-GUID: fb2HvPnWIETXhigWolpSVhHvlszx8_Ao
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110163
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102813-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 647A93E14E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Nit, there is no catalog anymore, please fix the subject line.

On Fri, Apr 10, 2026 at 05:33:52PM +0800, Yongxing Mou wrote:
> To support 4-stream MST, the link clocks for stream 3 and stream 4 are
> controlled by MST_2_LCLK and MST_3_LCLK which share the same register
> definitions but use different base addresses.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 225 ++++++++++++++++++++++--------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |   4 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |  24 +++-
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 135 +++++++++++++++++-----
>  drivers/gpu/drm/msm/dp/dp_panel.h   |   2 +
>  drivers/gpu/drm/msm/dp/dp_reg.h     |  16 ++-
>  6 files changed, 283 insertions(+), 123 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index a52bcd9ea2a3..1109b2df21be 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -118,6 +118,8 @@ struct msm_dp_ctrl_private {
>  	struct msm_dp_link *link;
>  	void __iomem *ahb_base;
>  	void __iomem *link_base;
> +	void __iomem *mst2link_base;
> +	void __iomem *mst3link_base;
>  
>  	struct phy *phy;
>  
> @@ -158,19 +160,45 @@ static inline void msm_dp_write_ahb(struct msm_dp_ctrl_private *ctrl,
>  	writel(data, ctrl->ahb_base + offset);
>  }
>  
> -static inline u32 msm_dp_read_link(struct msm_dp_ctrl_private *ctrl, u32 offset)
> +static inline u32 msm_dp_read_link(struct msm_dp_ctrl_private *ctrl,
> +				   enum msm_dp_stream_id stream_id, u32 offset)
>  {
> -	return readl_relaxed(ctrl->link_base + offset);
> +	switch (stream_id) {
> +	case DP_STREAM_0:
> +	case DP_STREAM_1:

Continuing the comment from the previous patch:

Or, can we remap all offsets here? It would be much, much easier to
always pass REG_DP_foo and then here, in the link reading code, remap
the offsets for DP_STREAM_1.

> +		return readl_relaxed(ctrl->link_base + offset);
> +	case DP_STREAM_2:
> +		return readl_relaxed(ctrl->mst2link_base + offset);
> +	case DP_STREAM_3:
> +		return readl_relaxed(ctrl->mst3link_base + offset);
> +	default:
> +		DRM_ERROR("error stream_id\n");
> +		return 0;
> +	}
>  }
>  
>  static inline void msm_dp_write_link(struct msm_dp_ctrl_private *ctrl,
> -			       u32 offset, u32 data)
> +				     enum msm_dp_stream_id stream_id, u32 offset, u32 data)
>  {
>  	/*
>  	 * To make sure link reg writes happens before any other operation,
>  	 * this function uses writel() instread of writel_relaxed()
>  	 */
> -	writel(data, ctrl->link_base + offset);
> +	switch (stream_id) {
> +	case DP_STREAM_0:
> +	case DP_STREAM_1:
> +		writel(data, ctrl->link_base + offset);
> +		break;
> +	case DP_STREAM_2:
> +		writel(data, ctrl->mst2link_base + offset);
> +		break;
> +	case DP_STREAM_3:
> +		writel(data, ctrl->mst3link_base + offset);
> +		break;
> +	default:
> +		DRM_ERROR("error stream_id\n");
> +		break;
> +	}
>  }
>  
>  static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
> @@ -294,18 +322,18 @@ static void msm_dp_ctrl_psr_mainlink_enable(struct msm_dp_ctrl_private *ctrl)
>  {
>  	u32 val;
>  
> -	val = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
> +	val = msm_dp_read_link(ctrl, 0, REG_DP_MAINLINK_CTRL);
>  	val |= DP_MAINLINK_CTRL_ENABLE;
> -	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, val);
> +	msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_CTRL, val);

Are those always using the link0 base? If so, can we keep the existing
API for the stream-independent registers and introduce a separate API
call for the stream-dependent calls? Generally, if you keep the existing
function, I think, it becomes easier to squash this and the previous
patches.

>  }
>  
>  static void msm_dp_ctrl_psr_mainlink_disable(struct msm_dp_ctrl_private *ctrl)
>  {
>  	u32 val;
>  
> -	val = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
> +	val = msm_dp_read_link(ctrl, 0, REG_DP_MAINLINK_CTRL);
>  	val &= ~DP_MAINLINK_CTRL_ENABLE;
> -	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, val);
> +	msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_CTRL, val);
>  }
>  
>  static void msm_dp_ctrl_mainlink_enable(struct msm_dp_ctrl_private *ctrl)
> @@ -314,21 +342,21 @@ static void msm_dp_ctrl_mainlink_enable(struct msm_dp_ctrl_private *ctrl)
>  
>  	drm_dbg_dp(ctrl->drm_dev, "enable\n");
>  
> -	mainlink_ctrl = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
> +	mainlink_ctrl = msm_dp_read_link(ctrl, 0, REG_DP_MAINLINK_CTRL);
>  
>  	mainlink_ctrl &= ~(DP_MAINLINK_CTRL_RESET |
>  					DP_MAINLINK_CTRL_ENABLE);
> -	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
> +	msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
>  
>  	mainlink_ctrl |= DP_MAINLINK_CTRL_RESET;
> -	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
> +	msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
>  
>  	mainlink_ctrl &= ~DP_MAINLINK_CTRL_RESET;
> -	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
> +	msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
>  
>  	mainlink_ctrl |= (DP_MAINLINK_CTRL_ENABLE |
>  				DP_MAINLINK_FB_BOUNDARY_SEL);
> -	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
> +	msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
>  }
>  
>  static void msm_dp_ctrl_mainlink_disable(struct msm_dp_ctrl_private *ctrl)
> @@ -337,23 +365,23 @@ static void msm_dp_ctrl_mainlink_disable(struct msm_dp_ctrl_private *ctrl)
>  
>  	drm_dbg_dp(ctrl->drm_dev, "disable\n");
>  
> -	mainlink_ctrl = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
> +	mainlink_ctrl = msm_dp_read_link(ctrl, 0, REG_DP_MAINLINK_CTRL);
>  	mainlink_ctrl &= ~DP_MAINLINK_CTRL_ENABLE;
> -	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
> +	msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
>  }
>  
>  static void msm_dp_setup_peripheral_flush(struct msm_dp_ctrl_private *ctrl)
>  {
>  	u32 mainlink_ctrl;
>  
> -	mainlink_ctrl = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
> +	mainlink_ctrl = msm_dp_read_link(ctrl, 0, REG_DP_MAINLINK_CTRL);
>  
>  	if (ctrl->hw_revision >= DP_HW_VERSION_1_2)
>  		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
>  	else
>  		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
>  
> -	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
> +	msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
>  }
>  
>  static bool msm_dp_ctrl_mainlink_ready(struct msm_dp_ctrl_private *ctrl)
> @@ -380,7 +408,7 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
>  	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>  
>  	reinit_completion(&ctrl->idle_comp);
> -	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_PUSH_IDLE);
> +	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, DP_STATE_CTRL_PUSH_IDLE);
>  
>  	if (!wait_for_completion_timeout(&ctrl->idle_comp,
>  			IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
> @@ -395,7 +423,11 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
>  	u32 config = 0, tbd;
>  	u32 reg_offset = 0;
>  
> -	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
> +	if (msm_dp_panel->stream_id == DP_STREAM_0)
> +		config = msm_dp_read_link(ctrl, 0, REG_DP_CONFIGURATION_CTRL);
> +
> +	if (msm_dp_panel->stream_id == DP_STREAM_1)
> +		reg_offset = REG_DP1_CONFIGURATION_CTRL - REG_DP_CONFIGURATION_CTRL;
>  
>  	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
>  		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
> @@ -410,8 +442,10 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
>  
>  	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
>  
> -	if (msm_dp_panel->stream_id == DP_STREAM_1)
> -		reg_offset = REG_DP1_CONFIGURATION_CTRL - REG_DP_CONFIGURATION_CTRL;
> +	msm_dp_write_link(ctrl, msm_dp_panel->stream_id, msm_dp_panel->stream_id > 1 ?
> +			  REG_DP_MSTLINK_CONFIGURATION_CTRL :
> +			  REG_DP_CONFIGURATION_CTRL + reg_offset, config);
> +

Yep, it would definitely help to handle these differences in the link
writing code.

>  }
>  
>  static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
> @@ -441,7 +475,7 @@ static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
>  
>  	drm_dbg_dp(ctrl->drm_dev, "link DP_CONFIGURATION_CTRL=0x%x\n", config);
>  
> -	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
> +	msm_dp_write_link(ctrl, 0, REG_DP_CONFIGURATION_CTRL, config);
>  }
>  
>  static void msm_dp_ctrl_lane_mapping(struct msm_dp_ctrl_private *ctrl)
> @@ -454,8 +488,8 @@ static void msm_dp_ctrl_lane_mapping(struct msm_dp_ctrl_private *ctrl)
>  	ln_mapping |= lane_map[2] << LANE2_MAPPING_SHIFT;
>  	ln_mapping |= lane_map[3] << LANE3_MAPPING_SHIFT;
>  
> -	msm_dp_write_link(ctrl, REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING,
> -			ln_mapping);
> +	msm_dp_write_link(ctrl, 0, REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING,
> +			  ln_mapping);
>  }
>  
>  static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
> @@ -471,7 +505,8 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
>  	if (msm_dp_panel->stream_id == DP_STREAM_1)
>  		reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
>  
> -	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0 + reg_offset);
> +	misc_val = msm_dp_read_link(ctrl, msm_dp_panel->stream_id, msm_dp_panel->stream_id > 1 ?
> +				    REG_DP_MSTLINK_MISC1_MISC0 : REG_DP_MISC1_MISC0 + reg_offset);
>  
>  	/* clear bpp bits */
>  	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
> @@ -481,7 +516,10 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
>  	misc_val |= DP_MISC0_SYNCHRONOUS_CLK;
>  
>  	drm_dbg_dp(ctrl->drm_dev, "misc settings = 0x%x\n", misc_val);
> -	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0 + reg_offset, misc_val);
> +	msm_dp_write_link(ctrl, msm_dp_panel->stream_id,
> +			  msm_dp_panel->stream_id > 1 ?
> +			  REG_DP_MSTLINK_MISC1_MISC0 : REG_DP_MISC1_MISC0 + reg_offset,
> +			  misc_val);
>  }
>  
>  static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl,
> @@ -1307,9 +1345,9 @@ static void msm_dp_ctrl_setup_tr_unit(struct msm_dp_ctrl_private *ctrl)
>  	pr_debug("dp_tu=0x%x, valid_boundary=0x%x, valid_boundary2=0x%x\n",
>  			msm_dp_tu, valid_boundary, valid_boundary2);
>  
> -	msm_dp_write_link(ctrl, REG_DP_VALID_BOUNDARY, valid_boundary);
> -	msm_dp_write_link(ctrl, REG_DP_TU, msm_dp_tu);
> -	msm_dp_write_link(ctrl, REG_DP_VALID_BOUNDARY_2, valid_boundary2);
> +	msm_dp_write_link(ctrl, 0, REG_DP_VALID_BOUNDARY, valid_boundary);
> +	msm_dp_write_link(ctrl, 0, REG_DP_TU, msm_dp_tu);
> +	msm_dp_write_link(ctrl, 0, REG_DP_VALID_BOUNDARY_2, valid_boundary2);
>  }
>  
>  static int msm_dp_ctrl_wait4video_ready(struct msm_dp_ctrl_private *ctrl)
> @@ -1426,7 +1464,7 @@ static int msm_dp_ctrl_set_pattern_state_bit(struct msm_dp_ctrl_private *ctrl,
>  
>  	bit = BIT(state_bit - 1);
>  	drm_dbg_dp(ctrl->drm_dev, "hw: bit=%d train=%d\n", bit, state_bit);
> -	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, bit);
> +	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, bit);
>  
>  	bit = BIT(state_bit - 1) << DP_MAINLINK_READY_LINK_TRAINING_SHIFT;
>  
> @@ -1453,7 +1491,7 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
>  	delay_us = drm_dp_read_clock_recovery_delay(ctrl->aux,
>  						    ctrl->panel->dpcd, dp_phy, false);
>  
> -	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
> +	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, 0);
>  
>  	*training_step = DP_TRAINING_1;
>  
> @@ -1577,7 +1615,7 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
>  	delay_us = drm_dp_read_channel_eq_delay(ctrl->aux,
>  						ctrl->panel->dpcd, dp_phy, false);
>  
> -	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
> +	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, 0);
>  
>  	*training_step = DP_TRAINING_2;
>  
> @@ -1694,7 +1732,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
>  	}
>  
>  end:
> -	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
> +	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, 0);
>  
>  	return ret;
>  }
> @@ -1840,34 +1878,34 @@ static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl)
>  static void msm_dp_ctrl_enable_sdp(struct msm_dp_ctrl_private *ctrl)
>  {
>  	/* trigger sdp */
> -	msm_dp_write_link(ctrl, MMSS_DP_SDP_CFG3, UPDATE_SDP);
> -	msm_dp_write_link(ctrl, MMSS_DP_SDP_CFG3, 0x0);
> +	msm_dp_write_link(ctrl, 0, MMSS_DP_SDP_CFG3, UPDATE_SDP);
> +	msm_dp_write_link(ctrl, 0, MMSS_DP_SDP_CFG3, 0x0);
>  }
>  
>  static void msm_dp_ctrl_psr_enter(struct msm_dp_ctrl_private *ctrl)
>  {
>  	u32 cmd;
>  
> -	cmd = msm_dp_read_link(ctrl, REG_PSR_CMD);
> +	cmd = msm_dp_read_link(ctrl, 0, REG_PSR_CMD);
>  
>  	cmd &= ~(PSR_ENTER | PSR_EXIT);
>  	cmd |= PSR_ENTER;
>  
>  	msm_dp_ctrl_enable_sdp(ctrl);
> -	msm_dp_write_link(ctrl, REG_PSR_CMD, cmd);
> +	msm_dp_write_link(ctrl, 0, REG_PSR_CMD, cmd);
>  }
>  
>  static void msm_dp_ctrl_psr_exit(struct msm_dp_ctrl_private *ctrl)
>  {
>  	u32 cmd;
>  
> -	cmd = msm_dp_read_link(ctrl, REG_PSR_CMD);
> +	cmd = msm_dp_read_link(ctrl, 0, REG_PSR_CMD);
>  
>  	cmd &= ~(PSR_ENTER | PSR_EXIT);
>  	cmd |= PSR_EXIT;
>  
>  	msm_dp_ctrl_enable_sdp(ctrl);
> -	msm_dp_write_link(ctrl, REG_PSR_CMD, cmd);
> +	msm_dp_write_link(ctrl, 0, REG_PSR_CMD, cmd);
>  }
>  
>  void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl)
> @@ -1880,9 +1918,9 @@ void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl)
>  		return;
>  
>  	/* enable PSR1 function */
> -	cfg = msm_dp_read_link(ctrl, REG_PSR_CONFIG);
> +	cfg = msm_dp_read_link(ctrl, 0, REG_PSR_CONFIG);
>  	cfg |= PSR1_SUPPORTED;
> -	msm_dp_write_link(ctrl, REG_PSR_CONFIG, cfg);
> +	msm_dp_write_link(ctrl, 0, REG_PSR_CONFIG, cfg);
>  
>  	msm_dp_ctrl_config_psr_interrupt(ctrl);
>  	msm_dp_ctrl_enable_sdp(ctrl);
> @@ -1921,16 +1959,16 @@ void msm_dp_ctrl_set_psr(struct msm_dp_ctrl *msm_dp_ctrl, bool enter)
>  		}
>  
>  		msm_dp_ctrl_push_idle(msm_dp_ctrl);
> -		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
> +		msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, 0);
>  
>  		msm_dp_ctrl_psr_mainlink_disable(ctrl);
>  	} else {
>  		msm_dp_ctrl_psr_mainlink_enable(ctrl);
>  
>  		msm_dp_ctrl_psr_exit(ctrl);
> -		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
> +		msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>  		msm_dp_ctrl_wait4video_ready(ctrl);
> -		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
> +		msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, 0);
>  	}
>  }
>  
> @@ -2041,7 +2079,7 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
>  
>  	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
>  
> -	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
> +	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>  
>  	ret = msm_dp_ctrl_wait4video_ready(ctrl);
>  end:
> @@ -2056,72 +2094,72 @@ static void msm_dp_ctrl_send_phy_pattern(struct msm_dp_ctrl_private *ctrl,
>  	u32 value = 0x0;
>  
>  	/* Make sure to clear the current pattern before starting a new one */
> -	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0x0);
> +	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, 0x0);
>  
>  	drm_dbg_dp(ctrl->drm_dev, "pattern: %#x\n", pattern);
>  	switch (pattern) {
>  	case DP_PHY_TEST_PATTERN_D10_2:
> -		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL,
> -			      DP_STATE_CTRL_LINK_TRAINING_PATTERN1);
> +		msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL,
> +				  DP_STATE_CTRL_LINK_TRAINING_PATTERN1);
>  		break;
>  
>  	case DP_PHY_TEST_PATTERN_ERROR_COUNT:
>  		value &= ~(1 << 16);
> -		msm_dp_write_link(ctrl, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
> -			      value);
> +		msm_dp_write_link(ctrl, 0, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
> +				  value);
>  		value |= SCRAMBLER_RESET_COUNT_VALUE;
> -		msm_dp_write_link(ctrl, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
> -			      value);
> -		msm_dp_write_link(ctrl, REG_DP_MAINLINK_LEVELS,
> -			      DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
> -		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL,
> -			      DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
> +		msm_dp_write_link(ctrl, 0, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
> +				  value);
> +		msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_LEVELS,
> +				  DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
> +		msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL,
> +				  DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
>  		break;
>  
>  	case DP_PHY_TEST_PATTERN_PRBS7:
> -		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL,
> -			      DP_STATE_CTRL_LINK_PRBS7);
> +		msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL,
> +				  DP_STATE_CTRL_LINK_PRBS7);
>  		break;
>  
>  	case DP_PHY_TEST_PATTERN_80BIT_CUSTOM:
> -		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL,
> -			      DP_STATE_CTRL_LINK_TEST_CUSTOM_PATTERN);
> +		msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL,
> +				  DP_STATE_CTRL_LINK_TEST_CUSTOM_PATTERN);
>  		/* 00111110000011111000001111100000 */
> -		msm_dp_write_link(ctrl, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG0,
> -			      0x3E0F83E0);
> +		msm_dp_write_link(ctrl, 0, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG0,
> +				  0x3E0F83E0);
>  		/* 00001111100000111110000011111000 */
> -		msm_dp_write_link(ctrl, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG1,
> -			      0x0F83E0F8);
> +		msm_dp_write_link(ctrl, 0, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG1,
> +				  0x0F83E0F8);
>  		/* 1111100000111110 */
> -		msm_dp_write_link(ctrl, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG2,
> -			      0x0000F83E);
> +		msm_dp_write_link(ctrl, 0, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG2,
> +				  0x0000F83E);
>  		break;
>  
>  	case DP_PHY_TEST_PATTERN_CP2520:
> -		value = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
> +		value = msm_dp_read_link(ctrl, 0, REG_DP_MAINLINK_CTRL);
>  		value &= ~DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER;
> -		msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, value);
> +		msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_CTRL, value);
>  
>  		value = DP_HBR2_ERM_PATTERN;
> -		msm_dp_write_link(ctrl, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
> -			      value);
> +		msm_dp_write_link(ctrl, 0, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
> +				  value);
>  		value |= SCRAMBLER_RESET_COUNT_VALUE;
> -		msm_dp_write_link(ctrl, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
> -			      value);
> -		msm_dp_write_link(ctrl, REG_DP_MAINLINK_LEVELS,
> -			      DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
> -		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL,
> -			      DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
> -		value = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
> +		msm_dp_write_link(ctrl, 0, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
> +				  value);
> +		msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_LEVELS,
> +				  DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
> +		msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL,
> +				  DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
> +		value = msm_dp_read_link(ctrl, 0, REG_DP_MAINLINK_CTRL);
>  		value |= DP_MAINLINK_CTRL_ENABLE;
> -		msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, value);
> +		msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_CTRL, value);
>  		break;
>  
>  	case DP_PHY_TEST_PATTERN_SEL_MASK:
> -		msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL,
> -			      DP_MAINLINK_CTRL_ENABLE);
> -		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL,
> -			      DP_STATE_CTRL_LINK_TRAINING_PATTERN4);
> +		msm_dp_write_link(ctrl, 0, REG_DP_MAINLINK_CTRL,
> +				  DP_MAINLINK_CTRL_ENABLE);
> +		msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL,
> +				  DP_STATE_CTRL_LINK_TRAINING_PATTERN4);
>  		break;
>  
>  	default:
> @@ -2149,7 +2187,7 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
>  	msm_dp_ctrl_update_phy_vx_px(ctrl, DP_PHY_DPRX);
>  	msm_dp_link_send_test_response(ctrl->link);
>  
> -	pattern_sent = msm_dp_read_link(ctrl, REG_DP_MAINLINK_READY);
> +	pattern_sent = msm_dp_read_link(ctrl, 0, REG_DP_MAINLINK_READY);
>  
>  	switch (pattern_sent) {
>  	case MR_LINK_TRAINING1:
> @@ -2522,8 +2560,14 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>  		nvid *= 3;
>  
>  	drm_dbg_dp(ctrl->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
> -	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID + mvid_reg_off, mvid);
> -	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID + nvid_reg_off, nvid);
> +	msm_dp_write_link(ctrl, msm_dp_panel->stream_id,
> +			  msm_dp_panel->stream_id > 1 ?
> +			  REG_MSTLINK_SOFTWARE_MVID : REG_DP_SOFTWARE_MVID + mvid_reg_off,
> +			  mvid);
> +	msm_dp_write_link(ctrl, msm_dp_panel->stream_id,
> +			  msm_dp_panel->stream_id > 1 ?
> +			  REG_MSTLINK_SOFTWARE_NVID : REG_DP_SOFTWARE_NVID + nvid_reg_off,
> +			  nvid);
>  }
>  
>  int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
> @@ -2593,7 +2637,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  
>  	msm_dp_ctrl_lane_mapping(ctrl);
>  	msm_dp_setup_peripheral_flush(ctrl);
> -	msm_dp_ctrl_config_ctrl_link(ctrl);
> +	if (msm_dp_panel->stream_id == DP_STREAM_0)
> +		msm_dp_ctrl_config_ctrl_link(ctrl);
>  
>  	msm_dp_ctrl_configure_source_params(ctrl, msm_dp_panel);
>  
> @@ -2607,7 +2652,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  
>  	msm_dp_ctrl_setup_tr_unit(ctrl);
>  
> -	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
> +	msm_dp_write_link(ctrl, 0, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>  
>  	ret = msm_dp_ctrl_wait4video_ready(ctrl);
>  	if (ret)
> @@ -2787,7 +2832,9 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
>  			struct phy *phy,
>  			int max_stream,
>  			void __iomem *ahb_base,
> -			void __iomem *link_base)
> +			void __iomem *link_base,
> +			void __iomem *mst2link_base,
> +			void __iomem *mst3link_base)
>  {
>  	struct msm_dp_ctrl_private *ctrl;
>  	int ret;
> @@ -2827,6 +2874,8 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
>  	ctrl->phy      = phy;
>  	ctrl->ahb_base = ahb_base;
>  	ctrl->link_base = link_base;
> +	ctrl->mst2link_base = mst2link_base;
> +	ctrl->mst3link_base = mst3link_base;
>  
>  	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl, max_stream);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 6fed3ff3a72d..e72d501ac1ce 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -31,7 +31,9 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev,
>  				    struct phy *phy,
>  				    int max_stream,
>  				    void __iomem *ahb_base,
> -				    void __iomem *link_base);
> +				    void __iomem *link_base,
> +				    void __iomem *mst2link_base,
> +				    void __iomem *mst3link_base);
>  
>  void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_phy_init(struct msm_dp_ctrl *msm_dp_ctrl);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index ff506064a3fa..a924fbd825f7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -85,6 +85,12 @@ struct msm_dp_display_private {
>  	void __iomem *link_base;
>  	size_t link_len;
>  
> +	void __iomem *mst2link_base;
> +	size_t mst2link_len;
> +
> +	void __iomem *mst3link_base;
> +	size_t mst3link_len;
> +
>  	void __iomem *pixel_base[DP_STREAM_MAX];
>  	size_t pixel_len;
>  
> @@ -561,7 +567,8 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>  		goto error_link;
>  	}
>  
> -	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->pixel_base[0]);
> +	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base,
> +				     dp->mst2link_base, dp->mst3link_base, dp->pixel_base[0]);
>  	if (IS_ERR(dp->panel)) {
>  		rc = PTR_ERR(dp->panel);
>  		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
> @@ -570,7 +577,8 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>  	}
>  
>  	dp->ctrl = msm_dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
> -			       phy, dp->max_stream, dp->ahb_base, dp->link_base);
> +			       phy, dp->max_stream, dp->ahb_base,
> +			       dp->link_base, dp->mst2link_base, dp->mst3link_base);
>  	if (IS_ERR(dp->ctrl)) {
>  		rc = PTR_ERR(dp->ctrl);
>  		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
> @@ -883,6 +891,10 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
>  				    msm_dp_display->aux_base, "dp_aux");
>  	msm_disp_snapshot_add_block(disp_state, msm_dp_display->link_len,
>  				    msm_dp_display->link_base, "dp_link");
> +	msm_disp_snapshot_add_block(disp_state, msm_dp_display->mst2link_len,
> +				    msm_dp_display->mst2link_base, "dp_mst2link");
> +	msm_disp_snapshot_add_block(disp_state, msm_dp_display->mst3link_len,
> +				    msm_dp_display->mst3link_base, "dp_mst3link");
>  	msm_disp_snapshot_add_block(disp_state, msm_dp_display->pixel_len,
>  				    msm_dp_display->pixel_base[0], "dp_p0");
>  	msm_disp_snapshot_add_block(disp_state, msm_dp_display->pixel_len,
> @@ -1228,6 +1240,14 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
>  		}
>  	}
>  
> +	display->mst2link_base = msm_dp_ioremap(pdev, 7, &display->mst2link_len);
> +	if (IS_ERR(display->mst2link_base))
> +		DRM_DEBUG_DP("unable to remap link region: %pe\n", display->mst2link_base);
> +
> +	display->mst3link_base = msm_dp_ioremap(pdev, 8, &display->mst3link_len);
> +	if (IS_ERR(display->mst3link_base))
> +		DRM_DEBUG_DP("unable to remap link region: %pe\n", display->mst3link_base);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 6c88cc7e3037..a8a6297b37e3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -25,23 +25,50 @@ struct msm_dp_panel_private {
>  	struct drm_dp_aux *aux;
>  	struct msm_dp_link *link;
>  	void __iomem *link_base;
> +	void __iomem *mst2link_base;
> +	void __iomem *mst3link_base;
>  	void __iomem *pixel_base;
>  	bool panel_on;
>  };
>  
>  static inline u32 msm_dp_read_link(struct msm_dp_panel_private *panel, u32 offset)
>  {
> -	return readl_relaxed(panel->link_base + offset);
> +	switch (panel->msm_dp_panel.stream_id) {
> +	case DP_STREAM_0:
> +	case DP_STREAM_1:
> +		return readl_relaxed(panel->link_base + offset);
> +	case DP_STREAM_2:
> +		return readl_relaxed(panel->mst2link_base + offset);
> +	case DP_STREAM_3:
> +		return readl_relaxed(panel->mst3link_base + offset);
> +	default:
> +		DRM_ERROR("error stream_id\n");
> +		return 0;
> +	}
>  }
>  
>  static inline void msm_dp_write_link(struct msm_dp_panel_private *panel,
> -			       u32 offset, u32 data)
> +					u32 offset, u32 data)
>  {
>  	/*
>  	 * To make sure link reg writes happens before any other operation,
>  	 * this function uses writel() instread of writel_relaxed()
>  	 */
> -	writel(data, panel->link_base + offset);
> +	switch (panel->msm_dp_panel.stream_id) {
> +	case DP_STREAM_0:
> +	case DP_STREAM_1:
> +		writel(data, panel->link_base + offset);
> +		break;
> +	case DP_STREAM_2:
> +		writel(data, panel->mst2link_base + offset);
> +		break;
> +	case DP_STREAM_3:
> +		writel(data, panel->mst3link_base + offset);
> +		break;
> +	default:
> +		DRM_ERROR("error stream_id\n");
> +		break;
> +	}
>  }
>  
>  static inline void msm_dp_write_pn(struct msm_dp_panel_private *panel,
> @@ -444,38 +471,51 @@ void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel)
>  
>  static void msm_dp_panel_send_vsc_sdp(struct msm_dp_panel_private *panel, struct dp_sdp *vsc_sdp)
>  {
> +	u32 id = panel->msm_dp_panel.stream_id;
>  	u32 header[2];
>  	u32 val;
>  	int i;
>  	u32 offset = 0;
>  
> -	if (panel->msm_dp_panel.stream_id == DP_STREAM_1)
> +	if (id == DP_STREAM_1)
>  		offset = MMSS_DP1_GENERIC0_0 - MMSS_DP_GENERIC0_0;
>  
>  	msm_dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
>  
> -	msm_dp_write_link(panel, MMSS_DP_GENERIC0_0 + offset, header[0]);
> -	msm_dp_write_link(panel, MMSS_DP_GENERIC0_1 + offset, header[1]);
> +	msm_dp_write_link(panel, id > 1 ?
> +			  MMSS_DP_MSTLINK_GENERIC0_0 : MMSS_DP_GENERIC0_0 + offset,
> +			  header[0]);
> +	msm_dp_write_link(panel, id > 1 ?
> +			  MMSS_DP_MSTLINK_GENERIC0_1 : MMSS_DP_GENERIC0_1 + offset,
> +			  header[1]);
>  
>  	for (i = 0; i < sizeof(vsc_sdp->db); i += 4) {
>  		val = ((vsc_sdp->db[i]) | (vsc_sdp->db[i + 1] << 8) | (vsc_sdp->db[i + 2] << 16) |
>  		       (vsc_sdp->db[i + 3] << 24));
> -		msm_dp_write_link(panel, MMSS_DP_GENERIC0_2 + i + offset, val);
> +
> +		msm_dp_write_link(panel, id > 1 ?
> +				  MMSS_DP_MSTLINK_GENERIC0_2 + i : MMSS_DP_GENERIC0_2 + i + offset,
> +				  val);
>  	}
>  }
>  
>  static void msm_dp_panel_update_sdp(struct msm_dp_panel_private *panel)
>  {
> +	u32 id = panel->msm_dp_panel.stream_id;
>  	u32 hw_revision = panel->msm_dp_panel.hw_revision;
>  	u32 offset = 0;
>  
> -	if (panel->msm_dp_panel.stream_id == DP_STREAM_1)
> +	if (id == DP_STREAM_1)
>  		offset = MMSS_DP1_SDP_CFG3 - MMSS_DP_SDP_CFG3;
>  
>  	if (hw_revision >= DP_HW_VERSION_1_0 &&
>  	    hw_revision < DP_HW_VERSION_1_2) {
> -		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3 + offset, UPDATE_SDP);
> -		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3 + offset, 0x0);
> +		msm_dp_write_link(panel, id > 1 ?
> +				  MMSS_DP_MSTLINK_SDP_CFG3 : MMSS_DP_SDP_CFG3 + offset,
> +				  UPDATE_SDP);
> +		msm_dp_write_link(panel, id > 1 ?
> +				  MMSS_DP_MSTLINK_SDP_CFG3 : MMSS_DP_SDP_CFG3 + offset,
> +				  0x0);
>  	}
>  }
>  
> @@ -483,26 +523,34 @@ void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sd
>  {
>  	struct msm_dp_panel_private *panel =
>  		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
> +	u32 id = msm_dp_panel->stream_id;
>  	u32 cfg, cfg2, misc;
>  	u32 misc_reg_offset = 0;
>  	u32 sdp_cfg_offset = 0;
>  	u32 sdp_cfg2_offset = 0;
>  
> -	if (msm_dp_panel->stream_id == DP_STREAM_1) {
> +	if (id == DP_STREAM_1) {
>  		misc_reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
>  		sdp_cfg_offset = MMSS_DP1_SDP_CFG - MMSS_DP_SDP_CFG;
>  		sdp_cfg2_offset = MMSS_DP1_SDP_CFG2 - MMSS_DP_SDP_CFG2;
>  	}
>  
> -	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset);
> -	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
> -	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset);
> +	cfg = msm_dp_read_link(panel, id > 1 ?
> +			       MMSS_DP_MSTLINK_SDP_CFG : MMSS_DP_SDP_CFG + sdp_cfg_offset);
> +	cfg2 = msm_dp_read_link(panel, id > 1 ?
> +				MMSS_DP_MSTLINK_SDP_CFG2 : MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
> +	misc = msm_dp_read_link(panel, id > 1 ?
> +				REG_DP_MSTLINK_MISC1_MISC0 : REG_DP_MISC1_MISC0 + misc_reg_offset);
>  
>  	cfg |= GEN0_SDP_EN;
> -	msm_dp_write_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset, cfg);
> -
>  	cfg2 |= GENERIC0_SDPSIZE_VALID;
> -	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset, cfg2);
> +
> +	msm_dp_write_link(panel, id > 1 ?
> +			  MMSS_DP_MSTLINK_SDP_CFG : MMSS_DP_SDP_CFG + sdp_cfg_offset,
> +			  cfg);
> +	msm_dp_write_link(panel, id > 1 ?
> +			  MMSS_DP_MSTLINK_SDP_CFG2 : MMSS_DP_SDP_CFG2 + sdp_cfg2_offset,
> +			  cfg2);
>  
>  	msm_dp_panel_send_vsc_sdp(panel, vsc_sdp);
>  
> @@ -512,7 +560,9 @@ void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sd
>  	drm_dbg_dp(panel->drm_dev, "vsc sdp enable=1\n");
>  
>  	pr_debug("misc settings = 0x%x\n", misc);
> -	msm_dp_write_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset, misc);
> +	msm_dp_write_link(panel, id > 1 ?
> +			  REG_DP_MSTLINK_MISC1_MISC0 : REG_DP_MISC1_MISC0 + misc_reg_offset,
> +			  misc);
>  
>  	msm_dp_panel_update_sdp(panel);
>  }
> @@ -521,26 +571,34 @@ void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel)
>  {
>  	struct msm_dp_panel_private *panel =
>  		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
> +	u32 id = msm_dp_panel->stream_id;
>  	u32 cfg, cfg2, misc;
>  	u32 misc_reg_offset = 0;
>  	u32 sdp_cfg_offset = 0;
>  	u32 sdp_cfg2_offset = 0;
>  
> -	if (msm_dp_panel->stream_id == DP_STREAM_1) {
> +	if (id == DP_STREAM_1) {
>  		misc_reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
>  		sdp_cfg_offset = MMSS_DP1_SDP_CFG - MMSS_DP_SDP_CFG;
>  		sdp_cfg2_offset = MMSS_DP1_SDP_CFG2 - MMSS_DP_SDP_CFG2;
>  	}
>  
> -	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset);
> -	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
> -	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset);
> +	cfg = msm_dp_read_link(panel, id > 1 ?
> +			       MMSS_DP_MSTLINK_SDP_CFG : MMSS_DP_SDP_CFG + sdp_cfg_offset);
> +	cfg2 = msm_dp_read_link(panel, id > 1 ?
> +				MMSS_DP_MSTLINK_SDP_CFG2 : MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
> +	misc = msm_dp_read_link(panel, id > 1 ?
> +				REG_DP_MSTLINK_MISC1_MISC0 : REG_DP_MISC1_MISC0 + misc_reg_offset);
>  
>  	cfg &= ~GEN0_SDP_EN;
> -	msm_dp_write_link(panel, MMSS_DP_SDP_CFG + sdp_cfg_offset, cfg);
> -
>  	cfg2 &= ~GENERIC0_SDPSIZE_VALID;
> -	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset, cfg2);
> +
> +	msm_dp_write_link(panel, id > 1 ?
> +			  MMSS_DP_MSTLINK_SDP_CFG : MMSS_DP_SDP_CFG + sdp_cfg_offset,
> +			  cfg);
> +	msm_dp_write_link(panel, id > 1 ?
> +			  MMSS_DP_MSTLINK_SDP_CFG2 : MMSS_DP_SDP_CFG2 + sdp_cfg2_offset,
> +			  cfg2);
>  
>  	/* switch back to MSA */
>  	misc &= ~DP_MISC1_VSC_SDP;
> @@ -548,7 +606,9 @@ void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel)
>  	drm_dbg_dp(panel->drm_dev, "vsc sdp enable=0\n");
>  
>  	pr_debug("misc settings = 0x%x\n", misc);
> -	msm_dp_write_link(panel, REG_DP_MISC1_MISC0 + misc_reg_offset, misc);
> +	msm_dp_write_link(panel, id > 1 ?
> +			  REG_DP_MSTLINK_MISC1_MISC0 : REG_DP_MISC1_MISC0 + misc_reg_offset,
> +			  misc);
>  
>  	msm_dp_panel_update_sdp(panel);
>  }
> @@ -598,6 +658,7 @@ static int msm_dp_panel_setup_vsc_sdp_yuv_420(struct msm_dp_panel *msm_dp_panel)
>  
>  int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
>  {
> +	u32 id = msm_dp_panel->stream_id;
>  	u32 data, total_ver, total_hor;
>  	struct msm_dp_panel_private *panel;
>  	struct drm_display_mode *drm_mode;
> @@ -621,7 +682,7 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
>  		drm_mode->vsync_start - drm_mode->vdisplay,
>  		drm_mode->vsync_end - drm_mode->vsync_start);
>  
> -	if (msm_dp_panel->stream_id == DP_STREAM_1)
> +	if (id == DP_STREAM_1)
>  		offset = REG_DP1_TOTAL_HOR_VER - REG_DP_TOTAL_HOR_VER;
>  
>  	total_hor = drm_mode->htotal;
> @@ -654,10 +715,18 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
>  
>  	msm_dp_active = data;
>  
> -	msm_dp_write_link(panel, REG_DP_TOTAL_HOR_VER + offset, total);
> -	msm_dp_write_link(panel, REG_DP_START_HOR_VER_FROM_SYNC  + offset, sync_start);
> -	msm_dp_write_link(panel, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY + offset, width_blanking);
> -	msm_dp_write_link(panel, REG_DP_ACTIVE_HOR_VER  + offset, msm_dp_active);
> +	msm_dp_write_link(panel,
> +			  id > 1 ? REG_DP_MSTLINK_TOTAL_HOR_VER :
> +			  REG_DP_TOTAL_HOR_VER + offset, total);
> +	msm_dp_write_link(panel,
> +			  id > 1 ? REG_DP_MSTLINK_START_HOR_VER_FROM_SYNC :
> +			  REG_DP_START_HOR_VER_FROM_SYNC + offset, sync_start);
> +	msm_dp_write_link(panel,
> +			  id > 1 ? REG_DP_MSTLINK_HSYNC_VSYNC_WIDTH_POLARITY :
> +			  REG_DP_HSYNC_VSYNC_WIDTH_POLARITY + offset, width_blanking);
> +	msm_dp_write_link(panel,
> +			  id > 1 ? REG_DP_MSTLINK_ACTIVE_HOR_VER :
> +			  REG_DP_ACTIVE_HOR_VER + offset, msm_dp_active);
>  
>  	reg = msm_dp_read_pn(panel, MMSS_DP_INTF_CONFIG);
>  	if (wide_bus_en)
> @@ -726,6 +795,8 @@ int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel)
>  struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
>  			      struct msm_dp_link *link,
>  			      void __iomem *link_base,
> +			      void __iomem *mst2link_base,
> +			      void __iomem *mst3link_base,
>  			      void __iomem *pixel_base)
>  {
>  	struct msm_dp_panel_private *panel;
> @@ -745,6 +816,8 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
>  	panel->link = link;
>  	panel->link_base = link_base;
>  	panel->pixel_base = pixel_base;
> +	panel->mst2link_base = mst2link_base;
> +	panel->mst3link_base = mst3link_base;
>  
>  	msm_dp_panel = &panel->msm_dp_panel;
>  	msm_dp_panel->max_bw_code = DP_LINK_BW_8_1;
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index fe4ac3e47e17..4873c55bd693 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -101,5 +101,7 @@ static inline bool is_lane_count_valid(u32 lane_count)
>  struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
>  			      struct msm_dp_link *link,
>  			      void __iomem *link_base,
> +			      void __iomem *mst2link_base,
> +			      void __iomem *mst3link_base,
>  			      void __iomem *pixel_base);
>  #endif /* _DP_PANEL_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 295c1161e6b7..1c2d3d8d029d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -162,7 +162,6 @@
>  #define REG_DP_START_HOR_VER_FROM_SYNC		(0x00000020)
>  #define REG_DP_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000024)
>  #define REG_DP_ACTIVE_HOR_VER			(0x00000028)
> -
>  #define REG_DP_MISC1_MISC0			(0x0000002C)
>  #define DP_MISC0_SYNCHRONOUS_CLK		(0x00000001)
>  #define DP_MISC0_COLORIMETRY_CFG_SHIFT		(0x00000001)
> @@ -343,6 +342,21 @@
>  #define MMSS_DP1_SDP_CFG2			(0x000004E4)
>  #define MMSS_DP1_SDP_CFG3			(0x000004E8)
>  
> +#define REG_DP_MSTLINK_CONFIGURATION_CTRL	(0x00000034)
> +#define REG_MSTLINK_SOFTWARE_MVID		(0x00000040)
> +#define REG_MSTLINK_SOFTWARE_NVID		(0x00000044)
> +#define REG_DP_MSTLINK_TOTAL_HOR_VER		(0x00000048)
> +#define REG_DP_MSTLINK_START_HOR_VER_FROM_SYNC	(0x0000004C)
> +#define REG_DP_MSTLINK_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000050)
> +#define REG_DP_MSTLINK_ACTIVE_HOR_VER		(0x00000054)
> +#define REG_DP_MSTLINK_MISC1_MISC0		(0x00000058)
> +#define MMSS_DP_MSTLINK_GENERIC0_0		(0x000000BC)
> +#define MMSS_DP_MSTLINK_GENERIC0_1		(0x000000C0)
> +#define MMSS_DP_MSTLINK_GENERIC0_2		(0x000000C4)
> +#define MMSS_DP_MSTLINK_SDP_CFG			(0x0000010c)
> +#define MMSS_DP_MSTLINK_SDP_CFG2		(0x0000011c)
> +#define MMSS_DP_MSTLINK_SDP_CFG3		(0x00000114)
> +
>  #define MMSS_DP_ASYNC_FIFO_CONFIG		(0x00000088)
>  
>  #define REG_DP_PHY_AUX_INTERRUPT_CLEAR          (0x0000004C)
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

