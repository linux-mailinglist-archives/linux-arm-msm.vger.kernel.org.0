Return-Path: <linux-arm-msm+bounces-102499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBD/IQi912mdSQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 16:51:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD733CC3A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 16:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8795C301E23B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 14:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAEF32E62AC;
	Thu,  9 Apr 2026 14:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6V2X79U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+LHmafh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7028F27B353
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 14:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775746210; cv=none; b=oAFHZN5YW6QVoVV2fDZEBGd6Xqu5DgwXZgcOgVoGB0L9f+E1xFQlQ6wVv0OnZMYqsHO442n9uwmAT+Ic9K6RuExDTJ+C79DVkNd4L7zWE968X8EN//jWh07KZIS+WHEATj8tN237HorJoJ2u9EMuQg0PC4CLhiyFtbU4HHebSfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775746210; c=relaxed/simple;
	bh=IkngIURsMOt1NBJ0+RtzLbAqtTk2AzFYbX2EwTuSmBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bbp/n0nn/rGH9HS0fOGTnohnmgK6HZkNse61nX7uZKlr0+A/Qna2mHrcW6ZxvJcwZktYKLiQhcDgOlJRZYcfrnyffWj3ETlV89tA6J6qrveoG1YRfgPNnpNXJqeiYJhCLozPq1uNqIdb0lAuk4TmGQSa+M1kA+KofnqPx/CZHuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6V2X79U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+LHmafh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639DdOKA2812135
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 14:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=utMWUCCTJuQzcuo1BSAJ7kzz
	+4RTmDTgmjtXR0Qd9ic=; b=R6V2X79URUzVf5/09aniazOTggpXadV7PkglAyM6
	iMohPPAffIGKNpg3njhkPEJg95daLX+kUPLT9xk08PAvyQfQTKFln3NeS3yxGGqQ
	bJ+bsiAX5Aq93r166GKANkR7m1ZXciIgoAOGtalo+SuUpSSpItGN7heGMOQi59MD
	22XCwCsmX6Wo/OubLbe/MnL7rsgR7FVSyfay3gxywvI4nq0Bosp4d/Stc4MeCqDj
	Glnq2HAeAwA2IroJlk/ZA65AVkh39woZZZgnWlimLXt5qal2ByA21Qo3EzLme4k1
	r/QwX4qHp0qk2lJl8da98qK5KmgfpEiJWQlvzCFbPeo22Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded6h892t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 14:50:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d76f460b2so4921241cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 07:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775746207; x=1776351007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=utMWUCCTJuQzcuo1BSAJ7kzz+4RTmDTgmjtXR0Qd9ic=;
        b=a+LHmafh+V97WjMmUVH3+Xng/ThtkDltU29UcYcjprnR0M+k3EFziGZFaNKrdruYl4
         o6F1lcdxJ91H1depz+DM8LleO9ENrzeqLg4UE4LG721jRM6Tr4Scn/Boyok4gO2XcTA+
         duVJ6oYlYC0NWygu3rsnSqQJLr7ANNMpIRIlr3FPdwnPjwe7OjuhmBO3cx0QXluPmy3E
         ZpIgg43yvIRM4uzh6AwE+EGDz77scc/mK/lFfn9B7ZlgTd+LW6jvNFj310WXc5FSYCdh
         jDzqf5WS7aUIpPe+WpymWpLbpuTZzRoUpA9Bs/wYkB3GvLqcS3YNSE3BfzhpjxyIuoEd
         4Oag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775746207; x=1776351007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utMWUCCTJuQzcuo1BSAJ7kzz+4RTmDTgmjtXR0Qd9ic=;
        b=HJbRPI6sVggA4uy35A2uVs5d+VBiikC40RDsZ1hHHJOPPgKOinh93mCn57kKHi4LFL
         Rbfimk86ItKfmc+jawaxArH+0Dqnxsmv80swPz+ijIumy82IZg7ft1L6arO8asZ1ghk7
         jlPxHljrfk8F4RnM+loelVNaGvWVbM5rItcgD6Fe70hijaCmtUllP74bVys940SEQikh
         pT7r8wC4RWzWGUVpUT7CKecDYw7qSdBybInWNhNsdSGdiIeGsVNDgdFmwYZhzPAYOTsP
         eaCUHl29Oyzv1NJZMpj/Bl/ek9dUpAy6jDEOradMAYL0HNmPCEflreC1XOu9BQOKdYSe
         /YSA==
X-Forwarded-Encrypted: i=1; AJvYcCVLBjAh78KYJ2j3Hgmon6feHxvL3WGF1h/QAh5SS54RInaPRqXNzUfJVK5wBJargDisItVuPMrhLnvvn1pE@vger.kernel.org
X-Gm-Message-State: AOJu0YwpkH/OnSVPPw1mJ685xrtQ8gqM4C06AMGGklEqDG3sb7cusucR
	vT+5kO+GwcCaq56rXMU2Seaxx4mzyobLMptlYpptJEKnSJcWrJMNDe3pjJSY0KBP3mhapN31V2w
	ceu/kTja55H6+G5Bfz672CNGUwg9afGzISXp535EOPmzpHLFzGhZhDfsXTjXP9IjjlCKA
X-Gm-Gg: AeBDievnDCwkgx2+nx4vm+WSruyvmMaFqyXateFKtAIl4l/Bczuba22m01d1xLXivm/
	azxLlsIfMeVEbLUU8i2K7uhODDQn9jBtAkZrofoC1LcAn+yWuwVT3pvXSdBpF+ABVNWUoz762+4
	lT8LDw7gbag2twLlvGusjFyH9bIU6Ay9UN8zCr0Y0LVAn8ezyk4YwkZjtBVmYNiNJb4u3ulRufq
	jpgjJHx34tBGbIgZ5OCdkugyV0CQaAm0EhAq3YGg6j/IpiXKfB/64eXVoBOG2IZNUsZzo3cQPTq
	ZkDt5KRTqm04GQyP2ZY3P7+Ic/VVnBQ2Ub1elQ2H/uPtZIFQbNtu5cThUl9Y3gfjnwFb+f9DZKv
	kHvuOLvMTfO6sVlORjO1OePubMmlOf4lvCesODP8UwpXrqnjMQF8b1590L8ZVcPeBCPg5S7tSng
	829L/cplJNHiqKuI2YHpv9LiQVkoEvP3sWUBw=
X-Received: by 2002:a05:622a:4cce:b0:50b:2eee:4b3c with SMTP id d75a77b69052e-50dc218e999mr49883661cf.15.1775746207507;
        Thu, 09 Apr 2026 07:50:07 -0700 (PDT)
X-Received: by 2002:a05:622a:4cce:b0:50b:2eee:4b3c with SMTP id d75a77b69052e-50dc218e999mr49882981cf.15.1775746206893;
        Thu, 09 Apr 2026 07:50:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc8417sm5475214e87.41.2026.04.09.07.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 07:50:05 -0700 (PDT)
Date: Thu, 9 Apr 2026 17:50:03 +0300
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
Subject: Re: [PATCH v3 30/38] drm/msm/dp: add connector abstraction for DP MST
Message-ID: <zblb332ibxgafh54rdsb2k3r4b5xx6iy6wnodyzdjey35v2l7d@tjgii2fbiwet>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-30-01faacfcdedd@oss.qualcomm.com>
 <x72v67fsgmekfeebasggtiaofwlxw6ikqch4lxkrryior3yxxk@xiiw75bnj37p>
 <399e29a0-1c52-4e81-9393-3642d50e1e69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <399e29a0-1c52-4e81-9393-3642d50e1e69@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RfCgzVtv c=1 sm=1 tr=0 ts=69d7bca0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=P-IC7800AAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=2cZzWrYX-iRROb9EKxcA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: K52GZr9KkIT_RPi0i2JtheQe_ZBr7WFN
X-Proofpoint-ORIG-GUID: K52GZr9KkIT_RPi0i2JtheQe_ZBr7WFN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDEzNSBTYWx0ZWRfX5kXvP1EqzBzS
 4/Ib5YF/jMbRm63Y02scJ5mAUvyNRUnmrfDYaahGPHX401LFZGOXuWoR3L9t9cSHE2+SfW2SfdL
 rpZDKrMjf5/oNxgQMO52Fu9CKmVJOkSXHvgJaaJLcKfPeq48bUYqgH+Jt9WUZa9BdWkAelqOP0M
 SWHw0AhECihgxLkVFbbMte9uz9dsOrzGBKPesU/iGTXmc0bl3ztxLnGoE3AyPo6ZtuFAEtpV1nJ
 1ig6Eoqi2u5aXuYEA7vp0J5BWK9mldnhodnWzTOr0kAu7R8rHZkltqymQRYAT0ZH+6VgzKFX7j/
 afOOKcipvcj+M5WfB3cFDThmKUcy8Sn4/Gvstzey8y1JsfIY9j5d+GTjH+J6Zm6Pk9aQh1/ciRC
 T0++yVnL/X/2dz0RqKyMpgb0kAufeC2jdaCfv3GGP5iRnU+cXI858eDfd2hXm8nCeR4o6Ryofle
 haBD0GD+NK43iX6TyBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090135
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102499-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DDD733CC3A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 12:01:58PM +0800, Yongxing Mou wrote:
> 
> 
> On 8/27/2025 2:31 AM, Dmitry Baryshkov wrote:
> > On Mon, Aug 25, 2025 at 10:16:16PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > Add connector abstraction for the DP MST. Each MST encoder
> > > is connected through a DRM bridge to a MST connector and each
> > > MST connector has a DP panel abstraction attached to it.
> > 
> > What's the functionality split between the connector and bridge? Please
> > explain it here. Do we really need a bridge if we have a non-trivial
> > connector implementation?
> > 
> MST connector only for MST API calls/detect/get_modes/get encoder, and the
> bridge handles display enable/disable, hotplug, mode set....
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_mst_drm.c | 391 +++++++++++++++++++++++++++++++++++-
> > >   drivers/gpu/drm/msm/dp/dp_mst_drm.h |   3 +
> > >   2 files changed, 393 insertions(+), 1 deletion(-)
> > > +
> > > +	return status;
> > > +}
> > > +
> > > +static int msm_dp_mst_connector_get_modes(struct drm_connector *connector)
> > > +{
> > > +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
> > > +	struct msm_dp *dp_display = mst_conn->msm_dp;
> > > +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> > > +	const struct drm_edid *drm_edid;
> > > +
> > > +	if (drm_connector_is_unregistered(&mst_conn->connector))
> > > +		return drm_edid_connector_update(connector, NULL);
> > 
> > Is there a need for this? I don't see a check in nouveau code.
> > 
> Okay.. i see in intel's code..
> https://elixir.bootlin.com/linux/v6.19.11/source/drivers/gpu/drm/i915/display/intel_dp_mst.c#L1390
> do we need to remove this ?

Again. Why do you need to update EDID of the unregistered connector?
Please find a better response than "i915" does this. Git log might have
some story.

> > > +	drm_object_attach_property(&connector->base,
> > > +				   dev->mode_config.tile_property, 0);
> > > +
> > > +	drm_modeset_unlock_all(dev);
> > > +
> > > +	drm_dbg_dp(dp_display->drm_dev, "add MST connector id:%d\n", connector->base.id);
> > > +
> > > +	return connector;
> > > +}
> > > +
> > > +static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
> > > +	.add_connector = msm_dp_mst_add_connector,
> > 
> > No .poll_hpd_irq ?
> > 
> I checked that poll_hpd_irq is only used for certain specific scenarios, so
> it can be added later when it is actually needed.

Which scenarios? Will this impact USB-C or any other usecase?


-- 
With best wishes
Dmitry

