Return-Path: <linux-arm-msm+bounces-107326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LUZHHCGBGrVKwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:10:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A92534BDA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A9A843294829
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76A592D8390;
	Wed, 13 May 2026 13:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GKTdyeLJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VyyHtjxf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2E22D739C
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679828; cv=none; b=ivsrm5kfaxm8oO1bND0/D27lWuQfE5CXbZws2bet3uBWJXMbpTtnBjzPKpnBOU1v4ie0iWLsAS/eSGo/leve/YXE9JR03yO2O1+ueqHMMaSHQG6pC65c4Ld1s0H3f7Am2tNEbSQxDKKqK8asLBaSLifdL1XfVUZfd9XBmwAZ8Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679828; c=relaxed/simple;
	bh=7/RcjxaFT1fIEISCL9j4ZkyEF7rqhOQDCbYWGGg3+yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z2OVpPutmhfs+INpGfMXCU2M9lp8W0gQ2dlZv5XRMhH7TrQefOZDQ75lged28gZyblglcOIRhgMPG+ZT93e9chD7ZHL5tYXX9MQlMWhhEeggrq3QoSood2zTCOMfk3d2DsWxNXHUc0gsN1Gfi1LOGE4flZtPeyytIhZShU3127w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GKTdyeLJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VyyHtjxf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAWri71393359
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=93ck9j7UNs5qr5E3FjJPwBNZ
	/eteNwvkCjcQtHOmT5Q=; b=GKTdyeLJMGh723ckJK6vMuBtBcPoCN8ZP+cz7YIB
	KhgAR6DLAen9msftylz0koy81NDcgaM+9t1TUWDFANfMlHogAvottqN1dNBiTwX1
	HiGe0tv2KkvTKWdoD8iEOpTI2ydjybUpNUZ5+RzLe1Zgaat0javeNzqm0lrN6jqm
	D86Kzw94NNirnYqxNYl3vNhG+z1KmmoH/JOudZF2/n93VyPg8Il9flr9t9uNzxzF
	7Vszsez/Y/iocYGv0fYzZrhosxSKXeabojatqrMw6XEx8w52/OD4xXuYS1Sk6qY+
	r28oZPY4Vwm9xXaGrZlpuSlStvlhBZ26VbDT6q10XzYwNw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k261vrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:43:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8e8c47a3so7465041cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 06:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778679825; x=1779284625; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=93ck9j7UNs5qr5E3FjJPwBNZ/eteNwvkCjcQtHOmT5Q=;
        b=VyyHtjxfOW8Php6g7rfcbpNrM2xvKEFpRHtOAoO+3IFsUKfRuMHsTMj4hPhirpL9xg
         DhMHA/zZuhY9xmijSvhg8Ei1tLW09N5SN4Aw8aZJH8NAA9bLKFaF0lbvZseq7NGveCb1
         EhjbqkOvLPT2Q3cIGRPw7cxloQJA+bdR5M6Qbiju79WpwBKrrCrR3R4bnyDh97M6o0+p
         IGDK/3ArbsG1rCYOs6vhXWc2Cx/WS9VZZ/PxdBvTjGyrX2pbj0NIbdS0fZlxnCdanMLy
         XaVKsnVONPArBThYe5eLSHzROB7IAFSdNElPihOF4OZ0R0Sd/it4JxH/Hh9c/EEpYExw
         VD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778679825; x=1779284625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93ck9j7UNs5qr5E3FjJPwBNZ/eteNwvkCjcQtHOmT5Q=;
        b=aOQuzO7aTVFIyeWUMJem9jhIoUGRaDHc04Mi26zTssUg74zjvFMnixjLdphF7ryS6D
         q0tJ3h9u5cQ5M7Wgho4i6dpywmne1TUljGT1EXDv90pypuPnluvbKo3YRTaU0YUQcYXn
         W9K7h5YOdz1z/qK7/uvbA566oSfg9B/gQMhqXSHkLG3G++gqzZvmVCHPr66CBeCs17G/
         l46zGRDebYmAmbYQgiU69Y2bUrt3WWTcic89FUnBPZsVuzFc1Ew3wVRAsy9u5Sc0HXP0
         GkA6WhwKvvOQb9XnagdmEKyLdySfyh/uhBrJmvEVOtUiYsvOxVN8Lp5hVBrh48++yLTO
         HSag==
X-Forwarded-Encrypted: i=1; AFNElJ+3vEYoePcnzWv/aRfqPTjdRjMmJ1wdk5lGm9cBOtE4jxfFmVRDZbBnxCutT0ssZbH23LnZyhgesVAo9f/o@vger.kernel.org
X-Gm-Message-State: AOJu0YzjfZB4716iyZy9eH1ocBvLr2DKbeNf5jYeC53FmO1/0VGeANPu
	jSyq1lJj+1oUO7ZWWjjNiHnotdYR9Y9NNfoyAfUHlCAq/0oyvIpsS5BO981+2TG7uh1D9jAWYwi
	aFyhGZY7V30SYWewqKgaSl/CsvPeC9f5yAXPu5pr9KRR/w0bSX6fqyu+Vfe6ct24i4lH9
X-Gm-Gg: Acq92OFYmMf8TmbR67AdvZGrbTSaW6o2YX5a0zlNawjNSji2j4wUcR2qtdxOPICbvOz
	5dXmadsUQXVbbJ34Hqegig2/r3V3+FutPWNQVwG53Pi4QmBlw0gXkYIDdb1BOPmu9vbl8Eg4Xzq
	iSjjh10JAluEI/QKLaDkSZtk3bvONSG5noLeQ7D3g9hTC/Q/mWSMFE0m1Hq/LG1ZFbQ5eAohEcB
	SawwSVL4Ei1VJcFGWX+ZZ0w4tdpFeLU1yIDmPiCCCNJUk78A72WOwU7LQGtHnqZy/KznnwnSau/
	TqPX7wewOToux92EJRvkuVYLkDiomvbibmHo6Iv4cJxmbOTUfXW/yl2huJ3jxyfh4jvFq6mDKrM
	UkF0JBoDOGfOj20a8CaRaIRvvYhr8FJVkkL07yFHUCR7oh4TyZSTQ8xNqrFzsyKrnUzIL4xCu8e
	Nr7PlBQMBZiilgixbwO0GG880KT2EqcvDlobA=
X-Received: by 2002:a05:622a:2618:b0:50f:b3d2:6edd with SMTP id d75a77b69052e-5162ff42a2amr35469921cf.43.1778679825458;
        Wed, 13 May 2026 06:43:45 -0700 (PDT)
X-Received: by 2002:a05:622a:2618:b0:50f:b3d2:6edd with SMTP id d75a77b69052e-5162ff42a2amr35469001cf.43.1778679824731;
        Wed, 13 May 2026 06:43:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f61078cesm44278211fa.28.2026.05.13.06.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:43:43 -0700 (PDT)
Date: Wed, 13 May 2026 16:43:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Alexander Koskovich <akoskovich@pm.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 8/9] drm/msm/dpu: Add Milos support
Message-ID: <2xj4p5f64gh56nqzrpskgmlgap42j4hy2yffegextu7kqscfxc@cxido7bjjrrc>
References: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
 <20260501-milos-mdss-v3-8-58bfc58c0e13@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501-milos-mdss-v3-8-58bfc58c0e13@fairphone.com>
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a048012 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=v0oG3mRxo3Z05cs3-vkA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0MSBTYWx0ZWRfX6A6Y8jYdXGLw
 Goio+ANkTE5V2W9WLsFJfBXXwru69NqyzGzaRYn8uuBKFtyt50bIcQIBxbq7RGcLtfR27sOF8WB
 4Ovak+OoTWsvUjOhKSHnMO2URpagqTgS4iufMiEqU3o2lF9QWMlez/8gWIiH2BS8flDjy5Ip7lr
 XympFnd5HyoFWP22W9Z1n7/TQ7dNdzyJEBspEVHP7YymoT+B69lPe9wUrVJslKy5GkmCuOP+q4D
 sy8eX+FAjRDV+eH9neMHASOmilnFChH4wTGb1n0Okt2uHxz+SCwcogg1DQTxf6/V6FDasUN2kK1
 /kBrpn4ll4eBVCF95AUD3zaob9B1jgIw/VptHrm18SKqW7Lz949O66Zkij05cGRIcpaaSv2yk0o
 27OCEh8yHnttZOhsRnZbYOwxrhKgkU763VzpUS8St+LsEuyQyJPUFCvGWwgrPiwM1iwgSHmvL+e
 Q3MbR61h10NeWCLk5Dw==
X-Proofpoint-ORIG-GUID: CV0PW9qC65vKC3yqAcavR94fo03_XUFM
X-Proofpoint-GUID: CV0PW9qC65vKC3yqAcavR94fo03_XUFM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130141
X-Rspamd-Queue-Id: D9A92534BDA
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-107326-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,marek.ca,quicinc.com,linaro.org,pm.me,lists.sr.ht,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,fairphone.com:email,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Action: no action

On Fri, May 01, 2026 at 09:14:50AM +0200, Luca Weiss wrote:
> Add definitions for the display hardware used on the Qualcomm Milos
> platform.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h | 279 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  29 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 310 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

