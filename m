Return-Path: <linux-arm-msm+bounces-98890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJp5KOD5vGmd5AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 08:40:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BE32D6B72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 08:40:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CF5630EBD7A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 07:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6968A33D51B;
	Fri, 20 Mar 2026 07:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ESeV3J8U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Th0WxFZy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8D731F99A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 07:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773992208; cv=none; b=TjzP+aZkpUmZy9RkenHafUco1GgJuC7u5Dv4MoZC3xhD3p+dKj/PJAaVP2dTAqJ8F7M/vieCCaOUp5n38SMlmppZ1mgYDmdlCV2kyMmgOgIb4NnrDsXWGEsryJ+G68fZ+cFUuoMeZRywdfglVz3A/ug1Fj9Fa7AHqGWuq4O1XKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773992208; c=relaxed/simple;
	bh=qmOXeo3KD9MT06TLyZXNBMmT0v9EuO2KBlvTlyGANdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pu+dKHyHhkMFXxjgwwWKgYvsf2jwlq5SM8spcf2L9zfKfNMOhLdnFfFsbpS4wdMMiIwH+2W2ZYBm4vsrIitTMIP+Q2/qBpw39R1OJhTvMlvGMCJFdYMA2fYTFHHN4UnLyApse8A6I4XEiQHQp9lpPLZcx+AsGt7WaIH0DiHLHLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ESeV3J8U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Th0WxFZy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2XhhA539229
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 07:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tBSvIF6akWxqZAvBPkW/jgbs
	GGZxl59HuTz3JSGfNpA=; b=ESeV3J8UEqA27SZP3XN1RcWjYnw+cF6CMOgpRCWN
	rT0CD/Pa+J6TriIMjv9NW/StEKw7EUwKQ4p8kXmOmo/uVDMIW2fSTzAuaa20zYjS
	MvsA6aZfZxZiCvSkuG6AfhpE3DDLstUf9VasDhEKb2nHYTclsoGf3qVM/nY2f6R8
	cbCf1VS88Q/zNrOnwR8GImB06vAys1z4PHQXVWr03/V+WSg0VTNYWTQ36/YSlNn+
	WchKmrizuKIxSiimauBM2gOe/hjY8cbTOt50pD+8hPt7DWKmsPwqL/Jdo8qMUxSs
	mtTwCNrO+no5GRt0dFPUl3fiEptD+64Amex7wyaISfW+Hw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0sm6h79b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 07:36:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509044f54aaso134704411cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 00:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773992205; x=1774597005; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tBSvIF6akWxqZAvBPkW/jgbsGGZxl59HuTz3JSGfNpA=;
        b=Th0WxFZyjQcLItzJ9oAs00JiG1SBu6xSjVXzsKijEB33h5bKv1uCLgc0ZFtcYGnw71
         5QKNc/26RaFREXcFRTvYsZsW125ipK7lm03AEHPyl6wGA7FrZqMAw4z33AMgA20tg0CI
         GdzJg/s3iY0lu4C+sfOJ9nbbh7Ah21AISpvVrNurl7nutt1YD65fc3ry/xMYsVaJsB+q
         IRrjI8GjaZLEQ1sBRVXKTcdB/5Qyg4WwZoNFSNTvS9aZonHrCGKlroebz1DkdcDxkMG7
         O7SjUN4w5audhcOj2u44Gm9gTCqpDdTYA4yK7P6IqmWV8V0CDntlXJK3vUzaDf4pldE+
         YgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773992205; x=1774597005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tBSvIF6akWxqZAvBPkW/jgbsGGZxl59HuTz3JSGfNpA=;
        b=gKKsK1ll6+wOK6UvM3LtSX0vDx24mi9tUaPoKIJHAItEJ9tsjCVGVd4l1j7X5l/Evk
         M5qRb9KAzPKUsa1P/7x5tvJF0oJDCIHFrzRGoT6CywpT0nNiowUhnAVoEE4ZvAkiD8xX
         /Rvr22GjSUrcCg8JORy20DBLFGBK0rK7rUcVQGKZ/NOgL4fOScyECiqtTWJdl7pYWKfO
         3iFJ3c1TEKOIZF89eestXszmnnR5MIQysPfu4w5jrE0CK2dLRL9AMw8LhapXN9xHazMd
         mH5GY5ohjuTD9TXZMz8j19xFQUYNTIAFlbAUpMXLxUSIH4TB+UZcgdAKeXsqy3OVBuIo
         G5fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbjX1+ICi7TVBIyAdx0azQ2NjX6m7/JGzJvkLqe05SW3izGl2YPsEStu8DW0D2Uyg4iNnh5UQeGsv9ibAi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0nSW/HAbwaSM3a2FuMTc+TZyhUTfdyLQpgwDuTXOyTe91M94n
	GcKr9rVFhkslA79RFKs8uTMu5dQ9Og8HNB1MeULs6DBkP9ugjQ0fWvynbQZyWeHxt+Cse5pnxdD
	PNEB5ReXqEG+S22j4W948oK/qUf8JQB4TBMIZOF0j3gu5stOThrM0Imm0Mgab7OCG9eCn
X-Gm-Gg: ATEYQzwCL6PtmGX1hO60uFwjp8wNbs/uNjilxWs3AmTjr/GxTDulq+X7DuS5K1Z57Rp
	gif2UKCrnXuC7zafxxFqX5GY5R5JRGOxzsHb1BcGBH75XT8sOlXNvWFcIfaI1UkEACz8lDnilxk
	zwYj5ID++pcY+nyZWpebmeG6q1nEmWXA2JmXKTreoduwLm+Okwh2Qh3G7WmWg1LV+9RSwxkmJr0
	16eRayY2oMWVulR1LMcNw2OS4c9GuMsA82gNtjzJa1sIFE/IwPGS1avR79L1F56Nn9xymh0Ei5u
	aIIwlEUVj+cAugS69aOFjgbTU9mqrH9dkW3SLo+vcKXXRmM5UBADD/+gxvm56P5bss5lMQbyB/Z
	Ivoi9I1qlS8TpGuD1V/mXWGHaPtGrwp2MA+aAUcgi0z0VGbjnbi91IEtOJP3ATNOmZQtVTO0tmC
	8/I7qyHf6zjGs6ln+N2qe9QyxyWA7FBEu1bL8=
X-Received: by 2002:a05:622a:4cc5:b0:509:1b01:8916 with SMTP id d75a77b69052e-50b3738b7famr30761391cf.4.1773992204995;
        Fri, 20 Mar 2026 00:36:44 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc5:b0:509:1b01:8916 with SMTP id d75a77b69052e-50b3738b7famr30761261cf.4.1773992204505;
        Fri, 20 Mar 2026 00:36:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192dbfsm378336e87.1.2026.03.20.00.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:36:43 -0700 (PDT)
Date: Fri, 20 Mar 2026 09:36:41 +0200
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
Message-ID: <7o6ddv23aft3eerc7xz7r5rawe24d6vl3qp33ewnqllv5xkfrf@n3dosrwbvlhf>
References: <20260319-dsi-rgb101010-support-v3-0-85b99df2d090@pm.me>
 <3gLK4s97giqqXagfHKhfiIHbfbl2snwfOj9dcTNGPUYi10w9-1EdATqzz1LPCVTpz4bLFYOm8u_Fl8PfC7t5yabows4UCzRKVwjraEWW6hc=@pm.me>
 <3f8763af-aad2-4d92-90c8-cfd290212503@linaro.org>
 <7fb9dd9d-13f9-7bba-93d1-08f42dd6ee38@marek.ca>
 <oihbfczsj5cg7qfjjt6jvyodjnjbezyrv6f32vmg444g5bx6ow@r54epj7ilsyt>
 <da050aad-381d-ffb7-ec7d-8ed8a80d790a@marek.ca>
 <pVeuxasxaau60kEIgTW1W6DmFLuzLUGYvmYtTN_Cv0htPbokC6lMObfmql3lWkAxtO5Lp-aD2l0Uzt_xL8cGYVxBmDey-5-HA7968eocg8c=@pm.me>
 <a7jukaag6juswudeeuskgzahzbixxn5oq4qjnxfny2oapinfnv@kmn7b33yxric>
 <jv_kU6i1uCSu--2-KIWkgsC0NsVK1yE396Nv_fCFA5v9uR-zrMGhrBmKNnG_ztHPiKPqlcjWif3R-XF1bINB387ezJEKtXDY453253BM6fc=@pm.me>
 <nVcYZQOh7dB65LsiaXejmQP-Cmp-eSxp7fvDiTwS2P5WJc03m4CwXtUP_2w-D2dflxo9rwKPI68FxnfswATouZxK8QhF256JJf3F7BkbmY0=@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nVcYZQOh7dB65LsiaXejmQP-Cmp-eSxp7fvDiTwS2P5WJc03m4CwXtUP_2w-D2dflxo9rwKPI68FxnfswATouZxK8QhF256JJf3F7BkbmY0=@pm.me>
X-Proofpoint-GUID: RNNJSpj3V58LqfMb649dECRNDAGIPiwp
X-Authority-Analysis: v=2.4 cv=Rv/I7SmK c=1 sm=1 tr=0 ts=69bcf90e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=tVI0ZWmoAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=RAbU-raeAAAA:8
 a=UeJVVWTCdUyxyh09lF8A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA1NiBTYWx0ZWRfX0khgprSPuCQv
 C7IX67CA6uxhmXd+MTvI3/5X4XaulAyWd99QvuTX4WcME7cQMKvDS6iDmwIEVa2CLw9sd0+WCHn
 GiKveaZGTiGU8S1sk7OzvIx478mVruvwOY64yZgihUSudEGuE7AKw0Pu/5yGe0O4d1ZXfyRPJ8R
 zyFqgB73CK7S8KpcgG+thY+bVMI+UPwN7TWTvFywM6Q4jsX2vXKbH95j0ltpLgAd98+eVhy7Q3I
 hEmGB87KRlCzcMmKf8b+PAsxES4hPacjd84+ODli3HazzqoSHGrcJUtWGT9pkJU4qlwIW9av2dE
 dtHmgI6Tx/T4lj+WIXxzNd6eUlMK5R4iISz+w3OVqU/PylGLuERY/OWNeLfyektfqVwd6U/8VNx
 Ttcfc+HUU+3DvY8lMzy2+GpqvzBni/kK8yq03NSbN1H81sIh7Un7bOlaoVQvaqwGPDZNzNAvACr
 HWcau5kOBVYDYU02opQ==
X-Proofpoint-ORIG-GUID: RNNJSpj3V58LqfMb649dECRNDAGIPiwp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200056
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
	TAGGED_FROM(0.00)[bounces-98890-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[marek.ca,linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,marek.ca:email,pm.me:email,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.948];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 04BE32D6B72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 07:02:54AM +0000, Alexander Koskovich wrote:
> On Friday, March 20th, 2026 at 2:50 AM, Alexander Koskovich <akoskovich@pm.me> wrote:
> 
> > On Friday, March 20th, 2026 at 2:38 AM, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > 
> > > On Fri, Mar 20, 2026 at 04:46:02AM +0000, Alexander Koskovich wrote:
> > > > On Friday, March 20th, 2026 at 12:25 AM, Jonathan Marek <jonathan@marek.ca> wrote:
> > > >
> > > > > On 3/19/26 9:45 PM, Dmitry Baryshkov wrote:
> > > > > > On Thu, Mar 19, 2026 at 01:23:03PM -0400, Jonathan Marek wrote:
> > > > > ...
> > > > > >>
> > > > > >> That's not how it works. INTF (which feeds DSI) is after DSC compression.
> > > > > >>
> > > > > >> INTF timings are always in RGB888 (24-bit) units. Ignoring widebus details,
> > > > > >> the INTF timing should match what is programmed on the DSI side (hdisplay,
> > > > > >> which is calculated as bytes per line / 3).
> > > > > >>
> > > > > >> (fwiw, the current "timing->width = ..." calculation here blames to me, but
> > > > > >> what I wrote originally was just "timing->width = timing->width / 3" with a
> > > > > >> comment about being incomplete.)
> > > > > >>
> > > > > > Okay. After reading the docs (sorry, it took a while).
> > > > > >
> > > > > > - When widebus is not enabled, the transfer is always 24 bit of
> > > > > >    compressed data. Thus if it is not in play, pclk and timing->width
> > > > > >    should be scaled by source_pixel_depth / compression_ratio / 24. In
> > > > > >    case of the code it is 'drm_dsc_get_bpp_int(dsc) / 24'.
> > > > > >
> > > > > >    For RGB101010 / 8bpp DSC this should result in the PCLK being lowered
> > > > > >    by the factor of 3 (= 24 / (30 / 3.75))
> > > > > >
> > > > > > - When widebus is in play (MDSS 6.x+, DSI 2.4+), the transfer takes
> > > > > >    more than 24 bits. In this case the PCLK and timing->width should be
> > > > > >    scaled exactly by the DSC compression ratio, which is
> > > > > >    'drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_per_component).
> > > > > >
> > > > > > So, this piece of code needs to be adjusted to check for the widebus
> > > > > > being enabled or not.
> > > > > >
> > > > >
> > > > > The widebus adjustment on the MDP/INTF side is already in
> > > > > dpu_hw_intf_setup_timing_engine: the "data width" is divided by 2 for
> > > > > 48-bit widebus instead of 24-bit. there shouldn't be any other
> > > > > adjustment (downstream doesn't have any other adjustment).
> > > > >
> > > > > a relevant downstream comment: "In DATABUS-WIDEN mode, MDP always sends
> > > > > out 48-bit compressed data per pclk and on average, DSI consumes an
> > > > > amount of compressed data equivalent to the uncompressed pixel depth per
> > > > > pclk."
> > > > >
> > > > > Based on that comment, this patch is correct, and the
> > > > > ''drm_dsc_get_bpp_int(dsc) / (3 * dsc->bits_per_component)' adjustment
> > > > > only applies to DSI.
> > > >
> > > > If I keep the INTF side at /24 and change the DSI side to:
> > > >
> > > > if (wide_bus)
> > > >         new_hdisplay = DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(dsc), dsc->bits_per_component * 3);
> > > > else
> > > >         new_hdisplay = DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(dsc), 24);
> > >
> > > Please check the actual fps (I'm usually using a vblank-synced GL, e.g.
> > > kmscube).
> > >
> > > At least this matches my expectations.
> > 
> > Hmmm with kmscube I am getting 120FPS with 24 and 100FPS with 30. So I guess that's a no go
> 
> Although it was using dsc->bits_per_component * 3 regardless before for
> dsi_adjust_pclk_for_compression so I guess that's what Jonathan was
> referring to earlier...

Do you have any of the patches by Marijn or Pengyu?

- https://lore.kernel.org/linux-arm-msm/20260311-dsi-dsc-regresses-again-v1-1-6a422141eeea@somainline.org/

- https://lore.kernel.org/linux-arm-msm/20260307111250.105772-1-mitltlatltl@gmail.com/

-- 
With best wishes
Dmitry

