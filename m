Return-Path: <linux-arm-msm+bounces-98027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIVfNzVguGlbdAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 20:55:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F66A29FEF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 20:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 771A9303B2E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 19:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763D13EC2F0;
	Mon, 16 Mar 2026 19:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f3FenR7x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JZt9R/XC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194393ED5C0
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 19:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773690898; cv=none; b=XDugaOzFmBf/f+0WDJhU3C2XYm42fl9fxy75fsBybzllU9zbA+dP/RjkaSeWCaGetPWDT+OqX52n013l6+AQ4lMTaGR3Cu3MqNPYDzkYeYBAQyxGG2EfC8lKoNExWYwjgHRJAemcKT+orQk4bRH6bqpF4a7Iz1zBE7Vr7hRDuh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773690898; c=relaxed/simple;
	bh=jGryuGs8NIg4evojpko6Xnvf6SVVFXEFBx+g4p431Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/uYSTyuUNNxdG1WcxHR4zr3yypvczyI5ftTDp4ihh1Ac9wBiKFvbITi91gG+D0PZC61aYkqd994SkxEnZZe1R3dX180vTEWgdyEYAxgQE+/hSHGjdRX8iFY9T4oEmPmrnBuJdjf7InMpODeFUunnszR1ykAby1hG2BqtPPUZnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3FenR7x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JZt9R/XC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GGOw0D3124528
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 19:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pIDGUC66DjeB5/G8Sh3DXLNt
	596Pz7YBrzXPtS3KZpA=; b=f3FenR7xKGBt7N689oX1FC7QCS3nZKWyany+Ukve
	AhGgqwm9iAgDQemKfXde2XKj4dmel1184ERT0DJphfT5NRqMNwVM113O+oewmBfb
	l7WjLUQxTBYuydQGuiniirF0uwDiy78WWJ/vMQ+bvMy60eo5koNmr9Nj8UWJ1YJ6
	cY2BVEbsBLiLpzgbgPbO+gH0RakTe6GjTAZyKnL4zYxHDeQjaP+GFFRwOjQAe1/S
	auRfD8JKoGljAfRFauPH1duCup4fBX+Jt3rssfxVio3bu3swuUzzt2N14iPhNOcT
	UsFKEZKkbyVsx6MGpXXL0csd8LlSpJGhIjUoJIhY3wAHrw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxfsmj4n5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 19:54:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb706313beso710706885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 12:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773690894; x=1774295694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pIDGUC66DjeB5/G8Sh3DXLNt596Pz7YBrzXPtS3KZpA=;
        b=JZt9R/XCcI5fG10kuohhQfgU4v8jon7Dj6X4Q2uU9mB/UWsi2+sR7b9vdajt1d7RwG
         pV9RjPHWZ8llqTOpIAH6UQW5qpnT3ZdFuiHxPuge6Fsm17+RpfZHCqJYUjeKmUGvFBZN
         aqhD0NHpKvb7m9o9ApzU/e/fhAhwloHp52d8FsqWt3TrZACsZjuCuggoS9NJnhCfP6AJ
         JWBDUYvSFIGIOIiejIR2B2juUH6XKOpwPetjsPfHr0hKOmTLpt3EBEU/r1w+rigcCHP/
         s6t6ToMrZcheoDW5EEfUws+iMlJowipP6apMOSA9Fsc/Hzcpe9cphOsHr1HC2LllrZcC
         /5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773690894; x=1774295694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIDGUC66DjeB5/G8Sh3DXLNt596Pz7YBrzXPtS3KZpA=;
        b=fHB+w1nSNCZgLt5Ps0lbEGX/5TS7sQepqSvcZCfGIol8N6iNLEVdkPQnpNqdGTMh/f
         Q+enzRKT52AAj8MTORieab2BbFnlCutPrqdSOSgmGq06zfSi5sR+/cklo5S7EXaPxBZE
         uDnyjHEdHLqvtPIpYeyC39DitI9IElSA13Op7KmjKiLnYSOfKMHQ5vByh9qlUqIYV06k
         zQotvgIRnI2s1GdT1JSwTPZ9F1wvx6fFGtCa6+maF651KS7+Sya9PfuPTXtKD0SNDw8E
         jL20d7Q3Ao5DQRaCaqkymehkMdlQxYBIprBH+in8NmFj1M/fIyFmg6UNU4cYwoF/2/vX
         tZ+w==
X-Forwarded-Encrypted: i=1; AJvYcCUBhsaFt7LpQ8s8fgi2Wu0ghKA8w6hG2Z5BnGmPJY+6IvXRG19w583qW/MA8FnQxcnoRMH64n0FHa1bH1fU@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn5kAPImwqYmQTTKMn6fs9MaV6mvFrvuqfdFTp3tVESP9geqtE
	vkawyLygfWk++hJPclCn3jgJc5ZBv8VxFjGMZ1XTOdtH4p86ym9tPMCB8sw/7JPqXQ2QFLKl1LL
	RJk2Bu47x3/VlD2+RiiHfN2Ud3vfgvCeDDOfrbdb7qOv/58uV31AGASV4utKLWQMWUaDB
X-Gm-Gg: ATEYQzyBgkwYFNMJCeqo/KADnIFn8s1LucoKO9sic0jXxcjK7SuCsaUMKTkU6m39Sbi
	3YzWezcBBLr+XToyR+aE1L57eIYZtl6rwNtFBv+MzsbKQil6EAAd2PLgVZeqH+enUOeHyVpnU/Q
	R138jOOw2N1bw9vhL0NccmntL26E5vog0MdsYWeyno92knz5Hc0ZeLTwhH1TxPccnBVliHKS9/O
	wAJnW6DF2nx+ULSM6EnZtKnflnU2nwWcB4+xiqZbqTk2d1dJYDZftb3L4reNQSB2iu1byXJljO0
	x8S51zqGw9qMME5FFqDVJAAtHCkP23g3Ak/DeFdKCqtaCnF4H+Xky+4MpARzsyDbxd+ZtKJMXYb
	WNlxNONWX9/aQGxn0GiUvA3ZFwZolK7ogywnA2oEtcH2JRnmJEDNQKfw2h2bBwBI8RSwuS8BNhs
	4igirHdEW6xZOUaiLzFyQ5FszDtMqa4SlmPj8=
X-Received: by 2002:a05:620a:31aa:b0:8cd:8e8c:208b with SMTP id af79cd13be357-8cdb5b05b6amr1799113285a.38.1773690893985;
        Mon, 16 Mar 2026 12:54:53 -0700 (PDT)
X-Received: by 2002:a05:620a:31aa:b0:8cd:8e8c:208b with SMTP id af79cd13be357-8cdb5b05b6amr1799109585a.38.1773690893417;
        Mon, 16 Mar 2026 12:54:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156358066sm3681927e87.63.2026.03.16.12.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 12:54:52 -0700 (PDT)
Date: Mon, 16 Mar 2026 21:54:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev
Subject: Re: [PATCH v2] drm/msm/disp/dpu: add merge3d support for sc7280
Message-ID: <twm2kcouzbwew4md27f3o36q5odpctlfugmkakxom7b2ittftg@qb7golmack6c>
References: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
 <DH1IKLU0YZYU.2SW4WYO7H3H4R@fairphone.com>
 <tbi5mwg4jt5scvr76lpzpvi5zj3kn3entoorsd4dior4g23czd@xtobadslhfrz>
 <DH437ESQRIAF.2336WF7XZBTI@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DH437ESQRIAF.2336WF7XZBTI@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE1OSBTYWx0ZWRfX0/2s63QLFWjG
 6lIA6Y3LemcFy6BzPZjMOv6R+WSUfhnEgvFF2Gqndh6h69DijOCOf2No6R5JLp/7mzdRjBRCOGe
 FwpaY1fp1Ujaxk6JnpvY2DbyxEjQyhiZkZl1i8pMrS9U/kWmgWbuym0bIybJogi47xXU8UyBY4S
 Zkeua2SMzHW6kQk0vQqSbs++IgzcjDujN3qz3aprKtRrK7soQ2NdwFwabrPz1E6pA7Tki21XUWP
 JvWtQjo9WljWewIsw2952DWHOv8r3HVxdGDmDHBuN38NgXiyjFzYzH2b6spTkcBn0kbh7FVRijK
 Egp4/oqxLiNVmaPq/4nRZzZQhda3VvgQXfx/lofpHFFgCjc7OXpAKJdPRtCME2vzGfuvKVTDTxy
 KaHORzZO/CD+bUOuFHj/IgpQoqZztX9xMsEo7Y299bFpcT+q0pzpvqUtBBHrgF4a6wy1ASQwawn
 /FVlOQ85zozJi5blidQ==
X-Proofpoint-GUID: JwGFsG7e22QStluyWBgBW4rtklt5p1D6
X-Authority-Analysis: v=2.4 cv=V/hwEOni c=1 sm=1 tr=0 ts=69b8600f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=xNf9USuDAAAA:8
 a=EUspDBNiAAAA:8 a=PZxLfFMIzHLfKC7kn-cA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: JwGFsG7e22QStluyWBgBW4rtklt5p1D6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160159
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98027-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 8F66A29FEF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 10:08:47AM +0100, Luca Weiss wrote:
> Hi Dmitry,
> 
> On Fri Mar 13, 2026 at 6:14 PM CET, Dmitry Baryshkov wrote:
> > On Fri, Mar 13, 2026 at 09:33:18AM +0100, Luca Weiss wrote:
> >> Hi Mahadevan,
> >> 
> >> On Thu Jan 1, 2026 at 6:04 AM CET, Mahadevan P wrote:
> >> > On SC7280 targets, display modes with a width greater than the
> >> > max_mixer_width (2400) are rejected during mode validation when
> >> > merge3d is disabled. This limitation exists because, without a
> >> > 3D merge block, two layer mixers cannot be combined(non-DSC interface),
> >> > preventing large layers from being split across mixers. As a result,
> >> > higher resolution modes cannot be supported.
> >> >
> >> > Enable merge3d support on SC7280 to allow combining streams from
> >> > two layer mixers into a single non-DSC interface. This capability
> >> > removes the width restriction and enables buffer sizes beyond the
> >> > 2400-pixel limit.
> >> >
> >> > Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC7280 target")
> >> > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> >> 
> >> This patch is causing display regression on QCM6490 fairphone-fp5.
> >> 
> >> With this patch in 7.0-rc3 (or 6.18.16) there's just pink noise on the
> >> screen. When reverting this patch everything becomes working again.
> >> 
> >> See also https://salsa.debian.org/Mobian-team/devices/kernels/qcom-linux/-/issues/41
> >> 
> >> @Dmitry: Can we revert this for later 7.0-rc, in case it's not fixed
> >> quickly?
> >
> > Could you please provide the resource allocation parts of
> > debugfs/dri/0/state for both working and non-working cases?
> 
> Broken (with the patch)

> resource mapping:
>         pingpong=# # 68 68 - - - - - - - - - 
>         mixer=# - 68 68 - - - - 
>         ctl=68 # # # - - - - 
>         dspp=# - - - - - - - 
>         dsc=68 - - - - - - - 
>         cdm=# 
>         sspp=# - - - - - - - # # # - - - - - 
>         cwb=- - - - 

I see. It tries to use two mixers with a single DSC. What about someting
as simple as:

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 0f4921b1a892..cbb7caa194c1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1410,7 +1410,8 @@ static struct msm_display_topology dpu_crtc_get_topology(
 		topology.num_lm = 2;
 	else if (topology.num_dsc == 2)
 		topology.num_lm = 2;
-	else if (dpu_kms->catalog->caps->has_3d_merge)
+	else if (dpu_kms->catalog->caps->has_3d_merge &&
+		 topology.num_dsc == 0)
 		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
 	else
 		topology.num_lm = 1;


-- 
With best wishes
Dmitry

