Return-Path: <linux-arm-msm+bounces-100757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAoFKEZTymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:41:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF2E3598C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B4D73064E25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287753BB9E0;
	Mon, 30 Mar 2026 10:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYEqS+SV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HhHBPrvm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72CD3939D2
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867005; cv=none; b=DOWGIWIT1CQcj953Ykw/76IQ/6zZAmaPMrIycdgctcheas3D3c/KULHZZtaJ8u4pEVjGLpcajFrIgz//8tjiyiCsbHDrsirkTHTir2N+1prFSEgpZdFPvAFs1CDZV9TbQrqogvmypWR61YKFwTrdVUqN4ewLChYM1YqPxN0Bsjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867005; c=relaxed/simple;
	bh=VPOfGB2syNhPsT2AkSBgpHqMW8U+3NOfV/TPtILm/7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b0CbQsRkLbdqpFCt8Mxpsn2gJ0H8r+Pj9Es4F+1MKftdEc7MvsycJF4KMx4jShkbqK8iu8us1kUADbm9DOEfLDQ+UZA6Ev9DCSU0jWst7LCJ2QoesXUAl0HRpyMjf2cOwANMLYVAw9dp+AyFMeN/D9vAGrfG2zzDjKzDDp50tu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYEqS+SV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HhHBPrvm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U6SnpV2525265
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ljcssy/ERf4QcGfS8vs7FwRb
	Tir6aoFr0Gd62KpTua4=; b=kYEqS+SVU41e3Atdxm4iYAnATL4KZ+TCmmERRhUh
	+sqSTorjgusQWZYcl+v+5TwAEvhC+wvYgGSJ2IBKTbhB1DWgwIAVD+CChToHEQDO
	9kBFZT+PFaCIn4vLnL9nMUMi28qFRvj9Dw7FoOqZ9DGSks6lTrjV6jEJpXOdKQC1
	krWTV1v0EppikB+C0MnG27KWbhLUuGAR16kSDE9Zs0A9iYtaHLQFu4HZMxT8k56j
	PGLHoCjUEevfp9i3QoZmd69gla81dZOaWA8N9nFxM8uAYQh71VzTPGbyCDUA8iu5
	ZwH1awYo/0Keb67yav2Q6+WRvHRuwHHKiVvnp5Th2bZXng==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmku50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:36:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2cbe7223so142570771cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 03:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774867002; x=1775471802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ljcssy/ERf4QcGfS8vs7FwRbTir6aoFr0Gd62KpTua4=;
        b=HhHBPrvmxczk9RUUUpqVISzOPYRZooNOVXNmGNCRYMKa7TmVtnDYGPo7szYryQKqu0
         LuGFhaZGsnE9alKEEDkULET00i0S7sRPjPw/SP8Yp2lGfdGEzsgVq6Ze/Q6TIs7q4gS5
         wVRd+aL9RvUb5tuPkCf3eLt+N82VcYzqf0whvdEdueD1yKI9RBF9y3NqhMYWBzMua5O5
         qI2XTY5DV7iwzhcg75guxULD6bNmwVGjJDJq85RYLoPthDaxslWVQEf/AHgVgpHVCqLC
         +ZYycvYQBDmnNiQ7y25SwWgjklwssyBfZ/rqhBPnL6GwCvr5kQdjD2ahiMkY1UDTU/Dc
         oTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867002; x=1775471802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ljcssy/ERf4QcGfS8vs7FwRbTir6aoFr0Gd62KpTua4=;
        b=qHqCMtFqDuy/RpJ3ZR5cl8K6gOGFzqKas5Rcfdt8bBo48SsTtGdGxHEDQYsXQHX5p9
         hvWqMhAAwOXGrP1MVTTgtQb4N4Hh/PyO+Lupd1kcqgoGqXGgxX2ltpWkQWbgOmBARspg
         xtP2dJ6VXDHkUVYbCsoanveq3b9Vm63S794n6r61NG/NjLJn5TTXwhb8nUJ9vFqippWa
         yXFb3aoJ4kJizD405MTmIHwnEQX+SkXR/rX9Gm01R2j097PgMbvHuinv4J5N0YwwlpkV
         IPKz6k8JzmBRMcBGA2d3HyUJVX98BkNrj1YOgPHL0pVPjf+WUNQgR8gYsxmON11/Nmzb
         SfbA==
X-Forwarded-Encrypted: i=1; AJvYcCWFv7jm/y7D5CVTQ9YuK9/bwBema2Ar/VsICC4VxPWWqnmQAcItonYD8tGlijvqTXlZcTx6rukx+tE1Wh7p@vger.kernel.org
X-Gm-Message-State: AOJu0YybBvgl/9DACMtR+I0l6PK2Z4+VcC0PiMYYJTlHhnDdvMW4ED0o
	IM8FlHf8nFBvj0i1Sgvgsdv4mNzT4AsUbzJyeE4/kDdICa7DYLb34Ie2vWPci80Zbm9lnC24d2G
	b78patcsy6WGLIsK2QxZUdy8uie6nv5Sf/t+07ZGLquWyWLXqE1iHE68Se75fnKr+vdJp
X-Gm-Gg: ATEYQzz7/ujGWHhTw0YH68HbEdrPGcgHw90Uv+cbH/jmdTqheRa2g5SVQ/HMP0cdPnG
	L3gDs90ddKWlyY9XjuPiqzd5sGOGxcBqFnPY3LpNjBNYIKfSPzashNqQBFO/syZbEHNb1YJQW1z
	ppMuJeGqJ/Y8keLIkd9BxDQ5UofTegS2u1cmBeSa/iu/9SG8wA3jwCJJNA97e4oMHI9mA/Tu1xE
	JOpIl/k4wGTA8tGfB8UkruYOnRcyqBWs3yVQz9pM0VkCFUdGCVs6RiI6QzR11B21UyyDmde2cH4
	PAOWofu6owwqXItUEkBCDJ2HKrKJ0QNTALO8Fykf/fyD+gacALYNw9jlY64m5TtIAMyKL4nV7V0
	vBrDZXSDEVuxXdoZilHrj8Q2inCBiz7NNAs8bj2pws6W5wOyl8o3vFgh2U6dMI7xYlvLYz8sRxJ
	j7E3PpEZPOQEg4tfkwhfRcRdwp5S0BcYwAhkQ=
X-Received: by 2002:a05:622a:345:b0:50b:352d:6b5c with SMTP id d75a77b69052e-50ba39a4ef9mr160734811cf.64.1774867001733;
        Mon, 30 Mar 2026 03:36:41 -0700 (PDT)
X-Received: by 2002:a05:622a:345:b0:50b:352d:6b5c with SMTP id d75a77b69052e-50ba39a4ef9mr160734411cf.64.1774867001254;
        Mon, 30 Mar 2026 03:36:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b144f4eesm1549972e87.57.2026.03.30.03.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:36:40 -0700 (PDT)
Date: Mon, 30 Mar 2026 13:36:38 +0300
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
Subject: Re: [PATCH v3 12/38] drm/msm/dp: introduce max_streams for DP
 controller MST support
Message-ID: <iscoaaduakkhs4rpbut6alybigt23vxzezl6o5iemrelkrksad@6fmew7afqogi>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-12-01faacfcdedd@oss.qualcomm.com>
 <lngtq2tw4qajgjk57un5xrveblkmtjkkz3yjgue53vp6wwmqmf@owderf4zerfq>
 <7e6a7bdd-a94c-418e-92e6-524a58cdca46@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e6a7bdd-a94c-418e-92e6-524a58cdca46@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4MyBTYWx0ZWRfX9uSe5y12DiLm
 7ud2mF1c550CqHl/FSrqd8jP09r5bHPZfmQsJxXhS1fu5pnTD+HQgIF1AnibtzXc9LtGFna4X/h
 0K5E081R6J9G20pA2QhKWA55e5V7DhljYeS63PVJbhB23jMrvD82HtfXnoHX3twocddhGXO45g7
 ES7GgQOU3JisMgEAtk0Bo+Gc6UQgJIUhE2irw3rd5o/72EtPmLUgT5+Ch2kfpFILWPYxZmE3U+Z
 nVl2JC0fgZvSiuxCfB33VZk1MPBk1esbTsolmiizaNI2bh7BsRqKyB/VqxcpYhgZDCaudD3/a5r
 1yv7r+yVJF7kHCtEVCRJniIAuQz9kguwn2UIgAekayPrWyFjp/C4BkLTT0MJqt+KraRDhXzUvRw
 ztjCKo26vO0XL/WM4LciXpTaaGu84rhsJzdhQ97u4P0r2DpWoNHh3d6fp4TqL8SS1DpQHHqvo8i
 9ku/jn/0x7lMlAa9t1w==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca523a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=lhG8_MBpUet3lCht9r0A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: TWywgtggO5AVcti7XqDDOr3pLQHGWren
X-Proofpoint-GUID: TWywgtggO5AVcti7XqDDOr3pLQHGWren
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300083
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100757-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 0CF2E3598C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 05:59:28PM +0800, Yongxing Mou wrote:
> 
> 
> On 9/2/2025 5:41 PM, Dmitry Baryshkov wrote:
> > On Mon, Aug 25, 2025 at 10:15:58PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > Introduce the `mst_streams` field in each DP controller descriptor to
> > > specify the number of supported MST streams. Most platforms support 2 or
> > > 4 MST streams, while platforms without MST support default to a single
> > > stream (`DEFAULT_STREAM_COUNT = 1`).
> > > 
> > > This change also accounts for platforms with asymmetric stream support,
> > > e.g., DP0 supporting 4 streams and DP1 supporting 2.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 21 +++++++++++++++++++++
> > >   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
> > >   2 files changed, 22 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 78d932bceb581ee54116926506b1025bd159108f..a8477a0a180137f15cbb1401c3964636aa32626c 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -33,6 +33,7 @@ module_param(psr_enabled, bool, 0);
> > >   MODULE_PARM_DESC(psr_enabled, "enable PSR for eDP and DP displays");
> > >   #define HPD_STRING_SIZE 30
> > > +#define DEFAULT_STREAM_COUNT 1
> > >   enum {
> > >   	ISR_DISCONNECTED,
> > > @@ -52,6 +53,7 @@ struct msm_dp_display_private {
> > >   	bool core_initialized;
> > >   	bool phy_initialized;
> > >   	bool audio_supported;
> > > +	bool mst_supported;
> > >   	struct drm_device *drm_dev;
> > > @@ -84,12 +86,15 @@ struct msm_dp_display_private {
> > >   	void __iomem *p0_base;
> > >   	size_t p0_len;
> > > +
> > > +	int max_stream;
> > >   };
> > >   struct msm_dp_desc {
> > >   	phys_addr_t io_start;
> > >   	unsigned int id;
> > >   	bool wide_bus_supported;
> > > +	int mst_streams;
> > >   };
> > >   static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
> > > @@ -1213,6 +1218,15 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
> > >   	return 0;
> > >   }
> > > +int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display)
> > > +{
> > > +	struct msm_dp_display_private *dp;
> > > +
> > > +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> > > +
> > > +	return dp->max_stream;
> > > +}
> > > +
> > >   static int msm_dp_display_probe(struct platform_device *pdev)
> > >   {
> > >   	int rc = 0;
> > > @@ -1239,6 +1253,13 @@ static int msm_dp_display_probe(struct platform_device *pdev)
> > >   	dp->msm_dp_display.is_edp =
> > >   		(dp->msm_dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
> > >   	dp->hpd_isr_status = 0;
> > > +	dp->max_stream = DEFAULT_STREAM_COUNT;
> > > +	dp->mst_supported = FALSE;
> > > +
> > > +	if (desc->mst_streams > DEFAULT_STREAM_COUNT) {
> > > +		dp->max_stream = desc->mst_streams;
> > 
> > We should keep compatibility with earlier DT files which didn't define
> > enough stream clocks for DP MST case. Please check how many stream
> > clocks are actually present in the DT and set max_stream accordingly.
> > 
> Now these DTs should already have the MST clocks added.

I wrote a different phrase: we need to keep compatibility with _earlier_
DTs. It's called an ABI.

> > > +		dp->mst_supported = TRUE;
> > > +	}
> > >   	rc = msm_dp_display_get_io(dp);
> > >   	if (rc)
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> > > index 37c6e87db90ce951274cdae61f26d76dc9ef3840..7727cf325a89b4892d2370a5616c4fa76fc88485 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.h
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> > > @@ -29,6 +29,7 @@ struct msm_dp {
> > >   	bool psr_supported;
> > >   };
> > > +int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display);
> > >   int msm_dp_display_get_modes(struct msm_dp *msm_dp_display);
> > >   bool msm_dp_display_check_video_test(struct msm_dp *msm_dp_display);
> > >   int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry

