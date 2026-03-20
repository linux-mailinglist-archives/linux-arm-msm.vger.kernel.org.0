Return-Path: <linux-arm-msm+bounces-98884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YONiHYPrvGkL4gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 07:38:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4B92D649D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 07:38:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81D3330763D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 06:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97193290B4;
	Fri, 20 Mar 2026 06:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E1UbVc33";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OsXcMsUa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BA0327BF8
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 06:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773988735; cv=none; b=rXKX7023kZSNbleQHAnQeZmO1wmwQ3ExNeE6a8eR4QbfD6o8iaeXHzWEClEjG5DOn1KH5w4psQTbs0YN4CCv9mxqfAnwPR3tUVmpwHTXrCDSKf0bHXdaza+wdpWn4e3JbXiY9kPG+qg7o9H2yWP1tYSapq4bFBKytP2JoGPGJNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773988735; c=relaxed/simple;
	bh=CxDVCj3ohKZ6oTY4seEQOO5QVzmQ07ktZ1kn6AvkhX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EsVk0BjmPJaTO+dgZB9GIwfT3mCKOAQsJAX3/WAhrz8108UsCAp+jAjaAzG1u2CFFz4H52VLeyc8NzeLEisVK9tjnS+J18G0DAN40mSYPXhlw4Zd2JxdwsbYZSwhjva/PY4zHOWN3yd0BKBRx+VNeKbUJrc4a8atvf8d48kVGWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E1UbVc33; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OsXcMsUa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2Xice2253810
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 06:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e1jtdLTR8LSxuOmbCFJP8N3o
	W++FXdcqMYVb+LnFgdg=; b=E1UbVc33JwnEYjRLL0pbfacWqX2gWHBLKhPMitmi
	OI4UfkYT7k87s0yhQKJLsqOls9+0txoOHOL9izSIRpvAPzljwD8AAePRNxpDjuof
	oyPmcwYPIkNXM4547E7QZeDHnqlYqFtS42MejUj2Q4mHlDDxvSMZAXRgWoV7fuwi
	EtRt//nVoIlrb83QrCF93KiH+dnygnxtTXgBG6u/bVlyeBgpDGy+i4Y1kFDMmlpv
	lumDvP3wk1Vgq2oIdM9ROFP2JgG2EUC1Tl3OmiLMqm6a7Sv2BzarEWsnpLmNG05F
	QG1XRdr0rNjgZP4+XsbJVCSHz/lu4JbIgtnfzFHEPfPbsA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0mcma6f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 06:38:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5094741c1c1so130977091cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 23:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773988732; x=1774593532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e1jtdLTR8LSxuOmbCFJP8N3oW++FXdcqMYVb+LnFgdg=;
        b=OsXcMsUax4v2JkiP9CT+costVOVUrE1aKpYhj3VBD7tsFaJ7l+99bNe8JaVGe61Hxh
         9CKypnR5IeO/cezkIiC+EqAbvPXsj1nS/6dzyrTcxGtC3CsNbNDAJQperwLsxVkKfpz5
         r2NhXWiLecsxG5CaV7kVYErLcPC4M2fsc5CjocsUIrrlfJVV2uyPv23KKAkpKenWc5T0
         lY5p9rsk0UqPtaC2z3USysHnRXzV0WF4urumTcAZbkoSVC4RmlT93XCqUoq11WIstUvz
         TOX+PfpDpnh5NScVbI4vSHSxrjDnFcbgWEnBR16vU12m4ywKBWA9qx+E7mFxX68i3d98
         H8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773988732; x=1774593532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1jtdLTR8LSxuOmbCFJP8N3oW++FXdcqMYVb+LnFgdg=;
        b=l8J7TUev9aqir+S4FZfLnhV6osCqFmgAFQTUuRwIc1CRsOL7ilr9jOVS26J8jLCgjI
         t+73gN0Duhiv1La/fVQ3YCBasX3egYeN/idlj4teqecQXBJbKr9EBGsOJzdRz/6h6iWa
         GqCi+1d+4ZfiOciopPGTYdtWqJamKdHhaTjTKcDI+VUewujbJDg674LAqPxO0dBc9cab
         IM+Bln3/cgeqVXA/GgZCIrLyOdalw0xwirLouKpHxSW6ny+wFNZR2mrEJ2T77Qp3um5d
         m8KYKtWJLWzoqk/DT+LZRMHfo2CewgZGSNLP9rvoz+tf7lGIHh7TdCunBpcF5KtxhCAd
         abgw==
X-Forwarded-Encrypted: i=1; AJvYcCVjUGJsn6lbZhfavViHW9v8mfym1VqD+WlKMxFLudNAWxl+MlFQdTUL58r6Kh2YASnym/utHn6QEuece0LK@vger.kernel.org
X-Gm-Message-State: AOJu0YxbAiq3r3TluaS8kON8TlwmsyDmWC6QTYRK8hn/4zibVYTZA5sU
	ykZATJZGi0K05aR4Qy0xclsuGCxIbBCjRE0F4whu0w5wygZz+Yu8FNfHYTtBErmd+EBj70xVRas
	LxnxBkZoWWn20DY63/G8on6qys111jStoj534oXM+qLDvp+HesSIsfUKqwv51zxtOsr/S
X-Gm-Gg: ATEYQzzUPVf/NpI5pS1C3qaMIzW8RJ4LvRUZng6//4XEnNg36zbKPSeA8r4XvGQeJn7
	97qprxc2C7WaVH615K6hnxj8sX6MJIxJ2BM+9unf9bYvrkb8vZ77ht9R3xHz6eIbG1IK+2Rez7N
	5FiwKpcXb2CKuaOppgGcpN7i4SOP6CyNnMwkdam9BbvUd45Wd0EgAimbK36+jJwz7hnKat98RuJ
	K676NhkLeqDUcVnQ2TBG+bD4d/L4W5SlpVIP3j+ZSpkukOE2savcVtoXG8e+MlUC38mrFineGa5
	3yYJ4g+0BqVIa3OmPXqzlSzctHdxMAqSQN5y2/w51i7IBs87QGHQw8jMFrSBaOiiGqYPN+xZMLR
	BzDqsk35uNkFm9P8CHs6QOphKrRG79SXnxnhFFbbvR5Au1G9Vn60H++S0C7z6X9iWq9FuxgH6PM
	Uf3ImB/bO5+GTTzpQ/sLaDqbXWMwmnrofMejA=
X-Received: by 2002:a05:622a:6097:b0:50b:2640:22e3 with SMTP id d75a77b69052e-50b373a0221mr27399341cf.11.1773988731724;
        Thu, 19 Mar 2026 23:38:51 -0700 (PDT)
X-Received: by 2002:a05:622a:6097:b0:50b:2640:22e3 with SMTP id d75a77b69052e-50b373a0221mr27399051cf.11.1773988731214;
        Thu, 19 Mar 2026 23:38:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192da8sm357209e87.10.2026.03.19.23.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 23:38:50 -0700 (PDT)
Date: Fri, 20 Mar 2026 08:38:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Jonathan Marek <jonathan@marek.ca>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 4/4] drm/msm/dpu: fix video mode DSC INTF timing width
 calculation
Message-ID: <a7jukaag6juswudeeuskgzahzbixxn5oq4qjnxfny2oapinfnv@kmn7b33yxric>
References: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me>
 <20260319-dsi-rgb101010-support-v3-4-85b99df2d090@pm.me>
 <1360a31d-669e-48df-a1be-f0af4a253cd7@linaro.org>
 <3gLK4s97giqqXagfHKhfiIHbfbl2snwfOj9dcTNGPUYi10w9-1EdATqzz1LPCVTpz4bLFYOm8u_Fl8PfC7t5yabows4UCzRKVwjraEWW6hc=@pm.me>
 <3f8763af-aad2-4d92-90c8-cfd290212503@linaro.org>
 <7fb9dd9d-13f9-7bba-93d1-08f42dd6ee38@marek.ca>
 <oihbfczsj5cg7qfjjt6jvyodjnjbezyrv6f32vmg444g5bx6ow@r54epj7ilsyt>
 <da050aad-381d-ffb7-ec7d-8ed8a80d790a@marek.ca>
 <pVeuxasxaau60kEIgTW1W6DmFLuzLUGYvmYtTN_Cv0htPbokC6lMObfmql3lWkAxtO5Lp-aD2l0Uzt_xL8cGYVxBmDey-5-HA7968eocg8c=@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pVeuxasxaau60kEIgTW1W6DmFLuzLUGYvmYtTN_Cv0htPbokC6lMObfmql3lWkAxtO5Lp-aD2l0Uzt_xL8cGYVxBmDey-5-HA7968eocg8c=@pm.me>
X-Proofpoint-GUID: a1zCrRFgOZB_u8c2bpHZoBgSSPGeV_s5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA0NyBTYWx0ZWRfX/t3shiU2w5gP
 hCSaXnF92/38J+btE2ylsogYowtBNtX7qPFvWetESsYMld0fEX6Pzl678JkmrKqjsZosl/5PXR2
 MzXngHtE57imcJtZynhZiq9n5d2dKK7e8QKKlMNOTpuNtjjA6QH8MACYZInoqeZykXONYdqYhVW
 69OoBGE0k0jdgsTza6mDnIu9V/WSRazleN9mopjCmW8a077OD0cYqifeEXM8j7IR6XCIzAo8WqQ
 sjFZyaY58CINMi8XX4f9RMfkSPpsIxNwdmTsRuRgdFCpngbsWA8tWNxZs+8Kda1bzAwHBYfwo5r
 tSMvTfaxBEhFaX4E90Di3QftqQLtvYwhK3sNa6u4VdIxPZsB7FMNafT0plxvYg2l6dsQ3bK2tVr
 YY1gaStpvAxuC/2QwfrQhGDt8nHX4/deoZL5GXlpJxrBLQv44SvkpbMWpabpunWGlJ5VL2dDZwd
 weJmo6pIjQqIAdFVDDQ==
X-Authority-Analysis: v=2.4 cv=BdLVE7t2 c=1 sm=1 tr=0 ts=69bceb7c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=RAbU-raeAAAA:8
 a=87TsUx9vdYXdEiTG-ZoA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-ORIG-GUID: a1zCrRFgOZB_u8c2bpHZoBgSSPGeV_s5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200047
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98884-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[marek.ca,linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,marek.ca:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.963];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CD4B92D649D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 04:46:02AM +0000, Alexander Koskovich wrote:
> On Friday, March 20th, 2026 at 12:25 AM, Jonathan Marek <jonathan@marek.ca> wrote:
> 
> > On 3/19/26 9:45 PM, Dmitry Baryshkov wrote:
> > > On Thu, Mar 19, 2026 at 01:23:03PM -0400, Jonathan Marek wrote:
> > ...
> > >>
> > >> That's not how it works. INTF (which feeds DSI) is after DSC compression.
> > >>
> > >> INTF timings are always in RGB888 (24-bit) units. Ignoring widebus details,
> > >> the INTF timing should match what is programmed on the DSI side (hdisplay,
> > >> which is calculated as bytes per line / 3).
> > >>
> > >> (fwiw, the current "timing->width = ..." calculation here blames to me, but
> > >> what I wrote originally was just "timing->width = timing->width / 3" with a
> > >> comment about being incomplete.)
> > >>
> > > Okay. After reading the docs (sorry, it took a while).
> > >
> > > - When widebus is not enabled, the transfer is always 24 bit of
> > >    compressed data. Thus if it is not in play, pclk and timing->width
> > >    should be scaled by source_pixel_depth / compression_ratio / 24. In
> > >    case of the code it is 'drm_dsc_get_bpp_int(dsc) / 24'.
> > >
> > >    For RGB101010 / 8bpp DSC this should result in the PCLK being lowered
> > >    by the factor of 3 (= 24 / (30 / 3.75))
> > >
> > > - When widebus is in play (MDSS 6.x+, DSI 2.4+), the transfer takes
> > >    more than 24 bits. In this case the PCLK and timing->width should be
> > >    scaled exactly by the DSC compression ratio, which is
> > >    'drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_per_component).
> > >
> > > So, this piece of code needs to be adjusted to check for the widebus
> > > being enabled or not.
> > >
> > 
> > The widebus adjustment on the MDP/INTF side is already in
> > dpu_hw_intf_setup_timing_engine: the "data width" is divided by 2 for
> > 48-bit widebus instead of 24-bit. there shouldn't be any other
> > adjustment (downstream doesn't have any other adjustment).
> > 
> > a relevant downstream comment: "In DATABUS-WIDEN mode, MDP always sends
> > out 48-bit compressed data per pclk and on average, DSI consumes an
> > amount of compressed data equivalent to the uncompressed pixel depth per
> > pclk."
> > 
> > Based on that comment, this patch is correct, and the
> > ''drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_per_component)' adjustment
> > only applies to DSI. 
> 
> If I keep the INTF side at /24 and change the DSI side to:
> 
> if (wide_bus)
>         new_hdisplay = DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(dsc), dsc->bits_per_component * 3);
> else
>         new_hdisplay = DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(dsc), 24);

Please check the actual fps (I'm usually using a vblank-synced GL, e.g.
kmscube).

At least this matches my expectations.

> 
> This also works on my panel.
> 
> Should I send this in a v4 for this series or just leave it for a seperate
> change as panel seems to work with /24 here anyways?
> 
> > (note: newer downstream looks like it would divide
> > by 3.75 here, which doesn't make sense. older downstream would divide by
> > 3 here. I guess downstream is broken now and video mode + 10-bit dsc
> > doesn't get tested?)
> > 
> > on DSI side, "uncompressed pixel depth" shouldn't matter either: DSI
> > only sees the compressed data. But based on that comment, when widebus
> > is enabled, by setting DSI_VID_CFG0_DST_FORMAT(?) to 30bpp, then the DSI
> > pclk is in 30-bit units instead of 24-bits. And with this series DSI
> > side ends up with the right result if 30bpp format and widebus is enabled.
> > 
> > 
> 
> Thanks,
> Alex

-- 
With best wishes
Dmitry

