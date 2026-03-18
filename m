Return-Path: <linux-arm-msm+bounces-98369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEFiEeVzumlvWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:44:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD75D2B9518
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:44:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DE4930062FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9253ACF05;
	Wed, 18 Mar 2026 09:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k0fdbjwC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jkbvuN/w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A472D3A4F5B
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773826778; cv=none; b=N8LBJ1UpTARnqWOwNb8fTAqBxP96latpAntHfBWHc/Xv4l9+ffjXlyLk0Di86NCQHglQy1ny1la3Evn2vcwLKhJaZdhnSoT8W/+S7W4G+odvfRJhG7Na/B9vyAhxy+MA9916zhmSqyFccN9eXqVQkZpOoHsg4Bd3Th9u3JuxmxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773826778; c=relaxed/simple;
	bh=0Si5sQOPiAxwGoddPq3JiTXRRM5MaLuIIhS0iau5Pyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOi71sA89lOmEHo6TAhQZlrDcgOptxgIj0A11CWHZSkWRSMBHCjvtZFsClxYpDpirMkHlY1nbzUAAsGFYGTo6TugdhdH/q24o78uxhmi6RjT6cwEW8KIv4LgU5xMp4yBvYlIe3CdGNtaNxieEmaaWJ5GZe0DfjSyFtm9x5J40ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k0fdbjwC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jkbvuN/w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I76iWv2613213
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NGtj5gt0oKKUD1rTumE2x6d/
	/ytfFsPqqr53mwIxXig=; b=k0fdbjwCeGqpazUS6OiQplnhyJoWwl30VNT8B/Tb
	vNwta5XUYhLGsXnNtMf8lqfMpXjD0TgzqGIB82MgwKULGP+w7D4/GSV1FnAS/dSi
	Zk0SXjhhlT9jv1OHctrsY9gjVHmm4b1w2T8jR05j39HvRP1B6U5NpgddYIwAPdCt
	7AYaVbNHEjgdw+qljzsz1EDg4ErssBV1dz4rvWxy9T8fNZuveFQ40zZY8+qiCVO3
	e0Ms/aw2hLiZreQ+ASd9gXiZuGMNyw5WBEJmTFFDKv3EFu3cV+3HRSavnh6w2ANC
	LqYHgD9qxHKA4e3z9n8GPd5iB1i7jdYv34okg1d537DBLA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyqcdrpc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:39:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093025ffecso46524381cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 02:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773826772; x=1774431572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NGtj5gt0oKKUD1rTumE2x6d//ytfFsPqqr53mwIxXig=;
        b=jkbvuN/wtAuMntg+D+qJ4kBwIrbQ8Q2UEzD3MAjosRQfqozmZ3WBRoDsbE6eZ5cGBq
         wKpcjKhWAbBcew8M5riJ2VBBGkMLWvHO/DJMoW2EX/vB7Zi8C9Q4l0oDxT5OSVRwlkSz
         Q0VuhJcNiUz2ZCN2fX969v/RKelHXBGisy4tFhcIEr2KuNKVcs6T8/HFdd5jbk9A9wkn
         oIAeS9gqsrumlh74GFoX/RcXV63tWMP9GXSnm7O9UDZ7a4fjw3jfgo85qWFmALf8pShX
         IOR864ja5dE32f4d569uz38FFiq5KFRupq5RlITedlGdexgM4OUSMJZFUykdP7GqAknZ
         BDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773826772; x=1774431572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGtj5gt0oKKUD1rTumE2x6d//ytfFsPqqr53mwIxXig=;
        b=g3aLzO3tYVnlJA2CMIoI8U+zcw0op/biusbXhzPKSTs7l8gk+5Tq8ax1uh6MTnoLSt
         ApozFLJ//u4pshsOtD8Fq8RCYBf0W23ZZzgAxlPAdBxk1KD1WlKIssFPktMtR/obOsVG
         O4AehISDMSRAz+L3vWrrZ7RKQ4T+ZHa33hbM04ow/A3uR0mpzMkcYlGA3+8x9CEqtggE
         bHFUlw6I8lAy9ikdFR0UvYVuI01FajS+ef8J731KLI7cDQKCAGdcy+rRQ51SUNLvRzqP
         CcYP5AHqjlpCIox4sDbhgIYa5SJ6FKTzUs226yDbcR3Wg7lunXkud1VY0qnYIwUd+5c8
         GulA==
X-Forwarded-Encrypted: i=1; AJvYcCWz/EY2Z0kuLyThb4x4/i9zT4BdR3yDcCbS3VqGwJW/vBexg4s61jVVSaDLoCpD0WM7/v92PULelxpw6dTz@vger.kernel.org
X-Gm-Message-State: AOJu0YzEUQnkKjWKB/tjES2KVkGAwUfCUgQtxG4B/BswnjqhDXK1toPV
	vdNkn9iPGDhVRsOP/ism7Kb8SUY324X1Vi+nMFVbaaZhU2hou2CCoJ4qYbTkuugwbPpJVqoBPiC
	/4LjFUQsA3XBpMJl61tQPVaa8zY8HpNgw0+ummGvvOi1I0xa57aD2PePkQp5L680oaed2
X-Gm-Gg: ATEYQzyGabebjI9k2lQiw9DSkAD6sPLUhsojfHTfUlJjopEinX9YUo07AWESIODqqVa
	e0VvmhZ2okaPAwNYRsGK/zfKQ6FSg9p7LdG4/3BGOAA+a4YXdOOjSFepaxfdPlhNQN14K12IESu
	Nu5WAuIX/+vP1QtRmuXu2KyJNkxGE07CLlVE8/6oEBFuvmuajU6wciXrnvpaWHaKxESCh7XCJgF
	XYovVBYComm6fwqH3pL8aHlBcuGgL1h+AiAFprrmvJzdaGcrj4/KdPiVgan8vixeNfmjOXdlT2g
	c/ez7bhKXZVYQfsqdYkPSjmMdZX4wEdooypvBNiHi4QmLFMmYhdu/C8P1SY/w58LilDrVWsy8eB
	6XtbLKjFC5Dcof4ucgYMMJIKPsYgYjEdWw/zxiTolg2TdFB7spPZVc5z/mMIs62LTe5oySRluX4
	VpjxcgwoUeGf449ykNLCCB7QV3jggFgdhCyvA=
X-Received: by 2002:a05:622a:198e:b0:509:21eb:4722 with SMTP id d75a77b69052e-50b14916944mr26302111cf.39.1773826772510;
        Wed, 18 Mar 2026 02:39:32 -0700 (PDT)
X-Received: by 2002:a05:622a:198e:b0:509:21eb:4722 with SMTP id d75a77b69052e-50b14916944mr26302001cf.39.1773826771968;
        Wed, 18 Mar 2026 02:39:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd517e0fesm4481011fa.14.2026.03.18.02.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 02:39:30 -0700 (PDT)
Date: Wed, 18 Mar 2026 11:39:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
Message-ID: <w74ctaczp3ty7wil2sfkztc6wvuppgpyff4tw4dze34irvfmlx@e5f36rzqmp6i>
References: <20260318-dsi-dsc-slice-per-pkt-v1-0-1bd66b7f9e0c@pm.me>
 <20260318-dsi-dsc-slice-per-pkt-v1-2-1bd66b7f9e0c@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-dsi-dsc-slice-per-pkt-v1-2-1bd66b7f9e0c@pm.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3OSBTYWx0ZWRfXzB9R5/wdzTCY
 bFDJeJcAvYblZ3UcK3jeB6n/+C5BkUq+nWJM/ht3dNYjy+UIdw0u8h4dFk1dB07kVgZ4H25YF3E
 +BuRzqFwgaQKxSZBpVMO3359B/BqSKDaeiKMzdHlirXR609aH+D5ho6EpB4Nv5uorNB62MqdixL
 hhaJ7DQfjxDnddsQ08JUn+zigB6O33Pv4670NXpcSwLg9tRpcQtSUnUHntpSMx8TQAS0DNbzH4d
 4u1ECGWofHt7mNa2uQFQOPKUbk1PqnjafI8FpowLPcs6a6LjArziEth0TlanSF3naob0cT/FNYB
 Twai6s74Yyx/soyJBFsUcXm4gRNNWA7nG+izldp5GkCMOWc/JkCTkSdoY3S88M+yi9VzZrOGDiv
 iJEugDoMHdFTj31YogGf4YHYesnFLz9XDVCE13CtHL1HzRQ1ld9whWDoqWpvXYQqo9IzttIEo3U
 NwcOZtUkj71FWO7o6gg==
X-Proofpoint-ORIG-GUID: UI9IjnsM29wZcENzhXoR8i_aLtqHlcoh
X-Authority-Analysis: v=2.4 cv=H87WAuYi c=1 sm=1 tr=0 ts=69ba72d5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=RAbU-raeAAAA:8 a=Q6o_JRKf7zH18ftsKlAA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-GUID: UI9IjnsM29wZcENzhXoR8i_aLtqHlcoh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180079
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98369-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,pm.me:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AD75D2B9518
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 07:33:03AM +0000, Alexander Koskovich wrote:
> Some panels support multiple slice to be sent in a single DSC packet and
> this feature is a must for specific panels, such as the JDI LPM026M648C.
> 
> Use the MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT flag to derive slice_per_pkt
> from slice_count, note that most panels are expected to just work with
> just one slice per packet.
> 
> This change was originally authored by Jonathan Marek:
> https://lore.kernel.org/all/20231114174218.19765-3-jonathan@marek.ca

This is a wrong way to give attribution. Either please retain the author
and Jonathan's SoB or use Co-developed-by and still Jonathan's SoB.

The patch looks good to me.

> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
> 

-- 
With best wishes
Dmitry

