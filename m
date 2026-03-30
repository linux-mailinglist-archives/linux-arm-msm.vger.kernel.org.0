Return-Path: <linux-arm-msm+bounces-100876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aXZGAjzByml9/wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:30:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F1635FC2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7544F3013EE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB5F274FDF;
	Mon, 30 Mar 2026 18:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NmNCrzsc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SjJB3fcC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5057D2C11EE
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774895417; cv=none; b=jPgnp7EhuYb04sEDZ4LysHnoA4e0PCwvp9YFp842e6u1vnE6EvhC1ItNUJL0uwwlq9eJ7WnbKUDB/Me7Cpawh+lwPhN5TDt4rIP5Uhk//nqNJnugiJ2gVytrQVLQuCsAe/nlYmF8fqzY493P2llxkE8WdYe+FHyTaagtY9mY1i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774895417; c=relaxed/simple;
	bh=zAs6vof+TOS9MjpityN6dYKFBMqhFtBZotDD/vfaTUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FdSPFz/u/byimuGXNHXWDY1QQr9LK456bMUazR3wxgr0Ii4oIbPyl2PgihbyQc4EA6UwMcfEFIpQLWm+XvMMDsSjpl0kyDJpEFJbaPaKhfShtzk26BX3+QDimkrTTpt4CNuUibeTB7LpC5mrz9CNYV2u7uk9dtprBrdVsLrB5zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NmNCrzsc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SjJB3fcC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UF3LC23539569
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/JUDR6QZr7b2hhsNxsLxzkUb
	bwsQX8cwdP4kkkbqovc=; b=NmNCrzscWTRinJNrXeTWmKI16c1PJQDxAwIy9bjp
	nlgYn/4XQFKc+kyydR4k0VJQltd9F4Atrp4EH6jBCImB92+7fufyPnVOo+pFuwVG
	8ytNFeuz1I/+lCrYR/0Fz5ztiI9Nvg/1XbSW0fgowIPREPAjlZs/5W3nTkcFCtlm
	oJaqRj5PKPuza0azVxfUbAIeHcnJnrpLbiWjdAvofVe/SScFhJXptlpYjHZezhxg
	UxfSbzyTjqYAu6CxT4jOcrBMxR2ItdpQE5X5rGPgspQcZXrcx8zBaYbICcjr4aJb
	7SHnsBAItH8CmCbBjDLgPg+G3UWV6uml0Wo9a2T7AgmVtg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q59t0tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:30:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24de0a376so7010085ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774895414; x=1775500214; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/JUDR6QZr7b2hhsNxsLxzkUbbwsQX8cwdP4kkkbqovc=;
        b=SjJB3fcCCbrKbxrCrviAkYUHaTiRLisI7drtiQBpeeRa9JeGdotw4HifD2BoANosHb
         Y7dNwmA/6Eo9z9UanNhQJ25pvkNTeAfzYw/TELOoAqDdhPQOm+4949bK24zwFzcjkjUq
         St38s0LzO9WhuOYyyFA4l4TyeQdmGsPz9Z6Dv5PG+zVaOi4yW+iyR42Hh4lfgpJSXIk2
         QDIJ/rR/imKYI3qGLFZfxSl4N8EClIyPw1zwKQQ01pmIZOyM3xHUGV/rT8pjyIF1ynsG
         3rjvIKDtYg8itAeadD0uubFdX9uXGfhv/3c4XMa6xn5zMTdRMALUVLAkijEAYJvR2ify
         DDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774895414; x=1775500214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/JUDR6QZr7b2hhsNxsLxzkUbbwsQX8cwdP4kkkbqovc=;
        b=TY0y5sSeXOU72rChXcvXk1m0uJ5gpg90rTDR8zZ36JvRYxjl613tePdO5a2+zmBGaP
         hadGG7wtk7A605ysrpPAe8qHcqxvS5k6z1a7b7cq8kSFEzcZ/h9PRF0ZH8w83wa8WK1n
         nVBXXmtDVUiMvAGH7vLPE5bwtzupMGXppIBjlwGPtca8p7Af0jvOxO07BroExfafXzih
         gHblHnffDn5UfZRARHHo9ZLmwIPs2rPcHumxVAu0wFxfeaKALfHpiXhPXEpprSL3y4Af
         hH8WYNoEyVjXPFSrRcFlbJP4fKNPgsBSdrTZmXgDUQblrAQ4GtCfy3ajwvE/Lg4Ub+vT
         AY1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1SbsFjIIsOjjB4ES6ExQXJn9VyLzrWq809V2p9ZQpFZC3Dd35hAOWdeJRylTDJ48/PIt9VRvpC3lS7+Rd@vger.kernel.org
X-Gm-Message-State: AOJu0YwDnMHv2NNhzMzwjq+XtbYqYFYxsWuEwkApW1sfAV0FVW6KHeFS
	la4xWka6qCdUFhSVJvPiFAPHE8HIMGVXxArP2LyjTk4+LUmk2AQvLCkb1eM8zhoE0PDiyNY5Fbn
	DL1bwkfuPe4BOxGfLIadpbf0uBS1C40+kc3MkzrVb03hB5jV7R+L+o9jNrahvXjbrYNtf
X-Gm-Gg: ATEYQzy3G+OYbRhUtVyBISehtrntPp6wzVwofZdfUT/1dyAGWKn1C6inSbrnHGIzVeB
	/d3x2Cgl8ukdQKlPxOyCC89z2ULNfTwXAkAHbjs8dozWJDio1gIzlPD1DTGWGt2ZNKJp7UcbWul
	95nl2j1NnnXZayL+1DLWD0unlszOLI9A/df2ZSQxVKgTDMdyspoASZ1P9NlVSV18mLR3pAtFdBe
	Sl9Q42N7YhhQqkF4egcVG15r4hYKCgBXPJwffbHsfm7V6mJZXFGBLKYmIFFPATWroU+rmCp5mrq
	oKJR3iXr+4C7Rj7GgBEfxq+FarmiNCCEVIZJbNjjos6ufhQtQ272CWeI6sV7jJMSbHO9MxZkpWh
	xwj9m+oPIMSQqvIowdF27gCl6eHgT+J3bgFZm1kf6LjZIh7Oh+BhcDVOTnN5gijP6PaHu7xNRK+
	kKmD5fHoIVBEX0sz+lbpeEtxtS6LqcTYGFVNiAP8UjPg==
X-Received: by 2002:a17:902:d550:b0:2b2:48a5:45c3 with SMTP id d9443c01a7336-2b248a54b7fmr51100945ad.1.1774895414446;
        Mon, 30 Mar 2026 11:30:14 -0700 (PDT)
X-Received: by 2002:a17:902:d550:b0:2b2:48a5:45c3 with SMTP id d9443c01a7336-2b248a54b7fmr51100755ad.1.1774895413958;
        Mon, 30 Mar 2026 11:30:13 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427c176fsm88336935ad.77.2026.03.30.11.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:30:13 -0700 (PDT)
Date: Tue, 31 Mar 2026 00:00:07 +0530
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        prahlad.valluru@oss.qualcomm.com
Subject: Re: [PATCH] drm/msm/disp/dpu: consider SSPP line width during mode
 valid
Message-ID: <acrBL4fF4aiAw8m9@hu-vishsain-blr.qualcomm.com>
References: <20260328-msm-next-v1-1-12ac4e27c670@oss.qualcomm.com>
 <v37m6z5le4rk56b7pinr5wbi7l7s2bbgkggglx4eog6w7ja77f@lvyxc5tks2bs>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <v37m6z5le4rk56b7pinr5wbi7l7s2bbgkggglx4eog6w7ja77f@lvyxc5tks2bs>
X-Proofpoint-ORIG-GUID: GjQTxxPdi4LT0u57enTPVjKVVwqzE-ko
X-Proofpoint-GUID: GjQTxxPdi4LT0u57enTPVjKVVwqzE-ko
X-Authority-Analysis: v=2.4 cv=EcXFgfmC c=1 sm=1 tr=0 ts=69cac137 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=a2uuQ3A_lCUmVk2uvUAA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1MyBTYWx0ZWRfX+VZvB+EQDs+j
 4Vd4PfDnRzKcibW/a26cduw5Wj8vZ3rSbzAiHa/YNrD823Yc0hyWaerHYNmdRNUt4kp4hoCD53S
 45itd1F+5P4ccNZAlimhy81p8tAxSpcHDNUZ3/Ct7y5kgq1tEFz085CdjD3JRlsKEU3Zw4utZFj
 n2ZUCls2KvXzXgi7Fnhj6ZJBo8mW7YYaU4cBO5kWfSc/2Pu5NRXyLKjJ+3GJMRd3Luo00HDwjSz
 iyO3wAgVMGali7qAyug8x318D84njmdLtZ8dqJXPGVbNwc2rTrFW4atzggyYGV0zS5BxAx6gpiC
 d5phblSwmpzRH9Q0WIlnvtkw2mbtUayAIdh8SIQEy+rEbDpDZ1n7b1mYhcIn1NtYS5/AY1NIDq/
 Q8nKkYqJpEZdmNXdImsfSLWJg4fMNEcaaf6GQ4d2igCJkVrxZh/Y5Ka423nzbRdzOMpqn2obuzB
 vsjBEvpF8BkyJMS3xJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300153
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-100876-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,hu-vishsain-blr.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishnu.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 79F1635FC2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 02:24:53AM +0200, Dmitry Baryshkov wrote:
> On Sat, Mar 28, 2026 at 10:45:35PM +0530, Vishnu Saini wrote:
> > Few targets have lesser SSPP line width compared to mixer width,
> > SSPP line width also needs to be considered during mode valid
> > to avoid failures during atomic_check.
> 
> Technically this is not correct. There is no requirement for the
> planes to cover the whole CRTC. Nor is there a requirement to use only 2
> rectangles to cover the screen. As such, it is perfectly fine in
> mode_valid, if CRTC is wider than 2x max_linewidth. It would be an error
> if the user tries to stretch 2 rectangles in such a case.

This is to fix an issue with 5k monitor on rb3gen2, since SSPP maxlinewidth is 2400
it can't cover the whole 5k buffer in left right split mode.
Do we need to fix it from drm backend by dividing 5k buffer into 2 planes and 
use 2 pipes in split mode.
4 SSPP rects --> 2 LMs --> 3d_mux --> DP
 
> > 
> > Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> 
> -- 
> With best wishes
> Dmitry

