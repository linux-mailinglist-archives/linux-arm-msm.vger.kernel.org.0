Return-Path: <linux-arm-msm+bounces-101820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDMLLmKJ0WmlKwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:57:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC0639CB02
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 23:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F31D0300B742
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 21:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305DF34AB1D;
	Sat,  4 Apr 2026 21:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iKEirlY4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="azVUyMpa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D70A92E
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 21:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775339871; cv=none; b=LdYg/rq4HUQQk4srMua+WCsZBY5tMrO6jI9L1h4Z5sJzndXLyIRxX4ySMm4mtWk+6GaHf0D8Oib7AsI+Rlg2Al1Xf6zxxZ1ysiDzdHgrGkU1DmZoFfBDALur5kuXLUH3VtBK+hlLdJmUzuqtkGNS+rpCqwvTJwh0KgMNyoF2QPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775339871; c=relaxed/simple;
	bh=4Cb+joQkb4aMBvTx1AuL5JJ4lUB1Yjca2gHJBvl+eqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=enhyEkfEIqPT8xKzlBalq57jlJFaQH+s83cZ4RkCe3Wj/45RANTP4ZL1LxM0EtnupAGG+XqyJmoYlLc7N+5MP4ZVvzyErPwLzzUSSStViM6TVvNyTKhs+pU97wEFhAsllZkeFPSLDUUbHphiBavmVsQ8D4J/hbPdQuA0kmDo4xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iKEirlY4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=azVUyMpa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634Ixufh1483772
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 21:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ElmZ7iJb0cInL3gMdYY09UVw
	xjBUS65tHjlxby6xRGQ=; b=iKEirlY47e/C7JboreWhr/r/twR6Jqyrb8pQurQE
	NIwd/T3s/U01EcSNN4LFKK4QS/c9oyQ9b7Ezs2qhdi1lkAkIjIivHQUiHMOqTGm3
	LzySn5sQOLNqXjr+xJAEzvMPGxJLWOEGKaiU23U77e+FZ4hKubGfC1b4yifYQkkJ
	nq3/sq5R/AmGV/RCP18k55DpnWp5BiVmYxp3o1JfSuMW1GNgiUEyJOxkFAf5h+hz
	FJrwWBvTcbmc/RoyxYYqRDQkDtGC9zbNzHDvSxRq14mDCLov86SDhdJynjiLR9OC
	+Pms20qCqVgrk9Eo3Tqe/0EyNc6jeR6lgishx5pWn43ZXw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daudd1f95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 21:57:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d68dbb77bso6820771cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 14:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775339868; x=1775944668; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ElmZ7iJb0cInL3gMdYY09UVwxjBUS65tHjlxby6xRGQ=;
        b=azVUyMpair5mSJOGXh/d71RsNamziEOTD4Ui/NR7mbywExbGWhWWEg65z/ik/x6UF3
         +GFaTniD1kDFrP7oFRPIEQPHv/smPHHKLRlzWMA+HdM96bJTzO5KSls1tH5qrse4nedU
         aoAv18gmhokUfyGn7m7vna53QEBIsb0xUBc7ZicAiOIFZHZbtSzNnsdgr2JyJ0uzFKch
         T7C/04ebWCFbioVWaHuAAneUmo/qnn4XNWB4sHtamKrK3En8Gy6toorDCy3nzV/J1Z8+
         Nv1EwTnept6/NPo3HhiMNYXtKkN4+dxV8FH4KXnfPuFWFi1RzSVZtG7PdmvWzLu1AkXm
         cdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775339868; x=1775944668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElmZ7iJb0cInL3gMdYY09UVwxjBUS65tHjlxby6xRGQ=;
        b=TcnG/pLcgR6u93FGJ/f0CiEIDasXFNKLtOyzwDvSVCxOdSxjDAnqlbPYseNKIpNgYY
         cSj7v9fDR4Y5rrulr3f5ieK4NQ7gTx0BklaZp2ErzDGPwHBbSd3haxsFvYpkuJZJCjc9
         b4SLZid/PnG8Zt9U2bPc2AvCmLu3JCMvAZf9EPZXS1/G8Vw2L3ciWL+x67LdgaRt45O/
         WP7RYorALOrmJaGny1/k4pSeTLhGu2LXPf5jTXd/Fdbq9j2ZkhMsd9cFuDYCZBYwUrkZ
         +h5l+ykbSFoCysgUJ18mbY5U+pD2SrRWwdzcXr2ZX6Xuhkn2MOkCI8+Jhkvvr4mVfVTA
         Ysrg==
X-Forwarded-Encrypted: i=1; AJvYcCW4yCibvLTboEwdI7YGTIyuuwTw0QcU52KIX/juwf4BqnOuca4S51LslM3GvKWPXzhDOaobqCO67rf4sWk3@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqqo8//WnROIm244wSvIGAwVKDScsMepALUE4ViuMivAcjbc+d
	oZuPeUbjzfVeNlopPexOQpvqxYogzvk9FVGSWTc2K52cOsS9iWW+ex3UAJRzL4ZS9o2Ii89lRxp
	UjPnka8oy/F7XCNStVVO/WGsQqKT2d0vS/mZBJ4TQGuTorlZTEiBek47mqkj92BoSENR1
X-Gm-Gg: AeBDievDQsyOkkd73P8O2gcOz4U1qLRuE40oZWhZWhp3ocoTH9OH5mMWjOWpIzIikqx
	gEqyclEFMf458n4mgBSlcsTmW8s98ni88qJ3KGe+cEDF7Zt9MxgQ5COuUoOd6WLU93bODYCYH/L
	12VUY8mch6y3E/QY+zcM5Z0PLjH9DgkA5j/HRRsydbSk2WfuW3cF/SUDWSrcUlCtKNa9Nvffccn
	mZ8jhrZD4bRPq6Q+aLty+3oRoA+BMzGoDO5XNatS5OAc8B6w0ESQcW0y6ju9OymuwcK+K+qibfI
	izp8bV1/SwRwBtp+SvvC65GqIug6k2BLcr6sujqPaxC63NRGZaRkB/CrxMtn8qRUUxENfzsMs1v
	oa2Po7/XTdDaP90toyqMndhae8qT2w6cTPtex4LTCkmjWoqJ/jTsnI3kv8O9V1qOWeCA7NZjzl7
	xdHtVidS/Y4+bp2+1oIUvCZN7JxJzAoErD3ik=
X-Received: by 2002:ac8:7f07:0:b0:50b:526c:541c with SMTP id d75a77b69052e-50d62d0f97dmr120363251cf.50.1775339868196;
        Sat, 04 Apr 2026 14:57:48 -0700 (PDT)
X-Received: by 2002:ac8:7f07:0:b0:50b:526c:541c with SMTP id d75a77b69052e-50d62d0f97dmr120362871cf.50.1775339867784;
        Sat, 04 Apr 2026 14:57:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fffb53sm20787601fa.16.2026.04.04.14.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:57:45 -0700 (PDT)
Date: Sun, 5 Apr 2026 00:57:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC v2 6/6] arm64: dts: qcom: milos: Add Adreno 810 GPU
 and GMU nodes
Message-ID: <ahv2d5zmbh7s5t7uu3s3kepkv3ecpxukfqy7hqnzjd3qhuaw4n@bpprcym53jce>
References: <20260402-adreno-810-v2-0-ce337ca87a9e@pm.me>
 <20260402-adreno-810-v2-6-ce337ca87a9e@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-adreno-810-v2-6-ce337ca87a9e@pm.me>
X-Proofpoint-ORIG-GUID: Dztfv9C3_-XFX5nEiUIyh--O3ESuovDw
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=69d1895d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=REw7ijk5hhyOG_fLH2gA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIxMCBTYWx0ZWRfX608iyHDspNv/
 jORvSG8dKppMtWjuLyEW1pasuldfX7Hzq/F/4Ufd2NYOa9mZ2uAAuhmkFosPzEQ1wejBMtwPHlN
 mLehxTNi5VBQIkD7YA/xfIu1ml+V07uBeriee7+UvQLQAavRbSec2I10aFN+1P8ut8DznuCdwFD
 KmQuF+I68rEkS65ZA26NtxR5V3bqeWpGKKihgK/iO+8LC+r3Slthk+Vp6sOenHsrvs4Yxes5vR5
 AgNSwd1Mx+j5UWo759gMsboE0bR/3M9fF7n5TDiAzJsmV4pzTDZgMA+M42rg9jjWwpqaKu1HhZu
 ZX0vgFk9i0aQCLCLZ3OxscgpY5p30q09uvEdv0MWZOY6QUER614Lux+hYlbSyG6ybLddtfxDCGE
 EzAxura2GPQ7Gbu1uJrWMu2GleI4rRVmSNXohpJ2wGU6m25h655JlfS+3GJCqz1aVTPKDwJIeE8
 35j3EnVW4aP9S61ZVeg==
X-Proofpoint-GUID: Dztfv9C3_-XFX5nEiUIyh--O3ESuovDw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040210
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101820-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,fairphone.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2DC0639CB02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 11:09:52PM +0000, Alexander Koskovich wrote:
> Add GPU and GMU devicetree nodes for the Adreno 810 GPU found on
> Qualcomm SM7635 (Milos) based devices.
> 
> The qcom,kaanapali-gxclkctl.h header can be reused here because
> Milos uses the same driver and the GX_CLKCTL_GX_GDSC definition
> is identical.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 148 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 148 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

