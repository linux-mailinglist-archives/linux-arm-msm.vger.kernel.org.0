Return-Path: <linux-arm-msm+bounces-108237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GICUN3pAC2p4FAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 18:38:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DB6571087
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 18:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38EC73032F6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 16:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFE7481FDD;
	Mon, 18 May 2026 16:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OlJ9MC1i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OPlQLxdN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555E7481FBC
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 16:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122165; cv=pass; b=S4X/GdplPTvvlBQduJ3qbgnQffr4KSdMoVWWivZChO0BlrVx/fHH3FvxBnjShD4GjNHbPOOW6jq3uMwryAhKBG/rbY+0plml/9HvOSbLZ8WHyo8AphPW+YNYUqb0M+esZ7nQ2a41UhkRU2ciHTnV1pIlwtipFgAUtpJfQMhv3/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122165; c=relaxed/simple;
	bh=jaUtnGIpIM0limlbRP4+YsnqIKR/Nq5J/7Z1N92G3nw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NoBhP2Iu1aEnZhAJwzim9LOguzsbtssWAIXINDWvtawC8dv4iAABmCzqE/FpV/fHHNcPXylk+HMGkXpboPB2pVGfXiAqk23I6JrrjLkIr8IkUPhaufdLAIWUrF4+Bp5gaB80NOeOmitd6aphMfCbpL65ehSQdM0RxT+Xjh15CTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OlJ9MC1i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OPlQLxdN; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IGKITB2090992
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 16:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=fMHaYLlIWH4bkOXc2c6LHvGX6/Fg7TqcuV/WmKlcnTg=; b=Ol
	J9MC1idfoToplDgkxeYhRWzyN/WKwd72Oyha3dtzxfhqgfn7r2HfsCRm8+W+daVI
	VHN9EkAL/5T6NSOPThHid0mxw9nLn32xiilbhR6YRulaupc3BniLHTQA1vWPEDWC
	b7UU9UbjHUoCADIB8Jwv8rfVNLfwxU8zKTU7tr/EislZ/fHeX510bqyfbThurn+w
	hXahX2rs7KJaFftHBre0ULgNK146twpp4Trkl1b3egcf5n3XVpPiL8781zzbwTlq
	SxZkSmQ0lud4IU3K/sdx4xHUWIRwggOHV18crg45mPZULNVy92KDEB24i67R5d/N
	+r0xTd6B9BS479Krspow==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e80rphhev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 16:36:01 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-482ea6a31d3so4895509b6e.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:36:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779122161; cv=none;
        d=google.com; s=arc-20240605;
        b=gaSrmrlsy2bkhs6eIiX/lLL/vBVJF8/f+BHhsEZVQ/vNCQfosVwVwZSEAfTBOT7md5
         73+cuH/mDalU8v+A6+qsXg5sFkPN464+xz79dN6RuN8uvLg2PtPWMYCr68/TFhz+Xfz7
         o+5XGI5td9MSHJr2QwZGvoxvtazj08IYkon1PzhAxOl6m7C7konwR+gXJ8FmgPStjXna
         i8oemGseWn6Z3Gxh7/yTiLb3APo7MMksrhB7a+Szzn0d+nDD9olOpw+ip8P4Bpjr89xJ
         873lc4M8Wjd6BdyNSbe9ppoyvzkBlGGYR2Y/+TAn6IeEItbHrZ0/0Kfy9137Dj8avDsg
         vc4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=fMHaYLlIWH4bkOXc2c6LHvGX6/Fg7TqcuV/WmKlcnTg=;
        fh=6GG92my2VWd2ld8H+STOI3dnmGiN7P7MqkY6RBxL18g=;
        b=VSK4k1dlRyKodtgDJSoWuH5fJo15AEJkcvWmggpYVgmux3EDcAb26YrOf2F5+QQRFH
         XSYe7s81z8c7S0p8x37+/LNlcEsfSSlxUJo+VPczk1hgx84M4b0jypgXDfqhCzk3I4uo
         sTyQXtPpRD2vtOVZ9UfuwIgUqg2RikodwuzgCYbAqD1djPWFMuQ51IX4PzSiEI8qoHf3
         sniuGCALvvmJVPB9PX+T1tytQTMBuB7319NgL8dwXaiFickEkUTr7/lyiP5nGCqSpamF
         So4pw38151x+e+usUx8w+99W+1e+y6duv817gsdXiCAra16pnondn8uEz3dKU/bKnAJ0
         Ce0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779122161; x=1779726961; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fMHaYLlIWH4bkOXc2c6LHvGX6/Fg7TqcuV/WmKlcnTg=;
        b=OPlQLxdNWGxgAQ5cCBf/LT+FBNyufqC0Y9lFGiHQcHwtaGns2UI9wxUHxcKaf/yAby
         F/KMU4xG6V6J1wJN2bFNVKcMtKEbyh72ZyqKiX++7+OvU93hs3YZ9EajxWj2uvgEdSe7
         LqZpKa3CwACkidq8kCVmCPK89xRg5sPPmFcWv+Js0QRnNnzV8FcQBryLcx5VV7qsEZjF
         N2fgPC6PaSIne9o6HwydE+/3fvsi7tbLRVsSZtgFn6mkwo/dWEsMaLajY2eK5zDGQEh8
         4RFbid4jzIETLAVwviR7m4Nca0YldiJ6btbd8m/VpvjPVoZ/SW9+VZgqvNptPzpDeKUy
         /7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779122161; x=1779726961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fMHaYLlIWH4bkOXc2c6LHvGX6/Fg7TqcuV/WmKlcnTg=;
        b=pydJgBjP85jOytkPBQeOIXDPMDzZ0h+e6XD0MrwE+qYiRvGJ1rE4zcZiDSTpYyS42A
         wjIpWF+t/bn1BlDHL0yhk8wa6sZ6OTvziUVfPhwLsD3DdH6TXybu6kqDx9rg9Z5ZGf8D
         zMPbNxJJBAIglpXPlVsCmS/M9R2SLGUkb/qV6S8zlZZ6J7n/HLBs8RCp5ex1RPoKcJBK
         vNbFuzdIL2OPE3k2cr9a1MURjs4yfH5SOSd64tmmV+haIagcRYMEC/QpwcUIe9W1OHW/
         gZjAiVophxb0zKAro/wFeYut5MuAB68J9RWbFMIhLs0BTsX7szdtJnkJqkKyyVM85ZH+
         grzg==
X-Gm-Message-State: AOJu0YzyFbpWmFe8yn3zAezP+aWgs6sFYu7skNX6xv9PrpuvdKob6OGr
	bkrLXw9U1wq7jobwt+/7jym0mZJORSotRWy1MC36iH9kbChm6gWYyZKl8GTWBHFrz3dOwhKsBT/
	ed3Di34W/fFiBTMQtsGQ/YrY6jlIbCwYg+6LzUvd2DnkRT/fRJUFeSkoPeCoXEyXxPHtGlgg061
	OebhLpfsWreCZJ1KOwEyiXeKvZHlSurlO4aLzHutivp9M=
X-Gm-Gg: Acq92OHj0ODJ/60cz9Lkmp3a5TrHc6rqd9wNxaE9ejOr85xY5vW181sG5M+giiU3MtK
	LGLbeSJIhyEnJ17Kk6VZjE+YYXVcqVGlrS/d2eHkcc/SgktXSNdXiQXDFaTvFev/YUtHOP8eQ8U
	Vy2kKb3BPfdaRdhox7ZS1JA5cPj6LADxcKwJ7BLGrohY6DK39eUty/Yxm2EN/10IUI5k3KnqH3S
	Ch4/7hXnVbHLGf8we0sD/Qr25VAPH4fzs4iFg==
X-Received: by 2002:a05:6808:1a07:b0:479:eb19:6e69 with SMTP id 5614622812f47-482e55afc8dmr10176723b6e.6.1779122161286;
        Mon, 18 May 2026 09:36:01 -0700 (PDT)
X-Received: by 2002:a05:6808:1a07:b0:479:eb19:6e69 with SMTP id
 5614622812f47-482e55afc8dmr10176698b6e.6.1779122160739; Mon, 18 May 2026
 09:36:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514134052.361771-1-robin.clark@oss.qualcomm.com>
 <20260514134052.361771-14-robin.clark@oss.qualcomm.com> <836c9b33-4215-4e20-96d8-a8dc29ac6dde@oss.qualcomm.com>
 <CACSVV02DsSv7T4nDhmLSbNYigGNz4r1jmx3T=uXyg__=2CvE-Q@mail.gmail.com>
In-Reply-To: <CACSVV02DsSv7T4nDhmLSbNYigGNz4r1jmx3T=uXyg__=2CvE-Q@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 18 May 2026 09:35:49 -0700
X-Gm-Features: AVHnY4Ibv5YCsZv7nnVEfMUb1bLEhV8RNCxoVyk5jxUc5scYh9H_dXVrl3yMZPc
Message-ID: <CACSVV03f3GAjekAaL6kT9bD3B9suQ4DkQQqVNr97x=OMgqa=fg@mail.gmail.com>
Subject: Re: [PATCH v6 13/16] drm/msm: Add PERFCNTR_CONFIG ioctl
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        open list <linux-kernel@vger.kernel.org>,
        dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: cNMlBDVEpgtseYQYkbSxlDKawcYr0rgB
X-Proofpoint-ORIG-GUID: cNMlBDVEpgtseYQYkbSxlDKawcYr0rgB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2MyBTYWx0ZWRfX1TpkORpWyqi7
 U/lkitVOsgd/lszb7oSfT3YQMdMfpJaeaI2kE3NIBuaqccS7Ojze06BGV9TcQP8lOf1u1YPnQ+M
 RiQ0QvxYRuL0e9mbbY3l1ulNRJm2c1wt1BUk/buwnfL69nJH8HttpJheaFHBgYw49CWQ2O605h3
 7oc8570viVQIY8s6kbLQm+WUgx7bf+GpfowvtQjuyx9oIlMAG4pA0EEMpOnL2SvjTnwxH3FSHW9
 h5E8MqN3/UxI84q4nD7H0Dirc1O7w4PUVyBaO7seVeCmxACW6Wuy26xzg/222ilc2ZZzdtTmGKv
 Nc7m7HkIF7bdg7EUC96sxG5fmysQ6wJRuA0XsARc9MmAm7c4xdyeUxnRTgrcEuLXDa7b8cbsS8V
 c8fguf2MKGqsiadAr8xAcrzXLYt4ZDa2mrHEeRKiSMwftymQJ8L63Zss+RFpk1nDNo4XS+tP57S
 Jqj9l/i4Cyu7VmIY08A==
X-Authority-Analysis: v=2.4 cv=ecMNubEH c=1 sm=1 tr=0 ts=6a0b3ff2 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=M8SrLyCKTCxg5gAENbMA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180163
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108237-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com,kernel.org,linux.dev,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:replyto,oss.qualcomm.com:dkim,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 37DB6571087
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 6:46=E2=80=AFAM Rob Clark <rob.clark@oss.qualcomm.c=
om> wrote:
>
> On Sun, May 17, 2026 at 3:54=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualc=
omm.com> wrote:
> >
> > On 5/14/2026 7:10 PM, Rob Clark wrote:
> > > Add new UABI and implementation of PERFCNTR_CONFIG ioctl.
> > >
> > > A bit more work is required to configure the pwrup_reglist for the GM=
U
> > > to restore SELect regs on exist of IFPC, before we can stop disabling
> > > IFPC while global counter collection.  This will follow in a later
> > > commit, but will be transparent to userspace.
> > >
> > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> > > ---
> > >  drivers/gpu/drm/msm/msm_drv.c      |   1 +
> > >  drivers/gpu/drm/msm/msm_drv.h      |   2 +
> > >  drivers/gpu/drm/msm/msm_gpu.h      |   3 +
> > >  drivers/gpu/drm/msm/msm_perfcntr.c | 516 +++++++++++++++++++++++++++=
++
> > >  drivers/gpu/drm/msm/msm_perfcntr.h |  51 +++
> > >  include/uapi/drm/msm_drm.h         |  48 +++
> > >  6 files changed, 621 insertions(+)
> > >
>
> [snip]
>
> > > diff --git a/drivers/gpu/drm/msm/msm_perfcntr.c b/drivers/gpu/drm/msm=
/msm_perfcntr.c
> > > index 04407260a4e1..d6716ce0657a 100644
> > > --- a/drivers/gpu/drm/msm/msm_perfcntr.c
> > > +++ b/drivers/gpu/drm/msm/msm_perfcntr.c
>
> [snip]
>
> > > +static ssize_t
> > > +msm_perfcntrs_stream_read(struct file *file, char __user *buf,
> > > +                       size_t count, loff_t *ppos)
> > > +{
> > > +     struct msm_perfcntr_stream *stream =3D file->private_data;
> > > +     int ret;
> > > +
> > > +     if (!(file->f_flags & O_NONBLOCK)) {
> > > +             ret =3D wait_event_interruptible(stream->poll_wq,
> > > +                                            fifo_count(stream) > 0);
> > > +             if (ret)
> > > +                     return ret;
> > > +     }
> > > +
> > > +     guard(mutex)(&stream->read_lock);
> > > +
> > > +     struct circ_buf *fifo =3D &stream->fifo;
> > > +     const char *fptr =3D &fifo->buf[fifo->tail];
> > > +
> > > +     /*
> > > +      * Note that smp_load_acquire() is not strictly required
> > > +      * as CIRC_CNT_TO_END() does not access the head more than
> > > +      * once.
> > > +      */
> > > +     count =3D min_t(size_t, count, fifo_count_to_end(stream));
> >
> > We need smp_load_acquire() to ensure all prior writes from the producer
> > side are visible before the 'head' is read.
>
> circular-buffer.rst documents the case that smp_load_acquired() is not
> needed.  Maybe that is assuming TSO?  But I think even without TSO
> address and data dependencies should be maintained, so this should
> still be true on arm64?

Ok, I think ordering is only maintained within a single core.  So
probably the circular-buffer.rst docs are making too stong of an
assumption about x86/TSO..

> We've been using the same in a couple other places in msm, fwiw.
>
> > > +     if (copy_to_user(buf, fptr, count))
> > > +             return -EFAULT;
> > > +
> > > +     smp_store_release(&fifo->tail, (fifo->tail + count) & (stream->=
fifo_size - 1));
> > > +     *ppos +=3D count;
> > > +
> > > +     return count;
> > > +}
>
> [snip]
>
> > > +int
> > > +msm_ioctl_perfcntr_config(struct drm_device *dev, void *data, struct=
 drm_file *file)
> > > +{
> > > +     struct msm_drm_private *priv =3D dev->dev_private;
> > > +     const struct drm_msm_perfcntr_config *args =3D data;
> > > +     struct msm_context *ctx =3D file->driver_priv;
> > > +     struct msm_gpu *gpu =3D priv->gpu;
> > > +     int stream_fd =3D 0;
> > > +
> > > +     if (!gpu || !gpu->num_perfcntr_groups)
> > > +             return -ENXIO;
> > > +
> > > +     struct msm_perfcntr_state *perfcntrs =3D gpu->perfcntrs;
> > > +
> > > +     /*
> > > +      * Validate args that don't require locks/power first:
> > > +      */
> > > +
> > > +     if (args->flags & ~MSM_PERFCNTR_FLAGS)
> > > +             return UERR(EINVAL, dev, "invalid flags");
> > > +
> > > +     if (args->nr_groups && !args->group_stride)
> > > +             return UERR(EINVAL, dev, "invalid group_stride");
> > > +
> > > +     if (args->flags & MSM_PERFCNTR_STREAM) {
> > > +             if (!perfmon_capable())
> > > +                     return UERR(EPERM, dev, "invalid permissions");
> > > +             if (!args->nr_groups)
> > > +                     return UERR(EINVAL, dev, "invalid nr_groups");
> > > +             if (!args->period)
> > > +                     return UERR(EINVAL, dev, "invalid sampling peri=
od");
> > > +     } else {
> > > +             if (args->period)
> > > +                     return UERR(EINVAL, dev, "sampling period not a=
llowed");
> > > +             if (args->bufsz_shift)
> > > +                     return UERR(EINVAL, dev, "sample buf size not a=
llowed");
> > > +     }
> > > +
> > > +     if (args->nr_groups && !args->groups)
> > > +             return UERR(EINVAL, dev, "no groups");
> > > +
> > > +     /*
> > > +      * To avoid iterating over the groups multiple times, allocate =
and setup
> > > +      * both a ctx and global stream object.  Only one of the two wi=
ll be
> > > +      * kept in the end.
> > > +      */
> > > +
> > > +     struct msm_perfcntr_context_state *perfctx __free(kfree) =3D kz=
alloc(
> > > +             struct_size(perfctx, reserved_counters, gpu->num_perfcn=
tr_groups),
> > > +             GFP_KERNEL);
> > > +     if (!perfctx)
> > > +             return -ENOMEM;
> > > +
> > > +     struct msm_perfcntr_stream *stream __free(kfree) =3D
> > > +                     kzalloc(sizeof(*stream), GFP_KERNEL);
> >
> > How about using GFP_KERNEL_ACCOUNT everywhere in the ioctl path to
> > account the allocated memory to the process?
>
> Maybe the circular buffer itself should be?  But the size is bounded,
> and I don't see much other use in drm..
>
> > > +     if (!stream)
> > > +             return -ENOMEM;
> > > +
> > > +     uint32_t *group_idx __free(kfree) =3D
> > > +             kcalloc(args->nr_groups, sizeof(uint32_t), GFP_KERNEL);
> > > +     if (!group_idx)
> > > +             return -ENOMEM;
> > > +
> > > +     stream->gpu =3D gpu;
> > > +     stream->sample_period_ns =3D args->period;
> > > +     stream->nr_groups =3D args->nr_groups;
> > > +     stream->fifo_size =3D 1 << args->bufsz_shift;
> > > +
> > > +     mutex_init(&stream->read_lock);
> > > +
> > > +     guard(mutex)(&gpu->perfcntr_lock);
> > > +
> > > +     if (args->flags & MSM_PERFCNTR_STREAM) {
> > > +             if (perfcntrs->stream)
> > > +                     return UERR(EBUSY, dev, "perfcntr stream alread=
y open");
> > > +     }
> > > +
> > > +     size_t bufsz =3D 16;  /* header size includes seqno and 64b tim=
estamp: */
> > > +     int ret =3D 0;
> > > +
> > > +     for (unsigned i =3D 0; i < args->nr_groups; i++) {
> > > +             struct drm_msm_perfcntr_group g =3D {0};
> > > +             void __user *userptr =3D
> > > +                     u64_to_user_ptr(args->groups + (i * args->group=
_stride));
> > > +
> > > +             if (copy_from_user(&g, userptr, args->group_stride))
> >
> > use copy_struct_from_user?
>
> I think this would cause a new userspace on old kernel to fail,
> instead of simply ignoring new fields added at the end of the struct.
> Which for better or worse is different from how drm_ioctl() works.
>
> >
> > > +                     return -EFAULT;
> > > +
> > > +             if (g.pad)
> > > +                     return UERR(EINVAL, dev, "groups[%d]: invalid p=
ad", i);
> > > +
> > > +             int idx =3D get_group_idx(gpu, g.group_name, sizeof(g.g=
roup_name));
> > > +
> > > +             if (idx < 0)
> > > +                     return UERR(EINVAL, dev, "groups[%d]: unknown g=
roup", i);
> > > +
> > > +             if (g.nr_countables > gpu->perfcntr_groups[idx].num_cou=
nters)
> > > +                     return UERR(EINVAL, dev, "groups[%d]: too many =
counters", i);
> > > +
> > > +             if (args->flags & MSM_PERFCNTR_STREAM) {
> > > +                     if (g.nr_countables && !g.countables)
> > > +                             return UERR(EINVAL, dev, "groups[%d]: n=
o countables", i);
> > > +             } else {
> > > +                     if (g.countables)
> > > +                             return UERR(EINVAL, dev, "groups[%d]: c=
ountables should be NULL", i);
> > > +             }
> > > +
> > > +             int avail_counters =3D get_available_counters(gpu, idx,=
 args->flags);
> > > +             if (g.nr_countables > avail_counters) {
> > > +                     /*
> > > +                      * Defer error return until we process all grou=
ps, in
> > > +                      * case there are other E2BIG groups:
> > > +                      */
> > > +                     ret =3D UERR(E2BIG, dev, "groups[%d]: too few c=
ounters available", i);
> > > +
> > > +                     if (args->flags & MSM_PERFCNTR_UPDATE) {
> > > +                             /* Let userspace know how many counters=
 are actually avail: */
> > > +                             g.nr_countables =3D avail_counters;
> > > +                             if (copy_to_user(userptr, &g, args->gro=
up_stride))
> > > +                                     return -EFAULT;
> > > +                     }
> > > +             }
> > > +
> > > +             group_idx[i] =3D idx;
> > > +             perfctx->reserved_counters[idx] =3D g.nr_countables;
> > > +
> > > +             if (args->flags & MSM_PERFCNTR_STREAM) {
> > > +                     perfcntrs->groups[idx]->allocated_counters =3D =
g.nr_countables;
> > > +
> > > +                     size_t sz =3D sizeof(uint32_t) * g.nr_countable=
s;
> > > +                     void __user *userptr =3D u64_to_user_ptr(g.coun=
tables);
> > > +
> > > +                     if (copy_from_user(perfcntrs->groups[idx]->coun=
tables, userptr, sz))
> > > +                             return -EFAULT;
> > > +
> > > +                     /* Samples are 64b per countable: */
> > > +                     bufsz +=3D 2 * sz;
> > > +             }
> > > +     }
> > > +
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     if (args->flags & MSM_PERFCNTR_STREAM) {
> > > +             /*
> > > +              * Validate requested buffer size is large enough for a=
t least
> > > +              * a single sample period.
> > > +              *
> > > +              * Note the circ_buf implementation needs to be 1 byte =
larger
> > > +              * than max it can hold (see CIRC_SPACE()).
> > > +              */
> > > +             if (stream->fifo_size <=3D bufsz)
> > > +                     return UERR(EINVAL, dev, "required buffer size:=
 %zu", bufsz);
> > > +
> > > +             if (stream->fifo_size > SZ_128M)
> > > +                     return UERR(EINVAL, dev, "buffer size too big (=
>128M): %zu", bufsz);
> > > +
> > > +             /* There aren't enough counters to hit this limit: */
> > > +             WARN_ON(bufsz > SZ_128M);
> > > +
> > > +             stream->period_size =3D bufsz;
> > > +
> > > +             void *buf __free(kfree) =3D
> > > +                     kmalloc(1 << args->bufsz_shift, GFP_KERNEL);
> > > +             if (!buf)
> > > +                     return -ENOMEM;
> > > +
> > > +             stream_fd =3D anon_inode_getfd("[msm_perfcntrs]", &stre=
am_fops, stream, 0);
> >
> > This call makes the fd visible to the userspace immediately. So better
> > to move it after all initializations. Ie, after
> > msm_perfcntr_resume_locked().
>
> Hmm, but this doesn't play too nicely with cleanup.h stuff, because
> the no_free_ptr() stuff must come after the last point of failure.
>
> But I think instead we can use get_unused_fd_flags() + fd_install() to
> defer exposing the fd.. I'll try this.

Turns out FD_PREPARE()/fd_publish() work well for this

BR,
-R

> BR,
> -R
>
> >
> > > +             if (stream_fd < 0)
> > > +                     return stream_fd;
> > > +
> > > +             INIT_WORK(&stream->sel_work, sel_worker);
> > > +             kthread_init_work(&stream->sample_work, sample_worker);
> > > +             init_waitqueue_head(&stream->poll_wq);
> > > +             hrtimer_setup(&stream->sample_timer, sample_timer,
> > > +                           CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> > > +
> > > +             stream->sel_fence =3D ++perfcntrs->sel_seqno;
> > > +             stream->group_idx =3D no_free_ptr(group_idx);
> > > +             stream->fifo.buf =3D no_free_ptr(buf);
> > > +             perfcntrs->stream =3D no_free_ptr(stream);
> > > +
> > > +             msm_perfcntr_resume_locked(perfcntrs->stream);
> > > +     } else {
> > > +             kfree(ctx->perfctx);
> > > +             ctx->perfctx =3D no_free_ptr(perfctx);
> > > +     }
> > > +
> > > +     return stream_fd;
> > > +}
> > > +
> > >  /**
> > >   * msm_perfcntr_group_idx - map idx of perfcntr group to group_idx
> > >   * @stream: The global perfcntr stream

