Return-Path: <linux-arm-msm+bounces-98886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IoANfnwvGlA4wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 08:02:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 565A62D665E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 08:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28E153019FF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 07:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E60C034572B;
	Fri, 20 Mar 2026 07:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzXAZ4f7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AmHq/dvs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3802D23BC
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 07:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773990133; cv=none; b=THAeB4TZ3P3egVr1kh40xVW0mogb9OsvrQp9Q3Fqsr+ujXQt1rQ89Zol8YdGCS8+zpEpQd+T5B+PW6An4VurcgJYIMmziVpad8jARmxU0FkdnqL+6S1ocqP9fdHUXwVNAzsuShmAFwMIA5CUzWXZZWHC6FHl8EWo+NxPHj3ysR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773990133; c=relaxed/simple;
	bh=PT2pShVxIT1PmoovIjZ5o+3zwXAnxxlVoJHJSM/AMQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQIX1XWIJ6K0dQdlmTZQYLT3gGm0Cwq/lOHqor0JO5wWCj74RHJG/Sw3dqudJb1jsUnoG6juyTIG5H/vVXPs6NdPGuHuat768XR/L5t2YRL9Vq24TPqClzmOWP+7J5opGWMaN9doOPbrLWzYR9TD1riTb9YM+a+wH0e56CS9YGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fzXAZ4f7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AmHq/dvs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K6fcSp2909252
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 07:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s7bVSIq84DfX2e31jv7RvyHv
	lAqc744AbHZLuKRDl3g=; b=fzXAZ4f7Uy8dom74nZOjJjQQbBMrKTEdpIAxUDQO
	6vH/1P7lH+C/hWVG2RTUSuUIWkPTj3SjI+5HnNI7S+Qz+jwzOwgWfcskJsbQHKEa
	gbEWgcA22GLFIGjIQftrvv58uoXMVMcuLh7Al59tFQcg0yD7sD0oig1ut6wXLp1a
	mGIuCXqEOFHgT1vhhxxT7U1R2GzAKVoODBaqzbY47uwZ+mGkMW7Yb/7if1MC25MA
	NdT8yF3VXq7j66OUhIJh1iRstcepx1XSzE0Kp5ogeScD/qMyRWmAlJSYU5PbQCq5
	HA5RVRKXxbXjVDUoFWEc5nwv05uul8g04Qws2GfLAMdjdQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d083rcm8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 07:02:12 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-602b2dbd79fso666025137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 00:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773990131; x=1774594931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s7bVSIq84DfX2e31jv7RvyHvlAqc744AbHZLuKRDl3g=;
        b=AmHq/dvssiNgH/XOeC1gbvZ24mPbpvDQDcoUzjuT79FMkfChhUSNtkFW8e3Kd76vmP
         MCYFlTK2buW7MvHhJShi6X3kQaLP0zuEGLIj/ysXX3fsUGc9Us+LZkjKye6JPXfTEnM3
         9S/EAgIDCFVhQxPtys4U85BYOhqrWZxL/SkWIb0T26sx+eb5t4th4eQYgRPDfHFkWa31
         iVBuu3ulAjtCTYOibVmt80B33e7Z5wHTATWTanv/Jt80FEoviOK2uwxhcIH4Q6Ba7Y+t
         E957Rf5TF9FtSRJLtgSY18Gl92stGgSg0QEGPEtj2EeniMcqBVeGWHRKt2Ue42rMocLf
         SoRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773990131; x=1774594931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7bVSIq84DfX2e31jv7RvyHvlAqc744AbHZLuKRDl3g=;
        b=gIwDz3O5wZQXvOXf1qzCRMOietAA8s8cpY1pUBQFgj6qkJv6UsFXpV3sG5lcgoEi3F
         2p9qfK19yKrZCXKKrU1MnLhfec30GZhD/nDzhI8zNw7jWPkW0jSPhDj2ru+f4u0YykBz
         9WSofQnkBTLPRFwmdD8YC6IKd9qzbjpnyvcW05xoyI+37avLtpR0So3Yr32ohDTwfqyh
         mPR+gzj3jCiefhtd2RQDNSEJLo5orbUUydAyX8hECw6zu7d0ISxHEGsV4D3tSjaA/b0V
         OKHO1W3wlwh38cyvKJVQ4mDATaTmG/AiSDcNoIwPyEXundIRQBSilADD7FIUpdmOBxFA
         Enzw==
X-Forwarded-Encrypted: i=1; AJvYcCUsCMuYGOH9e0DMRUgsn/Sd7+bCvSCAThlXs8NxOce50/NpK31AvEG1OebMOAeF3PdpCl/uIpJdiECOPUUx@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu0HoMjPulVHoR9jeG2wCVQqMRkR3ZXAb+PAVYFElXl49W6iEU
	5azdc8jq9JAf0wqVl6jZINZGIP4TZxvs1cdlRTeDBWNID1pEmg0ZEAAwRpgvKHVJ+H7qgwM96+K
	gA69idjWzuTJFD5bCSLxhluINRojreqN77MQGd1R9cxUxhYb7hUrGTyAjrAYDd0JghVPe
X-Gm-Gg: ATEYQzwLSAbzx3VOECjStmyT/QYm5LDrKl2Df4koGWe0dXcVPLy4llr8pLt19XGZelf
	PdoPGE5ON4vykkuktWoXqyiUoYo5MK2JadyFv28Ew9FHpWdt4B+y1bCjrawUE+dLwuzreYBJz4E
	ux8grP9skFxliBKi/1VdI47PIkkmCIJ47R09E92KoH9c3jf0nDxT6NGd/Io7bUPEDlMNcE/6UMc
	+wAOHmRWiduHR8j4AIgkBDbdR53F+zeaiox/BoMmP2CzLY8so9E2VkkQoDqtQPshkThw74mv5Vj
	/5LfU4Yez4HLxXQRiFwF0+1poovYd+0FvReYxwFiu9aumZfEXZV7AjTkq3MejXTNY29Nz8sQaF4
	s+lTt9tYse2aQzHxvdkPI7jOFcWXdEmpnD+C/y41EVA094c4ZZH/2vw6+jvzzhOurT3rzi0ejps
	9t7tAzyBYOcAS7zzKRtMeJwIvSf9pE82lrIEU=
X-Received: by 2002:a05:6102:26c9:b0:5ff:de16:36a7 with SMTP id ada2fe7eead31-602aec81966mr1007420137.23.1773990130866;
        Fri, 20 Mar 2026 00:02:10 -0700 (PDT)
X-Received: by 2002:a05:6102:26c9:b0:5ff:de16:36a7 with SMTP id ada2fe7eead31-602aec81966mr1007409137.23.1773990130451;
        Fri, 20 Mar 2026 00:02:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9ab6d4fsm3261211fa.34.2026.03.20.00.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:02:09 -0700 (PDT)
Date: Fri, 20 Mar 2026 09:02:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jonathan Marek <jonathan@marek.ca>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Alexander Koskovich <akoskovich@pm.me>,
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
Message-ID: <fpmq2y4i6hjgaoiunwihsqkm5rl5eykrnwqtbtjdpqtslmy4md@yqj76vcej6m7>
References: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me>
 <20260319-dsi-rgb101010-support-v3-4-85b99df2d090@pm.me>
 <1360a31d-669e-48df-a1be-f0af4a253cd7@linaro.org>
 <3gLK4s97giqqXagfHKhfiIHbfbl2snwfOj9dcTNGPUYi10w9-1EdATqzz1LPCVTpz4bLFYOm8u_Fl8PfC7t5yabows4UCzRKVwjraEWW6hc=@pm.me>
 <3f8763af-aad2-4d92-90c8-cfd290212503@linaro.org>
 <7fb9dd9d-13f9-7bba-93d1-08f42dd6ee38@marek.ca>
 <oihbfczsj5cg7qfjjt6jvyodjnjbezyrv6f32vmg444g5bx6ow@r54epj7ilsyt>
 <da050aad-381d-ffb7-ec7d-8ed8a80d790a@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da050aad-381d-ffb7-ec7d-8ed8a80d790a@marek.ca>
X-Proofpoint-GUID: 0l0k-BnmgY8ZfdL-UJ_YNPtooB3vPd03
X-Proofpoint-ORIG-GUID: 0l0k-BnmgY8ZfdL-UJ_YNPtooB3vPd03
X-Authority-Analysis: v=2.4 cv=ApTjHe9P c=1 sm=1 tr=0 ts=69bcf0f4 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=rjgCsHGJ4Y6OlbO_Df8A:9
 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA1MSBTYWx0ZWRfXzq8uhNNEU1He
 ns3eFDS9dlSdlrIZStn+vDT4IxbwzyGwWQvWIkS4FCX/c3FTXGfoo6OglnaviDNBVuhA5pIxj+B
 7DQYAEdTQGWthH1iNnSMySRzRhHGVZLE5RqTz8Ex4/fOFG/Jpw8xo4k4YOehIsHfSd3cWb5+RFV
 mthqDVcO2RiD97O7W4MMElhm3I/gWao2j79/1CBs1L69vj75JSP7NmKDuRfvUOUEGf37pZrjiTU
 STdyb4k2W3T55TcDufVY0KX6RT7iyKOsJ/alKj4lf4XCVlKAfXhqPzbtDYe8agp7PqRZLGDKz6L
 msEztuU/05LDmQEGq1W43XBsrF6WPapQjMqyOGsb/eU05Gs4uQ7KAym/DFW4aea/4nxsRYLwRYL
 K1TU9h0GSQa4PIvrqNMicio0m8+VSSAkHpDKX2qpyE7lk7pNjMHvun0FVdfHi8PO4s0I0MFnYov
 EODdvML1t1mjoE/MmxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200051
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
	TAGGED_FROM(0.00)[bounces-98886-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,pm.me,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.964];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 565A62D665E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 12:25:00AM -0400, Jonathan Marek wrote:
> On 3/19/26 9:45 PM, Dmitry Baryshkov wrote:
> > On Thu, Mar 19, 2026 at 01:23:03PM -0400, Jonathan Marek wrote:
> ...
> > > 
> > > That's not how it works. INTF (which feeds DSI) is after DSC compression.
> > > 
> > > INTF timings are always in RGB888 (24-bit) units. Ignoring widebus details,
> > > the INTF timing should match what is programmed on the DSI side (hdisplay,
> > > which is calculated as bytes per line / 3).
> > > 
> > > (fwiw, the current "timing->width = ..." calculation here blames to me, but
> > > what I wrote originally was just "timing->width = timing->width / 3" with a
> > > comment about being incomplete.)
> > > 
> > Okay. After reading the docs (sorry, it took a while).
> > 
> > - When widebus is not enabled, the transfer is always 24 bit of
> >    compressed data. Thus if it is not in play, pclk and timing->width
> >    should be scaled by source_pixel_depth / compression_ratio / 24. In
> >    case of the code it is 'drm_dsc_get_bpp_int(dsc) / 24'.
> > 
> >    For RGB101010 / 8bpp DSC this should result in the PCLK being lowered
> >    by the factor of 3 (= 24 / (30 / 3.75))
> > 
> > - When widebus is in play (MDSS 6.x+, DSI 2.4+), the transfer takes
> >    more than 24 bits. In this case the PCLK and timing->width should be
> >    scaled exactly by the DSC compression ratio, which is
> >    'drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_per_component).
> > 
> > So, this piece of code needs to be adjusted to check for the widebus
> > being enabled or not.
> > 
> 
> The widebus adjustment on the MDP/INTF side is already in
> dpu_hw_intf_setup_timing_engine: the "data width" is divided by 2 for 48-bit
> widebus instead of 24-bit. there shouldn't be any other adjustment
> (downstream doesn't have any other adjustment).
> 
> a relevant downstream comment: "In DATABUS-WIDEN mode, MDP always sends out
> 48-bit compressed data per pclk and on average, DSI consumes an amount of
> compressed data equivalent to the uncompressed pixel depth per pclk."
> 
> Based on that comment, this patch is correct, and the
> ''drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_per_component)' adjustment only
> applies to DSI. (note: newer downstream looks like it would divide by 3.75
> here, which doesn't make sense. older downstream would divide by 3 here. I
> guess downstream is broken now and video mode + 10-bit dsc doesn't get
> tested?)

I guess, the downstream might be broken wrt. the widebus being enabled
or not.

> 
> on DSI side, "uncompressed pixel depth" shouldn't matter either: DSI only
> sees the compressed data. But based on that comment, when widebus is
> enabled, by setting DSI_VID_CFG0_DST_FORMAT(?) to 30bpp, then the DSI pclk
> is in 30-bit units instead of 24-bits. And with this series DSI side ends up
> with the right result if 30bpp format and widebus is enabled.

-- 
With best wishes
Dmitry

