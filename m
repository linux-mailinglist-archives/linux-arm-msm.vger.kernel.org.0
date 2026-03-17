Return-Path: <linux-arm-msm+bounces-98213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iI+uJRJvuWm8EgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:11:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA4E2ACBA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 16:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 144753038404
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 15:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8993EB7EF;
	Tue, 17 Mar 2026 15:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TAXWnJ8C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TbFeJJsZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9FF3EAC9A
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759871; cv=none; b=Lhd8c0SgkTeyCRQex2JtAzg0eGNPzcVitygryQtiJOONnuIATM+e/DmknIUNAa/OroxLA1SbbwgN4o1jxUknLlC1pzpUl6S1Ch1fGuLb22MZ23ZN11+01VJ+6BY7LAeuapVqd+0Koty8xhhzgvr1MNgFMKY8jb6x/b0KZuH3oXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759871; c=relaxed/simple;
	bh=ot26zV6TPZ0aHyhWIZX8md47gkiUWEu9rcMI85ux0fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXpcO8+K1S03QKotaKViwcIJR4Yxn6IKuUMMimmuFNrVAh+GNW92vUOUAgTKFvM9oLrA4fAIbmlr8b6HzP+mVOXTwDSwv3mH+45lWw6tZ0nRRHTvHrkvidPKjeBjCNAqd7cu8Gaquf6VuqWK2CJgnsPPulxqWFRoJkr1iccXoMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TAXWnJ8C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TbFeJJsZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HAjwfK254245
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4mzLqKsdTkLuo3uP4PBm6rr/
	ZdhOz2I+FVqyk8deICY=; b=TAXWnJ8CmwypYHaROUZrTl4kItJl4uMOlbQ5zSQX
	g9gwm8oItEU0mjgDU/IXYuXa1JmoRWxK/VpaiT6gE+Cct3oUYBQBVVfQstUvMEAa
	nR8qcwbuj6WwErfmPg11D6TN59vZHuut4MnrSa900SaKCLf4AH0q/f4EMAw9/p6I
	PsYi2pRpaD6ZU3cOJdvMxT415hkmp36CMsEweLeZs+1j28/s7Q2DK+7fxknOYDib
	1IiIEp7fZ76F2N6t7Kl/cJ1gOJfXGspopwtoxw5J6Q3OiThgpY0GPihvq0EwQifX
	dT8ZFsWGoohkKuE7LUb7gDBD5V/cKGe00Plf8rPxnYgzmA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy5g8gwmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 15:04:29 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-67bf2b7267cso27137623eaf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 08:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773759868; x=1774364668; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4mzLqKsdTkLuo3uP4PBm6rr/ZdhOz2I+FVqyk8deICY=;
        b=TbFeJJsZS1DUln++aYolLPCb+MMUH6LTCsdTWlgBvDsHgzfd75RFtv3RxcSYYyN5es
         mTJTm0E+zj1+mXausBKzSI0Kvaoixt1YIk6No/obQUgySfi4braDh3qVApVYPvbGbJME
         Qm4yI8SkskHzEquUxGDE8D8TXOhj4t+Erl0ZxlaIzK46hkbkfwRQm6ZZiyQIN+pxnsDd
         tKHa5nru2+5RA/jfTwhqJiIUD2un4kVl4B/aAydUxufZ56OHjCRDEzWmeuler9PhoNUZ
         m0MhJPbPO+kFvg8r5pv4PPDDJQW15TG7dnqunN9yJKt1CftWUMCI2+Va9FMww6u5gTSQ
         U+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773759868; x=1774364668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mzLqKsdTkLuo3uP4PBm6rr/ZdhOz2I+FVqyk8deICY=;
        b=aVsfL/gxGv8hKM7M7niFwtMzo3iWdlNQwB9iDTFDzZSm/KKsZMbdMTIedtsh9ifgLz
         utJxrBFC4s4rWFmr8QvrABdMK9OjwINFG0kFmE99x8hppVTn+rLi8sWrAfft6VmQQVWp
         QhXKJPPG0u8pTFtpnbde2sSz0y6Zs7OGmGR2p77Z1YMKePegndpaslmlYB1drNjH7Cr9
         lrsajvbhW1zEa0MyGeN9Pem9K0iCXxIo8MlMp57k/pr7uyEkK19a/FIE3RWtTsDOANqJ
         EHVnUgafjqqGUCxWg5JIdFbjU/Fj/crnKyS7k17OVnWt/ZH78QttEPnlZk0ChzY0Aax8
         piVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXa1pv2dNt5JDuJ/NaA+K8WvDc1g859rzS0dVqXSrNytUyNKFrrXs9X+ANIBwS8VHxz4pS+HJ/SXt2EPq3d@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr8R4HuvXx+mX+URcPCrOXx5ypZFs33hcGwuUBkAzvTLdnw+Fl
	tJK9ArVeZ5+HOZgjkpV8IFSnhUdpXwpZpmxEQvRDFTlQvXM2GW1pWiHFUwkt2+JL7hFmTfgeRug
	yumW7GiU/ZotFOo648Iqp4O//PmHnqnaoZAeWwOotGfRK/66Dp/+GajR8tfco+OcXMQ2E
X-Gm-Gg: ATEYQzzMwNXBVoH7M3UrMwRGtor0rlRYgq5JFU2U4wHgj3e3BU9tgqEff9W7RSPq18W
	YvjW+XSot2oWHRFCNfoQCrpncbzmwaSsGZzcDHaXKeobTHaOUVEXSOUV7w8CDL7mvjt5sxAE3Fv
	qvfqTtp5wF/BWqi9XrrlJ8EvXcK2dmHbPnEyGYpBYbYRKpXFUHUDyqlYyZIYF1RnLJe7+J7dOVl
	vzgblpjs4l9cntFNkQLbwnLSk7pRVg2bXLQZXKMLmUnxcECwGlUqvhHImV+1pxoTAPblP11zuyj
	r6bwOWWcGUqysl+OpG6hp0Q9VHhj3zNmvWqjBoy8S1zEdwchtIlrNsQzeNvo5lzhjoHMO0pHPpS
	KFuLDvzH9TKYolkzoEMAUTSAT9Zi1Jmr25TNIbyeet2HNQ+bRgkdWEkX3e0bzXqZMr1MQURbDmg
	pQKMFmBrwg75nuA5T3MTzG42u64+ALWCQSrrw=
X-Received: by 2002:a05:6820:616:b0:676:83f9:c8ef with SMTP id 006d021491bc7-67bdaa809a8mr11456049eaf.65.1773759868170;
        Tue, 17 Mar 2026 08:04:28 -0700 (PDT)
X-Received: by 2002:a05:6820:616:b0:676:83f9:c8ef with SMTP id 006d021491bc7-67bdaa809a8mr11455997eaf.65.1773759867326;
        Tue, 17 Mar 2026 08:04:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e239sm4141639e87.23.2026.03.17.08.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:04:25 -0700 (PDT)
Date: Tue, 17 Mar 2026 17:04:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm: default separate_gpu_kms to auto selection
Message-ID: <higas4vy6hla7vi2b54k3erdklt3u34efjocbcd5s23ypijvho@rxgj5v42romv>
References: <20260317-separate_gpu_kms-v2-1-b027ca97b9fe@oss.qualcomm.com>
 <8b58adfb-ed3f-4c2a-ac4a-da5ef1bd8dba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b58adfb-ed3f-4c2a-ac4a-da5ef1bd8dba@oss.qualcomm.com>
X-Proofpoint-GUID: kPjNTzaYbAT4Lb-xGs5_f3BtPUarXav_
X-Authority-Analysis: v=2.4 cv=EeTFgfmC c=1 sm=1 tr=0 ts=69b96d7d cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=y0ZA1Vlu6mLbDXCHyQcA:9 a=CjuIK1q_8ugA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: kPjNTzaYbAT4Lb-xGs5_f3BtPUarXav_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEzMyBTYWx0ZWRfX/UZ6iQ4vW9bf
 VTxZZ1cCf6FCGYo/ze1vbl8qK8SvEBKqMuqsLYwyGtnrlejliOQI0RWHZUl1NM3zOYbqizNk0se
 mK4SKwNVtcZNVnFfhngpCzFpRAHXZViyQKqplYS/qRJIIka6UDU4/Y6pCC8TEnnJCnSiW/j8U8j
 i3zgDGn2D/3x63KBvmvZmSFcWmstc5OAzGj4V/aFMqXE+wTFdbmnNYi0voJnfpahpx62asoLh1K
 ElAEWli5dOOm092HXaejHXqozZR64zqMKuMStKEoiwrlmdSC+zzcT95zMThBZK4J5RSsQcF6+kh
 WCkfIm3nb8Sq+9gsuIs7LaIQWbEtezp3F6OPq9Mus1sWIiuuF4JteerHhAqMsPCIMrdOa+mI9oq
 taRiCGcB3ENXfxqUmGRPUiQdNEfMSACK3j9GVOwyU0cqz2jC/4l8+uUoiYCxsqtA8RwiJI3SX9a
 eFMgRaITVMbjeBjrI+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170133
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98213-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
X-Rspamd-Queue-Id: 9EA4E2ACBA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 04:06:30PM +0530, Mahadevan P wrote:
> 
> 
> On 3/17/2026 3:57 PM, Mahadevan P wrote:
> > On platforms with multiple display subsystems, such as SA8775P, the GPU
> > binds to the first display subsystem that probes. This implicit binding
> > prevents subsequent display subsystems from probing successfully,
> > breaking multi-display support.
> > 
> > Use the tristate separate_gpu_kms module parameter with the default
> > value set to auto (-1). In auto mode, the driver selects the binding
> > behavior based on the number of GPUs and display subsystems. This allows
> > display subsystems to probe independently when required, while
> > preserving the existing single-card behavior on simpler systems.
> > 
> > The separate_gpu_kms module parameter has the following semantics:
> > 
> >    -1 (auto, default):
> >       Select the binding mode based on hardware topology. If exactly one
> >       GPU and one display subsystem are present, bind them together to
> >       form a single DRM device. Otherwise, expose the GPU and display
> >       subsystems as separate DRM devices.
> > 
> >     0:
> >       Always bind the GPU and display together to form a single DRM
> >       device.
> > 
> >     1:
> >       Always expose the GPU and display subsystems as separate DRM
> >       devices.
> > 
> > This ensures correct probing on multi-display platforms without
> > affecting single-display, single-GPU systems.
> > 
> > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - EDITME: describe what is new in this series revision.
> > - EDITME: use bulletpoints and terse descriptions.
> > - Link to v1: https://lore.kernel.org/r/20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com
> 
> From coverletter this got added from b4 will make sure will be posted
> properly with subsequent patches.

You know, you can just edit it in the b4's coverletter and drop your
manual changelog...

> 
> > ---
> > Depends on:
> >    https://lore.kernel.org/lkml/20260124-adreno-module-table-v1-1-9c2dbb2638b4@oss.qualcomm.com/
> > 
> >    When separate_gpu_kms is enabled, the GPU and display drivers are
> >    probed independently. In this configuration, the Adreno GPU driver
> >    may no longer be loaded implicitly via the display subsystem.
> > 
> >    The referenced patch adds a MODULE_DEVICE_TABLE() entry for the
> >    Adreno GPU device, ensuring proper module autoloading based on
> >    device tree matching. This is required to guarantee that the GPU
> >    driver is loaded correctly when GPU and display probing are
> >    decoupled.
> > 
> > Changes in v2:
> > 
> >      - Drop dependency on Lemans dual-DPU device tree changes as this patch
> >        works independently (Dmitry)
> >      - Switch separate_gpu_kms to tristate and default to auto mode (Rob)
> >      - Rename msm_gpu_no_components() to msm_separate_gpu_kms_components() for clarity
> >      - Link to v1: https://lore.kernel.org/r/20260223-seperate_gpu_kms-v1-1-e8231e7f1685@oss.qualcomm.com
> > ---
> >   drivers/gpu/drm/msm/adreno/adreno_device.c |  2 +-
> >   drivers/gpu/drm/msm/msm_drv.c              | 52 ++++++++++++++++++++++++++----
> >   drivers/gpu/drm/msm/msm_drv.h              |  4 ++-
> >   drivers/gpu/drm/msm/msm_mdss.c             | 15 +++++++++
> >   4 files changed, 64 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > index 4edfe80c5be7..e40648c05797 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -272,7 +272,7 @@ static const struct component_ops a3xx_ops = {
> >   static int adreno_probe(struct platform_device *pdev)
> >   {
> >   	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon") ||
> > -	    msm_gpu_no_components())
> > +	    msm_separate_gpu_kms_components())
> >   		return msm_gpu_probe(pdev, &a3xx_ops);
> >   	return component_add(&pdev->dev, &a3xx_ops);
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index e5ab1e28851d..575d1aea7927 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -54,16 +54,54 @@ static bool modeset = true;
> >   MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
> >   module_param(modeset, bool, 0600);
> > -static bool separate_gpu_kms;
> > -MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
> > -module_param(separate_gpu_kms, bool, 0400);
> > +/*
> > + * separate_gpu_kms (tristate):
> > + *   -1 (default): decide automatically based on hardware topology. Split devices
> > + *                 if there is more than one GPU or more than one display master.
> > + *    0: force single DRM device (bind display + GPU)
> > + *    1: force separate DRM devices
> > + */
> > +static int separate_gpu_kms = -1;
> > +MODULE_PARM_DESC(separate_gpu_kms,
> > +		 "Use separate DRM device for the GPU (-1=auto (default), 0=single DRM device, 1=separate DRM devices)");
> > +module_param(separate_gpu_kms, int, 0400);
> >   DECLARE_FAULT_ATTR(fail_gem_alloc);
> >   DECLARE_FAULT_ATTR(fail_gem_iova);
> > -bool msm_gpu_no_components(void)
> > +static const struct of_device_id msm_gpu_match[];
> > +static int msm_count_gpus(void)
> > +{
> > +	struct device_node *np;
> > +	int count = 0;
> > +
> > +	for_each_matching_node(np, msm_gpu_match) {
> > +		if (of_device_is_available(np) && adreno_has_gpu(np))
> > +			count++;

If !adreno_has_gpu() we definitely should be using separate binding.

> > +	}
> > +
> > +	return count;
> > +}
> > +
> > +static bool msm_separate_gpu_kms_auto(void)
> > +{
> > +	int gpus = msm_count_gpus();
> > +	int mdss = msm_mdss_count_masters();

This breaks MDP4 case.

> > +
> > +	if (gpus <= 0 || mdss <= 0)
> > +		return false;
> > +
> > +	/* If exactly one GPU and one display subsystem single card */
> > +	return (gpus > 1) || (mdss > 1);
> > +}
> > +
> > +bool msm_separate_gpu_kms_components(void)
> >   {
> > -	return separate_gpu_kms;
> > +	if (separate_gpu_kms == 1)
> > +		return true;
> > +	if (separate_gpu_kms == 0)
> > +		return false;
> > +	return msm_separate_gpu_kms_auto();
> >   }
> >   static int msm_drm_uninit(struct device *dev, const struct component_ops *gpu_ops)
> > @@ -1030,7 +1068,7 @@ static int add_gpu_components(struct device *dev,
> >   static int msm_drm_bind(struct device *dev)
> >   {
> >   	return msm_drm_init(dev,
> > -			    msm_gpu_no_components() ?
> > +			    msm_separate_gpu_kms_components() ?
> >   				    &msm_kms_driver :
> >   				    &msm_driver,
> >   			    NULL);
> > @@ -1069,7 +1107,7 @@ int msm_drv_probe(struct device *master_dev,
> >   			return ret;
> >   	}
> > -	if (!msm_gpu_no_components()) {
> > +	if (!msm_separate_gpu_kms_components()) {
> >   		ret = add_gpu_components(master_dev, &match);
> >   		if (ret)
> >   			return ret;
> > diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> > index 6d847d593f1a..64a5ad35f7a2 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.h
> > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > @@ -555,6 +555,8 @@ void msm_kms_shutdown(struct platform_device *pdev);
> >   bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver);
> > -bool msm_gpu_no_components(void);
> > +bool msm_separate_gpu_kms_components(void);
> > +
> > +int msm_mdss_count_masters(void);
> >   #endif /* __MSM_DRV_H__ */
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index 9047e8d9ee89..00e3ac7dab3a 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -73,6 +73,21 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
> >   	return 0;
> >   }
> > +static const struct of_device_id mdss_dt_match[];
> > +
> > +int msm_mdss_count_masters(void)

No masters please.

> > +{
> > +	struct device_node *np;
> > +	int count = 0;
> > +
> > +	for_each_matching_node(np, mdss_dt_match) {
> > +		if (of_device_is_available(np))
> > +			count++;
> > +	}
> > +
> > +	return count;
> > +}
> > +
> >   static void msm_mdss_irq(struct irq_desc *desc)
> >   {
> >   	struct msm_mdss *msm_mdss = irq_desc_get_handler_data(desc);
> > 
> > ---
> > base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
> > change-id: 20260316-separate_gpu_kms-04d2cf4d91e2
> > 
> > Best regards,

-- 
With best wishes
Dmitry

